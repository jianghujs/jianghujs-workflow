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

class WorkflowService extends Service {

  async createTplId() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    actionData.formId = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 1000,
      tableName: tableEnum.form,
      columnName: "formId"
    });
  }
  async createWorkflowId() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    actionData.workflowId = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 1000,
      tableName: tableEnum.workflow,
      columnName: "workflowId"
    });
    console.log("cesni")

  }

  async assignTplData() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    let { tplId } = actionData;
    const tplIds = tplId ? tplId.split(',') : [];
    if (tplIds.length) {
      const tplList = await jianghuKnex(tableEnum.form).whereIn('formId', tplIds).select();
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
    const { jianghuKnex } = this.app;
    const { formItemList, workflowConfigCustom, workflowId } = actionData;

    let workflow = await jianghuKnex(tableEnum.workflow, this.ctx).where({workflowId}).first();
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
    const { jianghuKnex } = this.app;

    const taskInfo = await jianghuKnex(tableEnum.task, this.ctx).where({taskId}).first();
    const taskHistoryList = await jianghuKnex(tableEnum.task_history).where({taskId: taskInfo.taskId}).orderBy('id', 'asc').select();
    // const userList = await jianghuKnex(tableEnum._view01_user).whereIn('userId', taskInfo.taskViewUserList.split(',')).select();
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
    const userList = await jianghuKnex(tableEnum._view01_user).whereIn('userId', rows.map(item => item.taskInitUser)).select();
    rows.forEach(item => {
      const user = userList.find(it => it.userId === item.taskInitUser);
      item.taskInitUsername = user.username;
    });
  }
}

module.exports = WorkflowService;
