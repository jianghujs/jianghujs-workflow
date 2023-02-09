'use strict';
const Service = require('egg').Service;
const { tableEnum, articlePublishStatusEnum } = require("../constant/constant");
const _ = require("lodash");
const path = require("path");

// TODO: 封装一下
const dayjs = require("dayjs");
const utc = require('dayjs/plugin/utc')
const timezone = require('dayjs/plugin/timezone') // dependent on utc plugin
dayjs.extend(utc)
dayjs.extend(timezone)

const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require("@jianghujs/jianghu/app/common/validateUtil");
const { BizError, errorInfoEnum } = require("../constant/error");
const fs = require("fs"),
    fsPromises = require("fs").promises,
    unlink = fsPromises.unlink,
    rename = fsPromises.rename,
    util = require("util"),
    exists = util.promisify(fs.exists);
const actionDataScheme = Object.freeze({
  deletedArticle: {
    type: "object",
    additionalProperties: true,
    required: ["articleId"],
    properties: {
      articleId: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class TaskService extends Service {
  async upcomingToUserId() {
    const { userId, username } = this.ctx.userInfo;
    this.ctx.request.body.appData.whereLike = { taskEditUserList: userId };
  }
  async upcomingToUserId() {
    const { userId, username } = this.ctx.userInfo;
    this.ctx.request.body.appData.whereLike = { taskEditUserList: userId };
  }
  async whereToUserId() {
    const { where } = this.ctx.request.body.appData;
    const { userId, username } = this.ctx.userInfo;
    where.createByUser = userId;
  }
  async whereToViewUserId() {
    const { whereLike } = this.ctx.request.body.appData;
    const { userId } = this.ctx.userInfo;
    whereLike.taskViewUserList = userId;
  }

  /**
   * 创建审批工作流
   * @returns void
   */
  async createTask() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    // const { workflowId, taskTitle, taskFormStructure, taskFormData } = actionData;
    const { workflowId, taskTitle, workflowForm,  workflowFormData, workflowConfigCustom } = actionData;
    const { userId, username } = this.ctx.userInfo;
    const taskId = await idGenerateUtil.uuid();
    const workflow = await jianghuKnex(tableEnum.workflow, this.ctx).where({workflowId}).first();
    if (!workflow) {
      throw new BizError(errorInfoEnum.workflow_not_found)
      return
    }
    
    const workflowConfig = JSON.parse(workflow.workflowConfig || '{}');
    let {mode = 'serial', nodeList = [], lineList = []} = workflowConfig;
    const nodeListOfUserTaskNode = (JSON.parse(workflowConfigCustom || '{}')).nodeListOfUserTaskNode || []
    // 合并定制的审批人和workflow的审批人
    // nodeList = _.merge(_.keyBy(nodeList, 'id'), _.keyBy((JSON.parse(workflowConfigCustom || '{}')).nodeListOfUserTaskNode || [], 'id'))
    for (let i = 0; i < nodeList.length; i++) {
      const node = nodeList[i];
      const tempNode = nodeListOfUserTaskNode.find(n => n.id === node.id);
      if (tempNode) {
        nodeList[i] = tempNode;
      }
    }
    nodeList = _.values(nodeList);
    workflowConfig.nodeList = nodeList


    // start 节点进入历史
    const startNode = nodeList.find(e => e.id.includes('start-'));
    const startLine = lineList.filter(e => e.from === startNode.id);
    const userNode =  nodeList.filter(e => e.id.includes('userTask') || e.id.includes('receiveTask') );
    const allUser = await this.getProcessUserList(userNode);
    const startData = {
      taskId,
      taskTitle,
      taskStatus: 'running',
      taskFormInput: JSON.stringify({
        input: workflowFormData,
        formList: workflowForm
      }),
      taskConfigId: startNode.id,
      taskNextConfigList: JSON.stringify(startLine),
      taskEditUserList: '',
      taskViewUserList: allUser,
      createByUser: userId,
      taskInitUser: userId,
      workflowConfig: JSON.stringify(workflowConfig)
    }
    await jianghuKnex.transaction(async trx => {
      const [id] = await trx(tableEnum.task, this.ctx).insert(startData);
      // 并行模式下，生成所有的userTask
      if (mode == 'parallel') {
        await this.generateAllUserTask(id, trx);
      }
      // 开始节点进入历史
      await this.buildNext({ type: '同意', id,  taskTpl: {input: workflowFormData}, taskComment: ''}, trx);
      
      
    });
    return startData;
  }
  /**
   * 获取组下的所有用户
   * @param {*} groupId 
   * @returns 
   */
  async getGroupUserList(groupId) {
    const { jianghuKnex, config } = this.app;
    const userList = await jianghuKnex(tableEnum._user_group_role).where({groupId}).select('userId');
    return userList.map(e => {
      return e.userId
    });
  }
  async getProcessUserList(nodeList) {
    let userIds = []
    for(const item of nodeList) {
      const {assignValue = [], assignType = ''} = item;
      if (assignType === 'person') {
        userIds = [...userIds, ...assignValue];
      } else if (assignType === 'group') {
        userIds = [...userIds, ...await this.getGroupUserList(assignValue)];
      }
    }
    return _.uniq(userIds).join(',');
  }
  async taskCareUser() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const { userId: careUser, taskId } = actionData;
    const { userId } = this.ctx.userInfo;
    const taskInfo = await jianghuKnex(tableEnum.task).where({taskId}).first();
    // 转交写入历史
    const history = {
      taskId: taskId,
      taskNode: '转交',
      historyForm: line.from,
      historyTo: line.to,
      historyChooseName: line.label,
      historyCostDuration: 0
    }
    await jianghuKnex(tableEnum.task_history).insert(history);
    // 修改task处理人
    const taskProcessorList = taskInfo.taskProcessorList.replace(userId, careUser);
    await jianghuKnex(tableEnum.task).where({taskId}).update({taskProcessorList});
  }
  /**
   * 工单历史信息
   * @returns
   */
  async getTaskHistoryInfo() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const { id } = actionData;
    const { userId } = this.ctx.userInfo;
    const taskInfo = await jianghuKnex(tableEnum.task).where({id}).first();
    // 获取process 流程、根据节点线路组建步骤条
    if (!taskInfo) {
      throw new BizError(errorInfoEnum.task_not_found);
    }
    const taskHistoryList = await jianghuKnex(tableEnum.task_history).where({taskId: taskInfo.taskId}).orderBy('id', 'asc').select();
    const taskStepperList = this.makeStepper(taskInfo.workflowConfig, taskHistoryList, taskInfo);
    const userList = await jianghuKnex(tableEnum._view01_user).whereIn('userId', taskInfo.taskViewUserList.split(',')).select();
    taskInfo.workflowConfig = JSON.parse(taskInfo.workflowConfig);
    const taskHistoryConfigList = this.getTaskHistoryConfigList(taskInfo.workflowConfig, taskHistoryList, userList);

    // 查找task 任务历史列表  taskEditedUserList
    const isAccess = taskInfo.taskEditUserList.includes(userId) && (taskInfo.taskEditedUserList || '').indexOf(userId) === -1;
    const lineTypeList = taskInfo.taskLineTypeList;
    const nextLineList = taskInfo.taskStatus === 'running' ? JSON.parse(taskInfo.taskNextConfigList) : [];
    const taskTpl = JSON.parse(taskInfo.taskFormInput || '{"input": {}, "formList": []}');
    // const currentNode = taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId);
    return {
      taskStepperList, 
      taskHistoryList, 
      isAccess, 
      lineTypeList,
      nextLineList, 
      taskTpl, 
      currentNode: taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId),
      taskHistoryConfigList
    };
  }
  /**
   * 获取所有节点，标示历史节点+当前节点
   * @returns
   */
   getTaskHistoryConfigList(workflowConfig, taskHistory, userList) {
    const {nodeList = [], lineList = []} = workflowConfig;
    // 历史所有主节点和连线做标志
    nodeList.filter(node => taskHistory.some(history => history.taskConfigId === node.id || history.taskLineTo.includes(node.id))).forEach(node => {
      node.inPath = true
    })
    // TODO: 将审批人 展示再 审批节点上
    nodeList.forEach(node => {
      if (node.type === 'userTask') {
        const userMap = _.keyBy(userList, 'userId');
        node.origin.properties.userList = node.assignValue.map(uId => userMap[uId] ? userMap[uId]['username'] : uId);
      }
    });
    taskHistory.forEach((history, index) => {
      lineList.filter(line => history.taskConfigId === line.from && history.taskLineTo.includes(line.to)).forEach(line => {
        line.label = line.label + ` (${index + 1})`
      })
    })

    return {nodeList, lineList};
  }
  /**
   * 制作节点步骤list
   * @param {*} processInfo
   * @returns
   */
  makeStepper(workflowStructure, taskHistory, taskInfo) {
    const { jianghuKnex } = this.app;
    const {nodeList = [], lineList = []} = JSON.parse(workflowStructure || '{}');
    const nodeSortList = [];
    for (const item of taskHistory) {
      const taskNextConfigList = JSON.parse(item.taskNextConfigList);
      // 查找和当前节点相同的上个节点和下个节点来判断是否是并行处理
      const node = this.getNodeBrotherList(item.taskConfigId, nodeList, lineList);
      const nodeIdList = node.map(e => {return e.id});
      const exist = _.flatten(nodeSortList).some(e => nodeIdList.includes(e.id));
      if (!exist) {
        node.forEach(e => {
          e.type = 'history';
        })
        nodeSortList.push(node);
      }
    }
    const length = nodeList.length - nodeSortList.length;
    for(let i = 0; i < length; i++) {
      const nodeCache = this.getNextNodeSetup(nodeList, lineList, nodeSortList, taskInfo);
      if (!nodeCache || !nodeCache.length) {
        continue;
      }
      nodeSortList.push(nodeCache)
      if (nodeSortList.length >= nodeList.length) break;
    }
    const stepperList = []
    let i = 1;
    for (const item of nodeSortList) {
      const step = [];
      item.forEach(e => {
        step.push({value: i, text: e.label, id: e.id, type: e.type});
      })
      stepperList.push(step);
      i++;
    }
    return stepperList;
  }
  // 根据当前节点id 寻找共同并行节点
  getNodeBrotherList(currentNodeId, nodeList, lineList) {
    const prevLine = lineList.filter(e => e.to === currentNodeId);
    const nextLineList = lineList.filter(e => e.from === currentNodeId);
    const node = [nodeList.find(e => e.id === currentNodeId)];
    prevLine.forEach(line => {
      // 查找和当前节点相同的上个节点和下个节点来判断是否是并行处理
      let otherNodeIdList = lineList.filter(e => 
        // 来处节点相同
        e.from === line.from && e.to !== currentNodeId && 
        // 去处类型相同
        e.type === line.type).map(e => {return e.to});
      let otherNodeNextLine = lineList.filter(e => otherNodeIdList.includes(e.from));
      // 筛选其他兄弟和自己终点一样的节点  
      otherNodeNextLine = otherNodeNextLine.filter(e => nextLineList.some(s => e.to === s.to && e.type === s.type));
      otherNodeNextLine.forEach(element => {
        node.push(nodeList.find(e => e.id === element.from))
      });

    });
    return node;
  }
  /**
   * 获取下一个步骤节点
   * @param {*} nodeAllList
   * @param {*} lineAllList
   * @param {*} nodeSortList
   * @returns
   */
  getNextNodeSetup(nodeAllList, lineAllList, nodeSortList, taskInfo) {
    const lastNodeIdList = nodeSortList[nodeSortList.length - 1].map(e => {return e.id});
    const lineList = lineAllList.filter(e => lastNodeIdList.includes(e.from));
    if (!lineList.length) {
      return null;
      // 线路不存在
    }
    if (lineList.some(e => e.to === taskInfo.taskConfigId)) {
      return this.getNodeBrotherList(taskInfo.taskConfigId, nodeAllList, lineAllList);
    }
    const existIdList = _.flatten(nodeSortList).map(e => {return e.id});
    return nodeAllList.filter(e => lineList.some(s => s.to === e.id) && !existIdList.includes(e.id));
  }
  async generateAllUserTask(id, trx) {
    const taskInfo = await trx(tableEnum.task).where({id}).first();
    delete taskInfo.id;
    const {nodeList = [], lineList = []} = JSON.parse(taskInfo.workflowConfig || '{}');
    const userNode =  nodeList.filter(e => e.id.includes('userTask') || e.id.includes('receiveTask') );
    for (const node of userNode) {
      let taskEditUserList = await this.getProcessUserList([node]);
      const nextLineList = lineList.filter(e => e.from === node.id);
      await trx(tableEnum.task).insert({
        ...taskInfo,
        taskNextConfigList: JSON.stringify(nextLineList),
        taskLineTypeList: node.lineTypeList,
        taskEditUserList,
        taskConfigId: node.id,
        taskStatus: 'running'
      });
    }
  }
  async submitNode() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    await jianghuKnex.transaction(async trx => {
      await this.buildNext(actionData, trx);
    });
  }
  async buildNext(actionData, trx) {
    const { type, id, taskComment } = actionData;
    const { userId } = this.ctx.userInfo;

    // 准备任务数据
    const taskInfo = await trx(tableEnum.task).where({id}).first();
    delete taskInfo.id;
    const {mode = 'serial', nodeList = [], lineList = []} = JSON.parse(taskInfo.workflowConfig || '{}');
    const userNode =  nodeList.filter(e => e.id.includes('userTask') || e.id.includes('receiveTask') );
    const userTaskCount = userNode.reduce((acc, cur) => acc += cur.isNeedAllApproval? cur.assignValue.length: 1, 0);
    const endNode = nodeList.find(e => e.id.includes('end-'));
    const nLineList = JSON.parse(taskInfo.taskNextConfigList);
    const lines = nLineList.filter(e => e.type === type);
    const currentNode = nodeList.find(e => e.id === taskInfo.taskConfigId);

    // 写入exec历史
    const taskHistory = await trx(tableEnum.task_history, this.ctx).where({taskId: taskInfo.taskId}).orderBy('operationAt', 'desc').select();
    const [prevHistory] = taskHistory;
    // let taskFormInput = JSON.parse(taskInfo.taskFormInput);
    // taskFormInput.input = taskTpl.input;
    // taskFormInput = JSON.stringify(taskFormInput);
    // const historyTaskFormInput = JSON.parse(taskInfo.taskFormInput)
    // historyTaskFormInput .input = taskTpl.input;
    const taskFormInput = taskInfo.taskFormInput;
    const history = {
      ...taskInfo,
      // taskFormInput: JSON.stringify(historyTaskFormInput),
      taskFormInput,
      taskExplain: currentNode.label,
      taskConfigId: currentNode.id,
      taskHandleDesc:  type,
      taskLineFrom: (lines.map(e => {return e.form})).join(','),
      taskLineTo: (lines.map(e => {return e.to})).join(','),
      taskLineLabel: (lines.map(e => {return e.type + '-' + e.label})).join(','),
      taskCostDuration: prevHistory ? parseInt((new Date().getTime() - new Date(prevHistory.operationAt).getTime()) / 1000) : 0,
      taskComment
    }
    delete history.taskEditedUserList;
    await trx(tableEnum.task_history, this.ctx).insert(history);

    // 未配置连线时，默认添加拒绝连线到end节点
    if (endNode && !lines.length) {
      lines.push({
        "from": currentNode.id,
        "to": endNode.id,
        "type": "拒绝",
        "label": "结束",
        "toInterruptEnd": true
      });
    }

    for (const line of lines) {
      const nextNode = nodeList.find(e => e.id === line.to);
      const nextLineList = lineList.filter(e => e.from === line.to);
      let taskEditUserList = await this.getProcessUserList([nextNode]);

      // 当前节点如果需要所有人审批并且不是拒绝连线时，检查是否所有人都审批过了
      if (currentNode.isNeedAllApproval && !line.toInterruptEnd) {
        let taskEditedUserList = taskInfo.taskEditedUserList? `${taskInfo.taskEditedUserList},${userId}`: userId;
        await trx(tableEnum.task, this.ctx).where({id}).update({taskEditedUserList});
        if (_.xor(taskEditedUserList.split(','), taskInfo.taskEditUserList.split(',')).length != 0) {
          return
        }
      }

      await trx(tableEnum.task, this.ctx).where({id}).delete();
      
      // 结束流程
      // 条件：
      // 1. 串行模式，连接end节点时
      // 2. 默认拒绝节点
      // 3. 并行模式，所有节点通过 
      if (
        (mode == 'serial' && line.to.includes('end-')) ||
        line.toInterruptEnd === true ||
        (mode == 'parallel' && taskHistory.length == userTaskCount && line.type != '拒绝')
      ) {
        taskEditUserList = await this.getProcessUserList([currentNode]);
        const endHistory = {
          ...history,
          taskStatus: 'end',
          taskExplain: '结束',
          taskConfigId: endNode.id,
          taskHandleDesc: '流程结束',
          taskLineFrom: line.from,
          taskLineTo: line.to,
          taskLineLabel: line.type + '-' + line.label,
          taskCostDuration: 0
        }
        await trx(tableEnum.task_history, this.ctx).insert(endHistory);
        await trx(tableEnum.task).insert({
          ...taskInfo,
          taskId: taskInfo.taskId,
          taskFormInput: taskInfo.taskFormInput,
          taskNextConfigList: JSON.stringify(nextLineList),
          taskLineTypeList: endNode.lineTypeList,
          taskEditUserList,
          taskConfigId: endNode.id,
          taskStatus: 'end'
        });
        // 默认拒绝节点，删除全部任务，执行interruptHook
        if (line.toInterruptEnd) {
          await trx(tableEnum.task, this.ctx).where({taskId: taskInfo.taskId, taskStatus: 'running'}).delete();
          await this.executeHook(endNode.interruptHook);
        } else {
          await this.executeHook(endNode.finishHook);
        }
        return
      }

      await this.executeHook(line.hook);
      
      // 其他同级节点未结束，暂时不生成下一个节点
      let otherNodeList = this.getNodeBrotherList(taskInfo.taskConfigId, nodeList, lineList);
      otherNodeList = otherNodeList.filter(e => e.id !== taskInfo.taskConfigId);
      
      if (otherNodeList.length && !otherNodeList.some(e => taskHistory.some(s => s.taskConfigId === e.id))) {
        console.log('其他并行未结束、暂停任务')
        return
      }

      // 串行审核，生成下一个task
      if (mode == 'serial') {
        await trx(tableEnum.task, this.ctx).insert({
          ...taskInfo,
          taskId: taskInfo.taskId,
          taskFormInput,
          taskNextConfigList: JSON.stringify(nextLineList),
          taskLineTypeList: nextNode.lineTypeList,
          taskEditUserList,
          taskConfigId: nextNode.id,
          taskStatus: type === 'deny' ? 'deny' : 'running'
        });
      }
    }
  }
  async executeHook(hook) {
    try {
      const { service, serviceFunction } = JSON.parse(hook || '{}');
      if (service && serviceFunction) {
        await this.ctx.service[service][serviceFunction](this.ctx.request.body.appData.actionData, this.ctx)
      }
    } catch (error) {
      throw new BizError(errorInfoEnum.line_hook_error);
    }
  }

  /**
   * 操作历史查询 Hook，非 admin 账户只能查自己的操作历史
   */
  async historyFilterHook() {
    const { where = {} } = this.ctx.request.body.appData;
    const { user, userGroupRoleList } = this.ctx.userInfo;
    // 如果用户不在 adminGroup 内，则只能查看自己的数据
    if (!userGroupRoleList.find(o => o.groupId === 'adminGroup')) {
      where.operationByUserId = user.userId;
    }
  }
}

module.exports = TaskService;
