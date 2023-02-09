'use strict';

module.exports.tableEnum = Object.freeze({
  // ========================江湖表============================
  _cache: "_cache",
  _constant: "_constant",
  _constant_ui: "_constant_ui",
  _file: "_file",
  _group: "_group",
  _page: "_page",
  _record_history: "_record_history",
  _resource: "_resource",
  _resource_request_log: "_resource_request_log",
  _role: "_role",
  _user: "_user",
  _user_group_role: "_user_group_role",
  _user_group_role_page: "_user_group_role_page",
  _user_group_role_resource: "_user_group_role_resource",
  _user_session: "_user_session",
  _constant_ui: "_constant_ui",
  // ========================基础表============================
  workflow: 'workflow',
  task: 'task',
  task_history: 'task_history',
  // ========================基础View============================
  // ========================View============================
  _view01_user: "_view01_user",
});

module.exports.genderEnum = Object.freeze({
  male: 'male',
  female: 'female'
})

module.exports.articleViewTypeEnum = Object.freeze({
  content: 'content',
  audio: 'audio',
  video: 'video',
})
