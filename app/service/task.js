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
  async createTask() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    // const { workflowId, taskTitle, taskFormStructure, taskFormData } = actionData;
    const { workflowId, taskTitle, workflowForm,  workflowFormData } = actionData;
    const { userId, username } = this.ctx.userInfo;
    const taskId = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 1000,
      tableName: tableEnum.task,
      columnName: "taskId"
    });
    const workflow = await jianghuKnex(tableEnum.workflow).where({workflowId}).first();
    if (!workflow) {
      throw new BizError(errorInfoEnum.workflow_not_found)
      return
    }
    const { workflowConfig } = workflow;
    const {nodeList = [], lineList = []} = JSON.parse(workflowConfig || '{}');
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
      workflowConfig
    }
    const [id] = await jianghuKnex(tableEnum.task, this.ctx).insert(startData);
    await this.buildNext({ type: '同意', id,  taskTpl: {input: workflowFormData}, taskComment: '' })
  }

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
    taskInfo.workflowConfig = JSON.parse(taskInfo.workflowConfig);
    const taskHistoryConfigList = this.getTaskHistoryConfigList(taskInfo.workflowConfig, taskHistoryList);
    // 查找task 任务历史列表
    const isAccess = taskInfo.taskEditUserList.includes(userId);

    const nextLineList = taskInfo.taskStatus === 'running' ? JSON.parse(taskInfo.taskNextConfigList) : [];
    const taskTpl = JSON.parse(taskInfo.taskFormInput || '{"input": {}, "formList": []}');
    // const currentNode = taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId);
    return {
      taskStepperList, 
      taskHistoryList, 
      isAccess, 
      nextLineList, 
      taskTpl, 
      currentNode: taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId),
      taskHistoryConfigList
    };
  }
  /**
   * 获取历史节点+当前节点
   * @returns
   */
   getTaskHistoryConfigList(workflowConfig, taskHistory) {
    const {nodeList = [], lineList = []} = workflowConfig;
    // 历史所有主节点
    const historyNodeList = nodeList.filter(node => taskHistory.some(history => history.taskConfigId === node.id || history.taskLineTo.includes(node.id)));
    let historyLineList = [];
    taskHistory.forEach((history, index) => {
      const filterLineList = lineList.filter(line => history.taskConfigId === line.from && history.taskLineTo.includes(line.to));
      if (filterLineList.length) {
        filterLineList.forEach(line => {
          line.label = line.label + ` (${index + 1})`
        })
        historyLineList = [...historyLineList, ...filterLineList];
      }
    })

    return {nodeList: historyNodeList, lineList: historyLineList};
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
  async submitNode() {
    const { actionData } = this.ctx.request.body.appData;
    await this.buildNext(actionData);
  }
  async buildNext(actionData) {
    const { jianghuKnex } = this.app;
    const { type, id, taskTpl, taskComment } = actionData;

    const taskInfo = await jianghuKnex(tableEnum.task).where({id}).first();
    delete taskInfo.id;
    const {nodeList = [], lineList = []} = JSON.parse(taskInfo.workflowConfig || '{}');
    const nLineList = JSON.parse(taskInfo.taskNextConfigList);
    const lines = nLineList.filter(e => e.type === type);

    const currentNode = nodeList.find(e => e.id === taskInfo.taskConfigId);
    // 写入exec历史
    const taskHistory = await jianghuKnex(tableEnum.task_history).where({taskId: taskInfo.taskId}).orderBy('operationAt', 'desc').select();
    const [prevHistory] = taskHistory;
    let taskFormInput = JSON.parse(taskInfo.taskFormInput);
    taskFormInput.input = taskTpl.input;
    taskFormInput = JSON.stringify(taskFormInput);
    const historyTaskFormInput = JSON.parse(taskInfo.taskFormInput)
    historyTaskFormInput .input = taskTpl.input;
    const history = {
      ...taskInfo,
      taskFormInput: JSON.stringify(historyTaskFormInput),
      taskExplain: currentNode.label,
      taskConfigId: currentNode.id,
      taskHandleDesc:  type,
      taskLineFrom: (lines.map(e => {return e.form})).join(','),
      taskLineTo: (lines.map(e => {return e.to})).join(','),
      taskLineLabel: (lines.map(e => {return e.type + '-' + e.label})).join(','),
      taskCostDuration: prevHistory ? parseInt((new Date().getTime() - new Date(prevHistory.operationAt).getTime()) / 1000) : 0,
      taskComment
    }

    await jianghuKnex(tableEnum.task_history, this.ctx).insert(history);

    for (const line of lines) {
      const nextNode = nodeList.find(e => e.id === line.to);
      let taskEditUserList = await this.getProcessUserList([nextNode]);
      // 修改任务步骤node 处理人\
      const nextLineList = lineList.filter(e => e.from === line.to);
      if (line.to.includes('end-')) {
        taskEditUserList = await this.getProcessUserList([currentNode]);
        const endHistory = {
          ...history,
          taskExplain: '结束',
          taskConfigId: nextNode.id,
          taskHandleDesc: '流程结束',
          taskLineFrom: line.from,
          taskLineTo: line.to,
          taskLineLabel: line.type + '-' + line.label,
          taskCostDuration: 0
        }
        await jianghuKnex(tableEnum.task_history, this.ctx).insert(endHistory);
      }
      await jianghuKnex(tableEnum.task).where({id}).delete();
      
      let otherNodeList = this.getNodeBrotherList(taskInfo.taskConfigId, nodeList, lineList);
      otherNodeList = otherNodeList.filter(e => e.id !== taskInfo.taskConfigId);
      

      if (otherNodeList.length && !otherNodeList.some(e => taskHistory.some(s => s.taskConfigId === e.id))) {
        console.log('其他并行未结束、暂停任务')
        return
      }
      await jianghuKnex(tableEnum.task).insert({
        ...taskInfo,
        taskId: taskInfo.taskId,
        taskFormInput,
        taskNextConfigList: JSON.stringify(nextLineList),
        taskEditUserList,
        taskConfigId: nextNode.id,
        taskStatus: (nextLineList.length === 0 || currentNode.id.includes('end-')) ? 'end' : type === 'deny' ? 'deny' : 'running'
      });
    }
    
  }
}

module.exports = TaskService;
