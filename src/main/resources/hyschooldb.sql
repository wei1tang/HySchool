/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hyschooldb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-12 23:15:12
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
-- Records of audit_approve_history
-- ----------------------------

-- ----------------------------
-- Table structure for audit_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_goods_history`;
CREATE TABLE `audit_goods_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL,
  `audit_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布的商品审核记录';

-- ----------------------------
-- Records of audit_goods_history
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state` int(1) NOT NULL COMMENT '栏目的状态',
  `description` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目，直接用枚举类';

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(5) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` int(1) NOT NULL COMMENT '商品的状态，待发布，提交审核，已驳回，已发布，已被购买，已完成交易，已下架。',
  `price` double(11,2) NOT NULL,
  `stock` int(5) NOT NULL COMMENT '库存量，不知道用不用的着，二手街一般为1',
  `description` varchar(255) DEFAULT NULL,
  `uv` int(11) DEFAULT NULL,
  `total_comments` int(5) DEFAULT NULL,
  `transaction_address` varchar(255) DEFAULT NULL COMMENT '交易地点，线上或某个学校',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '收藏到我的待发布商品时的时间',
  `online_time` timestamp NULL DEFAULT NULL COMMENT '提交进行审核的时间',
  `off_the_shelf_time` timestamp NULL DEFAULT NULL COMMENT '下架时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('2', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('3', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('4', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('5', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('6', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('7', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('8', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('9', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('10', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('11', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('12', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('13', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('14', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('15', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('16', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('17', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('18', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('19', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('20', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('21', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('22', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('23', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('24', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('25', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('26', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('27', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('28', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('29', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('30', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('31', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('32', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('33', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('34', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('35', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('36', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('37', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('38', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('39', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('40', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('41', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('42', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('43', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('44', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('45', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('46', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('47', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('48', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('49', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('50', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('51', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('52', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('53', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('54', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('55', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('56', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('57', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('58', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('59', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('60', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('61', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('62', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('63', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('64', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('65', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('66', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('67', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('68', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('69', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('70', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('71', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('72', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('73', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('74', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('75', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('76', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);
INSERT INTO `goods` VALUES ('77', '1', '1', 'goods', '2', '5000.00', '1', '商品的描述', null, null, '华科', null, '2017-03-20 00:00:00', null);

-- ----------------------------
-- Table structure for goods_comments
-- ----------------------------
DROP TABLE IF EXISTS `goods_comments`;
CREATE TABLE `goods_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `star_rating` double NOT NULL COMMENT '星级，所有用户的星级平均数是发布人的星级',
  `state` int(1) NOT NULL COMMENT '能否进行评价用',
  `content` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_comments
-- ----------------------------

-- ----------------------------
-- Table structure for goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_images`;
CREATE TABLE `goods_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `state` int(1) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_images
-- ----------------------------
INSERT INTO `goods_images` VALUES ('1', '1', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('2', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('3', '3', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('4', '4', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('5', '5', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('6', '6', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('7', '7', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('8', '8', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('9', '9', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('10', '10', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('11', '11', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('12', '12', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('13', '13', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('14', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('15', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('16', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('17', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('18', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('19', '2', '/static/images/goods-images/2.png', '1', null);
INSERT INTO `goods_images` VALUES ('20', '2', '/static/images/goods-images/2.png', '1', null);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_comments
-- ----------------------------
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE `order_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of order_comments
-- ----------------------------

-- ----------------------------
-- Table structure for order_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_list`;
CREATE TABLE `order_goods_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goods_list
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('17', '吕金旺', '769707043@qq.com', '$2a$10$4BQU/OYP/hlcwOM0oo7.ee4uDD8fvo.QJoz2wk.QYnJgvFVBuXFce', '2', null, '2', '/static/images/vip-avatar-images/ljw.jpg', '我的个人简介31232', null, '2017-04-10 16:44:57', null, null);

-- ----------------------------
-- Table structure for vip_address
-- ----------------------------
DROP TABLE IF EXISTS `vip_address`;
CREATE TABLE `vip_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of vip_address
-- ----------------------------

-- ----------------------------
-- Table structure for vip_approve
-- ----------------------------
DROP TABLE IF EXISTS `vip_approve`;
CREATE TABLE `vip_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Records of vip_approve
-- ----------------------------

-- ----------------------------
-- Table structure for vip_goods_collections
-- ----------------------------
DROP TABLE IF EXISTS `vip_goods_collections`;
CREATE TABLE `vip_goods_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vip_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vip的个人商品收藏';

-- ----------------------------
-- Records of vip_goods_collections
-- ----------------------------

-- ----------------------------
-- Table structure for vip_messages_board
-- ----------------------------
DROP TABLE IF EXISTS `vip_messages_board`;
CREATE TABLE `vip_messages_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '用户可以删除留言，是否删除',
  `create_time` timestamp NULL DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板，设计不完全';

-- ----------------------------
-- Records of vip_messages_board
-- ----------------------------

-- ----------------------------
-- Table structure for vip_validate
-- ----------------------------
DROP TABLE IF EXISTS `vip_validate`;
CREATE TABLE `vip_validate` (
  `email` varchar(255) NOT NULL,
  `validate_code` varchar(255) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注册修改密码用的激活码表';

-- ----------------------------
-- Records of vip_validate
-- ----------------------------
INSERT INTO `vip_validate` VALUES ('769707043@qq.com', null);
