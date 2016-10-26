/*
MySQL Backup
Source Server Version: 5.6.17
Source Database: jntxfb
Date: 2016/9/28 14:28:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `jntxfb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_admin`;
CREATE TABLE `jntxfb_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL COMMENT '用户名',
  `nicheng` varchar(50) DEFAULT NULL COMMENT '@昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `pass` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `loginci` smallint(6) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态@0|停用,1|启用',
  `gender` varchar(5) DEFAULT NULL COMMENT '性别@男,女',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(30) DEFAULT NULL COMMENT '操作人',
  `optid` int(11) DEFAULT NULL,
  `face` varchar(100) DEFAULT NULL,
  `style` varchar(30) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0' COMMENT '类型@0不能登录后台,1|可登录后台',
  `mibao` varchar(50) DEFAULT NULL,
  `mibaodaan` varchar(50) DEFAULT NULL,
  `jifen` int(11) DEFAULT '0' COMMENT '@积分',
  `zwid` int(11) DEFAULT NULL,
  `ranking` varchar(50) DEFAULT NULL COMMENT '职位',
  `deptid` smallint(4) DEFAULT '0',
  `deptpath` varchar(50) DEFAULT NULL,
  `deptname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `superman` varchar(50) DEFAULT NULL COMMENT '上级主管',
  `superid` varchar(50) DEFAULT NULL,
  `superpath` varchar(50) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '@排序号',
  `zhiwen` varchar(10) DEFAULT NULL COMMENT '指纹号',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `idnum` varchar(35) DEFAULT NULL COMMENT '身份证号',
  `homepage` varchar(50) DEFAULT NULL COMMENT '个人主页',
  `housetel` varchar(50) DEFAULT NULL COMMENT '家庭电话',
  `biyephoto` varchar(100) DEFAULT NULL COMMENT '@毕业证书图片',
  `xueweiphoto` varchar(100) DEFAULT NULL COMMENT '@学位图片',
  `houseaddress` varchar(100) DEFAULT NULL COMMENT '家庭地址',
  `nowaddress` varchar(100) DEFAULT NULL COMMENT '现在地址',
  `housecode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `nowcode` varchar(6) DEFAULT NULL,
  `jinname` varchar(10) DEFAULT NULL COMMENT '紧急联系人',
  `jintel` varchar(50) DEFAULT NULL COMMENT '紧急人电话',
  `minzu` varchar(5) DEFAULT NULL COMMENT '民族',
  `xueli` varchar(5) DEFAULT NULL COMMENT '学历',
  `hunyin` varchar(5) DEFAULT NULL COMMENT '婚姻',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `hkaddress` varchar(100) DEFAULT NULL COMMENT '户口地址',
  `workdate` date DEFAULT NULL COMMENT '入职时间',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `syenddt` date DEFAULT NULL COMMENT '试用到期日',
  `zhuanye` varchar(50) DEFAULT NULL COMMENT '专业',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `aihao` varchar(200) DEFAULT NULL COMMENT '爱好',
  `shengao` varchar(20) DEFAULT NULL COMMENT '身高',
  `tizhong` varchar(20) DEFAULT NULL COMMENT '体重',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `finge` varchar(20) DEFAULT NULL COMMENT '指纹号',
  `state` tinyint(1) DEFAULT '2' COMMENT '人员状态@1|正式员工,2|试用期,3|实习生,4|兼职,5|离职员工',
  `bydate` date DEFAULT NULL COMMENT '毕业时间',
  `groupname` varchar(50) DEFAULT NULL COMMENT '所在组',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `isdaily` tinyint(1) DEFAULT '1' COMMENT '写工作日报@0|不用写,1|要写',
  `isvcard` tinyint(1) DEFAULT '1' COMMENT '通讯录显示@0|不显示,1|显示',
  `homeitems` varchar(200) DEFAULT NULL COMMENT '@首页项目',
  `jiguan` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `workdt` date DEFAULT NULL COMMENT '参加工作时间',
  `xuexing` varchar(10) DEFAULT NULL COMMENT '血型',
  `zzmianmao` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `imonline` tinyint(4) DEFAULT '0' COMMENT '@是否在线',
  `imlastdt` datetime DEFAULT NULL COMMENT '@最后上线',
  `deviceid` varchar(100) DEFAULT NULL COMMENT '@APP登录设备',
  `applastdt` datetime DEFAULT NULL,
  `iswx` tinyint(1) DEFAULT '0' COMMENT '是否绑定微信',
  `companyid` smallint(6) DEFAULT '0' COMMENT '所属公司',
  `weixinid` varchar(50) DEFAULT NULL COMMENT '微信号',
  `cardid` varchar(255) DEFAULT NULL COMMENT '银行账号（收款账号）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_assetm`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_assetm`;
CREATE TABLE `jntxfb_assetm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) DEFAULT NULL COMMENT '类别',
  `title` varchar(50) DEFAULT NULL COMMENT '名称',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `brand` varchar(20) DEFAULT NULL COMMENT '品牌',
  `model` varchar(100) DEFAULT NULL COMMENT '规格型号',
  `laiyuan` varchar(50) DEFAULT NULL COMMENT '来源',
  `shuname` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `dt` date DEFAULT NULL COMMENT '日期',
  `address` varchar(50) DEFAULT NULL COMMENT '存放地点',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `buydt` date DEFAULT NULL COMMENT '购进日期',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `optid` smallint(6) DEFAULT '0',
  `isturn` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_assets`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_assets`;
CREATE TABLE `jntxfb_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_budget`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_budget`;
CREATE TABLE `jntxfb_budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '预算名称如：２０１５年度预算',
  `ndyear` int(11) DEFAULT NULL COMMENT '预算年度',
  `addtime` datetime DEFAULT NULL COMMENT '预算输入时间',
  `iscurrent` tinyint(1) DEFAULT NULL COMMENT '是否是当前年度预算',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='年度预算列表基本信息';

-- ----------------------------
--  Table structure for `jntxfb_budgetmonnum`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_budgetmonnum`;
CREATE TABLE `jntxfb_budgetmonnum` (
  `monnum` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`monnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预算的月份信息';

-- ----------------------------
--  Table structure for `jntxfb_budgetmonth`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_budgetmonth`;
CREATE TABLE `jntxfb_budgetmonth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budgetid` int(11) DEFAULT NULL COMMENT '预算ＩＤ',
  `budgetyearid` int(11) DEFAULT NULL COMMENT '年度预算信息ID',
  `deptid` int(11) DEFAULT NULL COMMENT '预算科室ＩＤ',
  `subjectid` int(11) DEFAULT NULL COMMENT '预算科目id',
  `monnum` tinyint(3) DEFAULT NULL COMMENT '月份',
  `monthvalue` decimal(10,2) DEFAULT NULL COMMENT '月度预算值　　月度预算由年度预算值平均而来',
  `dealvalue` decimal(10,2) DEFAULT NULL COMMENT '月度预算执行值　　每个报销审批完成后这里累加  　难点，如何确定是哪个月度的执行值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COMMENT='月度预算详细内容及月度预算执行值';

-- ----------------------------
--  Table structure for `jntxfb_budgetyear`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_budgetyear`;
CREATE TABLE `jntxfb_budgetyear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budgetid` int(11) DEFAULT NULL COMMENT '预算ＩＤ',
  `deptid` int(11) DEFAULT NULL COMMENT '预算科室ＩＤ',
  `subjectid` int(11) DEFAULT NULL COMMENT '预算科目id',
  `yearvalue` decimal(10,2) DEFAULT NULL COMMENT '年度预算值',
  `dealvalue` decimal(10,2) DEFAULT NULL COMMENT '年度预算执行值　　每个报销审批完成后这里累加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='年度预算信息及年度预算执行值';

-- ----------------------------
--  Table structure for `jntxfb_careserve`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_careserve`;
CREATE TABLE `jntxfb_careserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  `useid` varchar(200) DEFAULT NULL,
  `usename` varchar(200) DEFAULT NULL COMMENT '使用者',
  `useren` smallint(6) DEFAULT '0' COMMENT '使用人数',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `address` varchar(50) DEFAULT NULL COMMENT '目的地',
  `carid` smallint(6) DEFAULT NULL,
  `carnum` varchar(10) DEFAULT NULL COMMENT '使用车辆',
  `xianlines` varchar(200) DEFAULT NULL COMMENT '线路',
  `jiaid` varchar(200) DEFAULT NULL,
  `jianame` varchar(200) DEFAULT NULL COMMENT '驾驶员',
  `kmstart` varchar(20) DEFAULT NULL COMMENT '起始公里数',
  `kmend` varchar(20) DEFAULT NULL COMMENT '结束公里数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_carm`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_carm`;
CREATE TABLE `jntxfb_carm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carnum` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `carbrand` varchar(20) DEFAULT NULL COMMENT '车辆品牌',
  `carmode` varchar(30) DEFAULT NULL COMMENT '型号',
  `cartype` varchar(10) DEFAULT NULL COMMENT '车辆类型',
  `buydt` date DEFAULT NULL COMMENT '购买日期',
  `buyprice` mediumint(9) DEFAULT NULL COMMENT '购买价格',
  `enginenb` varchar(50) DEFAULT NULL COMMENT '发动机号',
  `ispublic` tinyint(4) DEFAULT '1' COMMENT '是否公开使用',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `addname` varchar(20) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `framenum` varchar(50) DEFAULT NULL COMMENT '车架号',
  `qxstartdt` date DEFAULT NULL COMMENT '强险开始日期',
  `qxenddt` date DEFAULT NULL COMMENT '强险截止日期',
  `xszstartdt` date DEFAULT NULL COMMENT '行驶证开始日期',
  `xszenddt` date DEFAULT NULL COMMENT '行驶证截止日期',
  `syxstartdt` date DEFAULT NULL COMMENT '商业险开始日期',
  `syxenddt` date DEFAULT NULL COMMENT '商业险截止日期',
  `nsstartdt` date DEFAULT NULL COMMENT '年审开始日期',
  `nsenddt` date DEFAULT NULL COMMENT '年审截止日期',
  `isturn` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_cars`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_cars`;
CREATE TABLE `jntxfb_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `fields` varchar(20) DEFAULT NULL,
  `fieldsname` varchar(20) DEFAULT NULL COMMENT '字段名',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `value` varchar(500) DEFAULT NULL COMMENT '对应值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_chargemode`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_chargemode`;
CREATE TABLE `jntxfb_chargemode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modeid` smallint(6) DEFAULT NULL,
  `modename` varchar(20) DEFAULT NULL,
  `installdt` datetime DEFAULT NULL,
  `installkey` varchar(100) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `updatedt` datetime DEFAULT NULL,
  `ver` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `modeid` (`modeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_chargemodes`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_chargemodes`;
CREATE TABLE `jntxfb_chargemodes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT NULL,
  `updatedt` datetime DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=854 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_company`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_company`;
CREATE TABLE `jntxfb_company` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `sort` smallint(6) DEFAULT '0',
  `chargename` varchar(100) DEFAULT NULL COMMENT '负责人',
  `chargeid` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_daily`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_daily`;
CREATE TABLE `jntxfb_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `adddt` datetime DEFAULT NULL COMMENT '新增时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `uid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|日报,1|周报,2|月报,3|年报',
  `plan` varchar(2000) DEFAULT NULL COMMENT '明日计划',
  `status` tinyint(1) DEFAULT '0',
  `enddt` date DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_dailyfx`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_dailyfx`;
CREATE TABLE `jntxfb_dailyfx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '分析时间',
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `totaly` smallint(6) DEFAULT '0' COMMENT '应写次数',
  `totalx` smallint(6) DEFAULT '0' COMMENT '已写次数',
  `totalw` smallint(6) DEFAULT '0' COMMENT '未写次数',
  `dtjoin` varchar(500) DEFAULT NULL COMMENT '未写日期',
  `optname` varchar(10) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_demand`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_demand`;
CREATE TABLE `jntxfb_demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `jsid` smallint(6) DEFAULT '0',
  `jsname` varchar(20) DEFAULT NULL COMMENT '技术处理人',
  `uid` int(11) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_dept`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_dept`;
CREATE TABLE `jntxfb_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL,
  `pid` smallint(8) DEFAULT NULL,
  `sort` tinyint(1) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `headman` varchar(50) DEFAULT NULL COMMENT '负责人',
  `headid` varchar(50) DEFAULT NULL,
  `companyid` smallint(6) DEFAULT '0' COMMENT '所属单位',
  `iszw` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_docdeil`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_docdeil`;
CREATE TABLE `jntxfb_docdeil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `receid` varchar(50) DEFAULT NULL,
  `recename` varchar(50) DEFAULT NULL COMMENT '签收人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_editrecord`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_editrecord`;
CREATE TABLE `jntxfb_editrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldsname` varchar(50) DEFAULT NULL,
  `oldval` varchar(200) DEFAULT NULL,
  `newval` varchar(200) DEFAULT NULL,
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_email`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_email`;
CREATE TABLE `jntxfb_email` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `serversmtp` varchar(50) DEFAULT NULL COMMENT 'SMTP服务器',
  `serverport` varchar(20) DEFAULT NULL COMMENT 'SMTP服务器端口',
  `emailname` varchar(100) DEFAULT NULL COMMENT '邮箱帐号',
  `emailpass` varchar(500) DEFAULT NULL COMMENT '密码',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `secure` varchar(10) DEFAULT NULL COMMENT '连接方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_email_tpl`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_email_tpl`;
CREATE TABLE `jntxfb_email_tpl` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT NULL COMMENT '＠发送邮件',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '邮件内容',
  `num` varchar(100) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_file`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_file`;
CREATE TABLE `jntxfb_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valid` tinyint(4) DEFAULT '1',
  `filename` varchar(200) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `fileext` varchar(20) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesizecn` varchar(30) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(300) DEFAULT NULL,
  `mtype` varchar(50) DEFAULT NULL COMMENT '对应类型',
  `mid` int(11) DEFAULT '0' COMMENT '管理id',
  `downci` int(11) DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`id`),
  KEY `mtype` (`mtype`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_fininfom`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_fininfom`;
CREATE TABLE `jntxfb_fininfom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT '0' COMMENT '单据类型@0|报销单,1|出差报销,2|借款单@not',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `moneycn` varchar(100) DEFAULT NULL COMMENT '大写金额',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态值　０进行中　１结束',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '动作值，包括自定义动作的值',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  `bills` smallint(6) DEFAULT NULL COMMENT '附单据(张)',
  `paytype` varchar(20) DEFAULT NULL COMMENT '付款方式',
  `fullname` varchar(100) DEFAULT NULL COMMENT '收款人全称',
  `cardid` varchar(50) DEFAULT NULL COMMENT '收款帐号',
  `openbank` varchar(50) DEFAULT NULL COMMENT '开户行',
  `purpose` varchar(100) DEFAULT NULL COMMENT '用途',
  `purresult` varchar(100) DEFAULT NULL,
  `subjectid` int(11) DEFAULT NULL COMMENT '科目',
  `subjectname` varchar(255) DEFAULT NULL COMMENT '科目名称',
  `idnum` varchar(50) DEFAULT NULL COMMENT '身份证',
  `isemp` tinyint(3) DEFAULT '0' COMMENT '是否已经导出',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_fininfos`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_fininfos`;
CREATE TABLE `jntxfb_fininfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `items` varchar(30) DEFAULT NULL,
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL,
  `moneys` decimal(8,2) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `address` varchar(50) DEFAULT NULL COMMENT '地点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_bill`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_bill`;
CREATE TABLE `jntxfb_flow_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sericnum` varchar(50) DEFAULT NULL COMMENT '单号',
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `modeid` smallint(6) DEFAULT '0' COMMENT '模块id',
  `modename` varchar(20) DEFAULT NULL COMMENT '模块名称',
  `uid` smallint(6) DEFAULT NULL COMMENT '用户id',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所有审核人',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `nstatus` tinyint(1) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `nstatustext` varchar(100) DEFAULT NULL COMMENT '当前状态',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE,
  KEY `sericnum` (`sericnum`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_checks`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_checks`;
CREATE TABLE `jntxfb_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `checkid` varchar(100) DEFAULT NULL,
  `checkname` varchar(100) DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_course`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_course`;
CREATE TABLE `jntxfb_flow_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT NULL COMMENT '对应配置',
  `name` varchar(50) DEFAULT NULL COMMENT '进程名称',
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `pid` int(11) DEFAULT '0' COMMENT '上一步id',
  `nid` int(11) DEFAULT NULL,
  `atype` varchar(20) DEFAULT NULL COMMENT '适用于所以人员,指定ren,部门',
  `atypename` varchar(200) DEFAULT NULL COMMENT '指定的人',
  `atypeid` varchar(200) DEFAULT NULL,
  `checktype` varchar(20) DEFAULT NULL COMMENT '审核人员类型',
  `checktypeid` varchar(100) DEFAULT NULL COMMENT '审核人id',
  `checktypename` varchar(100) DEFAULT NULL COMMENT '审核人员姓名',
  `groupname` varchar(50) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(100) DEFAULT NULL COMMENT '说明',
  `inputid` smallint(6) DEFAULT '0',
  `zscheck` smallint(6) DEFAULT '1' COMMENT '@至少',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|默认,1|可转移',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_courseact`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_courseact`;
CREATE TABLE `jntxfb_flow_courseact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '模块id',
  `cid` int(11) DEFAULT NULL COMMENT '进程id',
  `name` varchar(20) DEFAULT NULL COMMENT '动作名称',
  `names` varchar(20) DEFAULT NULL COMMENT '副名称',
  `actv` smallint(6) DEFAULT '0' COMMENT '状态值',
  `nid` int(11) DEFAULT '0' COMMENT '下一步id@0|正常,-1|退回提交人',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `action` varchar(100) DEFAULT NULL COMMENT '动作执行方法名',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `color` varchar(20) DEFAULT NULL COMMENT '状态颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_courseinput`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_courseinput`;
CREATE TABLE `jntxfb_flow_courseinput` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(20) DEFAULT NULL COMMENT '表单类型',
  `sort` smallint(6) DEFAULT '0',
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_element`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_element`;
CREATE TABLE `jntxfb_flow_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `fields` varchar(50) DEFAULT NULL COMMENT '对应字段',
  `fieldstype` varchar(30) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `dev` varchar(20) DEFAULT NULL COMMENT '默认值',
  `isbt` tinyint(1) DEFAULT '0' COMMENT '是否必填',
  `data` varchar(500) DEFAULT NULL COMMENT '数据源',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否录入元素',
  `iszs` tinyint(1) DEFAULT '1' COMMENT '是否列表展示',
  `attr` varchar(500) DEFAULT NULL COMMENT '属性',
  `iszb` tinyint(1) DEFAULT '0',
  `isss` tinyint(1) DEFAULT '0',
  `lattr` varchar(100) DEFAULT NULL COMMENT '列属性',
  `width` varchar(10) DEFAULT NULL COMMENT '列宽',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_log`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_log`;
CREATE TABLE `jntxfb_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1通过',
  `statusname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `name` varchar(50) DEFAULT NULL COMMENT '进程名称',
  `courseid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `checkname` varchar(20) DEFAULT NULL,
  `checkid` smallint(6) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT NULL COMMENT '@模块Id',
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_rule`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_rule`;
CREATE TABLE `jntxfb_flow_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rulename` varchar(50) DEFAULT NULL COMMENT '对应记录姓名',
  `flowname` varchar(50) DEFAULT NULL COMMENT '流程名称',
  `flowid` int(11) DEFAULT NULL,
  `allcourseid` varchar(200) DEFAULT NULL COMMENT '所有进程id',
  `alluserid` varchar(200) DEFAULT NULL COMMENT '所有审核人id',
  `alluser` varchar(200) DEFAULT NULL COMMENT '所有审核人姓名',
  `nowcourseid` int(11) DEFAULT NULL COMMENT '当前进程id',
  `nextcourseid` int(11) DEFAULT NULL COMMENT '下一进程id',
  `nowuser` varchar(200) DEFAULT NULL COMMENT '当前审核人',
  `nowuserid` varchar(200) DEFAULT NULL COMMENT '当前审核人id',
  `allstep` tinyint(4) DEFAULT '0' COMMENT '总步骤',
  `step` tinyint(4) DEFAULT '0' COMMENT '当前步骤',
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT NULL COMMENT '表上id',
  `nstatus` tinyint(4) DEFAULT '0' COMMENT '当前状态',
  `allcheckid` varchar(300) DEFAULT NULL COMMENT '所有审核人id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_flow_set`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_flow_set`;
CREATE TABLE `jntxfb_flow_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '配置名称',
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `table` varchar(50) DEFAULT NULL COMMENT '对应的表',
  `uidfields` varchar(50) DEFAULT NULL COMMENT '对应人员字段',
  `statusfields` varchar(50) DEFAULT NULL COMMENT '状态字段',
  `menunum` varchar(50) DEFAULT NULL COMMENT '对应菜单编号',
  `fields` varchar(500) DEFAULT NULL COMMENT '字段聚合',
  `summary` varchar(500) DEFAULT NULL COMMENT '摘要',
  `type` varchar(20) DEFAULT NULL COMMENT '分类',
  `zntx` tinyint(1) DEFAULT '0' COMMENT '@站内提醒',
  `imtx` tinyint(1) DEFAULT '0' COMMENT '@REIM提醒',
  `emtx` tinyint(1) DEFAULT '0' COMMENT '@邮件提醒',
  `sericnum` varchar(50) DEFAULT NULL COMMENT '编号规则',
  `isflow` tinyint(1) DEFAULT '1' COMMENT '是否有流程',
  `isapp` tinyint(1) DEFAULT '1' COMMENT '@手机模块',
  `wxtx` tinyint(1) DEFAULT '0' COMMENT '微信推送@0|否,1|是',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `apptx` tinyint(1) DEFAULT '0' COMMENT 'APP提醒@0|否,1|是',
  `tables` varchar(50) DEFAULT NULL COMMENT '对应子表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_group`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_group`;
CREATE TABLE `jntxfb_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '组名',
  `sort` tinyint(4) DEFAULT '0',
  `ispir` tinyint(4) DEFAULT '1' COMMENT '是否权限验证',
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_homeitems`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_homeitems`;
CREATE TABLE `jntxfb_homeitems` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `uid` smallint(6) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` smallint(6) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `ismr` tinyint(1) DEFAULT '1',
  `x` smallint(6) DEFAULT '0',
  `y` smallint(6) DEFAULT '0',
  `w` smallint(6) DEFAULT '0',
  `h` smallint(6) DEFAULT '0',
  `icons` varchar(30) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_hrpositive`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_hrpositive`;
CREATE TABLE `jntxfb_hrpositive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `syenddt` date DEFAULT NULL COMMENT '试用到期日',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_hrredund`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_hrredund`;
CREATE TABLE `jntxfb_hrredund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `redundtype` varchar(20) DEFAULT NULL COMMENT '离职类型',
  `redundreson` varchar(100) DEFAULT NULL COMMENT '离职原因',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_hrtransfer`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_hrtransfer`;
CREATE TABLE `jntxfb_hrtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `tranuid` int(11) DEFAULT NULL,
  `tranname` varchar(20) DEFAULT NULL COMMENT '要调动人',
  `trantype` varchar(20) DEFAULT NULL COMMENT '调动类型',
  `olddeptname` varchar(50) DEFAULT NULL COMMENT '原来部门',
  `oldranking` varchar(20) DEFAULT NULL COMMENT '原来职位',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `newdeptname` varchar(50) DEFAULT NULL COMMENT '调动后部门',
  `newdeptid` smallint(6) DEFAULT NULL,
  `newranking` varchar(20) DEFAULT NULL COMMENT '调动后职位',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_im_group`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_im_group`;
CREATE TABLE `jntxfb_im_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|群,1|讨论组,2|应用',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `createid` int(11) DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL COMMENT '创建人',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `face` varchar(50) DEFAULT NULL COMMENT '头像',
  `num` varchar(20) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `width` smallint(6) DEFAULT '0',
  `height` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_im_groupuser`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_im_groupuser`;
CREATE TABLE `jntxfb_im_groupuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `adddt` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_im_history`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_im_history`;
CREATE TABLE `jntxfb_im_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `mid` smallint(6) DEFAULT NULL,
  `uid` smallint(6) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_im_mess`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_im_mess`;
CREATE TABLE `jntxfb_im_mess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optdt` datetime DEFAULT NULL,
  `zt` tinyint(1) DEFAULT '0' COMMENT '状态',
  `cont` varchar(4000) DEFAULT NULL COMMENT '内容',
  `sendid` smallint(6) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0' COMMENT '接收',
  `receuid` varchar(1000) DEFAULT NULL COMMENT '接收用户id',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `url` varchar(1000) DEFAULT NULL COMMENT '相关地址',
  `ftype` tinyint(1) DEFAULT '0' COMMENT '来源@0|pc端,1|APP',
  `ists` tinyint(1) DEFAULT '0' COMMENT '推送',
  `tstime` datetime DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`),
  KEY `optdt` (`optdt`,`receid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_im_messzt`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_im_messzt`;
CREATE TABLE `jntxfb_im_messzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '信息id',
  `uid` int(11) DEFAULT NULL COMMENT '人员id',
  `gid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_infor`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_infor`;
CREATE TABLE `jntxfb_infor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `typenum` varchar(50) DEFAULT NULL COMMENT '类型编号',
  `typename` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `hits` tinyint(5) DEFAULT '0',
  `enddt` datetime DEFAULT NULL,
  `startdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '作者',
  `istt` tinyint(1) DEFAULT '0',
  `xu` smallint(6) DEFAULT '0',
  `color` varchar(7) DEFAULT NULL,
  `isshow` tinyint(1) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `zuozhe` varchar(50) DEFAULT NULL COMMENT '作者',
  `indate` date DEFAULT NULL COMMENT '时间',
  `faobjid` varchar(200) DEFAULT NULL,
  `faobjname` varchar(200) DEFAULT NULL COMMENT '发布给',
  `atype` tinyint(1) DEFAULT '0' COMMENT '@分类id@0内部,1部门',
  `isturn` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_items`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_items`;
CREATE TABLE `jntxfb_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(20) DEFAULT NULL,
  `mid` int(11) DEFAULT '0',
  `atype` varchar(20) DEFAULT NULL COMMENT '类型',
  `aid` smallint(6) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL COMMENT '相关名称',
  `startdt` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `enddt` varchar(30) DEFAULT NULL COMMENT '截止时间',
  `moneys` decimal(8,2) DEFAULT '0.00' COMMENT '金额',
  `sort` smallint(6) DEFAULT '0',
  `address` varchar(50) DEFAULT NULL COMMENT '相关地点',
  `explain` varchar(100) DEFAULT NULL COMMENT '说明',
  `count` smallint(6) DEFAULT '0' COMMENT '数量',
  `optdt` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `optid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_anay`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_anay`;
CREATE TABLE `jntxfb_kq_anay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `uid` smallint(6) DEFAULT NULL COMMENT '人员id',
  `ztname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `time` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `states` varchar(20) DEFAULT NULL COMMENT '状态1',
  `sort` smallint(6) DEFAULT '0',
  `optname` varchar(50) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `iswork` tinyint(4) DEFAULT '1' COMMENT '是否工作日',
  `emiao` varchar(20) DEFAULT NULL COMMENT '秒数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_dkerr`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_dkerr`;
CREATE TABLE `jntxfb_kq_dkerr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `errtype` varchar(20) DEFAULT NULL COMMENT '异常类型',
  `dt` date DEFAULT NULL COMMENT '日期',
  `ytime` varchar(20) DEFAULT NULL COMMENT '应打卡时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_dkip`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_dkip`;
CREATE TABLE `jntxfb_kq_dkip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `ipvalue` varchar(300) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_dkjl`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_dkjl`;
CREATE TABLE `jntxfb_kq_dkjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finge` varchar(20) DEFAULT NULL COMMENT '指纹',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `checktime` datetime DEFAULT NULL COMMENT '时间',
  `web` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '来源@0|打卡机,1|异常登记,2|手动添加,3|定位的',
  `locationid` int(11) DEFAULT '0' COMMENT '对应定位记录',
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finge` (`finge`,`checktime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_info`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_info`;
CREATE TABLE `jntxfb_kq_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `kind` varchar(10) DEFAULT NULL COMMENT '类型@请假,加班',
  `qjkind` varchar(20) DEFAULT NULL COMMENT '请假类型@年假',
  `stime` datetime DEFAULT NULL COMMENT '开始时间',
  `etime` datetime DEFAULT NULL COMMENT '截止时间',
  `totals` smallint(6) DEFAULT '0' COMMENT '时间(小时)',
  `optid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `isxj` tinyint(1) DEFAULT '0',
  `sicksm` varchar(500) DEFAULT NULL COMMENT '销假说明',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_out`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_out`;
CREATE TABLE `jntxfb_kq_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `outtime` datetime DEFAULT NULL COMMENT '外出时间',
  `intime` datetime DEFAULT NULL COMMENT '回岗时间',
  `address` varchar(50) DEFAULT NULL COMMENT '外出地址',
  `reason` varchar(500) DEFAULT NULL COMMENT '外出事由',
  `atype` varchar(20) DEFAULT NULL COMMENT '外出类型@外出,出差',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `statusman` varchar(20) DEFAULT NULL COMMENT '@审核人',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `isxj` tinyint(1) DEFAULT '0' COMMENT '是否销假@0|否,1|是',
  `sicksm` varchar(500) DEFAULT NULL COMMENT '销假说明',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_set`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_set`;
CREATE TABLE `jntxfb_kq_set` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `type` smallint(6) DEFAULT '0' COMMENT '类型@0主',
  `mid` smallint(6) DEFAULT '0' COMMENT '主',
  `stime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `etime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `qtype` tinyint(4) DEFAULT '0' COMMENT '取值类型@0|最小值,1|最大值',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `dt` date DEFAULT NULL COMMENT '针对日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_setm`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_setm`;
CREATE TABLE `jntxfb_kq_setm` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `mid` smallint(6) DEFAULT '0' COMMENT '对应规则',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `startdt` date DEFAULT NULL COMMENT '针对开始日期',
  `enddt` date DEFAULT NULL COMMENT '针对截止日期',
  `sort` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '1排版',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_sick`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_sick`;
CREATE TABLE `jntxfb_kq_sick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|请假销假,1|外出销假',
  `mseric` varchar(30) DEFAULT NULL COMMENT '销假单号',
  `mid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `stime` datetime DEFAULT NULL COMMENT '开始时间',
  `etime` datetime DEFAULT NULL,
  `totals` smallint(6) DEFAULT '0' COMMENT '实际小时',
  `xjall` tinyint(1) DEFAULT '0' COMMENT '是否销假全部@0|否,1|是',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_xiu`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_xiu`;
CREATE TABLE `jntxfb_kq_xiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL COMMENT '日期',
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_kq_xium`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_kq_xium`;
CREATE TABLE `jntxfb_kq_xium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_log`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_log`;
CREATE TABLE `jntxfb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `optid` int(11) DEFAULT NULL COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `optdt` datetime DEFAULT NULL COMMENT '添加时间',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `web` varchar(100) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_logintoken`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_logintoken`;
CREATE TABLE `jntxfb_logintoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `moddt` datetime DEFAULT NULL,
  `cfrom` varchar(10) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(30) DEFAULT NULL,
  `online` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_meet`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_meet`;
CREATE TABLE `jntxfb_meet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optname` varchar(20) DEFAULT NULL COMMENT '发起人',
  `hyname` varchar(20) DEFAULT NULL COMMENT '会议室名称',
  `title` varchar(50) DEFAULT NULL COMMENT '主题',
  `startdt` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `enddt` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|普通,1|固定@not',
  `joinid` varchar(200) DEFAULT NULL,
  `joinname` varchar(500) DEFAULT NULL COMMENT '参加人员',
  `mid` int(11) DEFAULT '0',
  `rate` varchar(100) DEFAULT NULL,
  `istz` tinyint(1) DEFAULT '0' COMMENT '@是否通知',
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `state` tinyint(1) DEFAULT '0' COMMENT '会议状态@0|正常,1|会议中,2|结束,3|取消',
  `isturn` tinyint(1) DEFAULT '1',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  `cancelreason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_menu`;
CREATE TABLE `jntxfb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL,
  `pid` smallint(8) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort` tinyint(1) DEFAULT '0',
  `indate` datetime DEFAULT NULL,
  `icons` varchar(50) DEFAULT NULL COMMENT '图标',
  `level` tinyint(4) DEFAULT '1' COMMENT '级别',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `ispir` tinyint(1) DEFAULT '1' COMMENT '是否权限验证',
  `isopen` tinyint(1) DEFAULT '0' COMMENT '是否展开',
  `ischeck` tinyint(1) DEFAULT '0' COMMENT '菜单类型@0|普通,1|iframe连接,2|跳转',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_menucom`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_menucom`;
CREATE TABLE `jntxfb_menucom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `url` varchar(500) DEFAULT NULL COMMENT '地址',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `optdt` datetime DEFAULT NULL,
  `menuid` varchar(5) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_option`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_option`;
CREATE TABLE `jntxfb_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `mnum` varchar(50) DEFAULT NULL COMMENT '上级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(500) DEFAULT NULL COMMENT '对应值',
  `xu` smallint(6) DEFAULT NULL COMMENT '排序',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT '0',
  `content` varchar(4000) DEFAULT NULL COMMENT '相关介绍',
  `ism` tinyint(1) DEFAULT '0' COMMENT '是否主选项',
  `pid` int(11) DEFAULT '0' COMMENT '@上级ID',
  `valid` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `num` (`num`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_reads`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_reads`;
CREATE TABLE `jntxfb_reads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_reward`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_reward`;
CREATE TABLE `jntxfb_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  `object` varchar(30) DEFAULT NULL COMMENT '奖惩对象',
  `objectid` smallint(6) DEFAULT '0',
  `atype` varchar(20) DEFAULT NULL COMMENT '奖惩类型',
  `result` varchar(50) DEFAULT NULL COMMENT '奖惩结果',
  `money` mediumint(6) DEFAULT NULL COMMENT '奖惩金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_schedule`;
CREATE TABLE `jntxfb_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `startdt` datetime DEFAULT NULL,
  `enddt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT NULL COMMENT '用户Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '频率',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_sjoin`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_sjoin`;
CREATE TABLE `jntxfb_sjoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `mid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_sjoinv`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_sjoinv`;
CREATE TABLE `jntxfb_sjoinv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL COMMENT '@用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mode` varchar(200) DEFAULT NULL COMMENT '模块编号',
  `modename` varchar(200) DEFAULT NULL COMMENT '模块名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|不允许查看,1|可查看',
  `renyid` varchar(200) DEFAULT NULL,
  `renyname` varchar(200) DEFAULT NULL COMMENT '对应值',
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_subject`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_subject`;
CREATE TABLE `jntxfb_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '标题',
  `pid` int(11) DEFAULT '0' COMMENT '父ＩＤ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='科目';

-- ----------------------------
--  Table structure for `jntxfb_supple`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_supple`;
CREATE TABLE `jntxfb_supple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '分类id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `price` float(6,2) DEFAULT NULL COMMENT '单价',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `sort` smallint(6) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `num` varchar(20) DEFAULT NULL COMMENT '物品编号',
  `model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_supplea`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_supplea`;
CREATE TABLE `jntxfb_supplea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '@办公用品ID',
  `aname` varchar(30) DEFAULT NULL COMMENT '用品名称',
  `total` smallint(6) DEFAULT '0' COMMENT '申请数量',
  `uid` int(11) DEFAULT '0',
  `optid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待确认,1|已发放,2|不通过驳回,3|入库,4|异常入库',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `statusman` varchar(50) DEFAULT NULL,
  `checkdt` datetime DEFAULT NULL,
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `nowcheckid` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所以审核人',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '@当然状态',
  `nowcheckname` varchar(50) DEFAULT NULL COMMENT '@当前审核人',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_task`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_task`;
CREATE TABLE `jntxfb_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `typename` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optid` int(11) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `xu` smallint(6) DEFAULT '0' COMMENT '序号',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '频率',
  `lastrundt` datetime DEFAULT NULL COMMENT '最后运行时间',
  `lastrunzt` tinyint(1) DEFAULT '0' COMMENT '最后运行状态@0|无,1|成功,2|失败',
  `zntx` tinyint(1) DEFAULT '0',
  `emtx` tinyint(1) DEFAULT '0' COMMENT '邮件提醒',
  `confuid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_tasktime`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_tasktime`;
CREATE TABLE `jntxfb_tasktime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `table` varchar(50) DEFAULT NULL,
  `atype` varchar(20) DEFAULT NULL COMMENT '类型',
  `shijian` varchar(50) DEFAULT NULL,
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `rateval` smallint(6) DEFAULT '0' COMMENT '对应的值',
  `stime` varchar(20) DEFAULT NULL COMMENT '每天从几点开始',
  `etime` varchar(20) DEFAULT NULL COMMENT '截止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_taskuser`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_taskuser`;
CREATE TABLE `jntxfb_taskuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `chaoid` varchar(200) DEFAULT NULL,
  `chaoname` varchar(200) DEFAULT NULL COMMENT '抄送给',
  `sort` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_todo`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_todo`;
CREATE TABLE `jntxfb_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '类型',
  `mess` varchar(500) DEFAULT NULL COMMENT '信息内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@0|未读,1|已读',
  `optdt` datetime DEFAULT NULL COMMENT '时间',
  `table` varchar(50) DEFAULT NULL,
  `mid` smallint(6) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL COMMENT '相关地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_userjl`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_userjl`;
CREATE TABLE `jntxfb_userjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ranking` varchar(50) DEFAULT NULL,
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `uid` int(11) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `atype` varchar(20) DEFAULT NULL COMMENT '类型',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `httype` varchar(30) DEFAULT NULL COMMENT '合同类型',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `tqenddt` date DEFAULT NULL COMMENT '提前终止',
  `company` varchar(50) DEFAULT NULL COMMENT '签署公司',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_vcard`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_vcard`;
CREATE TABLE `jntxfb_vcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名字',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `optdt` datetime DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `gname` varchar(20) DEFAULT NULL COMMENT '所在组名',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_where`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_where`;
CREATE TABLE `jntxfb_where` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mnum` varchar(100) DEFAULT NULL COMMENT '对应编号',
  `luoji` varchar(10) DEFAULT NULL COMMENT '逻辑',
  `field` varchar(30) DEFAULT NULL COMMENT '字段',
  `name` varchar(30) DEFAULT NULL COMMENT '字段名',
  `optlx` varchar(20) DEFAULT NULL COMMENT '逻辑',
  `value` varchar(100) DEFAULT NULL COMMENT '对应值',
  `values` varchar(50) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL COMMENT '人员ID',
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `explain` varchar(50) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jntxfb_word`
-- ----------------------------
DROP TABLE IF EXISTS `jntxfb_word`;
CREATE TABLE `jntxfb_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) DEFAULT NULL COMMENT '类别',
  `typeid` smallint(6) DEFAULT '0',
  `adddt` datetime DEFAULT NULL,
  `fileid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0' COMMENT '排序号',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `filesizecn` varchar(20) DEFAULT NULL COMMENT '文件大小',
  `fileext` varchar(20) DEFAULT NULL COMMENT '文档类型',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `shatename` varchar(200) DEFAULT NULL COMMENT '共享给',
  `shateuid` varchar(200) DEFAULT NULL,
  `atype` tinyint(4) DEFAULT '0' COMMENT '@0|内部,1|个人',
  `optid` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `jntxfb_admin` VALUES ('1','admin','雨中磐石','管理员','e10adc3949ba59abbe56e057f20f883e',NULL,'282','1','男','1582233','admin@rockoa.com','2016-07-18 15:22:04','管理员','1','upload/2015-08/1440578146698_4091.jpg','0','1','我的英文名是？','rainrock','511','14','科长','4','[1],[4]','财务科',NULL,NULL,NULL,'0',NULL,'1988-12-02','11111',NULL,NULL,NULL,NULL,'厦门','厦门',NULL,NULL,'管理员','10086','汉族','中专',NULL,'15800000','厦门','2015-01-01','2015-08-15','2015-08-01','计算机',NULL,NULL,NULL,NULL,NULL,'1','1',NULL,'科长,系统管理员',NULL,'1','1',NULL,NULL,'2015-01-01','B型','党员','0','2016-01-02 17:19:08','867112020521204','2016-03-02 16:02:11','1','1','chenxihu829','22222'), ('2','rockoa','客服','管理员１','101ed0b1c565aac0f93c9d51c2cc622d',NULL,'61','1','男',NULL,'admin@rockoa.com','2016-06-24 11:27:52','管理员','1','upload/2015-08/24_1510166137.png',NULL,'1',NULL,NULL,'51','16','科长','5','[1],[5]','材料科',NULL,NULL,NULL,'1',NULL,'1993-12-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'汉族','大专',NULL,NULL,NULL,'2014-12-09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','1',NULL,'科长,系统管理员',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0','2015-08-14 09:53:23','867112020521204','2015-10-23 09:32:28','0','1',NULL,NULL), ('3','diaochan',NULL,'貂蝉','e10adc3949ba59abbe56e057f20f883e',NULL,'52','1','女','0592-222','diaochan@rockoa.com','2016-06-24 11:28:39','管理员','1','upload/2015-08/02_2246506417_crop8455.jpg','0','1',NULL,NULL,'0','15','账务人员','4','[1],[4]','财务科',NULL,NULL,NULL,'11',NULL,'1987-11-22','36555',NULL,'0595-',NULL,NULL,'三国','三国时期',NULL,NULL,'吕布','10085','回民','博士后','未婚','1580000','三国户口','2014-12-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'222','4','2',NULL,'科目负责人',NULL,'1','1',NULL,NULL,'2015-04-28','A型','群众','1','2016-01-29 12:34:46','867112020521204','2016-03-02 15:35:50','0','1',NULL,NULL), ('4','daqiao',NULL,'大乔','e10adc3949ba59abbe56e057f20f883e',NULL,'6','1','女',NULL,'daqiao@rockoa.com','2016-06-24 11:28:21','管理员','1',NULL,'0','1',NULL,NULL,'0','32','副段长','8','[8]','张副段长办公室',NULL,NULL,NULL,'10',NULL,'1968-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'汉族','初中',NULL,NULL,NULL,'2015-01-19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','1',NULL,'副段长',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0','2015-12-12 12:51:10','867112020521204','2016-03-02 13:28:41','0','1',NULL,NULL), ('5','xiaoqiao',NULL,'小乔','e10adc3949ba59abbe56e057f20f883e',NULL,'34','1','女',NULL,'xiaoqiao@rockoa.com','2016-06-24 11:29:18','管理员','1','upload/2015-08/30_1448539797_crop9267.jpg','1','1',NULL,NULL,'0','17','科目负责人１','5','[1],[5]','材料科',NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','1',NULL,'科目负责人',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0','2015-10-12 10:51:29','867112020521204','2016-01-07 22:08:13','0','1',NULL,NULL), ('6','liu1',NULL,'刘长','e10adc3949ba59abbe56e057f20f883e',NULL,'3','1','男',NULL,NULL,'2016-06-26 15:24:45','管理员','1',NULL,NULL,'1',NULL,NULL,'0','33','副段长','3','[3]','赵副段长办公室','管理员１','2','[2]','22',NULL,'1990-02-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'汉族','本科',NULL,NULL,NULL,'2015-02-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','1',NULL,'副段长','2015-02-28','1','1',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'0','1',NULL,NULL), ('7','liubei',NULL,'刘备','e10adc3949ba59abbe56e057f20f883e','2015-01-06 13:40:48','6','1','男','12','liubei@rockoa.com','2016-06-24 11:28:09','管理员','1',NULL,'3','1',NULL,NULL,'0','31','段长','7','[7]','段长办公室',NULL,NULL,NULL,'2',NULL,'1991-09-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'回民','初中',NULL,NULL,NULL,'2015-02-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','1',NULL,'段长',NULL,'1','1','daib,gong|zxkq,work,todo',NULL,NULL,NULL,NULL,'0','2015-08-19 14:41:20','867112020521204','2016-01-30 10:59:40','0','1',NULL,NULL), ('8','zhangfei',NULL,'张飞','e10adc3949ba59abbe56e057f20f883e','2015-02-06 09:41:01','0','1','男',NULL,'chenxihu@rockoa.com','2016-06-24 11:29:31','管理员','1',NULL,NULL,'1',NULL,NULL,'0','30','科目负责人2','5','[1],[5]','材料科',NULL,NULL,NULL,'23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','2',NULL,'科目负责人',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0','2015-05-29 21:44:58',NULL,NULL,'0','1',NULL,NULL), ('9','zhaozl',NULL,'赵子龙','e10adc3949ba59abbe56e057f20f883e','2015-02-06 09:44:39','6','1','男',NULL,'zhaozl@rockoa.com','2016-07-27 15:32:21','管理员','1',NULL,NULL,'1',NULL,NULL,'0','18','科长','6','[1],[6]','完全科','大乔','4','[4]','24',NULL,NULL,'13123123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9','1',NULL,'科长',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0','2016-01-05 22:57:13','867112020521204','2015-10-23 10:30:37','0','1',NULL,'312312312'), ('10','lvbu',NULL,'吕布','e10adc3949ba59abbe56e057f20f883e','2015-08-02 00:03:12','7','1','男',NULL,'lvbu@rockoa.com','2016-06-24 11:30:04','管理员','1',NULL,NULL,'1',NULL,NULL,'0','22','车间主任','10','[9],[10]','西城车间',NULL,NULL,NULL,'25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'158***',NULL,'2015-08-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10','2',NULL,'车间主任',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,'0',NULL,'867112020521204','2016-03-01 09:08:56','0','1',NULL,NULL);
INSERT INTO `jntxfb_assetm` VALUES ('1','电脑','这是一个电脑','DN-0001','联想','12','购入',NULL,NULL,'仓库一','已报废','报废啦？1','管理员','2015-04-13 16:34:49','2016-04-28 19:39:37','2015-10-30','6000','1','1','1'), ('2','笔记本','2112','BJB-0001','联想','M300','购入',NULL,NULL,'仓库二','维修中','2121','管理员','2015-04-13 16:52:33','2016-04-27 22:11:40','2016-04-27',NULL,'1','0','1'), ('3','笔记本','笔记本','BJB-0002','戴尔',NULL,'自建',NULL,NULL,'仓库二','借出','哈哈','管理员','2015-04-13 17:03:52','2015-06-30 17:32:49',NULL,NULL,'1','0','1'), ('4','笔记本','这是不笔记本','BJB-0003','dell','I5 60G内存','购入',NULL,NULL,'仓库一','闲置','呵呵','管理员','2015-04-14 11:08:51','2015-07-13 20:09:24',NULL,NULL,'1','0','1'), ('5','笔记本','这是一个笔记本','BJB-004','联想','006','购入',NULL,NULL,'仓库一','在用',NULL,'管理员',NULL,'2016-04-27 22:42:51','2016-04-01','500','1','1','1');
INSERT INTO `jntxfb_assets` VALUES ('1','1','管理员','2015-04-14 10:29:30','已报废','hahaha'), ('2','1','管理员','2015-04-14 10:37:45','已报废','233232'), ('3','2','管理员','2015-04-14 10:47:21','借出','借给了刘备'), ('4','2','管理员','2015-04-14 10:47:56','闲置','刘备已归还，现在闲置'), ('5','2','管理员','2015-04-14 10:59:41','维修中','坏掉了，去修了'), ('6','3','管理员','2015-10-30 09:45:07','借出','借给了程序员');
INSERT INTO `jntxfb_budget` VALUES ('1','2015年度预算','2015','2015-01-01 00:00:00','0'), ('3','2016年度预算','2016','2016-07-01 10:56:56','1'), ('4','2017年度预算','2017','2016-07-01 10:57:14','0');
INSERT INTO `jntxfb_budgetmonnum` VALUES ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'), ('10'), ('11'), ('12');
INSERT INTO `jntxfb_budgetmonth` VALUES ('193','3','1','5','2','1','93.58','121.00'), ('194','3','1','5','2','2','93.58','13.00'), ('195','3','1','5','2','3','93.58','143.00'), ('196','3','1','5','2','4','93.58',NULL), ('197','3','1','5','2','5','93.58',NULL), ('198','3','1','5','2','6','93.58',NULL), ('199','3','1','5','2','7','93.58',NULL), ('200','3','1','5','2','8','93.58',NULL), ('201','3','1','5','2','9','93.58',NULL), ('202','3','1','5','2','10','93.58',NULL), ('203','3','1','5','2','11','93.58',NULL), ('204','3','1','5','2','12','93.58',NULL), ('205','3','4','5','3','1','444.42',NULL), ('206','3','4','5','3','2','444.42',NULL), ('207','3','4','5','3','3','444.42',NULL), ('208','3','4','5','3','4','444.42',NULL), ('209','3','4','5','3','5','444.42',NULL), ('210','3','4','5','3','6','444.42',NULL), ('211','3','4','5','3','7','444.42',NULL), ('212','3','4','5','3','8','444.42',NULL), ('213','3','4','5','3','9','444.42',NULL), ('214','3','4','5','3','10','444.42',NULL), ('215','3','4','5','3','11','444.42',NULL), ('216','3','4','5','3','12','444.42',NULL), ('217','3','11','6','3','1','194.33',NULL), ('218','3','11','6','3','2','194.33',NULL), ('219','3','11','6','3','3','194.33',NULL), ('220','3','11','6','3','4','194.33',NULL), ('221','3','11','6','3','5','194.33',NULL), ('222','3','11','6','3','6','194.33',NULL), ('223','3','11','6','3','7','194.33',NULL), ('224','3','11','6','3','8','194.33',NULL), ('225','3','11','6','3','9','194.33',NULL), ('226','3','11','6','3','10','194.33',NULL), ('227','3','11','6','3','11','194.33',NULL), ('228','3','11','6','3','12','194.33',NULL), ('229','3','24','2','1','1','0.58',NULL), ('230','3','24','2','1','2','0.58',NULL), ('231','3','24','2','1','3','0.58',NULL), ('232','3','24','2','1','4','0.58',NULL), ('233','3','24','2','1','5','0.58',NULL), ('234','3','24','2','1','6','0.58',NULL), ('235','3','24','2','1','7','0.58',NULL), ('236','3','24','2','1','8','0.58',NULL), ('237','3','24','2','1','9','0.58',NULL), ('238','3','24','2','1','10','0.58',NULL), ('239','3','24','2','1','11','0.58',NULL), ('240','3','24','2','1','12','0.58',NULL), ('241','3','25','2','2','1','0.50',NULL), ('242','3','25','2','2','2','0.50',NULL), ('243','3','25','2','2','3','0.50',NULL), ('244','3','25','2','2','4','0.50',NULL), ('245','3','25','2','2','5','0.50',NULL), ('246','3','25','2','2','6','0.50',NULL), ('247','3','25','2','2','7','0.50',NULL), ('248','3','25','2','2','8','0.50',NULL), ('249','3','25','2','2','9','0.50',NULL), ('250','3','25','2','2','10','0.50',NULL), ('251','3','25','2','2','11','0.50',NULL), ('252','3','25','2','2','12','0.50',NULL), ('253','3','26','2','3','1','0.33',NULL), ('254','3','26','2','3','2','0.33',NULL), ('255','3','26','2','3','3','0.33',NULL), ('256','3','26','2','3','4','0.33',NULL), ('257','3','26','2','3','5','0.33',NULL), ('258','3','26','2','3','6','0.33',NULL), ('259','3','26','2','3','7','0.33',NULL), ('260','3','26','2','3','8','0.33',NULL), ('261','3','26','2','3','9','0.33',NULL), ('262','3','26','2','3','10','0.33',NULL), ('263','3','26','2','3','11','0.33',NULL), ('264','3','26','2','3','12','0.33',NULL), ('265','3','27','2','4','1','0.50',NULL), ('266','3','27','2','4','2','0.50',NULL), ('267','3','27','2','4','3','0.50',NULL), ('268','3','27','2','4','4','0.50',NULL), ('269','3','27','2','4','5','0.50',NULL), ('270','3','27','2','4','6','0.50',NULL), ('271','3','27','2','4','7','0.50',NULL), ('272','3','27','2','4','8','0.50',NULL), ('273','3','27','2','4','9','0.50',NULL), ('274','3','27','2','4','10','0.50',NULL), ('275','3','27','2','4','11','0.50',NULL), ('276','3','27','2','4','12','0.50',NULL), ('277','3','28','2','5','1','0.33',NULL), ('278','3','28','2','5','2','0.33',NULL), ('279','3','28','2','5','3','0.33',NULL), ('280','3','28','2','5','4','0.33',NULL), ('281','3','28','2','5','5','0.33',NULL), ('282','3','28','2','5','6','0.33',NULL), ('283','3','28','2','5','7','0.33',NULL), ('284','3','28','2','5','8','0.33',NULL), ('285','3','28','2','5','9','0.33',NULL), ('286','3','28','2','5','10','0.33',NULL), ('287','3','28','2','5','11','0.33',NULL), ('288','3','28','2','5','12','0.33',NULL), ('289','3','29','2','6','1','2.67',NULL), ('290','3','29','2','6','2','2.67',NULL), ('291','3','29','2','6','3','2.67',NULL), ('292','3','29','2','6','4','2.67',NULL);
INSERT INTO `jntxfb_budgetmonth` VALUES ('293','3','29','2','6','5','2.67',NULL), ('294','3','29','2','6','6','2.67',NULL), ('295','3','29','2','6','7','2.67',NULL), ('296','3','29','2','6','8','2.67',NULL), ('297','3','29','2','6','9','2.67',NULL), ('298','3','29','2','6','10','2.67',NULL), ('299','3','29','2','6','11','2.67',NULL), ('300','3','29','2','6','12','2.67',NULL), ('301','3','30','4','1','1','0.08',NULL), ('302','3','30','4','1','2','0.08',NULL), ('303','3','30','4','1','3','0.08',NULL), ('304','3','30','4','1','4','0.08',NULL), ('305','3','30','4','1','5','0.08',NULL), ('306','3','30','4','1','6','0.08',NULL), ('307','3','30','4','1','7','0.08',NULL), ('308','3','30','4','1','8','0.08',NULL), ('309','3','30','4','1','9','0.08',NULL), ('310','3','30','4','1','10','0.08',NULL), ('311','3','30','4','1','11','0.08',NULL), ('312','3','30','4','1','12','0.08',NULL), ('313','3','31','4','2','1','0.17',NULL), ('314','3','31','4','2','2','0.17',NULL), ('315','3','31','4','2','3','0.17',NULL), ('316','3','31','4','2','4','0.17',NULL), ('317','3','31','4','2','5','0.17',NULL), ('318','3','31','4','2','6','0.17',NULL), ('319','3','31','4','2','7','0.17',NULL), ('320','3','31','4','2','8','0.17',NULL), ('321','3','31','4','2','9','0.17',NULL), ('322','3','31','4','2','10','0.17',NULL), ('323','3','31','4','2','11','0.17',NULL), ('324','3','31','4','2','12','0.17',NULL), ('325','3','32','4','3','1','0.17','77.00'), ('326','3','32','4','3','2','0.17','44.00'), ('327','3','32','4','3','3','0.17','55.00'), ('328','3','32','4','3','4','0.17',NULL), ('329','3','32','4','3','5','0.17',NULL), ('330','3','32','4','3','6','0.17',NULL), ('331','3','32','4','3','7','0.17',NULL), ('332','3','32','4','3','8','0.17',NULL), ('333','3','32','4','3','9','0.17',NULL), ('334','3','32','4','3','10','0.17',NULL), ('335','3','32','4','3','11','0.17',NULL), ('336','3','32','4','3','12','0.17',NULL), ('337','3','33','4','4','1','0.17',NULL), ('338','3','33','4','4','2','0.17',NULL), ('339','3','33','4','4','3','0.17',NULL), ('340','3','33','4','4','4','0.17',NULL), ('341','3','33','4','4','5','0.17',NULL), ('342','3','33','4','4','6','0.17',NULL), ('343','3','33','4','4','7','0.17',NULL), ('344','3','33','4','4','8','0.17',NULL), ('345','3','33','4','4','9','0.17',NULL), ('346','3','33','4','4','10','0.17',NULL), ('347','3','33','4','4','11','0.17',NULL), ('348','3','33','4','4','12','0.17',NULL), ('349','3','34','4','5','1','0.08',NULL), ('350','3','34','4','5','2','0.08',NULL), ('351','3','34','4','5','3','0.08',NULL), ('352','3','34','4','5','4','0.08',NULL), ('353','3','34','4','5','5','0.08',NULL), ('354','3','34','4','5','6','0.08',NULL), ('355','3','34','4','5','7','0.08',NULL), ('356','3','34','4','5','8','0.08',NULL), ('357','3','34','4','5','9','0.08',NULL), ('358','3','34','4','5','10','0.08',NULL), ('359','3','34','4','5','11','0.08',NULL), ('360','3','34','4','5','12','0.08',NULL), ('361','3','35','4','6','1','1.92',NULL), ('362','3','35','4','6','2','1.92',NULL), ('363','3','35','4','6','3','1.92',NULL), ('364','3','35','4','6','4','1.92',NULL), ('365','3','35','4','6','5','1.92',NULL), ('366','3','35','4','6','6','1.92',NULL), ('367','3','35','4','6','7','1.92',NULL), ('368','3','35','4','6','8','1.92',NULL), ('369','3','35','4','6','9','1.92',NULL), ('370','3','35','4','6','10','1.92',NULL), ('371','3','35','4','6','11','1.92',NULL), ('372','3','35','4','6','12','1.92',NULL), ('373','3','36','4','7','1','0.33',NULL), ('374','3','36','4','7','2','0.33',NULL), ('375','3','36','4','7','3','0.33',NULL), ('376','3','36','4','7','4','0.33',NULL), ('377','3','36','4','7','5','0.33',NULL), ('378','3','36','4','7','6','0.33',NULL), ('379','3','36','4','7','7','0.33',NULL), ('380','3','36','4','7','8','0.33',NULL), ('381','3','36','4','7','9','0.33',NULL), ('382','3','36','4','7','10','0.33',NULL), ('383','3','36','4','7','11','0.33',NULL), ('384','3','36','4','7','12','0.33',NULL), ('385','3','72','10','8','1','416.67',NULL), ('386','3','72','10','8','2','416.67',NULL), ('387','3','72','10','8','3','416.67',NULL), ('388','3','72','10','8','4','416.67',NULL), ('389','3','72','10','8','5','416.67',NULL), ('390','3','72','10','8','6','416.67',NULL), ('391','3','72','10','8','7','416.67',NULL), ('392','3','72','10','8','8','416.67',NULL);
INSERT INTO `jntxfb_budgetmonth` VALUES ('393','3','72','10','8','9','416.67',NULL), ('394','3','72','10','8','10','416.67',NULL), ('395','3','72','10','8','11','416.67',NULL), ('396','3','72','10','8','12','416.67',NULL), ('397','3','71','10','7','1','416.67',NULL), ('398','3','71','10','7','2','416.67',NULL), ('399','3','71','10','7','3','416.67',NULL), ('400','3','71','10','7','4','416.67',NULL), ('401','3','71','10','7','5','416.67',NULL), ('402','3','71','10','7','6','416.67',NULL), ('403','3','71','10','7','7','416.67',NULL), ('404','3','71','10','7','8','416.67',NULL), ('405','3','71','10','7','9','416.67',NULL), ('406','3','71','10','7','10','416.67',NULL), ('407','3','71','10','7','11','416.67',NULL), ('408','3','71','10','7','12','416.67',NULL), ('409','3','70','10','6','1','416.67',NULL), ('410','3','70','10','6','2','416.67',NULL), ('411','3','70','10','6','3','416.67',NULL), ('412','3','70','10','6','4','416.67',NULL), ('413','3','70','10','6','5','416.67',NULL), ('414','3','70','10','6','6','416.67',NULL), ('415','3','70','10','6','7','416.67',NULL), ('416','3','70','10','6','8','416.67',NULL), ('417','3','70','10','6','9','416.67',NULL), ('418','3','70','10','6','10','416.67',NULL), ('419','3','70','10','6','11','416.67',NULL), ('420','3','70','10','6','12','416.67',NULL), ('421','3','69','10','5','1','1.00',NULL), ('422','3','69','10','5','2','1.00',NULL), ('423','3','69','10','5','3','1.00',NULL), ('424','3','69','10','5','4','1.00',NULL), ('425','3','69','10','5','5','1.00',NULL), ('426','3','69','10','5','6','1.00',NULL), ('427','3','69','10','5','7','1.00',NULL), ('428','3','69','10','5','8','1.00',NULL), ('429','3','69','10','5','9','1.00',NULL), ('430','3','69','10','5','10','1.00',NULL), ('431','3','69','10','5','11','1.00',NULL), ('432','3','69','10','5','12','1.00',NULL), ('433','3','68','10','4','1','1.00',NULL), ('434','3','68','10','4','2','1.00',NULL), ('435','3','68','10','4','3','1.00',NULL), ('436','3','68','10','4','4','1.00',NULL), ('437','3','68','10','4','5','1.00',NULL), ('438','3','68','10','4','6','1.00',NULL), ('439','3','68','10','4','7','1.00',NULL), ('440','3','68','10','4','8','1.00',NULL), ('441','3','68','10','4','9','1.00',NULL), ('442','3','68','10','4','10','1.00',NULL), ('443','3','68','10','4','11','1.00',NULL), ('444','3','68','10','4','12','1.00',NULL), ('445','3','67','10','3','1','15.00',NULL), ('446','3','67','10','3','2','15.00',NULL), ('447','3','67','10','3','3','15.00',NULL), ('448','3','67','10','3','4','15.00',NULL), ('449','3','67','10','3','5','15.00',NULL), ('450','3','67','10','3','6','15.00',NULL), ('451','3','67','10','3','7','15.00',NULL), ('452','3','67','10','3','8','15.00',NULL), ('453','3','67','10','3','9','15.00',NULL), ('454','3','67','10','3','10','15.00','66.00'), ('455','3','67','10','3','11','15.00','33.00'), ('456','3','67','10','3','12','15.00',NULL), ('457','3','66','10','2','1','833.33',NULL), ('458','3','66','10','2','2','833.33',NULL), ('459','3','66','10','2','3','833.33',NULL), ('460','3','66','10','2','4','833.33',NULL), ('461','3','66','10','2','5','833.33',NULL), ('462','3','66','10','2','6','833.33',NULL), ('463','3','66','10','2','7','833.33',NULL), ('464','3','66','10','2','8','833.33',NULL), ('465','3','66','10','2','9','833.33',NULL), ('466','3','66','10','2','10','833.33',NULL), ('467','3','66','10','2','11','833.33',NULL), ('468','3','66','10','2','12','833.33',NULL), ('469','3','65','10','1','1','16.00',NULL), ('470','3','65','10','1','2','16.00',NULL), ('471','3','65','10','1','3','16.00',NULL), ('472','3','65','10','1','4','16.00',NULL), ('473','3','65','10','1','5','16.00',NULL), ('474','3','65','10','1','6','16.00',NULL), ('475','3','65','10','1','7','16.00',NULL), ('476','3','65','10','1','8','16.00',NULL), ('477','3','65','10','1','9','16.00',NULL), ('478','3','65','10','1','10','16.00',NULL), ('479','3','65','10','1','11','16.00',NULL), ('480','3','65','10','1','12','16.00',NULL);
INSERT INTO `jntxfb_budgetyear` VALUES ('1','3','5','2','1123.00','111.00'), ('4','3','5','3','1333.00',NULL), ('11','3','6','3','1332.00','333.00'), ('24','3','2','1','447.00',NULL), ('25','3','2','2','556.00',NULL), ('26','3','2','3','774.01','222.00'), ('27','3','2','4','1236.00',NULL), ('28','3','2','5','544.00',NULL), ('29','3','2','6','632.00',NULL), ('30','3','4','1','1231.00',NULL), ('31','3','4','2','222.00','3.00'), ('32','3','4','3','552.00','4.00'), ('33','3','4','4','1500.00','3155.00'), ('34','3','4','5','651.00',NULL), ('35','3','4','6','723.00',NULL), ('36','3','4','7','874.00',NULL), ('65','3','10','1','1000.00',NULL), ('66','3','10','2','1000.00',NULL), ('67','3','10','3','1200.00','345.00'), ('68','3','10','4','1000.00',NULL), ('69','3','10','5','1300.00',NULL), ('70','3','10','6','1000.00',NULL), ('71','3','10','7','1000.00',NULL), ('72','3','10','8','1000.00',NULL), ('73','1','10','7','1154.00',NULL), ('75','3','7','1','22.00',NULL), ('76','3','7','37','99999999.99',NULL);
INSERT INTO `jntxfb_careserve` VALUES ('1','1','2015-09-23 16:54:19','1','管理员','2015-09-23','呵呵呵呵','1','1',NULL,'7,5','1','小乔',NULL,'u4,u3','大乔,貂蝉','0','2015-09-23 15:00:00','2015-09-23 16:00:00','漳州','2','闽D·123456','G15-S30','1','管理员',NULL,NULL), ('2','1','2015-09-23 16:54:08','1','管理员','2015-09-23',NULL,'1','1',NULL,'7,5','1','小乔',NULL,'u4,u3','大乔,貂蝉','2','2015-09-25 15:30:00','2015-09-25 16:13:00','安溪','2','闽D·123456','同安S206','4,3','大乔,貂蝉',NULL,NULL), ('3','1','2016-03-07 21:02:32','1','管理员','2016-03-07',NULL,'0','1','7','7,5','0',NULL,'刘备','u7','刘备','1','2016-03-07 20:56:00','2016-03-08 20:56:00','不知道','2','闽D·123456','嗯嗯','1','管理员',NULL,NULL), ('4','1','2016-04-28 20:29:14','1','管理员','2016-04-28',NULL,'0','1','7','7,5','0',NULL,'刘备',NULL,'RockOA开发团队','12','2016-04-28 20:28:00','2016-04-29 20:28:00','12','2','闽D·123456','12',NULL,'刘备',NULL,NULL);
INSERT INTO `jntxfb_carm` VALUES ('1','闽D·123QB','奥迪','N7','小型车','2015-09-01','20000','不知道','1','2016-04-28 19:36:09','1','管理员','2015-09-16 10:51:56','管理员',NULL,'可用',NULL,'2015-09-01',NULL,NULL,'2016-08-31',NULL,NULL,NULL,NULL,'1','1'), ('2','闽D·123456','奔驰','A4L','轿车','2015-01-01','20000',NULL,'1','2016-04-28 19:36:27','1','管理员','2015-09-17 09:54:49','管理员',NULL,'可用','aodiche',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1');
INSERT INTO `jntxfb_cars` VALUES ('1','1','管理员','2015-09-16 15:33:02','state','状态','废了','报废'), ('3','1','管理员','2015-09-16 15:40:33','state','状态','嘿嘿','报废'), ('4','1','管理员','2015-09-16 15:46:40','qxstartdt','强险开始日期',NULL,'2015-09-01'), ('5','1','管理员','2015-09-17 09:49:22','jymoney','加油费',NULL,'50'), ('6','1','管理员','2015-09-24 10:43:35','state','状态',NULL,'可用'), ('7','1','管理员','2015-09-24 10:43:50','xszenddt','行驶证截止日期',NULL,'2016-08-31');
INSERT INTO `jntxfb_chargemode` VALUES ('170','7','系统核心模块','2016-03-30 20:25:29','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-03-30 20:21:12','25'), ('171','10','系统插件库','2016-03-30 20:25:33','ZGExZTMxNTQ3MTRlNGU2MmIyMTAzOTIwNjQ3NDM3ZDE:','管理员','2016-03-30 20:09:29','9'), ('172','11','系统M模型库','2016-03-30 20:25:37','MDk2YjZlMGFlNDg2YTBmZDZlMDA3NWU0MmU0ZGQxYWE:','管理员','2016-03-30 20:09:29','15'), ('173','13','用户组组织结构菜单权限','2016-03-30 20:25:40','MTg0MjMxM2I4ODY4YWI4NjM4Y2UxNTE5YjlhZjRiOTU:','管理员','2016-03-30 20:20:27','9'), ('174','12','系统登录主界面','2016-03-30 20:25:44','MmRlZjA3YWZjNGU5NGNmZDI0OWFjZDBjYzRjMTU3OGQ:','管理员','2016-03-30 20:21:12','22'), ('177','4','模块安装升级','2016-03-30 20:26:03','NGJlYzk0NGJhZGZlMmM0YzU3YzVmZTI2ZWU0NTZiNWY:','管理员','2016-03-30 20:21:12','36'), ('179','9','流程配置管理','2016-03-30 20:26:40','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-03-30 20:21:12','20'), ('180','14','人员档案管理','2016-03-30 20:26:45','ODkwOGVlOWZjNGYyNjczNDMzYjU5ODUwNGRjOTE5MTk:','管理员','2016-03-30 20:20:07','7'), ('181','15','定时任务','2016-03-30 20:26:49','YWFkMTYyZDM0ZDVkZTI2YTk2MWMwYmFhM2Q0MjhkZDE:','管理员','2016-03-30 20:20:07','8'), ('182','16','考勤系统','2016-03-30 20:26:54','ZDRlN2IzZDU0ZDMyZmZkNGU1OWI0MjFhNTVhMjdjYzc:','管理员','2016-03-30 20:20:07','11'), ('183','17','REIM客户端','2016-03-30 20:26:58','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-03-30 20:21:12','7'), ('184','18','行政系统','2016-03-30 20:27:03','YTRlNjM1MWU4OTcxMTQ0OWI3YjJjOWIyYWE3Nzg2MGY:','管理员','2016-03-30 20:11:54','6'), ('185','19','财务系统','2016-03-30 20:27:08','MTA0ZWY1MDljYTk0NTFkMjk3MjU4OTliOTlkZjg3YjQ:','管理员','2016-03-30 20:20:07','6'), ('186','20','公共信息模块','2016-03-30 20:27:13','MjYwMGQ0NzJiZWUzOTU1MjQ1YjdiMjNjNjk0MmNiOTA:','管理员','2016-03-30 20:20:07','7'), ('187','7','系统核心模块','2016-04-12 21:13:55','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-04-12 21:08:32','26'), ('188','11','系统M模型库','2016-04-12 21:14:00','MDk2YjZlMGFlNDg2YTBmZDZlMDA3NWU0MmU0ZGQxYWE:','管理员','2016-04-12 21:08:32','17'), ('189','13','用户组组织结构菜单权限','2016-04-12 21:14:04','MTg0MjMxM2I4ODY4YWI4NjM4Y2UxNTE5YjlhZjRiOTU:','管理员','2016-04-12 21:08:32','11'), ('190','12','系统登录主界面','2016-04-12 21:14:12','MmRlZjA3YWZjNGU5NGNmZDI0OWFjZDBjYzRjMTU3OGQ:','管理员','2016-04-12 21:08:32','23'), ('193','9','流程配置管理','2016-04-12 21:15:02','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-04-12 21:08:32','25'), ('194','15','定时任务','2016-04-12 21:15:08','YWFkMTYyZDM0ZDVkZTI2YTk2MWMwYmFhM2Q0MjhkZDE:','管理员','2016-04-12 21:08:32','9'), ('195','16','考勤系统','2016-04-12 21:15:40','ZDRlN2IzZDU0ZDMyZmZkNGU1OWI0MjFhNTVhMjdjYzc:','管理员','2016-04-12 21:08:32','13'), ('196','17','REIM客户端','2016-04-12 21:15:45','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-12 21:08:32','9'), ('197','18','行政系统','2016-04-12 21:15:50','YTRlNjM1MWU4OTcxMTQ0OWI3YjJjOWIyYWE3Nzg2MGY:','管理员','2016-04-12 21:08:32','7'), ('198','20','公共信息模块','2016-04-12 21:15:55','MjYwMGQ0NzJiZWUzOTU1MjQ1YjdiMjNjNjk0MmNiOTA:','管理员','2016-04-12 21:08:32','9'), ('199','7','系统核心模块','2016-04-12 21:30:05','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-04-12 21:28:53','27'), ('200','7','系统核心模块','2016-04-20 19:49:40','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-04-20 19:45:44','28'), ('201','10','系统插件库','2016-04-20 19:49:47','ZGExZTMxNTQ3MTRlNGU2MmIyMTAzOTIwNjQ3NDM3ZDE:','管理员','2016-04-20 19:45:44','10'), ('202','11','系统M模型库','2016-04-20 19:49:52','MDk2YjZlMGFlNDg2YTBmZDZlMDA3NWU0MmU0ZGQxYWE:','管理员','2016-04-20 19:45:44','19'), ('203','13','用户组组织结构菜单权限','2016-04-20 19:49:59','MTg0MjMxM2I4ODY4YWI4NjM4Y2UxNTE5YjlhZjRiOTU:','管理员','2016-04-20 19:45:44','12'), ('205','9','流程配置管理','2016-04-20 19:50:54','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-04-20 19:45:44','26'), ('206','14','人员档案管理','2016-04-20 19:51:00','ODkwOGVlOWZjNGYyNjczNDMzYjU5ODUwNGRjOTE5MTk:','管理员','2016-04-20 19:45:44','8'), ('207','15','定时任务','2016-04-20 19:51:08','YWFkMTYyZDM0ZDVkZTI2YTk2MWMwYmFhM2Q0MjhkZDE:','管理员','2016-04-20 19:45:44','10'), ('208','16','考勤系统','2016-04-20 19:51:14','ZDRlN2IzZDU0ZDMyZmZkNGU1OWI0MjFhNTVhMjdjYzc:','管理员','2016-04-20 19:45:44','14'), ('209','17','REIM即时通信','2016-04-20 19:51:26','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-20 19:47:48','12'), ('210','9','流程配置管理','2016-04-20 19:54:01','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-04-20 19:52:35','27'), ('211','17','REIM即时通信','2016-04-20 19:54:15','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-20 19:53:47','14'), ('212','9','流程配置管理','2016-04-20 19:57:31','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-04-20 19:57:16','29'), ('213','17','REIM即时通信','2016-04-20 19:59:19','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-20 19:55:48','16'), ('214','17','REIM即时通信','2016-04-20 20:00:53','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-20 20:00:33','17'), ('215','7','系统核心模块','2016-04-20 22:23:26','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-04-20 22:23:10','29'), ('216','9','流程配置管理','2016-04-20 22:24:00','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-04-20 22:23:15','31'), ('217','17','REIM即时通信','2016-04-20 22:24:08','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-04-20 22:23:10','18'), ('218','7','系统核心模块','2016-05-08 17:41:50','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-05-08 17:39:08','31'), ('219','10','系统插件库','2016-05-08 17:41:58','ZGExZTMxNTQ3MTRlNGU2MmIyMTAzOTIwNjQ3NDM3ZDE:','管理员','2016-05-08 17:39:08','11'), ('220','11','系统M模型库','2016-05-08 17:42:05','MDk2YjZlMGFlNDg2YTBmZDZlMDA3NWU0MmU0ZGQxYWE:','管理员','2016-05-08 17:39:08','20'), ('221','13','用户组组织结构菜单权限','2016-05-08 17:42:11','MTg0MjMxM2I4ODY4YWI4NjM4Y2UxNTE5YjlhZjRiOTU:','管理员','2016-05-08 17:39:08','14'), ('222','12','系统登录主界面','2016-05-08 17:42:17','MmRlZjA3YWZjNGU5NGNmZDI0OWFjZDBjYzRjMTU3OGQ:','管理员','2016-05-08 17:39:08','24'), ('224','9','流程配置管理','2016-05-08 17:43:08','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-05-08 17:39:08','33'), ('225','15','定时任务','2016-05-08 17:43:22','YWFkMTYyZDM0ZDVkZTI2YTk2MWMwYmFhM2Q0MjhkZDE:','管理员','2016-05-08 17:39:08','11'), ('226','16','考勤系统','2016-05-08 17:43:33','ZDRlN2IzZDU0ZDMyZmZkNGU1OWI0MjFhNTVhMjdjYzc:','管理员','2016-05-08 17:39:08','15'), ('227','17','REIM即时通信','2016-05-08 17:43:44','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-05-08 17:39:08','19'), ('228','18','行政系统','2016-05-08 17:43:52','YTRlNjM1MWU4OTcxMTQ0OWI3YjJjOWIyYWE3Nzg2MGY:','管理员','2016-05-08 17:39:08','9'), ('229','19','财务系统','2016-05-08 17:44:04','MTA0ZWY1MDljYTk0NTFkMjk3MjU4OTliOTlkZjg3YjQ:','管理员','2016-05-08 17:39:08','8'), ('230','20','公共信息模块','2016-05-08 17:44:12','MjYwMGQ0NzJiZWUzOTU1MjQ1YjdiMjNjNjk0MmNiOTA:','管理员','2016-05-08 17:39:08','11'), ('231','19','财务系统','2016-05-08 17:45:59','MTA0ZWY1MDljYTk0NTFkMjk3MjU4OTliOTlkZjg3YjQ:','管理员','2016-05-08 17:45:47','9'), ('232','7','系统核心模块','2016-05-09 20:13:21','NjZjNzIwZWFjYTgwZGFmNmNmYmExN2M3NWRhMGE4OTA:','管理员','2016-05-09 10:04:40','32'), ('233','13','用户组组织结构菜单权限','2016-05-09 20:13:34','MTg0MjMxM2I4ODY4YWI4NjM4Y2UxNTE5YjlhZjRiOTU:','管理员','2016-05-09 10:07:06','15'), ('234','9','流程配置管理','2016-05-09 20:13:49','ZmM1MjcyMWI5ODUyNmQwNDc2ZjI0ZmI0YTNiNjRkMDk:','管理员','2016-05-09 10:04:11','34'), ('235','8','API接口','2016-05-09 20:14:49','MTYwMGQxY2MzNDQ1NTg5MGY1MDFmMjIxYzNhYmE4ZTc:','管理员','2016-05-08 17:39:08','15'), ('236','17','REIM即时通信','2016-05-09 20:15:21','MjdkYTI5NDc2MWY0ODBhNjg3NWYzYjBkZjYwODYzNTg:','管理员','2016-05-09 13:27:36','20'), ('237','19','财务系统','2016-05-09 20:15:37','MTA0ZWY1MDljYTk0NTFkMjk3MjU4OTliOTlkZjg3YjQ:','管理员','2016-05-09 10:06:10','10'), ('238','20','公共信息模块','2016-05-09 20:15:51','MjYwMGQ0NzJiZWUzOTU1MjQ1YjdiMjNjNjk0MmNiOTA:','管理员','2016-05-09 10:06:41','12');
INSERT INTO `jntxfb_chargemodes` VALUES ('42','4','2016-01-16 18:42:35','7','2016-01-20 21:24:45'), ('52','4','2016-02-18 22:55:59','8','2016-02-18 22:56:17'), ('55','7','2016-01-25 13:31:00','32','2016-02-18 22:58:47'), ('56','7','2016-01-25 13:31:11','33','2016-02-18 22:58:47'), ('57','7','2016-01-25 13:31:37','34','2016-02-18 22:58:47'), ('60','7','2016-01-25 13:34:26','37','2016-02-18 22:58:48'), ('63','7','2016-01-26 22:08:42','44','2016-02-18 22:58:49'), ('64','7','2016-01-26 22:08:46','45','2016-02-18 22:58:49'), ('65','7','2016-01-26 22:08:50','46','2016-02-18 22:58:49'), ('67','7','2016-01-26 21:13:16','48','2016-02-18 22:58:49'), ('68','7','2016-02-01 13:36:45','100','2016-02-18 22:58:49'), ('69','10','2016-02-01 13:46:02','101','2016-02-18 22:58:56'), ('72','10','2016-02-01 13:46:22','104','2016-02-18 22:58:57'), ('73','10','2016-02-01 13:46:26','105','2016-02-18 22:58:57'), ('74','10','2016-02-01 13:46:30','106','2016-02-18 22:58:57'), ('75','10','2016-02-01 13:46:34','107','2016-02-18 22:58:57'), ('76','10','2016-02-01 13:46:37','108','2016-02-18 22:58:57'), ('77','10','2016-02-01 13:46:40','109','2016-02-18 22:58:58'), ('78','10','2016-02-01 13:46:44','110','2016-02-18 22:58:58'), ('80','10','2016-02-01 13:46:56','112','2016-02-18 22:58:58'), ('81','10','2016-02-01 13:47:08','113','2016-02-18 22:58:58'), ('82','10','2016-02-01 13:47:13','114','2016-02-18 22:58:58'), ('83','10','2016-02-01 13:47:16','115','2016-02-18 22:58:59'), ('84','10','2016-02-01 13:47:20','116','2016-02-18 22:58:59'), ('87','11','2016-02-01 13:50:31','119','2016-02-18 22:59:05'), ('88','11','2016-02-01 13:50:35','120','2016-02-18 22:59:05'), ('91','11','2016-02-01 13:50:46','123','2016-02-18 22:59:06'), ('93','11','2016-02-01 13:50:52','125','2016-02-18 22:59:06'), ('95','11','2016-02-01 13:51:01','127','2016-02-18 22:59:06'), ('96','11','2016-02-01 13:51:05','128','2016-02-18 22:59:06'), ('97','11','2016-02-01 13:51:08','129','2016-02-18 22:59:06'), ('98','11','2016-02-01 13:51:12','130','2016-02-18 22:59:07'), ('99','11','2016-02-01 13:51:16','131','2016-02-18 22:59:07'), ('100','11','2016-02-01 13:51:20','132','2016-02-18 22:59:07'), ('101','11','2016-02-01 13:51:24','133','2016-02-18 22:59:07'), ('102','11','2016-02-01 13:51:29','134','2016-02-18 22:59:07'), ('104','11','2016-02-01 13:51:40','136','2016-02-18 22:59:07'), ('107','11','2016-02-01 13:51:52','139','2016-02-18 22:59:08'), ('108','11','2016-02-01 13:51:57','140','2016-02-18 22:59:08'), ('109','11','2016-02-01 13:52:01','141','2016-02-18 22:59:08'), ('110','12','2016-02-01 19:27:48','142','2016-02-18 23:01:29'), ('111','12','2016-02-01 19:27:50','143','2016-02-18 23:01:29'), ('112','12','2016-02-01 19:28:00','144','2016-02-18 23:01:29'), ('114','12','2016-02-01 19:28:09','146','2016-02-18 23:01:29'), ('115','12','2016-02-01 19:28:13','147','2016-02-18 23:01:29'), ('116','12','2016-02-01 19:28:17','148','2016-02-18 23:01:29'), ('117','12','2016-02-01 19:28:21','149','2016-02-18 23:01:30'), ('118','12','2016-02-01 19:28:25','150','2016-02-18 23:01:30'), ('119','12','2016-02-01 19:28:29','151','2016-02-18 23:01:30'), ('121','12','2016-02-01 19:28:38','153','2016-02-18 23:01:30'), ('126','12','2016-02-01 19:30:10','158','2016-02-18 23:01:31'), ('129','12','2016-02-01 19:30:28','161','2016-02-18 23:01:31'), ('130','4','2016-02-19 12:41:50','162','2016-02-21 17:44:27'), ('131','10','2016-02-21 17:39:02','111','2016-02-21 17:44:32'), ('133','10','2016-02-22 22:30:34','102','2016-02-22 22:31:41'), ('135','12','2016-02-22 22:28:16','155','2016-02-22 22:31:56'), ('136','12','2016-02-22 22:28:16','156','2016-02-22 22:31:56'), ('140','13','2016-02-23 21:27:42','171','2016-02-23 22:10:59'), ('142','13','2016-02-23 21:27:55','173','2016-02-23 22:11:00'), ('143','13','2016-02-23 21:28:23','174','2016-02-23 22:11:00'), ('144','13','2016-02-23 21:28:30','175','2016-02-23 22:11:00'), ('146','13','2016-02-23 21:30:09','177','2016-02-23 22:11:00'), ('147','13','2016-02-23 21:30:17','178','2016-02-23 22:11:01'), ('148','13','2016-02-23 21:30:37','179','2016-02-23 22:11:01'), ('150','13','2016-02-23 21:30:49','181','2016-02-23 22:11:01'), ('151','13','2016-02-23 21:31:07','182','2016-02-23 22:11:01'), ('152','13','2016-02-23 21:31:13','183','2016-02-23 22:11:02'), ('153','13','2016-02-23 21:31:46','184','2016-02-23 22:11:02'), ('154','13','2016-02-23 21:31:54','185','2016-02-23 22:11:02'), ('155','13','2016-02-23 21:32:33','186','2016-02-23 22:11:02'), ('156','13','2016-02-23 21:32:40','187','2016-02-23 22:11:02'), ('157','13','2016-02-23 21:32:47','188','2016-02-23 22:11:02'), ('158','13','2016-02-23 21:32:57','189','2016-02-23 22:11:03'), ('159','13','2016-02-23 21:33:03','190','2016-02-23 22:11:03'), ('160','13','2016-02-23 21:33:15','191','2016-02-23 22:11:03'), ('161','13','2016-02-23 21:33:36','192','2016-02-23 22:11:03'), ('162','13','2016-02-23 21:33:58','193','2016-02-23 22:11:03'), ('163','13','2016-02-23 21:34:03','194','2016-02-23 22:11:03'), ('164','13','2016-02-23 21:58:43','211','2016-02-23 22:11:04'), ('165','13','2016-02-23 22:04:18','212','2016-02-23 22:11:04'), ('166','12','2016-02-23 21:50:09','195','2016-02-23 22:11:32'), ('167','12','2016-02-23 21:50:09','196','2016-02-23 22:11:32'), ('168','12','2016-02-23 21:50:09','197','2016-02-23 22:11:32'), ('169','12','2016-02-23 21:50:09','198','2016-02-23 22:11:32'), ('170','12','2016-02-23 21:50:09','199','2016-02-23 22:11:33'), ('171','12','2016-02-23 21:50:09','200','2016-02-23 22:11:33'), ('173','12','2016-02-23 21:50:09','202','2016-02-23 22:11:33'), ('174','12','2016-02-23 21:50:09','203','2016-02-23 22:11:33'), ('175','12','2016-02-23 21:50:09','204','2016-02-23 22:11:33'), ('176','12','2016-02-23 21:50:09','205','2016-02-23 22:11:34'), ('177','12','2016-02-23 21:52:37','206','2016-02-23 22:11:34'), ('178','12','2016-02-23 21:52:37','207','2016-02-23 22:11:34'), ('180','12','2016-02-23 21:52:37','209','2016-02-23 22:11:34'), ('199','9','2016-02-23 20:08:52','68','2016-02-23 22:11:52'), ('200','9','2016-02-23 20:08:52','69','2016-02-23 22:11:52'), ('201','9','2016-02-23 20:08:52','70','2016-02-23 22:11:52'), ('202','9','2016-02-23 20:08:52','71','2016-02-23 22:11:52'), ('203','9','2016-02-23 20:08:52','72','2016-02-23 22:11:52'), ('204','9','2016-02-23 20:08:52','73','2016-02-23 22:11:53'), ('205','9','2016-02-23 20:08:52','74','2016-02-23 22:11:53');
INSERT INTO `jntxfb_chargemodes` VALUES ('206','9','2016-02-23 20:08:52','75','2016-02-23 22:11:53'), ('210','9','2016-02-23 20:08:52','79','2016-02-23 22:11:54'), ('211','9','2016-02-23 20:08:52','80','2016-02-23 22:11:54'), ('215','9','2016-02-23 20:08:52','84','2016-02-23 22:11:54'), ('217','9','2016-02-23 20:08:52','167','2016-02-23 22:11:55'), ('238','11','2016-02-24 15:16:59','117','2016-02-26 20:19:39'), ('239','11','2016-02-25 09:00:56','118','2016-02-26 20:19:39'), ('240','13','2016-02-25 09:01:28','169','2016-02-26 20:19:46'), ('241','13','2016-02-25 09:01:28','170','2016-02-26 20:19:46'), ('242','12','2016-02-25 09:02:01','208','2016-02-26 20:19:57'), ('245','15','2016-02-25 21:55:59','218','2016-02-26 20:20:14'), ('246','15','2016-02-25 21:55:59','219','2016-02-26 20:20:14'), ('247','15','2016-02-25 21:55:59','220','2016-02-26 20:20:15'), ('248','15','2016-02-25 21:55:59','221','2016-02-26 20:20:15'), ('249','15','2016-02-25 21:55:59','222','2016-02-26 20:20:15'), ('250','15','2016-02-25 21:55:59','223','2016-02-26 20:20:15'), ('251','15','2016-02-25 21:55:59','224','2016-02-26 20:20:16'), ('252','15','2016-02-25 21:55:59','225','2016-02-26 20:20:16'), ('257','15','2016-02-25 21:55:59','230','2016-02-26 20:20:16'), ('258','15','2016-02-25 21:55:59','231','2016-02-26 20:20:17'), ('259','15','2016-02-25 21:55:59','232','2016-02-26 20:20:17'), ('262','11','2016-03-01 12:55:08','122','2016-03-01 13:35:04'), ('269','9','2016-03-01 12:53:23','76','2016-03-01 13:35:21'), ('272','15','2016-03-01 12:53:57','226','2016-03-01 13:35:28'), ('273','15','2016-03-01 12:53:57','227','2016-03-01 13:35:28'), ('274','15','2016-03-01 12:53:57','228','2016-03-01 13:35:29'), ('275','15','2016-03-01 12:53:57','229','2016-03-01 13:35:29'), ('276','14','2016-03-01 12:59:02','213','2016-03-01 13:35:33'), ('277','14','2016-03-01 12:59:02','214','2016-03-01 13:35:33'), ('278','14','2016-03-01 12:59:02','215','2016-03-01 13:35:33'), ('279','14','2016-03-01 12:59:02','216','2016-03-01 13:35:33'), ('281','14','2016-03-01 12:59:02','234','2016-03-01 13:35:35'), ('282','14','2016-03-01 12:59:02','235','2016-03-01 13:35:35'), ('283','12','2016-03-02 09:35:44','145','2016-03-02 09:36:00'), ('288','16','2016-03-02 16:08:58','236','2016-03-02 16:10:12'), ('290','16','2016-03-02 16:02:58','238','2016-03-02 16:10:12'), ('291','16','2016-03-02 16:02:58','239','2016-03-02 16:10:12'), ('292','16','2016-03-02 16:02:58','240','2016-03-02 16:10:12'), ('293','16','2016-03-02 16:02:58','241','2016-03-02 16:10:12'), ('294','16','2016-03-02 16:02:58','242','2016-03-02 16:10:12'), ('295','16','2016-03-02 16:02:58','243','2016-03-02 16:10:13'), ('296','16','2016-03-02 16:02:58','244','2016-03-02 16:10:13'), ('297','16','2016-03-02 16:02:58','245','2016-03-02 16:10:13'), ('298','16','2016-03-02 16:02:58','246','2016-03-02 16:10:13'), ('299','16','2016-03-02 16:02:58','247','2016-03-02 16:10:13'), ('300','16','2016-03-02 16:02:58','248','2016-03-02 16:10:13'), ('301','16','2016-03-02 16:02:58','249','2016-03-02 16:10:13'), ('302','16','2016-03-02 16:02:58','250','2016-03-02 16:10:14'), ('303','16','2016-03-02 16:02:58','251','2016-03-02 16:10:14'), ('304','16','2016-03-02 16:02:58','252','2016-03-02 16:10:14'), ('305','16','2016-03-02 16:02:58','253','2016-03-02 16:10:14'), ('306','16','2016-03-02 16:02:58','254','2016-03-02 16:10:14'), ('307','16','2016-03-02 16:02:58','255','2016-03-02 16:10:14'), ('308','16','2016-03-02 16:02:58','256','2016-03-02 16:10:14'), ('309','16','2016-03-02 16:02:58','257','2016-03-02 16:10:14'), ('310','16','2016-03-02 16:02:58','258','2016-03-02 16:10:15'), ('311','16','2016-03-02 16:02:58','259','2016-03-02 16:10:15'), ('312','16','2016-03-02 16:02:58','260','2016-03-02 16:10:15'), ('313','16','2016-03-02 16:02:58','261','2016-03-02 16:10:15'), ('314','16','2016-03-02 16:02:58','262','2016-03-02 16:10:15'), ('315','16','2016-03-02 16:02:58','263','2016-03-02 16:10:15'), ('316','16','2016-03-02 16:02:58','264','2016-03-02 16:10:15'), ('317','16','2016-03-02 16:02:58','265','2016-03-02 16:10:15'), ('318','16','2016-03-02 16:02:58','266','2016-03-02 16:10:16'), ('319','16','2016-03-02 16:02:58','267','2016-03-02 16:10:16'), ('320','16','2016-03-02 16:02:58','268','2016-03-02 16:10:16'), ('321','16','2016-03-02 16:02:58','269','2016-03-02 16:10:16'), ('322','16','2016-03-02 16:02:58','270','2016-03-02 16:10:16'), ('323','16','2016-03-02 16:02:58','271','2016-03-02 16:10:16'), ('324','16','2016-03-02 16:02:58','272','2016-03-02 16:10:16'), ('325','16','2016-03-02 16:02:58','273','2016-03-02 16:10:16'), ('326','16','2016-03-02 16:01:10','274','2016-03-02 16:10:17'), ('327','16','2016-03-02 16:01:13','275','2016-03-02 16:10:18'), ('329','7','2016-03-03 10:18:01','35','2016-03-06 15:42:34'), ('331','9','2016-03-03 10:18:01','78','2016-03-06 15:42:39'), ('333','7','2016-03-08 17:04:04','43','2016-03-09 09:27:18'), ('334','7','2016-03-08 17:04:04','47','2016-03-09 09:27:20'), ('337','13','2016-03-08 17:04:04','172','2016-03-09 09:28:41'), ('338','13','2016-03-08 17:04:04','180','2016-03-09 09:28:43'), ('339','12','2016-03-08 17:04:04','157','2016-03-09 09:28:56'), ('341','12','2016-03-08 17:04:04','201','2016-03-09 09:29:00'), ('342','12','2016-03-09 09:25:59','276','2016-03-09 09:29:02'), ('343','12','2016-03-09 09:25:59','277','2016-03-09 09:29:04'), ('344','12','2016-03-09 09:25:59','278','2016-03-09 09:29:06'), ('345','12','2016-03-09 09:25:59','279','2016-03-09 09:29:08'), ('346','12','2016-03-09 09:25:59','280','2016-03-09 09:29:10'), ('347','12','2016-03-09 09:25:59','354','2016-03-09 09:29:12'), ('351','9','2016-03-09 09:25:59','356','2016-03-09 09:30:22'), ('352','9','2016-03-09 09:25:59','368','2016-03-09 09:30:24'), ('353','9','2016-03-09 09:25:59','369','2016-03-09 09:30:26'), ('354','9','2016-03-09 09:25:59','370','2016-03-09 09:30:28'), ('355','14','2016-03-08 17:04:04','217','2016-03-09 09:31:52'), ('357','16','2016-03-09 09:25:59','342','2016-03-09 09:32:09'), ('358','16','2016-03-09 09:25:59','345','2016-03-09 09:32:11'), ('359','16','2016-03-09 09:25:59','346','2016-03-09 09:32:13'), ('360','16','2016-03-09 09:25:59','347','2016-03-09 09:32:15'), ('361','16','2016-03-09 09:25:59','348','2016-03-09 09:32:17'), ('362','16','2016-03-09 09:25:59','349','2016-03-09 09:32:20'), ('363','16','2016-03-09 09:25:59','350','2016-03-09 09:32:22'), ('364','16','2016-03-09 09:25:59','351','2016-03-09 09:32:24');
INSERT INTO `jntxfb_chargemodes` VALUES ('365','16','2016-03-09 09:25:59','352','2016-03-09 09:32:26'), ('366','17','2016-03-09 09:25:59','281','2016-03-09 09:32:41'), ('367','17','2016-03-09 09:25:59','282','2016-03-09 09:32:43'), ('368','17','2016-03-09 09:25:59','283','2016-03-09 09:32:45'), ('369','17','2016-03-09 09:25:59','284','2016-03-09 09:32:48'), ('370','17','2016-03-09 09:25:59','285','2016-03-09 09:32:50'), ('371','17','2016-03-09 09:25:59','286','2016-03-09 09:32:52'), ('372','17','2016-03-09 09:25:59','287','2016-03-09 09:32:54'), ('373','17','2016-03-09 09:25:59','288','2016-03-09 09:32:56'), ('374','17','2016-03-09 09:25:59','289','2016-03-09 09:32:58'), ('375','17','2016-03-09 09:25:59','290','2016-03-09 09:33:00'), ('377','17','2016-03-09 09:25:59','292','2016-03-09 09:33:05'), ('378','17','2016-03-09 09:25:59','293','2016-03-09 09:33:07'), ('379','17','2016-03-09 09:25:59','294','2016-03-09 09:33:09'), ('380','17','2016-03-09 09:25:59','295','2016-03-09 09:33:11'), ('381','17','2016-03-09 09:25:59','296','2016-03-09 09:33:13'), ('382','17','2016-03-09 09:25:59','297','2016-03-09 09:33:15'), ('383','17','2016-03-09 09:25:59','298','2016-03-09 09:33:17'), ('384','17','2016-03-09 09:25:59','299','2016-03-09 09:33:19'), ('385','17','2016-03-09 09:25:59','300','2016-03-09 09:33:22'), ('386','17','2016-03-09 09:25:59','301','2016-03-09 09:33:24'), ('387','17','2016-03-09 09:25:59','302','2016-03-09 09:33:26'), ('388','17','2016-03-09 09:25:59','303','2016-03-09 09:33:28'), ('389','17','2016-03-09 09:25:59','304','2016-03-09 09:33:30'), ('390','17','2016-03-09 09:25:59','305','2016-03-09 09:33:32'), ('391','17','2016-03-09 09:25:59','309','2016-03-09 09:33:34'), ('392','17','2016-03-09 09:25:59','310','2016-03-09 09:33:36'), ('393','17','2016-03-09 09:24:36','387','2016-03-09 09:33:38'), ('394','18','2016-03-09 09:25:59','311','2016-03-09 09:34:16'), ('395','18','2016-03-09 09:25:59','312','2016-03-09 09:34:18'), ('396','18','2016-03-09 09:25:59','313','2016-03-09 09:34:20'), ('397','18','2016-03-09 09:25:59','314','2016-03-09 09:34:22'), ('398','18','2016-03-09 09:25:59','315','2016-03-09 09:34:24'), ('399','18','2016-03-09 09:25:59','316','2016-03-09 09:34:26'), ('400','18','2016-03-09 09:25:59','317','2016-03-09 09:34:29'), ('401','18','2016-03-09 09:25:59','318','2016-03-09 09:34:31'), ('402','18','2016-03-09 09:25:59','319','2016-03-09 09:34:33'), ('403','18','2016-03-09 09:25:59','320','2016-03-09 09:34:35'), ('404','18','2016-03-09 09:25:59','321','2016-03-09 09:34:37'), ('405','18','2016-03-09 09:25:59','322','2016-03-09 09:34:39'), ('406','18','2016-03-09 09:25:59','323','2016-03-09 09:34:41'), ('407','18','2016-03-09 09:25:59','324','2016-03-09 09:34:43'), ('408','18','2016-03-09 09:25:59','325','2016-03-09 09:34:45'), ('409','18','2016-03-09 09:25:59','326','2016-03-09 09:34:48'), ('410','18','2016-03-09 09:25:59','327','2016-03-09 09:34:50'), ('411','18','2016-03-09 09:25:59','328','2016-03-09 09:34:52'), ('413','18','2016-03-09 09:25:59','330','2016-03-09 09:34:56'), ('414','18','2016-03-09 09:25:59','331','2016-03-09 09:34:58'), ('415','18','2016-03-09 09:25:59','332','2016-03-09 09:35:00'), ('416','18','2016-03-09 09:25:59','333','2016-03-09 09:35:02'), ('417','18','2016-03-09 09:25:59','334','2016-03-09 09:35:05'), ('418','18','2016-03-09 09:25:59','335','2016-03-09 09:35:07'), ('419','18','2016-03-09 09:25:59','336','2016-03-09 09:35:09'), ('420','18','2016-03-09 09:25:59','337','2016-03-09 09:35:11'), ('421','18','2016-03-09 09:25:59','338','2016-03-09 09:35:13'), ('422','18','2016-03-09 09:25:59','339','2016-03-09 09:35:15'), ('423','18','2016-03-09 09:25:59','340','2016-03-09 09:35:17'), ('424','18','2016-03-09 09:25:59','343','2016-03-09 09:35:19'), ('425','18','2016-03-09 09:25:59','344','2016-03-09 09:35:21'), ('426','18','2016-03-09 09:25:59','353','2016-03-09 09:35:24'), ('427','19','2016-03-09 09:25:59','357','2016-03-09 09:35:42'), ('428','19','2016-03-09 09:25:59','358','2016-03-09 09:35:44'), ('429','19','2016-03-09 09:25:59','359','2016-03-09 09:35:46'), ('430','19','2016-03-09 09:25:59','360','2016-03-09 09:35:48'), ('431','19','2016-03-09 09:25:59','361','2016-03-09 09:35:50'), ('432','19','2016-03-09 09:25:59','362','2016-03-09 09:35:53'), ('433','19','2016-03-09 09:25:59','363','2016-03-09 09:35:55'), ('434','20','2016-03-09 09:25:59','371','2016-03-09 09:47:21'), ('435','20','2016-03-09 09:25:59','372','2016-03-09 09:47:23'), ('436','20','2016-03-09 09:25:59','373','2016-03-09 09:47:25'), ('437','20','2016-03-09 09:25:59','374','2016-03-09 09:47:27'), ('438','20','2016-03-09 09:25:59','375','2016-03-09 09:47:29'), ('439','20','2016-03-09 09:25:59','376','2016-03-09 09:47:31'), ('440','20','2016-03-09 09:25:59','377','2016-03-09 09:47:34'), ('441','20','2016-03-09 09:25:59','378','2016-03-09 09:47:36'), ('442','20','2016-03-09 09:25:59','379','2016-03-09 09:47:38'), ('444','20','2016-03-09 09:25:59','381','2016-03-09 09:47:42'), ('445','20','2016-03-09 09:25:59','382','2016-03-09 09:47:44'), ('446','20','2016-03-09 09:25:59','383','2016-03-09 09:47:46'), ('447','20','2016-03-09 09:25:59','384','2016-03-09 09:47:48'), ('448','20','2016-03-09 09:25:59','385','2016-03-09 09:47:50'), ('449','20','2016-03-09 09:25:59','386','2016-03-09 09:47:53'), ('451','19','2016-03-09 09:25:59','365','2016-03-09 09:50:09'), ('452','19','2016-03-09 09:25:59','366','2016-03-09 09:50:11'), ('453','7','2016-03-10 20:13:44','38','2016-03-11 01:43:21'), ('455','7','2016-03-10 20:17:28','395','2016-03-11 01:43:21'), ('456','7','2016-03-10 20:17:28','396','2016-03-11 01:43:21'), ('457','12','2016-03-10 20:13:44','152','2016-03-11 01:43:34'), ('462','20','2016-03-10 20:13:44','380','2016-03-11 22:45:08'), ('463','20','2016-03-09 12:03:42','390','2016-03-11 22:45:08'), ('465','7','2016-03-12 15:21:57','36','2016-03-12 17:18:39'), ('466','7','2016-03-12 15:26:20','399','2016-03-12 17:18:40'), ('468','13','2016-03-15 19:19:23','176','2016-03-15 19:20:54'), ('485','10','2016-03-20 21:41:27','103','2016-03-20 21:43:47'), ('486','11','2016-03-20 21:41:27','121','2016-03-20 21:43:53'), ('488','11','2016-03-20 21:41:27','126','2016-03-20 21:43:53'), ('489','11','2016-03-20 21:41:27','135','2016-03-20 21:43:54'), ('491','11','2016-03-20 21:41:27','138','2016-03-20 21:43:54'), ('508','9','2016-03-20 21:41:27','67','2016-03-20 21:45:45'), ('509','9','2016-03-20 21:41:27','77','2016-03-20 21:45:45');
INSERT INTO `jntxfb_chargemodes` VALUES ('511','9','2016-03-20 21:41:27','82','2016-03-20 21:45:46'), ('514','9','2016-03-20 21:30:12','168','2016-03-20 21:45:46'), ('515','15','2016-03-20 21:41:27','233','2016-03-20 21:45:52'), ('516','18','2016-03-20 21:41:27','329','2016-03-20 21:45:58'), ('517','18','2016-03-09 12:03:03','388','2016-03-20 21:45:58'), ('518','18','2016-03-20 21:41:27','404','2016-03-20 21:45:58'), ('520','12','2016-03-20 22:06:29','355','2016-03-21 18:23:14'), ('522','11','2016-03-21 19:48:36','137','2016-03-21 19:48:51'), ('524','11','2016-03-22 22:01:24','124','2016-03-22 22:07:44'), ('528','16','2016-03-22 22:01:24','237','2016-03-22 22:07:56'), ('529','16','2016-03-22 22:01:24','341','2016-03-22 22:07:57'), ('530','16','2016-03-22 22:01:24','448','2016-03-22 22:07:57'), ('532','7','2016-03-29 18:58:15','394','2016-03-29 18:59:59'), ('533','9','2016-03-29 18:58:15','83','2016-03-29 19:00:06'), ('534','14','2016-03-09 12:10:51','392','2016-03-29 19:36:52'), ('535','19','2016-03-09 12:03:20','389','2016-03-29 19:37:14'), ('536','7','2016-03-30 20:21:12','30','2016-03-30 20:25:29'), ('537','7','2016-03-30 20:21:12','31','2016-03-30 20:25:29'), ('538','7','2016-03-30 20:21:12','367','2016-03-30 20:25:29'), ('539','12','2016-03-30 20:21:12','154','2016-03-30 20:25:43'), ('540','12','2016-03-30 20:21:12','159','2016-03-30 20:25:44'), ('541','12','2016-03-30 20:21:12','160','2016-03-30 20:25:44'), ('543','4','2016-03-30 20:21:12','6','2016-03-30 20:26:03'), ('544','4','2016-03-30 20:22:18','449','2016-03-30 20:26:03'), ('545','9','2016-03-30 20:21:12','66','2016-03-30 20:26:40'), ('546','9','2016-03-30 20:21:12','81','2016-03-30 20:26:40'), ('547','9','2016-03-30 20:21:12','85','2016-03-30 20:26:40'), ('548','17','2016-03-30 20:21:12','291','2016-03-30 20:26:58'), ('549','7','2016-04-12 21:08:32','30','2016-04-12 21:13:54'), ('550','7','2016-04-12 21:08:32','35','2016-04-12 21:13:55'), ('551','7','2016-04-12 21:08:32','36','2016-04-12 21:13:55'), ('552','7','2016-04-12 21:08:32','48','2016-04-12 21:13:55'), ('553','7','2016-04-12 21:08:32','367','2016-04-12 21:13:55'), ('554','11','2016-04-12 21:08:32','117','2016-04-12 21:13:59'), ('555','11','2016-04-12 21:08:32','118','2016-04-12 21:13:59'), ('556','11','2016-04-12 21:08:32','120','2016-04-12 21:13:59'), ('557','11','2016-04-12 21:08:32','122','2016-04-12 21:13:59'), ('558','11','2016-04-12 21:08:32','124','2016-04-12 21:13:59'), ('559','11','2016-04-12 21:08:32','126','2016-04-12 21:14:00'), ('560','11','2016-04-12 21:08:32','133','2016-04-12 21:14:00'), ('561','13','2016-04-12 21:08:32','169','2016-04-12 21:14:04'), ('562','13','2016-04-12 21:08:32','177','2016-04-12 21:14:04'), ('563','13','2016-04-12 21:08:32','180','2016-04-12 21:14:04'), ('564','12','2016-04-12 21:08:32','143','2016-04-12 21:14:11'), ('565','12','2016-04-12 21:08:32','154','2016-04-12 21:14:11'), ('566','12','2016-04-12 21:08:32','156','2016-04-12 21:14:11'), ('567','12','2016-04-12 21:08:32','159','2016-04-12 21:14:11'), ('568','12','2016-04-12 21:08:32','160','2016-04-12 21:14:11'), ('569','12','2016-04-12 21:08:32','161','2016-04-12 21:14:11'), ('570','12','2016-04-12 21:08:32','198','2016-04-12 21:14:11'), ('571','12','2016-04-12 21:08:32','199','2016-04-12 21:14:12'), ('572','12','2016-04-12 21:08:32','203','2016-04-12 21:14:12'), ('573','12','2016-04-12 21:08:32','450','2016-04-12 21:14:12'), ('588','9','2016-04-09 09:25:30','76','2016-04-12 21:15:02'), ('589','9','2016-04-12 21:08:32','81','2016-04-12 21:15:02'), ('590','9','2016-04-09 09:25:30','83','2016-04-12 21:15:02'), ('591','9','2016-04-09 09:25:30','85','2016-04-12 21:15:02'), ('592','9','2016-04-09 09:28:10','168','2016-04-12 21:15:02'), ('593','15','2016-04-12 21:08:32','220','2016-04-12 21:15:07'), ('594','15','2016-04-12 21:08:32','221','2016-04-12 21:15:07'), ('595','15','2016-04-12 21:08:32','224','2016-04-12 21:15:07'), ('596','15','2016-04-12 21:08:32','225','2016-04-12 21:15:07'), ('597','15','2016-04-12 21:08:32','230','2016-04-12 21:15:08'), ('598','15','2016-04-12 21:08:32','231','2016-04-12 21:15:08'), ('599','15','2016-04-12 21:08:32','232','2016-04-12 21:15:08'), ('600','15','2016-04-12 21:08:32','233','2016-04-12 21:15:08'), ('601','16','2016-04-12 21:08:32','243','2016-04-12 21:15:40'), ('602','17','2016-04-12 21:08:32','287','2016-04-12 21:15:44'), ('603','17','2016-04-12 21:08:32','289','2016-04-12 21:15:44'), ('604','17','2016-04-12 21:08:32','290','2016-04-12 21:15:45'), ('605','17','2016-04-12 21:08:32','454','2016-04-12 21:15:45'), ('606','18','2016-04-12 21:08:32','325','2016-04-12 21:15:49'), ('607','18','2016-04-12 21:08:32','404','2016-04-12 21:15:50'), ('608','20','2016-04-12 21:08:32','379','2016-04-12 21:15:54'), ('609','20','2016-04-12 21:08:32','386','2016-04-12 21:15:54'), ('610','20','2016-04-12 21:08:32','452','2016-04-12 21:15:55'), ('611','20','2016-04-12 21:08:32','453','2016-04-12 21:15:55'), ('612','7','2016-04-12 21:28:53','461','2016-04-12 21:30:05'), ('613','7','2016-04-12 21:28:53','462','2016-04-12 21:30:05'), ('614','7','2016-04-12 21:28:53','463','2016-04-12 21:30:05'), ('615','7','2016-04-20 19:45:44','36','2016-04-20 19:49:40'), ('616','7','2016-04-20 19:45:44','463','2016-04-20 19:49:40'), ('617','10','2016-04-20 19:45:44','103','2016-04-20 19:49:46'), ('618','11','2016-04-16 16:32:56','120','2016-04-20 19:49:52'), ('619','11','2016-04-20 19:45:44','122','2016-04-20 19:49:52'), ('620','13','2016-04-20 19:45:44','171','2016-04-20 19:49:58'), ('621','13','2016-04-20 19:45:44','194','2016-04-20 19:49:58'), ('622','13','2016-04-20 19:45:44','475','2016-04-20 19:49:58'), ('623','13','2016-04-20 19:45:44','476','2016-04-20 19:49:58'), ('624','13','2016-04-20 19:45:44','477','2016-04-20 19:49:58'), ('630','9','2016-04-20 19:45:44','66','2016-04-20 19:50:53'), ('631','9','2016-04-20 19:45:44','83','2016-04-20 19:50:53'), ('632','9','2016-04-20 19:45:44','85','2016-04-20 19:50:54'), ('633','9','2016-04-20 19:45:44','471','2016-04-20 19:50:54'), ('634','9','2016-04-20 19:45:44','472','2016-04-20 19:50:54'), ('635','14','2016-04-20 19:45:44','234','2016-04-20 19:51:00'), ('636','15','2016-04-20 19:45:44','220','2016-04-20 19:51:08'), ('637','15','2016-04-20 19:45:44','221','2016-04-20 19:51:08'), ('638','16','2016-04-20 19:45:44','268','2016-04-20 19:51:13'), ('639','17','2016-04-20 19:45:44','466','2016-04-20 19:51:19');
INSERT INTO `jntxfb_chargemodes` VALUES ('640','17','2016-04-20 19:45:44','467','2016-04-20 19:51:19'), ('641','17','2016-04-20 19:45:44','468','2016-04-20 19:51:19'), ('642','17','2016-04-20 19:45:44','469','2016-04-20 19:51:19'), ('643','17','2016-04-20 19:45:44','470','2016-04-20 19:51:19'), ('644','17','2016-04-20 19:45:44','478','2016-04-20 19:51:19'), ('645','17','2016-04-20 19:45:44','479','2016-04-20 19:51:19'), ('646','17','2016-04-20 19:45:44','480','2016-04-20 19:51:19'), ('647','17','2016-04-20 19:45:44','481','2016-04-20 19:51:20'), ('648','17','2016-04-20 19:45:44','482','2016-04-20 19:51:20'), ('649','17','2016-04-20 19:45:44','483','2016-04-20 19:51:20'), ('650','17','2016-04-20 19:45:44','484','2016-04-20 19:51:20'), ('651','17','2016-04-20 19:45:44','485','2016-04-20 19:51:20'), ('652','17','2016-04-20 19:45:44','486','2016-04-20 19:51:20'), ('653','17','2016-04-20 19:45:44','487','2016-04-20 19:51:20'), ('654','17','2016-04-20 19:45:44','488','2016-04-20 19:51:21'), ('655','17','2016-04-20 19:45:44','489','2016-04-20 19:51:21'), ('656','17','2016-04-20 19:45:44','490','2016-04-20 19:51:21'), ('657','17','2016-04-20 19:45:44','491','2016-04-20 19:51:21'), ('658','17','2016-04-20 19:45:44','492','2016-04-20 19:51:21'), ('659','17','2016-04-20 19:45:44','493','2016-04-20 19:51:21'), ('660','17','2016-04-20 19:45:44','494','2016-04-20 19:51:21'), ('661','17','2016-04-20 19:45:44','495','2016-04-20 19:51:22'), ('662','17','2016-04-20 19:45:44','496','2016-04-20 19:51:22'), ('663','17','2016-04-20 19:45:44','497','2016-04-20 19:51:22'), ('664','17','2016-04-20 19:45:44','498','2016-04-20 19:51:22'), ('665','17','2016-04-20 19:45:44','499','2016-04-20 19:51:22'), ('666','17','2016-04-20 19:45:44','500','2016-04-20 19:51:22'), ('667','17','2016-04-20 19:45:44','501','2016-04-20 19:51:22'), ('668','17','2016-04-20 19:45:44','502','2016-04-20 19:51:23'), ('669','17','2016-04-20 19:45:44','503','2016-04-20 19:51:23'), ('670','17','2016-04-20 19:45:44','504','2016-04-20 19:51:23'), ('671','17','2016-04-20 19:45:44','505','2016-04-20 19:51:23'), ('672','17','2016-04-20 19:45:44','506','2016-04-20 19:51:23'), ('673','17','2016-04-20 19:45:44','507','2016-04-20 19:51:23'), ('674','17','2016-04-20 19:45:44','508','2016-04-20 19:51:23'), ('675','17','2016-04-20 19:45:44','509','2016-04-20 19:51:24'), ('676','17','2016-04-20 19:45:44','510','2016-04-20 19:51:24'), ('677','17','2016-04-20 19:45:44','511','2016-04-20 19:51:24'), ('678','17','2016-04-20 19:45:44','512','2016-04-20 19:51:24'), ('679','17','2016-04-20 19:45:44','513','2016-04-20 19:51:24'), ('680','17','2016-04-20 19:45:44','514','2016-04-20 19:51:24'), ('681','17','2016-04-20 19:45:44','515','2016-04-20 19:51:24'), ('682','17','2016-04-20 19:45:44','516','2016-04-20 19:51:24'), ('683','17','2016-04-20 19:45:44','517','2016-04-20 19:51:25'), ('684','17','2016-04-20 19:45:44','518','2016-04-20 19:51:25'), ('685','17','2016-04-20 19:45:44','519','2016-04-20 19:51:25'), ('686','17','2016-04-20 19:45:44','520','2016-04-20 19:51:25'), ('687','17','2016-04-20 19:45:44','521','2016-04-20 19:51:25'), ('688','17','2016-04-20 19:45:44','522','2016-04-20 19:51:25'), ('689','17','2016-04-20 19:44:42','523','2016-04-20 19:51:25'), ('690','9','2016-04-20 19:52:35','85','2016-04-20 19:54:01'), ('691','9','2016-04-20 19:57:16','85','2016-04-20 19:57:31'), ('692','17','2016-04-20 20:00:33','387','2016-04-20 20:00:53'), ('693','7','2016-04-20 22:23:10','46','2016-04-20 22:23:26'), ('694','9','2016-04-20 22:23:10','66','2016-04-20 22:23:59'), ('695','9','2016-04-20 22:23:10','78','2016-04-20 22:23:59'), ('696','9','2016-04-20 22:23:10','471','2016-04-20 22:24:00'), ('697','9','2016-04-20 22:23:10','524','2016-04-20 22:24:00'), ('698','9','2016-04-20 22:23:10','525','2016-04-20 22:24:00'), ('699','17','2016-04-20 22:23:10','489','2016-04-20 22:24:08'), ('700','7','2016-05-08 17:39:08','36','2016-05-08 17:41:49'), ('701','7','2016-05-08 17:39:08','37','2016-05-08 17:41:49'), ('702','7','2016-05-08 17:39:08','38','2016-05-08 17:41:50'), ('703','7','2016-05-08 17:39:08','367','2016-05-08 17:41:50'), ('704','7','2016-05-08 17:39:08','462','2016-05-08 17:41:50'), ('705','7','2016-05-08 17:39:08','463','2016-05-08 17:41:50'), ('706','10','2016-05-08 17:39:08','109','2016-05-08 17:41:58'), ('707','11','2016-05-08 17:39:08','119','2016-05-08 17:42:05'), ('708','11','2016-05-08 17:39:08','124','2016-05-08 17:42:05'), ('709','11','2016-05-08 17:39:08','141','2016-05-08 17:42:05'), ('710','11','2016-05-08 17:39:08','536','2016-05-08 17:42:05'), ('711','13','2016-05-08 17:39:08','171','2016-05-08 17:42:10'), ('712','13','2016-05-08 17:39:08','177','2016-05-08 17:42:10'), ('713','13','2016-05-08 17:39:08','186','2016-05-08 17:42:10'), ('714','13','2016-05-08 17:39:08','187','2016-05-08 17:42:11'), ('715','13','2016-05-08 17:39:08','193','2016-05-08 17:42:11'), ('716','13','2016-05-08 17:39:08','194','2016-05-08 17:42:11'), ('717','13','2016-05-08 17:39:08','475','2016-05-08 17:42:11'), ('718','13','2016-05-08 17:39:08','476','2016-05-08 17:42:11'), ('719','12','2016-05-08 17:39:08','145','2016-05-08 17:42:16'), ('720','12','2016-05-08 17:39:08','147','2016-05-08 17:42:17'), ('721','12','2016-05-08 17:39:08','159','2016-05-08 17:42:17'), ('722','12','2016-05-08 17:39:08','450','2016-05-08 17:42:17'), ('724','9','2016-05-08 17:39:08','66','2016-05-08 17:43:06'), ('725','9','2016-05-08 17:39:08','67','2016-05-08 17:43:06'), ('726','9','2016-05-08 17:39:08','68','2016-05-08 17:43:06'), ('727','9','2016-05-08 17:39:08','72','2016-05-08 17:43:06'), ('728','9','2016-05-08 17:39:08','78','2016-05-08 17:43:07'), ('729','9','2016-05-08 17:39:08','79','2016-05-08 17:43:07'), ('730','9','2016-05-08 17:39:08','80','2016-05-08 17:43:07'), ('731','9','2016-05-08 17:39:08','81','2016-05-08 17:43:07'), ('732','9','2016-05-08 17:39:08','83','2016-05-08 17:43:07'), ('733','9','2016-05-08 17:39:08','85','2016-05-08 17:43:07'), ('734','9','2016-05-08 17:39:08','471','2016-05-08 17:43:07'), ('735','9','2016-05-08 17:39:08','472','2016-05-08 17:43:08'), ('736','9','2016-05-08 17:39:08','524','2016-05-08 17:43:08'), ('737','9','2016-05-08 17:39:08','525','2016-05-08 17:43:08'), ('738','9','2016-05-08 17:39:08','535','2016-05-08 17:43:08'), ('739','15','2016-05-08 17:39:08','220','2016-05-08 17:43:20'), ('740','15','2016-05-08 17:39:08','221','2016-05-08 17:43:20');
INSERT INTO `jntxfb_chargemodes` VALUES ('741','15','2016-05-08 17:15:00','526','2016-05-08 17:43:21'), ('742','15','2016-05-08 17:39:08','527','2016-05-08 17:43:21'), ('743','15','2016-05-08 17:39:08','528','2016-05-08 17:43:21'), ('744','15','2016-05-08 17:39:08','529','2016-05-08 17:43:21'), ('745','15','2016-05-08 17:39:08','530','2016-05-08 17:43:21'), ('746','15','2016-05-08 17:39:08','531','2016-05-08 17:43:21'), ('747','15','2016-05-08 17:39:08','532','2016-05-08 17:43:21'), ('748','15','2016-05-08 17:39:08','533','2016-05-08 17:43:22'), ('749','15','2016-05-08 17:39:08','534','2016-05-08 17:43:22'), ('750','16','2016-05-08 17:39:08','264','2016-05-08 17:43:29'), ('751','16','2016-05-08 17:39:08','265','2016-05-08 17:43:29'), ('752','16','2016-05-08 17:39:08','266','2016-05-08 17:43:30'), ('753','16','2016-05-08 17:39:08','267','2016-05-08 17:43:30'), ('754','16','2016-05-08 17:39:08','269','2016-05-08 17:43:30'), ('755','16','2016-05-08 17:39:08','270','2016-05-08 17:43:30'), ('756','16','2016-05-08 17:39:08','271','2016-05-08 17:43:30'), ('757','16','2016-05-08 17:39:08','273','2016-05-08 17:43:30'), ('758','16','2016-05-08 17:39:08','347','2016-05-08 17:43:30'), ('759','16','2016-05-08 17:39:08','348','2016-05-08 17:43:31'), ('760','16','2016-05-08 17:39:08','349','2016-05-08 17:43:31'), ('761','16','2016-05-08 17:39:08','350','2016-05-08 17:43:31'), ('762','16','2016-05-08 17:39:08','351','2016-05-08 17:43:31'), ('763','16','2016-05-08 17:39:08','352','2016-05-08 17:43:31'), ('764','16','2016-05-08 17:39:08','537','2016-05-08 17:43:31'), ('765','16','2016-05-08 17:39:08','550','2016-05-08 17:43:31'), ('766','16','2016-05-08 17:39:08','551','2016-05-08 17:43:32'), ('767','16','2016-05-08 17:39:08','554','2016-05-08 17:43:32'), ('768','16','2016-05-08 17:39:08','559','2016-05-08 17:43:32'), ('769','16','2016-05-08 17:39:08','560','2016-05-08 17:43:32'), ('770','16','2016-05-08 17:39:08','565','2016-05-08 17:43:32'), ('771','16','2016-05-08 17:39:08','566','2016-05-08 17:43:32'), ('772','16','2016-05-08 17:39:08','567','2016-05-08 17:43:32'), ('773','16','2016-05-08 17:39:08','568','2016-05-08 17:43:33'), ('774','16','2016-05-08 17:39:08','569','2016-05-08 17:43:33'), ('775','16','2016-05-08 17:39:08','572','2016-05-08 17:43:33'), ('776','16','2016-05-08 17:39:08','574','2016-05-08 17:43:33'), ('777','17','2016-05-08 17:39:08','467','2016-05-08 17:43:43'), ('778','17','2016-05-08 17:39:08','498','2016-05-08 17:43:43'), ('779','17','2016-05-08 17:39:08','501','2016-05-08 17:43:43'), ('780','17','2016-05-08 17:39:08','506','2016-05-08 17:43:43'), ('781','18','2016-05-08 17:39:08','311','2016-05-08 17:43:48'), ('782','18','2016-05-08 17:39:08','312','2016-05-08 17:43:49'), ('783','18','2016-05-08 17:39:08','313','2016-05-08 17:43:49'), ('784','18','2016-05-08 17:39:08','314','2016-05-08 17:43:49'), ('785','18','2016-05-08 17:39:08','315','2016-05-08 17:43:49'), ('786','18','2016-05-08 17:39:08','316','2016-05-08 17:43:49'), ('787','18','2016-05-08 17:39:08','319','2016-05-08 17:43:49'), ('788','18','2016-05-08 17:39:08','322','2016-05-08 17:43:49'), ('789','18','2016-05-08 17:39:08','335','2016-05-08 17:43:50'), ('790','18','2016-05-08 17:39:08','336','2016-05-08 17:43:50'), ('791','18','2016-05-08 17:39:08','337','2016-05-08 17:43:50'), ('792','18','2016-05-08 17:39:08','338','2016-05-08 17:43:50'), ('793','18','2016-05-08 17:39:08','339','2016-05-08 17:43:50'), ('794','18','2016-05-08 17:39:08','340','2016-05-08 17:43:50'), ('795','18','2016-05-08 17:39:08','539','2016-05-08 17:43:50'), ('796','18','2016-05-08 17:39:08','540','2016-05-08 17:43:51'), ('797','18','2016-05-08 17:39:08','548','2016-05-08 17:43:51'), ('798','18','2016-05-08 17:39:08','549','2016-05-08 17:43:51'), ('799','18','2016-05-08 17:39:08','552','2016-05-08 17:43:51'), ('800','18','2016-05-08 17:39:08','553','2016-05-08 17:43:51'), ('801','18','2016-05-08 17:39:08','555','2016-05-08 17:43:51'), ('802','18','2016-05-08 17:39:08','556','2016-05-08 17:43:52'), ('803','18','2016-05-08 17:39:08','557','2016-05-08 17:43:52'), ('804','18','2016-05-08 17:39:08','558','2016-05-08 17:43:52'), ('805','18','2016-05-08 17:39:08','570','2016-05-08 17:43:52'), ('806','18','2016-05-08 17:39:08','571','2016-05-08 17:43:52'), ('807','18','2016-05-08 17:39:08','573','2016-05-08 17:43:52'), ('808','19','2016-05-08 17:39:08','361','2016-05-08 17:44:03'), ('809','19','2016-05-08 17:39:08','362','2016-05-08 17:44:03'), ('810','19','2016-05-08 17:39:08','363','2016-05-08 17:44:03'), ('811','19','2016-05-08 17:39:08','365','2016-05-08 17:44:03'), ('812','19','2016-05-08 17:39:08','366','2016-05-08 17:44:03'), ('813','19','2016-05-08 17:39:08','541','2016-05-08 17:44:03'), ('814','19','2016-05-08 17:39:08','542','2016-05-08 17:44:03'), ('815','19','2016-05-08 17:39:08','543','2016-05-08 17:44:03'), ('816','19','2016-05-08 17:39:08','544','2016-05-08 17:44:04'), ('817','19','2016-05-08 17:39:08','545','2016-05-08 17:44:04'), ('818','19','2016-05-08 17:39:08','546','2016-05-08 17:44:04'), ('819','19','2016-05-08 17:39:08','561','2016-05-08 17:44:04'), ('820','19','2016-05-08 17:39:08','562','2016-05-08 17:44:04'), ('821','19','2016-05-08 17:39:08','563','2016-05-08 17:44:04'), ('822','20','2016-05-08 17:39:08','380','2016-05-08 17:44:11'), ('823','20','2016-05-08 17:39:08','384','2016-05-08 17:44:11'), ('824','20','2016-05-08 17:39:08','386','2016-05-08 17:44:11'), ('825','20','2016-05-08 17:39:08','538','2016-05-08 17:44:11'), ('826','20','2016-05-08 17:39:08','547','2016-05-08 17:44:11'), ('827','20','2016-05-08 17:39:08','564','2016-05-08 17:44:11'), ('828','7','2016-05-09 10:04:40','100','2016-05-09 20:13:19'), ('829','13','2016-05-09 10:07:06','211','2016-05-09 20:13:32'), ('830','9','2016-05-09 10:04:11','168','2016-05-09 20:13:48'), ('831','8','2016-04-12 21:08:32','49','2016-05-09 20:14:17'), ('832','8','2016-04-12 21:08:32','50','2016-05-09 20:14:18'), ('833','8','2016-02-23 13:05:04','51','2016-05-09 20:14:20'), ('834','8','2016-02-23 13:05:04','52','2016-05-09 20:14:22'), ('835','8','2016-02-23 13:05:04','53','2016-05-09 20:14:23'), ('836','8','2016-03-15 19:19:23','54','2016-05-09 20:14:25'), ('837','8','2016-04-12 21:08:32','55','2016-05-09 20:14:26'), ('838','8','2016-04-12 21:08:32','56','2016-05-09 20:14:28'), ('839','8','2016-04-12 21:08:32','57','2016-05-09 20:14:30'), ('840','8','2016-04-12 21:08:32','58','2016-05-09 20:14:31');
INSERT INTO `jntxfb_chargemodes` VALUES ('841','8','2016-03-20 21:41:27','59','2016-05-09 20:14:33'), ('842','8','2016-04-20 19:45:44','61','2016-05-09 20:14:34'), ('843','8','2016-04-16 16:32:56','62','2016-05-09 20:14:36'), ('844','8','2016-02-23 13:05:04','63','2016-05-09 20:14:38'), ('845','8','2016-02-23 13:05:04','64','2016-05-09 20:14:39'), ('846','8','2016-04-12 21:08:32','65','2016-05-09 20:14:41'), ('847','8','2016-04-12 21:08:32','455','2016-05-09 20:14:42'), ('848','8','2016-05-08 17:39:08','456','2016-05-09 20:14:44'), ('849','8','2016-04-20 19:45:44','464','2016-05-09 20:14:46'), ('850','8','2016-04-20 19:45:44','465','2016-05-09 20:14:47'), ('851','17','2016-05-09 13:27:36','467','2016-05-09 20:15:20'), ('852','19','2016-05-09 10:06:10','389','2016-05-09 20:15:35'), ('853','20','2016-05-09 10:06:41','390','2016-05-09 20:15:50');
INSERT INTO `jntxfb_company` VALUES ('1','济南通信段','0','管理员','1','济南历下','2016-06-10 09:20:23');
INSERT INTO `jntxfb_daily` VALUES ('1','2016-04-07','REIM系统开发，添加推送密码，官网维护等。','2016-04-08 23:00:40','2016-04-08 23:00:40','1','管理员','0',NULL,'0',NULL,'1'), ('2','2016-04-08','1、核心模块流程添加转办给其他人功能。\n2、REIM开发添加手机端提醒。','2016-04-08 23:01:24','2016-04-08 23:01:24','1','管理员','0',NULL,'0',NULL,'1'), ('3','2016-04-05','1、官网添加会员用户中心，添加密码修改，REIM密钥创建。','2016-04-08 23:02:49','2016-04-08 23:02:49','1','管理员','0',NULL,'0',NULL,'1');
INSERT INTO `jntxfb_demand` VALUES ('1','来个需求啦，呵呵呵呵','0',NULL,'1',NULL,'2015-11-27 22:01:54','1','管理员','2015-11-27','呵呵呵呵额呵呵','1','1',NULL,'1,0,4','1','大乔',NULL), ('2','呵呵呵呵呵','0',NULL,'1',NULL,'2015-11-28 12:38:04','1','管理员','2015-11-28',NULL,'1','1',NULL,'1,0,4','1','大乔',NULL), ('3','这是个申请啊，嘿嘿嘿嘿噩耗','0',NULL,'1','呵呵额和<img alt=\"\" src=\"upload/2015-11/28_1956194078.jpg\" />','2015-11-28 19:56:23','1','管理员','2015-11-28',NULL,'1','1',NULL,'1,0,4','1','大乔',NULL), ('4','122112122112','0',NULL,'1',NULL,'2015-11-28 20:12:42','1','管理员','2015-11-28','12122112','1','1',NULL,'1,0,5','1','小乔',NULL), ('5','我有一个生情呵呵呵','0',NULL,'1',NULL,'2015-12-15 19:32:09','1','管理员','2015-12-12','1122121112','5','1','1','1,0','0',NULL,'管理员'), ('6','来个需求','0',NULL,'1','<p>\n	<img width=\"639\" height=\"640\" style=\"width:150px;height:140px;\" alt=\"\" src=\"upload/2016-04/25_2021308319.png\" />\n</p>\n<p>\n	这是一个编辑喽吗？\n</p>','2016-04-25 20:22:00','1','管理员','2016-04-14','呃呃呃','0','1','1','1,0','0',NULL,'管理员');
INSERT INTO `jntxfb_dept` VALUES ('1','rock','科室','0','5',NULL,NULL,NULL,'1','\0'), ('2','sck','生产科','1','1',NULL,NULL,NULL,'1','\0'), ('3','xzrs','赵副段长办公室','0','0',NULL,'赵子龙','9','1','\0'), ('4','cwk','财务科','1','0',NULL,'管理员','1','1','\0'), ('5','clk','材料科','1','0',NULL,NULL,NULL,'1','\0'), ('6','aqk','完全科','1','0',NULL,NULL,NULL,'1','\0'), ('7','gl','段长办公室','0','0',NULL,NULL,NULL,'1','\0'), ('8','wfdzbgs','张副段长办公室','0','1',NULL,NULL,NULL,'1','\0'), ('9','cj','车间','0','6',NULL,NULL,NULL,'1','\0'), ('10','sccj','西城车间','9','0',NULL,NULL,NULL,'1','\0'), ('11','dccj','东城车间','9','0',NULL,NULL,NULL,'1','\0'), ('12','nccj','南城车间','9','0',NULL,NULL,NULL,'1','\0'), ('13','bccj','北城车间','9','0',NULL,NULL,NULL,'1','\0'), ('14','cwk_kz','科长','4','0',NULL,NULL,NULL,'1',''), ('15','cwk_ky','账务人员','4','0',NULL,NULL,NULL,'1',''), ('16','clw_kz','科长','5','0',NULL,NULL,NULL,'0',''), ('17','clk_kmfzr1','科目负责人１','5','0',NULL,NULL,NULL,'0',''), ('18','aqk_kz','科长','6','0',NULL,NULL,NULL,'0',''), ('19','aqk_kmfzr1','科目负责人１','6','0',NULL,NULL,NULL,'0',''), ('20','sck_kz','科长','2','0',NULL,NULL,NULL,'0',''), ('21','sck_kmfzr1','科目负责人１','2','0',NULL,NULL,NULL,'0',''), ('22','sccj_fzr','车间主任','10','0',NULL,NULL,NULL,'0',''), ('23','dccj_fzr','车间主任','11','0',NULL,NULL,NULL,'0',''), ('24','nccj_fzr','车间主任','12','0',NULL,NULL,NULL,'0',''), ('25','bccj_fzr','车间主任','13','0',NULL,NULL,NULL,'0',''), ('30','clk_kmfzr2','科目负责人2','5','0',NULL,NULL,NULL,'0',''), ('31','duanzhang','段长','7','0',NULL,NULL,NULL,'0',''), ('32','fuduanzhang','副段长','8','0',NULL,NULL,NULL,'0',''), ('33','fuduanzhang1','副段长','3','0',NULL,NULL,NULL,'0','');
INSERT INTO `jntxfb_docdeil` VALUES ('8','1','1','1',NULL,'3','1','貂蝉',NULL,'一个文档','3','貂蝉','2015-07-30 20:11:27',NULL,NULL,NULL,NULL), ('9','1','1','1',NULL,'1','1','管理员',NULL,'wewe','1','管理员','2015-08-14 10:40:21',NULL,NULL,NULL,NULL), ('10','1','1','1',NULL,'1','1','管理员',NULL,'wcwwe','1','管理员','2015-08-14 11:01:45',NULL,NULL,NULL,NULL), ('11','1','1','1',NULL,'1','1','管理员',NULL,'哈哈哈','1','管理员','2015-09-17 16:27:32',NULL,'1','管理员','2015-08-21'), ('12','1','1','1',NULL,'3','1','貂蝉',NULL,'哈哈哈','3','貂蝉','2015-10-13 15:48:50',NULL,'1','管理员','2015-08-26'), ('13','1','1','1',NULL,'1','1','管理员',NULL,'自己来试试','1','管理员','2015-10-27 11:21:01',NULL,'1','管理员','2015-10-27'), ('14','1','1','1',NULL,'1','1','管理员',NULL,'hahahaha','1','管理员','2016-01-31 13:34:27','文件，看看','1','管理员','2016-01-25'), ('15','1','1','1',NULL,'1','1','管理员',NULL,'申请啦','1','管理员','2016-01-31 14:02:29','恩呢嫩','1','管理员','2016-01-31'), ('16','1','1','1',NULL,'1','1','管理员',NULL,'测测三次四次','1','管理员','2016-01-31 16:44:38','666','1','管理员','2016-01-31'), ('17','1','1','1',NULL,'4,1','1','大乔',NULL,'测试发琐琐碎碎','4,1','大乔,管理员','2016-02-29 22:17:38',NULL,'1','管理员','2016-02-18'), ('18','1','1','1',NULL,'4,3,5,2','1','大乔',NULL,'你有很多文件接收啦','4,3,5,2','大乔,貂蝉,小乔,陈稀糊','2016-02-29 22:21:53','这里有文档，收吧！','1','管理员','2016-02-29'), ('19','1','1','1',NULL,'1','1','管理员',NULL,'12121212','1','管理员','2016-04-05 12:49:48',NULL,'1','管理员','2016-03-15'), ('20','1','0','1','5','5,1','1','管理员','小乔','给你的文件','5,1','小乔,管理员','2016-04-23 22:32:36',NULL,'1','管理员','2016-04-04'), ('21','1','0','1','6','6','0',NULL,'刘长','走个流程试试','6','刘长','2016-07-27 13:42:20','！@#！@#@￥@#%@……#￥*%￥#%*@','1','管理员','2016-07-27');
INSERT INTO `jntxfb_editrecord` VALUES ('1','开户行','阿里巴巴','阿里巴巴公司','fininfom','4','2016-05-08 16:10:08','1','管理员'), ('2','截止时间','2016-04-12 11:45:00','2016-04-13 11:45:00','kq_info','56','2016-05-08 16:10:49','1','管理员'), ('3','请假(小时)','8','16','kq_info','56','2016-05-08 16:10:49','1','管理员'), ('4','说明','嗯嗯嗯嗯','嗯嗯嗯嗯，在添加一天。','kq_info','56','2016-05-08 16:10:49','1','管理员'), ('5','主题','欢迎RockOA最新版本V2.3.1版本上线','欢迎上线','infor','14','2016-06-10 09:17:59','1','管理员'), ('6','部门名称','行政人事','张副段长办公室','admin','4','2016-06-11 21:24:10','1','管理员'), ('7','姓名','管理员','管理员１','admin','2','2016-06-20 19:59:45','1','管理员'), ('8','部门名称','开发部','财务科','admin','2','2016-06-20 19:59:45','1','管理员'), ('9','职位','行政前台','科目负责人１','admin','5','2016-06-20 20:00:54','1','管理员'), ('10','部门名称','行政人事','材料科','admin','5','2016-06-20 20:00:54','1','管理员'), ('11','所在组','组名','科目负责人','admin','5','2016-06-20 20:00:54','1','管理员'), ('12','职位','管理员','科长','admin','1','2016-06-24 10:30:15','1','管理员'), ('13','部门名称','开发部','财务科','admin','1','2016-06-24 10:30:15','1','管理员'), ('14','职位','工程师','科长','admin','2','2016-06-24 10:30:45','1','管理员'), ('15','部门名称','财务科','材料科','admin','2','2016-06-24 10:30:45','1','管理员'), ('16','职位','董事长',NULL,'admin','7','2016-06-24 10:31:49','1','管理员'), ('17','部门名称','管理部','段长办公室','admin','7','2016-06-24 10:31:49','1','管理员'), ('18','职位',NULL,'段长','admin','7','2016-06-24 10:33:54','1','管理员'), ('19','职位','行政主管','副段长','admin','4','2016-06-24 10:34:48','1','管理员'), ('20','所在组',NULL,'科长','admin','7','2016-06-24 10:35:04','1','管理员'), ('21','所在组','系统管理员','系统管理员,科长','admin','1','2016-06-24 10:35:38','1','管理员'), ('22','所在组','系统管理员','系统管理员,科长','admin','2','2016-06-24 10:36:17','1','管理员'), ('23','所在组','科长','段长','admin','7','2016-06-24 10:36:37','1','管理员'), ('24','所在组',NULL,'副段长','admin','4','2016-06-24 10:36:56','1','管理员'), ('25','职位','人事经理','科目负责人１','admin','3','2016-06-24 10:37:34','1','管理员'), ('26','部门名称','行政人事','材料科','admin','3','2016-06-24 10:37:34','1','管理员'), ('27','所在组',NULL,'科目负责人','admin','3','2016-06-24 10:37:34','1','管理员'), ('28','上级主管','大乔','管理员１','admin','3','2016-06-24 10:38:27','1','管理员'), ('29','职位','科目负责人１','账务人员','admin','3','2016-06-24 10:39:02','1','管理员'), ('30','部门名称','材料科','财务科','admin','3','2016-06-24 10:39:02','1','管理员'), ('31','上级主管','管理员１',NULL,'admin','3','2016-06-24 10:39:02','1','管理员'), ('32','上级主管','刘备',NULL,'admin','1','2016-06-24 10:39:16','1','管理员'), ('33','所在组','系统管理员,科长','科长,系统管理员','admin','1','2016-06-24 10:39:16','1','管理员'), ('34','上级主管','管理员',NULL,'admin','2','2016-06-24 10:39:26','1','管理员'), ('35','所在组','系统管理员,科长','科长,系统管理员','admin','2','2016-06-24 10:39:26','1','管理员'), ('36','上级主管','刘备',NULL,'admin','4','2016-06-24 10:39:36','1','管理员'), ('37','上级主管','貂蝉',NULL,'admin','5','2016-06-24 10:39:49','1','管理员'), ('38','职位','程序员','科目负责人2','admin','8','2016-06-24 10:40:21','1','管理员'), ('39','部门名称','开发部','材料科','admin','8','2016-06-24 10:40:21','1','管理员'), ('40','上级主管','管理员',NULL,'admin','8','2016-06-24 10:40:21','1','管理员'), ('41','所在组',NULL,'科目负责人','admin','8','2016-06-24 10:40:21','1','管理员'), ('42','职位','财务经理','科长','admin','9','2016-06-24 10:40:59','1','管理员'), ('43','部门名称','财务部','完全科','admin','9','2016-06-24 10:40:59','1','管理员'), ('44','所在组',NULL,'科长','admin','9','2016-06-24 10:40:59','1','管理员'), ('45','职位','出纳','车间主任','admin','10','2016-06-24 10:41:34','1','管理员'), ('46','部门名称','财务部','西城车间','admin','10','2016-06-24 10:41:34','1','管理员'), ('47','上级主管','赵子龙',NULL,'admin','10','2016-06-24 10:41:34','1','管理员'), ('48','所在组',NULL,'车间主任','admin','10','2016-06-24 10:41:34','1','管理员'), ('49','所属公司','0','1','admin','9','2016-06-24 10:41:54','1','管理员'), ('50','上级主管','管理员',NULL,'admin','9','2016-06-24 10:42:05','1','管理员'), ('51','所属公司','0','1','admin','10','2016-06-24 10:42:18','1','管理员'), ('52','所属公司','0','1','admin','8','2016-06-24 10:42:28','1','管理员'), ('53','所属公司','0','1','admin','5','2016-06-24 10:42:37','1','管理员'), ('54','所属公司','0','1','admin','3','2016-06-24 10:42:46','1','管理员'), ('55','所属公司','0','1','admin','4','2016-06-24 10:42:56','1','管理员'), ('56','职位','职员','副段长','admin','6','2016-06-26 15:24:45','1','管理员'), ('57','部门名称','开发部','赵副段长办公室','admin','6','2016-06-26 15:24:45','1','管理员'), ('58','所在组',NULL,'副段长','admin','6','2016-06-26 15:24:45','1','管理员'), ('59','所属公司','0','1','admin','6','2016-06-26 15:24:45','1','管理员'), ('60','所属科目id','4','9','fininfom','21','2016-06-26 17:51:37','1','管理员'), ('61','所属科目','通信设备运用维修','通信设备运用维修-合资','fininfom','21','2016-06-26 17:51:37','1','管理员'), ('62','所属科目id','1','2','fininfom','32','2016-07-02 21:55:18','10','吕布'), ('63','所属科目','主营业务成本','旅客运输成本','fininfom','32','2016-07-02 21:55:18','10','吕布'), ('64','所属科目id','1','2','fininfom','31','2016-07-02 21:55:49','10','吕布'), ('65','所属科目','主营业务成本','旅客运输成本','fininfom','31','2016-07-02 21:55:49','10','吕布'), ('66','所属科目id','1','2','fininfom','30','2016-07-02 21:56:09','10','吕布'), ('67','所属科目','主营业务成本','旅客运输成本','fininfom','30','2016-07-02 21:56:09','10','吕布'), ('68','所属科目id','1','2','fininfom','29','2016-07-02 21:56:28','10','吕布'), ('69','所属科目','主营业务成本','旅客运输成本','fininfom','29','2016-07-02 21:56:28','10','吕布'), ('70','所属科目id','1','2','fininfom','27','2016-07-02 21:56:54','10','吕布'), ('71','所属科目','主营业务成本','旅客运输成本','fininfom','27','2016-07-02 21:56:54','10','吕布'), ('72','所属科目id','3','2','fininfom','25','2016-07-02 21:57:21','10','吕布'), ('73','所属科目','基础设施成本','旅客运输成本','fininfom','25','2016-07-02 21:57:21','10','吕布'), ('74','身份证号',NULL,'11111','admin','1','2016-07-18 15:22:04','1','管理员'), ('75','银行账号（收款账号）',NULL,'22222','admin','1','2016-07-18 15:22:04','1','管理员'), ('76','上级主管',NULL,'大乔','admin','9','2016-07-27 15:32:21','1','管理员'), ('77','身份证号',NULL,'13123123','admin','9','2016-07-27 15:32:21','1','管理员'), ('78','银行账号（收款账号）',NULL,'312312312','admin','9','2016-07-27 15:32:21','1','管理员');
INSERT INTO `jntxfb_email` VALUES ('1','smtp.exmail.qq.com','465','service_send@rockoa.com','zd0zh0od0wew0cc0wee0zw0hd0cz0wac0od0tz09','2016-01-21 22:27:07','自己帐号','1','ssl');
INSERT INTO `jntxfb_email_tpl` VALUES ('1','1','{name}{dt}的工作日报','您好，以下工作日志内容\n{content}\n时间：{optdt}','dayreportemail','工作日志发送','2015-09-02 15:22:04','0','1','管理员'), ('2','1','OA系统[{base_flowname}]待处理','auto','flowchecktodo','流程处理提醒','2015-07-01 12:08:43','1','1','管理员');
INSERT INTO `jntxfb_file` VALUES ('1','1','截图.png',NULL,'png','15504','15.14 KB','upload/2016-04/18_2014428671.png','2','陈稀糊','2016-04-18 20:14:42','127.0.0.1','Chrome','docdeil','20','1'), ('3','1','淄川工作绩效督导平台ST(1).docx',NULL,'docx','23236','22.69 KB','upload/2016-04/18_2216247899.docx','2','陈稀糊','2016-04-18 22:16:24','127.0.0.1','Chrome',NULL,'0','1'), ('4','1','InstallConfig.ini',NULL,'ini','48','48.00 Byte','upload/2016-04/23_2022094231.temp','1',NULL,'2016-04-23 20:22:10','127.0.0.1','MSIE 9',NULL,'0','0'), ('5','1','InstallConfig.ini',NULL,'ini','48','48.00 Byte','upload/2016-04/23_2119193606.temp','1',NULL,'2016-04-23 21:19:21','127.0.0.1','MSIE 9','docdeil','20','0'), ('6','1','newshot.sot',NULL,'sot','23299','22.75 KB','upload/2016-04/23_2120183561.temp','1',NULL,'2016-04-23 21:20:19','127.0.0.1','MSIE 9',NULL,'0','0'), ('8','1','face.jpg',NULL,'jpg','42225','41.24 KB','upload/2016-05/05_2104096315.jpg','1',NULL,'2016-05-05 21:04:10','127.0.0.1','MSIE 9','fininfom','2','0'), ('9','1','1.txt',NULL,'txt','9236484','8.81 MB','upload/2016-06/04_1043471523.txt','1',NULL,'2016-06-04 10:43:54','::1','Chrome','fininfom','5','0'), ('10','1','taskbat.txt',NULL,'txt','306','306.00 Byte','upload/2016-07/02_2131135759.txt','10',NULL,'2016-07-02 21:31:16','127.0.0.1','Firefox','fininfom','24','0'), ('11','1','002.jpg',NULL,'jpg','2886024','2.75 MB','upload/2016-07/21_1023535479.jpg','1',NULL,'2016-07-21 10:29:05','211.155.1.13','Chrome','flow_log','85','0'), ('12','1','001.jpg',NULL,'jpg','319743','312.25 KB','upload/2016-07/21_1025006768.jpg','1',NULL,'2016-07-21 10:30:08','211.155.1.13','Chrome','flow_log','86','0'), ('13','1','001.jpg',NULL,'jpg','319743','312.25 KB','upload/2016-07/21_1025302229.jpg','1',NULL,'2016-07-21 10:30:53','211.155.1.13','Chrome','flow_log','87','2'), ('14','1','新建文本文档.txt',NULL,'txt','11','11.00 Byte','upload/2016-07/27_1329043851.txt','1',NULL,'2016-07-27 13:34:46','221.214.54.122','Chrome','fininfom','34','0'), ('15','1','招标文件--定稿0620.doc',NULL,'doc','1447936','1.38 MB','upload/2016-07/27_1336332784.doc','1',NULL,'2016-07-27 13:42:10','202.110.253.130','Chrome','docdeil','21','0'), ('16','1','招标文件--定稿0620.doc',NULL,'doc','1447936','1.38 MB','upload/2016-07/27_1436521063.doc','1',NULL,'2016-07-27 14:42:32','202.110.253.130','Chrome','flow_log','92','0'), ('17','1','招标文件--定稿0620.doc',NULL,'doc','1447936','1.38 MB','upload/2016-07/27_1446563954.doc','9',NULL,'2016-07-27 14:52:33','202.110.253.130','Chrome','fininfom','35','0'), ('18','1','招标文件--定稿0620.doc',NULL,'doc','1447936','1.38 MB','upload/2016-07/27_1524401271.doc','9',NULL,'2016-07-27 15:30:18','202.110.253.130','Chrome','fininfom','36','0');
INSERT INTO `jntxfb_fininfom` VALUES ('1','0','1','12.00','壹拾贰元整','2016-05-05 20:19:42','1','管理员','2016-05-05',NULL,'5','1','5','5,1,3,2,6,7','2','小乔','小乔','0','支付宝','开发团队','22223334455566','阿里巴巴',NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('2','0','1','52.00','伍拾贰元整','2016-05-05 21:04:13','1','管理员','2016-05-05','这是个总说明？','0','1','5','5,1,3,2,6,7','0',NULL,'小乔','1','支付宝','开发团队','22223334455566','阿里巴巴',NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('3','1','1','599.00','伍佰玖拾玖元整','2016-05-05 21:50:09','1','管理员','2016-05-05',NULL,'0','1',NULL,'1,,,7','1','刘备',NULL,'0','支付宝','开发团队','22223334455566','阿里巴巴','北京会见马云','聊的不错','4','通信设备运用维修',NULL,'0'), ('4','2','1','5000000.00','伍佰万元整','2016-05-08 16:10:08','1','管理员','2016-05-08','启动资金','0','1','7','7,9,10','0',NULL,'刘备',NULL,'支付宝','开发团队','22223334455566','阿里巴巴公司','买房',NULL,'4','通信设备运用维修',NULL,'0'), ('5','0','1','676.00','陆佰柒拾陆元整','2016-06-04 10:44:02','1','管理员','2016-06-04','testtesttesttest','0','1','5','5,1,3,2,6,7','0',NULL,'小乔','1','其它','收款人test','22223334455566','阿里巴巴公司test',NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('6','0','1','1554.00','壹仟伍佰伍拾肆元整','2016-06-20 19:56:45','1','管理员','2016-06-20',NULL,'1','1','7','5,3,2,6,7','3','刘长','刘备','0','其它','收款人test123','22223334455566','test123',NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('7','0','1','1.00','壹元整','2016-06-22 08:44:38','1','管理员','2016-06-22','1111','1','1','7','5,1,3,2,6,7','3','刘长','刘备','0','其它','收款人test123','22223334455566','test123',NULL,NULL,'4','通信设备运用维修-国铁',NULL,'0'), ('8','0','1','444.00','肆佰肆拾肆元整','2016-06-22 09:49:10','1','管理员','2016-06-22',NULL,'0','1','2','5,3,2,6,7','1','貂蝉','管理员１','0','其它','收款人test123','22223334455566','test123',NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('20','0','1','1123.00','壹仟壹佰贰拾叁元整','2016-06-25 22:00:27','1','管理员','2016-06-25',NULL,'0','1',NULL,',1,3,2,,7','0',NULL,NULL,'0','汇款','3333','5555','666',NULL,NULL,'122','运输企业管理费用',NULL,'0'), ('21','0','1','333.00','叁佰叁拾叁元整','2016-06-26 17:51:37','1','管理员','2016-06-26',NULL,'0','1','5','5,1,3,2,6,7','2','小乔','小乔','0','汇款','1111','111111','111111111',NULL,NULL,'9','通信设备运用维修-合资',NULL,'0'), ('22','0','1','222.00','贰佰贰拾贰元整','2016-06-26 22:32:18','1','管理员','2016-06-26',NULL,'2','1',NULL,'5,1,3,2,6,7','2','刘备',NULL,'0','汇款','２２２２','２２２','２２２',NULL,NULL,'15','无线通信设备维修-国铁',NULL,'0'), ('23','0','1','12345.00','壹万贰仟叁佰肆拾伍元整','2016-07-02 10:01:51','1','管理员','2016-07-02',NULL,'0','1',NULL,',1,3,2,6,7','0',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'1','主营业务成本',NULL,'0'), ('24','0','10','444.00','肆佰肆拾肆元整','2016-07-02 21:31:19','10','吕布','2016-07-02',NULL,'0','1','5','5,1,3,2,6,7','0',NULL,'小乔','1',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('25','0','10','555.00','伍佰伍拾伍元整','2016-07-02 21:57:21','10','吕布','2016-07-02',NULL,'0','1','2','5,1,3,2,6,7','1','管理员','管理员１','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('26','0','10','666.00','陆佰陆拾陆元整','2016-07-02 21:32:01','10','吕布','2016-07-02',NULL,'0','1','3','5,3,2,6,7','1','小乔','貂蝉','0',NULL,NULL,NULL,NULL,NULL,NULL,'4','通信设备运用维修',NULL,'0'), ('27','0','10','111.00','壹佰壹拾壹元整','2016-07-02 21:56:54','10','吕布','2016-07-02',NULL,'0','1','2','5,1,3,2,6,7','1','管理员','管理员１','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('28','0','10','222.00','贰佰贰拾贰元整','2016-07-02 21:52:16','10','吕布','2016-07-02',NULL,'2','1','5','5,1,3,2,6,7','2','小乔','小乔','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('29','0','10','333.00','叁佰叁拾叁元整','2016-07-02 21:56:28','10','吕布','2016-07-02',NULL,'0','1','2','5,1,3,2,6,7','1','管理员','管理员１','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('30','0','10','777.00','柒佰柒拾柒元整','2016-07-02 21:56:09','10','吕布','2016-07-02',NULL,'0','1','3','5,3,2,6,7','1','小乔','貂蝉','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('31','0','10','888.00','捌佰捌拾捌元整','2016-07-02 21:55:49','10','吕布','2016-07-02',NULL,'0','1','2','5,1,2,6,7','1','管理员','管理员１','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('32','0','10','999.00','玖佰玖拾玖元整','2016-07-02 21:55:18','10','吕布','2016-07-02',NULL,'0','1','2','5,1,3,2,6,7','1','管理员','管理员１','0',NULL,NULL,NULL,NULL,NULL,NULL,'2','旅客运输成本',NULL,'0'), ('33','0','1','10001.00','壹万零壹元整','2016-07-18 15:23:00','1','管理员','2016-07-18',NULL,'0','1',NULL,',1,3,2,6,7','0',NULL,NULL,'0',NULL,'管理员','222221111',NULL,NULL,NULL,'1','主营业务成本','11111222222','0'), ('34','1','1','10.00','壹拾元整','2016-07-27 13:34:50','1','管理员','2016-07-27',NULL,'0','1',NULL,'1,,','1','管理员',NULL,'0','支付宝','管理员','222221111','12313','上学','上班',NULL,NULL,NULL,'0'), ('35','0','9','100.00','壹佰元整','2016-07-27 14:52:36','9','赵子龙','2016-07-27','开始阿里~~~','0','1','1','5,1,3,1,6,7','1','貂蝉','管理员','0',NULL,'赵子龙','1231312',NULL,NULL,NULL,'6','维保费-国铁','316464412448','0'), ('36','1','9','900.00','玖佰元整','2016-07-27 15:30:23','9','赵子龙','2016-07-27',NULL,'0','1',NULL,',,','0',NULL,NULL,'0','汇款','赵子龙','1231312','31231231231','开大会了','大会圆满成功',NULL,NULL,NULL,'0');
INSERT INTO `jntxfb_fininfos` VALUES ('8','8','快递费','2016-01-25',NULL,'23.00',NULL,'0',NULL), ('9','7','办公用品','2016-01-25',NULL,'2.00',NULL,'0',NULL), ('10','7','停车费','2016-01-25',NULL,'12.00',NULL,'1',NULL);
INSERT INTO `jntxfb_flow_bill` VALUES ('1','KL-20151227-0001','kq_info','48','1','请假条','3','2016-04-27 21:46:14','1','管理员','4,3','0','0','2015-12-27',NULL), ('2','KL-20151227-0002','kq_info','51','1','请假条','3','2016-04-27 21:46:14','1','管理员','4,3','0','0','2015-12-27',NULL), ('3','KL-20160105-0001','kq_info','52','1','请假条','1','2016-04-27 21:46:14','1','管理员','7,3,7','0','0','2016-01-05',NULL), ('4','KL-20160423-0001','kq_info','54','1','请假条','1','2016-04-27 21:46:14','1','管理员','7,3','0','0','2016-04-23',NULL), ('5','KL-20160423-0002','kq_info','55','1','请假条','1','2016-04-27 21:46:14','1','管理员','7,3,7','0','0','2016-04-23',NULL), ('6','KL-20160423-0003','kq_info','56','1','请假条','1','2016-05-08 16:10:49','1','管理员','7,3','0','0','2016-04-23',NULL), ('7','KJ-20151127-0001','kq_info','42','2','加班单','1','2016-04-27 21:46:14','1','管理员','3','0','0','2015-11-27',NULL), ('8','KJ-20151227-0001','kq_info','49','2','加班单','3','2016-04-27 21:46:14','1','管理员','3','0','0','2015-12-27',NULL), ('9','KJ-20151227-0002','kq_info','50','2','加班单','3','2016-04-27 21:46:14','1','管理员','3','0','0','2015-12-27',NULL), ('10','KJ-20160423-0001','kq_info','57','2','加班单','1','2016-04-27 21:46:14','1','管理员','3','0','1','2016-04-23',NULL), ('11','KW-20151127-0001','kq_out','9','3','外出出差','1','2016-04-27 21:46:14','1','管理员','3','0','0','2015-11-27',NULL), ('12','KW-20151227-0001','kq_out','10','3','外出出差','3','2016-04-27 21:46:14','1','管理员','3','0','0','2015-12-27',NULL), ('13','YP-20160302-0001','supplea','9','6','物品领用','5','2016-04-27 21:46:14','1','管理员','5','0','0','2016-03-02',NULL), ('14','YP-20160425-0001','supplea','10','6','物品领用','1','2016-04-27 21:46:14','1','管理员','5','0','0','2016-04-25',NULL), ('15','YA-20160424-0001','reward','1','14','奖惩处罚','1','2016-04-27 21:46:14','1','管理员','7,3','0','0','2016-04-24',NULL), ('16','YB-20160307-0001','careserve','3','15','车辆预定','1','2016-04-27 21:46:14','1','管理员','7,5','0','0','2016-03-07',NULL), ('17','YC-20160423-0001','meet','154','16','会议预定','1','2016-04-27 21:46:14','1','管理员','4','0','0','2016-04-23',NULL), ('18','FI-20160315-0001','docdeil','19','4','文件传送','1','2016-04-27 21:46:14','1','管理员','1','0','1','2016-03-15',NULL), ('19','FI-20160404-0001','docdeil','20','4','文件传送','1','2016-04-27 21:46:14','1','管理员','5,1','0','1','2016-04-04',NULL), ('20','FX-20160414-0001','demand','6','17','业务需求','1','2016-04-27 21:46:14','1','管理员','1,0','0','0','2016-04-14',NULL), ('21','HR-20160426-0001','hrpositive','3','7','转正申请','1','2016-04-27 21:46:14','1','管理员','7,3','0','0','2016-04-26',NULL), ('22','HE-20160426-0001','hrredund','3','9','离职申请','1','2016-04-27 21:46:14','1','管理员','7,3','0','0','2016-04-26',NULL), ('23','HT-20160426-0001','hrtransfer','4','8','人事调动','1','2016-04-27 21:46:14','1','管理员','3','0','0','2016-04-26',NULL), ('24','YB-20160428-0001','careserve','4','15','车辆预定','1','2016-04-28 20:29:14','1','管理员','7,5','0','0','2016-04-28',NULL), ('25','KL-20151020-0001','kq_info','40','1','请假条','1','2016-04-28 20:44:11','1','管理员',NULL,'0','1','2015-10-20',NULL), ('26','PA-20160505-0001','fininfom','2','11','费用报销','1','2016-05-05 21:04:13','1','管理员','5,1,3,2,6,7','0','0','2016-05-05',NULL), ('27','PA-20160505-0002','fininfom','1','11','费用报销','1','2016-05-05 20:19:42','1','管理员','5,1,3,2,6,7','1','2','2016-05-05',NULL), ('28','PB-20160505-0001','fininfom','3','12','出差报销','1','2016-05-05 21:50:09','1','管理员','1,,,7','0','1','2016-05-05',NULL), ('29','PC-20160508-0001','fininfom','4','13','借款单','1','2016-05-08 16:10:08','1','管理员','7,9,10','0','0','2016-05-08',NULL), ('30','PA-20160604-0001','fininfom','5','11','费用报销','1','2016-06-20 22:08:50','1','管理员','5,1,3,2,6,7','0','0','2016-06-04',NULL), ('31','PA-20160620-0001','fininfom','6','11','费用报销','1','2016-06-20 22:08:50','1','管理员','5,3,2,6,7','0','3','2016-06-20',NULL), ('32','PA-20160622-0001','fininfom','7','11','费用报销','1','2016-06-22 08:44:38','1','管理员','5,1,3,2,6,7','0','3','2016-06-22',NULL), ('33','PA-20160622-0002','fininfom','8','11','费用报销','1','2016-06-22 09:49:10','1','管理员','5,3,2,6,7','0','1','2016-06-22',NULL), ('34','PA-20160623-0001','fininfom','16','11','费用报销','1','2016-06-23 16:50:24','1','管理员',NULL,'0','0','2016-06-23',NULL), ('35','PA-20160623-0002','fininfom','17','11','费用报销','1','2016-06-23 16:51:40','1','管理员','7,9,10','0','0','2016-06-23',NULL), ('36','PA-20160623-0003','fininfom','18','11','费用报销','1','2016-06-23 16:56:31','1','管理员','7,9,10','0','0','2016-06-23',NULL), ('37','PA-20160623-0004','fininfom','19','11','费用报销','1','2016-06-23 16:57:43','1','管理员',NULL,'0','0','2016-06-23',NULL), ('38','PA-20160625-0001','fininfom','20','11','费用报销','1','2016-06-25 22:00:27','1','管理员',',1,3,2,,7','0','0','2016-06-25',NULL), ('39','PA-20160626-0001','fininfom','21','11','费用报销','1','2016-06-26 17:51:37','1','管理员','5,1,3,2,6,7','0','2','2016-06-26',NULL), ('40','PA-20160626-0002','fininfom','22','11','费用报销','1','2016-06-26 22:32:18','1','管理员','5,1,3,2,6,7','0','2','2016-06-26',NULL), ('41','HR-20150801-0001','hrpositive','1','7','转正申请','1','2016-06-26 22:27:40','1','管理员',NULL,'0','1','2015-08-01',NULL), ('42','PA-20160702-0001','fininfom','23','11','费用报销','1','2016-07-02 10:01:51','1','管理员',',1,3,2,6,7','0','0','2016-07-02',NULL), ('43','PA-20160702-0002','fininfom','24','11','费用报销','10','2016-07-02 21:31:19','10','吕布','5,1,3,2,6,7','0','0','2016-07-02',NULL), ('44','PA-20160702-0003','fininfom','25','11','费用报销','10','2016-07-02 21:57:21','10','吕布','5,1,3,2,6,7','0','1','2016-07-02',NULL), ('45','PA-20160702-0004','fininfom','26','11','费用报销','10','2016-07-02 21:32:01','10','吕布','5,3,2,6,7','0','1','2016-07-02',NULL), ('46','PA-20160702-0005','fininfom','27','11','费用报销','10','2016-07-02 21:56:54','10','吕布','5,1,3,2,6,7','0','1','2016-07-02',NULL), ('47','PA-20160702-0006','fininfom','28','11','费用报销','10','2016-07-02 21:52:16','10','吕布','5,1,3,2,6,7','0','2','2016-07-02',NULL), ('48','PA-20160702-0007','fininfom','29','11','费用报销','10','2016-07-02 21:56:28','10','吕布','5,1,3,2,6,7','0','1','2016-07-02',NULL), ('49','PA-20160702-0008','fininfom','30','11','费用报销','10','2016-07-02 21:56:09','10','吕布','5,3,2,6,7','0','1','2016-07-02',NULL), ('50','PA-20160702-0009','fininfom','31','11','费用报销','10','2016-07-02 21:55:49','10','吕布','5,1,2,6,7','0','1','2016-07-02',NULL), ('51','PA-20160702-0010','fininfom','32','11','费用报销','10','2016-07-02 21:55:18','10','吕布','5,1,3,2,6,7','0','1','2016-07-02',NULL), ('52','PA-20160718-0001','fininfom','33','11','费用报销','1','2016-07-18 15:22:59','1','管理员',',1,3,2,6,7','0','0','2016-07-18',NULL), ('53','PB-20160727-0001','fininfom','34','12','出差报销','1','2016-07-27 13:34:50','1','管理员','1,,','0','1','2016-07-27',NULL), ('54','FI-20160727-0001','docdeil','21','4','文件传送','1','2016-07-27 13:42:20','1','管理员','6','0','0','2016-07-27',NULL), ('55','PA-20160727-0001','fininfom','35','11','费用报销','9','2016-07-27 14:52:36','9','赵子龙','5,1,3,1,6,7','0','1','2016-07-27',NULL), ('56','PB-20160727-0002','fininfom','36','12','出差报销','9','2016-07-27 15:30:23','9','赵子龙',',,','0','0','2016-07-27',NULL);
INSERT INTO `jntxfb_flow_checks` VALUES ('1','fininfom','22','34','1,3','管理员,貂蝉','5','小乔','2016-06-26 15:39:29'), ('2','fininfom','8','34','3','貂蝉','5','小乔','2016-06-26 19:39:15'), ('3','fininfom','7','34','1,3','管理员,貂蝉','5','小乔','2016-06-26 19:39:37'), ('4','fininfom','6','34','3','貂蝉','5','小乔','2016-07-01 15:19:45'), ('5','fininfom','31','34','1','管理员','5','小乔','2016-07-03 13:13:53'), ('6','fininfom','30','34','3','貂蝉','5','小乔','2016-07-03 13:14:02'), ('7','fininfom','26','34','3','貂蝉','5','小乔','2016-07-03 13:14:15'), ('8','fininfom','25','34','1,3','管理员,貂蝉','5','小乔','2016-07-03 13:14:29'), ('9','fininfom','35','35','1','管理员','3','貂蝉','2016-07-27 14:58:46');
INSERT INTO `jntxfb_flow_course` VALUES ('1','1','主管审核',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'1','2015-01-29 11:19:45',NULL,'0','1','0'), ('2','1','人事确认',NULL,'1','0',NULL,NULL,NULL,'rank',NULL,'人事经理',NULL,'0','2016-04-06 21:17:19','一天内','0','1','1'), ('19','2','开始',NULL,'0','0','all','所有人员',NULL,'start',NULL,NULL,NULL,'0','2015-01-13 17:12:00',NULL,'0','1','0'), ('20','2','人事确认',NULL,'19','0',NULL,NULL,NULL,'rank',NULL,'人事经理',NULL,'0','2015-01-13 17:13:34','超过8小时','0','1','0'), ('21','1','总经理审核',NULL,'2','0',NULL,NULL,NULL,'rank',NULL,'董事长',NULL,'1','2016-03-02 16:13:55','超过3天','0','1','0'), ('22','1','结束',NULL,'2','0',NULL,NULL,NULL,'end',NULL,NULL,NULL,'0','2015-01-13 16:45:51','小于3天','0','1','0'), ('23','2','主管审核',NULL,'19','0',NULL,NULL,NULL,'super',NULL,NULL,NULL,'0','2015-01-13 17:12:19',NULL,'0','1','0'), ('24','3','主管审核',NULL,'0','0','all','所有人员',NULL,'user','3','貂蝉',NULL,'0','2015-06-24 11:29:19',NULL,'0','1','0'), ('25','4','接收人签收','qianshou','0','0','all','所有人员',NULL,'auto',NULL,NULL,NULL,'0','2016-02-29 20:43:55',NULL,'0','0','0'), ('26','6','行政发放',NULL,'0','0','all','所有人员',NULL,'user','5','小乔',NULL,'0','2015-07-23 16:18:50',NULL,'0','1','0'), ('27','7','领导审批',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-08-01 11:52:06',NULL,'0','1','0'), ('28','7','人事审批',NULL,'27','0',NULL,NULL,NULL,'rank',NULL,'人事经理',NULL,'0','2015-08-01 11:52:23',NULL,'0','1','0'), ('29','9','领导审批',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-08-02 15:07:56',NULL,'0','1','0'), ('30','9','人事审批',NULL,'29','0',NULL,NULL,NULL,'rank',NULL,'人事经理',NULL,'0','2015-08-02 15:08:07',NULL,'0','1','0'), ('31','8','人事经理审批',NULL,'0','0','all','所有人员',NULL,'rank',NULL,'人事经理',NULL,'0','2015-08-03 13:29:04',NULL,'0','1','0'), ('32','10','主管审核',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-08-05 12:08:06',NULL,'0','1','0'), ('33','11','科目负责人审核',NULL,'0','0','all','所有人员',NULL,'group',NULL,'科目负责人','科目负责人','0','2016-06-26 14:03:48',NULL,'0','0','0'), ('34','11','财务审批',NULL,'33','0',NULL,NULL,NULL,'depta','4','财务科','科长','0','2016-06-26 14:04:47',NULL,'0','1','0'), ('35','11','科长审核',NULL,'34','0',NULL,NULL,NULL,'group',NULL,'科长','科长','0','2016-06-26 14:06:11',NULL,'0','0','0'), ('36','12','上级审批',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-08-25 11:17:18',NULL,'0','1','0'), ('37','12','财务主管审批',NULL,'36','0',NULL,NULL,NULL,'rank',NULL,'财务经理',NULL,'0','2015-08-25 11:18:00',NULL,'0','1','0'), ('38','12','出纳付款',NULL,'37','0',NULL,NULL,NULL,'rank',NULL,'出纳',NULL,'0','2015-08-25 11:18:19',NULL,'0','1','0'), ('39','13','上级审批',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-08-25 11:22:06',NULL,'0','1','0'), ('40','14','上级审批','rewardobj','0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-09-14 14:34:46',NULL,'0','1','0'), ('41','14','人事确认',NULL,'40','0',NULL,NULL,NULL,'rank',NULL,'人事经理',NULL,'0','2015-09-14 13:52:00',NULL,'0','1','0'), ('42','13','财务主管审批',NULL,'39','0',NULL,NULL,NULL,'rank',NULL,'财务经理',NULL,'0','2015-09-15 15:52:00',NULL,'0','1','0'), ('43','13','财务付款',NULL,'42','0',NULL,NULL,NULL,'rank',NULL,'出纳',NULL,'0','2015-09-15 15:52:17',NULL,'0','1','0'), ('44','15','上级审批',NULL,'0','0','all','所有人员',NULL,'super',NULL,NULL,NULL,'0','2015-09-23 14:09:09',NULL,'0','1','0'), ('45','15','行政审批',NULL,'44','0',NULL,NULL,NULL,'rank',NULL,'行政前台',NULL,'0','2015-09-23 14:09:33',NULL,'0','1','0'), ('46','12','总经理审批',NULL,'36','38',NULL,NULL,NULL,'rank',NULL,'总经理',NULL,'0','2015-10-27 10:26:55','大于5千','0','1','0'), ('47','16','行政审批',NULL,'0','0','all','所有人员',NULL,'rank',NULL,'行政主管',NULL,'0','2015-11-22 20:53:09',NULL,'0','1','0'), ('48','17','技术部受理',NULL,'0','0','all','所有人员',NULL,'rank',NULL,'OA项目经理',NULL,'0','2015-11-28 20:12:17',NULL,'1','1','0'), ('49','17','技术人员处理','jishuculi','48','0',NULL,NULL,NULL,'auto',NULL,NULL,NULL,'0','2015-11-28 20:12:22',NULL,'0','1','0'), ('50','20','人事审批',NULL,'0','0','all','所有人员',NULL,'rank',NULL,'人事经理',NULL,'0','2015-12-30 18:39:12',NULL,'0','1','0'), ('51','11','分管段长审批',NULL,'35','0',NULL,NULL,NULL,'group',NULL,'副段长','副段长','0','2016-06-26 14:07:00',NULL,'0','1','0'), ('52','11','段长审核',NULL,'51','0',NULL,NULL,NULL,'depta','7','段长办公室','段长','0','2016-06-26 15:04:57',NULL,'0','1','0');
INSERT INTO `jntxfb_flow_courseact` VALUES ('1','4','25','签收','已签收','1','0','0',NULL,NULL,'green'), ('2','4','25','不签收',NULL,'2','-1','1',NULL,NULL,'red'), ('3','6','26','发放','已发放','1','0','0',NULL,NULL,'green'), ('4','6','26','驳回',NULL,'2','-1','1',NULL,NULL,'red'), ('6','12','38','付款','已付款','1','0','0',NULL,NULL,'green'), ('7','13','43','付款','已付款','1','0','0',NULL,NULL,'green'), ('11','11','51','不通过','退回','2','-1','2',NULL,NULL,'red'), ('12','11','52','不通过','退回','2','0','2',NULL,NULL,'red'), ('13','11','51','完毕','完毕存入预算库','3','0','3','savebudget','保存入预算库，审核结束','green'), ('14','11','52','完毕','完毕存入预算库','1','0','1','savebudget','保存入预算库，流程结束','green'), ('15','11','51','通过',NULL,'1','0','1',NULL,NULL,'green');
INSERT INTO `jntxfb_flow_courseinput` VALUES ('1','0','处理人表单',NULL,'0',NULL), ('2','1','changeuser','changeuser','0','下一步处理人');
INSERT INTO `jntxfb_flow_element` VALUES ('1','1','请假类型','qjkind','rockcombo','1',NULL,'1','leavetypem','1','1',NULL,'0','1',NULL,'80'), ('2','1','开始时间','stime','datetime','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'100'), ('3','1','截止时间','etime','datetime','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'100'), ('4','1','请假(小时)','totals','number','5','0','1',NULL,'1','1',NULL,'0','0',NULL,'100'), ('5','1','说明','explain','textarea','6',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('6','1','类型','kind','fixed','0','请假','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('7','2','类型','kind','fixed','0','加班','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('8','2','开始时间','stime','datetime','1',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'100'), ('9','2','截止时间','etime','datetime','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'100'), ('10','2','说明','explain','textarea','4',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('11','2','加班(小时)','totals','number','3','0','1',NULL,'1','1',NULL,'0','1',NULL,'100'), ('12','3','外出类型','atype','select','0',NULL,'1','外出,出差','1','1',NULL,'0','1',NULL,NULL), ('13','3','外出时间','outtime','datetime','1',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'155'), ('14','3','预计回岗','intime','datetime','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'155'), ('15','3','外出地址','address','text','3',NULL,'1',NULL,'1','1',NULL,'0','0','flex:0.4',NULL), ('16','3','外出事由','reason','textarea','4',NULL,'1',NULL,'1','1',NULL,'0','1','flex:0.6',NULL), ('17','3','说明','explain','textarea','5',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('18','10','异常类型','errtype','rockcombo','0',NULL,'1','dakaerrtype','1','1',NULL,'0','1',NULL,NULL), ('19','10','申请日期','dt','date','1',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'12%'), ('20','10','应打卡时间','ytime','time','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'12%'), ('21','10','说明','explain','textarea','3',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('22','4','标题','title','text','0',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'12%'), ('23','4','签收人','recename','changeusercheck','1',NULL,'1','receid','1','1',NULL,'0','1',NULL,'12%'), ('24','4','签收人id','receid','hidden','2',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('25','4','说明','explain','textarea','4',NULL,'0',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('26','16','会议室','hyname','rockcombo','0',NULL,'1','meeting','1','1',NULL,'0','1',NULL,NULL), ('27','16','主题','title','text','1',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('28','16','开始时间','startdt','datetime','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'155'), ('29','16','结束时间','enddt','datetime','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,'155'), ('30','16','参会人员','joinname','changedeptusercheck','4',NULL,'0','joinid','1','1',NULL,'0','0','flex:1',NULL), ('31','16','说明','explain','textarea','5',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('32','17','标题','title','text','0',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,'18%'), ('33','17','内容','content','htmlediter','1',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('34','17','说明','explain','textarea','3',NULL,'0',NULL,'1','1',NULL,'0','0','flex:1,align:\"left\"',NULL), ('35','14','奖惩对象','object','changeuser','0',NULL,'1','objectid','1','1',NULL,'0','1',NULL,NULL), ('36','14','奖惩类型','atype','rockcombo','1',NULL,'1','rewardtype','1','1',NULL,'0','1',NULL,NULL), ('37','14','奖惩结果','result','rockcombo','2',NULL,'1','rewardresult','1','1',NULL,'0','1',NULL,NULL), ('38','14','奖惩金额','money','rockcombo','3','0','1','rewardmoney,value','1','1',NULL,'0','1',NULL,NULL), ('39','14','说明','explain','textarea','4',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('40','14','奖惩对象id','objectid','text','0',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('41','20','销假类型','type','select','0',NULL,'1','0|请假销假,1|外出销假','1','1',NULL,'0','0',NULL,NULL), ('42','20','销假单号','mseric','select','1',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('43','20','实际开始时间','stime','text','2',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('44','20','实际截止时间','etime','datetime','3',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('45','20','说明','explain','textarea','4',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('46','20','最后请假时间(小时)','totals','number','5',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('47','20','是否销假全部','xjall','select','1',NULL,'1','0|否,1|是','1','1',NULL,'0','0',NULL,NULL), ('48','6','物品名称','aname','hidden','0',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('49','6','办公用品ID','aid','select','1',NULL,'1','getsupplea','1','0',NULL,'0','0',NULL,NULL), ('50','6','说明','explain','textarea','2',NULL,'0',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('51','6','领用数量','total','number','3','0','1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('52','21','信息类型','typenum','rockcombo','0',NULL,'1','infortype,num','1','1',NULL,'0','0',NULL,NULL), ('53','21','内容','content','htmlediter','2',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('54','21','主题','title','text','1',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('55','21','发布给','faobjname','changedeptusercheck','3',NULL,'0','faobjid','1','1',NULL,'0','0',NULL,NULL), ('56','21','发布者/部门','zuozhe','text','4','{deptname}','0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('57','21','时间','indate','date','5','{date}','0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('58','21','类型名称','typename','hidden','0',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('59','21','排序号','xu','number','6','0','0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('60','21','显示首页','isshow','checkbox','7','1','0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('61','11','单据类型','type','fixed','0','0','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('62','11','申请日期','applydt','text','1','{date}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('63','11','附单据(张)','bills','number','2','0','0',NULL,'1','1',NULL,'0','1',NULL,NULL), ('68','11','报销金额','money','text','7','0','1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('69','11','大写金额','moneycn','text','8',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('70','11','说明','explain','textarea','9',NULL,'0',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('71','7','职位','ranking','text','0','{ranking}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('72','7','入职日期','entrydt','text','1','{workdate}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('73','7','试用到期日','syenddt','date','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('74','7','转正日期','positivedt','date','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('75','7','说明','explain','textarea','5',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('76','9','职位','ranking','text','0','{ranking}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('77','9','入职日期','entrydt','text','1','{workdate}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('78','9','离职类型','redundtype','rockcombo','2',NULL,'1','redundtype','1','1',NULL,'0','1',NULL,NULL), ('79','9','离职日期','quitdt','date','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('80','9','离职原因','redundreson','checkboxall','4',NULL,'1','redundreson','1','1',NULL,'0','1','flex:0.5',NULL), ('81','9','说明','explain','textarea','5',NULL,'1',NULL,'1','1',NULL,'0','0','flex:0.8',NULL), ('82','8','要调动人','tranname','changeuser','0',NULL,'1','tranuid','1','1',NULL,'0','1',NULL,NULL), ('83','8','调动类型','trantype','rockcombo','1',NULL,'1','transfertype','1','1',NULL,'0','1',NULL,NULL), ('84','8','原来部门','olddeptname','text','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('85','8','调动后部门','newdeptname','changedept','3',NULL,'1','newdeptid','1','1',NULL,'0','1',NULL,NULL), ('86','8','原来职位','oldranking','text','4',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('87','8','调动后职位','newranking','text','5',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('88','8','生效日期','effectivedt','date','6',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('89','8','说明','explain','textarea','7',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('90','8','要调动人Id','tranuid','text','0',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('91','8','新部门Id','newdeptid','text','1',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('92','21','类型','atype','hidden','0','0','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('93','23','资产类别','typename','rockcombo','0',NULL,'1','assetstype','1','1',NULL,'0','0',NULL,NULL), ('94','23','编号','num','text','1',NULL,'0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('95','23','名称','title','text','2',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('96','23','品牌','brand','rockcombo','3',NULL,'0','assetsbrand','1','1',NULL,'0','0',NULL,NULL), ('97','23','存放地点','address','rockcombo','4',NULL,'1','assetsaddress','1','1',NULL,'0','0',NULL,NULL), ('98','23','规格型号','model','text','5',NULL,'0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('99','23','资产来源','laiyuan','rockcombo','6',NULL,'1','assetslaiyuan','1','1',NULL,'0','0',NULL,NULL), ('100','23','状态','state','rockcombo','7',NULL,'1','assetsstate','1','1',NULL,'0','0',NULL,NULL), ('101','23','购进日期','buydt','date','9',NULL,'0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('102','23','价格','price','number','11',NULL,'0',NULL,'1','1',NULL,'0','0',NULL,NULL), ('103','23','说明备注','remark','textarea','11',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('104','24','车牌号','carnum','text','0',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL);
INSERT INTO `jntxfb_flow_element` VALUES ('105','24','车辆类型','cartype','rockcombo','1',NULL,'1','cartype','1','1',NULL,'0','0',NULL,NULL), ('106','24','车辆品牌','carbrand','rockcombo','2',NULL,'1','carbrand','1','1',NULL,'0','0',NULL,NULL), ('107','24','型号','carmode','text','3',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('108','24','购买日期','buydt','date','5',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('109','24','购买价格','buyprice','number','6',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('110','24','车架号','framenum','text','7',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('111','24','发动机号','enginenb','text','8',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('112','24','是否公开使用','ispublic','checkbox','9','1','1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('113','24','说明','explain','htmlediter','10',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('114','24','状态','state','rockcombo','11',NULL,'1','carstate','1','1',NULL,'0','0',NULL,NULL), ('115','15','使用者','usename','changedeptusercheck','0',NULL,'1','useid','1','1',NULL,'0','0',NULL,NULL), ('116','15','使用人数','useren','number','1','0','1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('117','15','开始时间','startdt','datetime','2',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,'100'), ('118','15','截止时间','enddt','datetime','3',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,'100'), ('119','15','目的地','address','text','4',NULL,'1',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('120','15','线路','xianlines','text','5',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('121','15','预定车辆','carid','select','6',NULL,'1','getcardata','1','0',NULL,'0','0',NULL,NULL), ('122','15','车牌号','carnum','hidden','7',NULL,'1',NULL,'1','1',NULL,'0','0',NULL,NULL), ('123','15','驾驶员','jianame','changeusercheck','8',NULL,'1','jiaid','1','1',NULL,'0','0',NULL,NULL), ('124','15','说明','explain','textarea','9',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('129','12','单据类型','type','fixed','0','1','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('130','12','申请日期','applydt','text','1','{date}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('131','12','附单据(张)','bills','number','2','0','0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('132','12','收款人全称','fullname','text','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('133','12','付款方式','paytype','rockcombo','4',NULL,'1','finpaytype','1','1',NULL,'0','1',NULL,NULL), ('134','12','收款帐号','cardid','text','5',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('135','12','开户行','openbank','text','6',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('136','12','报销金额','money','text','7','0','1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('137','12','大写金额','moneycn','text','8',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('138','12','说明','explain','textarea','9',NULL,'0',NULL,'1','0',NULL,'0','0',NULL,NULL), ('139','12','报销项目','name','rockcombo','1',NULL,'1','finaitems','1','0',NULL,'1','0',NULL,NULL), ('140','12','发生日期','startdt','date','2',NULL,'1',NULL,'1','0',NULL,'1','0',NULL,NULL), ('141','12','金额','moneys','number','3',NULL,'1',NULL,'1','0',NULL,'1','0',NULL,NULL), ('142','12','说明','explain','text','4',NULL,'0',NULL,'1','0',NULL,'1','0',NULL,NULL), ('143','13','单据类型','type','fixed','0','2','1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('144','13','申请日期','applydt','text','1','{date}','1',NULL,'1','1','readonly','0','1',NULL,NULL), ('145','13','借款用途','purpose','text','2',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('146','13','收款人全称','fullname','text','3',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('147','13','付款方式','paytype','rockcombo','4',NULL,'1','finpaytype','1','1',NULL,'0','0',NULL,NULL), ('148','13','收款帐号','cardid','text','5',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('149','13','开户行','openbank','text','6',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('150','13','借款金额','money','text','7','0','1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('151','13','借款金额大写','moneycn','text','8',NULL,'1',NULL,'1','0',NULL,'0','0',NULL,NULL), ('152','13','说明','explain','textarea','9',NULL,'0',NULL,'1','1',NULL,'0','0','flex:1',NULL), ('157','12','出差目的','purpose','text','10',NULL,'1',NULL,'1','1',NULL,'0','0','flex:0.5',NULL), ('158','12','出差成果','purresult','text','12',NULL,'1',NULL,'1','1',NULL,'0','1','flex:0.5',NULL), ('159','12','发生地点','address','text','0',NULL,'1',NULL,'1','0',NULL,'1','0',NULL,NULL), ('160','6','申请时间','optdt','datetime','0',NULL,'0',NULL,'0','1',NULL,'0','1',NULL,'160'), ('161','4','相关文件','filestr','text','3',NULL,'0',NULL,'0','0',NULL,'0','0','flex:0.5,align:\"left\"',NULL), ('162','17','操作时间','optdt','datetime','2',NULL,'0',NULL,'0','1',NULL,'0','1',NULL,'155'), ('163','11','所属科目','subjectname','changesubject','0',NULL,'1','subjectid','1','1',NULL,'0','1',NULL,NULL), ('164','11','身份证','idnum','text','0',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('165','11','收款人全称','fullname','text','0',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL), ('166','11','收款账号','cardid','text','0',NULL,'1',NULL,'1','1',NULL,'0','1',NULL,NULL);
INSERT INTO `jntxfb_flow_log` VALUES ('1','kq_info','57','1','通过','人事确认','20','2016-04-27 21:47:24','好的','127.0.0.1','MSIE 9','貂蝉','3','2',NULL), ('2','carm','2','1',NULL,'提交','0','2016-04-27 22:30:48',NULL,'127.0.0.1','MSIE 9','管理员','1','24',NULL), ('3','assetm','5','1',NULL,'提交','0','2016-04-27 22:42:51',NULL,'127.0.0.1','MSIE 9','管理员','1','23',NULL), ('4','carm','1','1',NULL,'提交','0','2016-04-28 19:36:09',NULL,'127.0.0.1','MSIE 9','管理员','1','24',NULL), ('5','carm','2','1',NULL,'提交','0','2016-04-28 19:36:27',NULL,'127.0.0.1','MSIE 9','管理员','1','24',NULL), ('6','assetm','1','1',NULL,'提交','0','2016-04-28 19:39:37',NULL,'127.0.0.1','MSIE 9','管理员','1','23',NULL), ('7','careserve','4','1',NULL,'提交','0','2016-04-28 20:29:14',NULL,'127.0.0.1','MSIE 9','管理员','1','15',NULL), ('8','fininfom','1','1',NULL,'提交','0','2016-05-05 19:55:50',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('9','fininfom','2','1',NULL,'提交','0','2016-05-05 19:59:05',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('10','fininfom','2','1',NULL,'提交','0','2016-05-05 20:03:58',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('11','fininfom','2','1',NULL,'提交','0','2016-05-05 20:05:00',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('12','fininfom','2','1',NULL,'提交','0','2016-05-05 20:05:31',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('13','fininfom','2','1',NULL,'提交','0','2016-05-05 20:16:32',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('14','fininfom','2','1',NULL,'提交','0','2016-05-05 20:16:33',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('15','fininfom','2','1',NULL,'提交','0','2016-05-05 20:17:26',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('16','fininfom','1','1',NULL,'提交','0','2016-05-05 20:19:42',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('17','fininfom','2','1',NULL,'提交','0','2016-05-05 21:02:42',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('18','fininfom','2','1',NULL,'提交','0','2016-05-05 21:04:13',NULL,'127.0.0.1','MSIE 9','管理员','1','11',NULL), ('19','fininfom','3','1',NULL,'提交','0','2016-05-05 21:47:39',NULL,'127.0.0.1','MSIE 9','管理员','1','12',NULL), ('20','fininfom','3','1',NULL,'提交','0','2016-05-05 21:50:09',NULL,'127.0.0.1','MSIE 9','管理员','1','12',NULL), ('21','fininfom','4','1',NULL,'提交','0','2016-05-08 09:37:21',NULL,'127.0.0.1','MSIE 9','管理员','1','13',NULL), ('24','fininfom','4','1',NULL,'提交','0','2016-05-08 16:03:12',NULL,'127.0.0.1','MSIE 9','管理员','1','13',NULL), ('25','fininfom','4','1',NULL,'提交','0','2016-05-08 16:10:08',NULL,'127.0.0.1','MSIE 9','管理员','1','13',NULL), ('26','kq_info','56','1',NULL,'提交','0','2016-05-08 16:10:49',NULL,'127.0.0.1','MSIE 9','管理员','1','1',NULL), ('27','fininfom','7','1',NULL,'提交','0','2016-06-22 08:44:38',NULL,'::1','Firefox','管理员','1','11',NULL), ('28','fininfom','8','1',NULL,'提交','0','2016-06-22 09:49:10',NULL,'::1','Firefox','管理员','1','11',NULL), ('29','fininfom','17','1',NULL,'提交','0','2016-06-23 16:51:40',NULL,'::1','Firefox','管理员','1','11',NULL), ('30','fininfom','18','1',NULL,'提交','0','2016-06-23 16:56:31',NULL,'::1','Firefox','管理员','1','11',NULL), ('31','fininfom','20','1',NULL,'提交','0','2016-06-25 22:00:27',NULL,'::1','Chrome','管理员','1','11',NULL), ('32','fininfom','21','1',NULL,'提交','0','2016-06-26 14:01:23',NULL,'::1','Chrome','管理员','1','11',NULL), ('33','fininfom','22','1',NULL,'提交','0','2016-06-26 15:30:41',NULL,'::1','Chrome','管理员','1','11',NULL), ('34','fininfom','22','1','通过','科目负责人审核','33','2016-06-26 15:39:29',NULL,'::1','Chrome','小乔','5','11',NULL), ('35','fininfom','21','2','不通过','科目负责人审核','33','2016-06-26 15:40:42','就是不通过','::1','Chrome','小乔','5','11',NULL), ('36','fininfom','21','1',NULL,'提交','0','2016-06-26 16:12:23',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('37','fininfom','21','1',NULL,'提交','0','2016-06-26 17:44:15',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('38','fininfom','21','1',NULL,'提交','0','2016-06-26 17:51:37',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('39','fininfom','22','2','不通过','财务审批','34','2016-06-26 19:28:45','我不通过，你有什么办法','127.0.0.1','Firefox','管理员','1','11',NULL), ('40','fininfom','8','1','通过','科目负责人审核','33','2016-06-26 19:39:15',NULL,'127.0.0.1','Firefox','小乔','5','11',NULL), ('41','fininfom','7','1','通过','科目负责人审核','33','2016-06-26 19:39:37',NULL,'127.0.0.1','Firefox','小乔','5','11',NULL), ('42','fininfom','1','2','不通过','科目负责人审核','33','2016-06-26 19:40:10','gggg','127.0.0.1','Firefox','小乔','5','11',NULL), ('43','fininfom','7','2','不通过','财务审批','34','2016-06-26 21:55:52','hdfghdfg','127.0.0.1','Firefox','管理员','1','11',NULL), ('44','fininfom','7','1','通过','财务审批','34','2016-06-26 21:59:46',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('45','fininfom','1','1',NULL,'删除','0','2016-06-26 22:00:53','无效','127.0.0.1','Firefox','管理员','1','11',NULL), ('46','fininfom','22','1','通过','财务审批','34','2016-06-26 22:24:48',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('47','fininfom','7','1','通过','科长审核','35','2016-06-26 22:26:33',NULL,'127.0.0.1','Firefox','管理员１','2','11',NULL), ('48','fininfom','22','1','通过','科长审核','35','2016-06-26 22:26:48',NULL,'127.0.0.1','Firefox','管理员１','2','11',NULL), ('49','fininfom','22','1','通过','分管段长审批','51','2016-06-26 22:28:53',NULL,'127.0.0.1','Firefox','刘长','6','11',NULL), ('50','fininfom','22','2','退回','段长审核','52','2016-06-26 22:29:58','jjjjjjjj','127.0.0.1','Firefox','刘备','7','11',NULL), ('51','fininfom','22','1',NULL,'提交','0','2016-06-26 22:32:18',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('52','fininfom','7','3','完毕存入预算库','分管段长审批','51','2016-07-01 14:39:43',NULL,'::1','Firefox','刘长','6','11',NULL), ('53','fininfom','6','1','通过','科目负责人审核','33','2016-07-01 15:19:45',NULL,'::1','Firefox','小乔','5','11',NULL), ('54','fininfom','6','1','通过','财务审批','34','2016-07-01 15:20:31',NULL,'::1','Firefox','貂蝉','3','11',NULL), ('55','fininfom','6','1','通过','科长审核','35','2016-07-01 15:21:15',NULL,'::1','Firefox','管理员１','2','11',NULL), ('56','fininfom','6','3','完毕存入预算库','分管段长审批','51','2016-07-01 15:55:44',NULL,'::1','Firefox','刘长','6','11','green'), ('57','fininfom','23','1',NULL,'提交','0','2016-07-02 10:01:51',NULL,'127.0.0.1','Firefox','管理员','1','11',NULL), ('58','fininfom','24','1',NULL,'提交','0','2016-07-02 21:31:19',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('59','fininfom','25','1',NULL,'提交','0','2016-07-02 21:31:40',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('60','fininfom','26','1',NULL,'提交','0','2016-07-02 21:32:01',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('61','fininfom','27','1',NULL,'提交','0','2016-07-02 21:32:32',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('62','fininfom','28','1',NULL,'提交','0','2016-07-02 21:52:16',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('63','fininfom','29','1',NULL,'提交','0','2016-07-02 21:52:35',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('64','fininfom','30','1',NULL,'提交','0','2016-07-02 21:53:14',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('65','fininfom','31','1',NULL,'提交','0','2016-07-02 21:53:37',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('66','fininfom','32','1',NULL,'提交','0','2016-07-02 21:53:57',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('67','fininfom','32','1',NULL,'提交','0','2016-07-02 21:55:18',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('68','fininfom','31','1',NULL,'提交','0','2016-07-02 21:55:49',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('69','fininfom','30','1',NULL,'提交','0','2016-07-02 21:56:09',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('70','fininfom','29','1',NULL,'提交','0','2016-07-02 21:56:28',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('71','fininfom','27','1',NULL,'提交','0','2016-07-02 21:56:54',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('72','fininfom','25','1',NULL,'提交','0','2016-07-02 21:57:21',NULL,'127.0.0.1','Firefox','吕布','10','11',NULL), ('73','fininfom','27','1','通过','科目负责人审核','33','2016-07-02 22:06:05',NULL,'127.0.0.1','Firefox','小乔','5','11',NULL), ('74','fininfom','28','2','不通过','科目负责人审核','33','2016-07-02 22:07:58','就是不通过1111','127.0.0.1','Firefox','小乔','5','11',NULL), ('75','fininfom','29','1','通过','科目负责人审核','33','2016-07-02 22:09:41',NULL,'::1','Chrome','小乔','5','11',NULL), ('76','fininfom','32','1','通过','科目负责人审核','33','2016-07-03 13:13:43',NULL,'::1','Chrome','小乔','5','11',NULL), ('77','fininfom','31','1','通过','科目负责人审核','33','2016-07-03 13:13:53',NULL,'::1','Chrome','小乔','5','11',NULL), ('78','fininfom','30','1','通过','科目负责人审核','33','2016-07-03 13:14:02',NULL,'::1','Chrome','小乔','5','11',NULL), ('79','fininfom','26','1','通过','科目负责人审核','33','2016-07-03 13:14:15',NULL,'::1','Chrome','小乔','5','11',NULL), ('80','fininfom','25','1','通过','科目负责人审核','33','2016-07-03 13:14:29',NULL,'::1','Chrome','小乔','5','11',NULL), ('81','fininfom','32','1','通过','财务审批','34','2016-07-03 13:16:28',NULL,'::1','Chrome','管理员','1','11',NULL), ('82','fininfom','31','1','通过','财务审批','34','2016-07-03 13:16:52',NULL,'::1','Chrome','管理员','1','11',NULL), ('83','fininfom','29','1','通过','财务审批','34','2016-07-03 13:17:01',NULL,'::1','Chrome','管理员','1','11',NULL), ('84','fininfom','33','1',NULL,'提交','0','2016-07-18 15:22:59',NULL,'::1','Firefox','管理员','1','11',NULL), ('85','fininfom','25','1','通过','财务审批','34','2016-07-21 10:29:26','test','211.155.1.13','Chrome','管理员','1','11',NULL), ('86','docdeil','19','1','已签收','接收人签收','25','2016-07-21 10:30:13','df','211.155.1.13','Chrome','管理员','1','4','green'), ('87','fininfom','27','2','不通过','财务审批','34','2016-07-21 10:31:01','dsf','211.155.1.13','Chrome','管理员','1','11',NULL), ('88','docdeil','20','1','已签收','接收人签收','25','2016-07-27 13:31:41',NULL,'221.214.54.122','Chrome','管理员','1','4','green'), ('89','fininfom','27','1','通过','财务审批','34','2016-07-27 13:32:01',NULL,'221.214.54.122','Chrome','管理员','1','11',NULL), ('90','fininfom','34','1',NULL,'提交','0','2016-07-27 13:34:50',NULL,'221.214.54.122','Chrome','管理员','1','12',NULL), ('91','docdeil','21','1',NULL,'提交','0','2016-07-27 13:42:20',NULL,'202.110.253.130','Chrome','管理员','1','4',NULL), ('92','fininfom','34','1','通过','上级审批','36','2016-07-27 14:42:35',NULL,'202.110.253.130','Chrome','管理员','1','12',NULL), ('93','fininfom','3','1','通过','上级审批','36','2016-07-27 14:48:40',NULL,'202.110.253.130','Chrome','刘备','7','12',NULL), ('94','fininfom','35','1',NULL,'提交','0','2016-07-27 14:52:36',NULL,'202.110.253.130','Chrome','赵子龙','9','11',NULL), ('95','fininfom','35','1','通过','科目负责人审核','33','2016-07-27 14:57:02',NULL,'202.110.253.130','Chrome','小乔','5','11',NULL), ('96','fininfom','35','1','通过','财务审批','34','2016-07-27 14:58:46',NULL,'202.110.253.130','Chrome','貂蝉','3','11',NULL), ('97','fininfom','8','1','通过','财务审批','34','2016-07-27 15:00:33',NULL,'202.110.253.130','Chrome','貂蝉','3','11',NULL), ('98','fininfom','36','1',NULL,'提交','0','2016-07-27 15:30:23',NULL,'202.110.253.130','Chrome','赵子龙','9','12',NULL);
INSERT INTO `jntxfb_flow_rule` VALUES ('1','貂蝉','请假条','1','1|2','4|3','大乔|貂蝉','1','2','大乔','4','2','1','2016-04-27 21:46:14','kq_info','48','0','4,3'), ('2','貂蝉','请假条','1','1|2','4|3','大乔|貂蝉','1','2','大乔','4','2','1','2016-04-27 21:46:14','kq_info','51','0','4,3'), ('3','管理员','请假条','1','1|2|21','7|3|7','刘备|貂蝉|刘备','1','2','刘备','7','3','1','2016-04-27 21:46:14','kq_info','52','0','7,3,7'), ('4','管理员','请假条','1','1|2','7|3','刘备|貂蝉','1','2','刘备','7','2','1','2016-04-27 21:46:14','kq_info','54','0','7,3'), ('5','管理员','请假条','1','1|2|21','7|3|7','刘备|貂蝉|刘备','1','2','刘备','7','3','1','2016-04-27 21:46:14','kq_info','55','0','7,3,7'), ('6','管理员','请假条','1','1|2','7|3','刘备|貂蝉','1','2','刘备','7','2','1','2016-05-08 16:10:49','kq_info','56','0','7,3'), ('7','管理员','加班单','2','20','3','貂蝉','20','0','貂蝉','3','1','1','2016-04-27 21:46:14','kq_info','42','0','3'), ('8','貂蝉','加班单','2','20','3','貂蝉','20','0','貂蝉','3','1','1','2016-04-27 21:46:14','kq_info','49','0','3'), ('9','貂蝉','加班单','2','20','3','貂蝉','20','0','貂蝉','3','1','1','2016-04-27 21:46:14','kq_info','50','0','3'), ('11','管理员','外出出差','3','24','3','貂蝉','24','0','貂蝉','3','1','1','2016-04-27 21:46:14','kq_out','9','0','3'), ('12','貂蝉','外出出差','3','24','3','貂蝉','24','0','貂蝉','3','1','1','2016-04-27 21:46:14','kq_out','10','0','3'), ('13','小乔','物品领用','6','26','5','小乔','26','0','小乔','5','1','1','2016-04-27 21:46:14','supplea','9','0','5'), ('14','管理员','物品领用','6','26','5','小乔','26','0','小乔','5','1','1','2016-04-27 21:46:14','supplea','10','0','5'), ('15','管理员','奖惩处罚','14','40|41','7|3','刘备|貂蝉','40','41','刘备','7','2','1','2016-04-27 21:46:14','reward','1','0','7,3'), ('16','管理员','车辆预定','15','44|45','7|5','刘备|小乔','44','45','刘备','7','2','1','2016-04-27 21:46:14','careserve','3','0','7,5'), ('17','管理员','会议预定','16','47','4','大乔','47','0','大乔','4','1','1','2016-04-27 21:46:14','meet','154','0','4'), ('49','管理员','出差报销','12','36|37|38','1||','管理员||','37','38',NULL,NULL,'3','2','2016-07-27 14:42:35','fininfom','34','1','1,,'), ('19','管理员','文件传送','4','25','5,1','小乔,管理员','25','0','小乔','5','1','1','2016-07-27 13:31:41','docdeil','20','1','5,1'), ('20','管理员','业务需求','17','48|49','1|0','管理员|','48','49','管理员','1','2','1','2016-04-27 21:46:14','demand','6','0','1,0'), ('21','管理员','转正申请','7','27|28','7|3','刘备|貂蝉','27','28','刘备','7','2','1','2016-04-27 21:46:14','hrpositive','3','0','7,3'), ('22','管理员','离职申请','9','29|30','7|3','刘备|貂蝉','29','30','刘备','7','2','1','2016-04-27 21:46:14','hrredund','3','0','7,3'), ('23','管理员','人事调动','8','31','3','貂蝉','31','0','貂蝉','3','1','1','2016-04-27 21:46:14','hrtransfer','4','0','3'), ('24','管理员','车辆预定','15','44|45','7|5','刘备|小乔','44','45','刘备','7','2','1','2016-04-28 20:29:14','careserve','4','0','7,5'), ('25','管理员','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','33','34','小乔','5','5','1','2016-06-26 15:28:40','fininfom','2','0','5,1,3,2,6,7'), ('27','管理员','出差报销','12','36|37|38','1||','管理员||','37','38',NULL,NULL,'3','2','2016-07-27 14:48:40','fininfom','3','1','1,,,7'), ('28','管理员','借款单','13','39|42|43','7|9|10','刘备|赵子龙|吕布','39','42','刘备','7','3','1','2016-05-08 16:10:08','fininfom','4','0','7,9,10'), ('29','管理员','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','33','34','小乔','5','5','1','2016-06-26 15:28:40','fininfom','5','0','5,1,3,2,6,7'), ('31','管理员','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','52','0','刘备','7','5','5','2016-07-01 14:39:43','fininfom','7','3','5,1,3,2,6,7'), ('32','管理员','费用报销','11','33|34|35|51|52','5|3|2|6|7','小乔|貂蝉|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-27 15:00:33','fininfom','8','1','5,3,2,6,7'), ('33','管理员','费用报销','11','33|34|35','7|9|10','刘备|赵子龙|吕布','33','34','刘备','7','3','1','2016-06-23 16:51:40','fininfom','17','0','7,9,10'), ('34','管理员','费用报销','11','33|34|35','7|9|10','刘备|赵子龙|吕布','33','34','刘备','7','3','1','2016-06-23 16:56:31','fininfom','18','0','7,9,10'), ('35','管理员','费用报销','11','33|34|35|51|52','|1,3|2||7','|管理员,貂蝉|管理员１||刘备','33','34',NULL,NULL,'5','1','2016-07-27 14:50:21','fininfom','20','0',',1,3,2,,7'), ('36','管理员','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','33','34','小乔','5','5','1','2016-06-26 17:51:37','fininfom','21','2','5,1,3,2,6,7'), ('37','管理员','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','0','0',NULL,NULL,'5','0','2016-06-26 22:32:18','fininfom','22','2','5,1,3,2,6,7'), ('38','管理员','费用报销','11','33|34|35|51|52','|1,3|2|6|7','|管理员,貂蝉|管理员１|刘长|刘备','33','34',NULL,NULL,'5','1','2016-07-27 14:50:21','fininfom','23','0',',1,3,2,6,7'), ('39','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','33','34','小乔','5','5','1','2016-07-02 21:31:19','fininfom','24','0','5,1,3,2,6,7'), ('40','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-21 10:29:26','fininfom','25','1','5,1,3,2,6,7'), ('41','吕布','费用报销','11','33|34|35|51|52','5|3|2|6|7','小乔|貂蝉|管理员１|刘长|刘备','34','35','貂蝉','3','5','2','2016-07-03 13:14:15','fininfom','26','1','5,3,2,6,7'), ('42','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-27 13:32:01','fininfom','27','1','5,1,3,2,6,7'), ('43','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','33','34','小乔','5','5','1','2016-07-02 22:07:58','fininfom','28','2','5,1,3,2,6,7'), ('44','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-03 13:17:01','fininfom','29','1','5,1,3,2,6,7'), ('45','吕布','费用报销','11','33|34|35|51|52','5|3|2|6|7','小乔|貂蝉|管理员１|刘长|刘备','34','35','貂蝉','3','5','2','2016-07-03 13:14:02','fininfom','30','1','5,3,2,6,7'), ('46','吕布','费用报销','11','33|34|35|51|52','5|1|2|6|7','小乔|管理员|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-03 13:16:52','fininfom','31','1','5,1,2,6,7'), ('47','吕布','费用报销','11','33|34|35|51|52','5|1,3|2|6|7','小乔|管理员,貂蝉|管理员１|刘长|刘备','35','51','管理员１','2','5','3','2016-07-03 13:16:28','fininfom','32','1','5,1,3,2,6,7'), ('48','管理员','费用报销','11','33|34|35|51|52','|1,3|2|6|7','|管理员,貂蝉|管理员１|刘长|刘备','33','34',NULL,NULL,'5','1','2016-07-27 14:50:21','fininfom','33','0',',1,3,2,6,7'), ('50','管理员','文件传送','4','25','6','刘长','25','0','刘长','6','1','1','2016-07-27 13:42:20','docdeil','21','0','6'), ('51','赵子龙','费用报销','11','33|34|35|51|52','5|1,3|1|6|7','小乔|管理员,貂蝉|管理员|刘长|刘备','35','51','管理员','1','5','3','2016-07-27 14:58:46','fininfom','35','1','5,1,3,1,6,7'), ('52','赵子龙','出差报销','12','36|37|38','||','||','36','37',NULL,NULL,'3','1','2016-07-27 15:30:23','fininfom','36','0',',,');
INSERT INTO `jntxfb_flow_set` VALUES ('4','文件传送','docdeil','20','2015-06-24 11:27:33','docdeil',NULL,NULL,NULL,NULL,'{title},接收人:{recename}','协同办公','1','1','0','FI-Ymd-','1','0','1',NULL,NULL,'0',NULL), ('5','工作日报','daily','21','2015-12-22 18:21:16','daily',NULL,NULL,NULL,NULL,NULL,'协同办公','0','0','0','无','0','1','0',NULL,NULL,'0',NULL), ('11','费用报销','finfybx','40','2016-05-05 16:40:14','fininfom',NULL,NULL,NULL,'money','报销金额:{money}','财务','1','1','0','PA-Ymd-','1','0','0',NULL,NULL,'0',NULL), ('12','出差报销','finccbx','41','2015-09-15 17:09:52','fininfom',NULL,NULL,NULL,'money','报销金额:{money},目的:{purpose},成果:{purresult}','财务','1','1','0','PB-Ymd-','1','0','0',NULL,NULL,'0',NULL), ('18','工作任务','work','23','2016-03-16 09:44:54','work',NULL,NULL,NULL,NULL,NULL,'协同办公','1','0','0','无','0','1','1',NULL,NULL,'1',NULL), ('21','通知公告','gong','9','2016-04-19 21:21:26','infor',NULL,NULL,NULL,NULL,NULL,'行政','0','1','0','无','0','1','0',NULL,NULL,'0',NULL);
INSERT INTO `jntxfb_group` VALUES ('1','系统管理员','1','0','2014-09-04 17:33:47'), ('5','段长','2','1','2014-09-04 17:33:56'), ('6','副段长','0','1',NULL), ('7','科长','0','1',NULL), ('8','科目负责人','0','1',NULL), ('9','车间主任','0','1',NULL), ('10','职员','0','1',NULL);
INSERT INTO `jntxfb_homeitems` VALUES ('1','0','0',NULL,'daib','待办/处理','0','1','all','全体人员','1','1','10','5','400','250','time',NULL), ('2','0','0',NULL,'work','工作任务','0','2','all','全体人员','1','1','418','5','699','250','pencil',NULL), ('3','0','0',NULL,'wannl','万年历','0','3','all','全体人员','1','1','10','520','550','350','calendar',NULL), ('4','0','0',NULL,'todo','提醒信息','0','1','all','全体人员','1','1','10','262','550','250','lightbulb',NULL), ('5','0','0',NULL,'gong','信息公告','0','2','all','全体人员','1','1','568','261','550','250','sound_none',NULL), ('6','0','0',NULL,'zxkq','在线考勤','0','3','all','全体人员','0','1','571','776','550','250','clock',NULL), ('7','0','0','所有人员默认首页',NULL,NULL,'1','0','all','全体人员','1','1','0','0','0','0',NULL,NULL), ('8','7','0',NULL,NULL,NULL,'1','0',NULL,NULL,'1','1','10','5','451','250',NULL,NULL), ('9','7','0',NULL,NULL,NULL,'4','0',NULL,NULL,'1','1','470','5','645','250',NULL,NULL), ('11','7','0',NULL,NULL,NULL,'5','0',NULL,NULL,'1','1','10','266','533','274',NULL,NULL), ('13','7','0',NULL,NULL,NULL,'3','0',NULL,NULL,'1','1','552','265','564','350',NULL,NULL), ('14','0','0','管理首页',NULL,NULL,'1','1','u1','管理员','1','1','0','0','0','0',NULL,NULL), ('25','0','0',NULL,'emailin','内部邮件','0','7','all','全体人员','0','1','569','518','550','250','email',NULL), ('27','0','0',NULL,'minstall','模块安装升级','0','8','u1','管理员','0','1','0','0','400','250','arrow_up',NULL), ('28','14','0',NULL,NULL,NULL,'1','0',NULL,NULL,'1','1','10','7','400','250',NULL,NULL), ('29','14','0',NULL,NULL,NULL,'4','0',NULL,NULL,'1','1','528','266','590','248',NULL,NULL), ('30','14','0',NULL,NULL,NULL,'2','0',NULL,NULL,'1','1','528','529','591','250',NULL,NULL), ('31','14','0',NULL,NULL,NULL,'5','0',NULL,NULL,'1','1','10','266','508','250',NULL,NULL), ('32','14','0',NULL,NULL,NULL,'3','0',NULL,NULL,'1','1','10','526','509','322',NULL,NULL), ('33','14','0',NULL,NULL,NULL,'27','0',NULL,NULL,'1','1','421','7','696','250',NULL,NULL), ('34','1','1',NULL,NULL,NULL,'0','0',NULL,NULL,'1','1','10','7','497','250',NULL,NULL), ('35','4','1',NULL,NULL,NULL,'0','0',NULL,NULL,'1','1','526','9','590','248',NULL,NULL), ('37','3','1',NULL,NULL,NULL,'0','0',NULL,NULL,'1','1','6','266','509','322',NULL,NULL), ('38','5','1',NULL,NULL,NULL,'0','0',NULL,NULL,'1','1','527','262','593','309',NULL,NULL);
INSERT INTO `jntxfb_hrpositive` VALUES ('1','1','OA项目经理','2015-01-01','2015-08-01','2015-08-15','2015-08-01 11:52:54','哈哈哈哈','1','1',NULL,'7,3','1','貂蝉',NULL,'1',NULL,NULL,NULL), ('3','1','OA项目经理','2015-01-01','2016-04-30','2016-05-01','2016-04-26 21:09:18','工作人我','0','1','7','7,3','0',NULL,'刘备','0','1','管理员','2016-04-26');
INSERT INTO `jntxfb_hrredund` VALUES ('1','1','OA项目经理','2015-01-01','2015-08-04','自动离职','无法胜任工作,另找到工作,年龄到期','2015-08-03 10:49:07','hahaha','5','1','7','7,3','2','刘备','刘备','0',NULL,NULL,NULL), ('3','1','OA项目经理','2015-01-01','2016-04-30','退休','另找到工作,身体原因,年龄到期','2016-04-26 21:52:47','呵呵呵呵，离职喽，退休啦','0','1','7','7,3','0',NULL,'刘备','0','1','管理员','2016-04-26');
INSERT INTO `jntxfb_hrtransfer` VALUES ('1','1','7','刘备','平调','管理部','董事长','2015-08-03','业务部','2','CEO','2015-08-03 17:46:15','hahahah','1','1',NULL,'3','1','貂蝉',NULL,'1',NULL,NULL,NULL), ('2','1','1','管理员','平调','业务部','CEO','2015-08-03','开发部','4','OA项目经理','2015-08-03 17:49:34','hah','1','1',NULL,'3','1','貂蝉',NULL,'1',NULL,NULL,NULL), ('3','1','7','刘备','晋升','业务部','CEO','2015-08-03','管理部','1','董事长','2015-08-03 18:09:37','董事长aa','1','1',NULL,'3','1','貂蝉',NULL,'1',NULL,NULL,NULL), ('4','1','1','管理员','晋升','开发部','OA项目经理','2016-05-01','开发部','4','技术总监','2016-04-26 22:35:06','好好做啊！','0','1','3','3','0',NULL,'貂蝉','0','1','管理员','2016-04-26');
INSERT INTO `jntxfb_im_group` VALUES ('1','技术群','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('2','讨论区1','1','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('3','通知公告','2','0',NULL,NULL,NULL,'webreim/client/images/im/laba.png','gong',NULL,NULL,NULL,'1','0','0'), ('4','会议通知','2','0',NULL,NULL,NULL,'webreim/client/images/im/meet.png','meet',NULL,NULL,'webreim/client/agent/meet.html','1','0','0'), ('5','商务群','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('7','单据待办','2','0',NULL,NULL,'2015-06-25 16:03:34','webreim/client/images/im/daibans.png','daiban',NULL,NULL,'webreim/client/agent/daiban.html','1','0','0'), ('8','哈哈哈','1','0','1','管理员','2015-07-17 17:43:38',NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('9','OA项目讨论','1','0','1',NULL,'2015-08-14 17:11:18',NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('10','高管的','1','0','1',NULL,'2015-08-14 17:13:24',NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('11','人事招聘','1','0','3',NULL,'2015-08-18 09:34:04',NULL,NULL,NULL,NULL,NULL,'1','0','0'), ('12','项目任务','2','8','1','管理员','2015-09-10 13:38:07','webreim/client/images/im/renwu.png','work',NULL,NULL,'webreim/client/agent/work.html','1','0','0'), ('13','万年历','2','10',NULL,NULL,NULL,'images/calendar.png','calendar',NULL,NULL,'webreim/client/agent/wnl.html','1','0','0');
INSERT INTO `jntxfb_im_groupuser` VALUES ('1','1','1',NULL), ('2','1','2',NULL), ('3','1','3',NULL), ('4','1','4',NULL), ('10','2','2',NULL), ('11','2','5','2015-06-16 12:04:08'), ('14','8','1','2015-07-17 17:43:38'), ('15','8','4','2015-07-17 17:44:53'), ('17','1','5','2015-07-21 10:54:01'), ('20','9','1','2015-08-14 17:11:18'), ('22','10','7','2015-08-14 17:13:50'), ('23','8','7','2015-08-17 11:31:44'), ('24','8','9','2015-08-17 11:32:40'), ('25','8','10','2015-08-17 11:32:40'), ('26','8','8','2015-08-17 11:32:40'), ('27','11','3','2015-08-18 09:34:04'), ('28','11','4','2015-08-18 09:36:42'), ('29','8','3','2016-01-05 18:22:42'), ('30','8','5','2016-01-05 18:22:42'), ('31','2','7','2016-04-18 21:17:13');
INSERT INTO `jntxfb_im_history` VALUES ('3','user','2','3','2016-04-16 12:48:11');
INSERT INTO `jntxfb_im_mess` VALUES ('1','2016-06-04 10:44:02','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjA0LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','7','agent','1',NULL,'fininfom','5',NULL,'0','0',NULL), ('2','2016-06-10 09:17:59','0','W!mAmuefpeWFrOWRil3mrKLov47kuIrnur8:','1','3','1,2,3,4,5,7,8,9,10','agent','1',NULL,'infor','14',NULL,'0','0',NULL), ('3','2016-06-22 08:44:38','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','7','agent','1',NULL,'fininfom','7',NULL,'0','0',NULL), ('4','2016-06-22 09:49:10','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','7','agent','1',NULL,'fininfom','8',NULL,'0','0',NULL), ('5','2016-06-23 16:51:40','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIzLTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','7','agent','1',NULL,'fininfom','17',NULL,'0','0',NULL), ('6','2016-06-23 16:56:31','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIzLTAwMDM8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','7','agent','1',NULL,'fininfom','18',NULL,'0','0',NULL), ('7','2016-06-25 22:00:27','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI1LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','1','agent','1',NULL,'fininfom','20',NULL,'0','0',NULL), ('8','2016-06-26 14:01:23','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','1','agent','1',NULL,'fininfom','21',NULL,'0','0',NULL), ('9','2016-06-26 15:30:41','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','5','agent','1',NULL,'fininfom','22',NULL,'0','0',NULL), ('10','2016-06-26 15:39:29','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','5','7','1,3','agent','5',NULL,'fininfom','22',NULL,'0','0',NULL), ('11','2016-06-26 15:40:42','0','5oKo5o!Q5LqkW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA2MjYtMDAwMV3lsI.kuZTlpITnkIZb5LiN6YCa6L!HXe!8jOWOn!WboDpb5bCx5piv5LiN6YCa6L!HXQ::','5','7','1','agent','5',NULL,'fininfom','21',NULL,'0','0',NULL), ('12','2016-06-26 16:12:23','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','5','agent','1',NULL,'fininfom','21',NULL,'0','0',NULL), ('13','2016-06-26 17:44:15','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','5','agent','1',NULL,'fininfom','21',NULL,'0','0',NULL), ('14','2016-06-26 17:51:37','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','5','agent','1',NULL,'fininfom','21',NULL,'0','0',NULL), ('15','2016-06-26 19:28:45','0','5oKo5o!Q5LqkW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA2MjYtMDAwMl3nrqHnkIblkZjlpITnkIZb5LiN6YCa6L!HXe!8jOWOn!WboDpb5oiR5LiN6YCa6L!H77yM5L2g5pyJ5LuA5LmI5Yqe5rOVXQ::','1','7','1','agent','1',NULL,'fininfom','22',NULL,'0','0',NULL), ('16','2016-06-26 19:39:15','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','5','7','3','agent','5',NULL,'fininfom','8',NULL,'0','0',NULL), ('17','2016-06-26 19:39:37','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','5','7','1,3','agent','5',NULL,'fininfom','7',NULL,'0','0',NULL), ('19','2016-06-26 21:55:52','0','5oKo5o!Q5LqkW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA2MjItMDAwMV3nrqHnkIblkZjlpITnkIZb5LiN6YCa6L!HXe!8jOWOn!WboDpbaGRmZ2hkZmdd','1','7','1','agent','1',NULL,'fininfom','7',NULL,'0','0',NULL), ('20','2016-06-26 21:59:46','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','2','agent','1',NULL,'fininfom','7',NULL,'0','0',NULL), ('21','2016-06-26 22:24:48','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','2','agent','1',NULL,'fininfom','22',NULL,'0','0',NULL), ('22','2016-06-26 22:26:33','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','2','7','6','agent','2',NULL,'fininfom','7',NULL,'0','0',NULL), ('23','2016-06-26 22:26:48','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','2','7','6','agent','2',NULL,'fininfom','22',NULL,'0','0',NULL), ('24','2016-06-26 22:28:53','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjI2LTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','6','7','7','agent','6',NULL,'fininfom','22',NULL,'0','0',NULL), ('25','2016-07-01 15:19:45','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIwLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','5','7','3','agent','5',NULL,'fininfom','6',NULL,'0','0',NULL), ('26','2016-07-01 15:20:31','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIwLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','3','7','2','agent','3',NULL,'fininfom','6',NULL,'0','0',NULL), ('27','2016-07-01 15:21:15','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIwLTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','2','7','6','agent','2',NULL,'fininfom','6',NULL,'0','0',NULL), ('28','2016-07-01 15:55:44','0','5oKo5o!Q5Lqk55qEW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA2MjAtMDAwMV3lt7Llhajpg6jlpITnkIblrozmiJA:','6','7','1','agent','6',NULL,'fininfom','6',NULL,'0','0',NULL), ('29','2016-07-02 21:31:19','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDI8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','24',NULL,'0','0',NULL), ('30','2016-07-02 21:32:01','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDQ8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','26',NULL,'0','0',NULL), ('31','2016-07-02 21:52:16','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDY8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','28',NULL,'0','0',NULL), ('32','2016-07-02 21:55:18','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMTA8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','32',NULL,'0','0',NULL), ('33','2016-07-02 21:55:49','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDk8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','31',NULL,'0','0',NULL), ('34','2016-07-02 21:56:09','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDg8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','30',NULL,'0','0',NULL), ('35','2016-07-02 21:56:28','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDc8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','29',NULL,'0','0',NULL), ('36','2016-07-02 21:56:54','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDU8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','27',NULL,'0','0',NULL), ('37','2016-07-02 21:57:21','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDM8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','10','7','5','agent','10',NULL,'fininfom','25',NULL,'0','0',NULL), ('38','2016-07-02 22:06:05','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDU8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','1,3','agent','5',NULL,'fininfom','27',NULL,'0','0',NULL), ('39','2016-07-02 22:07:58','0','5oKo5o!Q5LqkW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA3MDItMDAwNl3lsI.kuZTlpITnkIZb5LiN6YCa6L!HXe!8jOWOn!WboDpb5bCx5piv5LiN6YCa6L!HMTExMV0:','5','7','10','agent','5',NULL,'fininfom','28',NULL,'0','0',NULL), ('40','2016-07-02 22:09:41','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDc8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','1,3','agent','5',NULL,'fininfom','29',NULL,'0','0',NULL), ('41','2016-07-03 13:13:43','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMTA8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','1,3','agent','5',NULL,'fininfom','32',NULL,'0','0',NULL), ('42','2016-07-03 13:13:53','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDk8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','1','agent','5',NULL,'fininfom','31',NULL,'0','0',NULL), ('43','2016-07-03 13:14:02','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDg8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','3','agent','5',NULL,'fininfom','30',NULL,'0','0',NULL), ('44','2016-07-03 13:14:15','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDQ8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','3','agent','5',NULL,'fininfom','26',NULL,'0','0',NULL), ('45','2016-07-03 13:14:29','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDM8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','5','7','1,3','agent','5',NULL,'fininfom','25',NULL,'0','0',NULL), ('46','2016-07-03 13:16:28','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMTA8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','1','7','2','agent','1',NULL,'fininfom','32',NULL,'0','0',NULL), ('47','2016-07-03 13:16:52','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDk8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','1','7','2','agent','1',NULL,'fininfom','31',NULL,'0','0',NULL), ('48','2016-07-03 13:17:01','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDc8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','1','7','2','agent','1',NULL,'fininfom','29',NULL,'0','0',NULL), ('49','2016-07-21 10:29:26','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDM8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0PGJyPuivtOaYjjp0ZXN0','1','7','2','agent','1',NULL,'fininfom','25',NULL,'0','0',NULL), ('50','2016-07-21 10:30:13','0','5oKo5o!Q5Lqk55qEW!aWh!S7tuS8oOmAgSzljZXlj7c6RkktMjAxNjAzMTUtMDAwMV3lt7Llhajpg6jlpITnkIblrozmiJA:','1','7','1','agent','1',NULL,'docdeil','19',NULL,'0','0',NULL), ('51','2016-07-21 10:31:01','0','5oKo5o!Q5LqkW!i0ueeUqOaKpemUgCzljZXlj7c6UEEtMjAxNjA3MDItMDAwNV3nrqHnkIblkZjlpITnkIZb5LiN6YCa6L!HXe!8jOWOn!WboDpbZHNmXQ::','1','7','10','agent','1',NULL,'fininfom','27',NULL,'0','0',NULL), ('52','2016-07-27 13:31:41','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrmlofku7bkvKDpgIE8YnI!5Y2V5Y!3OkZJLTIwMTYwNDA0LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','5','agent','1',NULL,'docdeil','20',NULL,'0','0',NULL), ('53','2016-07-27 13:32:01','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzAyLTAwMDU8YnI!55Sz6K!35Lq6OuWQleW4gzxicj7pg6jpl6g66KW.5Z!O6L2m6Ze0','1','7','2','agent','1',NULL,'fininfom','27',NULL,'0','0',NULL), ('54','2016-07-27 13:34:50','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrlh7rlt67miqXplIA8YnI!5Y2V5Y!3OlBCLTIwMTYwNzI3LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','1','agent','1',NULL,'fininfom','34',NULL,'0','0',NULL), ('55','2016-07-27 13:42:20','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrmlofku7bkvKDpgIE8YnI!5Y2V5Y!3OkZJLTIwMTYwNzI3LTAwMDE8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','1','7','6','agent','1',NULL,'docdeil','21',NULL,'0','0',NULL), ('56','2016-07-27 14:52:36','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzI3LTAwMDE8YnI!55Sz6K!35Lq6Oui1teWtkOm!mTxicj7pg6jpl6g65a6M5YWo56eR','9','7','5','agent','9',NULL,'fininfom','35',NULL,'0','0',NULL), ('57','2016-07-27 14:57:02','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzI3LTAwMDE8YnI!55Sz6K!35Lq6Oui1teWtkOm!mTxicj7pg6jpl6g65a6M5YWo56eR','5','7','1,3','agent','5',NULL,'fininfom','35',NULL,'0','0',NULL), ('58','2016-07-27 14:58:46','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNzI3LTAwMDE8YnI!55Sz6K!35Lq6Oui1teWtkOm!mTxicj7pg6jpl6g65a6M5YWo56eR','3','7','1','agent','3',NULL,'fininfom','35',NULL,'0','0',NULL), ('59','2016-07-27 15:00:33','0','5Y2V5o2u5aSE55CGPGJyPuaooeWdlzrotLnnlKjmiqXplIA8YnI!5Y2V5Y!3OlBBLTIwMTYwNjIyLTAwMDI8YnI!55Sz6K!35Lq6OueuoeeQhuWRmDxicj7pg6jpl6g66LSi5Yqh56eR','3','7','2','agent','3',NULL,'fininfom','8',NULL,'0','0',NULL);
INSERT INTO `jntxfb_im_messzt` VALUES ('1','1','7','7'), ('2','2','1','3'), ('3','2','2','3'), ('4','2','3','3'), ('5','2','4','3'), ('6','2','5','3'), ('7','2','7','3'), ('8','2','8','3'), ('9','2','9','3'), ('10','2','10','3'), ('11','3','7','7'), ('12','4','7','7'), ('13','5','7','7'), ('14','6','7','7'), ('15','7','1','7'), ('16','8','1','7'), ('17','9','5','7'), ('18','10','1','7'), ('19','10','3','7'), ('20','11','1','7'), ('21','12','5','7'), ('22','13','5','7'), ('23','14','5','7'), ('24','15','1','7'), ('25','16','3','7'), ('26','17','1','7'), ('27','17','3','7'), ('28','18','1','7'), ('29','19','1','7'), ('30','20','2','7'), ('31','21','2','7'), ('32','22','6','7'), ('33','23','6','7'), ('34','24','7','7'), ('35','25','3','7'), ('36','26','2','7'), ('37','27','6','7'), ('38','28','1','7'), ('39','29','5','7'), ('40','30','5','7'), ('41','31','5','7'), ('42','32','5','7'), ('43','33','5','7'), ('44','34','5','7'), ('45','35','5','7'), ('46','36','5','7'), ('47','37','5','7'), ('48','38','1','7'), ('49','38','3','7'), ('50','39','10','7'), ('51','40','1','7'), ('52','40','3','7'), ('53','41','1','7'), ('54','41','3','7'), ('55','42','1','7'), ('56','43','3','7'), ('57','44','3','7'), ('58','45','1','7'), ('59','45','3','7'), ('60','46','2','7'), ('61','47','2','7'), ('62','48','2','7'), ('63','49','2','7'), ('64','50','1','7'), ('65','51','10','7'), ('66','52','5','7'), ('67','53','2','7'), ('68','54','1','7'), ('69','55','6','7'), ('70','56','5','7'), ('71','57','1','7'), ('72','57','3','7'), ('73','58','1','7'), ('74','59','2','7');
INSERT INTO `jntxfb_infor` VALUES ('8',NULL,'当月2016-03技术KPI考核','jishukao','技术考核','<p>\n	管理员：做好开发OA完善，提高系统安全性，确保不要被黑(100%)。\n</p>\n<p>\n	张飞：拿下金州(100%)\n</p>\n<p>\n	----↑以上人员确保当月可以完成----\n</p>','9',NULL,NULL,'1','管理员','0','0',NULL,'1','2016-02-27 11:32:50','开发部','2016-02-27','d4','开发部','4','1','1');
INSERT INTO `jntxfb_items` VALUES ('2','fininfom','2',NULL,'0','办公用品','2016-05-05',NULL,'12.00','0',NULL,'说明1','0','2016-05-05 21:04:13','1','1'), ('3','fininfom','2',NULL,'0','停车费','2016-05-05',NULL,'30.00','1',NULL,'说明2','0','2016-05-05 21:04:13','1','1'), ('4','fininfom','2',NULL,'0','办公用品','2016-05-03',NULL,'10.00','2',NULL,'说明3','0','2016-05-05 21:04:13','1','1'), ('5','fininfom','1',NULL,'0','停车费','2016-05-05',NULL,'12.00','0',NULL,NULL,'0','2016-05-05 20:19:42','1','1'), ('6','fininfom','3',NULL,'0','市内交通费','2016-05-04',NULL,'399.00','0','北京','火车票','0','2016-05-05 21:50:09','1','1'), ('7','fininfom','3',NULL,'0','市内交通费','2016-05-05',NULL,'200.00','1','厦门','打了黑车啊，坑','0','2016-05-05 21:50:09','1','1'), ('8','fininfom','5',NULL,'0','快递费','2016-06-03',NULL,'145.00','0',NULL,'test111','0','2016-06-04 10:44:02','1','1'), ('9','fininfom','5',NULL,'0','办公用品','2016-06-01',NULL,'531.00','1',NULL,'test2222','0','2016-06-04 10:44:02','1','1'), ('10','fininfom','6',NULL,'0','市内交通费','2016-06-19',NULL,'666.00','0',NULL,'123','0','2016-06-20 19:56:45','1','1'), ('11','fininfom','6',NULL,'0','办公用品','2016-06-17',NULL,'888.00','1',NULL,'456','0','2016-06-20 19:56:45','1','1'), ('21','fininfom','20',NULL,'0','市内交通费','2016-06-02',NULL,'1123.00','0',NULL,NULL,'0','2016-06-25 22:00:27','1','1'), ('22','fininfom','21',NULL,'0','快递费','2016-05-31',NULL,'333.00','0',NULL,NULL,'0','2016-06-26 17:51:37','1','1'), ('23','fininfom','22',NULL,'0','市内交通费','2016-06-15',NULL,'222.00','0',NULL,NULL,'0','2016-06-26 22:32:18','1','1'), ('24','fininfom','34',NULL,'0','停车费','2016-07-19',NULL,'10.00','0','济南','停车黑啊','0','2016-07-27 13:34:50','1','1'), ('25','fininfom','36',NULL,'0','市内交通费','2016-07-12',NULL,'900.00','0','北京','堵啊','0','2016-07-27 15:30:23','1','9');
INSERT INTO `jntxfb_kq_dkerr` VALUES ('1','1','忘记打卡','2015-07-29','09:00:00','2015-08-05 12:08:41','哈哈哈','1','1',NULL,'7','1','刘备',NULL,NULL,NULL,NULL), ('2','1','忘记打卡','2015-08-20','16:34:00','2015-08-20 16:37:34','hahha','5','1','7','7','0',NULL,'刘备','1','管理员','2015-08-20'), ('3','1','忘记打卡','2015-11-27','20:57:00','2015-11-27 20:56:41','呵呵呵','1','1',NULL,'7','1','刘备',NULL,'1','管理员','2015-11-27');
INSERT INTO `jntxfb_kq_dkip` VALUES ('1','all','全体人员','127.0.0.1,*.*,::1','0');
INSERT INTO `jntxfb_kq_dkjl` VALUES ('3','1','管理员','2015-11-04 14:41:37','MSIE 9','2','0',NULL), ('4','1','管理员','2015-11-21 23:02:27','MSIE 9','2','0',NULL), ('5','1','管理员','2015-11-22 21:31:50','MSIE 9','2','0',NULL), ('6','1','管理员','2015-11-27 20:57:00',NULL,'1','0',NULL), ('7','1','管理员','2016-01-07 21:20:31','MSIE 9','2','0',NULL), ('8','1','管理员','2016-01-06 08:20:31',NULL,'0','0',NULL), ('9','1','管理员','2016-01-06 18:20:31',NULL,'0','0',NULL), ('10','1','管理员','2016-02-18 21:25:32',NULL,'3','1',NULL), ('11','1','管理员','2016-02-26 18:49:01',NULL,'3','2',NULL), ('12','1','管理员','2016-02-26 18:50:05',NULL,'3','3',NULL), ('13','1','管理员','2016-02-26 18:53:36',NULL,'3','4',NULL), ('14','1','管理员','2016-02-26 19:26:52',NULL,'3','5',NULL), ('15','1','管理员','2016-02-26 19:28:57',NULL,'3','6',NULL), ('16','1','管理员','2016-02-26 19:39:37',NULL,'3','7',NULL), ('17','1','管理员','2016-03-01 00:44:56','Chrome','2','0',NULL), ('18','1','管理员','2016-03-01 00:45:00','Chrome','2','0',NULL), ('19','1','管理员','2016-03-01 11:02:11','Chrome','2','0',NULL), ('20','1','管理员','2016-03-01 11:02:17','Chrome','2','0',NULL), ('21','1','管理员','2016-03-01 11:04:51',NULL,'3','8',NULL), ('22','1','管理员','2016-03-01 11:05:08',NULL,'3','9',NULL), ('23','1','管理员','2016-03-01 13:36:51',NULL,'3','10',NULL), ('24','1','管理员','2016-03-02 15:57:36','Safari','2','0',NULL);
INSERT INTO `jntxfb_kq_info` VALUES ('33','1','请假','年假','2015-08-04 09:00:00','2015-08-04 18:00:00','8','0','2015-08-05 14:36:33','12','1','1',NULL,'7,5','1','小乔',NULL,NULL,NULL,'0',NULL,NULL), ('34','1','加班',NULL,'2015-07-20 10:31:00','2015-07-20 20:31:00','10','0','2015-07-20 10:31:17','12','5','1','3','3','0',NULL,'貂蝉',NULL,NULL,'0',NULL,NULL), ('35','1','请假','事假','2015-08-03 10:00:00','2015-08-03 18:01:00','8','0','2015-08-03 15:01:24','12','1','1',NULL,'7,5','1','小乔',NULL,NULL,NULL,'0',NULL,NULL), ('36','1','请假','事假','2015-08-17 16:52:00','2015-08-17 16:52:00','1','0','2015-08-17 16:54:39','afwew','5','1','7','7,5','2','刘备','刘备',NULL,NULL,'0',NULL,NULL), ('37','1','请假','事假','2015-08-19 10:59:00','2015-08-20 10:59:00','8','0','2015-08-19 10:59:43','12','5','1','7','7,5','0',NULL,'刘备',NULL,NULL,'0',NULL,NULL), ('38','1','增加年假',NULL,'2015-08-01 14:58:00','2015-08-19 14:58:00','40','1','2015-08-19 14:58:53',NULL,'1','1',NULL,NULL,'0','管理员',NULL,NULL,NULL,'0',NULL,NULL), ('39','1','请假','年假','2015-08-20 10:47:00','2015-08-21 10:47:00','8','0','2015-08-20 10:57:03','12','1','1',NULL,'7,5','1','小乔',NULL,NULL,NULL,'0',NULL,NULL), ('40','1','请假','事假','2015-10-20 09:43:00','2015-10-21 09:43:00','8','1','2015-10-20 09:45:35','呵呵呵呵12','1','1',NULL,'7,1,3','1','管理员',NULL,'管理员','2015-10-20','0',NULL,NULL), ('41','1','请假','事假','2015-12-29 20:55:00','2015-12-30 20:55:00','8','1','2015-11-27 20:55:42','嗯嗯','1','1',NULL,'7,5','1','小乔',NULL,'管理员','2015-11-27','1','1212','原申请从2015-12-29 20:55:00→2015-12-30 20:55:00,8(小时)'), ('42','1','加班',NULL,'2015-11-27 20:55:00','2015-11-27 23:55:00','3','1','2015-11-27 20:56:03','加班了','0','1','3','3','0',NULL,'貂蝉','管理员','2015-11-27','0',NULL,NULL), ('46','3','请假','事假','2015-12-25 17:38:00','2015-12-26 17:38:00','8','3','2015-12-27 17:38:26','hehehe','1','1',NULL,'4,1','1','管理员',NULL,NULL,'2015-12-27','0',NULL,NULL), ('47','3','请假','事假','2015-12-27 09:00:00','2015-12-27 18:00:00','8','3','2015-12-27 17:42:09','嗯122112','1','1',NULL,'4,3,4,5','1','大乔',NULL,'貂蝉','2015-12-27','0',NULL,NULL), ('48','3','请假','事假','2015-11-27 17:43:00','2015-11-28 17:43:00','8','3','2015-12-27 17:43:19','哈哈哈','0','1','4','4,3','1','大乔','大乔',NULL,'2015-12-27','0',NULL,NULL), ('49','3','加班',NULL,'2015-12-26 18:23:00','2015-12-26 23:23:00','5','3','2015-12-27 18:23:40','哈哈哈','0','1','3','3','0',NULL,'貂蝉',NULL,'2015-12-27','0',NULL,NULL), ('50','3','加班',NULL,'2015-12-27 19:12:00','2015-12-27 20:12:00','1','3','2015-12-27 19:12:14','12','0','1','3','3','0',NULL,'貂蝉',NULL,'2015-12-27','0',NULL,NULL), ('51','3','请假','事假','2015-10-27 19:12:00','2015-10-28 19:12:00','8','3','2015-12-27 19:12:36','121212','0','1','4','4,3','0',NULL,'大乔',NULL,'2015-12-27','0',NULL,NULL), ('52','1','请假','事假','2016-01-04 21:18:00','2016-01-08 21:18:00','32','1','2016-04-09 09:51:33','哈哈哈啊，请假啦','0','1','7','7,3,7','2','刘备','刘备','管理员','2016-01-05','0',NULL,NULL), ('53','1','请假','事假','2016-03-02 16:01:00','2016-03-02 16:03:00','1','1','2016-04-09 09:49:00','这么久了啊？1','5','1','7','7,3','0',NULL,'刘备','管理员','2016-03-02','0',NULL,NULL), ('54','1','请假','年假','2016-04-23 11:38:00','2016-04-24 11:38:00','8','1','2016-04-23 11:39:08','afwewe','0','1','7','7,3','0',NULL,'刘备','管理员','2016-04-23','0',NULL,NULL), ('55','1','请假','事假','2016-04-14 11:42:00','2016-04-18 11:42:00','32','1','2016-04-25 19:48:00','请假喽！','0','1','7','7,3,7','0',NULL,'刘备','管理员','2016-04-23','0',NULL,NULL), ('56','1','请假','年假','2016-04-11 11:45:00','2016-04-13 11:45:00','16','1','2016-05-08 16:10:49','嗯嗯嗯嗯，在添加一天。','0','1','7','7,3','0',NULL,'刘备','管理员','2016-04-23','0',NULL,NULL), ('57','1','加班',NULL,'2016-04-23 01:04:00','2016-04-23 15:04:00','14','1','2016-04-23 15:05:27','哈哈哈哈哈哈','1','1',NULL,'3','1','貂蝉',NULL,'管理员','2016-04-23','0',NULL,NULL);
INSERT INTO `jntxfb_kq_out` VALUES ('7','1','2015-08-05 10:31:00','2015-08-06 10:31:00','美国','调查','出差',NULL,'2015-07-20 10:31:47','1','3','3','0',NULL,'貂蝉','1',NULL,NULL,NULL,'0',NULL,NULL), ('8','1','2015-08-19 11:16:00','2015-08-20 11:16:00','新加坡','玩啦','外出',NULL,'2015-08-19 11:16:40','1',NULL,'3','1','貂蝉',NULL,'1',NULL,NULL,NULL,'0',NULL,NULL), ('9','1','2015-12-01 20:56:00','2015-12-03 20:56:00','外出地址，呵呵呵呵','外出事由','出差',NULL,'2016-04-23 15:55:11','0','3','3','0',NULL,'貂蝉','1','1','管理员','2015-11-27','0',NULL,NULL), ('10','3','2015-12-27 19:11:00','2015-12-27 20:11:00','不知道','出去走走','外出','呵呵呵','2015-12-27 19:12:00','0','3','3','0',NULL,'貂蝉','1','3',NULL,'2015-12-27','0',NULL,NULL);
INSERT INTO `jntxfb_kq_set` VALUES ('1','全体人员(不许删)','1',NULL,NULL,'0','0',NULL,NULL,'0','2015-09-21 11:58:07',NULL), ('2','下班','3',NULL,NULL,'1','0','13:00:00','18:00:00','0','2015-08-05 16:33:36',NULL), ('5','正常','0',NULL,NULL,'0','12','06:00:00','09:00:00','0','2015-08-05 16:19:01',NULL), ('6','迟到','1',NULL,NULL,'0','12','09:00:01','12:00:00','0','2015-08-05 16:19:09',NULL), ('7','正常','0',NULL,NULL,'0','2','18:00:00','23:59:00','1','2015-08-05 16:18:34',NULL), ('8','早退','1',NULL,NULL,'0','2','13:00:00','17:59:59','1','2015-08-05 16:18:25',NULL), ('12','上班','0',NULL,NULL,'1','0','09:00:00','12:00:00','0','2015-07-21 16:24:26',NULL), ('21','8点上班','2',NULL,NULL,'0','0',NULL,NULL,'0','2015-09-21 11:16:11',NULL), ('22','上班','0',NULL,NULL,'21','0','08:00:00','12:00:00','0','2015-09-21 11:16:42',NULL), ('23','下班','1',NULL,NULL,'21','0','14:00:00','18:00:00','0','2015-09-21 11:17:20',NULL), ('24','正常','0',NULL,NULL,'0','22','06:00:00','08:00:00','0','2015-09-21 11:18:22',NULL), ('25','迟到','1',NULL,NULL,'0','22','08:00:01','12:00:00','0','2015-09-21 11:19:00',NULL), ('26','早退','1',NULL,NULL,'0','23','14:00:01','17:59:59','1','2015-09-21 11:20:08',NULL), ('27','正常','0',NULL,NULL,'0','23','18:00:00','23:59:59','1','2015-09-21 11:20:03',NULL);
INSERT INTO `jntxfb_kq_setm` VALUES ('1','all','全体人员','1','2015-09-21 11:23:29','2011-01-01','2026-12-31','0','管理员','0'), ('2','d4','开发部','21','2015-09-21 13:25:32','2015-09-01','2015-09-15','1','管理员','0');
INSERT INTO `jntxfb_kq_xiu` VALUES ('1','2015-08-01','1'), ('2','2015-08-02','1'), ('3','2015-08-08','1'), ('4','2015-08-09','1'), ('5','2015-08-15','1'), ('6','2015-08-16','1'), ('7','2015-08-22','1'), ('8','2015-08-23','1'), ('9','2015-08-29','1'), ('10','2015-08-30','1'), ('12','2015-08-02','2'), ('14','2015-08-09','2'), ('16','2015-08-16','2'), ('18','2015-08-23','2'), ('20','2015-08-30','2'), ('22','2015-10-03','1'), ('23','2015-10-04','1'), ('24','2015-10-10','1'), ('25','2015-10-11','1'), ('26','2015-10-17','1'), ('27','2015-10-18','1'), ('28','2015-10-24','1'), ('29','2015-10-25','1'), ('30','2015-10-31','1'), ('31','2015-11-01','1'), ('32','2015-11-07','1'), ('33','2015-11-08','1'), ('34','2015-11-14','1'), ('35','2015-11-15','1'), ('36','2015-11-21','1'), ('37','2015-11-22','1'), ('38','2015-11-28','1'), ('39','2015-11-29','1'), ('40','2015-11-01','2'), ('41','2015-11-07','2'), ('42','2015-11-08','2'), ('43','2015-11-14','2'), ('44','2015-11-15','2'), ('45','2015-11-21','2'), ('46','2015-11-22','2'), ('47','2015-11-28','2'), ('48','2015-11-29','2');
INSERT INTO `jntxfb_kq_xium` VALUES ('1','全体人员',NULL,NULL,'0',NULL,NULL), ('2','开发部门','d4','开发部','1',NULL,NULL);
INSERT INTO `jntxfb_log` VALUES ('1','pc登录','1','管理员','[admin]超级密码登录成功','2016-05-09 20:12:15','127.0.0.1','Firefox'), ('2','pc登录','1','管理员','[admin]超级密码登录成功','2016-05-31 22:16:16','::1','Chrome'), ('3','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-04 09:41:06','::1','Chrome'), ('4','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-05 09:05:59','::1','Chrome'), ('5','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-09 08:19:59','127.0.0.1','Firefox'), ('6','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-09 08:45:51','127.0.0.1','Firefox'), ('7','reim登录','1','管理员','[admin]快捷登录','2016-06-09 08:46:21','127.0.0.1','Firefox'), ('8','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-10 09:10:10','::1','Chrome'), ('9','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-11 09:20:02','127.0.0.1','Firefox'), ('10','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-11 09:20:20','127.0.0.1','Firefox'), ('11','mweb登录','1','管理员','[admin]超级密码登录成功','2016-06-11 10:55:03','127.0.0.1','Firefox'), ('12','mweb登录','1','管理员','[admin]超级密码登录成功','2016-06-11 14:02:10','127.0.0.1','Firefox'), ('13','mweb登录','1','管理员','[admin]超级密码登录成功','2016-06-11 14:23:41','127.0.0.1','Firefox'), ('14','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-11 19:34:19','::1','Chrome'), ('15','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-11 19:37:06','127.0.0.1','Firefox'), ('16','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-11 20:59:33','127.0.0.1','Firefox'), ('17','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-12 08:38:18','::1','Firefox'), ('18','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-13 09:27:45','::1','Firefox'), ('19','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-14 09:37:56','::1','Firefox'), ('20','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-20 08:44:28','::1','Firefox'), ('21','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-20 15:52:02','::1','Firefox'), ('22','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-20 19:17:46','127.0.0.1','Firefox'), ('23','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-20 19:25:11','127.0.0.1','Firefox'), ('24','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-20 19:29:35','127.0.0.1','Firefox'), ('25','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-21 09:22:08','::1','Firefox'), ('26','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-21 20:38:27','127.0.0.1','Firefox'), ('27','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-22 08:38:14','::1','Firefox'), ('28','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-22 09:02:27','::1','Firefox'), ('29','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-22 09:13:59','::1','Firefox'), ('30','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-23 10:13:08','::1','Firefox'), ('31','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-24 09:22:33','::1','Firefox'), ('32','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-24 21:47:48','127.0.0.1','Firefox'), ('33','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-25 08:59:36','127.0.0.1','Firefox'), ('34','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-25 20:24:35','::1','Chrome'), ('35','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 06:53:40','::1','Chrome'), ('36','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-06-26 15:37:23','::1','Chrome'), ('37','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 15:41:51','::1','Chrome'), ('38','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 15:51:14','127.0.0.1','Firefox'), ('39','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-06-26 19:32:46','127.0.0.1','Firefox'), ('40','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 19:34:51','127.0.0.1','Firefox'), ('41','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-06-26 19:38:29','127.0.0.1','Firefox'), ('42','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 19:41:29','127.0.0.1','Firefox'), ('43','pc登录','2','管理员１','[rockoa]超级密码登录成功','2016-06-26 22:26:05','127.0.0.1','Firefox'), ('44','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 22:27:11','127.0.0.1','Firefox'), ('45','pc登录','6','刘长','[liu1]超级密码登录成功','2016-06-26 22:28:20','127.0.0.1','Firefox'), ('46','pc登录','7','刘备','[liubei]超级密码登录成功','2016-06-26 22:29:11','127.0.0.1','Firefox'), ('47','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-26 22:30:12','127.0.0.1','Firefox'), ('48','pc登录','7','刘备','[liubei]超级密码登录成功','2016-06-26 22:34:37','127.0.0.1','Firefox'), ('49','pc登录','1','管理员','[admin]超级密码登录成功','2016-06-30 09:09:16','::1','Firefox'), ('50','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-01 08:44:26','::1','Firefox'), ('51','pc登录','6','刘长','[liu1]超级密码登录成功','2016-07-01 14:08:47','::1','Firefox'), ('52','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-01 14:40:24','::1','Firefox'), ('53','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-01 15:18:47','::1','Firefox'), ('54','pc登录','3','貂蝉','[diaochan]超级密码登录成功','2016-07-01 15:20:02','::1','Firefox'), ('55','pc登录','2','管理员１','[rockoa]超级密码登录成功','2016-07-01 15:20:49','::1','Firefox'), ('56','pc登录','6','刘长','[liu1]超级密码登录成功','2016-07-01 15:21:35','::1','Firefox'), ('57','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-01 15:56:15','::1','Firefox'), ('58','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-02 08:29:25','127.0.0.1','Firefox'), ('59','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-02 21:17:31','127.0.0.1','Firefox'), ('60','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-02 21:30:15','127.0.0.1','Firefox'), ('61','pc登录','2','管理员１','[rockoa]超级密码登录成功','2016-07-02 21:33:01','127.0.0.1','Firefox'), ('62','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-02 21:51:29','127.0.0.1','Firefox'), ('63','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-02 22:05:12','127.0.0.1','Firefox'), ('64','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-02 22:06:27','127.0.0.1','Firefox'), ('65','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-02 22:07:10','127.0.0.1','Firefox'), ('66','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-02 22:08:15','127.0.0.1','Firefox'), ('67','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-02 22:08:37','::1','Chrome'), ('68','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-02 22:11:45','127.0.0.1','Firefox'), ('69','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-03 13:13:16','::1','Chrome'), ('70','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-03 13:16:06','::1','Chrome'), ('71','pc登录','3','貂蝉','[diaochan]超级密码登录成功','2016-07-03 13:17:14','127.0.0.1','Firefox'), ('72','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-03 13:20:15','::1','Chrome'), ('73','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-03 13:32:58','::1','Chrome'), ('74','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-04 09:30:34','::1','Firefox'), ('75','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-05 09:10:33','::1','Firefox'), ('76','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-06 09:09:20','::1','Firefox'), ('77','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-06 13:47:41','::1','Firefox'), ('78','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-06 21:06:50','127.0.0.1','Firefox'), ('79','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-09 12:03:43','127.0.0.1','Firefox'), ('80','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-10 21:43:52','127.0.0.1','Firefox'), ('81','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-11 09:11:39','::1','Firefox'), ('82','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-12 15:00:33','::1','Firefox'), ('83','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-13 09:04:20','::1','Firefox'), ('84','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-14 09:10:27','::1','Firefox'), ('85','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-15 14:09:52','::1','Firefox'), ('86','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-18 14:59:54','::1','Firefox'), ('87','reim登录','1','管理员','[admin]快捷登录','2016-07-18 15:02:36','::1','Firefox'), ('88','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-18 16:23:25','211.155.1.13','Chrome'), ('89','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-21 10:27:37','211.155.1.13','Chrome'), ('90','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-21 16:07:45','211.155.1.13','MSIE 11'), ('91','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-21 16:09:18','211.155.1.13','MSIE 11'), ('92','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-21 16:21:45','211.155.1.13','Chrome'), ('93','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-22 09:07:16','211.155.1.13','MSIE 11'), ('94','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:49:43','211.155.1.13','Chrome'), ('95','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:49:48','211.155.1.13','Chrome'), ('96','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:49:56','211.155.1.13','Chrome'), ('97','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:50:09','211.155.1.13','Chrome'), ('98','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:50:12','211.155.1.13','Chrome'), ('99','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:50:15','211.155.1.13','Chrome'), ('100','pc登录','1',NULL,'[admin]密码不对','2016-07-22 15:50:31','211.155.1.13','Chrome');
INSERT INTO `jntxfb_log` VALUES ('101','pc登录','1',NULL,'[admin]密码不对','2016-07-25 14:33:52','211.155.1.13','Chrome'), ('102','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-25 14:34:01','211.155.1.13','Chrome'), ('103','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-26 15:29:01','211.155.1.13','Firefox'), ('104','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-26 16:22:01','211.155.1.13','Firefox'), ('105','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 13:29:54','221.214.54.122','Chrome'), ('106','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 13:30:28','221.214.54.122','Chrome'), ('107','pc登录','7','刘备','[liubei]超级密码登录成功','2016-07-27 14:48:21','202.110.253.130','Chrome'), ('108','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 14:51:30','202.110.253.130','Chrome'), ('109','pc登录','0',NULL,'[xiaoq]用户不存在','2016-07-27 14:56:41','202.110.253.130','Chrome'), ('110','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-27 14:56:47','202.110.253.130','Chrome'), ('111','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 14:57:23','202.110.253.130','Chrome'), ('112','pc登录','3','貂蝉','[diaochan]超级密码登录成功','2016-07-27 14:58:31','202.110.253.130','Chrome'), ('113','pc登录','4','大乔','[daqiao]超级密码登录成功','2016-07-27 15:15:01','211.155.1.13','Firefox'), ('114','pc登录','0',NULL,'[zhaozhilong]用户不存在','2016-07-27 15:17:16','211.155.1.13','Firefox'), ('115','pc登录','0',NULL,'[zhaozilong]用户不存在','2016-07-27 15:17:20','211.155.1.13','Firefox'), ('116','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 15:17:55','211.155.1.13','Firefox'), ('117','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:20:05','211.155.1.13','Chrome'), ('118','pc登录','1',NULL,'[admin]密码不对','2016-07-27 15:20:42','202.110.253.130','Chrome'), ('119','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:20:47','202.110.253.130','Chrome'), ('120','pc登录','5','小乔','[xiaoqiao]超级密码登录成功','2016-07-27 15:26:15','202.110.253.130','Chrome'), ('121','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:26:28','211.155.1.13','Chrome'), ('122','pc登录','10','吕布','[lvbu]超级密码登录成功','2016-07-27 15:27:03','202.110.253.130','Chrome'), ('123','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:28:23','211.155.1.13','Chrome'), ('124','pc登录','3','貂蝉','[diaochan]超级密码登录成功','2016-07-27 15:28:32','211.155.1.13','Chrome'), ('125','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 15:28:38','202.110.253.130','Chrome'), ('126','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:31:02','202.110.253.130','Chrome'), ('127','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 15:33:12','202.110.253.130','Chrome'), ('128','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-27 15:42:23','221.214.54.122','Firefox'), ('129','pc登录','7','刘备','[liubei]超级密码登录成功','2016-07-27 15:43:08','221.214.54.122','Chrome'), ('130','pc登录','9','赵子龙','[zhaozl]超级密码登录成功','2016-07-27 15:45:27','221.214.54.122','Firefox'), ('131','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-28 15:05:46','211.155.1.13','Chrome'), ('132','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-29 11:12:15','211.155.1.13','Firefox'), ('133','pc登录','1','管理员','[admin]超级密码登录成功','2016-07-29 14:51:47','221.173.219.214','Chrome'), ('134','pc登录','1','管理员','[admin]超级密码登录成功','2016-09-28 14:09:43','202.110.253.130','Chrome');
INSERT INTO `jntxfb_logintoken` VALUES ('1','1','管理员','2458d44e7f54dc743be1d454ae4ded82','2016-05-09 20:12:14','2016-05-09 20:12:14','pc','1461162900390','127.0.0.1','Firefox','0'), ('2','1','管理员','0929e2608e40298fe9ad09f11a1794c7','2016-05-31 22:16:15','2016-05-31 22:16:15','pc','1461372278046','::1','Chrome','0'), ('3','1','管理员','ddd01345b43ca294ecf4a4e84f551bf3','2016-06-04 09:41:05','2016-06-04 09:41:05','pc','1461372278046','::1','Chrome','0'), ('4','1','管理员','8ca414fd53d28f99c5e0f8c115d792c0','2016-06-05 09:05:58','2016-06-05 09:05:58','pc','1461372278046','::1','Chrome','0'), ('5','1','管理员','7055307b30f9c81a8663a9b2a5e4fdb1','2016-06-09 08:19:58','2016-06-09 08:19:58','pc','1463575451766','127.0.0.1','Firefox','0'), ('6','1','管理员','277f3f72fe888e4bdd9d0cdb9ecc5b73','2016-06-09 08:45:50','2016-06-09 08:45:50','pc','1463575451766','127.0.0.1','Firefox','0'), ('7','1','管理员','56be1ca11a457a90c856c56765d8d431','2016-06-09 08:46:20','2016-06-09 08:46:22','reim',NULL,'127.0.0.1','Firefox','0'), ('8','1','管理员','8be2a783e786e352c066d70ff646075e','2016-06-10 09:10:09','2016-06-10 09:10:09','pc','1461372278046','::1','Chrome','0'), ('9','1','管理员','2c4641585611b3ae343103993ce16446','2016-06-11 09:20:01','2016-06-11 09:20:01','pc','1463575451766','127.0.0.1','Firefox','0'), ('10','1','管理员','23db98358e4ce1b20f5fed28e2e2181b','2016-06-11 09:20:19','2016-06-11 09:20:19','pc','1463575451766','127.0.0.1','Firefox','0'), ('11','1','管理员','f00715736cfd8ebb7d10cccb1f305cda','2016-06-11 10:55:02','2016-06-11 10:55:02','mweb',NULL,'127.0.0.1','Firefox','0'), ('12','1','管理员','e215feaad678300bb7b92f6d9ee6cb31','2016-06-11 14:02:09','2016-06-11 14:02:09','mweb',NULL,'127.0.0.1','Firefox','0'), ('13','1','管理员','29c8c94f2869b72e250cfb7f1c253b58','2016-06-11 14:23:40','2016-06-11 14:23:40','mweb',NULL,'127.0.0.1','Firefox','1'), ('14','1','管理员','8ff4cdcef2ec4b7f92a970fa1bb62495','2016-06-11 19:34:18','2016-06-11 19:34:18','pc','1461372278046','::1','Chrome','0'), ('15','1','管理员','63e36a08a7bfefc20962733e676735ab','2016-06-11 19:37:05','2016-06-11 19:37:05','pc','1463575451766','127.0.0.1','Firefox','0'), ('16','1','管理员','5440a93188689814e86d02e0508b6054','2016-06-11 20:59:32','2016-06-11 20:59:32','pc','1463575451766','127.0.0.1','Firefox','0'), ('17','1','管理员','gxq76moz','2016-06-12 08:38:17','2016-06-12 17:12:46','pc','1461286868502','::1','Firefox','0'), ('18','1','管理员','48ejds4l','2016-06-13 09:27:44','2016-06-13 16:47:04','pc','1461286868502','::1','Firefox','0'), ('19','1','管理员','9kdzw50e','2016-06-14 09:37:55','2016-06-14 17:08:09','pc','1461286868502','::1','Firefox','0'), ('20','1','管理员','zl6kftay','2016-06-20 08:44:27','2016-06-20 15:48:47','pc','1461286868502','::1','Firefox','0'), ('21','1','管理员','y5apu3u5','2016-06-20 15:52:01','2016-06-20 17:04:55','pc','1461286868502','::1','Firefox','0'), ('22','1','管理员','og51pxnd','2016-06-20 19:17:44','2016-06-20 19:17:44','pc','1463575451766','127.0.0.1','Firefox','0'), ('23','1','管理员','afzhtgj1','2016-06-20 19:25:10','2016-06-20 19:25:21','pc','1463575451766','127.0.0.1','Firefox','0'), ('24','1','管理员','6kf0ve2b','2016-06-20 19:29:34','2016-06-20 22:22:17','pc','1463575451766','127.0.0.1','Firefox','0'), ('25','1','管理员','kamp3jwj','2016-06-21 09:22:07','2016-06-21 16:55:04','pc','1461286868502','::1','Firefox','0'), ('26','1','管理员','5z6h3pn8','2016-06-21 20:38:26','2016-06-21 22:12:05','pc','1463575451766','127.0.0.1','Firefox','0'), ('27','1','管理员','y42uu009','2016-06-22 08:38:13','2016-06-22 09:01:00','pc','1461286868502','::1','Firefox','0'), ('28','1','管理员','miwohyio','2016-06-22 09:02:26','2016-06-22 09:11:24','pc','1461286868502','::1','Firefox','0'), ('29','1','管理员','ml5nwscp','2016-06-22 09:13:58','2016-06-22 16:46:07','pc','1461286868502','::1','Firefox','0'), ('30','1','管理员','owrb7606','2016-06-23 10:13:07','2016-06-23 16:53:20','pc','1461286868502','::1','Firefox','0'), ('31','1','管理员','7hrb7yfq','2016-06-24 09:22:32','2016-06-24 16:46:42','pc','1461286868502','::1','Firefox','0'), ('32','1','管理员','mho77n64','2016-06-24 21:47:47','2016-06-24 22:37:56','pc','1463575451766','127.0.0.1','Firefox','0'), ('33','1','管理员','i956vaxf','2016-06-25 08:59:35','2016-06-25 11:49:46','pc','1463575451766','127.0.0.1','Firefox','0'), ('34','1','管理员','4j9umbpb','2016-06-25 20:24:34','2016-06-25 23:04:43','pc','1461372278046','::1','Chrome','0'), ('35','1','管理员','cr1knbzg','2016-06-26 06:53:39','2016-06-26 15:33:52','pc','1461372278046','::1','Chrome','0'), ('36','5','小乔','potuin5a','2016-06-26 15:37:22','2016-06-26 15:37:31','pc','1461372278046','::1','Chrome','0'), ('37','1','管理员','l6d1yqln','2016-06-26 15:41:50','2016-06-26 15:41:59','pc','1461372278046','::1','Chrome','0'), ('38','1','管理员','b0zv8hdf','2016-06-26 15:51:13','2016-06-26 19:31:32','pc','1463575451766','127.0.0.1','Firefox','0'), ('39','5','小乔','076to534','2016-06-26 19:32:45','2016-06-26 19:32:56','pc','1463575451766','127.0.0.1','Firefox','0'), ('40','1','管理员','ejoyzesp','2016-06-26 19:34:50','2016-06-26 19:35:01','pc','1463575451766','127.0.0.1','Firefox','0'), ('41','5','小乔','13mtk765','2016-06-26 19:38:28','2016-06-26 19:38:40','pc','1463575451766','127.0.0.1','Firefox','0'), ('42','1','管理员','6uzh19lh','2016-06-26 19:41:28','2016-06-26 22:16:08','pc','1463575451766','127.0.0.1','Firefox','0'), ('43','2','管理员１','y08pddik','2016-06-26 22:26:04','2016-06-26 22:26:18','pc','1463575451766','127.0.0.1','Firefox','0'), ('44','1','管理员','hcwwly8f','2016-06-26 22:27:10','2016-06-26 22:27:23','pc','1463575451766','127.0.0.1','Firefox','0'), ('45','6','刘长','yfq5yrpw','2016-06-26 22:28:19','2016-06-26 22:28:32','pc','1463575451766','127.0.0.1','Firefox','0'), ('46','7','刘备','7aa4u8bl','2016-06-26 22:29:10','2016-06-26 22:29:23','pc','1463575451766','127.0.0.1','Firefox','0'), ('47','1','管理员','hodpofjg','2016-06-26 22:30:11','2016-06-26 22:30:25','pc','1463575451766','127.0.0.1','Firefox','0'), ('48','7','刘备','kbj84h5b','2016-06-26 22:34:36','2016-06-26 22:34:50','pc','1463575451766','127.0.0.1','Firefox','0'), ('49','1','管理员','zouf7lfh','2016-06-30 09:09:15','2016-06-30 14:39:27','pc','1461286868502','::1','Firefox','0'), ('50','1','管理员','ifrkx29o','2016-07-01 08:44:25','2016-07-01 14:04:36','pc','1461286868502','::1','Firefox','0'), ('51','6','刘长','3t1xqa4q','2016-07-01 14:08:46','2016-07-01 14:38:57','pc','1461286868502','::1','Firefox','0'), ('52','1','管理员','no9fmlyn','2016-07-01 14:40:23','2016-07-01 15:11:07','pc','1461286868502','::1','Firefox','0'), ('53','5','小乔','sf1e6d5s','2016-07-01 15:18:46','2016-07-01 15:18:58','pc','1461286868502','::1','Firefox','0'), ('54','3','貂蝉','eam01s9n','2016-07-01 15:20:01','2016-07-01 15:20:11','pc','1461286868502','::1','Firefox','0'), ('55','2','管理员１','iffe285h','2016-07-01 15:20:48','2016-07-01 15:21:00','pc','1461286868502','::1','Firefox','0'), ('56','6','刘长','p14ttqz2','2016-07-01 15:21:34','2016-07-01 15:51:44','pc','1461286868502','::1','Firefox','1'), ('57','1','管理员','5dytioy6','2016-07-01 15:56:14','2016-07-01 15:56:24','pc','1461286868502','::1','Firefox','0'), ('58','1','管理员','dm445hi7','2016-07-02 08:29:23','2016-07-02 11:23:34','pc','1463575451766','127.0.0.1','Firefox','0'), ('59','1','管理员','4gu3n50l','2016-07-02 21:17:30','2016-07-02 21:27:40','pc','1463575451766','127.0.0.1','Firefox','0'), ('60','10','吕布','br1djzij','2016-07-02 21:30:14','2016-07-02 21:30:23','pc','1463575451766','127.0.0.1','Firefox','0'), ('61','2','管理员１','33rb3b2a','2016-07-02 21:33:00','2016-07-02 21:43:10','pc','1463575451766','127.0.0.1','Firefox','1'), ('62','10','吕布','18huv4mm','2016-07-02 21:51:28','2016-07-02 22:01:39','pc','1463575451766','127.0.0.1','Firefox','0'), ('63','5','小乔','nylxmnkp','2016-07-02 22:05:11','2016-07-02 22:05:23','pc','1463575451766','127.0.0.1','Firefox','0'), ('64','10','吕布','a1l9wr1h','2016-07-02 22:06:25','2016-07-02 22:06:36','pc','1463575451766','127.0.0.1','Firefox','0'), ('65','5','小乔','wvsov5cr','2016-07-02 22:07:09','2016-07-02 22:07:19','pc','1463575451766','127.0.0.1','Firefox','0'), ('66','10','吕布','t4vf6kxc','2016-07-02 22:08:14','2016-07-02 22:08:25','pc','1463575451766','127.0.0.1','Firefox','0'), ('67','5','小乔','2whahtun','2016-07-02 22:08:35','2016-07-02 22:28:46','pc','1461372278046','::1','Chrome','0'), ('68','1','管理员','jm0rnvy8','2016-07-02 22:11:44','2016-07-02 22:26:21','pc','1463575451766','127.0.0.1','Firefox','0'), ('69','5','小乔','udv97azr','2016-07-03 13:13:15','2016-07-03 13:13:24','pc','1461372278046','::1','Chrome','0'), ('70','1','管理员','9xrb0kk6','2016-07-03 13:16:05','2016-07-03 22:04:27','pc','1461372278046','::1','Chrome','0'), ('71','3','貂蝉','h4ayg1z1','2016-07-03 13:17:13','2016-07-03 22:07:23','pc','1463575451766','127.0.0.1','Firefox','0'), ('72','10','吕布','hfk62iv9','2016-07-03 13:20:14','2016-07-03 13:30:23','pc','1461709387970','::1','Chrome','0'), ('73','5','小乔','h6867yqo','2016-07-03 13:32:57','2016-07-03 21:23:14','pc','1461709387970','::1','Chrome','0'), ('74','1','管理员','g2pzzocr','2016-07-04 09:30:33','2016-07-04 11:50:45','pc','1461286868502','::1','Firefox','0'), ('75','1','管理员','u2mnv2l8','2016-07-05 09:10:32','2016-07-05 16:48:59','pc','1461286868502','::1','Firefox','0'), ('76','1','管理员','5nihazhq','2016-07-06 09:09:19','2016-07-06 11:52:20','pc','1461286868502','::1','Firefox','0'), ('77','1','管理员','hgyroa55','2016-07-06 13:47:40','2016-07-06 16:59:00','pc','1461286868502','::1','Firefox','0'), ('78','1','管理员','da945zgm','2016-07-06 21:06:49','2016-07-06 22:36:18','pc','1463575451766','127.0.0.1','Firefox','0'), ('79','1','管理员','trlnzuli','2016-07-09 12:03:41','2016-07-09 22:45:09','pc','1463575451766','127.0.0.1','Firefox','0'), ('80','1','管理员','ks6fg1gw','2016-07-10 21:43:51','2016-07-10 23:27:05','pc','1463575451766','127.0.0.1','Firefox','0'), ('81','1','管理员','0rkj5wqb','2016-07-11 09:11:38','2016-07-11 16:48:35','pc','1461286868502','::1','Firefox','0'), ('82','1','管理员','0kd6mrqt','2016-07-12 15:00:32','2016-07-12 17:00:44','pc','1461286868502','::1','Firefox','0'), ('83','1','管理员','wfhbl93q','2016-07-13 09:04:19','2016-07-13 16:54:32','pc','1461286868502','::1','Firefox','0'), ('84','1','管理员','5mah47ln','2016-07-14 09:10:26','2016-07-15 12:02:05','pc','1461286868502','::1','Firefox','0'), ('85','1','管理员','mbi7mcmu','2016-07-15 14:09:51','2016-07-15 16:03:43','pc','1461286868502','::1','Firefox','0'), ('86','1','管理员','a9m3emmd','2016-07-18 14:59:53','2016-07-18 15:20:04','pc','1461286868502','::1','Firefox','0'), ('87','1','管理员','c68akr2d','2016-07-18 15:02:35','2016-07-18 15:02:37','reim',NULL,'::1','Firefox','1'), ('88','1','管理员','07cjcfaf','2016-07-18 16:23:25','2016-07-18 16:23:32','pc','1468393063930','211.155.1.13','Chrome','0'), ('89','1','管理员','l4chpsg4','2016-07-21 10:27:37','2016-07-21 12:07:49','pc','1468827177962','211.155.1.13','Chrome','0'), ('90','1','管理员','94s81xp2','2016-07-21 16:07:45','2016-07-21 16:07:52','pc','1469088192772','211.155.1.13','MSIE 11','0'), ('91','1','管理员','ffc8y8yt','2016-07-21 16:09:18','2016-07-21 16:09:25','pc','1469088192772','211.155.1.13','MSIE 11','0'), ('92','1','管理员','c24plm3z','2016-07-21 16:21:45','2016-07-21 16:31:56','pc','1469088994631','211.155.1.13','Chrome','0'), ('93','1','管理员','vyrn6dha','2016-07-22 09:07:16','2016-07-22 12:56:26','pc','1469088192772','211.155.1.13','MSIE 11','0'), ('94','1','管理员','jzbsehl2','2016-07-25 14:34:01','2016-07-25 17:04:08','pc','1469428074114','211.155.1.13','Chrome','0'), ('95','1','管理员','kouq285t','2016-07-26 15:29:01','2016-07-26 16:14:53','pc','1468393159274','211.155.1.13','Firefox','0'), ('96','1','管理员','84397nws','2016-07-26 16:22:01','2016-07-27 15:12:16','pc','1468393159274','211.155.1.13','Firefox','0'), ('97','1','管理员','fvoav5m0','2016-07-27 13:29:54','2016-07-27 13:50:04','pc','1469596893643','221.214.54.122','Chrome','0'), ('98','1','管理员','6fnrmqus','2016-07-27 13:30:28','2016-07-27 14:40:38','pc','1469597094242','221.214.54.122','Chrome','0'), ('99','7','刘备','1s5yfpyu','2016-07-27 14:48:21','2016-07-27 14:50:39','pc','1469597094242','202.110.253.130','Chrome','0'), ('100','9','赵子龙','6j0yxawc','2016-07-27 14:51:30','2016-07-27 14:51:36','pc','1469597094242','202.110.253.130','Chrome','0');
INSERT INTO `jntxfb_logintoken` VALUES ('101','5','小乔','fol5lgz3','2016-07-27 14:56:47','2016-07-27 14:57:15','pc','1469597094242','202.110.253.130','Chrome','0'), ('102','9','赵子龙','lk6tebqk','2016-07-27 14:57:23','2016-07-27 14:57:30','pc','1469597094242','202.110.253.130','Chrome','0'), ('103','3','貂蝉','h1vm4dh3','2016-07-27 14:58:31','2016-07-27 15:20:42','pc','1469597094242','202.110.253.130','Chrome','0'), ('104','4','大乔','pi7ka1il','2016-07-27 15:15:01','2016-07-27 15:15:10','pc','1468393159274','211.155.1.13','Firefox','1'), ('105','9','赵子龙','073msglm','2016-07-27 15:17:55','2016-07-27 16:45:30','pc','1468393159274','211.155.1.13','Firefox','1'), ('106','1','管理员','0nyw678r','2016-07-27 15:20:05','2016-07-27 15:20:24','pc','1468393063930','211.155.1.13','Chrome','0'), ('107','1','管理员','9sbncsyx','2016-07-27 15:20:47','2016-07-27 15:25:57','pc','1469597094242','202.110.253.130','Chrome','0'), ('108','5','小乔','lhffvq5f','2016-07-27 15:26:15','2016-07-27 15:26:55','pc','1469597094242','202.110.253.130','Chrome','1'), ('109','1','管理员','cr5olxbf','2016-07-27 15:26:28','2016-07-27 15:26:35','pc','1468393063930','211.155.1.13','Chrome','0'), ('110','10','吕布','i24rib89','2016-07-27 15:27:03','2016-07-27 15:27:10','pc','1469597094242','202.110.253.130','Chrome','1'), ('111','1','管理员','okam9kwp','2016-07-27 15:28:23','2016-07-27 15:28:30','pc','1468393063930','211.155.1.13','Chrome','0'), ('112','3','貂蝉','8dq0aeku','2016-07-27 15:28:32','2016-07-27 15:45:51','pc','1468393063930','211.155.1.13','Chrome','1'), ('113','9','赵子龙','jcbq6uz4','2016-07-27 15:28:38','2016-07-27 15:28:44','pc','1469597094242','202.110.253.130','Chrome','0'), ('114','1','管理员','htkhncak','2016-07-27 15:31:02','2016-07-27 15:31:08','pc','1469597094242','202.110.253.130','Chrome','0'), ('115','9','赵子龙','d6d4j6e7','2016-07-27 15:33:12','2016-07-27 15:33:19','pc','1469597094242','202.110.253.130','Chrome','0'), ('116','1','管理员','yg9g2lkv','2016-07-27 15:42:23','2016-07-27 15:42:33','pc','1469605008738','221.214.54.122','Firefox','0'), ('117','7','刘备','fvm58m57','2016-07-27 15:43:08','2016-07-27 16:03:05','pc','1469597094242','221.214.54.122','Chrome','1'), ('118','9','赵子龙','9qdpulr3','2016-07-27 15:45:27','2016-07-27 16:02:33','pc','1469605008738','221.214.54.122','Firefox','1'), ('119','1','管理员','drjlqzgh','2016-07-28 15:05:46','2016-07-28 15:05:53','pc','1468393063930','211.155.1.13','Chrome','0'), ('120','1','管理员','vwi6sfat','2016-07-29 11:12:15','2016-07-29 15:42:25','pc','1468393159274','211.155.1.13','Firefox','0'), ('121','1','管理员','tw3exhou','2016-07-29 14:51:47','2016-07-29 14:51:54','pc','1469774759496','221.173.219.214','Chrome','0'), ('122','1','管理员','0yqkhviu','2016-09-28 14:09:43','2016-09-28 14:09:53','pc','1475042363054','202.110.253.130','Chrome','1');
INSERT INTO `jntxfb_meet` VALUES ('1','管理员','会议室1','每天部门工作汇报','09:30:00','10:30:00','1','1','d4','开发部','0','工作日','0',NULL,'2015-11-21 19:34:54',NULL,NULL,NULL,'1','0',NULL,NULL,'0',NULL,NULL,NULL);
INSERT INTO `jntxfb_menu` VALUES ('1',NULL,'系统管理','0',NULL,'1','3','2014-03-21 23:55:50','cog','1',NULL,'1','0','0'), ('2',NULL,'菜单管理','72','system,menu','1','3','2014-01-02 20:16:50','table','2',NULL,'1','0','0'), ('3','admin','用户管理','72','system,admin','1','4','2014-01-02 19:33:39','user','2',NULL,'1','0','0'), ('6',NULL,'人事考勤','0',NULL,'0','5','2014-06-01 20:12:14','group_gear','1',NULL,'1','0','0'), ('7',NULL,'个人中心','63',NULL,'1','2',NULL,'user','1',NULL,'0','0','0'), ('10',NULL,'考勤设置','6',NULL,'1','2',NULL,'cog','1',NULL,'1','0','0'), ('11',NULL,'单位管理','72','system,dept,company','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('12',NULL,'首页项管理','72','index,home,guan','1','10',NULL,NULL,'1',NULL,'1','0','0'), ('15','homeperson','个人首页项','7','@index,home,indextd,mid=-1,padding=0','1','6',NULL,'application_view_tile','1',NULL,'0','0','0'), ('19',NULL,'客户选项','18','system,option,guan,num=rockcrm,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('21',NULL,'产品管理','18',NULL,'1','2',NULL,NULL,'1',NULL,'1','0','0'), ('40',NULL,'权限管理','1',NULL,'1','6','2013-12-21 20:57:08',NULL,'2',NULL,'1','0','0'), ('41',NULL,'组→菜单','40','system,extent,type=gm','1','1','2013-12-22 13:33:40',NULL,'3',NULL,'1','0','0'), ('42',NULL,'考勤时间分配','10','humanres,kaoqin,setfp','1','3',NULL,NULL,'1',NULL,'1','0','0'), ('43',NULL,'设置在线打卡IP','10','humanres,kaoqin,kqip','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('56',NULL,'人员→菜单','40','system,extent,type=um','1','0','2013-12-22 13:33:34',NULL,'3',NULL,'1','0','0'), ('57','group','组管理','72','system,group','1','5','2013-12-20 09:40:48','group','2',NULL,'1','0','0'), ('58',NULL,'菜单→人员','40','system,extent,type=mu','1','2','2013-12-22 13:33:47',NULL,'3',NULL,'1','0','0'), ('59',NULL,'菜单→组','40','system,extent,type=mg','1','3','2013-12-22 13:33:53',NULL,'3',NULL,'1','0','0'), ('60',NULL,'用户权限查看','40','system,extent,type=view','1','4','2013-12-20 16:19:33',NULL,'3',NULL,'1','0','0'), ('63',NULL,'个人办公','0',NULL,'1','0','2014-01-02 20:16:45','folder','2',NULL,'0','0','0'), ('64',NULL,'修改密码','7','system,pass','1','1','2014-01-02 20:16:22','lock','3',NULL,'0','0','0'), ('65',NULL,'我的资料','7','humanres,userinfor,edit,type=0,uid=0','1','2','2014-01-02 20:16:25',NULL,'3',NULL,'0','0','0'), ('67',NULL,'定时任务','1',NULL,'0','10','2014-04-03 20:57:13','time','2',NULL,'1','0','0'), ('70',NULL,'休息日设置','10','humanres,kaoqin,xiu','1','5','2014-02-11 21:53:03',NULL,'2',NULL,'1','0','0'), ('71',NULL,'会议管理','109',NULL,'1','3','2014-02-11 21:52:51',NULL,'2',NULL,'1','0','0'), ('72',NULL,'基础设置','1',NULL,'1','1','2014-02-09 20:10:09','computer','2',NULL,'1','0','0'), ('76',NULL,'上传文件','192','system,file','1','1','2014-02-10 20:23:16',NULL,'2',NULL,'1','0','0'), ('81',NULL,'共享文件','95','system,infor,fileshate','1','1','2014-03-22 21:02:29',NULL,'2',NULL,'0','0','0'), ('82','inforlist','信息列表','133','system,infor,list,atype=0','1','3','2014-08-23 22:07:09',NULL,'2',NULL,'1','1','0'), ('83',NULL,'系统选项','72','system,option','1','20','2014-08-23 22:10:13','wrench','3',NULL,'1','0','0'), ('84',NULL,'人员档案','153','humanres,userinfor','1','1','2014-06-02 20:08:42',NULL,'2',NULL,'1','0','0'), ('85','minstall','模块安装升级','192','system,upgrade,install','1','6','2015-12-08 23:15:59','arrow_up','1',NULL,'1','0','0'), ('87',NULL,'内部通讯录','193','person,vcard,in','1','0','2014-06-24 21:08:13',NULL,'2',NULL,'0','0','0'), ('91',NULL,'考勤分析','146','humanres,kaoqin,kqfx','1','7','2014-07-06 19:03:05',NULL,'2',NULL,'1','1','0'), ('92',NULL,'考勤时间规则','10','humanres,kaoqin,set','1','2','2014-07-06 19:06:32',NULL,'3',NULL,'1','0','0'), ('93',NULL,'打卡记录','146','humanres,kaoqin,dkjl','1','4','2014-07-06 19:06:59','clock_edit','3',NULL,'1','0','0'), ('94',NULL,'组织结构','72','system,dept','1','2','2014-08-23 22:06:58','chart_organisation','3',NULL,'1','0','0'), ('95',NULL,'公共信息','0',NULL,'1','1','2014-08-23 22:11:30','page_word','2',NULL,'1','0','0'), ('96',NULL,'流程处理表单','183','flow,course,input','1','10',NULL,NULL,'1',NULL,'1','0','0'), ('100',NULL,'定时任务选项','67','system,option,guan,num=rocktask,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('101',NULL,'定时提醒人员','67','system,task,todouser','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('102',NULL,'定时任务管理','67','system,task','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('103',NULL,'定时队列','67','system,task,taskqe','1','3',NULL,NULL,'1',NULL,'1','0','0'), ('104',NULL,'人员分析','153','humanres,userinfor,fx','1','10',NULL,'chart_pie','1',NULL,'1','1','0'), ('105',NULL,'流程配置','183','flow,set','1','1',NULL,'sitemap','1',NULL,'1','0','0'), ('106',NULL,'物品管理','109',NULL,'1','2',NULL,'lorry','1',NULL,'1','0','0'), ('107',NULL,'固定会议','71','humanres,meet,fixed','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('108',NULL,'会议列表','71','humanres,meet,list','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('109',NULL,'行政管理','0',NULL,'0','6',NULL,'page_gear','1',NULL,'1','0','0'), ('113',NULL,'数据查看权限','40','system,extent,view','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('114',NULL,'我的考勤','142','person,kaoqin,my','1','1',NULL,NULL,'1',NULL,'0','0','0'), ('115',NULL,'物品统计','106','humanres,supple,total','1','10',NULL,NULL,'1',NULL,'1','0','0'), ('116',NULL,'物品列表','106','humanres,supple,list','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('117',NULL,'物品选项','106','system,option,guan,num=rocksupple,atype=1','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('122',NULL,'加密解密','192','system,encode','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('125','meetapply','会议预定','142','humanres,meet,apply','1','21',NULL,NULL,'1',NULL,'0','0','0'), ('126','todo','提醒信息','7','person,todo','1','4',NULL,'bell','1',NULL,'0','0','0'), ('127',NULL,'请假和加班','146','humanres,kaoqin,leajia','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('128',NULL,'打卡记录','142','person,kaoqin,dkjl','1','5',NULL,NULL,'1',NULL,'0','0','0'), ('129',NULL,'考勤统计','146','humanres,kaoqin,total','1','8',NULL,NULL,'1',NULL,'1','0','0'), ('130',NULL,'外出出差','146','humanres,kaoqin,waichu','1','6',NULL,NULL,'1',NULL,'1','0','0'), ('133',NULL,'信息资料','95',NULL,'1','10',NULL,NULL,'1',NULL,'1','0','0'), ('134',NULL,'信息类别','133','system,option,guan,num=infortype','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('135',NULL,'内部文件','95',NULL,'1','11',NULL,'folder','1',NULL,'1','0','0'), ('136',NULL,'文件类别','135','system,option,guan,num=filetype','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('137',NULL,'文件列表','135','system,infor,filelist,atype=0','1','1',NULL,'folder_table','1',NULL,'1','0','0'), ('138',NULL,'信息新增','133','gong','1','2',NULL,'add','1',NULL,'1','0','3'), ('142',NULL,'考勤行政','63',NULL,'0','11',NULL,'clock_red','1',NULL,'0','0','0'), ('143',NULL,'工作日报','63',NULL,'0','12',NULL,'page_white_text_width','1',NULL,'0','0','0'), ('144',NULL,'我日报列表','143','person,daily,list,atype=5','1','1',NULL,NULL,'1',NULL,'0','0','0'), ('145',NULL,'我日报统计','143','person,daily,total','1','5',NULL,NULL,'1',NULL,'0','0','0'), ('146',NULL,'考勤信息','6',NULL,'1','3',NULL,'clock_red','1',NULL,'1','0','0'), ('147',NULL,'工作日报','6',NULL,'1','5',NULL,'page_white_text_width','1',NULL,'1','0','0'), ('148',NULL,'日报设置','147','humanres,daily,set','0','0',NULL,NULL,'1',NULL,'1','0','0'), ('149',NULL,'日报分析','147','humanres,daily,fx','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('150','gong','信息中心','95','system,infor,gong','1','0',NULL,NULL,'1',NULL,'0','0','0'), ('151','daicheck','待办/处理','202','flow,apply,check','1','0',NULL,'time','1',NULL,'0','0','0'), ('152',NULL,'系统设置','72','system,set','1','0',NULL,'edit','1',NULL,'1','0','0'), ('153',NULL,'人员管理','6',NULL,'1','1',NULL,NULL,'1',NULL,'1','0','0'), ('167',NULL,'日志查看','192','system,log','1','3',NULL,NULL,'1',NULL,'1','0','0'), ('168',NULL,'资产管理','109',NULL,'1','5',NULL,'monitor','1',NULL,'1','0','0'), ('169',NULL,'资产选项','168','system,option,guan,num=assets,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('170','assetslist','资产列表','168','humanres,assets,list','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('174',NULL,'考勤选项','10','system,option,guan,num=humanres,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('175',NULL,'人员选项','153','system,option,guan,num=userinfor,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('176',NULL,'上下班时间','10','humanres,kaoqin,sxb','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('183',NULL,'流程管理','1',NULL,'1','2',NULL,NULL,'1',NULL,'1','0','0'), ('184',NULL,'流程审核日志','183','flow,log','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('185','schedule','日程事务','7','person,schedule','1','3',NULL,'date','1',NULL,'0','0','0'), ('186',NULL,'文件网盘','95','system,infor,filelist,atype=1','1','2',NULL,'drive','1',NULL,'0','0','0'), ('187',NULL,'邮件管理','1',NULL,'0','5',NULL,'email','1',NULL,'1','0','0'), ('188',NULL,'人事调动','195','flow,applylist,hrtransfer,opentype=3','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('190',NULL,'发邮件帐号设置','187','system,email,set','1','0',NULL,'email_go','1',NULL,'1','0','0'), ('191',NULL,'系统邮件模版','187','system,email,tpl','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('192',NULL,'辅助功能','1',NULL,'1','20',NULL,NULL,'1',NULL,'1','0','0'), ('193',NULL,'通讯录','63',NULL,'1','10',NULL,'vcard','1',NULL,'0','0','0'), ('194',NULL,'我的通讯录','193','person,vcard,out','1','1',NULL,NULL,'1',NULL,'0','0','0'), ('195',NULL,'人力资源','6',NULL,'1','10',NULL,NULL,'1',NULL,'1','0','0'), ('196',NULL,'员工转正','195','flow,applylist,hrpositive,opentype=3','1','0',NULL,NULL,'1',NULL,'1','0','0');
INSERT INTO `jntxfb_menu` VALUES ('197',NULL,'离职管理','195','flow,applylist,hrredund,opentype=3','1','10',NULL,NULL,'1',NULL,'1','0','0'), ('198',NULL,'REIM通信管理','1',NULL,'0','12',NULL,NULL,'1',NULL,'1','0','0'), ('199',NULL,'聊天记录','198','system,reim,record','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('200',NULL,'群/讨论组管理','198','system,reim,group','1','2',NULL,'group','1',NULL,'1','0','0'), ('201',NULL,'流程选项','183','system,option,guan,num=flow,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('202',NULL,'工作流程','63',NULL,'1','12',NULL,'report','1',NULL,'0','0','0'), ('203',NULL,'流程申请','202','flow,apply','1','1',NULL,'page_add','1',NULL,'0','0','0'), ('204',NULL,'我的申请','202','flow,apply,checkmy,atype=0','1','2',NULL,NULL,'1',NULL,'0','0','0'), ('205',NULL,'会议选项','71','system,option,guan,num=meet,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('206',NULL,'部门信息资料','95','system,infor,list,atype=1','0','5',NULL,NULL,'1',NULL,'1','0','0'), ('207',NULL,'日报查看','147','humanres,daily,view','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('208',NULL,'人员劳动合同','153','humanres,userinfor,contract','1','5',NULL,NULL,'1',NULL,'1','0','0'), ('209',NULL,'服务器设置','198','system,reim,set','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('210',NULL,'常用菜单管理','7','system,menu,chang','0','5',NULL,NULL,'1',NULL,'0','0','0'), ('212',NULL,'车辆管理','109',NULL,'1','6',NULL,'car','1',NULL,'1','0','0'), ('213',NULL,'行政选项','109','system,option,guan,num=rockadmins,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('214',NULL,'车辆信息','212','humanres,car,infor','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('215',NULL,'车辆选项','212','system,option,guan,num=rockcar,atype=1','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('216',NULL,'车辆预定查询','212','flow,applylist,careserve,opentype=3','1','3',NULL,NULL,'1',NULL,'1','0','0'), ('217',NULL,'车辆预定情况','212','humanres,car,reserve','1','4',NULL,NULL,'1',NULL,'1','0','0'), ('218',NULL,'车辆提醒','212','humanres,car,todo','1','2',NULL,NULL,'1',NULL,'1','0','0'), ('219',NULL,'经我处理','202','flow,apply,checkmy,atype=1','1','3',NULL,NULL,'1',NULL,'0','0','0'), ('220',NULL,'我下属申请','202','flow,apply,checkmy,atype=2','0','4',NULL,NULL,'1',NULL,'0','0','0'), ('221',NULL,'授权查看','202','flow,apply,checkmy,atype=3','0','5',NULL,NULL,'1',NULL,'0','0','0'), ('222',NULL,'我下属日报','143','person,daily,list,atype=4','1','2',NULL,NULL,'1',NULL,'0','0','0'), ('223',NULL,'日报授权我查看','143','person,daily,list,atype=6','1','3',NULL,NULL,'1',NULL,'0','0','0'), ('235','dailyadd','新增日报','143','person,daily,add','1','0',NULL,'add','1',NULL,'0','0','0'), ('236',NULL,'RockOA官网','192','http://www.rockoa.com/','1','10',NULL,NULL,'1',NULL,'0','0','2'), ('237',NULL,'应用管理','198','system,reim,agent','1','1',NULL,NULL,'1',NULL,'1','0','0'), ('238',NULL,'科目管理','72','budget,subject','1','0',NULL,'chart_organisation','3',NULL,'1','0','0'), ('239',NULL,'职位→科目','72','budget,zwtosubject,type=zs','1','0',NULL,'chart_organisation','3',NULL,'1','0','0'), ('240',NULL,'预算管理','0',NULL,'1','0',NULL,'folder','1',NULL,'1','0','0'), ('241',NULL,'预算制定','240','budget,addbudget','1','0',NULL,'chart_organisation','2',NULL,'1','0','0'), ('242',NULL,'预算选项','240','budget,option,guan,num=budget,atype=1','0','0',NULL,'chart_organisation','1',NULL,'1','0','0'), ('243',NULL,'预算执行查询','240','budget,execution','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('244',NULL,'月度预算执行查询','240','budget,execution,mlist','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('247',NULL,'按单位统计','240','budget,execution,dept','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('248',NULL,'按科目统计','240','budget,execution,subject','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('249',NULL,'预算执行统计图','240','budget,execution,fx','1','0',NULL,NULL,'1',NULL,'1','0','0'), ('250',NULL,'报销列表','240','budget,execution,list','1','0',NULL,NULL,'1',NULL,'1','0','0');
INSERT INTO `jntxfb_option` VALUES ('1','rock',NULL,'系统选项',NULL,NULL,NULL,'0',NULL,'1','0','1'), ('2','ranking','userinfor','职位',NULL,'3','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('3',NULL,'ranking','工程师',NULL,'4','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('4',NULL,'ranking','科长',NULL,'5','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('5','infortype','rock','信息类别',NULL,'0','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('6','humanres','rock','人事考勤',NULL,'2','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('7','notice','infortype','通知公告',NULL,'0','2015-05-15 16:30:53','1',NULL,'0','5','1'), ('8','rules','infortype','规章制度',NULL,'1','2015-11-12 19:17:28','1',NULL,'0','5','1'), ('9','culture','infortype','企业文化',NULL,'2','2015-11-12 19:17:24','1',NULL,'0','5','1'), ('10','tasktype','rocktask','任务类型',NULL,'6','2015-09-28 11:23:42','1',NULL,'0','273','1'), ('11','userinfor','rock','人员选项',NULL,'4','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('12','workstatus','userinfor','人员状态',NULL,'0','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('13','xueli','userinfor','学历',NULL,'1','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('18',NULL,'xueli','小学',NULL,'0','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('19',NULL,'xueli','初中',NULL,'1','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('20',NULL,'xueli','高中',NULL,'2','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('21',NULL,'xueli','中专',NULL,'3','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('22',NULL,'xueli','大专',NULL,'4','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('23',NULL,'xueli','本科',NULL,'5','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('24',NULL,'xueli','研究生',NULL,'6','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('25',NULL,'xueli','博士',NULL,'7','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('26',NULL,'xueli','博士后',NULL,'8','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('28','minzu','userinfor','民族',NULL,'2','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('29',NULL,'minzu','汉族',NULL,'0',NULL,'0',NULL,'0','28','1'), ('30',NULL,'minzu','回民',NULL,'0',NULL,'0',NULL,'0','28','1'), ('31',NULL,'minzu','壮族',NULL,'0',NULL,'0',NULL,'0','28','1'), ('32',NULL,'minzu','维吾尔族',NULL,'0',NULL,'0',NULL,'0','28','1'), ('34',NULL,'ranking','行政前台',NULL,'6','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('35',NULL,'xueli','其他',NULL,'9','2014-12-17 15:12:49','1',NULL,'0','13','1'), ('38',NULL,'ranking','董事长',NULL,'0','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('39',NULL,'ranking','程序员',NULL,'7','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('40',NULL,'ranking','出纳',NULL,'8','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('41',NULL,'tasktype','基础任务',NULL,'0','2014-12-17 16:39:10','1',NULL,'0','10','1'), ('44',NULL,'meeting','会议室1',NULL,'0','2014-12-22 12:34:54','1',NULL,'0','169','1'), ('45','flow','rock','流程选项',NULL,'7','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('46','flowatype','flow','针对类型',NULL,'1','2015-11-28 16:22:21','1',NULL,'0','45','1'), ('47',NULL,'flowatype','所有人员','all','0','2014-12-30 19:23:47','1',NULL,'0','46','1'), ('48',NULL,'flowatype','指定部门','dept','2','2014-12-30 19:23:47','1',NULL,'0','46','1'), ('49',NULL,'flowatype','指定人员','user','1','2014-12-30 19:23:47','1',NULL,'0','46','1'), ('50','flowchecktype','flow','审核人类型',NULL,'2','2015-11-28 16:22:21','1',NULL,'0','45','1'), ('51',NULL,'flowchecktype','直属上级','super','2','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('52',NULL,'flowchecktype','部门负责人','dept','3','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('53',NULL,'flowchecktype','指定人员','user','6','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('55','leavetypem','humanres','请假类型',NULL,'0','2015-09-01 09:36:19','1',NULL,'0','6','1'), ('56','leavetypes','humanres','人事请假类型',NULL,'1','2015-09-01 09:36:19','1',NULL,'0','6','1'), ('57',NULL,'leavetypem','事假',NULL,'0','2015-01-04 21:07:10','1',NULL,'0','55','1'), ('58',NULL,'leavetypem','年假',NULL,'1','2015-01-04 21:07:10','1',NULL,'0','55','1'), ('59',NULL,'leavetypem','婚假',NULL,'2','2015-01-04 21:07:10','1',NULL,'0','55','1'), ('60',NULL,'leavetypem','病假',NULL,'3','2015-01-04 21:07:10','1',NULL,'0','55','1'), ('61',NULL,'leavetypes','增加年假',NULL,'0','2015-01-04 21:07:45','1',NULL,'0','56','1'), ('62',NULL,'leavetypes','增加婚假',NULL,'1','2015-01-04 21:07:45','1',NULL,'0','56','1'), ('63',NULL,'ranking','CEO',NULL,'1','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('64',NULL,'ranking','总经理',NULL,'2','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('65',NULL,'ranking','人事经理',NULL,'3','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('66',NULL,'flowchecktype','开始','start','0','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('67',NULL,'flowchecktype','结束','end','1','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('68','rockmode','rock','功能模块',NULL,'8','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('69','leave','rockmode','请假条',NULL,'0','2015-03-19 15:44:07','1',NULL,'0','68','1'), ('70','jiaban','rockmode','加班单',NULL,'1','2015-03-19 15:44:07','1',NULL,'0','68','1'), ('71',NULL,'flowcoursename_1','主管审核',NULL,'0','2015-01-29 11:17:54','1',NULL,'0',NULL,'1'), ('72',NULL,'flowcoursename_2','上级主管审核',NULL,'0','2015-01-29 11:10:41','1',NULL,'0',NULL,'1'), ('73',NULL,'flowcoursename_1','人事确认',NULL,'1','2015-01-29 11:17:54','1',NULL,'0',NULL,'1'), ('74',NULL,'flowcoursename_3','主管审核',NULL,'0','2015-01-30 15:35:42','1',NULL,'0',NULL,'1'), ('75','kaoqintype','humanres','考勤类型',NULL,'2','2015-09-01 09:36:19','1',NULL,'0','6','1'), ('76',NULL,'kaoqintype','正常',NULL,'0','2015-02-06 13:35:00','1',NULL,'0','75','1'), ('77',NULL,'kaoqintype','迟到',NULL,'1','2015-02-06 13:35:00','1',NULL,'0','75','1'), ('78',NULL,'kaoqintype','早退',NULL,'2','2015-02-06 13:35:00','1',NULL,'0','75','1'), ('79',NULL,'kaoqintype','未打卡',NULL,'3','2015-02-06 13:35:00','1',NULL,'0','75','1'), ('80','rockwork','rock','工作任务',NULL,'9','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('81','worktype','rockwork','任务类型',NULL,'0','2015-09-10 14:52:57','1',NULL,'0','80','1'), ('82',NULL,'worktype','设计',NULL,'0','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('83',NULL,'worktype','开发',NULL,'1','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('84','workgrade','rockwork','任务等级',NULL,'1','2015-09-10 14:52:57','1',NULL,'0','80','1'), ('85','workstate','rockwork','任务状态',NULL,'2','2015-09-10 14:52:57','1',NULL,'0','80','1'), ('86',NULL,'workgrade','低',NULL,'0','2015-02-07 22:19:15','1',NULL,'0','84','1'), ('87',NULL,'workgrade','中',NULL,'1','2015-02-07 22:19:15','1',NULL,'0','84','1'), ('88',NULL,'workgrade','高',NULL,'2','2015-02-07 22:19:15','1',NULL,'0','84','1'), ('89',NULL,'workgrade','紧急',NULL,'3','2015-02-07 22:19:15','1',NULL,'0','84','1'), ('90',NULL,'workstate','待执行',NULL,'0','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('91',NULL,'workstate','执行中',NULL,'1','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('92',NULL,'workstate','已完成',NULL,'8','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('93',NULL,'workstate','执行中5%',NULL,'2','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('94',NULL,'workstate','执行中10%',NULL,'3','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('95',NULL,'workstate','执行中50%',NULL,'5','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('96',NULL,'workstate','执行中90%',NULL,'7','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('97',NULL,'workstate','执行中30%',NULL,'4','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('98',NULL,'worktype','测试',NULL,'2','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('99','filetype','rock','文档类别',NULL,'5','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('100',NULL,'filetype','基础文件',NULL,'0','2015-05-15 15:20:22','1',NULL,'0','99','1'), ('101',NULL,'filetype','基础文档',NULL,'1','2015-05-15 15:20:22','1',NULL,'0','99','1'), ('102','systemtitle',NULL,'系统名称','济南通信段财务预算系统','7','2016-06-09 08:56:41','1',NULL,'1','1','1'), ('104','systemlogo',NULL,'系统logo','images/icons40.png','0','2016-06-09 08:56:41','1',NULL,'0',NULL,'1'), ('106','assetstype','assets','资产类别',NULL,'0','2015-04-13 16:01:22','1',NULL,'0','107','1'), ('107','assets','rock','资产选项',NULL,'6','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('108','assetsbrand','assets','品牌',NULL,'1','2015-04-13 16:01:22','1',NULL,'0','107','1'), ('109',NULL,'assetstype','笔记本','BJB','0','2015-06-30 17:13:06','1',NULL,'0','106','1'), ('110',NULL,'assetstype','电脑','DN','0','2015-06-30 17:13:16','1',NULL,'0','106','1'), ('111','assetslaiyuan','assets','资产来源',NULL,'2','2015-04-13 16:01:22','1',NULL,'0','107','1'), ('112',NULL,'assetslaiyuan','购入',NULL,'0','2015-04-13 13:32:48','1',NULL,'0','111','1'), ('113',NULL,'assetslaiyuan','自建',NULL,'0','2015-04-13 13:33:03','1',NULL,'0','111','1');
INSERT INTO `jntxfb_option` VALUES ('114','assetsstate','assets','资产状态',NULL,'3','2015-04-13 16:01:22','1',NULL,'0','107','1'), ('115',NULL,'assetsstate','在用',NULL,'0','2015-04-13 13:35:16','1',NULL,'0','114','1'), ('116',NULL,'assetsstate','闲置',NULL,'0','2015-04-13 13:35:22','1',NULL,'0','114','1'), ('117',NULL,'assetsstate','已报废',NULL,'0','2015-04-13 13:35:31','1',NULL,'0','114','1'), ('118',NULL,'assetsstate','维修中',NULL,'0','2015-04-13 13:35:41','1',NULL,'0','114','1'), ('119','assetsaddress','assets','放置地点',NULL,'4','2015-04-13 16:01:22','1',NULL,'0','107','1'), ('120',NULL,'assetsaddress','仓库一',NULL,'0','2015-04-13 16:02:03','1',NULL,'0','119','1'), ('121',NULL,'assetsaddress','仓库二',NULL,'0','2015-04-13 16:02:08','1',NULL,'0','119','1'), ('122',NULL,'assetsstate','借出',NULL,'0','2015-04-14 10:28:37','1',NULL,'0','114','1'), ('123','rockproject','rock','项目管理',NULL,'10','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('124',NULL,'assetsbrand','联想',NULL,'0','2015-04-29 14:04:24','1',NULL,'0','108','1'), ('125',NULL,'assetsbrand','戴尔',NULL,'0','2015-04-29 14:04:30','1',NULL,'0','108','1'), ('126','projecttype','rockproject','项目类别',NULL,'0','2015-05-08 17:40:51','1',NULL,'0','123','1'), ('127','projectstate','rockproject','项目状态',NULL,'1','2015-05-08 17:40:51','1',NULL,'0','123','1'), ('128','projectguimo','rockproject','项目规模',NULL,'2','2015-05-08 17:40:51','1',NULL,'0','123','1'), ('129',NULL,'projectstate','待执行',NULL,'0','2015-05-08 23:20:48','1',NULL,'0','127','1'), ('130',NULL,'projectstate','执行中',NULL,'1','2015-05-08 23:20:54','1',NULL,'0','127','1'), ('131',NULL,'projectstate','已完成',NULL,'2','2015-05-08 23:21:00','1',NULL,'0','127','1'), ('132',NULL,'projectstate','已取消',NULL,'3','2015-05-08 23:21:11','1',NULL,'0','127','1'), ('133',NULL,'projecttype','一般项目',NULL,'0','2015-05-08 23:24:26','1',NULL,'0','126','1'), ('134',NULL,'projecttype','重大项目',NULL,'0','2015-05-08 23:24:37','1',NULL,'0','126','1'), ('135',NULL,'projecttype','重要项目',NULL,'0','2015-05-08 23:24:46','1',NULL,'0','126','1'), ('136',NULL,'projecttype','关键项目',NULL,'0','2015-05-08 23:24:52','1',NULL,'0','126','1'), ('137',NULL,'projectguimo','小',NULL,'0','2015-05-08 23:25:27','1',NULL,'0','128','1'), ('138',NULL,'projectguimo','中',NULL,'1','2015-05-08 23:25:32','1',NULL,'0','128','1'), ('139',NULL,'projectguimo','大',NULL,'2','2015-05-08 23:25:41','1',NULL,'0','128','1'), ('140',NULL,'filetype_1','技术文档',NULL,'0','2015-05-15 16:27:03','1',NULL,'0',NULL,'1'), ('141','filetype_1_4225','filetype_1','培训文档',NULL,'1','2015-05-15 16:27:03','1',NULL,'0',NULL,'1'), ('143',NULL,'vcardgroup1','同事',NULL,'0','2015-05-16 22:34:59','1',NULL,'0',NULL,'1'), ('144',NULL,'vcardgroup1','盟友',NULL,'1','2015-05-16 22:34:59','1',NULL,'0',NULL,'1'), ('145','hunyin','userinfor','婚姻状况',NULL,'4','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('146','xuexing','userinfor','血型',NULL,'5','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('147',NULL,'hunyin','未婚',NULL,'0','2015-05-16 23:06:08','1',NULL,'0','145','1'), ('148',NULL,'hunyin','已婚',NULL,'1','2015-05-16 23:06:13','1',NULL,'0','145','1'), ('149',NULL,'hunyin','丧偶',NULL,'2','2015-05-16 23:06:36','1',NULL,'0','145','1'), ('150',NULL,'hunyin','离异',NULL,'3','2015-05-16 23:06:43','1',NULL,'0','145','1'), ('151',NULL,'hunyin','其他',NULL,'4','2015-05-16 23:06:51','1',NULL,'0','145','1'), ('152',NULL,'xuexing','A型',NULL,'0','2015-05-16 23:07:07','1',NULL,'0','146','1'), ('153',NULL,'xuexing','B型',NULL,'1','2015-05-16 23:07:12','1',NULL,'0','146','1'), ('154',NULL,'xuexing','O型',NULL,'2','2015-05-16 23:07:17','1',NULL,'0','146','1'), ('155',NULL,'xuexing','AB型',NULL,'3','2015-05-16 23:07:25','1',NULL,'0','146','1'), ('156',NULL,'xuexing','其他',NULL,'4','2015-05-16 23:07:30','1',NULL,'0','146','1'), ('157',NULL,'xuexing','未知',NULL,'5','2015-05-16 23:07:36','1',NULL,'0','146','1'), ('158','zzmianmao','userinfor','政治面貌',NULL,'6','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('159',NULL,'zzmianmao','群众',NULL,'0','2015-05-17 10:37:49','1',NULL,'0','158','1'), ('160',NULL,'zzmianmao','党员',NULL,'0','2015-05-17 10:37:54','1',NULL,'0','158','1'), ('161',NULL,'zzmianmao','团员',NULL,'0','2015-05-17 10:38:00','1',NULL,'0','158','1'), ('162','flowfenlei','flow','流程分类',NULL,'0','2015-11-28 16:22:21','1',NULL,'0','45','1'), ('164',NULL,'flowfenlei','财务',NULL,'0','2015-07-31 15:58:47','1',NULL,'0','162','1'), ('165',NULL,'flowfenlei','协同办公',NULL,'1','2015-06-17 16:38:06','1',NULL,'0','162','1'), ('166',NULL,'flowcoursename_4','接收人签收',NULL,'0','2015-06-17 16:41:09','1',NULL,'0',NULL,'1'), ('167',NULL,'flowchecktype','自定义','auto','8','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('168','meet','rock','会议选项',NULL,'3','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('169','meeting','meet','会议室列表',NULL,'0','2015-07-13 13:50:43','1',NULL,'0','168','1'), ('174','jishukao','infortype_dept_dev','技术考核',NULL,'0','2016-01-06 19:17:14','1',NULL,'0',NULL,'1'), ('175',NULL,'flowcoursename_6','行政发放',NULL,'0','2015-07-23 16:18:20','1',NULL,'0',NULL,'1'), ('178','hetongtype','userinfor','合同类型',NULL,'7','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('179',NULL,'hetongtype','固定期限劳动合同',NULL,'0','2015-07-31 15:23:40','1',NULL,'0','178','1'), ('180',NULL,'hetongtype','无固定期限劳动合同',NULL,'0','2015-07-31 15:23:59','1',NULL,'0','178','1'), ('181',NULL,'hetongtype','劳务派遣合同',NULL,'0','2015-07-31 15:24:15','1',NULL,'0','178','1'), ('182',NULL,'hetongtype','非全日制用工合同',NULL,'0','2015-07-31 15:24:38','1',NULL,'0','178','1'), ('183',NULL,'flowfenlei','人力资源',NULL,'0','2015-07-31 15:58:34','1',NULL,'0','162','1'), ('184',NULL,'flowcoursename_7','领导审批',NULL,'0','2015-08-01 11:51:49','1',NULL,'0',NULL,'1'), ('185',NULL,'flowcoursename_7','人事审批',NULL,'1','2015-08-01 11:51:49','1',NULL,'0',NULL,'1'), ('186',NULL,'flowcoursename_8','人事经理审批',NULL,'0','2015-08-01 12:00:33','1',NULL,'0',NULL,'1'), ('187',NULL,'flowcoursename_9','领导审批',NULL,'0','2015-08-01 12:00:58','1',NULL,'0',NULL,'1'), ('188',NULL,'flowcoursename_9','人事审批',NULL,'1','2015-08-01 12:00:58','1',NULL,'0',NULL,'1'), ('189','redundtype','userinfor','离职类型',NULL,'8','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('190','redundreson','userinfor','离职原因',NULL,'9','2015-08-01 12:28:43','1',NULL,'0','11','1'), ('191',NULL,'redundtype','自动离职',NULL,'0','2015-08-01 12:25:35','1',NULL,'0','189','1'), ('192',NULL,'redundtype','退休',NULL,'0','2015-08-01 12:25:44','1',NULL,'0','189','1'), ('193',NULL,'redundtype','病辞',NULL,'0','2015-08-01 12:25:52','1',NULL,'0','189','1'), ('194',NULL,'redundtype','辞退',NULL,'0','2015-08-01 12:26:00','1',NULL,'0','189','1'), ('195',NULL,'redundtype','辞职',NULL,'0','2015-08-01 12:26:06','1',NULL,'0','189','1'), ('196',NULL,'redundreson','无法胜任工作',NULL,'0','2015-08-01 12:27:29','1',NULL,'0','190','1'), ('197',NULL,'redundreson','另找到工作',NULL,'0','2015-08-01 12:26:44','1',NULL,'0','190','1'), ('198',NULL,'redundreson','身体原因',NULL,'0','2015-08-01 12:26:53','1',NULL,'0','190','1'), ('199',NULL,'redundreson','年龄到期',NULL,'0','2015-08-01 12:27:06','1',NULL,'0','190','1'), ('200','transfertype','userinfor','调动类型',NULL,'10','2015-08-18 11:59:29','1',NULL,'0','11','1'), ('201',NULL,'transfertype','平调',NULL,'0','2015-08-01 12:29:04','1',NULL,'0','200','1'), ('202',NULL,'transfertype','晋升',NULL,'0','2015-08-01 12:29:14','1',NULL,'0','200','1'), ('203',NULL,'transfertype','降职',NULL,'0','2015-08-01 12:29:21','1',NULL,'0','200','1'), ('204','dakaerrtype','humanres','打卡异常类型',NULL,'3','2015-09-01 09:36:19','1',NULL,'0','6','1'), ('205',NULL,'dakaerrtype','忘记打卡',NULL,'0','2015-08-05 12:05:51','1',NULL,'0','204','1'), ('206',NULL,'dakaerrtype','打卡不成功',NULL,'1','2015-08-05 12:06:23','1',NULL,'0','204','1'), ('207',NULL,'flowcoursename_10','主管审核',NULL,'0','2015-08-05 12:07:49','1',NULL,'0',NULL,'1'), ('208',NULL,'leavetypem','产假',NULL,'4','2015-08-20 10:26:28','1',NULL,'0','55','1'), ('209',NULL,'leavetypes','增加产假',NULL,'2','2015-08-20 10:27:54','1',NULL,'0','56','1'), ('210',NULL,'flowcoursename_11','科目负责人审核',NULL,'0','2016-06-20 19:42:33','1',NULL,'0',NULL,'1'), ('211',NULL,'flowcoursename_11','财务主管审批',NULL,'1','2016-06-20 19:42:33','1',NULL,'0',NULL,'1'), ('212',NULL,'flowcoursename_11','财务付款',NULL,'2','2016-06-20 19:42:33','1',NULL,'0',NULL,'1'), ('213',NULL,'ranking','财务经理',NULL,'9','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('214','rockfina','rock','财务选项',NULL,'11','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('215','finaitems','rockfina','所属项目',NULL,'0','2015-09-15 09:39:07','1',NULL,'0','214','1'), ('216',NULL,'finaitems','市内交通费',NULL,'0','2015-08-21 10:29:01','1',NULL,'0','215','1'), ('217',NULL,'finaitems','办公用品',NULL,'1','2015-08-21 10:29:01','1',NULL,'0','215','1'), ('218',NULL,'finaitems','快递费',NULL,'2','2015-08-21 10:29:01','1',NULL,'0','215','1'), ('219',NULL,'finaitems','停车费',NULL,'3','2015-08-21 10:29:01','1',NULL,'0','215','1'), ('220',NULL,'finaitems','电话费',NULL,'4','2015-08-21 10:29:01','1',NULL,'0','215','1'), ('221',NULL,'finaitems','其它',NULL,'5','2015-08-21 10:29:01','1',NULL,'0','215','1');
INSERT INTO `jntxfb_option` VALUES ('229','jiang','infortype','奖惩通告',NULL,'3','2016-01-06 19:13:33','1',NULL,'0','5','1'), ('230','rockadmins','rock','行政选项',NULL,'12','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('231','rewardtype','rockadmins','奖惩类型',NULL,'0','2015-09-14 14:23:27','1',NULL,'0','230','1'), ('232','rewardresult','rockadmins','奖惩结果',NULL,'1','2015-09-14 14:23:27','1',NULL,'0','230','1'), ('233',NULL,'rewardtype','奖励',NULL,'0','2015-09-14 14:01:28','1',NULL,'0','231','1'), ('234',NULL,'rewardtype','处罚',NULL,'0','2015-09-14 14:01:39','1',NULL,'0','231','1'), ('235',NULL,'rewardresult','奖励',NULL,'0','2015-09-14 14:02:21','1',NULL,'0','232','1'), ('236',NULL,'rewardresult','警告',NULL,'0','2015-09-14 14:02:26','1',NULL,'0','232','1'), ('237',NULL,'rewardresult','辞退',NULL,'0','2015-09-14 14:02:33','1',NULL,'0','232','1'), ('238',NULL,'rewardresult','降职',NULL,'0','2015-09-14 14:02:45','1',NULL,'0','232','1'), ('239','rewardmoney','rockadmins','奖惩金额',NULL,'2','2015-09-14 14:23:27','1',NULL,'0','230','1'), ('240',NULL,'rewardmoney','奖励100元','100','1','2015-09-14 14:26:46','1',NULL,'0','239','1'), ('241',NULL,'rewardmoney','处罚100元','-100','2','2015-09-14 14:26:51','1',NULL,'0','239','1'), ('242',NULL,'rewardmoney','无金额','0','0','2015-09-14 14:27:06','1',NULL,'0','239','1'), ('243',NULL,'flowfenlei','行政',NULL,'2','2015-09-14 16:03:03','1',NULL,'0','162','1'), ('244','finpaytype','rockfina','付款方式',NULL,'1','2015-09-15 09:39:07','1',NULL,'0','214','1'), ('245',NULL,'finpaytype','汇款',NULL,'0','2015-09-15 09:40:00','1',NULL,'0','244','1'), ('246',NULL,'finpaytype','支付宝',NULL,'1','2015-09-15 09:40:00','1',NULL,'0','244','1'), ('247',NULL,'finpaytype','财付通',NULL,'2','2015-09-15 09:40:00','1',NULL,'0','244','1'), ('248',NULL,'finpaytype','其它',NULL,'3','2015-09-15 09:40:00','1',NULL,'0','244','1'), ('249','rockcar','rock','车辆选项',NULL,'13','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('250','cartype','rockcar','车辆类型',NULL,'0','2015-09-16 11:17:16','1',NULL,'0','249','1'), ('251','carbrand','rockcar','车辆品牌',NULL,'1','2015-09-16 11:17:16','1',NULL,'0','249','1'), ('252','carstate','rockcar','车辆状态',NULL,'2','2015-09-16 11:17:16','1',NULL,'0','249','1'), ('253',NULL,'cartype','小型车',NULL,'0','2016-04-27 22:28:22','1',NULL,'0','250','1'), ('254',NULL,'carbrand','奥迪',NULL,'0','2015-09-16 10:37:04','1',NULL,'0','251','1'), ('255',NULL,'carbrand','奔驰',NULL,'0','2015-09-16 10:37:12','1',NULL,'0','251','1'), ('256',NULL,'carstate','可用',NULL,'0','2015-09-16 10:48:57','1',NULL,'0','252','1'), ('257',NULL,'carstate','报废',NULL,'0','2015-09-16 10:50:14','1',NULL,'0','252','1'), ('258',NULL,'carstate','维修中',NULL,'0','2015-09-16 10:50:22','1',NULL,'0','252','1'), ('259','carbfields','rockcar','车辆变更字段',NULL,'3','2015-09-16 11:17:16','1',NULL,'0','249','1'), ('260',NULL,'carbfields','状态','state','0','2015-09-16 15:05:26','1',NULL,'0','259','1'), ('261',NULL,'carbfields','强险开始日期','qxstartdt','1','2015-09-16 15:05:26','1',NULL,'0','259','1'), ('262',NULL,'carbfields','强险截止日期','qxenddt','2','2015-09-16 15:05:26','1',NULL,'0','259','1'), ('263',NULL,'carbfields','强险金额','qxmoney','3','2015-09-16 15:05:26','1',NULL,'0','259','1'), ('264',NULL,'carbfields','加油费','jymoney','4','2015-09-16 15:44:01','1',NULL,'0','259','1'), ('265',NULL,'carbfields','维修费','wxmoney','5','2015-09-16 15:44:16','1',NULL,'0','259','1'), ('266',NULL,'carbfields','停车费','tcmoney','6','2015-09-16 15:44:29','1',NULL,'0','259','1'), ('267',NULL,'carbfields','行驶证开始日期','xszstartdt','7','2015-09-23 17:48:18','1',NULL,'0','259','1'), ('268',NULL,'carbfields','行驶证截止日期','xszenddt','8','2015-09-23 17:48:34','1',NULL,'0','259','1'), ('269',NULL,'carbfields','商业险开始日期','syxstartdt','9','2015-09-23 17:49:09','1',NULL,'0','259','1'), ('270',NULL,'carbfields','商业险截止日期','syxenddt','10','2015-09-23 17:49:20','1',NULL,'0','259','1'), ('271',NULL,'carbfields','年审开始日期','nsstartdt','11','2015-09-23 17:52:38','1',NULL,'0','259','1'), ('272',NULL,'carbfields','年审截止日期','nsenddt','12','2015-09-23 17:52:55','1',NULL,'0','259','1'), ('273','rocktask','rock','定时任务选项',NULL,'1','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('274',NULL,'tasktype','系统任务',NULL,'1','2015-10-21 17:52:08','1',NULL,'0','10','1'), ('275','rocksupple','rock','物品选项',NULL,'14','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('276','suppletype','rocksupple','物品分类',NULL,'0','2015-10-30 13:48:22','1',NULL,'0','275','1'), ('277','suppleunit','rocksupple','物品单位',NULL,'1','2015-10-30 13:48:22','1',NULL,'0','275','1'), ('278',NULL,'suppletype','办公用品',NULL,'0','2015-10-30 13:48:59','1',NULL,'0','276','1'), ('279',NULL,'suppleunit','个',NULL,'0','2015-10-30 13:51:55','1',NULL,'0','277','1'), ('280',NULL,'suppleunit','件',NULL,'1','2015-10-30 13:51:55','1',NULL,'0','277','1'), ('281',NULL,'suppleunit','箱',NULL,'2','2015-10-30 13:51:55','1',NULL,'0','277','1'), ('282',NULL,'suppletype','耗材',NULL,'1','2015-10-30 15:54:03','1',NULL,'0','276','1'), ('283',NULL,'ranking','行政主管',NULL,'10','2016-06-10 09:24:05','1',NULL,'0','2','1'), ('284',NULL,'workstate','执行中70%',NULL,'6','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('285','flowinputtype','flow','表单类型',NULL,'3','2015-11-28 16:22:21','1',NULL,'0','45','1'), ('286',NULL,'flowinputtype','文本框','text','0','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('287',NULL,'flowinputtype','日期','date','1','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('288',NULL,'flowinputtype','日期时间','datetime','2','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('289',NULL,'flowinputtype','时间','time','3','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('290',NULL,'flowinputtype','隐藏文本框','hidden','4','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('291',NULL,'flowinputtype','选择人员(单选)','changeuser','7','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('292',NULL,'flowinputtype','选择人员(多选)','changeusercheck','8','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('297',NULL,'tasktype','微信任务',NULL,'2','2016-01-03 18:58:48','1',NULL,'0','10','1'), ('298',NULL,'tasktype','钉钉任务',NULL,'3','2016-01-03 19:11:34','1',NULL,'0','10','1'), ('299',NULL,'flowchecktype','指定部门','depta','7','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('300',NULL,'worktype','研究',NULL,'3','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('301',NULL,'worktype','讨论',NULL,'4','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('302',NULL,'worktype','改进',NULL,'5','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('303',NULL,'worktype','bug',NULL,'6','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('304',NULL,'worktype','其它',NULL,'7','2016-01-13 13:03:00','1',NULL,'0','81','1'), ('305',NULL,'workstate','推迟',NULL,'9','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('306',NULL,'workstate','取消',NULL,'10','2016-01-14 18:42:59','1',NULL,'0','85','1'), ('307',NULL,'workstate','驳回',NULL,'12','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('308',NULL,'workstate','暂停',NULL,'11','2016-01-14 18:42:33','1',NULL,'0','85','1'), ('310','notice_4837','notice','通知1',NULL,'0','2016-01-26 16:57:43','1',NULL,'0','7','1'), ('312','rockcrm','rock','客户选项',NULL,'15','2016-02-25 20:20:05','1',NULL,'1','1','1'), ('313','custgrade','rockcrm','客户等级',NULL,'0','2016-02-25 20:29:44','1',NULL,'0','312','1'), ('314','custlaiyuan','rockcrm','客户来源',NULL,'1','2016-02-25 20:29:44','1',NULL,'0','312','1'), ('315','custstate','rockcrm','客户状态',NULL,'2','2016-02-25 20:29:44','1',NULL,'0','312','1'), ('316',NULL,'custgrade','1星',NULL,'0','2016-02-25 20:23:09','1',NULL,'0','313','1'), ('317',NULL,'custgrade','2星',NULL,'1','2016-02-25 20:23:09','1',NULL,'0','313','1'), ('318',NULL,'custgrade','3星',NULL,'2','2016-02-25 20:23:09','1',NULL,'0','313','1'), ('319',NULL,'custlaiyuan','自己开括',NULL,'0','2016-02-25 20:24:30','1',NULL,'0','314','1'), ('320',NULL,'custlaiyuan','推销电话',NULL,'1','2016-02-25 20:24:30','1',NULL,'0','314','1'), ('321',NULL,'custlaiyuan','网上开括',NULL,'2','2016-02-25 20:24:30','1',NULL,'0','314','1'), ('322',NULL,'custstate','正式',NULL,'0','2016-02-25 20:25:58','1',NULL,'0','315','1'), ('323',NULL,'custstate','意向',NULL,'1','2016-02-25 20:25:58','1',NULL,'0','315','1'), ('324',NULL,'custstate','丢失',NULL,'2','2016-02-25 20:25:58','1',NULL,'0','315','1'), ('325','custtype','rockcrm','客户类型',NULL,'3','2016-02-25 20:29:44','1',NULL,'0','312','1'), ('326',NULL,'custtype','合作伙伴',NULL,'0','2016-02-25 20:27:35','1',NULL,'0','325','1'), ('327',NULL,'custtype','代理商',NULL,'1','2016-02-25 20:27:35','1',NULL,'0','325','1'), ('328',NULL,'custtype','供应商',NULL,'2','2016-02-25 20:27:35','1',NULL,'0','325','1'), ('329','filetype_5_8071','filetype_5','123','123','0','2016-03-02 14:40:10','5',NULL,'0',NULL,'1'), ('330',NULL,'flowchecktype','申请人','apply','5','2016-03-29 20:46:38','1',NULL,'0','50','1'), ('336',NULL,'flowinputtype','数字','number','5','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('337',NULL,'flowinputtype','文本域','textarea','6','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('338',NULL,'flowinputtype','固定值','fixed','11','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('339',NULL,'flowinputtype','系统选项下拉框','rockcombo','12','2016-04-26 22:15:19','1',NULL,'0','285','1');
INSERT INTO `jntxfb_option` VALUES ('340',NULL,'flowinputtype','下拉框','select','13','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('341',NULL,'flowinputtype','htmt编辑器','htmlediter','14','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('342',NULL,'flowinputtype','选择部门人员','changedeptusercheck','10','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('343',NULL,'flowinputtype','单个复选框','checkbox','15','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('344',NULL,'flowinputtype','多个复选框','checkboxall','16','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('345',NULL,'flowinputtype','选择部门','changedept','9','2016-04-26 22:15:19','1',NULL,'0','285','1'), ('346',NULL,'cartype','轿车',NULL,'1','2016-04-27 22:28:22','1',NULL,'0','250','1'), ('347',NULL,'cartype','商务车',NULL,'2','2016-04-27 22:28:22','1',NULL,'0','250','1'), ('348',NULL,'cartype','大巴',NULL,'3','2016-04-27 22:28:22','1',NULL,'0','250','1'), ('351','modekeysval',NULL,NULL,'977ad79bfd5f6962db51a4711d60ce07',NULL,'2016-05-09 20:12:24','0',NULL,'0','0','1'), ('352',NULL,'flowchecktype','组','group','0','2016-06-05 09:25:20','1',NULL,'0','50','1'), ('353','mysqlpath',NULL,NULL,NULL,NULL,'2016-06-09 08:56:41','0',NULL,'0','0','1'), ('354','mysqlpathbf',NULL,NULL,NULL,NULL,'2016-06-09 08:56:41','0',NULL,'0','0','1'), ('355',NULL,'flowinputtype','选择科目','changesubject','0','2016-06-20 20:28:28','1',NULL,'0','285','1');
INSERT INTO `jntxfb_reads` VALUES ('1','kq_info','56','1','2016-05-08 17:51:04','127.0.0.1','MSIE 9'), ('2','fininfom','4','1','2016-05-08 17:51:06','127.0.0.1','MSIE 9'), ('3','fininfom','5','1','2016-06-04 10:59:15','::1','Chrome'), ('5','fininfom','6','1','2016-06-20 19:57:31','127.0.0.1','Firefox'), ('6','fininfom','5','1','2016-06-20 19:58:07','127.0.0.1','Firefox'), ('7','fininfom','2','1','2016-06-20 19:58:14','127.0.0.1','Firefox'), ('8','fininfom','1','1','2016-06-20 19:58:27','127.0.0.1','Firefox'), ('9','fininfom','7','1','2016-06-22 08:45:00','::1','Firefox'), ('10','fininfom','7','1','2016-06-22 13:13:21','::1','Firefox'), ('11','fininfom','22','5','2016-06-26 15:37:42','::1','Chrome'), ('12','fininfom','21','5','2016-06-26 15:40:14','::1','Chrome'), ('13','fininfom','21','5','2016-06-26 15:40:56','::1','Chrome'), ('14','fininfom','21','1','2016-06-26 15:42:37','::1','Chrome'), ('15','fininfom','21','1','2016-06-26 15:43:09','::1','Chrome'), ('16','fininfom','21','1','2016-06-26 15:51:57','127.0.0.1','Firefox'), ('17','fininfom','21','1','2016-06-26 15:53:30','127.0.0.1','Firefox'), ('18','fininfom','21','1','2016-06-26 15:59:03','127.0.0.1','Firefox'), ('19','fininfom','21','1','2016-06-26 16:00:53','127.0.0.1','Firefox'), ('20','fininfom','21','1','2016-06-26 16:07:42','127.0.0.1','Firefox'), ('21','fininfom','21','1','2016-06-26 16:08:52','127.0.0.1','Firefox'), ('22','fininfom','21','1','2016-06-26 16:12:07','127.0.0.1','Firefox'), ('23','fininfom','21','1','2016-06-26 17:00:38','127.0.0.1','Firefox'), ('24','fininfom','21','1','2016-06-26 17:01:04','127.0.0.1','Firefox'), ('25','fininfom','21','1','2016-06-26 17:31:23','127.0.0.1','Firefox'), ('26','fininfom','21','1','2016-06-26 17:32:01','127.0.0.1','Firefox'), ('27','fininfom','21','1','2016-06-26 17:43:16','127.0.0.1','Firefox'), ('28','fininfom','21','1','2016-06-26 17:43:24','127.0.0.1','Firefox'), ('29','fininfom','21','1','2016-06-26 17:43:34','127.0.0.1','Firefox'), ('30','fininfom','21','1','2016-06-26 17:44:13','127.0.0.1','Firefox'), ('31','fininfom','21','1','2016-06-26 17:50:42','127.0.0.1','Firefox'), ('32','fininfom','22','1','2016-06-26 19:23:12','127.0.0.1','Firefox'), ('33','fininfom','22','1','2016-06-26 19:23:51','127.0.0.1','Firefox'), ('34','fininfom','22','1','2016-06-26 19:25:55','127.0.0.1','Firefox'), ('35','fininfom','22','1','2016-06-26 19:28:25','127.0.0.1','Firefox'), ('36','fininfom','22','1','2016-06-26 19:29:17','127.0.0.1','Firefox'), ('37','fininfom','22','1','2016-06-26 19:29:29','127.0.0.1','Firefox'), ('38','fininfom','22','1','2016-06-26 19:29:38','127.0.0.1','Firefox'), ('39','fininfom','21','1','2016-06-26 19:29:49','127.0.0.1','Firefox'), ('40','fininfom','22','1','2016-06-26 19:30:18','127.0.0.1','Firefox'), ('41','fininfom','22','1','2016-06-26 19:30:31','127.0.0.1','Firefox'), ('42','fininfom','22','1','2016-06-26 19:30:42','127.0.0.1','Firefox'), ('43','fininfom','22','1','2016-06-26 19:31:02','127.0.0.1','Firefox'), ('44','fininfom','22','1','2016-06-26 19:31:44','127.0.0.1','Firefox'), ('45','fininfom','22','1','2016-06-26 19:35:52','127.0.0.1','Firefox'), ('46','fininfom','8','1','2016-06-26 19:36:15','127.0.0.1','Firefox'), ('47','fininfom','21','1','2016-06-26 19:36:22','127.0.0.1','Firefox'), ('48','fininfom','21','1','2016-06-26 19:36:30','127.0.0.1','Firefox'), ('49','fininfom','8','1','2016-06-26 19:36:40','127.0.0.1','Firefox'), ('50','fininfom','21','1','2016-06-26 19:36:57','127.0.0.1','Firefox'), ('51','fininfom','22','1','2016-06-26 19:37:02','127.0.0.1','Firefox'), ('52','fininfom','22','1','2016-06-26 19:37:35','127.0.0.1','Firefox'), ('53','fininfom','21','1','2016-06-26 19:37:44','127.0.0.1','Firefox'), ('54','fininfom','22','1','2016-06-26 19:38:07','127.0.0.1','Firefox'), ('55','fininfom','8','5','2016-06-26 19:39:08','127.0.0.1','Firefox'), ('56','fininfom','7','5','2016-06-26 19:39:24','127.0.0.1','Firefox'), ('57','fininfom','1','5','2016-06-26 19:39:58','127.0.0.1','Firefox'), ('58','fininfom','1','5','2016-06-26 19:40:21','127.0.0.1','Firefox'), ('59','fininfom','1','5','2016-06-26 19:40:29','127.0.0.1','Firefox'), ('60','fininfom','1','1','2016-06-26 19:42:12','127.0.0.1','Firefox'), ('61','fininfom','22','1','2016-06-26 19:42:28','127.0.0.1','Firefox'), ('62','fininfom','22','1','2016-06-26 19:42:35','127.0.0.1','Firefox'), ('63','fininfom','22','1','2016-06-26 20:56:38','127.0.0.1','Firefox'), ('64','fininfom','22','1','2016-06-26 21:22:48','127.0.0.1','Firefox'), ('65','fininfom','22','1','2016-06-26 21:49:00','127.0.0.1','Firefox'), ('66','fininfom','22','1','2016-06-26 21:50:30','127.0.0.1','Firefox'), ('67','fininfom','1','1','2016-06-26 21:54:37','127.0.0.1','Firefox'), ('68','fininfom','22','1','2016-06-26 21:54:54','127.0.0.1','Firefox'), ('69','fininfom','7','1','2016-06-26 21:55:36','127.0.0.1','Firefox'), ('70','fininfom','7','1','2016-06-26 21:57:31','127.0.0.1','Firefox'), ('71','fininfom','7','1','2016-06-26 21:58:37','127.0.0.1','Firefox'), ('72','fininfom','1','1','2016-06-26 21:59:36','127.0.0.1','Firefox'), ('73','fininfom','7','1','2016-06-26 21:59:41','127.0.0.1','Firefox'), ('74','fininfom','22','1','2016-06-26 22:13:26','127.0.0.1','Firefox'), ('75','fininfom','22','1','2016-06-26 22:13:58','127.0.0.1','Firefox'), ('76','fininfom','21','1','2016-06-26 22:14:30','127.0.0.1','Firefox'), ('77','fininfom','22','1','2016-06-26 22:14:41','127.0.0.1','Firefox'), ('78','fininfom','21','1','2016-06-26 22:14:51','127.0.0.1','Firefox'), ('79','fininfom','22','1','2016-06-26 22:15:47','127.0.0.1','Firefox'), ('80','fininfom','22','1','2016-06-26 22:24:44','127.0.0.1','Firefox'), ('81','fininfom','22','1','2016-06-26 22:25:13','127.0.0.1','Firefox'), ('82','fininfom','7','2','2016-06-26 22:26:27','127.0.0.1','Firefox'), ('83','fininfom','22','2','2016-06-26 22:26:39','127.0.0.1','Firefox'), ('84','hrpositive','1','1','2016-06-26 22:27:41','127.0.0.1','Firefox'), ('85','fininfom','22','6','2016-06-26 22:28:43','127.0.0.1','Firefox'), ('86','fininfom','22','7','2016-06-26 22:29:46','127.0.0.1','Firefox'), ('87','fininfom','22','1','2016-06-26 22:30:37','127.0.0.1','Firefox'), ('88','fininfom','22','1','2016-06-26 22:30:44','127.0.0.1','Firefox'), ('89','fininfom','22','1','2016-06-26 22:31:08','127.0.0.1','Firefox'), ('90','fininfom','21','1','2016-06-26 22:31:32','127.0.0.1','Firefox'), ('91','fininfom','21','1','2016-06-26 22:31:40','127.0.0.1','Firefox'), ('92','fininfom','22','1','2016-06-26 22:31:50','127.0.0.1','Firefox'), ('93','fininfom','22','1','2016-06-26 22:31:57','127.0.0.1','Firefox'), ('94','fininfom','22','1','2016-06-26 22:32:08','127.0.0.1','Firefox'), ('95','fininfom','22','1','2016-06-26 22:32:30','127.0.0.1','Firefox'), ('96','fininfom','22','1','2016-06-26 22:32:37','127.0.0.1','Firefox'), ('97','fininfom','22','1','2016-06-26 22:33:27','127.0.0.1','Firefox'), ('98','fininfom','22','1','2016-06-26 22:33:56','127.0.0.1','Firefox'), ('99','fininfom','22','1','2016-06-26 22:34:08','127.0.0.1','Firefox'), ('100','fininfom','22','1','2016-06-26 22:34:17','127.0.0.1','Firefox'), ('101','fininfom','7','6','2016-07-01 14:09:48','::1','Firefox');
INSERT INTO `jntxfb_reads` VALUES ('102','fininfom','7','6','2016-07-01 14:11:54','::1','Firefox'), ('103','fininfom','7','6','2016-07-01 14:12:40','::1','Firefox'), ('104','fininfom','7','1','2016-07-01 14:59:08','::1','Firefox'), ('105','fininfom','6','5','2016-07-01 15:19:36','::1','Firefox'), ('106','fininfom','6','3','2016-07-01 15:20:18','::1','Firefox'), ('107','fininfom','6','2','2016-07-01 15:21:03','::1','Firefox'), ('108','fininfom','6','2','2016-07-01 15:21:09','::1','Firefox'), ('109','fininfom','6','6','2016-07-01 15:22:14','::1','Firefox'), ('110','fininfom','6','1','2016-07-01 16:01:29','::1','Firefox'), ('111','fininfom','6','1','2016-07-01 16:01:39','::1','Firefox'), ('112','fininfom','23','1','2016-07-02 10:02:18','127.0.0.1','Firefox'), ('113','fininfom','23','1','2016-07-02 10:02:26','127.0.0.1','Firefox'), ('114','fininfom','23','1','2016-07-02 10:02:39','127.0.0.1','Firefox'), ('115','fininfom','23','1','2016-07-02 10:18:47','127.0.0.1','Firefox'), ('116','fininfom','20','1','2016-07-02 10:18:54','127.0.0.1','Firefox'), ('117','fininfom','23','1','2016-07-02 10:19:04','127.0.0.1','Firefox'), ('118','fininfom','22','1','2016-07-02 10:19:14','127.0.0.1','Firefox'), ('119','fininfom','21','1','2016-07-02 10:19:35','127.0.0.1','Firefox'), ('120','fininfom','21','1','2016-07-02 10:20:05','127.0.0.1','Firefox'), ('121','fininfom','21','1','2016-07-02 10:27:14','127.0.0.1','Firefox'), ('122','fininfom','21','1','2016-07-02 10:28:15','127.0.0.1','Firefox'), ('123','fininfom','21','1','2016-07-02 10:33:29','127.0.0.1','Firefox'), ('124','fininfom','21','1','2016-07-02 10:36:21','127.0.0.1','Firefox'), ('125','fininfom','21','1','2016-07-02 10:38:04','127.0.0.1','Firefox'), ('126','fininfom','21','1','2016-07-02 10:45:50','127.0.0.1','Firefox'), ('127','fininfom','21','1','2016-07-02 10:46:50','127.0.0.1','Firefox'), ('128','fininfom','21','1','2016-07-02 10:47:59','127.0.0.1','Firefox'), ('129','fininfom','21','1','2016-07-02 10:52:25','127.0.0.1','Firefox'), ('130','fininfom','21','1','2016-07-02 10:52:40','127.0.0.1','Firefox'), ('131','fininfom','21','1','2016-07-02 11:04:42','127.0.0.1','Firefox'), ('132','fininfom','21','1','2016-07-02 11:15:29','127.0.0.1','Firefox'), ('133','fininfom','32','10','2016-07-02 21:54:45','127.0.0.1','Firefox'), ('134','fininfom','32','10','2016-07-02 21:55:10','127.0.0.1','Firefox'), ('135','fininfom','31','10','2016-07-02 21:55:41','127.0.0.1','Firefox'), ('136','fininfom','30','10','2016-07-02 21:56:03','127.0.0.1','Firefox'), ('137','fininfom','29','10','2016-07-02 21:56:21','127.0.0.1','Firefox'), ('138','fininfom','27','10','2016-07-02 21:56:44','127.0.0.1','Firefox'), ('139','fininfom','25','10','2016-07-02 21:57:05','127.0.0.1','Firefox'), ('140','fininfom','27','5','2016-07-02 22:05:53','127.0.0.1','Firefox'), ('141','fininfom','28','5','2016-07-02 22:07:38','127.0.0.1','Firefox'), ('142','fininfom','29','5','2016-07-02 22:09:35','::1','Chrome'), ('143','fininfom','28','10','2016-07-02 22:10:01','127.0.0.1','Firefox'), ('144','fininfom','27','10','2016-07-02 22:10:13','127.0.0.1','Firefox'), ('145','fininfom','26','10','2016-07-02 22:10:25','127.0.0.1','Firefox'), ('146','fininfom','27','10','2016-07-02 22:10:34','127.0.0.1','Firefox'), ('147','fininfom','29','10','2016-07-02 22:10:41','127.0.0.1','Firefox'), ('148','fininfom','32','5','2016-07-03 13:13:36','::1','Chrome'), ('149','fininfom','31','5','2016-07-03 13:13:49','::1','Chrome'), ('150','fininfom','30','5','2016-07-03 13:13:58','::1','Chrome'), ('151','fininfom','26','5','2016-07-03 13:14:10','::1','Chrome'), ('152','fininfom','25','5','2016-07-03 13:14:24','::1','Chrome'), ('153','fininfom','28','5','2016-07-03 13:14:37','::1','Chrome'), ('154','fininfom','32','1','2016-07-03 13:16:23','::1','Chrome'), ('155','fininfom','31','1','2016-07-03 13:16:46','::1','Chrome'), ('156','fininfom','29','1','2016-07-03 13:16:58','::1','Chrome'), ('157','fininfom','32','10','2016-07-03 13:20:36','::1','Chrome'), ('158','fininfom','32','10','2016-07-03 13:20:45','::1','Chrome'), ('159','fininfom','24','5','2016-07-03 13:33:13','::1','Chrome'), ('160','fininfom','24','5','2016-07-03 13:33:54','::1','Chrome'), ('161','fininfom','28','5','2016-07-03 19:43:11','::1','Chrome'), ('162','fininfom','23','1','2016-07-05 09:42:20','::1','Firefox'), ('163','fininfom','23','1','2016-07-05 09:42:24','::1','Firefox'), ('164','fininfom','23','1','2016-07-05 09:42:37','::1','Firefox'), ('165','fininfom','23','1','2016-07-05 09:45:03','::1','Firefox'), ('166','fininfom','23','1','2016-07-05 10:12:06','::1','Firefox'), ('174','infor','8','1','2016-07-09 12:17:33','127.0.0.1','Firefox'), ('175','infor','8','1','2016-07-09 12:18:36','127.0.0.1','Firefox'), ('176','fininfom','33','1','2016-07-18 15:23:39','::1','Firefox'), ('177','fininfom','33','1','2016-07-18 15:23:56','::1','Firefox'), ('178','fininfom','33','1','2016-07-18 15:24:06','::1','Firefox'), ('179','fininfom','33','1','2016-07-18 15:24:10','::1','Firefox'), ('180','docdeil','20','1','2016-07-21 10:28:01','211.155.1.13','Chrome'), ('181','fininfom','25','1','2016-07-21 10:28:31','211.155.1.13','Chrome'), ('182','docdeil','19','1','2016-07-21 10:29:56','211.155.1.13','Chrome'), ('183','fininfom','27','1','2016-07-21 10:30:22','211.155.1.13','Chrome'), ('184','docdeil','20','1','2016-07-21 10:31:08','211.155.1.13','Chrome'), ('185','fininfom','27','1','2016-07-21 10:31:18','211.155.1.13','Chrome'), ('186','docdeil','20','1','2016-07-21 10:32:39','211.155.1.13','Chrome'), ('187','docdeil','20','1','2016-07-21 10:32:53','211.155.1.13','Chrome'), ('188','fininfom','28','1','2016-07-21 10:49:16','211.155.1.13','Chrome'), ('189','fininfom','6','1','2016-07-25 14:34:30','211.155.1.13','Chrome'), ('190','docdeil','20','1','2016-07-27 13:31:29','221.214.54.122','Chrome'), ('191','fininfom','27','1','2016-07-27 13:31:44','221.214.54.122','Chrome'), ('192','fininfom','34','1','2016-07-27 14:42:03','202.110.253.130','Chrome'), ('193','fininfom','3','7','2016-07-27 14:48:33','202.110.253.130','Chrome'), ('194','fininfom','35','9','2016-07-27 14:54:43','202.110.253.130','Chrome'), ('195','fininfom','35','5','2016-07-27 14:56:53','202.110.253.130','Chrome'), ('196','fininfom','35','3','2016-07-27 14:58:37','202.110.253.130','Chrome'), ('197','fininfom','8','3','2016-07-27 14:59:48','202.110.253.130','Chrome'), ('198','fininfom','8','3','2016-07-27 15:00:16','202.110.253.130','Chrome'), ('199','fininfom','26','3','2016-07-27 15:01:34','202.110.253.130','Chrome'), ('200','fininfom','26','3','2016-07-27 15:01:40','202.110.253.130','Chrome'), ('201','fininfom','26','3','2016-07-27 15:07:40','202.110.253.130','Chrome'), ('202','fininfom','30','3','2016-07-27 15:09:54','202.110.253.130','Chrome'), ('203','fininfom','35','9','2016-07-27 15:18:27','211.155.1.13','Firefox'), ('204','fininfom','36','9','2016-07-27 15:30:44','202.110.253.130','Chrome'), ('205','infor','8','1','2016-07-28 15:06:20','211.155.1.13','Chrome');
INSERT INTO `jntxfb_reward` VALUES ('1','1','2016-04-25 19:46:33','1','管理员','2016-04-24','管理员认证开发OA系统，奖励的。','2','1','7','7,3','2','貂蝉','刘备','管理员','1','奖励','奖励','100');
INSERT INTO `jntxfb_schedule` VALUES ('17','ROCKOA开发','2015-07-15 00:00:00','2015-07-20 15:42:00','1','2015-07-20 15:42:18','管理员','0',NULL,'日程事务→通知公告→流程完善'), ('18','招聘','2015-07-16 09:56:00','2015-07-18 09:56:00','3','2015-07-16 09:56:25','貂蝉','0',NULL,'呵呵'), ('19','REIM群讨论组管理','2015-07-20 16:00:00','2015-07-20 18:00:00','1','2015-07-20 15:43:12','管理员','0',NULL,NULL), ('21','REIM的socket推送改进','2015-09-10 17:27:00','2015-09-17 16:43:00','1','2015-09-17 16:43:32','管理员','0',NULL,'REIM需要改进，如果连续发送很多，服务端卡死，哎'), ('22','开发OA','2015-10-27 11:24:00','2015-10-27 23:24:00','1','2015-10-27 11:24:48','管理员','0',NULL,NULL), ('23','ssssss','2016-03-02 12:27:00',NULL,'1','2016-03-02 12:28:43','管理员','0',NULL,'ssss');
INSERT INTO `jntxfb_sjoin` VALUES ('4','zs','14','6','2016-06-24 10:06:49'), ('5','zs','14','7','2016-06-24 10:06:49'), ('6','zs','14','8','2016-06-24 10:06:49'), ('7','zs','14','11','2016-06-24 10:06:49'), ('8','zs','14','12','2016-06-24 10:06:49'), ('37','zs','16','1','2016-06-24 10:43:36'), ('38','zs','16','2','2016-06-24 10:43:36'), ('39','zs','16','3','2016-06-24 10:43:36'), ('40','zs','16','4','2016-06-24 10:43:36'), ('41','zs','16','5','2016-06-24 10:43:36'), ('42','zs','16','6','2016-06-24 10:43:36'), ('43','zs','16','7','2016-06-24 10:43:36'), ('44','zs','16','8','2016-06-24 10:43:36'), ('45','zs','16','9','2016-06-24 10:43:36'), ('46','zs','16','10','2016-06-24 10:43:36'), ('47','zs','16','11','2016-06-24 10:43:36'), ('48','zs','16','12','2016-06-24 10:43:36'), ('49','zs','16','13','2016-06-24 10:43:36'), ('50','zs','16','14','2016-06-24 10:43:36'), ('51','zs','16','15','2016-06-24 10:43:36'), ('52','zs','16','16','2016-06-24 10:43:36'), ('53','zs','16','17','2016-06-24 10:43:36'), ('54','zs','16','18','2016-06-24 10:43:36'), ('55','zs','16','19','2016-06-24 10:43:36'), ('56','zs','16','20','2016-06-24 10:43:36'), ('57','zs','16','21','2016-06-24 10:43:36'), ('58','zs','16','22','2016-06-24 10:43:36'), ('59','zs','16','23','2016-06-24 10:43:36'), ('60','zs','16','24','2016-06-24 10:43:36'), ('61','zs','16','25','2016-06-24 10:43:36'), ('62','zs','16','26','2016-06-24 10:43:36'), ('63','zs','16','27','2016-06-24 10:43:36'), ('64','zs','16','28','2016-06-24 10:43:36'), ('65','zs','16','29','2016-06-24 10:43:36'), ('66','zs','16','30','2016-06-24 10:43:36'), ('67','zs','16','31','2016-06-24 10:43:36'), ('68','zs','16','32','2016-06-24 10:43:36'), ('69','zs','16','33','2016-06-24 10:43:36'), ('70','zs','16','34','2016-06-24 10:43:36'), ('71','zs','16','35','2016-06-24 10:43:36'), ('72','zs','16','36','2016-06-24 10:43:36'), ('73','zs','16','37','2016-06-24 10:43:36'), ('74','zs','16','38','2016-06-24 10:43:36'), ('75','zs','16','39','2016-06-24 10:43:36'), ('76','zs','16','40','2016-06-24 10:43:36'), ('77','zs','16','41','2016-06-24 10:43:36'), ('78','zs','16','42','2016-06-24 10:43:36'), ('79','zs','16','43','2016-06-24 10:43:36'), ('80','zs','16','44','2016-06-24 10:43:36'), ('81','zs','16','45','2016-06-24 10:43:36'), ('82','zs','16','46','2016-06-24 10:43:36'), ('83','zs','16','47','2016-06-24 10:43:36'), ('84','zs','16','48','2016-06-24 10:43:36'), ('85','zs','16','49','2016-06-24 10:43:36'), ('86','zs','16','50','2016-06-24 10:43:36'), ('87','zs','16','51','2016-06-24 10:43:36'), ('88','zs','16','52','2016-06-24 10:43:36'), ('89','zs','16','53','2016-06-24 10:43:36'), ('90','zs','16','54','2016-06-24 10:43:36'), ('91','zs','16','55','2016-06-24 10:43:36'), ('92','zs','16','56','2016-06-24 10:43:36'), ('93','zs','16','57','2016-06-24 10:43:36'), ('94','zs','16','58','2016-06-24 10:43:36'), ('95','zs','16','59','2016-06-24 10:43:36'), ('96','zs','16','60','2016-06-24 10:43:36'), ('97','zs','16','61','2016-06-24 10:43:36'), ('98','zs','16','62','2016-06-24 10:43:36'), ('99','zs','16','63','2016-06-24 10:43:36'), ('100','zs','16','64','2016-06-24 10:43:36'), ('101','zs','16','65','2016-06-24 10:43:36'), ('102','zs','16','66','2016-06-24 10:43:36'), ('103','zs','16','67','2016-06-24 10:43:36'), ('104','zs','16','68','2016-06-24 10:43:36'), ('105','zs','16','69','2016-06-24 10:43:36'), ('106','zs','16','70','2016-06-24 10:43:36'), ('107','zs','16','71','2016-06-24 10:43:36'), ('108','zs','16','72','2016-06-24 10:43:36'), ('109','zs','16','73','2016-06-24 10:43:36'), ('110','zs','16','74','2016-06-24 10:43:36'), ('111','zs','16','75','2016-06-24 10:43:36'), ('112','zs','16','76','2016-06-24 10:43:36'), ('113','zs','16','77','2016-06-24 10:43:36'), ('114','zs','16','78','2016-06-24 10:43:36'), ('115','zs','16','79','2016-06-24 10:43:36'), ('116','zs','16','80','2016-06-24 10:43:36'), ('117','zs','16','81','2016-06-24 10:43:36'), ('118','zs','16','82','2016-06-24 10:43:36'), ('119','zs','16','83','2016-06-24 10:43:36'), ('120','zs','16','84','2016-06-24 10:43:36'), ('121','zs','16','85','2016-06-24 10:43:36'), ('122','zs','16','86','2016-06-24 10:43:36'), ('123','zs','16','87','2016-06-24 10:43:36'), ('124','zs','16','88','2016-06-24 10:43:36'), ('125','zs','16','89','2016-06-24 10:43:36'), ('126','zs','16','90','2016-06-24 10:43:36'), ('127','zs','16','91','2016-06-24 10:43:36'), ('128','zs','16','92','2016-06-24 10:43:36'), ('129','zs','16','93','2016-06-24 10:43:36'), ('130','zs','16','94','2016-06-24 10:43:36'), ('131','zs','16','95','2016-06-24 10:43:36');
INSERT INTO `jntxfb_sjoin` VALUES ('132','zs','16','96','2016-06-24 10:43:36'), ('133','zs','16','97','2016-06-24 10:43:36'), ('134','zs','16','98','2016-06-24 10:43:36'), ('135','zs','16','99','2016-06-24 10:43:36'), ('136','zs','16','100','2016-06-24 10:43:36'), ('137','zs','16','101','2016-06-24 10:43:36'), ('138','zs','16','102','2016-06-24 10:43:36'), ('139','zs','16','103','2016-06-24 10:43:36'), ('140','zs','16','104','2016-06-24 10:43:36'), ('141','zs','16','105','2016-06-24 10:43:36'), ('142','zs','16','106','2016-06-24 10:43:36'), ('143','zs','16','107','2016-06-24 10:43:36'), ('144','zs','16','108','2016-06-24 10:43:36'), ('145','zs','16','109','2016-06-24 10:43:36'), ('146','zs','16','110','2016-06-24 10:43:36'), ('147','zs','16','111','2016-06-24 10:43:36'), ('148','zs','16','112','2016-06-24 10:43:36'), ('149','zs','16','113','2016-06-24 10:43:36'), ('150','zs','16','114','2016-06-24 10:43:36'), ('151','zs','16','115','2016-06-24 10:43:36'), ('152','zs','16','116','2016-06-24 10:43:36'), ('153','zs','16','117','2016-06-24 10:43:36'), ('154','zs','16','118','2016-06-24 10:43:36'), ('155','zs','16','119','2016-06-24 10:43:36'), ('156','zs','16','120','2016-06-24 10:43:36'), ('157','zs','16','121','2016-06-24 10:43:36'), ('158','zs','16','122','2016-06-24 10:43:36'), ('159','zs','16','123','2016-06-24 10:43:36'), ('160','zs','16','124','2016-06-24 10:43:36'), ('161','zs','16','125','2016-06-24 10:43:36'), ('162','zs','16','126','2016-06-24 10:43:36'), ('163','zs','16','127','2016-06-24 10:43:36'), ('164','zs','16','128','2016-06-24 10:43:36'), ('165','zs','17','2','2016-06-24 10:44:05'), ('166','zs','17','4','2016-06-24 10:44:05'), ('167','zs','17','5','2016-06-24 10:44:05'), ('168','zs','17','6','2016-06-24 10:44:05'), ('169','zs','17','7','2016-06-24 10:44:05'), ('170','zs','17','8','2016-06-24 10:44:05'), ('171','zs','17','9','2016-06-24 10:44:05'), ('172','zs','17','10','2016-06-24 10:44:05'), ('173','zs','17','11','2016-06-24 10:44:05'), ('174','zs','17','12','2016-06-24 10:44:05'), ('175','zs','17','13','2016-06-24 10:44:05'), ('176','zs','17','14','2016-06-24 10:44:05'), ('177','zs','17','15','2016-06-24 10:44:05'), ('178','zs','17','16','2016-06-24 10:44:05'), ('179','zs','17','17','2016-06-24 10:44:05'), ('180','zs','17','18','2016-06-24 10:44:05'), ('181','zs','17','19','2016-06-24 10:44:05'), ('182','zs','17','20','2016-06-24 10:44:05'), ('183','zs','30','30','2016-06-24 10:44:33'), ('184','zs','30','31','2016-06-24 10:44:33'), ('185','zs','30','32','2016-06-24 10:44:33'), ('186','zs','30','33','2016-06-24 10:44:33'), ('187','zs','30','34','2016-06-24 10:44:33'), ('188','zs','30','35','2016-06-24 10:44:33'), ('189','zs','30','36','2016-06-24 10:44:33'), ('190','zs','30','37','2016-06-24 10:44:33'), ('191','zs','30','38','2016-06-24 10:44:33'), ('192','zs','30','128','2016-06-24 10:44:33'), ('193','zs','18','26','2016-06-24 10:44:53'), ('194','zs','18','27','2016-06-24 10:44:53'), ('195','zs','18','28','2016-06-24 10:44:53'), ('196','zs','18','29','2016-06-24 10:44:53'), ('219','zs','31','1','2016-06-24 10:46:18'), ('220','zs','31','2','2016-06-24 10:46:18'), ('221','zs','31','3','2016-06-24 10:46:18'), ('222','zs','31','4','2016-06-24 10:46:18'), ('223','zs','31','5','2016-06-24 10:46:18'), ('224','zs','31','6','2016-06-24 10:46:18'), ('225','zs','31','7','2016-06-24 10:46:18'), ('226','zs','31','8','2016-06-24 10:46:18'), ('227','zs','31','9','2016-06-24 10:46:18'), ('228','zs','31','10','2016-06-24 10:46:18'), ('229','zs','31','11','2016-06-24 10:46:18'), ('230','zs','31','12','2016-06-24 10:46:18'), ('231','zs','31','13','2016-06-24 10:46:18'), ('232','zs','31','14','2016-06-24 10:46:18'), ('233','zs','31','15','2016-06-24 10:46:18'), ('234','zs','31','16','2016-06-24 10:46:18'), ('235','zs','31','17','2016-06-24 10:46:18'), ('236','zs','31','18','2016-06-24 10:46:18'), ('237','zs','31','19','2016-06-24 10:46:18'), ('238','zs','31','20','2016-06-24 10:46:18'), ('239','zs','31','21','2016-06-24 10:46:18'), ('240','zs','31','22','2016-06-24 10:46:18'), ('241','zs','31','23','2016-06-24 10:46:18'), ('242','zs','31','24','2016-06-24 10:46:18'), ('243','zs','31','25','2016-06-24 10:46:18'), ('244','zs','31','26','2016-06-24 10:46:18'), ('245','zs','31','27','2016-06-24 10:46:18'), ('246','zs','31','28','2016-06-24 10:46:18'), ('247','zs','31','29','2016-06-24 10:46:18'), ('248','zs','31','30','2016-06-24 10:46:18'), ('249','zs','31','31','2016-06-24 10:46:18'), ('250','zs','31','32','2016-06-24 10:46:18'), ('251','zs','31','33','2016-06-24 10:46:18'), ('252','zs','31','34','2016-06-24 10:46:18'), ('253','zs','31','35','2016-06-24 10:46:18');
INSERT INTO `jntxfb_sjoin` VALUES ('254','zs','31','36','2016-06-24 10:46:18'), ('255','zs','31','37','2016-06-24 10:46:18'), ('256','zs','31','38','2016-06-24 10:46:18'), ('257','zs','31','39','2016-06-24 10:46:18'), ('258','zs','31','40','2016-06-24 10:46:18'), ('259','zs','31','41','2016-06-24 10:46:18'), ('260','zs','31','42','2016-06-24 10:46:18'), ('261','zs','31','43','2016-06-24 10:46:18'), ('262','zs','31','44','2016-06-24 10:46:18'), ('263','zs','31','45','2016-06-24 10:46:18'), ('264','zs','31','46','2016-06-24 10:46:18'), ('265','zs','31','47','2016-06-24 10:46:18'), ('266','zs','31','48','2016-06-24 10:46:18'), ('267','zs','31','49','2016-06-24 10:46:18'), ('268','zs','31','50','2016-06-24 10:46:18'), ('269','zs','31','51','2016-06-24 10:46:18'), ('270','zs','31','52','2016-06-24 10:46:18'), ('271','zs','31','53','2016-06-24 10:46:18'), ('272','zs','31','54','2016-06-24 10:46:18'), ('273','zs','31','55','2016-06-24 10:46:18'), ('274','zs','31','56','2016-06-24 10:46:18'), ('275','zs','31','57','2016-06-24 10:46:18'), ('276','zs','31','58','2016-06-24 10:46:18'), ('277','zs','31','59','2016-06-24 10:46:18'), ('278','zs','31','60','2016-06-24 10:46:18'), ('279','zs','31','61','2016-06-24 10:46:18'), ('280','zs','31','62','2016-06-24 10:46:18'), ('281','zs','31','63','2016-06-24 10:46:18'), ('282','zs','31','64','2016-06-24 10:46:18'), ('283','zs','31','65','2016-06-24 10:46:18'), ('284','zs','31','66','2016-06-24 10:46:18'), ('285','zs','31','67','2016-06-24 10:46:18'), ('286','zs','31','68','2016-06-24 10:46:18'), ('287','zs','31','69','2016-06-24 10:46:18'), ('288','zs','31','70','2016-06-24 10:46:18'), ('289','zs','31','71','2016-06-24 10:46:18'), ('290','zs','31','72','2016-06-24 10:46:18'), ('291','zs','31','73','2016-06-24 10:46:18'), ('292','zs','31','74','2016-06-24 10:46:18'), ('293','zs','31','75','2016-06-24 10:46:18'), ('294','zs','31','76','2016-06-24 10:46:18'), ('295','zs','31','77','2016-06-24 10:46:18'), ('296','zs','31','78','2016-06-24 10:46:18'), ('297','zs','31','79','2016-06-24 10:46:18'), ('298','zs','31','80','2016-06-24 10:46:18'), ('299','zs','31','81','2016-06-24 10:46:18'), ('300','zs','31','82','2016-06-24 10:46:18'), ('301','zs','31','83','2016-06-24 10:46:18'), ('302','zs','31','84','2016-06-24 10:46:18'), ('303','zs','31','85','2016-06-24 10:46:18'), ('304','zs','31','86','2016-06-24 10:46:18'), ('305','zs','31','87','2016-06-24 10:46:18'), ('306','zs','31','88','2016-06-24 10:46:18'), ('307','zs','31','89','2016-06-24 10:46:18'), ('308','zs','31','90','2016-06-24 10:46:18'), ('309','zs','31','91','2016-06-24 10:46:18'), ('310','zs','31','92','2016-06-24 10:46:18'), ('311','zs','31','93','2016-06-24 10:46:18'), ('312','zs','31','94','2016-06-24 10:46:18'), ('313','zs','31','95','2016-06-24 10:46:18'), ('314','zs','31','96','2016-06-24 10:46:18'), ('315','zs','31','97','2016-06-24 10:46:18'), ('316','zs','31','98','2016-06-24 10:46:18'), ('317','zs','31','99','2016-06-24 10:46:18'), ('318','zs','31','100','2016-06-24 10:46:18'), ('319','zs','31','101','2016-06-24 10:46:18'), ('320','zs','31','102','2016-06-24 10:46:18'), ('321','zs','31','103','2016-06-24 10:46:18'), ('322','zs','31','104','2016-06-24 10:46:18'), ('323','zs','31','105','2016-06-24 10:46:18'), ('324','zs','31','106','2016-06-24 10:46:18'), ('325','zs','31','107','2016-06-24 10:46:18'), ('326','zs','31','108','2016-06-24 10:46:18'), ('327','zs','31','109','2016-06-24 10:46:18'), ('328','zs','31','110','2016-06-24 10:46:18'), ('329','zs','31','111','2016-06-24 10:46:18'), ('330','zs','31','112','2016-06-24 10:46:18'), ('331','zs','31','113','2016-06-24 10:46:18'), ('332','zs','31','114','2016-06-24 10:46:18'), ('333','zs','31','115','2016-06-24 10:46:18'), ('334','zs','31','116','2016-06-24 10:46:18'), ('335','zs','31','117','2016-06-24 10:46:18'), ('336','zs','31','118','2016-06-24 10:46:18'), ('337','zs','31','119','2016-06-24 10:46:18'), ('338','zs','31','120','2016-06-24 10:46:18'), ('339','zs','31','121','2016-06-24 10:46:18'), ('340','zs','31','122','2016-06-24 10:46:18'), ('341','zs','31','123','2016-06-24 10:46:18'), ('342','zs','31','124','2016-06-24 10:46:18'), ('343','zs','31','125','2016-06-24 10:46:18'), ('344','zs','31','126','2016-06-24 10:46:18'), ('345','zs','31','127','2016-06-24 10:46:18'), ('346','zs','31','128','2016-06-24 10:46:18'), ('370','ug','2','1','2016-06-24 11:27:52'), ('371','ug','2','7','2016-06-24 11:27:52'), ('372','ug','7','5','2016-06-24 11:28:09'), ('373','ug','4','6','2016-06-24 11:28:21'), ('374','ug','3','8','2016-06-24 11:28:39'), ('375','ug','5','8','2016-06-24 11:29:18'), ('376','ug','8','8','2016-06-24 11:29:31');
INSERT INTO `jntxfb_sjoin` VALUES ('422','ug','9','7','2016-07-27 15:32:21'), ('378','ug','10','9','2016-06-24 11:30:04'), ('379','zs','33','1','2016-06-26 14:45:12'), ('380','zs','33','2','2016-06-26 14:45:12'), ('381','zs','33','3','2016-06-26 14:45:12'), ('382','zs','33','4','2016-06-26 14:45:12'), ('383','zs','33','5','2016-06-26 14:45:12'), ('384','zs','33','6','2016-06-26 14:45:12'), ('385','zs','33','7','2016-06-26 14:45:12'), ('386','zs','33','8','2016-06-26 14:45:12'), ('387','zs','33','9','2016-06-26 14:45:12'), ('388','zs','33','10','2016-06-26 14:45:12'), ('389','zs','33','11','2016-06-26 14:45:12'), ('390','zs','33','12','2016-06-26 14:45:12'), ('391','zs','33','13','2016-06-26 14:45:12'), ('392','zs','33','14','2016-06-26 14:45:12'), ('393','zs','33','15','2016-06-26 14:45:12'), ('394','zs','33','16','2016-06-26 14:45:12'), ('395','zs','33','17','2016-06-26 14:45:12'), ('396','zs','33','18','2016-06-26 14:45:12'), ('397','zs','33','19','2016-06-26 14:45:12'), ('398','zs','33','20','2016-06-26 14:45:12'), ('399','zs','32','20','2016-06-26 14:45:30'), ('400','zs','32','21','2016-06-26 14:45:30'), ('401','zs','32','22','2016-06-26 14:45:30'), ('402','zs','32','23','2016-06-26 14:45:30'), ('403','zs','32','24','2016-06-26 14:45:30'), ('404','zs','32','25','2016-06-26 14:45:30'), ('405','zs','32','26','2016-06-26 14:45:30'), ('406','zs','32','27','2016-06-26 14:45:30'), ('407','zs','32','28','2016-06-26 14:45:30'), ('408','zs','32','29','2016-06-26 14:45:30'), ('409','zs','32','30','2016-06-26 14:45:30'), ('410','zs','32','31','2016-06-26 14:45:30'), ('411','zs','32','32','2016-06-26 14:45:30'), ('412','zs','32','33','2016-06-26 14:45:30'), ('413','zs','32','34','2016-06-26 14:45:30'), ('414','zs','32','67','2016-06-26 14:45:30'), ('415','zs','32','68','2016-06-26 14:45:30'), ('416','zs','32','69','2016-06-26 14:45:30'), ('417','zs','32','70','2016-06-26 14:45:30'), ('418','zs','32','72','2016-06-26 14:45:30'), ('419','ug','6','6','2016-06-26 15:24:45'), ('420','ug','1','1','2016-07-18 15:22:04'), ('421','ug','1','7','2016-07-18 15:22:04');
INSERT INTO `jntxfb_sjoinv` VALUES ('2','1','管理员','jiaban,leave','加班单,请假条','1','d4','开发部','2015-07-23 13:58:51'), ('3','1','管理员','daily','工作日报','1','d3','行政人事','2015-07-23 15:04:02');
INSERT INTO `jntxfb_subject` VALUES ('1','6401','主营业务成本','0'), ('2','6401-1','旅客运输成本','1'), ('3','6401-4','基础设施成本','1'), ('4','6401-4-3311','通信设备运用维修','3'), ('5','6401-4-3311-1','通信设备运用维修-国铁','4'), ('6','6401-4-3311-1-1','维保费-国铁','5'), ('7','6401-4-3311-1-2','材料费-国铁','5'), ('8','6401-4-3311-1-3','其它维修费-国铁','5'), ('9','6401-4-3311-2','通信设备运用维修-合资','4'), ('10','6401-4-3311-2-1','通信设备运用维修-京沪高铁','9'), ('11','6401-4-3311-2-1-1','维保费-京沪高铁','10'), ('12','6401-4-3311-2-1-2','材料费-京沪高铁','10'), ('13','6401-4-3311-2-1-3','其它维修费-京沪高铁','10'), ('14','6401-4-3312','无线通信设备维修','3'), ('15','6401-4-3312-1','无线通信设备维修-国铁','14'), ('16','6401-4-3312-1-1','维保费-国铁','15'), ('17','6401-4-3312-1-2','无线通信费及管理费-国铁','15'), ('18','6401-4-3312-1-3','机车综合无线设备费用-国铁','15'), ('19','6401-4-3312-1-4','其它维修费-国铁','15'), ('20','6401-4-3312-2','无线通信设备维修-合资','14'), ('21','6401-4-3312-2-1','无线通信设备维修-京沪高铁','20'), ('22','6401-4-3312-2-1-1','维保费-京沪高铁','21'), ('23','6401-4-3312-2-1-2','无线通信费及管理费-京沪高铁','21'), ('24','6401-4-3312-2-1-3','机车综合无线设备费用-京沪高铁','21'), ('25','6401-4-3312-2-1-4','其它维修费-京沪高铁','21'), ('26','6401-4-3313-1','GSM-R系统运用维修-国铁','3'), ('27','6401-4-3313-1-1','维保费-国铁','26'), ('28','6401-4-3313-1-2','材料费-国铁','26'), ('29','6401-4-3313-1-3','其它维修费-国铁','26'), ('30','6401-4-3314','通信线路运用维修','3'), ('31','6401-4-3314-1','通信线路运用维修-国铁','30'), ('32','6401-4-3314-1-1','维保费-国铁','31'), ('33','6401-4-3314-1-2','材料费-国铁','31'), ('34','6401-4-3314-1-3','其它维修费-国铁','31'), ('35','6401-4-3316','通信设备用电','3'), ('36','6401-4-3316-1','通信设备用电-国铁','35'), ('37','6401-4-3603-4-5','集体福利设施费支出','128'), ('38','6401-4-3603-4-5-1','集体福利设施费支出-国铁','37'), ('39','6401-4-3603-4-8-1-2-2','幼托费-国铁','128'), ('40','6401-4-3603-4-8-1-3','职工文体活动费用-国铁','128'), ('41','6401-4-3603-4-8-1-8','其他-国铁','128'), ('42','6401-4-3603-4-8-1-8-1','职工月票、上下班交通费-国铁','41'), ('43','6401-4-3603-4-8-1-8-2','三八活动费-国铁','41'), ('44','6401-4-3604','生产用水','3'), ('45','6401-4-3604-1','生产用水-国铁','44'), ('46','6401-4-3604-1-1','路内单位供水-国铁','45'), ('47','6401-4-3604-1-2','路外单位供水-国铁','45'), ('48','6401-4-3605','生产用电','3'), ('49','6401-4-3605-1','生产用电-国铁','48'), ('50','6401-4-3605-1-1','路内单位供电-国铁','49'), ('51','6401-4-3605-1-2','路外单位供电-国铁','49'), ('52','6401-4-3607','生产用工具备品','3'), ('53','6401-4-3607-1','生产用工具备品-国铁','52'), ('54','6401-4-3607-1-1','生产用工具-国铁','53'), ('55','6401-4-3607-1-2','仪器、仪表-国铁','53'), ('56','6401-4-3607-1-3','备品-国铁','53'), ('57','6401-4-3607-1-4','其他-国铁','53'), ('58','6401-4-3609','短途运输','3'), ('59','6401-4-3609-1','汽车','58'), ('60','6401-4-3609-1-1','短途运输-汽车-国铁','59'), ('61','6401-4-3609-1-1-2','短途运输-汽车-生产用车','60'), ('62','6401-4-3609-1-1-2-1','燃油费-国铁','61'), ('63','6401-4-3609-1-1-2-2','保险费-国铁','61'), ('64','6401-4-3609-1-1-2-3','过路过桥费-国铁','61'), ('65','6401-4-3609-1-1-2-4','维修费-国铁','61'), ('66','6401-4-3609-1-1-2-5','其他-国铁','61'), ('67','6401-4-3610','办公费','3'), ('68','6401-4-3610-1','办公费-国铁','67'), ('69','6401-4-3610-1-1','报刊杂志费-国铁','68'), ('70','6401-4-3610-1-2','办公文具-国铁','68'), ('71','6401-4-3610-1-3','家具备品-国铁','68'), ('72','6401-4-3610-1-4','印刷费-国铁','68'), ('73','6401-4-3610-1-5','会议费用-国铁','68'), ('74','6401-4-3610-1-6','其他-国铁','68'), ('75','6401-4-3611','差旅费','3'), ('76','6401-4-3611-1','差旅费-国铁','75'), ('77','6401-4-3611-1-1','差旅费-局内-国铁','76'), ('78','6401-4-3611-1-1-1','住宿费-局内-国铁','77'), ('79','6401-4-3611-1-1-2','出差伙食补助-局内-国铁','77'), ('80','6401-4-3611-1-1-3','交通费补助-局内-国铁','77'), ('81','6401-4-3611-1-1-4','其他-局内-国铁','77'), ('82','6401-4-3611-1-2','差旅费-局外-国铁','76'), ('83','6401-4-3611-1-2-1','住宿费-局外-国铁','82'), ('84','6401-4-3611-1-2-2','出差伙食补助-局外-国铁','82'), ('85','6401-4-3611-1-2-3','交通费补助-局外-国铁','82'), ('86','6401-4-3611-1-2-4','其他-局外-国铁','82'), ('87','6401-4-3612','劳动保护','3'), ('88','6401-4-3612-1','劳动保护-国铁','87'), ('89','6401-4-3612-1-1','防护用品支出-国铁','88'), ('90','6401-4-3612-1-2','防暑（寒）用品支出-国铁','88'), ('91','6401-4-3612-1-3','有害作业-国铁','88'), ('92','6401-4-3612-1-4','其他-国铁','88'), ('93','6401-4-3615','电子计算机运用维修','3'), ('94','6401-4-3615-1','电子计算机运用维修-国铁','93'), ('95','6401-4-3615-1-1','材料费-国铁','94'), ('96','6401-4-3615-1-2','维修费-国铁','94'), ('97','6401-4-3615-1-3','维保费-国铁','94'), ('98','6401-4-3615-1-4','其他-国铁','94'), ('99','6401-4-3618','通信费','3'), ('100','6401-4-3618-4','其他通信费用','99');
INSERT INTO `jntxfb_subject` VALUES ('101','6401-4-3618-4-1','其他通信费用-国铁','100'), ('102','6401-4-3626','生产用杂费','3'), ('103','6401-4-3626-1','生产用杂费-国铁','102'), ('104','6401-4-3626-1-1','生产用房屋清扫、照明、消毒-国铁','103'), ('105','6401-4-3626-1-2','消防器材-国铁','103'), ('106','6401-4-3626-1-3','生产用文具、纸张、表格、规章-国铁','103'), ('107','6401-4-3626-1-4','运杂费、垃圾清运费-国铁','103'), ('108','6401-4-3626-1-5','临时建筑物-国铁','103'), ('109','6401-4-3626-1-6','交通事故费-国铁','103'), ('110','6401-4-3626-1-7','单身宿舍费用-国铁','103'), ('111','6401-4-3626-1-8','其他-国铁','103'), ('112','6401-4-3632','房屋供暖设备运用维修','3'), ('113','6401-4-3632-1','房屋供暖设备运用维修-国铁','112'), ('114','6401-4-3632-1-1','水费-国铁','113'), ('115','6401-4-3632-1-2','电费-国铁','113'), ('116','6401-4-3632-1-3','燃料-国铁','113'), ('117','6401-4-3632-1-4','锅炉、水泵等设备维修-国铁','113'), ('118','6401-4-3632-1-5','管路传导设备维修、防寒材料-国铁','113'), ('119','6401-4-3632-1-6','支付地方供暖费-国铁','113'), ('120','6401-4-3632-1-7','支付其他单位供暖费-国铁','113'), ('121','6602','管理费用','0'), ('122','6602-1','运输企业管理费用','121'), ('123','6602-1-3722','业务招待费','122'), ('124','6602-1-3722-1','国内业务招待费','123'), ('125','6602-1-3722-1-1','国内业务招待费-国铁','124'), ('126','6602-1-3759-2-1-3','其他管理费用-其他-国铁-党团费','125'), ('127','6602-1-3759-2-1-4','其他管理费用-其他-国铁-安保费用','125'), ('128','6401-4-3603-4','其他福利费','3');
INSERT INTO `jntxfb_supple` VALUES ('1','278','笔记本','1.00','2015-11-30 21:22:13','0',NULL,'bjb',NULL), ('2','278','铅笔','0.00','2015-10-30 16:50:23','0',NULL,'qianbi',NULL), ('3','278','圆珠笔','0.00','2015-10-30 16:55:08','4',NULL,'yzb',NULL), ('4','278','厕纸','0.00','2015-10-30 16:55:00','5',NULL,'cezhi',NULL), ('5','278','鼠标','1.00','2015-10-30 17:07:26','6','个','shub1',NULL), ('6','278','键盘','2.00','2015-10-30 17:07:26','7','个','jianp',NULL);
INSERT INTO `jntxfb_supplea` VALUES ('1','1',NULL,'1','0','1','3',NULL,'2015-07-23 16:26:03','管理员',NULL,'0',NULL,NULL,'0',NULL,NULL,NULL), ('2','2',NULL,'3','0','1','3',NULL,'2015-07-23 16:26:03','管理员',NULL,'0',NULL,NULL,'0',NULL,NULL,NULL), ('4','1','笔记本','4','1',NULL,'1','heheheh','2015-07-23 17:03:32','小乔',NULL,'1',NULL,'5','1',NULL,NULL,NULL), ('5','2','铅笔','1','1',NULL,'1','12','2015-07-23 17:39:37','小乔',NULL,'1',NULL,'5','1',NULL,NULL,NULL), ('6','1',NULL,'3','0','1','4',NULL,'2015-07-24 17:50:07','管理员',NULL,'0',NULL,NULL,'0',NULL,NULL,NULL), ('7','1','笔记本','1','1',NULL,'1','23','2015-08-19 12:14:03','小乔',NULL,'1',NULL,'5','1',NULL,NULL,NULL), ('8','2','铅笔','1','1','1','1','23','2015-08-21 21:03:10','小乔',NULL,'1',NULL,'5','1',NULL,'管理员','2015-08-21'), ('9','2','铅笔','1','5','5','0',NULL,'2016-03-02 14:42:50',NULL,NULL,'1','5','5','0','小乔','小乔','2016-03-02'), ('10','2','铅笔','12','1','1','0','哈哈哈哈哈','2016-04-25 21:39:59',NULL,NULL,'1','5','5','0','小乔','管理员','2016-04-25');
INSERT INTO `jntxfb_task` VALUES ('1','每5分钟运行一次','基础任务','minute5,runtask','1','2016-04-28 21:22:49','管理员','1',NULL,'0','每5分钟的00秒 每天从08:30开始至18:30结束\n',NULL,'0','0','0','0'), ('2','备份数据库','系统任务','system,bfmysql','1','2016-04-28 22:27:03','管理员','1',NULL,'0','每天的00时10分00秒\n','2016-04-28 22:29:09','1','0','0','0'), ('8','工作流匹配','基础任务','flow,repipei','1','2016-04-08 10:56:48','管理员','1',NULL,'0','每天的00时15分00秒\n每天的12时15分00秒\n',NULL,'0','0','0','0'), ('9','读取固定会议','基础任务','meet,fixed','1','2016-04-08 10:56:04','管理员','1',NULL,'0','每小时的45分00秒 每天从07:00开始至19:00结束\n',NULL,'0','0','0','0'), ('12','日报分析','基础任务','kaoqin,dailyfx','1','2016-04-08 10:57:07','管理员','1',NULL,'0','每天的00时30分00秒\n',NULL,'0','0','0','0'), ('13','每日考勤分析','基础任务','kaoqin,fenxi','1','2016-04-08 10:58:06','管理员','1','考勤分析前3天的','0','每天的00时45分00秒\n每天的19时15分00秒\n',NULL,'0','0','0','0'), ('14','人力资源更新','基础任务','hr,update','1','2016-04-08 10:58:22','管理员','1','转正,离职,变动','0','每天的00时45分00秒\n',NULL,'0','0','0','0'), ('16','微信待办审批推送','微信任务','weixin,daiban','0','2016-04-08 22:58:36','管理员','1',NULL,'0','每工作日的18时00分00秒\n每工作日的08时00分00秒\n',NULL,'0','0','0','0'), ('17','微信REIM未读信息','微信任务','weixin,reimtodo','0','2016-04-08 22:57:58','管理员','1',NULL,'0','每工作日的08时15分00秒\n每工作日的18时15分00秒\n',NULL,'0','0','0','0');
INSERT INTO `jntxfb_tasktime` VALUES ('58','8','task','天','00时15分00秒',NULL,NULL,'2016-04-08 10:56:22','1',NULL,NULL), ('60','9','task','小时','45分00秒',NULL,NULL,'2016-04-08 10:56:01','1','07:00','19:00'), ('79','8','task','天','12时15分00秒',NULL,NULL,'2016-04-08 10:56:45','1',NULL,NULL), ('84','12','task','天','00时30分00秒',NULL,NULL,'2016-04-08 10:57:05','1',NULL,NULL), ('87','13','task','天','00时45分00秒',NULL,NULL,'2016-04-08 10:57:27','1',NULL,NULL), ('97','14','task','天','00时45分00秒',NULL,NULL,'2016-04-08 10:58:20','1',NULL,NULL), ('99','13','task','天','19时15分00秒',NULL,NULL,'2016-04-08 10:58:04','1',NULL,NULL), ('105','16','task','工作日','08时00分00秒',NULL,NULL,'2016-04-08 22:58:32','2',NULL,NULL), ('106','16','task','工作日','18时00分00秒',NULL,NULL,'2016-04-07 20:26:51','1',NULL,NULL), ('107','17','task','工作日','08时15分00秒',NULL,NULL,'2016-04-08 10:58:58','1',NULL,NULL), ('108','17','task','工作日','18时15分00秒',NULL,NULL,'2016-04-08 10:59:09','1',NULL,NULL), ('110','1','task','分钟','00秒',NULL,NULL,'2016-04-28 21:22:46','5','08:30','18:30'), ('111','2','task','天','00时10分00秒',NULL,NULL,'2016-04-28 22:27:01','1',NULL,NULL);
INSERT INTO `jntxfb_taskuser` VALUES ('1','管理员通知组','1','管理员',NULL,NULL,'0','2015-10-21 10:20:23');
INSERT INTO `jntxfb_todo` VALUES ('1','1','加班单','您提交的[加班单,单号:KJ-20160423-0001]已全部处理完成','1','2016-04-27 21:47:24','kq_info','57',NULL), ('2','7','车辆预定','您有[管理员]的[车辆预定,单号:YB-20160428-0001]需要处理','0','2016-04-28 20:29:14','careserve','4',NULL), ('12','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160505-0001]需要处理','0','2016-05-05 21:04:13','fininfom','2',NULL), ('79','1','费用报销','您有[赵子龙]的[费用报销,单号:PA-20160727-0001]需要处理','0','2016-07-27 14:58:46','fininfom','35',NULL), ('17','7','借款单','您有[管理员]的[借款单,单号:PC-20160508-0001]需要处理','0','2016-05-08 16:10:08','fininfom','4',NULL), ('18','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160604-0001]需要处理','0','2016-06-04 10:44:02','fininfom','5',NULL), ('19','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160622-0001]需要处理','0','2016-06-22 08:44:38','fininfom','7',NULL), ('20','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160622-0002]需要处理','0','2016-06-22 09:49:10','fininfom','8',NULL), ('21','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160623-0002]需要处理','1','2016-06-23 16:51:40','fininfom','17',NULL), ('22','7','费用报销','您有[管理员]的[费用报销,单号:PA-20160623-0003]需要处理','1','2016-06-23 16:56:31','fininfom','18',NULL), ('23','1','费用报销','您有[管理员]的[费用报销,单号:PA-20160625-0001]需要处理','1','2016-06-25 22:00:27','fininfom','20',NULL), ('27','3','费用报销','您有[管理员]的[费用报销,单号:PA-20160626-0002]需要处理','0','2016-06-26 15:39:29','fininfom','22',NULL), ('28','1','费用报销','您提交[费用报销,单号:PA-20160626-0001]小乔处理[不通过]，原因:[就是不通过]','1','2016-06-26 15:40:42','fininfom','21',NULL), ('31','5','费用报销','您有[管理员]的[费用报销,单号:PA-20160626-0001]需要处理','0','2016-06-26 17:51:37','fininfom','21',NULL), ('80','2','费用报销','您有[管理员]的[费用报销,单号:PA-20160622-0002]需要处理','0','2016-07-27 15:00:33','fininfom','8',NULL), ('35','3','费用报销','您有[管理员]的[费用报销,单号:PA-20160622-0001]需要处理','0','2016-06-26 19:39:37','fininfom','7',NULL), ('44','1','费用报销','您提交的[费用报销,单号:PA-20160620-0001]已全部处理完成','1','2016-07-01 15:55:44','fininfom','6',NULL), ('45','5','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0002]需要处理','0','2016-07-02 21:31:19','fininfom','24',NULL), ('55','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0005]需要处理','0','2016-07-02 22:06:05','fininfom','27',NULL), ('56','10','费用报销','您提交[费用报销,单号:PA-20160702-0006]小乔处理[不通过]，原因:[就是不通过1111]','0','2016-07-02 22:07:58','fininfom','28',NULL), ('58','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0007]需要处理','0','2016-07-02 22:09:41','fininfom','29',NULL), ('60','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0010]需要处理','0','2016-07-03 13:13:43','fininfom','32',NULL), ('62','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0008]需要处理','0','2016-07-03 13:14:02','fininfom','30',NULL), ('63','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0004]需要处理','0','2016-07-03 13:14:15','fininfom','26',NULL), ('65','3','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0003]需要处理','0','2016-07-03 13:14:29','fininfom','25',NULL), ('66','2','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0010]需要处理','0','2016-07-03 13:16:28','fininfom','32',NULL), ('67','2','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0009]需要处理','0','2016-07-03 13:16:52','fininfom','31',NULL), ('68','2','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0007]需要处理','0','2016-07-03 13:17:01','fininfom','29',NULL), ('69','2','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0003]需要处理,说明:test','0','2016-07-21 10:29:26','fininfom','25',NULL), ('70','1','文件传送','您提交的[文件传送,单号:FI-20160315-0001]已全部处理完成','0','2016-07-21 10:30:13','docdeil','19',NULL), ('73','2','费用报销','您有[吕布]的[费用报销,单号:PA-20160702-0005]需要处理','0','2016-07-27 13:32:01','fininfom','27',NULL), ('72','5','文件传送','您有[管理员]的[文件传送,单号:FI-20160404-0001]需要处理','0','2016-07-27 13:31:41','docdeil','20',NULL), ('75','6','文件传送','您有[管理员]的[文件传送,单号:FI-20160727-0001]需要处理','0','2016-07-27 13:42:20','docdeil','21',NULL);
INSERT INTO `jntxfb_userjl` VALUES ('2','谷歌','程序员','2015-02-02','2015-05-17','1','0','work',NULL,NULL,NULL,NULL,NULL,NULL), ('3','ROCKOA技术','项目经理','2015-05-17','2015-08-08','1','0','work',NULL,NULL,NULL,NULL,NULL,NULL), ('5','清华大学','哈哈','2015-05-17','2015-05-28','1','0','edu',NULL,NULL,NULL,NULL,NULL,NULL), ('6','微软','开发工程师','2012-01-24','2015-05-17','1','0','work',NULL,NULL,NULL,NULL,NULL,NULL), ('7','三国培训','贵妃','2015-05-17','2015-05-20','3','0','work',NULL,NULL,NULL,NULL,NULL,NULL), ('8',NULL,NULL,'2015-01-01',NULL,'7','0','ract','2015-09-17 10:53:24',NULL,'固定期限劳动合同','有效',NULL,'厦门新浩技术有限公司'), ('10',NULL,NULL,'2015-01-01','2015-12-31','1','0','ract','2015-09-17 10:56:19',NULL,'固定期限劳动合同','有效',NULL,'厦门新浩技术有限公司');
INSERT INTO `jntxfb_vcard` VALUES ('1','吕布','10086','2015-05-17 10:41:41','1',NULL,NULL,'盟友','管理员',NULL,'0');
INSERT INTO `jntxfb_where` VALUES ('1','flowcourse_1',NULL,'qjkind','请假类型','=','年假','年假','1','2015-01-09 17:46:42','1',NULL), ('2','flowcourse_1','AND','stime','开始时间','>=','2015-01-07',NULL,'1','2015-01-09 17:46:42','2',NULL), ('4','flowcourse_1','(',NULL,NULL,NULL,NULL,NULL,'1','2015-01-09 17:46:42','0',NULL), ('5','flowcourse_1',')',NULL,NULL,NULL,NULL,NULL,'1','2015-01-09 17:46:42','7',NULL), ('6','flowcourse_1','AND','explain','说明','LEFT',' 12',NULL,'1','2015-01-09 17:46:42','3',NULL), ('7','flowcourse_1','AND','optdt','操作时间','NO NULL',NULL,NULL,'1','2015-01-09 17:46:42','4',NULL), ('8','flowcourse_1','AND','totals','时间(小时)','>=','1',NULL,'1','2015-01-09 17:46:42','5',NULL), ('9','flowcourse_1','AND','isturn','是否提交','=','提交','1','1','2015-01-09 17:46:42','6',NULL), ('11','flowcourse_2',NULL,'totals','时间(小时)','<=','8',NULL,'1','2015-01-10 17:28:57','0',NULL), ('12','flowcourse_3',NULL,'totals','时间(小时)','>','8',NULL,'1','2015-01-10 17:37:18','0',NULL), ('13','flowcourse_3','AND','totals','时间(小时)','<=','24',NULL,'1','2015-01-10 17:37:18','1',NULL), ('14','flowcourse_4',NULL,'totals','时间(小时)','>','24',NULL,'1','2015-01-10 17:37:46','0',NULL), ('15','flowset_leave',NULL,'kind','类型','=','请假','请假','1','2015-01-10 18:55:11','0',NULL), ('16','flowset_jiaban',NULL,'kind','类型','=','加班','加班','1','2015-01-10 19:54:30','0',NULL), ('17','flowcourse_21',NULL,'totals','时间(小时)','>','24',NULL,'1','2015-01-13 16:45:26','0',NULL), ('20','flowcourse_20',NULL,'totals','时间(小时)','>','8',NULL,'1','2015-01-13 17:20:43','0',NULL), ('21','flowset_finfybx',NULL,'type','单据类型','=','报销单','0','1','2015-08-20 17:35:33','0',NULL), ('22','flowset_finccbx',NULL,'type','单据类型','=','出差报销','1','1','2015-08-25 11:02:51','0',NULL), ('23','flowset_finjkd',NULL,'type','单据类型','=','借款单','2','1','2015-08-25 11:04:24','0',NULL), ('24','flowcourse_46',NULL,'money','金额','>','5000',NULL,'1','2015-10-27 10:25:52','0',NULL), ('25','flowcourse_37',NULL,'money','金额','<=','5000',NULL,'1','2015-10-27 10:26:23','0',NULL), ('26','flowset_meet',NULL,'type','类型','=','普通','0','1','2015-11-21 19:41:01','0',NULL), ('27','flowset_finfybx_test',NULL,'type','单据类型','=','报销单','0','1','2016-06-20 16:38:11','0',NULL);
INSERT INTO `jntxfb_word` VALUES ('5','基础文件','0','2015-05-15 15:29:40','52','0','20060905025434921[1].gif','355.00 Byte','gif','管理员',NULL,NULL,'0','1'), ('6','基础文件','0','2015-05-15 15:29:42','53','0','20060905025435380[1].gif','111.00 Byte','gif','管理员',NULL,NULL,'0','1'), ('7','基础文件','0','2015-05-15 15:29:43','54','0','20060905025512830[1].gif','914.00 Byte','gif','管理员',NULL,NULL,'0','1'), ('8','基础文件','0','2015-05-15 15:29:45','55','0','20060905025513169[1].gif','341.00 Byte','gif','管理员',NULL,NULL,'0','1'), ('9','技术文档','0','2015-05-15 15:31:25','56','0','20060905025435519[1].gif','125.00 Byte','gif','管理员','本部门','dept','1','1'), ('10','技术文档','0','2015-05-15 16:35:20','57','0','20060905025432709[1].gif','170.00 Byte','gif','管理员','本部门','dept','1','1'), ('11','基础文档','0','2015-11-09 09:38:10','45','0','face.jpg','41.24 KB','jpg','管理员',NULL,NULL,'0','1'), ('12','技术文档','140','2015-11-09 09:49:51','46','0','face.jpg','41.24 KB','jpg','管理员',NULL,NULL,'1','1'), ('13','技术文档','140','2016-02-18 21:30:54','81','0','favicon.ico','3.19 KB','ico','管理员',NULL,NULL,'1','1'), ('14','基础文档','101','2016-02-18 21:31:22','82','0','favicon.ico','3.19 KB','ico','管理员','所有人员','all','0','1'), ('15','123','329','2016-03-02 14:40:25','91','0','Winaw32.exe','949.37 KB','exe','小乔',NULL,NULL,'1','5');
