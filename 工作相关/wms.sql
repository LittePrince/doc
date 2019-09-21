/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 21/09/2019 22:05:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cargo_area
-- ----------------------------
DROP TABLE IF EXISTS `cargo_area`;
CREATE TABLE `cargo_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货区',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货区名',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货区编码',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充说明',
  `startRow` int(11) NOT NULL DEFAULT 0 COMMENT '起始行',
  `startColumn` int(11) NOT NULL DEFAULT 0 COMMENT '起始列',
  `totalRow` int(11) NOT NULL DEFAULT 1 COMMENT '行宽',
  `totalColumn` int(11) NOT NULL DEFAULT 1 COMMENT '列宽',
  `ware_house_id` int(11) NULL DEFAULT NULL COMMENT '仓库',
  `isAssignLocation` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cargo_area
-- ----------------------------
INSERT INTO `cargo_area` VALUES (1, '冷藏区', 'LENGCANG', '', 1, 1, 2, 4, 3, 1);
INSERT INTO `cargo_area` VALUES (2, '保鲜区', 'CHANGWEN', '', 1, 5, 2, 5, 3, 1);
INSERT INTO `cargo_area` VALUES (3, '冷冻区', 'LENGDONG', '', 1, 10, 2, 5, 3, 1);

-- ----------------------------
-- Table structure for combine_erpitem_detail
-- ----------------------------
DROP TABLE IF EXISTS `combine_erpitem_detail`;
CREATE TABLE `combine_erpitem_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` int(11) NULL DEFAULT NULL COMMENT 'erp商品',
  `combine_erp_item_id` int(11) NULL DEFAULT NULL COMMENT '整合erp商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for delivery_task_trade_delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery_task_trade_delivery`;
CREATE TABLE `delivery_task_trade_delivery`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `delivery_task_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `delivery_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery_task_trade_delivery
-- ----------------------------
INSERT INTO `delivery_task_trade_delivery` VALUES (1, 1, 5);

-- ----------------------------
-- Table structure for erp_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_item`;
CREATE TABLE `erp_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erpId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `modifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一编码',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充说明',
  `item_category_id` int(11) NULL DEFAULT NULL COMMENT '商品货物id',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `item_unit_id` int(11) NULL DEFAULT NULL,
  `shelfLife` int(11) NULL DEFAULT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物名字',
  `categoryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物编码',
  `supplierCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargoAreaCategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品长',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品宽',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品高',
  `volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体积',
  `averagePickTime` decimal(12, 2) NULL DEFAULT 30.00 COMMENT '平均拣货时间',
  `isPackage` int(11) NOT NULL DEFAULT 0 COMMENT '是否包装',
  `hardness` int(11) NOT NULL DEFAULT 1 COMMENT '是否坚硬',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_item
