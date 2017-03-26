/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hyschooldb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-03-26 18:21:57
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_approve_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_approve_history`;
CREATE TABLE `audit_approve_history` (
  `id`          INT(11)      NOT NULL,
  `admin_email` VARCHAR(255) NOT NULL,
  `vip_email`   VARCHAR(255) NOT NULL,
  `is_pass`     TINYINT(4)   NOT NULL,
  `reason`      VARCHAR(255) NOT NULL,
  `audit_time`  TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for audit_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_goods_history`;
CREATE TABLE `audit_goods_history` (
  `id`          INT(11)      NOT NULL,
  `admin_email` VARCHAR(255) NOT NULL,
  `goods_id`    INT(11)      NOT NULL,
  `is_pass`     TINYINT(4)   NOT NULL,
  `reason`      VARCHAR(255) NOT NULL,
  `audit_time`  TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id`          INT(11)      NOT NULL,
  `name`        VARCHAR(255) NOT NULL,
  `state`       INT(1)       NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id`                  INT(11)      NOT NULL,
  `category_id`         INT(5)       NOT NULL,
  `vip_email`           VARCHAR(255) NOT NULL,
  `name`                VARCHAR(255) NOT NULL,
  `state`               INT(1)       NOT NULL,
  `price`               DOUBLE(5, 2) NOT NULL,
  `stock`               INT(5)       NOT NULL,
  `description`         VARCHAR(255)      DEFAULT NULL,
  `transaction_address` VARCHAR(255)      DEFAULT NULL,
  `is_off_the_shelf`    TINYINT(4)        DEFAULT NULL,
  `create_time`         TIMESTAMP    NULL DEFAULT NULL,
  `online_time`         TIMESTAMP    NULL DEFAULT NULL,
  `off_the_shelf_time`  TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for goods_comments
-- ----------------------------
DROP TABLE IF EXISTS `goods_comments`;
CREATE TABLE `goods_comments` (
  `id`          INT(11)      NOT NULL,
  `goods_id`    INT(11)      NOT NULL,
  `maker_email` VARCHAR(255) NOT NULL,
  `reply_email` VARCHAR(255)      DEFAULT NULL,
  `content`     VARCHAR(255) NOT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id`            INT(11)      NOT NULL,
  `to_email`      VARCHAR(255) NOT NULL,
  `from_email`    VARCHAR(255)      DEFAULT NULL,
  `content`       VARCHAR(255) NOT NULL,
  `type`          INT(1)       NOT NULL,
  `url`           VARCHAR(255) NOT NULL,
  `have_read`     TINYINT(4)   NOT NULL,
  `id_delete`     TINYINT(4)   NOT NULL,
  `id_public_all` TINYINT(4)        DEFAULT NULL,
  `create_time`   TIMESTAMP    NULL DEFAULT NULL,
  `read_time`     TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id`                 INT(11)      NOT NULL,
  `order_number`       INT(11)      NOT NULL,
  `vip_email`          VARCHAR(255) NOT NULL,
  `state`              INT(1)       NOT NULL,
  `notes`              VARCHAR(255)      DEFAULT NULL,
  `sum_money`          INT(10)      NOT NULL,
  `pay_mode`           TINYINT(4)   NOT NULL,
  `create_time`        TIMESTAMP    NULL DEFAULT NULL,
  `accept_time`        TIMESTAMP    NULL DEFAULT NULL,
  `shop_confirm_time`  TIMESTAMP    NULL DEFAULT NULL,
  `vip_confirm_time`   TIMESTAMP    NULL DEFAULT NULL,
  `pay_serials_number` VARCHAR(50)       DEFAULT NULL,
  `is__delete`         TINYINT(4)        DEFAULT NULL,
  `delete_time`        TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for order_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_list`;
CREATE TABLE `order_goods_list` (
  `id`          INT(11)       NOT NULL,
  `order_id`    INT(11)       NOT NULL,
  `goods_id`    INT(11)       NOT NULL,
  `goods_count` INT(3)        NOT NULL,
  `sum_money`   DOUBLE(10, 0) NOT NULL,
  `create_time` TIMESTAMP     NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id`                  INT(11)      NOT NULL AUTO_INCREMENT,
  `name`                VARCHAR(255) NOT NULL,
  `email`               VARCHAR(255) NOT NULL,
  `password`            VARCHAR(255) NOT NULL,
  `state`               INT(1)       NOT NULL,
  `star_rating`         INT(1)                DEFAULT NULL,
  `user_type`           INT(1)       NOT NULL,
  `birthday`            DATE                  DEFAULT NULL,
  `create_time`         TIMESTAMP    NULL     DEFAULT NULL,
  `update_time`         TIMESTAMP    NULL     DEFAULT NULL,
  `reset_password_time` TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_address
-- ----------------------------
DROP TABLE IF EXISTS `vip_address`;
CREATE TABLE `vip_address` (
  `id`            INT(11)      NOT NULL,
  `vip_email`     INT(11)      NOT NULL,
  `address`       VARCHAR(255)      DEFAULT NULL,
  `province_code` VARCHAR(6)        DEFAULT NULL,
  `city_code`     VARCHAR(6)        DEFAULT NULL,
  `postcode`      VARCHAR(6)        DEFAULT NULL,
  `phone`         VARCHAR(11)  NOT NULL,
  `name`          VARCHAR(255) NOT NULL,
  `default`       TINYINT(4)   NOT NULL,
  `is_delete`     TINYINT(4)        DEFAULT NULL,
  `create_time`   TIMESTAMP    NULL DEFAULT NULL,
  `delete_time`   TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_approve
-- ----------------------------
DROP TABLE IF EXISTS `vip_approve`;
CREATE TABLE `vip_approve` (
  `id`          INT(11)      NOT NULL,
  `email`       VARCHAR(255) NOT NULL,
  `real_name`   VARCHAR(255) NOT NULL,
  `gender`      TINYINT(4)   NOT NULL,
  `phone`       INT(11)      NOT NULL,
  `school`      VARCHAR(50)  NOT NULL,
  `picutre_url` VARCHAR(255) NOT NULL,
  `state`       INT(1)       NOT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_comments
-- ----------------------------
DROP TABLE IF EXISTS `vip_comments`;
CREATE TABLE `vip_comments` (
  `id`           INT(11)      NOT NULL,
  `saller_email` VARCHAR(255) NOT NULL,
  `buyer_email`  VARCHAR(255) NOT NULL,
  `star`         DOUBLE       NOT NULL,
  `state`        INT(1)       NOT NULL
  COMMENT '能否进行评价用',
  `content`      VARCHAR(255) NOT NULL,
  `create_time`  TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_goods_collections
-- ----------------------------
DROP TABLE IF EXISTS `vip_goods_collections`;
CREATE TABLE `vip_goods_collections` (
  `id`          INT(11)      NOT NULL,
  `email`       VARCHAR(255) NOT NULL,
  `goods_id`    INT(11)      NOT NULL,
  `is_delete`   TINYINT(4)        DEFAULT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_messages_board
-- ----------------------------
DROP TABLE IF EXISTS `vip_messages_board`;
CREATE TABLE `vip_messages_board` (
  `id`          INT(11)      NOT NULL,
  `owner_email` VARCHAR(255) NOT NULL,
  `from_email`  VARCHAR(255) NOT NULL,
  `content`     VARCHAR(255)      DEFAULT NULL,
  `is_delete`   TINYINT(4)        DEFAULT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  `delete_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_validate
-- ----------------------------
DROP TABLE IF EXISTS `vip_validate`;
CREATE TABLE `vip_validate` (
  `email`         VARCHAR(255) NOT NULL,
  `validate_code` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
