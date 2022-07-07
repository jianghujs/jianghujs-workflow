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

const idGenerateUtil = require("egg-jianghu/app/common/idGenerateUtil");
const validateUtil = require("egg-jianghu/app/common/validateUtil");
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
  async createTaskId() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    // const { workflowId, taskTitle, taskFormStructure, taskFormData } = actionData;
    const { workflowId, taskTitle, workflowForm,  workflowFormData } = actionData;
    const { userId, username } = this.ctx.userInfo;
    actionData.taskId = await idGenerateUtil.idPlus({
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
    actionData.workflowConfig = workflowConfig;
    // start 节点进入历史
    const start = nodeList.find(e => e.id.includes('start-'));
    const line = lineList.find(e => e.from === start.id);
    if (line) {
      // 寻找start开始线路 task存储第二个节点
      const nextNode =  nodeList.find(e => e.id === line.to);
      const userNode =  nodeList.filter(e => e.id.includes('userTask') || e.id.includes('receiveTask') );
      const allUser = await this.getProcessUserList(userNode);
      const taskProcessorList = await this.getProcessUserList([nextNode]);
      const nextLine = lineList.filter(e => e.from === nextNode.id);
      // 组建默认knex data
      actionData.taskStatus = 'running';
      actionData.taskConfigId = nextNode.id;
      actionData.taskNextConfigList = JSON.stringify(nextLine);
      actionData.taskEditUserList = taskProcessorList;
      actionData.taskViewUserList = allUser;
      actionData.createByUser = userId;
      actionData.taskInitUser = userId;
      // workflowFormInput  1. 上表单数据 2. 待输入 3. 总表单
      // 起始节点 无上一个
      actionData.taskFormInput = JSON.stringify({
        input: workflowFormData,
        formList: workflowForm
      });

      delete actionData.workflowForm;
      delete actionData.workflowFormData;
      delete actionData.workflowId;

      const history = {
        ...actionData,
        taskExplain: start.label,
        taskHandleDesc: '流转',
        taskLineFrom: line.from,
        taskLineTo: line.to,
        taskLineLabel: line.type + '-' + line.label,
        taskCostDuration: 0
      }
      const insert = await jianghuKnex(tableEnum.task_history, this.ctx).insert(history);
      
    } else {
      throw new BizError(errorInfoEnum.article_not_found);
    }
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
      const {assignValue, assignType} = item;
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
    const { taskId } = actionData;
    const { userId } = this.ctx.userInfo;
    const taskInfo = await jianghuKnex(tableEnum.task).where({taskId}).first();
    // 获取process 流程、根据节点线路组建步骤条
    if (!taskInfo) {
      throw new BizError(errorInfoEnum.task_not_found);
    }
    const taskStepperList = this.makeStepper(taskInfo.workflowConfig);
    taskInfo.workflowConfig = JSON.parse(taskInfo.workflowConfig);
    // 查找task 任务历史列表
    const taskHistoryList = await jianghuKnex(tableEnum.task_history).where({taskId}).orderBy('id', 'asc').select();
    const isAccess = taskInfo.taskEditUserList.includes(userId);

    const nextLineList = taskInfo.taskStatus === 'running' ? JSON.parse(taskInfo.taskNextConfigList) : [];
    const taskTpl = JSON.parse(taskInfo.taskFormInput || '{"prev": {}, "input": {}, "formList": []}');
    const currentNode = taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId);
    return {taskStepperList, taskHistoryList, isAccess, nextLineList, taskTpl, step: taskStepperList.find(e => currentNode.id === e.id).value, currentNode: taskInfo.workflowConfig.nodeList.find(e => e.id === taskInfo.taskConfigId)};
  }
  /**
   * 制作节点步骤list
   * @param {*} processInfo 
   * @returns 
   */
  makeStepper(workflowStructure) {
    const {nodeList = [], lineList = []} = JSON.parse(workflowStructure || '{}');
    const start = nodeList.find(e => e.id.includes('start-'));
    const nodeSortList = [];
    nodeSortList.push(start);
    for(let i = 0; i < nodeList.length; i++) {
      const nodeCache = this.getNextNodeSetup(nodeList, lineList, nodeSortList);
      nodeSortList.push(nodeCache)
      if (nodeSortList.length >= nodeList.length) break;
    }
    const stepperList = []
    let i = 1;
    for (const item of nodeSortList) {
      stepperList.push({value: i, text: item.label, id: item.id});
      i++;
    }
    return stepperList;
  }
  /**
   * 获取下一个步骤节点
   * @param {*} nodeAllList 
   * @param {*} lineAllList 
   * @param {*} nodeSortList 
   * @returns 
   */
  getNextNodeSetup(nodeAllList, lineAllList, nodeSortList) {
    const lastNode = nodeSortList[nodeSortList.length - 1];
    const lineList = lineAllList.filter(e => e.from === lastNode.id);
    if (!lineList) {
      // 线路不存在
    }
    const lineIds = lineList.map(e => { return e.to });
    return nodeAllList.find(e => lineIds.includes(e.id) && !(nodeSortList.find(s => s.id === e.id)));
  }
  async submitNode() {
    
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const { type, taskId, taskRemark, taskTpl, taskComment } = actionData;
    const { userId, username } = this.ctx.userInfo;
    
    const taskInfo = await jianghuKnex(tableEnum.task).where({taskId}).first();
    delete taskInfo.id;
    const {nodeList = [], lineList = []} = JSON.parse(taskInfo.workflowConfig || '{}');
    const nLineList = JSON.parse(taskInfo.taskNextConfigList);
    const line = nLineList.find(e => e.type === type);

    const currentNode = nodeList.find(e => e.id === taskInfo.taskConfigId);
    // 写入exec历史
    const prevHistory = await jianghuKnex(tableEnum.task_history).where({taskId}).orderBy('operationAt', 'desc').first();
    let taskFormInput = JSON.parse(taskInfo.taskFormInput);
    taskFormInput.prev = taskFormInput.input;
    taskFormInput.input = taskTpl.input;
    taskFormInput = JSON.stringify(taskFormInput);
    const history = {
      ...taskInfo,
      taskExplain: currentNode.label,
      taskConfigId: currentNode.id,
      taskHandleDesc:  line.type + '-' + line.label,
      taskLineFrom: line.from,
      taskLineTo: line.to,
      taskLineLabel: line.type + '-' + line.label,
      taskCostDuration: parseInt((new Date().getTime() - new Date(prevHistory.operationAt).getTime()) / 1000)
    }

    await jianghuKnex(tableEnum.task_history, this.ctx).insert(history);
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
    await jianghuKnex(tableEnum.task, this.ctx).where({taskId}).update({
      taskFormInput, 
      taskRemark, 
      taskNextConfigList: JSON.stringify(nextLineList), 
      taskEditUserList, 
      taskConfigId: nextNode.id, 
      taskStatus: (nextLineList.length === 0 || currentNode.id.includes('end-')) ? 'end' : type === 'deny' ? 'deny' : 'running',
      taskComment
    });
  }
}

module.exports = TaskService;