-- ----------------------------
INSERT INTO `erp_item` VALUES (1, '119926605386', '2019-04-23 09:17:21', '2019-09-20 10:37:48', '1号包装箱', 'baozhuang-box-01', NULL, NULL, NULL, NULL, 0, '包装材料', 'baozhuang', 'gys-1', 'GE', '个', 'CHANGWEN', NULL, NULL, NULL, NULL, NULL, 30.00, 1, 1);
INSERT INTO `erp_item` VALUES (2, '107091789430', '2019-02-02 14:56:39', '2019-09-20 09:43:39', '绿源新五花肉', 'ly_wuhuarou', NULL, NULL, NULL, NULL, 0, '新分类3', '新分类3', 'gys-1', NULL, NULL, 'LENGDONG', 'lvyuan_wuhuarou.jpg', NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (3, '107091818897', '2019-02-02 14:58:45', '2019-09-20 09:40:23', '绿源精瘦肉', 'ly_jingshourou', NULL, NULL, NULL, NULL, 0, '新分类2', '新分类2', 'gys-1', NULL, NULL, 'LENGDONG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (4, '106995773447', '2019-01-31 16:06:12', '2019-09-20 09:43:39', '白菜', 'SP-BAICAI-01', NULL, NULL, NULL, NULL, 0, '新分类6', '新分类6', 'gys-1', NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (5, '104816519370', '2019-01-16 13:09:20', '2019-09-20 09:50:39', '苹果', 'Test-Item-1', NULL, NULL, NULL, NULL, 0, '水果', '003', 'gys-1', NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (6, '119927342953', '2019-04-23 09:19:54', '2019-04-23 09:19:54', '精品苹果', 'jp-apple-01', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (7, '106995791225', '2019-01-31 16:06:58', '2019-03-27 10:41:23', '香蕉', 'SP-XIANGJIAO_001', NULL, NULL, NULL, NULL, 0, '新分类5', '新分类5', 'gys-1', NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (8, '112739418298', '2019-03-15 09:09:03', '2019-03-15 09:20:18', 'pici-test', 'pici-test', NULL, NULL, NULL, NULL, 5, NULL, NULL, 'gys-1', NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (9, '112633548309', '2019-03-14 15:25:48', '2019-03-14 15:26:28', 'woshiceshi', 'woshiceshi', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'LENGCANG', NULL, NULL, NULL, NULL, NULL, 30.00, 0, 1);
INSERT INTO `erp_item` VALUES (10, '107092005351', '2019-02-02 15:09:26', '2019-02-22 16:22:38', '绿源生姜', 'ly_shengjiang', NULL, NULL, NULL, NULL, 0, '新分类1', '新分类1', 'gys-1', NULL, NULL, 'LENGCANG', 'lvyuan_shengjiang.jpg', NULL, NULL, NULL, NULL, 30.00, 0, 1);

-- ----------------------------
-- Table structure for erp_item_category
-- ----------------------------
DROP TABLE IF EXISTS `erp_item_category`;
CREATE TABLE `erp_item_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_purchase
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase`;
CREATE TABLE `erp_purchase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'erp采购id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单据编码',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT 1,
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `approveDate` datetime(0) NULL DEFAULT NULL,
  `expectedReceiptDate` datetime(0) NULL DEFAULT NULL COMMENT '预计到货时间',
  `ware_house_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库编码',
  `ware_house_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `supplierCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `supplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `createName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `wcsFlag` int(11) NULL DEFAULT 0,
  `item_station_id` int(11) NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `boxCount` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_purchase
-- ----------------------------
INSERT INTO `erp_purchase` VALUES (1, 'PO154835787206', '', 1, '2019-09-17 14:54:06', '2019-09-17 14:54:20', NULL, 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', 2, 1, 25.00, 1);
INSERT INTO `erp_purchase` VALUES (2, 'PO154068336253', '李希才-测试2', 0, '2019-09-14 18:01:48', NULL, '2019-09-14 00:00:00', 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', NULL, 1, 1.00, 1);
INSERT INTO `erp_purchase` VALUES (3, 'PO154067655227', '李希才-测试', 1, '2019-09-14 17:57:50', '2019-09-14 17:59:18', '2019-09-14 00:00:00', 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', 2, 1, 3.00, 1);
INSERT INTO `erp_purchase` VALUES (4, 'PO143889843885', '', 1, '2019-08-10 18:30:50', '2019-08-10 18:31:13', '2019-08-12 00:00:00', 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', 2, 1, 400.00, 10);
INSERT INTO `erp_purchase` VALUES (5, 'PO155767653217', '', 1, '2019-09-20 09:46:10', '2019-09-20 09:46:30', NULL, 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', 2, 1, 25.00, 1);
INSERT INTO `erp_purchase` VALUES (6, 'PO155869813923', 'wcs第一次联调测试', 1, '2019-09-20 16:04:25', '2019-09-20 16:04:36', '2019-09-20 00:00:00', 'changsha_sub_ware_1', '长沙分仓1', 'gys-1', '供应商测试1', '李兵', 0, NULL, 25.00, 10);

-- ----------------------------
-- Table structure for erp_purchase_arrive
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_arrive`;
CREATE TABLE `erp_purchase_arrive`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `approveDate` datetime(0) NULL DEFAULT NULL,
  `orderType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchaseCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ware_house_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ware_house_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_purchase_arrive_detail
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_arrive_detail`;
CREATE TABLE `erp_purchase_arrive_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_arrive_id` int(11) NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `erp_purchase_detail`;
CREATE TABLE `erp_purchase_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_purchase_detail
-- ----------------------------
INSERT INTO `erp_purchase_detail` VALUES (1, 1, 25.00, 1);
INSERT INTO `erp_purchase_detail` VALUES (3, 3, 1.00, 2);
INSERT INTO `erp_purchase_detail` VALUES (4, 3, 1.00, 1);
INSERT INTO `erp_purchase_detail` VALUES (5, 3, 1.00, 4);
INSERT INTO `erp_purchase_detail` VALUES (6, 4, 200.00, 2);
INSERT INTO `erp_purchase_detail` VALUES (7, 4, 200.00, 3);
INSERT INTO `erp_purchase_detail` VALUES (9, 2, 1.00, 4);
INSERT INTO `erp_purchase_detail` VALUES (10, 5, 25.00, 5);
INSERT INTO `erp_purchase_detail` VALUES (11, 6, 25.00, 5);

-- ----------------------------
-- Table structure for erp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `erp_supplier`;
CREATE TABLE `erp_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `modifyDate` datetime(0) NULL DEFAULT NULL,
  `del` int(11) NOT NULL DEFAULT 1,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_supplier
-- ----------------------------
INSERT INTO `erp_supplier` VALUES (1, '供应商测试1', 'gys-1', '2019-01-16 13:19:08', '2019-01-16 13:19:08', 0, '测试供应商类型1', 'li.bing', '021-00000000', '155555555', NULL, '');

-- ----------------------------
-- Table structure for erp_trade_delivery
-- ----------------------------
DROP TABLE IF EXISTS `erp_trade_delivery`;
CREATE TABLE `erp_trade_delivery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `cod` int(11) NOT NULL DEFAULT 1,
  `wms_sort_order_id` int(11) NULL DEFAULT NULL,
  `platFormCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `planDeliveryCode` datetime(0) NULL DEFAULT NULL,
  `buyerMemo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverZip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wareHouseCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifyDate` datetime(0) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trade_delivery_id` int(11) NULL DEFAULT NULL,
  `deliveryOrderNum` int(11) NULL DEFAULT 0,
  `deliveryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waveSortNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_trade_delivery
-- ----------------------------
INSERT INTO `erp_trade_delivery` VALUES (1, 'SDO154587179735', 1.00, 0, NULL, NULL, NULL, NULL, '湖南省娄底市', '121454', '17716772730', '417009', '金井小区，41栋', '湖南省-长沙市-雨花区', 'changsha_sub_ware_1', '2019-09-16 18:39:34', NULL, NULL, 0, NULL, NULL);
INSERT INTO `erp_trade_delivery` VALUES (2, 'SDO154835753289', 1.00, 0, NULL, NULL, NULL, NULL, 'lxc', '12321', '13333333333', '47000', 'raf', '北京-北京市-东城区', 'changsha_sub_ware_1', '2019-09-17 14:53:58', NULL, NULL, 0, NULL, NULL);
INSERT INTO `erp_trade_delivery` VALUES (4, 'test0000002', 1.00, 0, NULL, NULL, NULL, NULL, '李三', '', '1888888888', '', '我哪里知道我只是测试', NULL, 'ck-1', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `erp_trade_delivery` VALUES (5, 'test0000003', 1.00, 0, NULL, NULL, NULL, NULL, '李三', '', '1888888888', '', '我哪里知道我只是测试', NULL, 'ck-1', NULL, NULL, NULL, 1, '125312351235', NULL);

-- ----------------------------
-- Table structure for erp_trade_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS `erp_trade_delivery_detail`;
CREATE TABLE `erp_trade_delivery_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_delivery_id` int(11) NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_trade_delivery_detail
-- ----------------------------
INSERT INTO `erp_trade_delivery_detail` VALUES (1, 4, 1.00, 4);
INSERT INTO `erp_trade_delivery_detail` VALUES (2, 4, 1.00, 2);
INSERT INTO `erp_trade_delivery_detail` VALUES (3, 4, 1.00, 3);
INSERT INTO `erp_trade_delivery_detail` VALUES (4, 4, 1.00, 1);
INSERT INTO `erp_trade_delivery_detail` VALUES (5, 4, 1.00, 5);
INSERT INTO `erp_trade_delivery_detail` VALUES (6, 5, 1.00, 2);
INSERT INTO `erp_trade_delivery_detail` VALUES (7, 5, 1.00, 5);
INSERT INTO `erp_trade_delivery_detail` VALUES (8, 5, 1.00, 4);
INSERT INTO `erp_trade_delivery_detail` VALUES (9, 5, 1.00, 4);

-- ----------------------------
-- Table structure for goods_box
-- ----------------------------
DROP TABLE IF EXISTS `goods_box`;
CREATE TABLE `goods_box`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ware_house_id` int(11) NULL DEFAULT NULL,
  `cargo_area_id` int(11) NULL DEFAULT NULL,
  `shelf_location_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `isOccupy` int(11) NOT NULL DEFAULT 0,
  `boxType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NORMAL',
  `isDelete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_box
-- ----------------------------
INSERT INTO `goods_box` VALUES (1, '153125', 3, 1, 4, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (2, '1342134', 3, 1, 1, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (3, '161465', 3, 1, 2, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (4, '1353266', 3, 1, 6, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (5, '164314', 3, 1, 3, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (6, '16436', 3, 1, 5, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (7, '13463513454', 3, 1, NULL, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (8, '6143646257', 3, 1, 7, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (9, '215235', 3, 2, NULL, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (10, '1436436', 3, 2, NULL, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (11, 'dsfa', 3, 2, NULL, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (12, 'gjf', 3, 2, NULL, 0, 0, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (13, '12353', 3, 2, NULL, 0, 1, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (14, '51325', 3, 1, NULL, 0, 1, 'NORMAL', 0);
INSERT INTO `goods_box` VALUES (15, '132532', 3, 3, NULL, 0, 1, 'NORMAL', 0);

-- ----------------------------
-- Table structure for goods_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_box_detail`;
CREATE TABLE `goods_box_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_box_id` int(11) NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` int(11) NULL DEFAULT NULL,
  `batchNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storageTime` datetime(0) NULL DEFAULT NULL,
  `supplierCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erpTradeDeliveryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_box_detail
-- ----------------------------
INSERT INTO `goods_box_detail` VALUES (1, 2, 10.00, 3, 'PO143889843885', '2019-09-20 09:40:17', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (2, 2, 10.00, 2, 'PO143889843885', '2019-09-20 09:40:17', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (3, 3, 10.00, 2, 'PO143889843885', '2019-09-20 09:40:18', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (4, 3, 10.00, 3, 'PO143889843885', '2019-09-20 09:40:18', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (5, 6, 0.00, 4, 'PO154067655227', '2019-09-20 09:42:34', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (6, 1, 1.00, 1, 'PO154067655227', '2019-09-20 09:42:59', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (7, 5, 0.00, 2, 'PO154067655227', '2019-09-20 09:43:26', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (8, 4, 24.00, 5, 'PO155767653217', '2019-09-20 09:50:32', 'gys-1', NULL);
INSERT INTO `goods_box_detail` VALUES (9, 7, 1.00, 4, NULL, '2019-09-20 10:06:34', NULL, 'test0000003');
INSERT INTO `goods_box_detail` VALUES (10, 7, 1.00, 5, NULL, '2019-09-20 10:06:34', NULL, 'test0000003');
INSERT INTO `goods_box_detail` VALUES (11, 7, 1.00, 2, NULL, '2019-09-20 10:06:34', NULL, 'test0000003');
INSERT INTO `goods_box_detail` VALUES (12, 8, 25.00, 1, 'PO154835787206', '2019-09-20 10:37:42', 'gys-1', NULL);

-- ----------------------------
-- Table structure for item_station
-- ----------------------------
DROP TABLE IF EXISTS `item_station`;
CREATE TABLE `item_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `stationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作台类型',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `maxCache` int(11) NULL DEFAULT NULL COMMENT '最大缓冲数',
  `pendingStatus` int(11) NOT NULL DEFAULT 0,
  `curCaheNum` int(11) NULL DEFAULT 0,
  `iLocation` int(11) NULL DEFAULT NULL,
  `iTrackArriveTime` int(11) NULL DEFAULT 0,
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '串口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_station
-- ----------------------------
INSERT INTO `item_station` VALUES (1, '拣货台', 'PICK', 1, 14, 0, NULL, 5, 0, NULL);

-- ----------------------------
-- Table structure for item_station_item_detail
-- ----------------------------
DROP TABLE IF EXISTS `item_station_item_detail`;
CREATE TABLE `item_station_item_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_station_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `supplierCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batchNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'code',
  `startWightTime` datetime(0) NULL DEFAULT NULL,
  `endWeightTime` datetime(0) NULL DEFAULT NULL,
  `sortingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NORMAL',
  `status` int(11) NULL DEFAULT 1,
  `createTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_execution
-- ----------------------------
DROP TABLE IF EXISTS `process_execution`;
CREATE TABLE `process_execution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `confirm_time` timestamp(0) NULL DEFAULT NULL,
  `next_task_id` int(11) NULL DEFAULT NULL,
  `pre_task_id` int(11) NULL DEFAULT NULL,
  `process_instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_instance
-- ----------------------------
DROP TABLE IF EXISTS `process_instance`;
CREATE TABLE `process_instance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `schedule_version` int(11) NOT NULL,
  `purchase_id` bigint(20) NULL DEFAULT NULL,
  `sort_order_id` bigint(20) NULL DEFAULT NULL,
  `schedule_process_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_schedule
-- ----------------------------
DROP TABLE IF EXISTS `process_schedule`;
CREATE TABLE `process_schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pre_task_id` int(11) NULL DEFAULT NULL,
  `next_task_id` int(11) NULL DEFAULT NULL,
  `process_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shelf_location
-- ----------------------------
DROP TABLE IF EXISTS `shelf_location`;
CREATE TABLE `shelf_location`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iRow` int(11) NOT NULL,
  `iColumn` int(11) NOT NULL,
  `iLayer` int(11) NOT NULL,
  `cargo_area_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `isOccupy` int(11) NOT NULL DEFAULT 0,
  `cranel` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shelf_location
-- ----------------------------
INSERT INTO `shelf_location` VALUES (1, 'HW-1-1-1-20190919160526', 0, 0, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (2, 'HW-1-1-2-20190919160526', 0, 0, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (3, 'HW-1-1-3-20190919160526', 0, 0, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (4, 'HW-1-1-4-20190919160526', 0, 0, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (5, 'HW-1-1-5-20190919160526', 0, 0, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (6, 'HW-1-1-6-20190919160526', 0, 0, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (7, 'HW-1-1-7-20190919160526', 0, 0, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (8, 'HW-1-1-8-20190919160526', 0, 0, 7, 1, 1, 0, 1);
INSERT INTO `shelf_location` VALUES (9, 'HW-1-1-9-20190919160526', 0, 0, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (10, 'HW-1-1-10-20190919160526', 0, 0, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (11, 'HW-1-1-11-20190919160526', 0, 0, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (12, 'HW-1-1-12-20190919160526', 0, 0, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (13, 'HW-1-2-1-20190919160526', 0, 1, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (14, 'HW-1-2-2-20190919160526', 0, 1, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (15, 'HW-1-2-3-20190919160526', 0, 1, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (16, 'HW-1-2-4-20190919160526', 0, 1, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (17, 'HW-1-2-5-20190919160526', 0, 1, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (18, 'HW-1-2-6-20190919160526', 0, 1, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (19, 'HW-1-2-7-20190919160526', 0, 1, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (20, 'HW-1-2-8-20190919160526', 0, 1, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (21, 'HW-1-2-9-20190919160526', 0, 1, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (22, 'HW-1-2-10-20190919160526', 0, 1, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (23, 'HW-1-2-11-20190919160526', 0, 1, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (24, 'HW-1-2-12-20190919160526', 0, 1, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (25, 'HW-1-3-1-20190919160526', 0, 2, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (26, 'HW-1-3-2-20190919160526', 0, 2, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (27, 'HW-1-3-3-20190919160526', 0, 2, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (28, 'HW-1-3-4-20190919160526', 0, 2, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (29, 'HW-1-3-5-20190919160526', 0, 2, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (30, 'HW-1-3-6-20190919160526', 0, 2, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (31, 'HW-1-3-7-20190919160526', 0, 2, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (32, 'HW-1-3-8-20190919160526', 0, 2, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (33, 'HW-1-3-9-20190919160526', 0, 2, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (34, 'HW-1-3-10-20190919160526', 0, 2, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (35, 'HW-1-3-11-20190919160526', 0, 2, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (36, 'HW-1-3-12-20190919160526', 0, 2, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (37, 'HW-1-4-1-20190919160526', 0, 3, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (38, 'HW-1-4-2-20190919160526', 0, 3, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (39, 'HW-1-4-3-20190919160526', 0, 3, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (40, 'HW-1-4-4-20190919160526', 0, 3, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (41, 'HW-1-4-5-20190919160526', 0, 3, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (42, 'HW-1-4-6-20190919160526', 0, 3, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (43, 'HW-1-4-7-20190919160526', 0, 3, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (44, 'HW-1-4-8-20190919160526', 0, 3, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (45, 'HW-1-4-9-20190919160526', 0, 3, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (46, 'HW-1-4-10-20190919160526', 0, 3, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (47, 'HW-1-4-11-20190919160526', 0, 3, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (48, 'HW-1-4-12-20190919160526', 0, 3, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (49, 'HW-2-1-1-20190919160526', 1, 0, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (50, 'HW-2-1-2-20190919160526', 1, 0, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (51, 'HW-2-1-3-20190919160526', 1, 0, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (52, 'HW-2-1-4-20190919160526', 1, 0, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (53, 'HW-2-1-5-20190919160526', 1, 0, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (54, 'HW-2-1-6-20190919160526', 1, 0, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (55, 'HW-2-1-7-20190919160526', 1, 0, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (56, 'HW-2-1-8-20190919160526', 1, 0, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (57, 'HW-2-1-9-20190919160526', 1, 0, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (58, 'HW-2-1-10-20190919160526', 1, 0, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (59, 'HW-2-1-11-20190919160526', 1, 0, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (60, 'HW-2-1-12-20190919160526', 1, 0, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (61, 'HW-2-2-1-20190919160526', 1, 1, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (62, 'HW-2-2-2-20190919160526', 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (63, 'HW-2-2-3-20190919160526', 1, 1, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (64, 'HW-2-2-4-20190919160526', 1, 1, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (65, 'HW-2-2-5-20190919160526', 1, 1, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (66, 'HW-2-2-6-20190919160526', 1, 1, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (67, 'HW-2-2-7-20190919160526', 1, 1, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (68, 'HW-2-2-8-20190919160526', 1, 1, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (69, 'HW-2-2-9-20190919160526', 1, 1, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (70, 'HW-2-2-10-20190919160526', 1, 1, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (71, 'HW-2-2-11-20190919160526', 1, 1, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (72, 'HW-2-2-12-20190919160526', 1, 1, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (73, 'HW-2-3-1-20190919160526', 1, 2, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (74, 'HW-2-3-2-20190919160526', 1, 2, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (75, 'HW-2-3-3-20190919160526', 1, 2, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (76, 'HW-2-3-4-20190919160526', 1, 2, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (77, 'HW-2-3-5-20190919160526', 1, 2, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (78, 'HW-2-3-6-20190919160526', 1, 2, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (79, 'HW-2-3-7-20190919160526', 1, 2, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (80, 'HW-2-3-8-20190919160526', 1, 2, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (81, 'HW-2-3-9-20190919160526', 1, 2, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (82, 'HW-2-3-10-20190919160526', 1, 2, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (83, 'HW-2-3-11-20190919160526', 1, 2, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (84, 'HW-2-3-12-20190919160526', 1, 2, 11, 1, 1, 0, 1);
INSERT INTO `shelf_location` VALUES (85, 'HW-2-4-1-20190919160526', 1, 3, 0, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (86, 'HW-2-4-2-20190919160526', 1, 3, 1, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (87, 'HW-2-4-3-20190919160526', 1, 3, 2, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (88, 'HW-2-4-4-20190919160526', 1, 3, 3, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (89, 'HW-2-4-5-20190919160526', 1, 3, 4, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (90, 'HW-2-4-6-20190919160526', 1, 3, 5, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (91, 'HW-2-4-7-20190919160526', 1, 3, 6, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (92, 'HW-2-4-8-20190919160526', 1, 3, 7, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (93, 'HW-2-4-9-20190919160526', 1, 3, 8, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (94, 'HW-2-4-10-20190919160526', 1, 3, 9, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (95, 'HW-2-4-11-20190919160526', 1, 3, 10, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (96, 'HW-2-4-12-20190919160526', 1, 3, 11, 1, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (97, 'HW-1-5-1-20190919160536', 0, 4, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (98, 'HW-1-5-2-20190919160536', 0, 4, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (99, 'HW-1-5-3-20190919160536', 0, 4, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (100, 'HW-1-5-4-20190919160536', 0, 4, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (101, 'HW-1-5-5-20190919160536', 0, 4, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (102, 'HW-1-5-6-20190919160536', 0, 4, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (103, 'HW-1-5-7-20190919160536', 0, 4, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (104, 'HW-1-5-8-20190919160536', 0, 4, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (105, 'HW-1-5-9-20190919160536', 0, 4, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (106, 'HW-1-5-10-20190919160536', 0, 4, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (107, 'HW-1-5-11-20190919160536', 0, 4, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (108, 'HW-1-5-12-20190919160536', 0, 4, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (109, 'HW-1-6-1-20190919160536', 0, 5, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (110, 'HW-1-6-2-20190919160536', 0, 5, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (111, 'HW-1-6-3-20190919160536', 0, 5, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (112, 'HW-1-6-4-20190919160536', 0, 5, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (113, 'HW-1-6-5-20190919160536', 0, 5, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (114, 'HW-1-6-6-20190919160536', 0, 5, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (115, 'HW-1-6-7-20190919160536', 0, 5, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (116, 'HW-1-6-8-20190919160536', 0, 5, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (117, 'HW-1-6-9-20190919160536', 0, 5, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (118, 'HW-1-6-10-20190919160536', 0, 5, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (119, 'HW-1-6-11-20190919160536', 0, 5, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (120, 'HW-1-6-12-20190919160536', 0, 5, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (121, 'HW-1-7-1-20190919160536', 0, 6, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (122, 'HW-1-7-2-20190919160536', 0, 6, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (123, 'HW-1-7-3-20190919160536', 0, 6, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (124, 'HW-1-7-4-20190919160536', 0, 6, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (125, 'HW-1-7-5-20190919160536', 0, 6, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (126, 'HW-1-7-6-20190919160536', 0, 6, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (127, 'HW-1-7-7-20190919160536', 0, 6, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (128, 'HW-1-7-8-20190919160536', 0, 6, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (129, 'HW-1-7-9-20190919160536', 0, 6, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (130, 'HW-1-7-10-20190919160536', 0, 6, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (131, 'HW-1-7-11-20190919160536', 0, 6, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (132, 'HW-1-7-12-20190919160536', 0, 6, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (133, 'HW-1-8-1-20190919160536', 0, 7, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (134, 'HW-1-8-2-20190919160536', 0, 7, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (135, 'HW-1-8-3-20190919160536', 0, 7, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (136, 'HW-1-8-4-20190919160536', 0, 7, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (137, 'HW-1-8-5-20190919160536', 0, 7, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (138, 'HW-1-8-6-20190919160536', 0, 7, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (139, 'HW-1-8-7-20190919160536', 0, 7, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (140, 'HW-1-8-8-20190919160536', 0, 7, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (141, 'HW-1-8-9-20190919160536', 0, 7, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (142, 'HW-1-8-10-20190919160536', 0, 7, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (143, 'HW-1-8-11-20190919160536', 0, 7, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (144, 'HW-1-8-12-20190919160536', 0, 7, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (145, 'HW-1-9-1-20190919160536', 0, 8, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (146, 'HW-1-9-2-20190919160536', 0, 8, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (147, 'HW-1-9-3-20190919160536', 0, 8, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (148, 'HW-1-9-4-20190919160536', 0, 8, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (149, 'HW-1-9-5-20190919160536', 0, 8, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (150, 'HW-1-9-6-20190919160536', 0, 8, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (151, 'HW-1-9-7-20190919160536', 0, 8, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (152, 'HW-1-9-8-20190919160536', 0, 8, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (153, 'HW-1-9-9-20190919160536', 0, 8, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (154, 'HW-1-9-10-20190919160536', 0, 8, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (155, 'HW-1-9-11-20190919160536', 0, 8, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (156, 'HW-1-9-12-20190919160536', 0, 8, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (157, 'HW-2-5-1-20190919160536', 1, 4, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (158, 'HW-2-5-2-20190919160536', 1, 4, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (159, 'HW-2-5-3-20190919160536', 1, 4, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (160, 'HW-2-5-4-20190919160536', 1, 4, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (161, 'HW-2-5-5-20190919160536', 1, 4, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (162, 'HW-2-5-6-20190919160536', 1, 4, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (163, 'HW-2-5-7-20190919160536', 1, 4, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (164, 'HW-2-5-8-20190919160536', 1, 4, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (165, 'HW-2-5-9-20190919160536', 1, 4, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (166, 'HW-2-5-10-20190919160536', 1, 4, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (167, 'HW-2-5-11-20190919160536', 1, 4, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (168, 'HW-2-5-12-20190919160536', 1, 4, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (169, 'HW-2-6-1-20190919160536', 1, 5, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (170, 'HW-2-6-2-20190919160536', 1, 5, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (171, 'HW-2-6-3-20190919160536', 1, 5, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (172, 'HW-2-6-4-20190919160536', 1, 5, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (173, 'HW-2-6-5-20190919160536', 1, 5, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (174, 'HW-2-6-6-20190919160536', 1, 5, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (175, 'HW-2-6-7-20190919160536', 1, 5, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (176, 'HW-2-6-8-20190919160536', 1, 5, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (177, 'HW-2-6-9-20190919160536', 1, 5, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (178, 'HW-2-6-10-20190919160536', 1, 5, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (179, 'HW-2-6-11-20190919160536', 1, 5, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (180, 'HW-2-6-12-20190919160536', 1, 5, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (181, 'HW-2-7-1-20190919160536', 1, 6, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (182, 'HW-2-7-2-20190919160536', 1, 6, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (183, 'HW-2-7-3-20190919160536', 1, 6, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (184, 'HW-2-7-4-20190919160536', 1, 6, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (185, 'HW-2-7-5-20190919160536', 1, 6, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (186, 'HW-2-7-6-20190919160536', 1, 6, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (187, 'HW-2-7-7-20190919160536', 1, 6, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (188, 'HW-2-7-8-20190919160536', 1, 6, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (189, 'HW-2-7-9-20190919160536', 1, 6, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (190, 'HW-2-7-10-20190919160536', 1, 6, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (191, 'HW-2-7-11-20190919160536', 1, 6, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (192, 'HW-2-7-12-20190919160536', 1, 6, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (193, 'HW-2-8-1-20190919160536', 1, 7, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (194, 'HW-2-8-2-20190919160536', 1, 7, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (195, 'HW-2-8-3-20190919160536', 1, 7, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (196, 'HW-2-8-4-20190919160536', 1, 7, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (197, 'HW-2-8-5-20190919160536', 1, 7, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (198, 'HW-2-8-6-20190919160536', 1, 7, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (199, 'HW-2-8-7-20190919160536', 1, 7, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (200, 'HW-2-8-8-20190919160536', 1, 7, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (201, 'HW-2-8-9-20190919160536', 1, 7, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (202, 'HW-2-8-10-20190919160536', 1, 7, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (203, 'HW-2-8-11-20190919160536', 1, 7, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (204, 'HW-2-8-12-20190919160536', 1, 7, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (205, 'HW-2-9-1-20190919160536', 1, 8, 0, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (206, 'HW-2-9-2-20190919160536', 1, 8, 1, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (207, 'HW-2-9-3-20190919160536', 1, 8, 2, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (208, 'HW-2-9-4-20190919160536', 1, 8, 3, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (209, 'HW-2-9-5-20190919160536', 1, 8, 4, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (210, 'HW-2-9-6-20190919160536', 1, 8, 5, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (211, 'HW-2-9-7-20190919160536', 1, 8, 6, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (212, 'HW-2-9-8-20190919160536', 1, 8, 7, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (213, 'HW-2-9-9-20190919160536', 1, 8, 8, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (214, 'HW-2-9-10-20190919160536', 1, 8, 9, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (215, 'HW-2-9-11-20190919160536', 1, 8, 10, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (216, 'HW-2-9-12-20190919160536', 1, 8, 11, 2, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (217, 'HW-1-10-1-20190919160658', 0, 9, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (218, 'HW-1-10-2-20190919160658', 0, 9, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (219, 'HW-1-10-3-20190919160658', 0, 9, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (220, 'HW-1-10-4-20190919160658', 0, 9, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (221, 'HW-1-10-5-20190919160658', 0, 9, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (222, 'HW-1-10-6-20190919160658', 0, 9, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (223, 'HW-1-10-7-20190919160658', 0, 9, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (224, 'HW-1-10-8-20190919160658', 0, 9, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (225, 'HW-1-10-9-20190919160658', 0, 9, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (226, 'HW-1-10-10-20190919160658', 0, 9, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (227, 'HW-1-10-11-20190919160658', 0, 9, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (228, 'HW-1-10-12-20190919160658', 0, 9, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (229, 'HW-1-11-1-20190919160658', 0, 10, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (230, 'HW-1-11-2-20190919160658', 0, 10, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (231, 'HW-1-11-3-20190919160658', 0, 10, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (232, 'HW-1-11-4-20190919160658', 0, 10, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (233, 'HW-1-11-5-20190919160658', 0, 10, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (234, 'HW-1-11-6-20190919160658', 0, 10, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (235, 'HW-1-11-7-20190919160658', 0, 10, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (236, 'HW-1-11-8-20190919160658', 0, 10, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (237, 'HW-1-11-9-20190919160658', 0, 10, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (238, 'HW-1-11-10-20190919160658', 0, 10, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (239, 'HW-1-11-11-20190919160658', 0, 10, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (240, 'HW-1-11-12-20190919160658', 0, 10, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (241, 'HW-1-12-1-20190919160658', 0, 11, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (242, 'HW-1-12-2-20190919160658', 0, 11, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (243, 'HW-1-12-3-20190919160658', 0, 11, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (244, 'HW-1-12-4-20190919160658', 0, 11, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (245, 'HW-1-12-5-20190919160658', 0, 11, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (246, 'HW-1-12-6-20190919160658', 0, 11, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (247, 'HW-1-12-7-20190919160658', 0, 11, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (248, 'HW-1-12-8-20190919160658', 0, 11, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (249, 'HW-1-12-9-20190919160658', 0, 11, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (250, 'HW-1-12-10-20190919160658', 0, 11, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (251, 'HW-1-12-11-20190919160658', 0, 11, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (252, 'HW-1-12-12-20190919160658', 0, 11, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (253, 'HW-1-13-1-20190919160658', 0, 12, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (254, 'HW-1-13-2-20190919160658', 0, 12, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (255, 'HW-1-13-3-20190919160658', 0, 12, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (256, 'HW-1-13-4-20190919160658', 0, 12, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (257, 'HW-1-13-5-20190919160658', 0, 12, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (258, 'HW-1-13-6-20190919160658', 0, 12, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (259, 'HW-1-13-7-20190919160658', 0, 12, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (260, 'HW-1-13-8-20190919160658', 0, 12, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (261, 'HW-1-13-9-20190919160658', 0, 12, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (262, 'HW-1-13-10-20190919160658', 0, 12, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (263, 'HW-1-13-11-20190919160658', 0, 12, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (264, 'HW-1-13-12-20190919160658', 0, 12, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (265, 'HW-1-14-1-20190919160658', 0, 13, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (266, 'HW-1-14-2-20190919160658', 0, 13, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (267, 'HW-1-14-3-20190919160658', 0, 13, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (268, 'HW-1-14-4-20190919160658', 0, 13, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (269, 'HW-1-14-5-20190919160658', 0, 13, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (270, 'HW-1-14-6-20190919160658', 0, 13, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (271, 'HW-1-14-7-20190919160658', 0, 13, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (272, 'HW-1-14-8-20190919160658', 0, 13, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (273, 'HW-1-14-9-20190919160658', 0, 13, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (274, 'HW-1-14-10-20190919160658', 0, 13, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (275, 'HW-1-14-11-20190919160658', 0, 13, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (276, 'HW-1-14-12-20190919160658', 0, 13, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (277, 'HW-2-10-1-20190919160658', 1, 9, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (278, 'HW-2-10-2-20190919160658', 1, 9, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (279, 'HW-2-10-3-20190919160658', 1, 9, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (280, 'HW-2-10-4-20190919160658', 1, 9, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (281, 'HW-2-10-5-20190919160658', 1, 9, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (282, 'HW-2-10-6-20190919160658', 1, 9, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (283, 'HW-2-10-7-20190919160658', 1, 9, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (284, 'HW-2-10-8-20190919160658', 1, 9, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (285, 'HW-2-10-9-20190919160658', 1, 9, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (286, 'HW-2-10-10-20190919160658', 1, 9, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (287, 'HW-2-10-11-20190919160658', 1, 9, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (288, 'HW-2-10-12-20190919160658', 1, 9, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (289, 'HW-2-11-1-20190919160658', 1, 10, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (290, 'HW-2-11-2-20190919160658', 1, 10, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (291, 'HW-2-11-3-20190919160658', 1, 10, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (292, 'HW-2-11-4-20190919160658', 1, 10, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (293, 'HW-2-11-5-20190919160658', 1, 10, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (294, 'HW-2-11-6-20190919160658', 1, 10, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (295, 'HW-2-11-7-20190919160658', 1, 10, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (296, 'HW-2-11-8-20190919160658', 1, 10, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (297, 'HW-2-11-9-20190919160658', 1, 10, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (298, 'HW-2-11-10-20190919160658', 1, 10, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (299, 'HW-2-11-11-20190919160658', 1, 10, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (300, 'HW-2-11-12-20190919160658', 1, 10, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (301, 'HW-2-12-1-20190919160658', 1, 11, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (302, 'HW-2-12-2-20190919160658', 1, 11, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (303, 'HW-2-12-3-20190919160658', 1, 11, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (304, 'HW-2-12-4-20190919160658', 1, 11, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (305, 'HW-2-12-5-20190919160658', 1, 11, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (306, 'HW-2-12-6-20190919160658', 1, 11, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (307, 'HW-2-12-7-20190919160658', 1, 11, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (308, 'HW-2-12-8-20190919160658', 1, 11, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (309, 'HW-2-12-9-20190919160658', 1, 11, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (310, 'HW-2-12-10-20190919160658', 1, 11, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (311, 'HW-2-12-11-20190919160658', 1, 11, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (312, 'HW-2-12-12-20190919160658', 1, 11, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (313, 'HW-2-13-1-20190919160658', 1, 12, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (314, 'HW-2-13-2-20190919160658', 1, 12, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (315, 'HW-2-13-3-20190919160658', 1, 12, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (316, 'HW-2-13-4-20190919160658', 1, 12, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (317, 'HW-2-13-5-20190919160658', 1, 12, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (318, 'HW-2-13-6-20190919160658', 1, 12, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (319, 'HW-2-13-7-20190919160658', 1, 12, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (320, 'HW-2-13-8-20190919160658', 1, 12, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (321, 'HW-2-13-9-20190919160658', 1, 12, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (322, 'HW-2-13-10-20190919160658', 1, 12, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (323, 'HW-2-13-11-20190919160658', 1, 12, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (324, 'HW-2-13-12-20190919160658', 1, 12, 11, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (325, 'HW-2-14-1-20190919160658', 1, 13, 0, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (326, 'HW-2-14-2-20190919160658', 1, 13, 1, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (327, 'HW-2-14-3-20190919160658', 1, 13, 2, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (328, 'HW-2-14-4-20190919160658', 1, 13, 3, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (329, 'HW-2-14-5-20190919160658', 1, 13, 4, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (330, 'HW-2-14-6-20190919160658', 1, 13, 5, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (331, 'HW-2-14-7-20190919160658', 1, 13, 6, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (332, 'HW-2-14-8-20190919160658', 1, 13, 7, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (333, 'HW-2-14-9-20190919160658', 1, 13, 8, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (334, 'HW-2-14-10-20190919160658', 1, 13, 9, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (335, 'HW-2-14-11-20190919160658', 1, 13, 10, 3, 1, 0, 0);
INSERT INTO `shelf_location` VALUES (336, 'HW-2-14-12-20190919160658', 1, 13, 11, 3, 1, 0, 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_role`;
CREATE TABLE `sys_permission_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_role
-- ----------------------------
INSERT INTO `sys_permission_role` VALUES (1, 1, 1);
INSERT INTO `sys_permission_role` VALUES (2, 1, 2);
INSERT INTO `sys_permission_role` VALUES (3, 2, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '2', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '1', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) UNSIGNED NOT NULL,
  `sys_role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1, 1);
INSERT INTO `sys_role_user` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ID',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '123', 'super', '18616588888', 'wms@wms.com', 'xujiahui');
INSERT INTO `sys_user` VALUES (2, 'user', '1', 'normal', '18616588888', 'wms@wms.com', 'xujiahui');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `configVal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'itemFcCycle', '123', '');
INSERT INTO `system_config` VALUES (2, 'itemFcRate', '123', '');
INSERT INTO `system_config` VALUES (3, 'itemOutMaxQty', '123', '');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, '入库单确认', '2019-01-14 07:34:34', 1);
INSERT INTO `task` VALUES (2, '入库确认', '2019-08-21 19:52:10', 1);
INSERT INTO `task` VALUES (3, '出库确认', '2019-01-14 07:34:43', 1);

-- ----------------------------
-- Table structure for task_node
-- ----------------------------
DROP TABLE IF EXISTS `task_node`;
CREATE TABLE `task_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_node
-- ----------------------------
INSERT INTO `task_node` VALUES (1, '我爱你', '2019-01-14 07:34:34', 1);
INSERT INTO `task_node` VALUES (2, '', '2019-01-14 07:34:39', 1);
INSERT INTO `task_node` VALUES (3, '', '2019-01-14 07:34:43', 1);

-- ----------------------------
-- Table structure for up_shelf_policy
-- ----------------------------
DROP TABLE IF EXISTS `up_shelf_policy`;
CREATE TABLE `up_shelf_policy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_house_id` int(11) NULL DEFAULT NULL,
  `cargo_area_id` int(11) NULL DEFAULT NULL,
  `erp_purchase_id` int(11) NULL DEFAULT NULL,
  `sort_order_id` int(11) NULL DEFAULT NULL,
  `item_station_id` int(11) NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `upShelfTime` datetime(0) NULL DEFAULT NULL,
  `boxCount` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `policyType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsBoxCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for up_shelf_policy_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS `up_shelf_policy_delivery_detail`;
CREATE TABLE `up_shelf_policy_delivery_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `up_shelf_policy_id` bigint(20) UNSIGNED NOT NULL,
  `sort_order_detail_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for up_shelf_policy_detail
-- ----------------------------
DROP TABLE IF EXISTS `up_shelf_policy_detail`;
CREATE TABLE `up_shelf_policy_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_shelf_location_id` int(11) NULL DEFAULT NULL,
  `to_shelf_location_id` int(11) NULL DEFAULT NULL,
  `good_box_id` int(11) NULL DEFAULT NULL,
  `weight` decimal(12, 2) NULL DEFAULT NULL,
  `item_station_id` int(11) NULL DEFAULT NULL,
  `upShelf_policy_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '下架到工作台状态',
  `putAwayStatus` int(11) NULL DEFAULT NULL COMMENT '上架完成状态',
  `isArriveStation` int(11) NULL DEFAULT NULL,
  `isFinishRelatedItems` int(11) NULL DEFAULT NULL,
  `releaseDate` datetime(0) NULL DEFAULT NULL COMMENT 'wcs',
  `putAwayDate` datetime(0) NULL DEFAULT NULL COMMENT 'wcs',
  `emptyBoxTrack` int(11) NOT NULL DEFAULT 0,
  `arriveStationTime` datetime(0) NULL DEFAULT NULL,
  `cargo_area_id` int(11) NULL DEFAULT NULL,
  `ware_house_id` int(11) NULL DEFAULT NULL,
  `erp_purchase_id` int(11) NULL DEFAULT NULL,
  `sort_order_id` int(11) NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `policyType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsBoxCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weightAreaStatus` int(11) NULL DEFAULT 0 COMMENT '上架称重状态',
  `buffAreaStatus` int(11) NULL DEFAULT 0 COMMENT '缓冲区状态',
  `weightQty` decimal(12, 2) NULL DEFAULT NULL,
  `downWeightQty` decimal(12, 2) NULL DEFAULT NULL,
  `downWeightStatus` int(11) NULL DEFAULT 0 COMMENT '下架称重状态',
  `planRow` int(11) NULL DEFAULT NULL,
  `cargoAreaStatus` int(11) NULL DEFAULT 0 COMMENT '货区状态',
  `wave_policy_station_id` int(11) NULL DEFAULT NULL,
  `wave_policy_tms_id` int(11) NULL DEFAULT NULL,
  `delivery_task_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of up_shelf_policy_detail
-- ----------------------------
INSERT INTO `up_shelf_policy_detail` VALUES (1, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, NULL, NULL, 1, NULL, 2, 3, NULL, NULL, NULL, 0, 'DELIVERYBOX', NULL, 0, 0, NULL, NULL, 0, NULL, 0, 4, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (2, NULL, 8, 8, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:22', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:13', 0, 'EMPTYBOX', '6143646257', 2, 2, 36.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (3, NULL, 7, 7, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:21', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:16', 0, 'EMPTYBOX', '13463513454', 2, 2, 15.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (4, NULL, 3, 6, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:21', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:17', 0, 'EMPTYBOX', '16436', 2, 2, 32.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (5, NULL, 5, 5, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:20', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:17', 0, 'EMPTYBOX', '164314', 2, 2, 29.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (6, NULL, 6, 4, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:20', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:17', 0, 'EMPTYBOX', '1353266', 2, 2, 40.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (7, NULL, 1, 3, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:20', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:18', 0, 'EMPTYBOX', '161465', 2, 2, 37.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (8, NULL, 2, 2, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:19', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:18', 0, 'EMPTYBOX', '1342134', 2, 2, 36.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (9, NULL, 4, 1, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:38:19', 0, NULL, 1, 3, NULL, NULL, '2019-09-20 09:38:19', 0, 'EMPTYBOX', '153125', 2, 2, 19.00, NULL, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (10, 1, 2, 3, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:40:00', 0, '2019-09-20 09:39:07', 1, 3, 4, NULL, '2019-09-20 09:38:56', 0, 'PURCHASE', NULL, 2, 2, 27.00, 20.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (11, 2, 1, 2, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:39:58', 0, '2019-09-20 09:39:09', 1, 3, 4, NULL, '2019-09-20 09:39:00', 0, 'PURCHASE', NULL, 2, 2, 24.00, 47.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (12, 3, 3, 6, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:42:18', 0, '2019-09-20 09:40:56', 1, 3, 3, NULL, '2019-09-20 09:40:45', 0, 'PURCHASE', NULL, 2, 2, 8.00, 46.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (13, 4, 4, 1, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:42:43', 0, '2019-09-20 09:42:21', 1, 3, 3, NULL, '2019-09-20 09:42:09', 0, 'PURCHASE', NULL, 2, 2, 15.00, 11.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (14, 5, 5, 5, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:43:05', 0, '2019-09-20 09:42:22', 1, 3, 3, NULL, '2019-09-20 09:42:12', 0, 'PURCHASE', NULL, 2, 2, 5.00, 19.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (15, 6, 6, 4, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:50:15', 0, '2019-09-20 09:49:59', 1, 3, 5, NULL, '2019-09-20 09:48:48', 0, 'PURCHASE', NULL, 2, 2, 36.00, 21.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (16, 7, 7, 7, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 10:06:18', 1, '2019-09-20 09:57:04', 1, 3, NULL, NULL, NULL, 0, 'DELIVERYBOX', NULL, 2, 2, 6.00, 48.00, 2, 0, 2, 12, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (17, 5, 3, 5, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 09:57:42', 0, '2019-09-20 09:57:02', 1, 3, NULL, NULL, '2019-09-20 09:56:52', 0, 'TRADEDELIVERY', NULL, 2, 2, 31.00, 31.00, 2, 0, 2, NULL, 11, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (18, 3, 5, 6, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 10:01:03', 0, '2019-09-20 09:57:00', 1, 3, NULL, NULL, '2019-09-20 09:56:52', 0, 'TRADEDELIVERY', NULL, 2, 2, 18.00, 19.00, 2, 0, 2, NULL, 11, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (19, 6, 6, 4, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 10:01:48', 0, '2019-09-20 09:57:03', 1, 3, NULL, NULL, '2019-09-20 09:56:52', 0, 'TRADEDELIVERY', NULL, 2, 2, 7.00, 4.00, 2, 0, 2, NULL, 11, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (20, 7, NULL, 7, NULL, 1, NULL, 2, 0, 0, 0, NULL, NULL, 0, '2019-09-20 10:19:33', NULL, NULL, NULL, NULL, '2019-09-20 10:19:04', 1, 'OUTBOX', NULL, 0, 0, NULL, 14.00, 2, NULL, 0, NULL, NULL, 1);
INSERT INTO `up_shelf_policy_detail` VALUES (21, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 3, 2, NULL, '2019-09-20 10:35:54', 0, 'PURCHASE', NULL, 0, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (22, 8, 7, 8, NULL, 1, NULL, 2, 2, 0, 0, NULL, '2019-09-20 10:37:22', 0, '2019-09-20 10:37:00', 1, 3, 1, NULL, '2019-09-20 10:36:47', 0, 'PURCHASE', NULL, 2, 2, 11.00, 39.00, 2, 0, 2, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (23, NULL, NULL, 15, NULL, 1, NULL, 2, 1, 0, 0, NULL, '2019-09-20 14:44:11', 0, NULL, NULL, 3, NULL, NULL, '2019-09-20 14:44:02', 0, 'EMPTYBOX', '132532', 1, 0, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (24, NULL, NULL, 14, NULL, 1, NULL, 2, 1, 0, 0, NULL, '2019-09-20 14:45:33', 0, NULL, NULL, 3, NULL, NULL, '2019-09-20 14:45:31', 0, 'EMPTYBOX', '51325', 1, 0, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL);
INSERT INTO `up_shelf_policy_detail` VALUES (25, NULL, NULL, 13, NULL, 1, NULL, 2, 1, 0, 0, NULL, '2019-09-20 14:50:13', 0, NULL, NULL, 3, NULL, NULL, '2019-09-20 14:50:08', 0, 'EMPTYBOX', '12353', 1, 0, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for up_shelf_policy_detail_items
-- ----------------------------
DROP TABLE IF EXISTS `up_shelf_policy_detail_items`;
CREATE TABLE `up_shelf_policy_detail_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `up_shelf_policy_detail_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `qty` decimal(12, 2) NULL DEFAULT NULL,
  `erp_item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `outCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'code',
  `inCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'code',
  `arriveStationTime` datetime(0) NULL DEFAULT NULL,
  `weightTime` datetime(0) NULL DEFAULT NULL,
  `supplierCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expectQty` decimal(12, 2) NULL DEFAULT NULL,
  `parent_erp_item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sortingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NORMAL',
  `downGrade_erp_item_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of up_shelf_policy_detail_items
-- ----------------------------
INSERT INTO `up_shelf_policy_detail_items` VALUES (1, 10, 10.00, 2, NULL, 'PO143889843885', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (2, 10, 10.00, 3, NULL, 'PO143889843885', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (3, 11, 10.00, 2, NULL, 'PO143889843885', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (4, 11, 10.00, 3, NULL, 'PO143889843885', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (5, 12, 1.00, 4, NULL, 'PO154067655227', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (6, 13, 1.00, 1, NULL, 'PO154067655227', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (7, 14, 1.00, 2, NULL, 'PO154067655227', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (8, 15, 25.00, 5, NULL, 'PO155767653217', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (9, 17, 1.00, 2, 'test0000003', 'PO154067655227', NULL, NULL, 'gys-1', 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (10, 18, 1.00, 4, 'test0000003', 'PO154067655227', NULL, NULL, 'gys-1', 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (11, 19, 1.00, 5, 'test0000003', 'PO155767653217', NULL, NULL, 'gys-1', 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (12, 16, 1.00, 4, 'test0000003', NULL, NULL, NULL, NULL, 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (13, 16, 1.00, 5, 'test0000003', NULL, NULL, NULL, NULL, 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (14, 16, 1.00, 2, 'test0000003', NULL, NULL, NULL, NULL, 1.00, NULL, 'NORMAL', NULL, NULL);
INSERT INTO `up_shelf_policy_detail_items` VALUES (15, 22, 25.00, 1, NULL, 'PO154835787206', NULL, NULL, 'gys-1', NULL, NULL, 'NORMAL', NULL, NULL);

-- ----------------------------
-- Table structure for up_shelf_policy_purcahse_detail
-- ----------------------------
DROP TABLE IF EXISTS `up_shelf_policy_purcahse_detail`;
CREATE TABLE `up_shelf_policy_purcahse_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `up_shelf_policy_id` bigint(20) UNSIGNED NOT NULL,
  `erp_purchase_detail_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ware_house
-- ----------------------------
DROP TABLE IF EXISTS `ware_house`;
CREATE TABLE `ware_house`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `contactName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `contactNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `modifyDate` datetime(0) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '仓库状态',
  `iRow` int(11) NULL DEFAULT NULL COMMENT '规格行',
  `iColumn` int(11) NULL DEFAULT NULL COMMENT '规格列',
  `iLayer` int(11) NULL DEFAULT NULL COMMENT '规格层',
  `iRowTime` int(11) NULL DEFAULT 0 COMMENT '下架时间行',
  `iColumnTime` int(11) NULL DEFAULT 0 COMMENT '下架时间列',
  `iLayerTime` int(11) NULL DEFAULT 0 COMMENT '下架时间层',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ware_house
-- ----------------------------
INSERT INTO `ware_house` VALUES (1, '仓库测试1', 'ck-1', '飞虹路100号', '', '', '2019-01-20 14:17:30', '', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `ware_house` VALUES (2, '长沙总仓', 'changsha_center_ware', '麓天路99号', '绿源', '13661986893', '2019-02-15 21:45:25', '', 0, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `ware_house` VALUES (3, '长沙分仓1', 'changsha_sub_ware_1', '香樟路99号', '绿源', '13661986893', '2019-02-15 21:47:04', '', 1, 2, 14, 12, 2, 14, 12);

-- ----------------------------
-- Table structure for wave_sort_policy
-- ----------------------------
DROP TABLE IF EXISTS `wave_sort_policy`;
CREATE TABLE `wave_sort_policy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waveSortNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `item_station_id` int(11) NULL DEFAULT NULL,
  `sort_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exeOrder` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `isPending` int(11) NULL DEFAULT 0,
  `deliveryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wave_sort_policy
-- ----------------------------
INSERT INTO `wave_sort_policy` VALUES (2, '1568943024808', '2019-09-20 09:30:25', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (3, '1568943024808', '2019-09-20 09:32:23', 4, 1, 'tms', 1, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (4, '1568943024808', '2019-09-20 09:32:33', NULL, 1, 'station', NULL, 0, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (5, '1568943301718', '2019-09-20 09:35:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (6, '1568943610845', '2019-09-20 09:40:11', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (7, '1568943904404', '2019-09-20 09:45:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (8, '1568944205757', '2019-09-20 09:50:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (9, '1568944504864', '2019-09-20 09:55:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (10, '1568944531205', '2019-09-20 09:55:31', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (11, '1568944531205', '2019-09-20 09:56:08', 12, 1, 'tms', 1, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (12, '1568944531205', '2019-09-20 09:56:19', NULL, 1, 'station', NULL, 2, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (13, '1568944801819', '2019-09-20 10:00:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (14, '1568945101524', '2019-09-20 10:05:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (15, '1568945405821', '2019-09-20 10:10:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (16, '1568945704916', '2019-09-20 10:15:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (17, '1568946001977', '2019-09-20 10:20:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (18, '1568946305889', '2019-09-20 10:25:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (19, '1568946604133', '2019-09-20 10:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (20, '1568946905886', '2019-09-20 10:35:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (21, '1568947204599', '2019-09-20 10:40:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (22, '1568947500937', '2019-09-20 10:45:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (23, '1568947801637', '2019-09-20 10:50:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (24, '1568948101277', '2019-09-20 10:55:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (25, '1568948406111', '2019-09-20 11:00:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (26, '1568948706284', '2019-09-20 11:05:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (27, '1568949004550', '2019-09-20 11:10:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (28, '1568960701422', '2019-09-20 14:25:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (29, '1568961004432', '2019-09-20 14:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (30, '1568961305418', '2019-09-20 14:35:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (31, '1568961604556', '2019-09-20 14:40:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (32, '1568961901573', '2019-09-20 14:45:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (33, '1568962201660', '2019-09-20 14:50:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (34, '1568964604083', '2019-09-20 15:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (35, '1568964901483', '2019-09-20 15:35:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (36, '1568965211791', '2019-09-20 15:40:12', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (37, '1568965506212', '2019-09-20 15:45:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (38, '1568965801029', '2019-09-20 15:50:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (39, '1568966104726', '2019-09-20 15:55:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (40, '1568966405725', '2019-09-20 16:00:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (41, '1568966704836', '2019-09-20 16:05:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (42, '1568967001379', '2019-09-20 16:10:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (43, '1568967305143', '2019-09-20 16:15:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (44, '1568967607791', '2019-09-20 16:20:08', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (45, '1568967901394', '2019-09-20 16:25:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (46, '1568970301359', '2019-09-20 17:05:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (47, '1568970604450', '2019-09-20 17:10:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (48, '1568970904577', '2019-09-20 17:15:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (49, '1568971209628', '2019-09-20 17:20:10', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (50, '1568971504928', '2019-09-20 17:25:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (51, '1568971801229', '2019-09-20 17:30:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (52, '1568972104478', '2019-09-20 17:35:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (53, '1568972401094', '2019-09-20 17:40:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (54, '1568972706775', '2019-09-20 17:45:07', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (55, '1568973005148', '2019-09-20 17:50:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (56, '1568973301902', '2019-09-20 17:55:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (57, '1568973610252', '2019-09-20 18:00:10', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (58, '1568973904434', '2019-09-20 18:05:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (59, '1568974204781', '2019-09-20 18:10:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (60, '1568974501435', '2019-09-20 18:15:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (61, '1568974805013', '2019-09-20 18:20:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (62, '1568975104317', '2019-09-20 18:25:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (63, '1568975404041', '2019-09-20 18:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (64, '1568975704095', '2019-09-20 18:35:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (65, '1568976010308', '2019-09-20 18:40:10', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (66, '1568976300786', '2019-09-20 18:45:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (67, '1568977764530', '2019-09-20 19:09:25', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (68, '1568977800908', '2019-09-20 19:10:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (69, '1568978104604', '2019-09-20 19:15:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (70, '1568978410564', '2019-09-20 19:20:11', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (71, '1568978705319', '2019-09-20 19:25:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (72, '1568979005170', '2019-09-20 19:30:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (73, '1568979304041', '2019-09-20 19:35:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (74, '1568979609901', '2019-09-20 19:40:10', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (75, '1568979905094', '2019-09-20 19:45:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (76, '1568980200987', '2019-09-20 19:50:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (77, '1568980501327', '2019-09-20 19:55:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (78, '1568980801502', '2019-09-20 20:00:02', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (79, '1568981101337', '2019-09-20 20:05:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (80, '1568981404655', '2019-09-20 20:10:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (81, '1568981701373', '2019-09-20 20:15:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (82, '1568982006017', '2019-09-20 20:20:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (83, '1568982304594', '2019-09-20 20:25:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (84, '1568982604388', '2019-09-20 20:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (85, '1568982901111', '2019-09-20 20:35:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (86, '1568983205353', '2019-09-20 20:40:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (87, '1568983500999', '2019-09-20 20:45:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (88, '1568983800901', '2019-09-20 20:50:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (89, '1568984105149', '2019-09-20 20:55:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (90, '1568984405076', '2019-09-20 21:00:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (91, '1568984704230', '2019-09-20 21:05:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (92, '1568985005198', '2019-09-20 21:10:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (93, '1568985300780', '2019-09-20 21:15:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (94, '1568985601041', '2019-09-20 21:20:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (95, '1568985904276', '2019-09-20 21:25:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (96, '1568986204091', '2019-09-20 21:30:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (97, '1568986504115', '2019-09-20 21:35:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (98, '1568986809493', '2019-09-20 21:40:09', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (99, '1568987100967', '2019-09-20 21:45:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (100, '1568987404251', '2019-09-20 21:50:04', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (101, '1568987701181', '2019-09-20 21:55:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (102, '1568988009177', '2019-09-20 22:00:09', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (103, '1568988305712', '2019-09-20 22:05:06', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (104, '1568988601110', '2019-09-20 22:10:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (105, '1568988900903', '2019-09-20 22:15:01', NULL, NULL, 'erp', NULL, NULL, 0, NULL);
INSERT INTO `wave_sort_policy` VALUES (106, '1568989204936', '2019-09-20 22:20:05', NULL, NULL, 'erp', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for wave_sort_policy_trade_delivery
-- ----------------------------
DROP TABLE IF EXISTS `wave_sort_policy_trade_delivery`;
CREATE TABLE `wave_sort_policy_trade_delivery`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `policy_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `delivery_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wave_sort_policy_trade_delivery
-- ----------------------------
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (4, 2, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (5, 3, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (6, 5, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (7, 5, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (8, 5, 3);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (9, 5, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (10, 6, 3);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (11, 6, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (12, 6, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (13, 6, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (14, 7, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (15, 7, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (16, 7, 3);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (17, 7, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (18, 8, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (19, 8, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (20, 8, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (21, 9, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (22, 9, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (23, 9, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (24, 9, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (25, 10, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (26, 11, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (27, 13, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (28, 13, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (29, 13, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (30, 13, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (31, 14, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (32, 14, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (33, 14, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (34, 14, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (35, 15, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (36, 15, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (37, 15, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (38, 15, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (39, 16, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (40, 16, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (41, 16, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (42, 16, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (43, 17, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (44, 17, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (45, 17, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (46, 17, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (47, 18, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (48, 18, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (49, 18, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (50, 18, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (51, 19, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (52, 19, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (53, 19, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (54, 19, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (55, 20, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (56, 20, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (57, 20, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (58, 20, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (59, 21, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (60, 21, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (61, 21, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (62, 21, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (63, 22, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (64, 22, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (65, 22, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (66, 22, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (67, 23, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (68, 23, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (69, 23, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (70, 23, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (71, 24, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (72, 24, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (73, 24, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (74, 24, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (75, 25, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (76, 25, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (77, 25, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (78, 25, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (79, 26, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (80, 26, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (81, 26, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (82, 26, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (83, 27, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (84, 27, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (85, 27, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (86, 27, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (87, 28, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (88, 28, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (89, 28, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (90, 28, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (91, 29, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (92, 29, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (93, 29, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (94, 29, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (95, 30, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (96, 30, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (97, 30, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (98, 30, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (99, 31, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (100, 31, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (101, 31, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (102, 31, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (103, 32, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (104, 32, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (105, 32, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (106, 32, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (107, 33, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (108, 33, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (109, 33, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (110, 33, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (111, 34, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (112, 34, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (113, 34, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (114, 34, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (115, 35, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (116, 35, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (117, 35, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (118, 35, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (119, 36, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (120, 36, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (121, 36, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (122, 36, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (123, 37, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (124, 37, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (125, 37, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (126, 37, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (127, 38, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (128, 38, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (129, 38, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (130, 38, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (131, 39, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (132, 39, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (133, 39, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (134, 39, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (135, 40, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (136, 40, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (137, 40, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (138, 40, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (139, 41, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (140, 41, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (141, 41, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (142, 41, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (143, 42, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (144, 42, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (145, 42, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (146, 42, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (147, 43, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (148, 43, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (149, 43, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (150, 43, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (151, 44, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (152, 44, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (153, 44, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (154, 44, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (155, 45, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (156, 45, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (157, 45, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (158, 45, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (159, 46, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (160, 46, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (161, 46, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (162, 46, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (163, 47, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (164, 47, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (165, 47, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (166, 47, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (167, 48, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (168, 48, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (169, 48, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (170, 48, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (171, 49, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (172, 49, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (173, 49, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (174, 49, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (175, 50, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (176, 50, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (177, 50, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (178, 50, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (179, 51, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (180, 51, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (181, 51, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (182, 51, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (183, 52, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (184, 52, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (185, 52, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (186, 52, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (187, 53, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (188, 53, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (189, 53, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (190, 53, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (191, 54, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (192, 54, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (193, 54, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (194, 54, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (195, 55, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (196, 55, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (197, 55, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (198, 55, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (199, 56, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (200, 56, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (201, 56, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (202, 56, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (203, 57, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (204, 57, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (205, 57, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (206, 57, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (207, 58, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (208, 58, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (209, 58, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (210, 58, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (211, 59, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (212, 59, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (213, 59, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (214, 59, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (215, 60, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (216, 60, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (217, 60, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (218, 60, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (219, 61, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (220, 61, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (221, 61, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (222, 61, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (223, 62, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (224, 62, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (225, 62, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (226, 62, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (227, 63, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (228, 63, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (229, 63, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (230, 63, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (231, 64, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (232, 64, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (233, 64, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (234, 64, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (235, 65, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (236, 65, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (237, 65, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (238, 65, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (239, 66, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (240, 66, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (241, 66, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (242, 66, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (243, 67, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (244, 67, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (245, 67, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (246, 67, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (247, 68, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (248, 68, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (249, 68, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (250, 68, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (251, 69, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (252, 69, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (253, 69, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (254, 69, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (255, 70, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (256, 70, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (257, 70, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (258, 70, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (259, 71, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (260, 71, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (261, 71, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (262, 71, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (263, 72, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (264, 72, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (265, 72, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (266, 72, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (267, 73, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (268, 73, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (269, 73, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (270, 73, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (271, 74, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (272, 74, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (273, 74, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (274, 74, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (275, 75, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (276, 75, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (277, 75, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (278, 75, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (279, 76, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (280, 76, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (281, 76, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (282, 76, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (283, 77, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (284, 77, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (285, 77, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (286, 77, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (287, 78, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (288, 78, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (289, 78, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (290, 78, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (291, 79, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (292, 79, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (293, 79, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (294, 79, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (295, 80, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (296, 80, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (297, 80, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (298, 80, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (299, 81, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (300, 81, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (301, 81, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (302, 81, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (303, 82, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (304, 82, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (305, 82, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (306, 82, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (307, 83, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (308, 83, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (309, 83, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (310, 83, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (311, 84, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (312, 84, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (313, 84, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (314, 84, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (315, 85, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (316, 85, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (317, 85, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (318, 85, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (319, 86, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (320, 86, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (321, 86, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (322, 86, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (323, 87, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (324, 87, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (325, 87, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (326, 87, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (327, 88, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (328, 88, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (329, 88, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (330, 88, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (331, 89, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (332, 89, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (333, 89, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (334, 89, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (335, 90, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (336, 90, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (337, 90, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (338, 90, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (339, 91, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (340, 91, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (341, 91, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (342, 91, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (343, 92, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (344, 92, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (345, 92, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (346, 92, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (347, 93, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (348, 93, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (349, 93, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (350, 93, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (351, 94, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (352, 94, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (353, 94, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (354, 94, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (355, 95, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (356, 95, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (357, 95, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (358, 95, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (359, 96, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (360, 96, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (361, 96, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (362, 96, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (363, 97, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (364, 97, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (365, 97, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (366, 97, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (367, 98, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (368, 98, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (369, 98, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (370, 98, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (371, 99, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (372, 99, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (373, 99, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (374, 99, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (375, 100, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (376, 100, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (377, 100, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (378, 100, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (379, 101, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (380, 101, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (381, 101, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (382, 101, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (383, 102, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (384, 102, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (385, 102, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (386, 102, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (387, 103, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (388, 103, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (389, 103, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (390, 103, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (391, 104, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (392, 104, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (393, 104, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (394, 104, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (395, 105, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (396, 105, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (397, 105, 5);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (398, 105, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (399, 106, 4);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (400, 106, 1);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (401, 106, 2);
INSERT INTO `wave_sort_policy_trade_delivery` VALUES (402, 106, 5);

-- ----------------------------
-- Table structure for wms_cron
-- ----------------------------
DROP TABLE IF EXISTS `wms_cron`;
CREATE TABLE `wms_cron`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '计时器id',
  `cronId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计时器编码',
  `cron` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_cron
-- ----------------------------
INSERT INTO `wms_cron` VALUES (1, 'PURCHASE', '0 0/4 * * * ?', 'purchase');
INSERT INTO `wms_cron` VALUES (2, 'DELIVERY', '0 0/5 * * * ?', 'delivery');
INSERT INTO `wms_cron` VALUES (3, 'WAVEPOLICY', '0 0/5 * * * ?', 'WAVEPOLICY');

-- ----------------------------
-- Table structure for wms_delivery_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_delivery_task`;
CREATE TABLE `wms_delivery_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_station_id` int(11) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_delivery_task
-- ----------------------------
INSERT INTO `wms_delivery_task` VALUES (1, '125312351235', 1, '2019-09-20 10:19:04');

-- ----------------------------
-- Table structure for wms_sort_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_sort_order`;
CREATE TABLE `wms_sort_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `wcsFlag` int(11) NULL DEFAULT 0,
  `item_station_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
