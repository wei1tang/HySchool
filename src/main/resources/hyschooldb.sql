/*
Navicat MySQL Data Transfer

Source Server         : SpringOauthServer
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hyschooldb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-16 14:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` int(1) NOT NULL,
  `user_type` int(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `reset_password_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip_validate
-- ----------------------------
DROP TABLE IF EXISTS `vip_validate`;
CREATE TABLE `vip_validate` (
  `email` varchar(255) NOT NULL,
  `validate_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
