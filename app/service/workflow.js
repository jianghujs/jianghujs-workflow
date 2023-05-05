'use strict';
const Service = require('egg').Service;

const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const { BizError, errorInfoEnum } = require("../constant/error");

const appDataSchema = {};
appDataSchema.createWorkflowTask = Object.freeze({
  type: 'object',
  required: ['formItemList', 'workflowId', 'workflowConfigCustom'],
  properties: {
    formItemList: {
      type: 'array',
      items: {
        type: 'object',
        required: ['id', "typeName", "type", "statement"],
        properties: {
          id: {
            type: 'string', minLength: 1, maxLength: 200
          },
          typeName: {
            type: 'string', minLength: 1, maxLength: 200
          },
          type: {
            type: 'string', minLength: 1, maxLength: 200
          },
          statement: {
            type: 'string', minLength: 1, maxLength: 200
          }
        },
        additionalProperties: true
      }
    },
    workflowId: {type: 'string', minLength: 1, maxLength: 100},
    workflowConfigCustom: {type: 'string', minLength: 1, maxLength: 10000},
  },
  additionalProperties: true
});

appDataSchema.getTaskHistory = Object.freeze({
  type: 'string',
  minLength: 1,
  maxLength: 200
});

class WorkflowService extends Service {

  async createTplId() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    actionData.formId = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 1000,
      tableName: 'form',
      columnName: "formId"
    });
  }
  async createWorkflowId() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    actionData.workflowId = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 1000,
      tableName: 'workflow',
      columnName: "workflowId"
    });
  }

  async assignTplData() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    let { tplId } = actionData;
    const tplIds = tplId ? tplId.split(',') : [];
    if (tplIds.length) {
      const tplList = await jianghuKnex('form').whereIn('formId', tplIds).select();
      let formList = [];
      const formData = {};
      for( const item of tplList) {
        const cache = JSON.parse(item.formStructure);
        for(const i of cache) {
          i.tplId = item.tplId
        }
        formList = [...formList, ...cache];
        for(const it of cache) {
          formData[it.id] = '';
        }
      }
      actionData.tplFormStructure = JSON.stringify(formList);
    } else {
      actionData.tplFormStructure = '[]';
    }
    console.log(actionData);
  }
  
  /**
   * 创建流程审批
   */
  async createWorkflowTask() {
    const { actionData } = this.ctx.request.body.appData;
    validateUtil.validate(appDataSchema.createWorkflowTask , actionData);
    const { jianghuKnex } = this.app;
    const { formItemList, workflowConfigCustom, workflowId } = actionData;

    let workflow = await jianghuKnex('workflow', this.ctx).where({workflowId}).first();
    if(!workflow) {
      throw new BizError(errorInfoEnum.workflow_not_found);
    }

    actionData.workflowConfigCustom = workflowConfigCustom;
    actionData.workflowId = workflow.workflowId;
    actionData.taskTitle = workflow.workflowName;
    actionData.workflowForm = formItemList;
    const formData = {};
    formItemList.forEach(item => {
      formData[item.statement] = item.answer;
    })
    actionData.workflowFormData = formData;
    await this.ctx.service.task.createTask()
  }
  /**
   * 获取节点审批历史
   * @returns
   */
  async getTaskHistory() {
    const { taskId } = this.ctx.request.body.appData.actionData;
    validateUtil.validate(appDataSchema.getTaskHistory , taskId);
    const { jianghuKnex } = this.app;

    const taskInfo = await jianghuKnex('task', this.ctx).where({taskId}).first();
    const taskHistoryList = await jianghuKnex('task_history').where({taskId: taskInfo.taskId}).orderBy('id', 'asc').select();
    // const userList = await jianghuKnex('_view01_user').whereIn('userId', taskInfo.taskViewUserList.split(',')).select();
    // taskInfo.workflowConfig = JSON.parse(taskInfo.workflowConfig);
    // return this.ctx.service.task.getTaskHistoryConfigList(taskInfo.workflowConfig, taskHistoryList, userList);
    const lineTypeList = taskInfo.taskLineTypeList;
    return {taskHistoryList, lineTypeList};
  }

  /**
   * 审核列表写入用户名
   */
  async appendUsername() {
    const rows = this.ctx.body.appData.resultData.rows;
    const { jianghuKnex } = this.app;
    const userList = await jianghuKnex('_view01_user').whereIn('userId', rows.map(item => item.taskInitUser)).select();
    rows.forEach(item => {
      const user = userList.find(it => it.userId === item.taskInitUser);
      item.taskInitUsername = user.username;
    });
  }
}

module.exports = WorkflowService;
