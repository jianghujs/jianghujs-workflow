# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户Id',
  `content` longtext COMMENT '缓存数据',
  `recordStatus` varchar(255) DEFAULT 'active',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '缓存表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) DEFAULT NULL,
  `constantType` varchar(255) DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `constantValue` text COMMENT '常量内容; object, array',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '常量表; 软删除未启用;';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 COMMENT = '群组表; 软删除未启用;';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'pageId',
  `pageName` varchar(255) DEFAULT NULL COMMENT 'page name',
  `pageFile` varchar(255) DEFAULT NULL COMMENT '对应的html文件',
  `pageType` varchar(255) DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 COMMENT = '页面表; 软删除未启用;';



INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','帮助','helpV3','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'login','登陆','loginV3','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'workflowManagement','课程设计',NULL,'showInMenu','1','update','vscode','vscode','2022-10-08T09:35:35+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'workflowEditor','流程编辑',NULL,'dynamicInMenu','1','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'taskCreateManagement','课程报名',NULL,'showInMenu','2','update','vscode','vscode','2022-10-08T09:48:22+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'taskICreateManagement','我的课程',NULL,'showInMenu','3','update','vscode','vscode','2022-10-08T09:42:17+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,'taskUpcomingManagement','我的待办',NULL,'dynamicInMenu','4','update','vscode','vscode','2022-10-08T09:42:24+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (18,'taskHistoryManagement','课程详情',NULL,'dynamicInMenu','5','update','vscode','vscode','2022-10-11T10:06:40+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (26,'taskRelatedManagement','我相关的',NULL,'dynamicInMenu','6','update','vscode','vscode','2022-10-08T09:42:31+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (35,'taskManagement','课程管理',NULL,'dynamicInMenu','9','update','vscode','vscode','2022-10-11T10:06:49+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _record_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` json NOT NULL COMMENT '数据',
  `packageContent` json NOT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`, `operation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 COMMENT = '数据历史表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COMMENT 'appData 参数校验',
  `resourceData` text COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COMMENT '请求Demo',
  `responseDemo` text COMMENT '响应Demo',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';



INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,NULL,NULL,'allPage','getChunkInfo','✅ 文件分片下载-获取分片信息','service','{}','{\"service\": \"file\", \"serviceFunction\": \"getChunkInfo\"}','','','jhUpdate','admin','adminName','2022-05-03T12:46:39+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,NULL,NULL,'allPage','uploadFileDone','✅ 文件分片上传-所有分片上传完毕','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileDone\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,NULL,NULL,'allPage','httpUploadByStream','✅ 文件分片上传-http文件流','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,NULL,NULL,'allPage','httpUploadByBase64','✅ 文件分片上传-http base64','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByBase64\"}','','','update',NULL,NULL,'2022-04-28T14:43:10+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,NULL,NULL,'allPage','httpDownloadByBase64','✅ 文件分片下载-http base64','service','{}','{\"service\": \"file\", \"serviceFunction\": \"downloadFileChunkByBase64\"}','','','update',NULL,NULL,'2022-04-30T14:52:38+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,NULL,NULL,'login','passwordLogin','✅登陆','service',NULL,'{\"service\": \"user\", \"serviceFunction\": \"passwordLogin\"}','','','update',NULL,NULL,'2022-06-30T09:59:55+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,NULL,NULL,'allPage','logout','✅登出','service',NULL,'{\"service\": \"user\", \"serviceFunction\": \"logout\"}','','','update',NULL,NULL,'2022-04-25T14:39:56+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,NULL,NULL,'allPage','refreshToken','✅刷新authToken','service',NULL,'{\"service\": \"user\", \"serviceFunction\": \"refreshToken\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,NULL,NULL,'allPage','userInfo','✅获取用户信息','service',NULL,'{\"service\": \"user\", \"serviceFunction\": \"userInfo\"}','','','update',NULL,NULL,'2022-07-05T16:14:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,NULL,NULL,'resetUserPassword','resetPassword','✅重置密码','service',NULL,'{\"service\": \"user\", \"serviceFunction\": \"resetPassword\"}','','','update',NULL,NULL,'2022-04-25T15:31:12+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,NULL,NULL,'allPage','uploadByStream','✅文件上传(文件流)','service',NULL,'{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\"}','','','update',NULL,NULL,'2022-02-22T19:36:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,NULL,NULL,'allPage','uploadByBase64','✅文件上传(base64)','service',NULL,'{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByBase64\"}','','','update',NULL,NULL,'2022-02-22T18:59:14+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (234,NULL,'','workflowManagement','selectUserList','✅查询-用户列表','sql',NULL,'{\"table\": \"_user\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (235,NULL,'','workflowManagement','selectGroupList','✅查询-组列表','sql',NULL,'{\"table\": \"_group\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (236,NULL,NULL,'taskCreateManagement','selectWorkflowList','✅获取流程列表','sql',NULL,'{\"table\": \"workflow\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (238,NULL,'{}','taskCreateManagement','insertItem','✅新增任务','service',NULL,'{\"service\":\"task\",\"serviceFunction\":\"createTask\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (239,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"whereToUserId\"}]}','taskICreateManagement','selectItemList','✅taskManagement查询-查询列表','sql','{}','{\"table\": \"task\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-02T22:48:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (243,NULL,'','taskHistoryManagement','getTaskHistoryInfo','获取任务历史详情','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"getTaskHistoryInfo\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (244,NULL,'','taskHistoryManagement','submitNode','节点流转','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"submitNode\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (255,NULL,NULL,'workflowManagement','selectItemList','✅workflowManagement查询-查询列表','sql','{}','{\"table\": \"workflow\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (256,NULL,'{\"before\":[{\"service\":\"workflow\",\"serviceFunction\":\"createWorkflowId\"}]}','workflowManagement','insertItem','✅workflowManagement查询-添加成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (257,NULL,NULL,'workflowManagement','updateItem','✅workflowManagement查询-更新成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (258,NULL,NULL,'workflowManagement','deleteItem','✅workflowManagement查询-删除信息','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 COMMENT = '角色表; 软删除未启用;';



INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'appAdmin','系统管理员','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'boss','掌门','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'disciple','门徒','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COMMENT '测试用例步骤;',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '测试用例表';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COMMENT 'ui 动作数据',
  `appDataSchema` text COMMENT 'ui 校验数据',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 COMMENT = 'ui 施工方案';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) DEFAULT NULL COMMENT '自增id; 用于生成userId',
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `clearTextPassword` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `md5Salt` varchar(255) DEFAULT NULL COMMENT 'md5Salt',
  `userStatus` varchar(255) DEFAULT 'active' COMMENT '用户账号状态：活跃或关闭',
  `userType` varchar(255) DEFAULT NULL COMMENT '用户类型; staff, student.',
  `config` mediumtext COMMENT '配置信息',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 COMMENT = '用户表';



INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,NULL,'admin','系统管理员','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,NULL,'W00001','张三丰','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active','common',NULL,'jhUpdate','vscode','vscode','2022-07-07T16:52:42+08:00');
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,NULL,'W00002','张无忌','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,NULL,'G00001','洪七公','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (46,NULL,'G00002','郭靖','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (47,NULL,'H00001','岳不群','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (48,NULL,'H00002','令狐冲','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `groupId` varchar(255) NOT NULL COMMENT '群组Id',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 579 COMMENT = '用户群组角色关联表; 软删除未启用;';



INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (568,'admin','adminGroup','appAdmin','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (569,'W00001','adminGroup','appAdmin','jhUpdate','vscode','vscode','2022-07-07T16:55:07+08:00');
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (570,'W00002','wudang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (573,'G00001','gaibang','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (574,'G00002','gaibang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (577,'H00001','huashan','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (578,'H00002','huashan','disciple','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 COMMENT = '用户群组角色 - 页面 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login','allow','登陆页面; 开放所有用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','help,manual','allow','工具页; 开放给登陆用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有页面; 开放给登陆用户;','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 COMMENT = '用户群组角色 - 请求资源 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login.passwordLogin','allow','登陆resource, 开放给所有用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','allPage.*','allow','工具类resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text COMMENT '请求的 agent',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_index` (`userId`, `deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `taskTitle` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `taskStatus` varchar(255) DEFAULT '0' COMMENT '任务状态：running 执行中；deny 拒绝；end 结束',
  `taskFormInput` text COMMENT '表单',
  `taskConfigId` text COMMENT '当前执行中节点ID',
  `taskNextConfigList` text COMMENT '执行线路id list: 逗号分隔',
  `taskInitUser` varchar(255) DEFAULT NULL COMMENT '申请人',
  `taskEditUserList` varchar(255) DEFAULT NULL COMMENT '当前执行的处理人员，用逗号分隔',
  `taskViewUserList` varchar(255) DEFAULT NULL COMMENT '所有相关人员，用逗号分隔',
  `workflowConfig` text COMMENT 'work flow流程JSON',
  `createByUser` varchar(255) DEFAULT NULL COMMENT '任务创建人',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 COMMENT = '任务表';



INSERT INTO `task` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`workflowConfig`,`createByUser`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (126,'1000','测试','running','{\"input\":{\"input_MfX-eD5Q\":\"1\",\"textarea_gWenKNrl\":\"2\"},\"formList\":[{\"id\":\"input_MfX-eD5Q\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_gWenKNrl\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"描述\",\"property\":{},\"icon\":\"mdi-form-textarea\"}}]}','userTask-0753d21a9248','[{\"from\":\"userTask-0753d21a9248\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"知悉\",\"type\":\"同意\",\"id\":\"line-a609eaded848\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"end-7c27c45e8e48\",\"label\":\"有问题\",\"type\":\"拒绝\",\"id\":\"line-b6c9daf81848\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','admin','admin','{\"lineList\":[{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-ed18e3b75548\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-229bad4dce48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-0753d21a9248\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-96ab6c19b748\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"情况属实\",\"type\":\"同意\",\"id\":\"line-bb760be14d48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"知悉\",\"type\":\"同意\",\"id\":\"line-a609eaded848\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-e2adabf1ee48\",\"to\":\"end-7c27c45e8e48\",\"label\":\"可以报销\",\"type\":\"同意\",\"id\":\"line-b774c3ebf348\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"end-7c27c45e8e48\",\"label\":\"不属实\",\"type\":\"拒绝\",\"id\":\"line-45e37493ea48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"end-7c27c45e8e48\",\"label\":\"有问题\",\"type\":\"拒绝\",\"id\":\"line-b6c9daf81848\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-edcbbcd76b48\",\"label\":\"起点\",\"top\":\"45px\",\"left\":\"196px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"end-7c27c45e8e48\",\"label\":\"终点\",\"top\":\"347px\",\"left\":\"194px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"userTask-ed18e3b75548\",\"label\":\"A审批\",\"top\":\"130px\",\"left\":\"3px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\",\"formId\":[]},{\"id\":\"userTask-0753d21a9248\",\"label\":\"B审批\",\"top\":\"131px\",\"left\":\"394px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-e2adabf1ee48\",\"label\":\"C审批\",\"top\":\"242px\",\"left\":\"190px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"}]}','admin','insert',NULL,NULL,'2022-10-12T23:52:18+08:00');
INSERT INTO `task` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`workflowConfig`,`createByUser`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (130,'1001','小王年假条','end','{\"input\":{},\"formList\":[]}','end-12621a2ba048','[]','admin','admin','admin','{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','insert',NULL,NULL,'2022-11-14T16:32:33+08:00');
INSERT INTO `task` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`workflowConfig`,`createByUser`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (133,'1002','花花请假条','end','{\"input\":{},\"formList\":[]}','end-837eae1d5f48','[]','admin','admin','admin','{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','insert',NULL,NULL,'2022-11-14T16:33:53+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `taskTitle` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `taskStatus` varchar(255) DEFAULT '0' COMMENT '任务状态：running 执行中；deny 拒绝；end 结束',
  `taskFormInput` text COMMENT '表单',
  `taskConfigId` text COMMENT '当前执行中节点ID',
  `taskNextConfigList` text COMMENT '执行线路id list: 逗号分隔',
  `taskInitUser` varchar(255) DEFAULT NULL COMMENT '申请人',
  `taskEditUserList` varchar(255) DEFAULT NULL COMMENT '当前执行的处理人员，用逗号分隔',
  `taskViewUserList` varchar(255) DEFAULT NULL COMMENT '所有相关人员，用逗号分隔',
  `taskComment` varchar(255) DEFAULT NULL COMMENT '备注',
  `workflowConfig` text COMMENT 'work flow流程JSON',
  `createByUser` varchar(255) DEFAULT NULL COMMENT '任务创建人',
  `taskExplain` varchar(255) DEFAULT NULL COMMENT '节点说明',
  `taskHandleDesc` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `taskLineFrom` varchar(255) DEFAULT NULL COMMENT '起始节点',
  `taskLineTo` varchar(255) DEFAULT NULL COMMENT '目标节点',
  `taskLineLabel` varchar(255) DEFAULT NULL COMMENT '线路名称描述',
  `taskCostDuration` varchar(255) DEFAULT NULL COMMENT '节点处理时长: 秒单位',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 COMMENT = '任务表';



INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (194,'1000','测试','running','{\"input\":{\"input_MfX-eD5Q\":\"1\",\"textarea_gWenKNrl\":\"2\"},\"formList\":[{\"id\":\"input_MfX-eD5Q\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_gWenKNrl\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"描述\",\"property\":{},\"icon\":\"mdi-form-textarea\"}}]}','start-edcbbcd76b48','[{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-ed18e3b75548\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-229bad4dce48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-0753d21a9248\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-96ab6c19b748\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','','admin','','{\"lineList\":[{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-ed18e3b75548\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-229bad4dce48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-0753d21a9248\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-96ab6c19b748\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"情况属实\",\"type\":\"同意\",\"id\":\"line-bb760be14d48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"知悉\",\"type\":\"同意\",\"id\":\"line-a609eaded848\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-e2adabf1ee48\",\"to\":\"end-7c27c45e8e48\",\"label\":\"可以报销\",\"type\":\"同意\",\"id\":\"line-b774c3ebf348\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"end-7c27c45e8e48\",\"label\":\"不属实\",\"type\":\"拒绝\",\"id\":\"line-45e37493ea48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"end-7c27c45e8e48\",\"label\":\"有问题\",\"type\":\"拒绝\",\"id\":\"line-b6c9daf81848\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-edcbbcd76b48\",\"label\":\"起点\",\"top\":\"45px\",\"left\":\"196px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"end-7c27c45e8e48\",\"label\":\"终点\",\"top\":\"347px\",\"left\":\"194px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"userTask-ed18e3b75548\",\"label\":\"A审批\",\"top\":\"130px\",\"left\":\"3px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\",\"formId\":[]},{\"id\":\"userTask-0753d21a9248\",\"label\":\"B审批\",\"top\":\"131px\",\"left\":\"394px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-e2adabf1ee48\",\"label\":\"C审批\",\"top\":\"242px\",\"left\":\"190px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"}]}','admin','起点','同意',',','userTask-ed18e3b75548,userTask-0753d21a9248','同意-自动流转,同意-自动流转','0','insert','系统管理员','admin','2022-10-12T23:52:18+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (195,'1000','测试','running','{\"input\":{\"input_MfX-eD5Q\":\"1\",\"textarea_gWenKNrl\":\"2\"},\"formList\":[{\"id\":\"input_MfX-eD5Q\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_gWenKNrl\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"描述\",\"property\":{},\"icon\":\"mdi-form-textarea\"}}]}','userTask-ed18e3b75548','[{\"from\":\"userTask-ed18e3b75548\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"情况属实\",\"type\":\"同意\",\"id\":\"line-bb760be14d48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"end-7c27c45e8e48\",\"label\":\"不属实\",\"type\":\"拒绝\",\"id\":\"line-45e37493ea48\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','admin','admin','222','{\"lineList\":[{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-ed18e3b75548\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-229bad4dce48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"start-edcbbcd76b48\",\"to\":\"userTask-0753d21a9248\",\"label\":\"自动流转\",\"type\":\"同意\",\"id\":\"line-96ab6c19b748\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"情况属实\",\"type\":\"同意\",\"id\":\"line-bb760be14d48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"userTask-e2adabf1ee48\",\"label\":\"知悉\",\"type\":\"同意\",\"id\":\"line-a609eaded848\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-e2adabf1ee48\",\"to\":\"end-7c27c45e8e48\",\"label\":\"可以报销\",\"type\":\"同意\",\"id\":\"line-b774c3ebf348\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-ed18e3b75548\",\"to\":\"end-7c27c45e8e48\",\"label\":\"不属实\",\"type\":\"拒绝\",\"id\":\"line-45e37493ea48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-0753d21a9248\",\"to\":\"end-7c27c45e8e48\",\"label\":\"有问题\",\"type\":\"拒绝\",\"id\":\"line-b6c9daf81848\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-edcbbcd76b48\",\"label\":\"起点\",\"top\":\"45px\",\"left\":\"196px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"end-7c27c45e8e48\",\"label\":\"终点\",\"top\":\"347px\",\"left\":\"194px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"userTask-ed18e3b75548\",\"label\":\"A审批\",\"top\":\"130px\",\"left\":\"3px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\",\"formId\":[]},{\"id\":\"userTask-0753d21a9248\",\"label\":\"B审批\",\"top\":\"131px\",\"left\":\"394px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-e2adabf1ee48\",\"label\":\"C审批\",\"top\":\"242px\",\"left\":\"190px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"}]}','admin','A审批','同意','','userTask-e2adabf1ee48','同意-情况属实','86','insert','系统管理员','admin','2022-10-12T23:53:44+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (196,'1001','小王年假条','running','{\"input\":{},\"formList\":[]}','start-505975ed9948','[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','','admin','','{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','起点','同意','','userTask-a8d029124d48','同意-开始','0','insert','系统管理员','admin','2022-11-14T16:32:09+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (197,'1001','小王年假条','running','{\"input\":{},\"formList\":[]}','userTask-a8d029124d48','[{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"}]','admin','admin','admin',NULL,'{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','财务审批','同意','','userTask-3e02fd391d48','同意-财务同意','11','insert','系统管理员','admin','2022-11-14T16:32:20+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (198,'1001','小王年假条','running','{\"input\":{},\"formList\":[]}','userTask-3e02fd391d48','[{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}]','admin','admin','admin',NULL,'{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','总经理审批','同意','','end-12621a2ba048','同意-总经理同意','13','insert','系统管理员','admin','2022-11-14T16:32:33+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (199,'1001','小王年假条','running','{\"input\":{},\"formList\":[]}','end-12621a2ba048','[{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}]','admin','admin','admin',NULL,'{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','结束','流程结束','userTask-3e02fd391d48','end-12621a2ba048','同意-总经理同意','0','insert','系统管理员','admin','2022-11-14T16:32:33+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (200,'1002','花花请假条','running','{\"input\":{},\"formList\":[]}','start-505975ed9948','[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','','admin','','{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','起点','同意','','userTask-a8d029124d48','同意-开始','0','insert','系统管理员','admin','2022-11-14T16:33:34+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (201,'1002','花花请假条','running','{\"input\":{},\"formList\":[]}','userTask-a8d029124d48','[{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"}]','admin','admin','admin',NULL,'{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','财务审批','拒绝','','end-837eae1d5f48','拒绝-财务拒绝','19','insert','系统管理员','admin','2022-11-14T16:33:53+08:00');
INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (202,'1002','花花请假条','running','{\"input\":{},\"formList\":[]}','end-837eae1d5f48','[{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"}]','admin','admin','admin',NULL,'{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','admin','结束','流程结束','userTask-a8d029124d48','end-837eae1d5f48','拒绝-财务拒绝','0','insert','系统管理员','admin','2022-11-14T16:33:53+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflowId` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `workflowName` varchar(255) DEFAULT NULL COMMENT '流程名',
  `workflowForm` text COMMENT 'form表单',
  `workflowConfig` text COMMENT '流程线路节点',
  `workflowCategory` varchar(255) DEFAULT NULL COMMENT '分类ID',
  `workflowRemark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 COMMENT = '流程表';



INSERT INTO `workflow` (`id`,`workflowId`,`workflowName`,`workflowForm`,`workflowConfig`,`workflowCategory`,`workflowRemark`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'1003','差旅报销审批流','[{\"id\":\"input_pFyJOHJ_\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"出发地\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_ZhhMcBuu\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"目的地\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_R2zzvdbt\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"报销金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"singleSelect_uRYtR5Qd\",\"component\":{\"title\":\"单选\",\"type\":\"singleSelect\",\"outline\":\"项目\",\"property\":{\"selectOptionList\":[{\"value\":\"A项目\"},{\"value\":\"B项目\"},{\"value\":\"C项目\"},{\"value\":\"D项目\"}]},\"icon\":\"mdi-checkbox-marked-circle\"}}]','{\"lineList\":[{\"from\":\"start-65644f2d3448\",\"to\":\"userTask-03c49310f248\",\"label\":\"进入审批流(自动)\",\"type\":\"\",\"id\":\"line-d0f962b80948\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-03c49310f248\",\"to\":\"userTask-aa4ea99a9f48\",\"label\":\"长老同意\",\"type\":\"同意\",\"id\":\"line-5cf3a4816548\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-aa4ea99a9f48\",\"to\":\"end-3f55d5225d48\",\"label\":\"掌门同意\",\"type\":\"同意\",\"id\":\"line-44e482e2ef48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-03c49310f248\",\"to\":\"end-9680fce31948\",\"label\":\"长老拒绝\",\"type\":\"拒绝\",\"id\":\"line-2b7361c1be48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-aa4ea99a9f48\",\"to\":\"end-9680fce31948\",\"label\":\"掌门拒绝\",\"type\":\"拒绝\",\"id\":\"line-e4146ac08e48\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"end-3f55d5225d48\",\"label\":\"差旅报销-同意申请\",\"top\":\"241px\",\"left\":\"645px\",\"type\":\"end\",\"lineTypeList\":\"\"},{\"id\":\"end-9680fce31948\",\"label\":\"差旅报销-拒绝申请\",\"top\":\"288px\",\"left\":\"417px\",\"type\":\"end\",\"lineTypeList\":\"\"},{\"id\":\"start-65644f2d3448\",\"label\":\"差旅报销-提交申请\",\"top\":\"31px\",\"left\":\"78px\",\"type\":\"start\",\"lineTypeList\":\"\",\"Remark\":\"\",\"formId\":[\"input_pFyJOHJ_\",\"input_ZhhMcBuu\",\"input_R2zzvdbt\",\"singleSelect_uRYtR5Qd\"]},{\"id\":\"userTask-03c49310f248\",\"label\":\"差旅报销-长老审批\",\"top\":\"96px\",\"left\":\"261px\",\"type\":\"userTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"W00002\"]},{\"id\":\"userTask-aa4ea99a9f48\",\"label\":\"差旅报销-掌门审批\",\"top\":\"180px\",\"left\":\"493px\",\"type\":\"userTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"W00001\"]}]}','财务',NULL,'jhUpdate','admin','系统管理员','2022-08-30T16:41:32+08:00');
INSERT INTO `workflow` (`id`,`workflowId`,`workflowName`,`workflowForm`,`workflowConfig`,`workflowCategory`,`workflowRemark`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (29,'1004','多重任务测试','[{\"id\":\"input_pZNnYTxM\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_RBIRnbrF\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"文本\",\"property\":{},\"icon\":\"mdi-form-textarea\"}}]','{\"lineList\":[{\"from\":\"start-981a81c67c48\",\"to\":\"receiveTask-e11e5a9f8d48\",\"label\":\"自动执行\",\"type\":\"同意\",\"id\":\"line-782abcdfdc48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-e11e5a9f8d48\",\"to\":\"receiveTask-7f806e262f48\",\"label\":\"1\",\"type\":\"同意\",\"id\":\"line-73e75650e948\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-e11e5a9f8d48\",\"to\":\"receiveTask-4cccc99edf48\",\"label\":\"2\",\"type\":\"同意\",\"id\":\"line-2f46cb4d4048\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-e11e5a9f8d48\",\"to\":\"receiveTask-d419111afd48\",\"label\":\"1\",\"type\":\"拒绝\",\"id\":\"line-d2707ddec248\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-7f806e262f48\",\"to\":\"userTask-80db30d0f248\",\"label\":\"1\",\"type\":\"同意\",\"id\":\"line-9d0a8772bc48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-4cccc99edf48\",\"to\":\"userTask-80db30d0f248\",\"label\":\"2\",\"type\":\"同意\",\"id\":\"line-e81be6f78548\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-80db30d0f248\",\"to\":\"end-69bfa6f23e48\",\"label\":\"审批\",\"type\":\"同意\",\"id\":\"line-b479cd7c8848\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"receiveTask-d419111afd48\",\"to\":\"end-69bfa6f23e48\",\"label\":\"连线名称\",\"type\":\"同意\",\"id\":\"line-c4e4bfc15648\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-981a81c67c48\",\"label\":\"起点\",\"top\":\"29px\",\"left\":\"303px\",\"type\":\"start\",\"lineTypeList\":\"同意\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"formId\":[]},{\"id\":\"end-69bfa6f23e48\",\"label\":\"结束\",\"top\":\"355px\",\"left\":\"308px\",\"type\":\"end\",\"lineTypeList\":\"\",\"assignType\":\"person\"},{\"id\":\"receiveTask-7f806e262f48\",\"label\":\"B1\",\"top\":\"179px\",\"left\":\"168px\",\"type\":\"receiveTask\",\"lineTypeList\":\"同意,拒绝\",\"formId\":[\"input_pZNnYTxM\",\"textarea_RBIRnbrF\"],\"assignType\":\"person\",\"assignValue\":[\"admin\"]},{\"id\":\"userTask-80db30d0f248\",\"label\":\"C1\",\"top\":\"288px\",\"left\":\"196px\",\"type\":\"userTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"formId\":[\"input_pZNnYTxM\"]},{\"id\":\"receiveTask-e11e5a9f8d48\",\"label\":\"A1\",\"top\":\"98px\",\"left\":\"301px\",\"type\":\"receiveTask\",\"lineTypeList\":\"同意,拒绝\",\"formId\":[\"input_pZNnYTxM\",\"textarea_RBIRnbrF\"],\"assignType\":\"person\",\"assignValue\":[\"admin\"]},{\"id\":\"receiveTask-4cccc99edf48\",\"label\":\"B2\",\"top\":\"182px\",\"left\":\"297px\",\"type\":\"receiveTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"formId\":[\"textarea_RBIRnbrF\"]},{\"id\":\"receiveTask-d419111afd48\",\"label\":\"B3\",\"top\":\"182px\",\"left\":\"437px\",\"type\":\"receiveTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"formId\":[\"input_pZNnYTxM\",\"textarea_RBIRnbrF\"]}]}','报销',NULL,'jhUpdate','admin','系统管理员','2022-10-07T22:28:14+08:00');
INSERT INTO `workflow` (`id`,`workflowId`,`workflowName`,`workflowForm`,`workflowConfig`,`workflowCategory`,`workflowRemark`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (31,'1005','执行节点任务','[]','{\"lineList\":[{\"from\":\"start-505975ed9948\",\"to\":\"userTask-a8d029124d48\",\"label\":\"开始\",\"type\":\"同意\",\"id\":\"line-ccc4fda30f48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"财务拒绝\",\"type\":\"拒绝\",\"id\":\"line-a3a7b9fa4848\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-a8d029124d48\",\"to\":\"userTask-3e02fd391d48\",\"label\":\"财务同意\",\"type\":\"同意\",\"id\":\"line-d87e9b59cb48\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-837eae1d5f48\",\"label\":\"总经理拒绝\",\"type\":\"拒绝\",\"id\":\"line-7a22e0a2d448\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeRejectLine\\\"}\"},{\"from\":\"userTask-3e02fd391d48\",\"to\":\"end-12621a2ba048\",\"label\":\"总经理同意\",\"type\":\"同意\",\"id\":\"line-359f2842b148\",\"Remark\":\"\",\"endpoint\":\"Dot\",\"hook\":\"{\\\"service\\\": \\\"hook\\\", \\\"serviceFunction\\\":\\\"executeFinishLine\\\"}\"}],\"nodeList\":[{\"id\":\"start-505975ed9948\",\"label\":\"起点\",\"top\":\"17px\",\"left\":\"249px\",\"type\":\"start\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意\"},{\"id\":\"userTask-a8d029124d48\",\"label\":\"财务审批\",\"top\":\"89px\",\"left\":\"250px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-3e02fd391d48\",\"label\":\"总经理审批\",\"top\":\"161px\",\"left\":\"247px\",\"type\":\"userTask\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"end-837eae1d5f48\",\"label\":\"拒绝\",\"top\":\"89px\",\"left\":\"66px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"},{\"id\":\"end-12621a2ba048\",\"label\":\"完成\",\"top\":\"238px\",\"left\":\"253px\",\"type\":\"end\",\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"\"}]}','请假',NULL,'jhUpdate','admin','系统管理员','2022-11-14T16:31:37+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_user
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_user` AS
select
  `_user`.`id` AS `id`,
  `_user`.`idSequence` AS `idSequence`,
  `_user`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `_user`.`clearTextPassword` AS `clearTextPassword`,
  `_user`.`password` AS `password`,
  `_user`.`md5Salt` AS `md5Salt`,
  `_user`.`userStatus` AS `userStatus`,
  `_user`.`userType` AS `userType`,
  `_user`.`config` AS `config`,
  `_user`.`operation` AS `operation`,
  `_user`.`operationByUserId` AS `operationByUserId`,
  `_user`.`operationByUser` AS `operationByUser`,
  `_user`.`operationAt` AS `operationAt`
from
  `_user`;





