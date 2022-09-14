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
# DATA DUMP FOR TABLE: _constant
# ------------------------------------------------------------




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_file`;
CREATE TABLE `_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` varchar(255) DEFAULT NULL COMMENT 'fileId',
  `fileDirectory` varchar(255) DEFAULT NULL COMMENT '文件保存路径;',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名;',
  `filenameStorage` varchar(255) DEFAULT NULL COMMENT '文件保存名',
  `downloadPath` varchar(255) DEFAULT NULL COMMENT '文件下载路径',
  `fileType` varchar(255) DEFAULT NULL COMMENT '文件类型;(预留字段)',
  `fileDesc` varchar(255) DEFAULT NULL COMMENT '文件描述',
  `binarySize` varchar(255) DEFAULT NULL COMMENT '文件二进制大小',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fileId_index` (`fileId`) USING BTREE
) ENGINE = InnoDB COMMENT = '文件表; 软删除未启用;';




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
# DATA DUMP FOR TABLE: _group
# ------------------------------------------------------------

INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'adminGroup','管理组','管理组',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'wudang','武当','武当',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'gaibang','丐帮','丐帮',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,'huashan','华山派','华山派',NULL,'{}','insert',NULL,NULL,NULL);



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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _page
# ------------------------------------------------------------

INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','帮助','helpV3','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'login','登陆','loginV3','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'workflowManagement','流程管理',NULL,'showInMenu','1','update','vscode','vscode','2022-07-05T16:40:58+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'workflowEditor','流程编辑',NULL,'dynamicInMenu','1','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'taskCreateManagement','任务申请',NULL,'showInMenu','2','insert','vscode','vscode','2022-07-06T13:33:17+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'taskICreateManagement','我的申请',NULL,'showInMenu','3','insert','vscode','vscode','2022-07-07T08:57:21+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,'taskUpcomingManagement','我的待办',NULL,'showInMenu','4','insert','vscode','vscode','2022-07-07T09:22:14+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (18,'taskHistoryManagement','任务详情',NULL,'dynamicInMenu','5','update','vscode','vscode','2022-07-05T16:40:50+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (26,'taskRelatedManagement','我相关的',NULL,'showInMenu','6','update','vscode','vscode','2022-07-07T09:29:29+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (35,'taskManagement','任务管理',NULL,'showInMenu','9','update','vscode','vscode','2022-07-05T16:40:32+08:00');



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
) ENGINE = InnoDB AUTO_INCREMENT = 42 COMMENT = '数据历史表';




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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

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
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,NULL,NULL,'designAssignmentEdit','updateAssignment','✅更新作业','sql','{}','{\"table\": \"article\", \"operation\": \"jhUpdate\"}','','','update',NULL,NULL,'2022-05-05T20:38:38+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (14,NULL,NULL,'designAssignmentEdit','selectAssignment','✅查询作业','sql','{}','{\"table\": \"article\", \"operation\": \"select\"}','','','update',NULL,NULL,'2022-07-04T16:59:09+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,NULL,NULL,'designAssignment','selectItemList','✅作业管理-查询列表(不包含内容)','sql','{}','{\"table\": \"article\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-02T16:02:08+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,NULL,NULL,'designAssignment','jhUpdateItem','✅作业编辑-更新成员','sql','{}','{\"table\": \"article\", \"operation\": \"jhUpdate\"}','','','update','vscode','vscode','2022-06-11T21:16:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,NULL,NULL,'designAssignment','jhDeletedItem','✅删除作业','sql','{}','{\"table\": \"article\", \"operation\": \"jhDelete\"}','','','update','vscode','vscode','2022-06-11T21:16:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (18,NULL,NULL,'designAssignment','jhInsertItem','✅新增作业','sql','{}','{\"table\": \"article\", \"operation\": \"jhInsert\"}','','','update','vscode','vscode','2022-06-11T21:16:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (19,NULL,NULL,'assignmentHomework','insertItem','✅模拟做题-创建','sql','{}','{\"table\": \"assignment\", \"operation\": \"jhInsert\"}','','','update',NULL,NULL,'2022-05-05T20:40:11+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,NULL,NULL,'assignmentHomework','updateItem','✅模拟做题-更新','sql','{}','{\"table\": \"assignment\", \"operation\": \"jhUpdate\"}','','','update',NULL,NULL,'2022-05-05T22:04:59+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (21,NULL,NULL,'assignmentHomework','selectItemList','✅模拟做题-更新成员','sql',NULL,'{\"service\": \"assignment\", \"serviceFunction\": \"selectArticleAssignmentList\"}','','','update',NULL,NULL,'2022-05-05T09:06:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (22,NULL,NULL,'assignmentHomework','selectArticleAssignmentList','✅模拟做题-某提做题','service','{}','{\"service\": \"assignment\", \"serviceFunction\": \"selectArticleAssignmentList\"}','','','update',NULL,NULL,'2022-05-07T19:34:34+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,NULL,NULL,'assignmentManagement','selectItemList','✅文章编辑-更新成员','service',NULL,'{\"service\": \"assignment\", \"serviceFunction\": \"selectAssignmentListInfo\"}','','','update',NULL,NULL,'2022-05-05T22:29:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (24,NULL,NULL,'designAssignment','test','desc','sql',NULL,'{\"table\": \"table_name\", \"operation\": \"select|insert|update|delete\"}','','','insert','vscode','vscode','2022-06-11T21:16:33+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (221,NULL,NULL,'categoryManagement','selectItemList','✅categoryManagement查询-查询列表','sql','{}','{\"table\": \"category\", \"operation\": \"select\"}','','','update',NULL,NULL,'2022-07-02T15:13:13+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (222,NULL,NULL,'categoryManagement','insertItem','✅categoryManagement查询-添加成员','sql','{}','{\"table\": \"category\", \"operation\": \"insert\"}','','','update',NULL,NULL,'2022-06-27T23:24:53+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (223,NULL,NULL,'categoryManagement','updateItem','✅categoryManagement查询-更新成员','sql','{}','{\"table\": \"category\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (224,NULL,NULL,'categoryManagement','deleteItem','✅categoryManagement查询-删除信息','sql','{}','{\"table\": \"category\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (225,NULL,NULL,'processManagement','selectItemList','✅processManagement查询-查询列表','sql','{}','{\"table\": \"workflow\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-05T16:14:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (226,NULL,'{\"before\":[{\"service\":\"workflow\",\"serviceFunction\":\"createWorkflowId\"}]}','processManagement','insertItem','✅processManagement查询-添加成员','sql','{}','{\"table\": \"process\", \"operation\": \"insert\"}','','','update','vscode','vscode','2022-06-30T11:31:38+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (227,NULL,NULL,'processManagement','updateItem','✅processManagement查询-更新成员','sql','{}','{\"table\": \"process\", \"operation\": \"jhUpdate\"}','','','update','vscode','vscode','2022-07-04T21:50:53+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (228,NULL,NULL,'processManagement','deleteItem','✅processManagement查询-删除信息','sql','{}','{\"table\": \"process\", \"operation\": \"jhDelete\"}','','','update','vscode','vscode','2022-06-29T11:37:43+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (229,NULL,NULL,'taskManagement','selectItemList','✅taskManagement查询-查询列表','sql','{}','{\"table\": \"task\", \"operation\": \"select\"}','','','update',NULL,NULL,'2022-07-04T22:14:27+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (230,NULL,NULL,'taskManagement','insertItem','✅taskManagement查询-添加成员','sql','{}','{\"table\": \"task\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (231,NULL,NULL,'taskManagement','updateItem','✅taskManagement查询-更新成员','sql','{}','{\"table\": \"task\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (232,NULL,NULL,'taskManagement','deleteItem','✅taskManagement查询-删除信息','sql','{}','{\"table\": \"task\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (233,NULL,'','processManagement','selectCategoryList','✅查询-分类列表','sql',NULL,'{\"table\": \"category\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:57+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (234,NULL,'','workflowManagement','selectUserList','✅查询-用户列表','sql',NULL,'{\"table\": \"_user\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (235,NULL,'','workflowManagement','selectGroupList','✅查询-组列表','sql',NULL,'{\"table\": \"_group\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (236,NULL,'','taskCreateManagement','selectWorkflowList','获取流程列表','sql',NULL,'{\"table\": \"workflow\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:55+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (238,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"createTaskId\"}]}','taskCreateManagement','insertItem','新增任务','sql',NULL,'{\"table\": \"task\", \"operation\": \"insert\"}','','','update','vscode','vscode','2022-07-04T22:14:20+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (239,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"whereToUserId\"}]}','taskICreateManagement','selectItemList','✅taskManagement查询-查询列表','sql','{}','{\"table\": \"task\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-02T22:48:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (240,NULL,NULL,'taskICreateManagement','insertItem','✅taskManagement查询-添加成员','sql','{}','{\"table\": \"task\", \"operation\": \"insert\"}','','','update','vscode','vscode','2022-06-29T21:17:08+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (241,NULL,NULL,'taskICreateManagement','updateItem','✅taskManagement查询-更新成员','sql','{}','{\"table\": \"task\", \"operation\": \"jhUpdate\"}','','','update','vscode','vscode','2022-06-29T21:17:08+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (242,NULL,NULL,'taskICreateManagement','deleteItem','✅taskManagement查询-删除信息','sql','{}','{\"table\": \"task\", \"operation\": \"jhDelete\"}','','','update','vscode','vscode','2022-06-29T21:17:08+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (243,NULL,'','taskHistoryManagement','getTaskHistoryInfo','获取任务历史详情','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"getTaskHistoryInfo\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (244,NULL,'','taskHistoryManagement','submitNode','获取任务历史详情','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"submitNode\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (245,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"upcomingToUserId\"}]}','taskUpcomingManagement','selectItemList','✅taskManagement查询-查询列表','sql','{}','{\"table\": \"task\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-06-30T12:17:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (246,NULL,NULL,'processTplManagement','selectItemList','✅taskManagement查询-查询列表','sql','{}','{\"table\": \"process_tpl\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (247,NULL,'{\"before\":[{\"service\":\"process\",\"serviceFunction\":\"createTplId\"}]}','processTplManagement','insertItem','✅processTplManagement查询-添加成员','sql','{}','{\"table\": \"process_tpl\", \"operation\": \"insert\"}','','','update',NULL,NULL,'2022-07-04T21:49:39+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (248,NULL,NULL,'processTplManagement','updateItem','✅processTplManagement查询-更新成员','sql','{}','{\"table\": \"process_tpl\", \"operation\": \"jhUpdate\"}','','','update',NULL,NULL,'2022-07-04T21:50:26+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (249,NULL,NULL,'processTplManagement','deleteItem','✅processTplManagement查询-删除信息','sql','{}','{\"table\": \"process_tpl\", \"operation\": \"jhDelete\"}','','','update',NULL,NULL,'2022-07-02T22:30:19+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (250,NULL,'','taskCreateManagement','insertTaskTpl','新增','sql',NULL,'{\"table\": \"task_tpl\", \"operation\": \"insert\"}','','','insert','vscode','vscode','2022-07-04T09:28:39+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (251,NULL,NULL,'taskHistoryManagement','selectItemList','✅taskHistoryManagement查询-查询列表','sql','{}','{\"table\": \"task_history\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (252,NULL,NULL,'taskHistoryManagement','insertItem','✅taskHistoryManagement查询-添加成员','sql','{}','{\"table\": \"task_history\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (253,NULL,NULL,'taskHistoryManagement','updateItem','✅taskHistoryManagement查询-更新成员','sql','{}','{\"table\": \"task_history\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (254,NULL,NULL,'taskHistoryManagement','deleteItem','✅taskHistoryManagement查询-删除信息','sql','{}','{\"table\": \"task_history\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (255,NULL,NULL,'workflowManagement','selectItemList','✅workflowManagement查询-查询列表','sql','{}','{\"table\": \"workflow\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (256,NULL,'{\"before\":[{\"service\":\"workflow\",\"serviceFunction\":\"createWorkflowId\"}]}','workflowManagement','insertItem','✅workflowManagement查询-添加成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (257,NULL,NULL,'workflowManagement','updateItem','✅workflowManagement查询-更新成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (258,NULL,NULL,'workflowManagement','deleteItem','✅workflowManagement查询-删除信息','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (259,NULL,NULL,'studentManagement','selectItemList','✅studentManagement查询-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (260,NULL,NULL,'studentManagement','insertItem','✅studentManagement查询-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (261,NULL,NULL,'studentManagement','updateItem','✅studentManagement查询-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (262,NULL,NULL,'studentManagement','deleteItem','✅studentManagement查询-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource_request_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource_request_log`;
CREATE TABLE `_resource_request_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` varchar(255) DEFAULT NULL COMMENT 'resource id;',
  `packageId` varchar(255) DEFAULT NULL COMMENT 'resource package id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip;',
  `userAgent` varchar(255) DEFAULT NULL COMMENT '设备信息',
  `userId` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `executeSql` varchar(255) DEFAULT NULL COMMENT '执行的sql',
  `requestBody` longtext COMMENT '请求body',
  `responseBody` longtext COMMENT '响应body',
  `responseStatus` varchar(255) DEFAULT NULL COMMENT '执行的结果;  success, fail',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `resourceId_index` (`resourceId`) USING BTREE,
  KEY `packageId_index` (`packageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6401 COMMENT = '文件表; 软删除未启用;';




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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _role
# ------------------------------------------------------------

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
# DATA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------




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
# DATA DUMP FOR TABLE: _ui
# ------------------------------------------------------------




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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------


INSERT INTO `_user_group_role_page` (`id`,`user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '*', 'login', '*', '*', 'allow', '所有页面; 开放给登陆用户;', 'insert', NULL, NULL, NULL);




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


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '*', 'login', '*', 'allPage.*', 'allow', '所有权限, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, '*', 'login', '*', '*', 'allow', '所有权限, 开放给所有登陆成功的用户', 'insert', NULL, NULL, NULL);




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
) ENGINE = InnoDB AUTO_INCREMENT = 32 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: access_control_student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_control_student`;
CREATE TABLE `access_control_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `resourceData` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 COMMENT = '学生表的 accessControl 表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: access_control_student
# ------------------------------------------------------------

INSERT INTO `access_control_student` (`id`,`userId`,`username`,`resourceData`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (50,'G00001','洪七公','{ \"where\":{\"level\": \"02\"} }','insert',NULL,NULL,NULL);
INSERT INTO `access_control_student` (`id`,`userId`,`username`,`resourceData`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (51,'H00001','岳不群','{ \"where\":{\"level\": \"02\"} }','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) DEFAULT NULL COMMENT '学生ID',
  `name` varchar(255) DEFAULT NULL COMMENT '学生名字',
  `gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `dateOfBirth` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `classId` varchar(255) DEFAULT NULL COMMENT '班级ID',
  `level` varchar(255) DEFAULT NULL COMMENT '年级',
  `bodyHeight` varchar(255) DEFAULT NULL COMMENT '身高',
  `studentStatus` varchar(255) DEFAULT NULL COMMENT '学生状态',
  `remarks` mediumtext COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176;




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
  `taskComment` varchar(255) DEFAULT NULL COMMENT '备注',
  `workflowConfig` text COMMENT 'work flow流程JSON',
  `createByUser` varchar(255) DEFAULT NULL COMMENT '任务创建人',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 COMMENT = '任务表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: task
# ------------------------------------------------------------

INSERT INTO `task` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (53,'1000','0907任务深情','running','{\"input\":{\"input_s5wcxWAi\":\"100\",\"textarea_4r_5gkmw\":\"100\",\"singleSelect_0jNoUCKM\":0,\"multipleSelect_CvKc9LuB\":[\"2\",\"3\"]},\"formList\":[{\"id\":\"input_s5wcxWAi\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_4r_5gkmw\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"金额大小\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"singleSelect_0jNoUCKM\",\"component\":{\"title\":\"单选\",\"type\":\"singleSelect\",\"outline\":\"单选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked-circle\"}},{\"id\":\"multipleSelect_CvKc9LuB\",\"component\":{\"title\":\"多选\",\"type\":\"multipleSelect\",\"outline\":\"多选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked\"}}]}','receiveTask-d3cfbd2f2c48','[{\"id\":\"line-7af22202cd48\",\"to\":\"userTask-280f7cc4f948\",\"from\":\"receiveTask-d3cfbd2f2c48\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','W00001','W00001,W00002,G00001,admin',NULL,'{\"lineList\":[{\"id\":\"line-6e88ce2cc148\",\"to\":\"userTask-b7ac8a109948\",\"from\":\"receiveTask-0fee61790848\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-7af22202cd48\",\"to\":\"userTask-280f7cc4f948\",\"from\":\"receiveTask-d3cfbd2f2c48\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-56e65e1b6248\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"移交\",\"label\":\"移交\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-f7a77463a148\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"start-b356baa16848\",\"type\":\"同意\",\"label\":\"连线名称\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-614ad15e7a48\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-4c7d72debd48\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-58a5bf293648\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-800303750748\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-b356baa16848\",\"top\":\"59px\",\"left\":\"148px\",\"type\":\"start\",\"label\":\"申请报销\",\"Remark\":\"\",\"lineTypeList\":\"同意\"},{\"id\":\"end-6455e366fe48\",\"top\":\"351px\",\"left\":\"630px\",\"type\":\"end\",\"label\":\"完成报销\",\"lineTypeList\":\"\"},{\"id\":\"receiveTask-d3cfbd2f2c48\",\"top\":\"177px\",\"left\":\"149px\",\"type\":\"receiveTask\",\"label\":\"初步审核\",\"formId\":[\"input_h9_FzChA\",\"input_v5KqrcgN\",\"input_npIModIb\"],\"assignType\":\"person\",\"assignValue\":[\"W00001\"],\"lineTypeList\":\"同意,拒绝\",\"formIdHidden\":[]},{\"id\":\"receiveTask-0fee61790848\",\"top\":\"246px\",\"left\":\"366px\",\"type\":\"receiveTask\",\"label\":\"二次审核\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"W00002\",\"G00001\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-b7ac8a109948\",\"top\":\"248px\",\"left\":\"630px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-280f7cc4f948\",\"top\":\"349px\",\"left\":\"324px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝,移交\"}]}','admin','insert','admin','系统管理员','2022-09-07T22:33:08+08:00');



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
) ENGINE = InnoDB AUTO_INCREMENT = 108 COMMENT = '任务表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: task_history
# ------------------------------------------------------------

INSERT INTO `task_history` (`id`,`taskId`,`taskTitle`,`taskStatus`,`taskFormInput`,`taskConfigId`,`taskNextConfigList`,`taskInitUser`,`taskEditUserList`,`taskViewUserList`,`taskComment`,`workflowConfig`,`createByUser`,`taskExplain`,`taskHandleDesc`,`taskLineFrom`,`taskLineTo`,`taskLineLabel`,`taskCostDuration`,`operation`,`operationByUser`,`operationByUserId`,`operationAt`) VALUES (107,'1000','0907任务深情','running','{\"input\":{\"input_s5wcxWAi\":\"100\",\"textarea_4r_5gkmw\":\"100\",\"singleSelect_0jNoUCKM\":0,\"multipleSelect_CvKc9LuB\":[\"2\",\"3\"]},\"formList\":[{\"id\":\"input_s5wcxWAi\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_4r_5gkmw\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"金额大小\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"singleSelect_0jNoUCKM\",\"component\":{\"title\":\"单选\",\"type\":\"singleSelect\",\"outline\":\"单选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked-circle\"}},{\"id\":\"multipleSelect_CvKc9LuB\",\"component\":{\"title\":\"多选\",\"type\":\"multipleSelect\",\"outline\":\"多选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked\"}}]}','receiveTask-d3cfbd2f2c48','[{\"id\":\"line-7af22202cd48\",\"to\":\"userTask-280f7cc4f948\",\"from\":\"receiveTask-d3cfbd2f2c48\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"}]','admin','W00001','W00001,W00002,G00001,admin',NULL,'{\"lineList\":[{\"id\":\"line-6e88ce2cc148\",\"to\":\"userTask-b7ac8a109948\",\"from\":\"receiveTask-0fee61790848\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-7af22202cd48\",\"to\":\"userTask-280f7cc4f948\",\"from\":\"receiveTask-d3cfbd2f2c48\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-56e65e1b6248\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"移交\",\"label\":\"移交\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-f7a77463a148\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"start-b356baa16848\",\"type\":\"同意\",\"label\":\"连线名称\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-614ad15e7a48\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-4c7d72debd48\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-58a5bf293648\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-800303750748\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-b356baa16848\",\"top\":\"59px\",\"left\":\"148px\",\"type\":\"start\",\"label\":\"申请报销\",\"Remark\":\"\",\"lineTypeList\":\"同意\"},{\"id\":\"end-6455e366fe48\",\"top\":\"351px\",\"left\":\"630px\",\"type\":\"end\",\"label\":\"完成报销\",\"lineTypeList\":\"\"},{\"id\":\"receiveTask-d3cfbd2f2c48\",\"top\":\"177px\",\"left\":\"149px\",\"type\":\"receiveTask\",\"label\":\"初步审核\",\"formId\":[\"input_h9_FzChA\",\"input_v5KqrcgN\",\"input_npIModIb\"],\"assignType\":\"person\",\"assignValue\":[\"W00001\"],\"lineTypeList\":\"同意,拒绝\",\"formIdHidden\":[]},{\"id\":\"receiveTask-0fee61790848\",\"top\":\"246px\",\"left\":\"366px\",\"type\":\"receiveTask\",\"label\":\"二次审核\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"W00002\",\"G00001\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-b7ac8a109948\",\"top\":\"248px\",\"left\":\"630px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-280f7cc4f948\",\"top\":\"349px\",\"left\":\"324px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝,移交\"}]}','admin','申请报销','流转','start-b356baa16848','receiveTask-d3cfbd2f2c48','同意-连线名称','0','insert','系统管理员','admin','2022-09-07T22:33:08+08:00');



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
) ENGINE = InnoDB AUTO_INCREMENT = 29 COMMENT = '流程表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: workflow
# ------------------------------------------------------------

INSERT INTO `workflow` (`id`,`workflowId`,`workflowName`,`workflowForm`,`workflowConfig`,`workflowCategory`,`workflowRemark`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'1001','ceshi 0907','[{\"id\":\"input_s5wcxWAi\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_4r_5gkmw\",\"component\":{\"title\":\"多行文本\",\"type\":\"textarea\",\"outline\":\"金额大小\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"singleSelect_0jNoUCKM\",\"component\":{\"title\":\"单选\",\"type\":\"singleSelect\",\"outline\":\"单选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked-circle\"}},{\"id\":\"multipleSelect_CvKc9LuB\",\"component\":{\"title\":\"多选\",\"type\":\"multipleSelect\",\"outline\":\"多选\",\"property\":{\"selectOptionList\":[{\"value\":\"1\"},{\"value\":\"2\"},{\"value\":\"3\"}]},\"icon\":\"mdi-checkbox-marked\"}}]','{\"lineList\":[{\"id\":\"line-6e88ce2cc148\",\"to\":\"userTask-b7ac8a109948\",\"from\":\"receiveTask-0fee61790848\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-7af22202cd48\",\"to\":\"userTask-280f7cc4f948\",\"from\":\"receiveTask-d3cfbd2f2c48\",\"type\":\"同意\",\"label\":\"通过审核\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-56e65e1b6248\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"移交\",\"label\":\"移交\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-f7a77463a148\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"start-b356baa16848\",\"type\":\"同意\",\"label\":\"连线名称\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-614ad15e7a48\",\"to\":\"receiveTask-d3cfbd2f2c48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-4c7d72debd48\",\"to\":\"receiveTask-0fee61790848\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"拒绝\",\"label\":\"驳回\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-58a5bf293648\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-280f7cc4f948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"id\":\"line-800303750748\",\"to\":\"end-6455e366fe48\",\"from\":\"userTask-b7ac8a109948\",\"type\":\"同意\",\"label\":\"通过审批\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"start-b356baa16848\",\"top\":\"59px\",\"left\":\"148px\",\"type\":\"start\",\"label\":\"申请报销\",\"Remark\":\"\",\"lineTypeList\":\"同意\"},{\"id\":\"end-6455e366fe48\",\"top\":\"351px\",\"left\":\"630px\",\"type\":\"end\",\"label\":\"完成报销\",\"lineTypeList\":\"\"},{\"id\":\"receiveTask-d3cfbd2f2c48\",\"top\":\"177px\",\"left\":\"149px\",\"type\":\"receiveTask\",\"label\":\"初步审核\",\"formId\":[\"input_h9_FzChA\",\"input_v5KqrcgN\",\"input_npIModIb\"],\"assignType\":\"person\",\"assignValue\":[\"W00001\"],\"lineTypeList\":\"同意,拒绝\",\"formIdHidden\":[]},{\"id\":\"receiveTask-0fee61790848\",\"top\":\"246px\",\"left\":\"366px\",\"type\":\"receiveTask\",\"label\":\"二次审核\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"W00002\",\"G00001\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-b7ac8a109948\",\"top\":\"248px\",\"left\":\"630px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"lineTypeList\":\"同意,拒绝\"},{\"id\":\"userTask-280f7cc4f948\",\"top\":\"349px\",\"left\":\"324px\",\"type\":\"userTask\",\"label\":\"审批节点\",\"formId\":[\"input_h9_FzChA\"],\"assignType\":\"person\",\"assignValue\":[\"admin\"],\"lineTypeList\":\"同意,拒绝,移交\"}]}','财务',NULL,'jhUpdate','admin','系统管理员','2022-09-07T13:51:42+08:00');
INSERT INTO `workflow` (`id`,`workflowId`,`workflowName`,`workflowForm`,`workflowConfig`,`workflowCategory`,`workflowRemark`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'1003','差旅报销审批流','[{\"id\":\"input_pFyJOHJ_\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"出发地\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_ZhhMcBuu\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"目的地\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_R2zzvdbt\",\"component\":{\"title\":\"单行文本\",\"type\":\"input\",\"outline\":\"报销金额\",\"property\":{},\"icon\":\"mdi-form-textarea\"}},{\"id\":\"singleSelect_uRYtR5Qd\",\"component\":{\"title\":\"单选\",\"type\":\"singleSelect\",\"outline\":\"项目\",\"property\":{\"selectOptionList\":[{\"value\":\"A项目\"},{\"value\":\"B项目\"},{\"value\":\"C项目\"},{\"value\":\"D项目\"}]},\"icon\":\"mdi-checkbox-marked-circle\"}}]','{\"lineList\":[{\"from\":\"start-65644f2d3448\",\"to\":\"userTask-03c49310f248\",\"label\":\"进入审批流(自动)\",\"type\":\"\",\"id\":\"line-d0f962b80948\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-03c49310f248\",\"to\":\"userTask-aa4ea99a9f48\",\"label\":\"长老同意\",\"type\":\"同意\",\"id\":\"line-5cf3a4816548\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-aa4ea99a9f48\",\"to\":\"end-3f55d5225d48\",\"label\":\"掌门同意\",\"type\":\"同意\",\"id\":\"line-44e482e2ef48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-03c49310f248\",\"to\":\"end-9680fce31948\",\"label\":\"长老拒绝\",\"type\":\"拒绝\",\"id\":\"line-2b7361c1be48\",\"Remark\":\"\",\"endpoint\":\"Dot\"},{\"from\":\"userTask-aa4ea99a9f48\",\"to\":\"end-9680fce31948\",\"label\":\"掌门拒绝\",\"type\":\"拒绝\",\"id\":\"line-e4146ac08e48\",\"Remark\":\"\",\"endpoint\":\"Dot\"}],\"nodeList\":[{\"id\":\"end-3f55d5225d48\",\"label\":\"差旅报销-同意申请\",\"top\":\"241px\",\"left\":\"645px\",\"type\":\"end\",\"lineTypeList\":\"\"},{\"id\":\"end-9680fce31948\",\"label\":\"差旅报销-拒绝申请\",\"top\":\"288px\",\"left\":\"417px\",\"type\":\"end\",\"lineTypeList\":\"\"},{\"id\":\"start-65644f2d3448\",\"label\":\"差旅报销-提交申请\",\"top\":\"31px\",\"left\":\"78px\",\"type\":\"start\",\"lineTypeList\":\"\",\"Remark\":\"\",\"formId\":[\"input_pFyJOHJ_\",\"input_ZhhMcBuu\",\"input_R2zzvdbt\",\"singleSelect_uRYtR5Qd\"]},{\"id\":\"userTask-03c49310f248\",\"label\":\"差旅报销-长老审批\",\"top\":\"96px\",\"left\":\"261px\",\"type\":\"userTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"W00002\"]},{\"id\":\"userTask-aa4ea99a9f48\",\"label\":\"差旅报销-掌门审批\",\"top\":\"180px\",\"left\":\"493px\",\"type\":\"userTask\",\"lineTypeList\":\"同意,拒绝\",\"assignType\":\"person\",\"assignValue\":[\"W00001\"]}]}','财务',NULL,'jhUpdate','admin','系统管理员','2022-08-30T16:41:32+08:00');



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





