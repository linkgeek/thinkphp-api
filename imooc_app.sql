/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : 127.0.0.1:3306
Source Database       : imooc_app

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-04-13 17:39:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ent_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ent_admin_user`;
CREATE TABLE `ent_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_ip` varchar(30) NOT NULL DEFAULT '',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_2` (`username`),
  KEY `username` (`username`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_admin_user
-- ----------------------------
INSERT INTO `ent_admin_user` VALUES ('1', 'admin', 'c53d0bf8dcdbc8fbf430feb1230742d5', '0.0.0.0', '1523587959', '0', '1', '0', '1523587959');
INSERT INTO `ent_admin_user` VALUES ('2', 'singwa', 'b7f39367b5d8d0f65c8e2002dae7a07a', '', '0', '0', '1', '0', '0');
INSERT INTO `ent_admin_user` VALUES ('7', 'admin122', 'f5957f2d94df1be5d82fede6fcd9dc29', '', '0', '0', '1', '1501151220', '1501151220');
INSERT INTO `ent_admin_user` VALUES ('9', 'admin3444', 'b64974feb747678f4d443bd75b0b47c6', '', '0', '0', '1', '1501151278', '1501151278');

-- ----------------------------
-- Table structure for ent_app_active
-- ----------------------------
DROP TABLE IF EXISTS `ent_app_active`;
CREATE TABLE `ent_app_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(8) unsigned NOT NULL DEFAULT '0',
  `app_type` varchar(20) NOT NULL DEFAULT '',
  `version_code` varchar(10) NOT NULL DEFAULT '',
  `did` varchar(100) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `model` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_app_active
-- ----------------------------
INSERT INTO `ent_app_active` VALUES ('1', '1', 'android', '', '12345dg', '1503338102', '1503338102', '');
INSERT INTO `ent_app_active` VALUES ('2', '1', 'android', '', '12345dg', '1503338116', '1503338116', '');
INSERT INTO `ent_app_active` VALUES ('3', '1', 'android', '', '12345dg', '1503943731', '1503943731', '');
INSERT INTO `ent_app_active` VALUES ('4', '1', 'android', '', '13225465', '1523323332', '1523323332', '');
INSERT INTO `ent_app_active` VALUES ('5', '1', 'android', '', '13225465', '1523323723', '1523323723', '');
INSERT INTO `ent_app_active` VALUES ('6', '3', 'android', '', '13225465', '1523323744', '1523323744', '');
INSERT INTO `ent_app_active` VALUES ('7', '3', 'android', '', '13225465', '1523323755', '1523323755', '');

-- ----------------------------
-- Table structure for ent_comment
-- ----------------------------
DROP TABLE IF EXISTS `ent_comment`;
CREATE TABLE `ent_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论目标用户id',
  `content` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '评论的内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_comment
-- ----------------------------
INSERT INTO `ent_comment` VALUES ('2', '1', '1', '0', '0', 'sdfbhsdf', '1523591426', '1', '1523591426');
INSERT INTO `ent_comment` VALUES ('3', '2', '1', '0', '0', 'sdfbhsdf', '1523598482', '1', '1523598482');
INSERT INTO `ent_comment` VALUES ('4', '3', '1', '0', '0', 'sdfbhsdf', '1523598486', '1', '1523598486');
INSERT INTO `ent_comment` VALUES ('5', '4', '1', '0', '0', 'sdfbhsdf', '1523598521', '1', '1523598521');
INSERT INTO `ent_comment` VALUES ('6', '5', '1', '0', '0', 'sdfbhsdf', '1523598522', '1', '1523598522');
INSERT INTO `ent_comment` VALUES ('7', '2', '1', '2', '1', 'sdfbhsdf', '1523598522', '1', '1523598522');
INSERT INTO `ent_comment` VALUES ('8', '4', '1', '7', '2', 'sdfbhsdf', '1523598523', '0', '1523598523');

-- ----------------------------
-- Table structure for ent_crab
-- ----------------------------
DROP TABLE IF EXISTS `ent_crab`;
CREATE TABLE `ent_crab` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_type` varchar(10) NOT NULL,
  `version_code` varchar(10) NOT NULL,
  `model` varchar(10) NOT NULL,
  `did` int(100) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `description` varchar(100) NOT NULL,
  `line` int(10) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_crab
-- ----------------------------

-- ----------------------------
-- Table structure for ent_news
-- ----------------------------
DROP TABLE IF EXISTS `ent_news`;
CREATE TABLE `ent_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `small_title` varchar(20) NOT NULL DEFAULT '',
  `catid` int(8) unsigned NOT NULL DEFAULT '0',
  `upvote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_position` tinyint(1) NOT NULL DEFAULT '0',
  `is_head_figure` tinyint(1) NOT NULL DEFAULT '0',
  `is_allowcomments` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` int(8) NOT NULL,
  `source_type` tinyint(1) DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `read_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_news
-- ----------------------------
INSERT INTO `ent_news` VALUES ('1', 'ttst', 'ttt', '1', '1', '', '<p>ttttttt</p>', 'ttt', '1', '0', '0', '0', '0', '1501439513', '1501634869', '-1', '0', '0');
INSERT INTO `ent_news` VALUES ('2', 'tttt', 'sst', '1', '0', '', '<p>tt</p>', 'tt', '0', '0', '0', '0', '0', '1501439814', '1501634848', '-1', '0', '0');
INSERT INTO `ent_news` VALUES ('3', 'ttt', 'ttt', '1', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/a055e20170731023719851.jpg', '<p>ttt</p>', 't', '0', '0', '0', '0', '0', '1501439846', '1501439846', '1', '2', '0');
INSERT INTO `ent_news` VALUES ('4', 'tttt', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '1', '0');
INSERT INTO `ent_news` VALUES ('5', '刘德华', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '3', '0');
INSERT INTO `ent_news` VALUES ('6', '吴奇隆', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '1', '0');
INSERT INTO `ent_news` VALUES ('7', 'singwa', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '1', '0');
INSERT INTO `ent_news` VALUES ('8', '一个人的生活', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '2', '0');
INSERT INTO `ent_news` VALUES ('9', '两个人的世界', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1502972250', '1', '0', '0');
INSERT INTO `ent_news` VALUES ('10', 'singwa又出新课程了', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1502972232', '1', '0', '0');
INSERT INTO `ent_news` VALUES ('11', 'singwa出席江西农业大学第三届大学生就业讲座', 'tt', '3', '0', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1504460156', '-1', '0', '0');

-- ----------------------------
-- Table structure for ent_user
-- ----------------------------
DROP TABLE IF EXISTS `ent_user`;
CREATE TABLE `ent_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `token` varchar(100) NOT NULL DEFAULT '',
  `time_out` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(200) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别0男 1女',
  `signature` varchar(200) NOT NULL DEFAULT '' COMMENT '个性签名',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_user
-- ----------------------------
INSERT INTO `ent_user` VALUES ('1', '加藤非', '315033f93d06827585802392b28f8fff', '18318678052', '7522524c7b968c9c0204077ceda4dc691c437da2', '1524186998', 'http://otwueljs0.bkt.clouddn.com/2018/04/486a8201804121436271408.jpg', '1', '一技在手', '1523433056', '1523582198', '1');
INSERT INTO `ent_user` VALUES ('2', 'hezhan', '315033f93d06827585802392b28f8fff', '18377335386', '', '0', 'http://otwueljs0.bkt.clouddn.com/2018/04/486a8201804121436271408.jpg', '2', '一技在手', '1523433056', '1523582198', '1');
INSERT INTO `ent_user` VALUES ('3', 'admin', '315033f93d06827585802392b28f8fff', '18318678051', '', '0', 'http://otwueljs0.bkt.clouddn.com/2018/04/486a8201804121436271408.jpg', '1', '一技在手', '1523433056', '1523582198', '1');
INSERT INTO `ent_user` VALUES ('4', 'root', '315033f93d06827585802392b28f8fff', '18318678520', '', '0', 'http://otwueljs0.bkt.clouddn.com/2018/04/486a8201804121436271408.jpg', '2', '一技在手', '1523433056', '1523582198', '1');
INSERT INTO `ent_user` VALUES ('5', '测试', '315033f93d06827585802392b28f8fff', '18318678521', '', '0', 'http://otwueljs0.bkt.clouddn.com/2018/04/486a8201804121436271408.jpg', '1', '一技在手', '1523433056', '1523582198', '1');

-- ----------------------------
-- Table structure for ent_user_news
-- ----------------------------
DROP TABLE IF EXISTS `ent_user_news`;
CREATE TABLE `ent_user_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_user_news
-- ----------------------------
INSERT INTO `ent_user_news` VALUES ('6', '1', '1', '1523586290', '1523586290');

-- ----------------------------
-- Table structure for ent_version
-- ----------------------------
DROP TABLE IF EXISTS `ent_version`;
CREATE TABLE `ent_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型 比如 ios android',
  `version` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '内部版本号',
  `version_code` varchar(20) NOT NULL DEFAULT '' COMMENT '外部版本号比如1.2.3',
  `is_force` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制更新0不，1强制更新',
  `apk_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'apk最新地址',
  `upgrade_point` varchar(500) NOT NULL DEFAULT '' COMMENT '升级提示',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_version
-- ----------------------------
INSERT INTO `ent_version` VALUES ('1', 'android', '2', '1.2', '0', 'x.com/1/3.html', '1、优化了网络数据\r\n2、增加新闻内容', '1', '0', '0');
INSERT INTO `ent_version` VALUES ('2', 'android', '3', '2.1', '1', 'b.com/1/3.html', '1、优化了网络数据\r\n', '1', '0', '0');
