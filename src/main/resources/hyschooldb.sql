/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hyschooldb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-10 00:42:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for audit_approve_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_approve_history`;
CREATE TABLE `audit_approve_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '审核管理员的id',
  `vip_id` int(11) NOT NULL COMMENT '被审核的id',
  `is_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过，0不通过，1通过',
  `reason` varchar(255) NOT NULL COMMENT '审核原因',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vip认证审核记录';

-- ----------------------------
-- Table structure for audit_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_goods_history`;
CREATE TABLE `audit_goods_history` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL,
  `audit_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布的商品审核记录';

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` int(1) NOT NULL COMMENT '栏目的状态',
  `description` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目，直接用枚举类';

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `category_id` int(5) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` int(1) NOT NULL COMMENT '商品的状态，待发布，提交审核，已驳回，已发布，已被购买，已完成交易，已下架。',
  `price` double(11,2) NOT NULL,
  `stock` int(5) NOT NULL COMMENT '库存量，不知道用不用的着，二手街一般为1',
  `description` varchar(255) DEFAULT NULL,
  `transaction_address` varchar(255) DEFAULT NULL COMMENT '交易地点，线上或某个学校',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '收藏到我的待发布商品时的时间',
  `online_time` timestamp NULL DEFAULT NULL COMMENT '提交进行审核的时间',
  `off_the_shelf_time` timestamp NULL DEFAULT NULL COMMENT '下架时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comments
-- ----------------------------
DROP TABLE IF EXISTS `goods_comments`;
CREATE TABLE `goods_comments` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `star_rating` double NOT NULL COMMENT '星级，所有用户的星级平均数是发布人的星级',
  `state` int(1) NOT NULL COMMENT '能否进行评价用',
  `content` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_images`;
CREATE TABLE `goods_images` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `state` int(1) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `to_vip_id` int(11) NOT NULL,
  `from_vip_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` int(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `have_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_all` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  `read_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `vip_buyer_id` int(11) NOT NULL,
  `vip_seller_id` int(11) NOT NULL,
  `state` int(1) NOT NULL COMMENT '订单状态，默认为0,0代表未付款，1代表用户付款商家未接单，2代表商家接单未发货，3配送中，4用户确定收货未评价完成订单，5用户已评价(可选择性操作)，6退单,-1删除',
  `sum_money` int(10) NOT NULL COMMENT '订单总金额',
  `goods_count` int(3) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建订单时间',
  `accept_time` timestamp NULL DEFAULT NULL COMMENT '商家接单时间',
  `shop_confirm_time` timestamp NULL DEFAULT NULL COMMENT '商家确认发货时间',
  `vip_confirm_time` timestamp NULL DEFAULT NULL COMMENT '用户确认收货时间',
  `delete_time` timestamp NULL DEFAULT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否支付，默认为0，0未支付，1为支付',
  `pay_mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式，0代表在线支付，1代表线下交易',
  `pay_serials_number` varchar(50) DEFAULT NULL COMMENT '用户支付后，会产生此交易流水号',
  `notes` varchar(255) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_comments
-- ----------------------------
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE `order_comments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `star_rating` double NOT NULL COMMENT '星级，所有用户的星级平均数是发布人的星级',
  `state` int(1) NOT NULL COMMENT '能否进行评价用',
  `content` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='完成订单后对发布人(店家)的评价';

-- ----------------------------
-- Table structure for order_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_list`;
CREATE TABLE `order_goods_list` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `state` int(1) NOT NULL,
  `star_rating` double DEFAULT NULL,
  `user_type` int(1) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `self_introduction` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `reset_password_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip_address
-- ----------------------------
DROP TABLE IF EXISTS `vip_address`;
CREATE TABLE `vip_address` (
  `id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `province_code` varchar(6) DEFAULT NULL COMMENT '省份城市编码，下拉菜单用',
  `city_code` varchar(6) DEFAULT NULL,
  `postcode` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认地址',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否已经删除',
  `create_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户的收货地址';

-- ----------------------------
-- Table structure for vip_approve
-- ----------------------------
DROP TABLE IF EXISTS `vip_approve`;
CREATE TABLE `vip_approve` (
  `id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `phone` int(11) NOT NULL,
  `province_code` varchar(6) NOT NULL,
  `city_code` varchar(6) NOT NULL,
  `school` varchar(50) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `state` int(1) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip_goods_collections
-- ----------------------------
DROP TABLE IF EXISTS `vip_goods_collections`;
CREATE TABLE `vip_goods_collections` (
  `id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vip的个人商品收藏';

-- ----------------------------
-- Table structure for vip_messages_board
-- ----------------------------
DROP TABLE IF EXISTS `vip_messages_board`;
CREATE TABLE `vip_messages_board` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '用户可以删除留言，是否删除',
  `create_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板，设计不完全';

-- ----------------------------
-- Table structure for vip_validate
-- ----------------------------
DROP TABLE IF EXISTS `vip_validate`;
CREATE TABLE `vip_validate` (
  `email` varchar(255) NOT NULL,
  `validate_code` varchar(255) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注册修改密码用的激活码表';
