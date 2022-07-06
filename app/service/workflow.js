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

}

module.exports = WorkflowService;
