/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : jingsai

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 23/04/2024 20:40:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '校级管理员', '123456', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 'admin');

-- ----------------------------
-- Table structure for awards
-- ----------------------------
DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime(0) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_apply_date` datetime(6) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `awards_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3td532ajaie398knl0t5mxb46`(`project_id`) USING BTREE,
  CONSTRAINT `FK3td532ajaie398knl0t5mxb46` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of awards
-- ----------------------------

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '计算机与信息工程学院', '123456', 'c8adde47-3569-4a60-91db-ae1cc5270a92', '1212714291', '#193BE1');
INSERT INTO `college` VALUES (2, '土木工程学院', '123456', '4c3a6b9e-fcbb-4651-8951-b8927b939aa6', '546444554', '#5EA54C');
INSERT INTO `college` VALUES (3, '生命科学技术学院', '123456', '3ad2ae19-abac-4393-8420-8d30cb87ad21', '1703790869', '#E118BB');
INSERT INTO `college` VALUES (4, '物理与电子工程学院', '123456', '1188f7a8-9059-4057-b079-d80bf1330ca3', '721842408', '#F03963');
INSERT INTO `college` VALUES (5, '外国语学院', '123456', 'c2e7e424-d7f7-42b8-a548-f9ad6af8e70a', '956909296', NULL);
INSERT INTO `college` VALUES (6, '机械工程学院', '123456', '28c5950b-f3ca-4699-a22f-525a39586489', '1029801934', NULL);
INSERT INTO `college` VALUES (7, '电气工程学院', '123456', '66b95da8-232f-4ca3-8d50-8945503d766c', '39768663', NULL);
INSERT INTO `college` VALUES (8, '化学化工学院', '123456', 'c15f44a3-391d-43a3-ae44-81a3f078ce15', '1796400568', NULL);
INSERT INTO `college` VALUES (9, '智能制造学部', '123456', '5d6b23c7-70f6-4a61-93d6-70e54bf0ccf0', '1949162763', NULL);
INSERT INTO `college` VALUES (74, 'test_1', 'test_1', '943e1bd2-7bc7-495e-8119-cab3ed4c42ba', '1239868064', NULL);
INSERT INTO `college` VALUES (75, 'test_2', 'test_2', '758c152a-ee50-48c4-9012-eef420d5b299', '1922964204', NULL);
INSERT INTO `college` VALUES (76, 'test_3', 'test_3', 'a4813f42-146b-4db2-b605-c165f94a1e71', '373733814', NULL);

-- ----------------------------
-- Table structure for college_comp
-- ----------------------------
DROP TABLE IF EXISTS `college_comp`;
CREATE TABLE `college_comp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime(0) NULL DEFAULT NULL,
  `apply_or_join` int(11) NOT NULL,
  `update_apply_date` datetime(0) NULL DEFAULT NULL,
  `college_id` int(11) NULL DEFAULT NULL,
  `comp_id` int(11) NULL DEFAULT NULL,
  `show_state` bit(1) NULL DEFAULT NULL COMMENT '显示状态',
  `locked` bit(1) NULL DEFAULT NULL COMMENT '触发事件琐',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK25qgrhbumyfgs8r3cr7ky19sd`(`college_id`) USING BTREE,
  INDEX `FKj5j5by2864amy4mlkf8p7mje8`(`comp_id`) USING BTREE,
  CONSTRAINT `FK25qgrhbumyfgs8r3cr7ky19sd` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FKj5j5by2864amy4mlkf8p7mje8` FOREIGN KEY (`comp_id`) REFERENCES `comp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of college_comp
-- ----------------------------
INSERT INTO `college_comp` VALUES (157, '2024-03-30 18:26:44', 3, '2024-03-30 18:27:52', 1, 116, b'0', NULL, NULL);
INSERT INTO `college_comp` VALUES (158, '2024-03-30 18:26:46', 3, '2024-03-30 18:27:53', 1, 117, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (159, '2024-03-30 18:26:47', 3, '2024-03-30 18:27:53', 1, 118, b'0', NULL, NULL);
INSERT INTO `college_comp` VALUES (160, '2024-03-31 13:44:07', 3, '2024-04-11 22:36:32', 1, 131, b'0', NULL, NULL);
INSERT INTO `college_comp` VALUES (161, '2024-04-11 14:12:58', 0, '2024-04-11 14:12:58', 9, 132, b'0', NULL, NULL);
INSERT INTO `college_comp` VALUES (162, '2024-04-13 16:26:30', 3, '2024-04-13 16:27:09', 9, 124, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (163, '2024-04-13 18:13:47', 3, '2024-04-13 18:15:29', 1, 124, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (164, '2024-04-13 18:19:32', 1, NULL, 2, 124, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (165, '2024-04-15 15:01:41', 5, '2024-04-15 15:01:53', 8, 133, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (166, '2024-04-15 15:13:25', 3, '2024-04-15 15:13:43', 1, 134, b'1', NULL, NULL);
INSERT INTO `college_comp` VALUES (167, '2024-04-15 15:13:25', 1, NULL, 1, 133, b'1', NULL, NULL);

-- ----------------------------
-- Table structure for comp
-- ----------------------------
DROP TABLE IF EXISTS `comp`;
CREATE TABLE `comp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_apply_time` datetime(0) NULL DEFAULT NULL,
  `comp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comp_state` int(11) NULL DEFAULT NULL,
  `count_project` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `max_count_project` int(11) NULL DEFAULT NULL,
  `max_count_student` int(11) NULL DEFAULT NULL,
  `max_count_teacher` int(11) NULL DEFAULT NULL,
  `not_apply_time` datetime(0) NULL DEFAULT NULL,
  `occurrence_time` datetime(0) NULL DEFAULT NULL,
  `organizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `publish_time` datetime(0) NULL DEFAULT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visiable` bit(1) NULL DEFAULT NULL,
  `comp_disctibution` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comp_link` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comp
