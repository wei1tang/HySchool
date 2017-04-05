/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hyschooldb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-05 13:54:23
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit_approve_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_approve_history`;
CREATE TABLE `audit_approve_history` (
  `id`         INT(11)      NOT NULL,
  `admin_id`   INT(11)      NOT NULL
  COMMENT '审核管理员的邮箱',
  `vip_id`     INT(11)      NOT NULL
  COMMENT '被审核的邮箱',
  `is_pass`    TINYINT(1)   NOT NULL DEFAULT '0'
  COMMENT '是否通过，0不通过，1通过',
  `reason`     VARCHAR(255) NOT NULL
  COMMENT '审核原因',
  `audit_time` TIMESTAMP    NULL     DEFAULT NULL
  COMMENT '审核时间',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = 'vip认证审核记录';

-- ----------------------------
-- Table structure for audit_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_goods_history`;
CREATE TABLE `audit_goods_history` (
  `id`         INT(11)      NOT NULL,
  `admin_id`   INT(11)      NOT NULL,
  `goods_id`   INT(11)      NOT NULL,
  `is_pass`    TINYINT(1)   NOT NULL DEFAULT '0',
  `reason`     VARCHAR(255) NOT NULL,
  `audit_time` TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '发布的商品审核记录';

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id`          INT(11)      NOT NULL,
  `name`        VARCHAR(255) NOT NULL,
  `state`       INT(1)       NOT NULL
  COMMENT '栏目的状态',
  `description` VARCHAR(255) NOT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '栏目，直接用枚举类';

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id`                  INT(11)      NOT NULL,
  `category_id`         INT(5)       NOT NULL,
  `vip_id`              INT(11)      NOT NULL,
  `name`                VARCHAR(255) NOT NULL,
  `state`               INT(1)       NOT NULL
  COMMENT '商品的状态，待发布，提交审核，已驳回，已发布，已被购买，已完成交易，已下架。',
  `price`               DOUBLE(5, 2) NOT NULL,
  `stock`               INT(5)       NOT NULL
  COMMENT '库存量，不知道用不用的着，二手街一般为1',
  `description`         VARCHAR(255)      DEFAULT NULL,
  `transaction_address` VARCHAR(255)      DEFAULT NULL
  COMMENT '交易地点，线上或某个学校',
  `create_time`         TIMESTAMP    NULL DEFAULT NULL
  COMMENT '收藏到我的待发布商品时的时间',
  `online_time`         TIMESTAMP    NULL DEFAULT NULL
  COMMENT '提交进行审核的时间',
  `off_the_shelf_time`  TIMESTAMP    NULL DEFAULT NULL
  COMMENT '下架时间',
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
  `maker_id`    INT(11)      NOT NULL,
  `reply_id`    INT(11)           DEFAULT NULL,
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
  `id`          INT(11)      NOT NULL,
  `to_id`       INT(11)      NOT NULL,
  `from_id`     INT(11)               DEFAULT NULL,
  `content`     VARCHAR(255) NOT NULL,
  `type`        INT(1)       NOT NULL,
  `url`         VARCHAR(255) NOT NULL,
  `have_read`   TINYINT(1)   NOT NULL DEFAULT '0',
  `is_delete`   TINYINT(1)   NOT NULL DEFAULT '0',
  `create_time` TIMESTAMP    NULL     DEFAULT NULL,
  `read_time`   TIMESTAMP    NULL     DEFAULT NULL,
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
  `state`              INT(1)       NOT NULL
  COMMENT '订单状态，默认为0,0代表未付款，1代表用户付款商家未接单，2代表商家接单未发货，3配送中，4商家确定收货，5用户确认收货未评价完成订单，6用户已评价(可选择性操作)，-1退单',
  `notes`              VARCHAR(255)          DEFAULT NULL
  COMMENT '订单备注',
  `sum_money`          INT(10)      NOT NULL
  COMMENT '订单总金额',
  `pay_mode`           TINYINT(1)   NOT NULL DEFAULT '0'
  COMMENT '支付方式，0代表在线支付，1代表货到付款',
  `create_time`        TIMESTAMP    NULL     DEFAULT NULL
  COMMENT '创建订单时间',
  `accept_time`        TIMESTAMP    NULL     DEFAULT NULL
  COMMENT '商家接单时间',
  `shop_confirm_time`  TIMESTAMP    NULL     DEFAULT NULL
  COMMENT '商家确认送达时间',
  `vip_confirm_time`   TIMESTAMP    NULL     DEFAULT NULL
  COMMENT '用户确认收货时间',
  `is_pay`             TINYINT(1)   NOT NULL DEFAULT '0'
  COMMENT '用户是否支付，默认为0，0未支付，1为支付',
  `pay_serials_number` VARCHAR(50)           DEFAULT NULL
  COMMENT '用户支付后，会产生此交易流水号',
  `is__delete`         TINYINT(1)            DEFAULT '0'
  COMMENT '完成订单后，用户可删除订单',
  `delete_time`        TIMESTAMP    NULL     DEFAULT NULL,
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
  `star_rating`         DOUBLE                DEFAULT NULL,
  `user_type`           INT(1)       NOT NULL,
  `self_introduction`   VARCHAR(255)          DEFAULT NULL,
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
  `vip_id`        INT(11)      NOT NULL,
  `address`       VARCHAR(255)          DEFAULT NULL
  COMMENT '详细地址',
  `province_code` VARCHAR(6)            DEFAULT NULL
  COMMENT '省份城市编码，下拉菜单用',
  `city_code`     VARCHAR(6)            DEFAULT NULL,
  `postcode`      VARCHAR(6)            DEFAULT NULL,
  `phone`         VARCHAR(11)  NOT NULL,
  `name`          VARCHAR(255) NOT NULL,
  `is_default`    TINYINT(1)   NOT NULL DEFAULT '0'
  COMMENT '是否是默认地址',
  `is_delete`     TINYINT(1)            DEFAULT '0'
  COMMENT '是否已经删除',
  `create_time`   TIMESTAMP    NULL     DEFAULT NULL,
  `delete_time`   TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '用户的收货地址';

-- ----------------------------
-- Table structure for vip_approve
-- ----------------------------
DROP TABLE IF EXISTS `vip_approve`;
CREATE TABLE `vip_approve` (
  `id`            INT(11)      NOT NULL,
  `vip_id`        INT(11)      NOT NULL,
  `real_name`     VARCHAR(255) NOT NULL,
  `gender`        TINYINT(1)   NOT NULL DEFAULT '0',
  `phone`         INT(11)      NOT NULL,
  `province_code` VARCHAR(6)   NOT NULL,
  `city_code`     VARCHAR(6)   NOT NULL,
  `school`        VARCHAR(50)  NOT NULL,
  `picutre_url`   VARCHAR(255) NOT NULL,
  `state`         INT(1)       NOT NULL,
  `create_time`   TIMESTAMP    NULL     DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for vip_comments
-- ----------------------------
DROP TABLE IF EXISTS `vip_comments`;
CREATE TABLE `vip_comments` (
  `id`          INT(11)      NOT NULL,
  `saller_id`   INT(11)      NOT NULL,
  `buyer_id`    INT(11)      NOT NULL,
  `star_rating` DOUBLE       NOT NULL
  COMMENT '星级，所有用户的星级平均数是发布人的星级',
  `state`       INT(1)       NOT NULL
  COMMENT '能否进行评价用',
  `content`     VARCHAR(255) NOT NULL,
  `create_time` TIMESTAMP    NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '完成订单后对发布人(店家)的评价';

-- ----------------------------
-- Table structure for vip_goods_collections
-- ----------------------------
DROP TABLE IF EXISTS `vip_goods_collections`;
CREATE TABLE `vip_goods_collections` (
  `id`          INT(11)   NOT NULL,
  `vip_id`      INT(11)   NOT NULL,
  `goods_id`    INT(11)   NOT NULL,
  `is_delete`   TINYINT(1)     DEFAULT '0',
  `create_time` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = 'vip的个人商品收藏';

-- ----------------------------
-- Table structure for vip_messages_board
-- ----------------------------
DROP TABLE IF EXISTS `vip_messages_board`;
CREATE TABLE `vip_messages_board` (
  `id`          INT(11)   NOT NULL,
  `owner_id`    INT(11)   NOT NULL,
  `from_id`     INT(11)   NOT NULL,
  `content`     VARCHAR(255)   DEFAULT NULL,
  `is_delete`   TINYINT(1)     DEFAULT '0'
  COMMENT '用户可以删除留言，是否删除',
  `create_time` TIMESTAMP NULL DEFAULT NULL,
  `delete_time` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '留言板，设计不完全';

-- ----------------------------
-- Table structure for vip_validate
-- ----------------------------
DROP TABLE IF EXISTS `vip_validate`;
CREATE TABLE `vip_validate` (
  `email`         VARCHAR(255) NOT NULL,
  `validate_code` VARCHAR(255) DEFAULT NULL
  COMMENT '激活码',
  PRIMARY KEY (`email`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '注册修改密码用的激活码表';
