/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : nodedemo

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 20/10/2021 19:50:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nodedemo_card
-- ----------------------------
DROP TABLE IF EXISTS `nodedemo_card`;
CREATE TABLE `nodedemo_card`  (
  `id` mediumint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `merchantName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `amount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `cardToken` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `merchantId` mediumint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nodedemo_card
-- ----------------------------
INSERT INTO `nodedemo_card` VALUES (4, '公司名', '20', '20210903192445813000', 1);

-- ----------------------------
-- Table structure for nodedemo_merchant
-- ----------------------------
DROP TABLE IF EXISTS `nodedemo_merchant`;
CREATE TABLE `nodedemo_merchant`  (
  `id` mediumint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merchant_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password_salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `register_time` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_time` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `register_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`merchant_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nodedemo_merchant
-- ----------------------------
INSERT INTO `nodedemo_merchant` VALUES (6, '928022763@qq.com', '新中新', 'e7b3e907df88943aff31c0007feecdb6', 'ABCDEF', 1634729708, 0, '', '', '::ffff:127.0.0.1');

SET FOREIGN_KEY_CHECKS = 1;