-- ----------------------------
INSERT INTO `comp` VALUES (116, '2024-03-23 00:00:00', 'test-3', 4, 0, 2, 100, 5, 2, '2024-04-01 00:00:00', '2024-04-02 00:00:00', 'test-3', 'test-3', '2024-03-23 02:00:58', 'test-3', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (117, '2024-03-24 00:00:00', 'test-4', 2, 0, 2, 1000, 5, 2, '2024-04-03 00:00:00', '2024-04-18 00:00:00', 'test-4', 'test-4', '2024-03-23 10:03:12', 'test-4', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (118, '2024-03-24 00:00:00', 'test-5', 4, 0, 2, 100, 5, 2, '2024-04-01 00:00:00', '2024-04-03 00:00:00', 'test-5', 'test-5', '2024-03-23 11:32:26', 'test-5', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (119, '2024-03-24 00:00:00', 'test-6', 4, 0, 2, 100, 5, 2, '2024-03-24 00:00:00', '2024-03-27 00:00:00', 'test-6', 'test-6', '2024-03-23 14:25:07', 'test-6', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (120, '2024-03-25 00:00:00', 'test-7', 4, 0, 2, 1000, 5, 2, '2024-03-26 00:00:00', '2024-03-27 00:00:00', 'test-7', 'test-7', '2024-03-23 15:17:39', 'test-7', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (121, '2024-03-23 00:00:00', 'test-8', 4, 0, 2, 523, 5, 2, '2024-03-27 00:00:00', '2024-03-29 00:00:00', 'test-8', 'test-8', '2024-03-23 02:00:58', 'test-8', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (122, '2024-03-24 00:00:00', 'test-9', 4, 0, 2, 23532, 5, 2, '2024-03-27 00:00:00', '2024-03-28 00:00:00', 'test-9', 'test-9', '2024-03-23 10:03:12', 'test-9', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (123, '2024-03-24 00:00:00', 'test-10', 4, 0, 2, 23532, 5, 2, '2024-03-27 00:00:00', '2024-03-28 00:00:00', 'test-10', 'test-10', '2024-03-23 10:03:12', 'test-10', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (124, '2024-04-13 00:00:00', 'test-11', 3, 1, 2, 1000, 5, 2, '2024-04-14 00:00:00', '2024-04-15 00:00:00', 'test-11', 'test-11', '2024-03-23 15:17:39', 'test-11', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (125, '2024-03-24 00:00:00', 'test-12', 4, 0, 2, 1000, 5, 2, '2024-03-27 00:00:00', '2024-03-28 00:00:00', 'test-12', 'test-12', '2024-03-23 10:03:12', 'test-12', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (126, '2024-03-24 00:00:00', 'test-13', 4, 0, 2, 1000, 5, 2, '2024-03-27 00:00:00', '2024-03-28 00:00:00', 'test-13', 'test-13', '2024-03-23 10:03:12', 'test-13', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (127, '2024-03-23 00:00:00', 'test-14', 4, 0, 2, 523, 5, 2, '2024-03-27 00:00:00', '2024-03-29 00:00:00', 'test-14', 'test-14', '2024-03-23 02:00:58', 'test-14', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (128, '2024-03-23 00:00:00', 'test-15', 4, 0, 2, 523, 5, 2, '2024-03-27 00:00:00', '2024-03-29 00:00:00', 'test-15', 'test-15', '2024-03-23 02:00:58', 'test-15', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (129, '2024-03-23 00:00:00', 'test-16', 4, 0, 2, 523, 5, 2, '2024-03-27 00:00:00', '2024-03-29 00:00:00', 'test-16', 'test-16', '2024-03-23 02:00:58', 'test-16', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (130, '2024-03-23 00:00:00', 'test-17', 4, 0, 2, 523, 5, 2, '2024-03-27 00:00:00', '2024-03-29 00:00:00', 'test-17', 'test-17', '2024-03-23 02:00:58', 'test-17', b'1', '111111111', '222222222');
INSERT INTO `comp` VALUES (131, '2024-04-01 00:00:00', '1', 2, 0, 2, 1, 1, 1, '2024-04-11 00:00:00', '2024-04-18 00:00:00', '1', '1', '2024-03-31 14:22:08', '1', b'1', '111111111', 'https://element.eleme.cn/#/zh-CN/component/button');
INSERT INTO `comp` VALUES (132, '2024-04-12 00:00:00', '智能制造虚部申请的竞赛', 4, 0, 2, 500, 3, 1, '2024-04-13 00:00:00', '2024-04-15 00:00:00', '智能制造学部', '实验楼603', NULL, '工科', b'0', '喜欢就来参加！', 'https://www.wyu.edu.cn/');
INSERT INTO `comp` VALUES (133, '2024-04-15 00:00:00', '1', 1, 0, 2, 1, 1, 1, '2024-04-18 00:00:00', '2024-04-24 00:00:00', '1', '1', '2024-04-15 15:01:53', '1', b'1', '1', '1');
INSERT INTO `comp` VALUES (134, '2024-04-15 00:00:00', 'test', 1, 6, 2, 3, 3, 3, '2024-04-20 00:00:00', '2024-04-24 00:00:00', 'test', '3', '2024-04-15 15:11:40', '3', b'1', '333333', 'https://learn.microsoft.com/zh-cn/microsoft-edge/devtools-guide-chromium/storage/cookies');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `if_read` bit(1) NULL DEFAULT NULL,
  `msg_date` datetime(6) NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receiver_role` int(11) NULL DEFAULT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sender_role` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (158, '管理员已同意您申请的比赛：1', b'0', '2024-04-11 22:36:31.958000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '您的比赛申请通过了！', 2);
INSERT INTO `message` VALUES (159, '智能制造学部正在申请比赛：test-11,请尽快处理！', b'0', '2024-04-13 16:26:30.494000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '5d6b23c7-70f6-4a61-93d6-70e54bf0ccf0', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (160, '智能制造学部正在申请比赛：test-11,请尽快处理！', b'0', '2024-04-13 16:26:55.092000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '5d6b23c7-70f6-4a61-93d6-70e54bf0ccf0', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (161, '管理员已同意您申请的比赛：test-11', b'0', '2024-04-13 16:27:09.217000', '5d6b23c7-70f6-4a61-93d6-70e54bf0ccf0', 2, '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '您的比赛申请通过了！', 2);
INSERT INTO `message` VALUES (162, '计算机与信息工程学院正在申请比赛：test-11,请尽快处理！', b'0', '2024-04-13 18:13:47.309000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (163, '管理员已同意您申请的比赛：test-11', b'0', '2024-04-13 18:15:28.532000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '您的比赛申请通过了！', 2);
INSERT INTO `message` VALUES (164, '土木工程学院正在申请比赛：test-11,请尽快处理！', b'0', '2024-04-13 18:19:31.525000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '4c3a6b9e-fcbb-4651-8951-b8927b939aa6', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (165, '老师1老师，用户名：445393889发出项目申请  项目名:1111，所属比赛为：test-11请尽快处理！', b'0', '2024-04-13 18:25:11.794000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (167, '老师1老师，用户名：445393889发出项目申请  项目名:你哈，所属比赛为：test-11请尽快处理！', b'0', '2024-04-13 19:34:15.814000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (168, '老师4老师，用户名：1900656401发出项目申请  项目名:fgdgsdg，所属比赛为：test-11请尽快处理！', b'0', '2024-04-13 19:34:54.436000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '9747ec05-17ff-47ba-9c9b-4a08a4ded27e', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (169, '老师4老师，用户名：1900656401发出项目申请  项目名:测试，所属比赛为：test-11请尽快处理！', b'0', '2024-04-13 19:36:00.581000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '9747ec05-17ff-47ba-9c9b-4a08a4ded27e', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (171, '计算机与信息工程学院正在申请比赛：test,请尽快处理！', b'0', '2024-04-15 15:13:24.570000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (172, '计算机与信息工程学院正在申请比赛：1,请尽快处理！', b'0', '2024-04-15 15:13:25.135000', '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '您有新的比赛申请', 0);
INSERT INTO `message` VALUES (173, '管理员已同意您申请的比赛：test', b'0', '2024-04-15 15:13:43.112000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '3f9a2ca2-ee80-43ea-b51e-3d461d55d7ad', 3, '您的比赛申请通过了！', 2);
INSERT INTO `message` VALUES (174, '老师1老师，用户名：445393889发出项目申请  项目名:test，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:14:31.109000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (177, '老师1老师，用户名：445393889同意了你的申请你已加入项目:test，所属比赛为：test', b'0', '2024-04-15 15:18:38.158000', 'be81d0c1-fc49-40f1-a910-1c6fa0db0da1', 0, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你的比赛申请已同意', 2);
INSERT INTO `message` VALUES (178, '老师1老师，用户名：445393889发出项目申请  项目名:123456，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:19:57.928000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (180, '老师1老师，用户名：445393889发出项目申请  项目名:这是新添加的竞赛组队，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:26:09.774000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (181, '老师1老师，用户名：445393889发出项目申请  项目名:这是新添加的竞赛，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:28:10.829000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (184, '老师1老师，用户名：445393889驳回了你的申请 项目:1111，所属比赛为：test-11', b'0', '2024-04-15 15:34:04.704000', '87341b63684241faaf89305b969f3812', 0, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你的比赛申请已被驳回', 1);
INSERT INTO `message` VALUES (185, '老师1老师，用户名：445393889驳回了你的申请 项目:测试是否添加成功该项目_3，所属比赛为：test-5', b'0', '2024-04-15 15:34:07.865000', 'be81d0c1-fc49-40f1-a910-1c6fa0db0da1', 0, '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '你的比赛申请已被驳回', 1);
INSERT INTO `message` VALUES (186, '老师2老师，用户名：356803480发出项目申请  项目名:这是新添加的竞赛，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:35:59.124000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '13c325f2-1b21-44a5-8029-9d21dbeddd28', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (187, '学生11同学，用户名：759084478申请加入 项目:这是新添加的竞赛组队所属比赛为：test', b'0', '2024-04-15 15:36:54.197000', '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '87341b63684241faaf89305b969f3812', 0, '你有新的成员想加入', 0);
INSERT INTO `message` VALUES (188, '老师2老师，用户名：356803480申请加入项目:这是新添加的竞赛组队所属比赛为：test', b'0', '2024-04-15 15:37:28.423000', '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', 1, '13c325f2-1b21-44a5-8029-9d21dbeddd28', 1, '你有新成员想加入', 2);
INSERT INTO `message` VALUES (189, '老师11老师，用户名：365696847发出项目申请  项目名:心婷姐++，所属比赛为：test请尽快处理！', b'0', '2024-04-15 15:42:30.518000', 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, 'ee43e8b9-9b36-4240-9494-89e8eefd4f66', 1, '你有新的项目申请', 0);
INSERT INTO `message` VALUES (190, '计算机与信息工程学院已同意您申请的项目：心婷姐++', b'0', '2024-04-15 15:43:06.442000', 'ee43e8b9-9b36-4240-9494-89e8eefd4f66', 1, 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '您的项目申请通过了！', 2);
INSERT INTO `message` VALUES (191, '计算机与信息工程学院已同意您申请的项目：这是新添加的竞赛', b'0', '2024-04-15 15:43:10.780000', '13c325f2-1b21-44a5-8029-9d21dbeddd28', 1, 'c8adde47-3569-4a60-91db-ae1cc5270a92', 2, '您的项目申请通过了！', 2);
INSERT INTO `message` VALUES (192, '学生15同学，用户名：104003050申请加入 项目:心婷姐++所属比赛为：test', b'0', '2024-04-15 15:45:30.345000', 'ee43e8b9-9b36-4240-9494-89e8eefd4f66', 1, '9c89ceb042a441319f0e45985336cf7b', 0, '你有新的成员想加入', 0);
INSERT INTO `message` VALUES (193, '老师11老师，用户名：365696847同意了你的申请你已加入项目:心婷姐++，所属比赛为：test', b'0', '2024-04-15 15:47:07.573000', '9c89ceb042a441319f0e45985336cf7b', 0, 'ee43e8b9-9b36-4240-9494-89e8eefd4f66', 1, '你的比赛申请已同意', 2);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd816ad20ht41wty5l6f85w8mb`(`admin_id`) USING BTREE,
  CONSTRAINT `FKd816ad20ht41wty5l6f85w8mb` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '这个是编辑后的公告', 100, '2024-04-04 04:07:23', '大批竞赛来袭！', '竞赛信息', 1);
INSERT INTO `notice` VALUES (2, '各参赛院校和团队：为了参赛团队能够更加准确的理解企业的赛题需求，经组委会与命题企业的积极沟通，针对学生团队关注较多的命题，特别开设企业视频直播答疑活动。', 80, '2024-04-15 13:04:19', '关于公布全国建筑业财税知识竞赛决赛规则的通知', '系统公告', 1);
INSERT INTO `notice` VALUES (3, '备赛不中断服务永在线——服创大赛组委会致参赛师生的一封信亲爱的老师、同学们：新型冠状病毒爆发以来，全国人民以团结奋斗的精神、忘我牺牲的行动投身到抗击疫情的斗争中。', 80, '2024-04-02 01:43:03', '备赛不中断 服务永在线 ——服创大赛组委会致参赛师生的一封信', '系统公告', 1);
INSERT INTO `notice` VALUES (4, '一、企业数据1、A01+A02-八维通-赛题所需数据接口注：八维通专家：A01+A02两个题目都更侧重设计，接口文档更大的意义是让同学们了解能获取到的信息有哪些。这份文档里还没有实际接口（地址），后面demo开发阶段企业会补充提供，并附上简单例程。', 80, '2024-04-15 01:43:20', 'A类赛题数据及答疑集锦（不定时更新）', '竞赛信息', 1);
INSERT INTO `notice` VALUES (5, '第十届中国大学生服务外包创新创业大赛全国赛获奖名单公告第十届中国大学生服务外包创新创业大赛全国赛获奖团队信息公示', 80, '2024-04-11 01:46:20', '第十届中国大学生服务外包创新创业大赛全国赛获奖名单公告', '荣誉墙', 1);
INSERT INTO `notice` VALUES (6, '一等奖（2人）\r\n如山夫《渐渐清晰的自我存在》(组诗)\r\n薛小平《每一块矿石 都绽放出五彩缤纷的祖国》（组诗）\r\n二等奖（4人）\r\n孙凤山《魅力：马鞍山纪事或卷轴》（组诗）\r\n詹传亭《祖国啊，我热爱你厚重的山水》（组诗）\r\n王 喜《马鞍山略记》（组诗）\r\n仝志男《经过九号高炉》（外四首）\r\n三等奖（6人）\r\n王克金《论山水》（外四首）\r\n陈忠龙《七十年：这被重用的时光，在马鞍山升值》\r\n张 萍《秋天的风》（散文）\r\n胡立森《诗城走笔》（组诗）\r\n王学建《雪中》（外二首）\r\n蒋 文《马鞍山》（组诗）', 80, '2024-04-01 01:46:14', '诗歌散文大赛获奖公告', '荣誉墙', 1);
INSERT INTO `notice` VALUES (7, '由教育部科技发展中心主办，东南大学承办的第三届“全国高校云计算应用创新大赛”全国总决赛，于2017年4月23日在南京江北新区产业技术研创园落下帷幕。我系PASA大数据实验室由郭晨、黄圣彬、黄志、姜茜四位硕士研究生同学组成的“结果很好”队，由顾荣老师指导，在技能赛中经过预赛、决赛长达半年的角逐，从128支技能赛队伍中脱颖而出，获得第1名的优异成绩，荣获大赛一等奖！这是PASA大数据实验室继2015年和2016年蝉联两届“全国云计算应用创新大赛”技能赛冠军后，连续第三次荣获该项赛事全国冠军，实现了三连冠！  ', 70, '2024-04-01 13:03:31', 'PASA大数据实验室荣获2017年全国高校计算应用创新大赛大数据技能赛冠军', '荣誉墙', 1);
INSERT INTO `notice` VALUES (8, '日前，第二届鄂尔多斯国际文化创意大赛颁奖典礼在内蒙古鄂尔多斯市国宾馆隆重举行，工业设计学院交通工具设计专业张宇同学凭借设计作品《Insect-自走式玉米青贮饲料收割机》斩获“北斗新锐奖&middot;最具创新能力设计”奖，并获得10万元的新锐设计奖奖金。', 80, '2024-04-01 01:47:18', '工业设计学院学生荣获鄂尔多斯国际文化创意大赛“北斗新锐奖”', '荣誉墙', 1);
INSERT INTO `notice` VALUES (9, '本届大奖赛自2019年9月3日发布公告至10月31日截止，共收到619幅作品报名参赛，于2019年11月下旬召开了优秀作品评审会。评审专家组由上海各高校、上海知名工业设计公司和上海电气集团的专家们组成，评审专家组本着公平、公正的原则，对这些作品进行了评选，经过初审、初评、复评和终评共四轮评审，分别评出金、银、铜、优秀奖共46个奖项。同时，根据参赛单位的作品数量与作品获奖情况，评选出10家优秀组织奖单位。', 100, '2024-04-01 01:48:05', '第十七届“上海电气杯”产品设计大奖赛获奖结果公布', '荣誉墙', 1);
INSERT INTO `notice` VALUES (10, '一直以来，我都宣称自己是有梦想的人，在固执己见的岁月流淌中，年岁渐长，大成就没有，小惊喜不断。到今天，我仍然觉得自己是个有梦想的人。也很少能说清楚自己的梦想是什么，只觉得我的人生不应该满足于现状，可以更好。这是做梦的情怀，虽然听起来有些幼稚的可笑！', 90, '2024-04-01 01:48:35', '有梦想的人，请打开心灵de门', '竞赛信息', 1);
INSERT INTO `notice` VALUES (11, '今年5月12日是我国第十个防灾减灾日，主题是“行动起来，减轻身边的灾害风险”。下面是由美文阅读网小编带来的“2019‘防灾减灾日’宣传活动总结”，欢迎阅读。\r\n\r\n　　2019“防灾减灾日”宣传活动总结\r\n\r\n　　5月7日至13日为防灾减灾宣传周。为做好防灾减灾宣传教育活动，进一步提高人民群众的防灾减灾能力水平，xx县多举措积极部署“防灾减灾日”宣传活动。', 80, '2024-04-01 01:48:54', '2019“防灾减灾日”宣传活动总结', '竞赛信息', 1);
INSERT INTO `notice` VALUES (12, '近几天总能听到回国人员的言行，令在国内封闭了两个月的人民群众动怒的新闻。你看看，我们从欧洲回来，就这种待遇?待遇不好回国干嘛，还要给你带游泳池的别墅吗?我同学这么说的。看到被挤爆的机场航站楼，很多人都表现出了不高兴，给谁纳税找谁隔离治疗去。说的有点偏激，再怎么说也是同胞，想疫情初期，旅居国外的华人把当地的口罩都买空了运回国内。同根同源，再怎么说也应该心连心，谁不把生命看得高于一切呢?', 80, '2024-04-02 01:49:17', '是人权重要还是人命重要', '荣誉墙', 1);
INSERT INTO `notice` VALUES (13, '3月17日上午，学校新冠肺炎疫情防控工作领导小组在901会议室召开专题会议（第十六次），研究审议学校疫情防控工作相关事项，学校疫情防控工作领导小组全体成员及各工作专班负责同志参加。会议由党委书记尚宝平主持。', 100, '2024-04-01 01:50:03', '学校召开新冠肺炎疫情防控工作领导小组工作会议（第十六次）', '系统公告', 1);
INSERT INTO `notice` VALUES (14, '各单位：\r\n\r\n根据《河南省人力资源和社会保障厅关于做好2020年享受国务院特殊津贴人员推荐工作的通知》（豫人社办函〔2020〕424号）文件精神和新乡市人社局的有关安排，我校开展2020年享受国务院特殊津贴人员推荐工作，请各单位高度重视，广泛宣传，积极组织相关人员认真学习文件精神，对照条件进行申报，具体要求见附件，请符合条件人员将所有申报材料统一整理成一个PDF文档，以“姓名+国贴专家”命名，电子版提交邮箱xxxyrsc@126.com，纸质版暂不提交。', 100, '2024-04-01 01:50:22', '关于做好2020年享受国务院特殊津贴人员推荐工作的通知', '系统公告', 1);
INSERT INTO `notice` VALUES (15, '根据新型冠状病毒肺炎疫情的严峻形势和教育部延迟开学的有关通知，同时为严格执行学校关于疫情防控的文件精神，决定将2020级成教新生报到的时间推迟至3月1日之后。具体报到时间请2020级新生关注学校网站和新乡学院继续教育学院微信公众号通知。', 100, '2024-04-02 01:50:36', '关于2020级成教新生延迟报到的通知', '系统公告', 1);
INSERT INTO `notice` VALUES (17, '今日起（2021年5月4日），我校新乡学院就东区餐厅食堂占座，排队拥挤，餐具乱放等不文明行为进行大力整顿，整顿内容如下：\r\n   1，学校管理员发现后上报政教处，进行处罚，更严厉者进行违规罚款\r\n   2.学生检举经查证属实，进行对应处罚', 85, '2024-04-02 03:25:26', '校园东区餐厅整顿通知', '系统公告', 1);
INSERT INTO `notice` VALUES (36, '测试功能是否能使用', 100, '2024-03-21 18:35:04', 'xingonggao', '竞赛信息', 1);
INSERT INTO `notice` VALUES (37, '信息公告新色', 100, '2024-04-15 13:04:37', '信息更改显示', '系统公告', 1);
INSERT INTO `notice` VALUES (39, '全国大学生计算机设计大赛', 100, '2024-03-21 18:34:18', '新竞赛来了', '竞赛信息', 1);
INSERT INTO `notice` VALUES (40, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', 80, '2024-03-31 18:45:20', '测试该公告添加功能', '系统公告', 1);
INSERT INTO `notice` VALUES (41, '1', 100, '2024-03-31 19:34:47', '1', '系统公告', 1);
INSERT INTO `notice` VALUES (42, '2', 100, '2024-03-31 19:34:54', '2', '系统公告', 1);
INSERT INTO `notice` VALUES (43, '3', 100, '2024-03-31 19:34:57', '3', '系统公告', 1);
INSERT INTO `notice` VALUES (44, '4', 100, '2024-03-31 19:35:01', '4', '系统公告', 1);
INSERT INTO `notice` VALUES (45, '5', 100, '2024-03-31 19:35:05', '5', '系统公告', 1);
INSERT INTO `notice` VALUES (46, '6', 100, '2024-03-31 19:36:04', '6', '系统公告', 1);
INSERT INTO `notice` VALUES (47, '7', 100, '2024-03-31 19:36:08', '7', '系统公告', 1);
INSERT INTO `notice` VALUES (48, '8', 100, '2024-03-31 19:36:11', '8', '系统公告', 1);
INSERT INTO `notice` VALUES (49, '9', 100, '2024-03-31 19:36:15', '9', '系统公告', 1);
INSERT INTO `notice` VALUES (50, '10', 100, '2024-03-31 19:36:20', '10', '系统公告', 1);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '竞赛Id',
  `apply_state` int(11) NULL DEFAULT NULL COMMENT '审核状态（0:未审核;1:审核通过;2:审核不通过）',
  `count_student` int(11) NULL DEFAULT NULL COMMENT '学生人数',
  `count_teacher` int(11) NULL DEFAULT NULL COMMENT '老师人数',
  `pay` int(11) NULL DEFAULT NULL COMMENT '团队预期耗资',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `comp_id` int(11) NULL DEFAULT NULL COMMENT '所属竞赛',
  `create_by_teacher_id` int(11) NULL DEFAULT NULL COMMENT '申请老师(带队老师)',
  `show_state` bit(1) NULL DEFAULT NULL COMMENT '显示状态',
  `locked` bit(1) NULL DEFAULT NULL COMMENT '触发事件琐',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8mhj4eusaf066fpu912vg9xok`(`comp_id`) USING BTREE,
  INDEX `FKkp8ldeiu9luu6xerj1i910t9p`(`create_by_teacher_id`) USING BTREE,
  CONSTRAINT `FK8mhj4eusaf066fpu912vg9xok` FOREIGN KEY (`comp_id`) REFERENCES `comp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkp8ldeiu9luu6xerj1i910t9p` FOREIGN KEY (`create_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (62, 1, 1, 1, 100, '测试是否添加成功该队伍_1', 116, 1, b'0', b'0');
INSERT INTO `project` VALUES (63, 1, 1, 1, 200, '测试是否添加成功该项目_2', 117, 1, b'1', b'0');
INSERT INTO `project` VALUES (64, 1, 0, 1, 3000, '测试是否添加成功该项目_3', 118, 1, b'0', b'0');
INSERT INTO `project` VALUES (65, 1, 0, 1, NULL, '1111', 124, 1, b'1', NULL);
INSERT INTO `project` VALUES (66, 0, 0, 0, 2232, '你哈', 124, 1, b'1', NULL);
INSERT INTO `project` VALUES (67, 0, 0, 0, 22, 'fgdgsdg', 124, 4, b'1', NULL);
INSERT INTO `project` VALUES (68, 0, 0, 0, 0, '测试', 124, 4, b'1', NULL);
INSERT INTO `project` VALUES (69, 1, 1, 1, 0, 'test', 134, 1, b'1', NULL);
INSERT INTO `project` VALUES (70, 1, 0, 1, 0, '123456', 134, 1, b'1', NULL);
INSERT INTO `project` VALUES (71, 1, 0, 1, 0, '这是新添加的竞赛组队', 134, 1, b'1', NULL);
INSERT INTO `project` VALUES (72, 1, 0, 1, 0, '这是新添加的竞赛', 134, 1, b'1', NULL);
INSERT INTO `project` VALUES (73, 1, 0, 1, 0, '这是新添加的竞赛', 134, 2, b'1', NULL);
INSERT INTO `project` VALUES (74, 1, 1, 1, 0, '心婷姐++', 134, 11, b'1', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `college_id` int(11) NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `skey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wx_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comp_count` int(11) NULL DEFAULT 0,
  `score` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlq9gp46xirqgtyslqs0wkowu5`(`college_id`) USING BTREE,
  CONSTRAINT `FKlq9gp46xirqgtyslqs0wkowu5` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '学生1', '123456', 'be81d0c1-fc49-40f1-a910-1c6fa0db0da1', '159951159', 1, 'o8cVh5QX4mzMW7iR6Qdfyd1rVM0Q', 'https://thirdwx.qlogo.cn/mmopen/vi_32/5Xxan9To9y7rsvHwHuyRNkCLKQOLeDiaEkqRk9WTz9OcTVQUCxgqrqyNhWcgclkmu3jsRM6VV0ibJ7xoQ3mQOc3Q/132', 1, 'AHF12+r3VOVHNpmlpujCPA==', 'ea1bb963-f5ef-4714-87fa-f089f59cf8ee', '知了', 0, 140000);
INSERT INTO `student` VALUES (2, '学生2', '123456', '53596879a20c47e497d5af0f10e4790c', '1295820856', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (3, '学生3', '123456', '470d2b6b1dd04d45859e79194c00ad0e', '2141021750', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (4, '学生4', '123456', 'cd590cc660e14c96aed42a0be723c153', '612367633', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (5, '学生5', '123456', 'db6092c07c1d4889930f59adff0d225c', '1921328235', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (6, '学生6', '123456', '70c2759b03274ee584e64e93e81a160e', '370778752', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (7, '学生7', '123456', '7179b28486e74af0aaf8b971f8c29bae', '421280866', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (8, '学生8', '123456', 'd1b1226fba8e4ae2b0947e1acfe865ea', '637143404', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (9, '学生9', '123456', 'f4a7a1a693944da485a3b03f906fa0e6', '821249590', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (10, '学生10', '123456', '1a1bc16e96494393b98abc57f0b6370b', '955816895', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (11, '学生11', '123456', '87341b63684241faaf89305b969f3812', '759084478', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (12, '学生12', '123456', '859cec7c2e5d4b9e8271439931c7ac03', '1912685673', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (13, '学生13', '123456', '4db872f52cff42aaac15cda98834fd70', '1016161475', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (14, '学生14', '123456', 'ca609e728e4243f7af1950ec0dc17f01', '794625189', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (15, '学生15', '123456', '9c89ceb042a441319f0e45985336cf7b', '104003050', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (16, '学生16', '123456', '1b368ad4b18a4137bd596624d37482ee', '1983490804', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (17, '学生17', '123456', '119e27b822b74dbea5e767409e03d796', '1954856967', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (18, '学生18', '123456', '7965220303c44455ae2e40995f155296', '68210409', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (19, '学生19', '123456', 'c4eccd979be141188437a254870bec44', '79155650', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (20, '学生20', '123456', '9a78ab33cba3451988cb50f7d493b924', '1360183001', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (21, '学生21', '123456', 'af11137f8b584670a276f5b7281ab1a0', '1510202796', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (22, '学生22', '123456', 'b30189950e4c4cf680396cf01d1e8f31', '955829923', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (23, '学生23', '123456', '7c0673fcbfbc40f880d342d9c42b2dfa', '535408073', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (24, '学生24', '123456', 'fa428e0318834f28a0c1a82d20617578', '2103860490', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (25, '学生25', '123456', '75d8aed5d88a4c69a89f814e30464d0d', '1852207031', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (26, '学生26', '123456', 'a771400f101a47449b72161dcf027cd1', '1091733008', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (27, '学生27', '123456', '6c888090d28945f9910f513c6116b91d', '948665470', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (28, '学生28', '123456', 'b1c3ed1233ac4ff39080d91469f1bc6e', '899225507', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (29, '学生29', '123456', 'c4b63825b245438a9f2c5f4dfa626eef', '1087710728', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (30, '学生30', '123456', '71bba5006222442b9ce800ba9d0ccfb6', '1565195925', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (31, '学生31', '123456', '1159ef3b21c64decacf44bfa3190d679', '1171935247', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (32, '学生32', '123456', '9cfba05e446745a19b7e8787b33aa3d9', '322836870', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (33, '学生33', '123456', 'b895a33bd3474ddba8b5aafcbc84e3ea', '33244943', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (34, '学生34', '123456', '055cfdb73c54447787e5595399bc8e60', '1530763860', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (35, '学生35', '123456', '6230965d245342a085eddfb01e1d9008', '1945759814', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (36, '学生36', '123456', '055c2e6fb9534bdc902fa8c33e8219c2', '1078800122', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (37, '学生37', '123456', '362083e7f4c044b8bb49caeb27a56aa5', '2024762803', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (38, '学生38', '123456', 'cda29155593c4d62a0ddb483f08bb599', '715212636', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (39, '学生39', '123456', '090edd473706430f96e6624669e9a15b', '1261600130', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (40, '学生40', '123456', 'bfb3ac5bb40e4cfeb0327f0f7b58d65d', '948145526', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (41, '学生41', '123456', '5010949f1a1f45a184f0d219686e1e62', '1215102289', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (42, '学生42', '123456', 'ee04c779dff847578add59b489e84798', '941900974', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (43, '学生43', '123456', '2ee332db199440149b9d3300ae45fdb7', '2081537026', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (44, '学生44', '123456', '4e36a2cdbbcf4d5798607449c1f8465e', '1946628390', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (45, '学生45', '123456', '1047fbeb24b14e8dba959c627214d469', '135370176', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (46, '学生46', '123456', '30d109866beb48b686b244ac1445de55', '267938099', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (47, '学生47', '123456', 'ebde0bbf78244689aac974e796e8adab', '1620621735', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (48, '学生48', '123456', '3f5841be18c04e6095f9d6682c762da8', '1825853523', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (49, '学生49', '123456', 'b591d56c06194deb9043c6735d312465', '749371825', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (50, '学生50', '123456', 'f7da26afc6684944a1edb73e86808133', '1364945632', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (51, '学生51', '123456', '6cc098128970404eaa24dac011ac10be', '536485955', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (52, '学生52', '123456', '4087df3d5c72460781189a6f002de7e5', '294645039', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (53, '学生53', '123456', 'c6e203d6a6af45f39d9d086d20ce50a0', '9379473', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (54, '学生54', '123456', '72ee3a7b5c364dabb07b607b9437a1c1', '1432374272', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (55, '学生55', '123456', '39a5dbf2a66a4855bd9070d186c3a67f', '2013995960', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (56, '学生56', '123456', 'fa1c5f42fb4f4ce5991de5c5897f5190', '1777919372', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (57, '学生57', '123456', '5a8025e5f2d240f8ada800f534de6717', '958659075', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (58, '学生58', '123456', '09e88836342745ae9b0a8e84a969992e', '152600634', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (59, '学生59', '123456', 'ad7559c6041845f98742fc6aecb53187', '1689352658', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (60, '学生60', '123456', '75056a9902ab4467b8c33a9b2112b24b', '949598996', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (61, '学生61', '123456', '22be535611464ff493157fb207d939a6', '251537778', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (62, '学生62', '123456', 'b1c734db9fd9414ebf73e5b9221f7929', '860333207', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (63, '学生63', '123456', 'ee94d28c95694c868297a3464b5178f4', '1662196677', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (64, '学生64', '123456', 'd51a06e21e7f4cfbb390604adaa48122', '658904665', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (65, '学生65', '123456', '06d86a6f02d7490fa4a43ba9438e0300', '859372671', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (66, '学生66', '123456', 'c6c1c83dff28430490ee20cbfa935f0a', '673518828', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (67, '学生67', '123456', '0367fd2437154f44a2d1f84f505a356c', '650715059', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (68, '学生68', '123456', '59780933fad54a389493b3d4a424c609', '1905183530', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (69, '学生69', '123456', 'b24ab3e9d3f443cba17a1488df0451c8', '1085278093', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (70, '学生70', '123456', 'fd7a3f4a357d46e3804526f4b2382b6f', '1862650594', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (71, '学生71', '123456', '337881daa0e5495fb1652a51c43ae42e', '1392029062', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (72, '学生72', '123456', '5b34d77df11b481faa2702c42d43f211', '10786702', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (73, '2', '2', '3ac6a401-f6c2-42f3-9f0f-36d94df42e7d', '402589178', 75, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (76, 'student_3', 'student_3', '32fac73d-1a50-4496-b330-fa93090f0aa1', '1078819826', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (77, 'student_4', 'student_4', 'e516fe02-70b2-4dfe-958b-5ff64ea5cced', '989375459', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (78, 'student_5', 'student_5', '1e994a8c-d7fc-4c78-bbcd-0932d2b81e2c', '834547575', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (79, 'student_6', 'student_6', 'c34501dc-3b53-4e90-9f48-472cd8dbaf59', '1668185180', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (80, 'student_7', 'student_7', '8d0b2ed6-4e0e-4885-8a83-e7979e28eca5', '1255915048', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `student` VALUES (82, 'student_9', 'student_9', '1e9cccac-170f-4a27-a824-c833801b8fc9', '211122380', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for student_project
-- ----------------------------
DROP TABLE IF EXISTS `student_project`;
CREATE TABLE `student_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系记录id',
  `apply_date` datetime(0) NULL DEFAULT NULL COMMENT '申请日期',
  `apply_or_join` int(11) NULL DEFAULT NULL COMMENT '学生和项目的状态  ',
  `update_apply_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `show_state` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlmwp7mytxvlna99s526lfvgcp`(`project_id`) USING BTREE,
  INDEX `FKl37sau7p5bk28p0v29vhoja4e`(`student_id`) USING BTREE,
  CONSTRAINT `FKl37sau7p5bk28p0v29vhoja4e` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FKlmwp7mytxvlna99s526lfvgcp` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_project
-- ----------------------------
INSERT INTO `student_project` VALUES (251, '2024-03-30 18:32:55', 2, '2024-04-15 15:34:08', 64, 1, NULL);
INSERT INTO `student_project` VALUES (252, '2024-03-30 18:32:58', 3, '2024-03-30 18:34:45', 63, 1, NULL);
INSERT INTO `student_project` VALUES (253, '2024-03-30 18:32:59', 3, '2024-03-30 18:34:32', 62, 1, NULL);
INSERT INTO `student_project` VALUES (254, '2024-04-13 19:38:45', 2, '2024-04-15 15:34:05', 65, 11, NULL);
INSERT INTO `student_project` VALUES (255, '2024-04-15 15:17:49', 3, '2024-04-15 15:18:38', 69, 1, b'1');
INSERT INTO `student_project` VALUES (256, '2024-04-15 15:36:54', 1, '2024-04-15 15:36:54', 71, 11, b'1');
INSERT INTO `student_project` VALUES (257, '2024-04-15 15:45:30', 3, '2024-04-15 15:47:08', 74, 15, b'1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `college_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK763n3dvgpu6dl9swenb5pc1hh`(`college_id`) USING BTREE,
  CONSTRAINT `FK763n3dvgpu6dl9swenb5pc1hh` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '老师1', '123456', '4f0b4d56-fe10-4985-b5ea-dda38872d0d7', '445393889', 1);
INSERT INTO `teacher` VALUES (2, '老师2', '123456', '13c325f2-1b21-44a5-8029-9d21dbeddd28', '356803480', 1);
INSERT INTO `teacher` VALUES (3, '老师3', '123456', '54323861-5ddf-4d25-956d-77399ebba4b0', '1564369508', 2);
INSERT INTO `teacher` VALUES (4, '老师4', '123456', '9747ec05-17ff-47ba-9c9b-4a08a4ded27e', '1900656401', 1);
INSERT INTO `teacher` VALUES (5, '老师5', '123456', '61ce09dd-7239-458c-aa34-6eaf78c011f7', '1006940043', 6);
INSERT INTO `teacher` VALUES (6, '老师6', '123456', '7537d0b8-4aac-4598-a49f-9fb0bba9b989', '812058051', 2);
INSERT INTO `teacher` VALUES (7, '老师7', '123456', '3bf071e3-72e9-4d2b-8d6a-9f492a207636', '1039276811', 3);
INSERT INTO `teacher` VALUES (8, '老师8', '123456', '8a0a5ee6-8593-4c24-a4ef-af33aa289b2f', '1819124624', 3);
INSERT INTO `teacher` VALUES (9, '老师9', '123456', '87254bc8-e63c-47d6-bdd2-c54143863465', '549903260', 3);
INSERT INTO `teacher` VALUES (10, '老师10', '123456', '5cf2f0e5-caff-4953-8dbe-f9c70d745ec3', '1300013458', 4);
INSERT INTO `teacher` VALUES (11, '老师11', '123456', 'ee43e8b9-9b36-4240-9494-89e8eefd4f66', '365696847', 1);
INSERT INTO `teacher` VALUES (12, '老师12', '123456', 'fba1ad3b-b32d-440e-8e43-2831f3f88eca', '2108555677', 4);
INSERT INTO `teacher` VALUES (13, '老师13', '123456', 'ff5dab32-52a5-4e3f-bbb2-ab140abbfb8a', '815800506', 5);
INSERT INTO `teacher` VALUES (14, '老师14', '123456', 'afd5fc05-d24a-4813-96c1-4fbb959a4d71', '136455144', 5);
INSERT INTO `teacher` VALUES (15, '老师15', '123456', '0255e2a5-7136-4d47-9a96-d5978b1445db', '1527992535', 5);
INSERT INTO `teacher` VALUES (16, '老师16', '123456', '6f278537-1c8b-41d8-81a3-aab87853f629', '1819658341', 6);
INSERT INTO `teacher` VALUES (17, '老师17', '123456', 'be257625-3e87-447d-9ae5-8022dac6d55b', '1702269287', 6);
INSERT INTO `teacher` VALUES (18, '老师18', '123456', 'd4a9915f-a910-4bcd-8610-7f190d5083d3', '739818380', 6);
INSERT INTO `teacher` VALUES (19, '老师19', '123456', 'e9abbb7a-a355-45ff-be6a-afae6eaffce9', '543147759', 7);
INSERT INTO `teacher` VALUES (20, '老师20', '123456', '8af2071f-4a0e-4810-b64a-90031f042027', '397360304', 7);
INSERT INTO `teacher` VALUES (21, '老师21', '123456', '373fa9e1-bf71-429b-a138-17b2a3616809', '2086631387', 7);
INSERT INTO `teacher` VALUES (22, '老师22', '123456', 'd4533e22-d636-4a3e-a923-7abb156ac207', '840135070', 8);
INSERT INTO `teacher` VALUES (23, '老师23', '123456', '96568d45-e9af-46bc-8d60-20e321713822', '661192131', 8);
INSERT INTO `teacher` VALUES (24, '老师24', '123456', '7c4c5c71-148e-4956-a469-67a25b79d871', '1390528310', 8);
INSERT INTO `teacher` VALUES (29, 'test_1', 'test_1', 'f3ac617e-f2a8-4760-8e66-304bf5ea3a2c', '1617615263', 1);
INSERT INTO `teacher` VALUES (30, 'test_2', 'test_2', '26b101f4-c722-4a89-8c33-8a485cd9ad4a', '520200789', 1);
INSERT INTO `teacher` VALUES (31, 'test_3', 'test_3', '85c31873-d2b4-4b43-8fea-2d4762d4903e', '514803680', 1);
INSERT INTO `teacher` VALUES (33, 'test_5', 'test_5', 'c97d79a7-52c4-46d8-a212-e1887b8b1663', '1984144215', 2);
INSERT INTO `teacher` VALUES (34, 'test_6', 'test_6', '68a70ee8-fe25-4721-9c42-54ac04382a85', '1760936895', 3);
INSERT INTO `teacher` VALUES (35, 'test_7', 'test_7', '93ed1f09-8de4-49f5-b2c3-03b89a415346', '1778931187', 2);
INSERT INTO `teacher` VALUES (36, 'test_8', 'test_8', '921bb212-268a-41aa-a601-dddf6da6802d', '110728529', 4);
INSERT INTO `teacher` VALUES (37, 'test_9', 'test_9', '03752f65-da97-400e-a94c-642535e4cac6', '1878739050', 3);

-- ----------------------------
-- Table structure for teacher_project
-- ----------------------------
DROP TABLE IF EXISTS `teacher_project`;
CREATE TABLE `teacher_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime(0) NULL DEFAULT NULL,
  `apply_or_join` int(11) NULL DEFAULT NULL,
  `is_creator` bit(1) NULL DEFAULT NULL,
  `update_apply_date` datetime(0) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `show_state` bit(1) NULL DEFAULT NULL COMMENT '显示状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsdoy9fkcc4ms2ha1rh17w9af2`(`project_id`) USING BTREE,
  INDEX `FKja9xfmqotd96u4ekqov1eq8h`(`teacher_id`) USING BTREE,
  CONSTRAINT `FKja9xfmqotd96u4ekqov1eq8h` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FKsdoy9fkcc4ms2ha1rh17w9af2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher_project
-- ----------------------------
INSERT INTO `teacher_project` VALUES (186, '2024-03-30 18:29:27', 3, b'1', '2024-03-30 18:32:00', 62, 1, b'0');
INSERT INTO `teacher_project` VALUES (187, '2024-03-30 18:29:59', 3, b'1', '2024-03-30 18:31:54', 63, 1, b'1');
INSERT INTO `teacher_project` VALUES (188, '2024-03-30 18:30:07', 3, b'1', '2024-03-30 18:31:53', 64, 1, b'0');
INSERT INTO `teacher_project` VALUES (189, '2024-04-13 18:25:12', 3, b'1', '2024-04-13 19:25:29', 65, 1, b'1');
INSERT INTO `teacher_project` VALUES (190, '2024-04-13 19:34:16', 2, b'1', '2024-04-13 19:34:16', 66, 1, NULL);
INSERT INTO `teacher_project` VALUES (191, '2024-04-13 19:34:54', 2, b'1', '2024-04-13 19:34:54', 67, 4, NULL);
INSERT INTO `teacher_project` VALUES (192, '2024-04-13 19:36:01', 2, b'1', '2024-04-13 19:36:01', 68, 4, NULL);
INSERT INTO `teacher_project` VALUES (193, '2024-04-15 15:14:31', 3, b'1', '2024-04-15 15:17:45', 69, 1, b'1');
INSERT INTO `teacher_project` VALUES (194, '2024-04-15 15:19:58', 3, b'1', '2024-04-15 15:20:18', 70, 1, b'1');
INSERT INTO `teacher_project` VALUES (195, '2024-04-15 15:26:10', 3, b'1', '2024-04-15 15:30:23', 71, 1, b'1');
INSERT INTO `teacher_project` VALUES (196, '2024-04-15 15:28:11', 3, b'1', '2024-04-15 15:30:20', 72, 1, b'1');
INSERT INTO `teacher_project` VALUES (197, '2024-04-15 15:35:59', 3, b'1', '2024-04-15 15:43:11', 73, 2, b'1');
INSERT INTO `teacher_project` VALUES (198, '2024-04-15 15:37:28', 1, b'0', '2024-04-15 15:37:28', 71, 2, b'1');
INSERT INTO `teacher_project` VALUES (199, '2024-04-15 15:42:31', 3, b'1', '2024-04-15 15:43:06', 74, 11, b'1');

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime(0) NULL DEFAULT NULL,
  `score` int(11) UNSIGNED NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `work_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `if_mark` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKf4jf1abybj7fc5w1nt686svxt`(`project_id`) USING BTREE,
  CONSTRAINT `FKf4jf1abybj7fc5w1nt686svxt` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (10, '2021-05-29 00:14:26', 90, '2021-05-29 00:14:57', '作品', 8, b'1');
INSERT INTO `work` VALUES (11, '2021-05-29 00:29:22', 90, '2021-05-29 00:29:52', '新作品', 61, b'1');
INSERT INTO `work` VALUES (12, NULL, 0, '2024-04-15 14:59:18', '334234', 63, b'0');

-- ----------------------------
-- Table structure for work_file
-- ----------------------------
DROP TABLE IF EXISTS `work_file`;
CREATE TABLE `work_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `work_id` int(11) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfrplyaqs12p76j3rx4mqxkmtx`(`work_id`) USING BTREE,
  CONSTRAINT `FKfrplyaqs12p76j3rx4mqxkmtx` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_file
-- ----------------------------
INSERT INTO `work_file` VALUES (30, '/upload/work/土木工程学院/第七届蓝桥杯/计信青年一队/2021/5/29/项目问题.txt', 10, '项目问题.txt');
INSERT INTO `work_file` VALUES (31, '/upload/work/计算机与信息工程学院/全国大学生计算机设计大赛/高校学科竞赛管理系统/2021/5/29/新建文本文档.txt', 11, '新建文本文档.txt');
INSERT INTO `work_file` VALUES (32, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/4/大学生竞赛管理系统论文.doc', 12, '大学生竞赛管理系统论文.doc');
INSERT INTO `work_file` VALUES (34, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/4/批量添加学生账号信息.xlsx', 12, '批量添加学生账号信息.xlsx');
INSERT INTO `work_file` VALUES (36, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/4/批量添加学院账号信息.xlsx', 12, '批量添加学院账号信息.xlsx');
INSERT INTO `work_file` VALUES (37, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/4/教师账号信息.xlsx', 12, '教师账号信息.xlsx');
INSERT INTO `work_file` VALUES (40, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/11/附件+2022-2023年度五邑大学共青团工作先进集体和个人拟表彰名单.pdf', 12, '附件+2022-2023年度五邑大学共青团工作先进集体和个人拟表彰名单.pdf');
INSERT INTO `work_file` VALUES (41, '/upload/work/计算机与信息工程学院/test-4/测试是否添加成功该项目_2/2024/4/15/打印需求.txt', 12, '打印需求.txt');

-- ----------------------------
-- Event structure for check_not_apply_time
-- ----------------------------
DROP EVENT IF EXISTS `check_not_apply_time`;
delimiter ;;
CREATE EVENT `check_not_apply_time`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2024-04-13 17:33:43'
DO BEGIN
    UPDATE college_comp AS cc
    INNER JOIN comp AS ot ON cc.comp_id = ot.id
    SET cc.apply_or_join = CASE
                                WHEN cc.apply_or_join = 1 AND ot.not_apply_time <= NOW() THEN 2
                                WHEN cc.apply_or_join = 0 AND ot.not_apply_time <= NOW() THEN 6
                                ELSE cc.apply_or_join
                            END
		WHERE cc.locked <> 1; -- 添加了一个额外的条件来排除 locked 列为 1 的记录
END
;;
delimiter ;

-- ----------------------------
-- Event structure for check_occurrence_time
-- ----------------------------
DROP EVENT IF EXISTS `check_occurrence_time`;
delimiter ;;
CREATE EVENT `check_occurrence_time`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2024-04-12 16:51:42'
DO BEGIN
    UPDATE college_comp AS cc
    INNER JOIN comp AS c ON cc.comp_id = c.id
    SET cc.show_state = 0
    WHERE c.occurrence_time <= NOW() - INTERVAL 1 DAY
    AND cc.show_state = 1;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for check_project_occurrence_time
-- ----------------------------
DROP EVENT IF EXISTS `check_project_occurrence_time`;
delimiter ;;
CREATE EVENT `check_project_occurrence_time`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2024-04-12 23:25:48'
DO BEGIN
    UPDATE project AS p
    INNER JOIN comp AS c ON p.comp_id = c.id
    SET p.show_state = 0
    WHERE c.occurrence_time <= NOW() - INTERVAL 1 DAY
    AND p.show_state = 1
    AND p.locked <> 1; -- 排除被锁定的记录
END
;;
delimiter ;

-- ----------------------------
-- Event structure for techer_apply_check_not_apply_time
-- ----------------------------
DROP EVENT IF EXISTS `techer_apply_check_not_apply_time`;
delimiter ;;
CREATE EVENT `techer_apply_check_not_apply_time`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2024-04-13 19:23:59'
DO BEGIN
    UPDATE teacher_project AS tp
    INNER JOIN project AS p ON tp.project_id = p.id
    INNER JOIN comp AS c ON p.comp_id = c.id
    SET tp.apply_or_join = 2
    WHERE c.not_apply_time < NOW()
    AND tp.apply_or_join <> 3;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for techer_apply_check_occurrence_time
-- ----------------------------
DROP EVENT IF EXISTS `techer_apply_check_occurrence_time`;
delimiter ;;
CREATE EVENT `techer_apply_check_occurrence_time`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2024-04-13 19:12:00'
DO BEGIN
    UPDATE teacher_project AS tp
    INNER JOIN project AS p ON tp.project_id = p.id
    INNER JOIN comp AS c ON p.comp_id = c.id
    SET tp.show_state = 0
    WHERE c.occurrence_time <= NOW() - INTERVAL 1 DAY
    AND tp.show_state = 1;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comp
-- ----------------------------
DROP TRIGGER IF EXISTS `comp_visible_trigger`;
delimiter ;;
CREATE TRIGGER `comp_visible_trigger` AFTER UPDATE ON `comp` FOR EACH ROW BEGIN
    IF NEW.visiable = 1 AND OLD.visiable = 0 THEN
        UPDATE project SET locked = 1 WHERE comp_id = NEW.id AND show_state = 0;
				UPDATE college_comp SET locked = 1 WHERE comp_id = NEW.id AND show_state = 0;
    END IF;
		
		IF NEW.occurrence_time > NOW() THEN
		    UPDATE project SET locked = 1 WHERE comp_id = NEW.id AND show_state = 0;
				UPDATE college_comp SET locked = 1 WHERE comp_id = NEW.id AND show_state = 0;
		END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
