'use strict';
const Service = require('egg').Service;

class HookService extends Service {
  async executeFinishLine(actionData) {
    const { taskId } = actionData;
    // 根据任务ID找到绑定的业务数据，进行处理
    console.log("审批结束", actionData) 
  }
  async executeRejectLine(actionData) {
    console.log("审批拒绝", actionData)
  }
}

module.exports = HookService;
