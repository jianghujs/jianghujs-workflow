'use strict';

class BizError extends Error {
  constructor({ errorCode, errorReason, errorReasonSupplement }) {
    super(JSON.stringify({ errorCode, errorReason, errorReasonSupplement }));
    this.name = 'BizError';
    this.errorCode = errorCode;
    this.errorReason = errorReason;
    this.errorReasonSupplement = errorReasonSupplement;
  }
}

const errorInfoEnum = {
  data_exception: { errorCode: 'data_exception', errorReason: '数据异常' },
  workflow_not_found: { errorCode: 'work_flow_not_found', errorReason: '流程不存在' },
  task_not_found: { errorCode: 'task_not_found', errorReason: '任务不存在' },
  node_not_found: { errorCode: 'node_not_found', errorReason: '节点不存在' },
  line_not_found: { errorCode: 'line_not_found', errorReason: '线路不存在' },
};

module.exports = {
  BizError,
  errorInfoEnum,
};
