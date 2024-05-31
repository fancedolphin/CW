/*
 Navicat Premium Data Transfer

 Source Server         : 562a0ff519d93661.natapp.cc_13413
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : 562a0ff519d93661.natapp.cc:13413
 Source Schema         : school_service

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 25/03/2024 22:59:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `student_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `student_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `student_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `article_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `delivery_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送达人联系方式',
  `delivery_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送达人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES (3, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, '2024-03-25 15:48:06', NULL, NULL, NULL);
INSERT INTO `delivery` VALUES (4, '1555555', '李逍遙', '16', '1333', '男', '厠所', '背景.jpg', '這只是一個測試的啊啊啊', 0.00, '2024-03-25 21:23:40', NULL, '199999', '這只是一個測試');

-- ----------------------------
-- Table structure for delivery_history
-- ----------------------------
DROP TABLE IF EXISTS `delivery_history`;
CREATE TABLE `delivery_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `student_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `student_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `student_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `article_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `delivery_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送达人联系方式',
  `delivery_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送达人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery_history
-- ----------------------------
INSERT INTO `delivery_history` VALUES (1, '202401011111', '名字', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, '2024-03-25 15:44:13', NULL, '13969699696', '王老四');
INSERT INTO `delivery_history` VALUES (2, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, '2024-03-25 15:44:35', NULL, '13969699696', '王老四');

-- ----------------------------
-- Table structure for secondhand
-- ----------------------------
DROP TABLE IF EXISTS `secondhand`;
CREATE TABLE `secondhand`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `student_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `student_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `student_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `article_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of secondhand
-- ----------------------------
INSERT INTO `secondhand` VALUES (2, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, NULL);
INSERT INTO `secondhand` VALUES (4, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', 25.00, NULL);
INSERT INTO `secondhand` VALUES (5, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', 0.01, NULL);
INSERT INTO `secondhand` VALUES (6, '名字2', '202401011111', '15', '13838384848', '男', '石头', '', '一个光滑的石头', 0.70, '2024-03-25 20:11:18');
INSERT INTO `secondhand` VALUES (10, '1111111', '测试222', '', '', '', '', '背景.jpg', '', 0.00, '2024-03-25 21:10:40');

-- ----------------------------
-- Table structure for secondhand_history
-- ----------------------------
DROP TABLE IF EXISTS `secondhand_history`;
CREATE TABLE `secondhand_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `student_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `student_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `student_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `article_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `article_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of secondhand_history
-- ----------------------------
INSERT INTO `secondhand_history` VALUES (1, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, NULL);
INSERT INTO `secondhand_history` VALUES (3, '202401011111', '名字2', '15', '13838384848', '男', '石头', '照片路径', '一个光滑的石头', NULL, NULL);
INSERT INTO `secondhand_history` VALUES (7, '1826', '这是', '', '', '', '', '', '', 0.00, '2024-03-25 20:12:38');
INSERT INTO `secondhand_history` VALUES (8, '123456', '李逍遥', '19', '18281161977', '男', '测试', '../assets/img/背景.jpg', '这是一个测试', 0.90, '2024-03-25 20:52:25');
INSERT INTO `secondhand_history` VALUES (9, '大大大', '测是', '', '', '', '', '../assets/img/背景.jpg', '', 0.50, '2024-03-25 20:55:49');
INSERT INTO `secondhand_history` VALUES (11, '15555', '李逍遥', '18', '', '男', '石头', '首页.png', '这是一个不错的石头', 0.70, '2024-03-25 21:11:51');

SET FOREIGN_KEY_CHECKS = 1;
