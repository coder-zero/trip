/*
 Navicat MySQL Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/04/2022 10:36:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '留言人id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '留言内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '留言时间',
  `comment_type` int NULL DEFAULT NULL COMMENT '类型（0 为酒店 1为景点）',
  `pid` int NULL DEFAULT NULL COMMENT '所属评论的id',
  `belong_id` int NULL DEFAULT NULL COMMENT '所属酒店或景点的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (14, 1, '测试留言1', '2022-01-14 20:17:43', 0, 0, 6);
INSERT INTO `comment` VALUES (18, 1, '测试留言1-1', '2022-01-14 20:17:43', 0, 14, 6);
INSERT INTO `comment` VALUES (20, 1, '测试留言2', '2022-01-14 20:17:43', 0, 0, 6);
INSERT INTO `comment` VALUES (21, 1, '测试留言2-1', '2022-01-14 20:17:43', 0, 20, 6);
INSERT INTO `comment` VALUES (23, 1, '测试景点5的留言1', '2022-01-14 20:17:43', 1, 0, 5);
INSERT INTO `comment` VALUES (24, 1, '测试景点5的留言1-1', '2022-01-14 20:17:43', 1, 23, 5);
INSERT INTO `comment` VALUES (28, 1, '测试景点5的留言2', '2022-04-20 10:41:20', 1, 0, 5);
INSERT INTO `comment` VALUES (30, 2, '测试景点5的留言1-2', '2022-04-20 10:43:25', 1, 24, 5);
INSERT INTO `comment` VALUES (33, 1, '测试景点5的留言4', '2022-04-20 10:46:50', 1, 0, 5);
INSERT INTO `comment` VALUES (34, 1, '测试景点5的留言2-1\n', '2022-04-20 10:59:14', 1, 28, 5);
INSERT INTO `comment` VALUES (35, 1, '测试留言1-2', '2022-04-20 14:12:01', 0, 18, 6);
INSERT INTO `comment` VALUES (36, 1, '测试酒店留言3', '2022-04-20 15:03:13', 0, 0, 6);
INSERT INTO `comment` VALUES (37, 1, '测试酒店留言3-1\n', '2022-04-20 15:03:31', 0, 36, 6);
INSERT INTO `comment` VALUES (38, 1, '测试景点6留言1', '2022-04-20 15:04:43', 1, 0, 6);
INSERT INTO `comment` VALUES (39, 1, '测试景点6留言1-1', '2022-04-20 15:04:54', 1, 38, 6);
INSERT INTO `comment` VALUES (40, 1, '测试景点6留言2', '2022-04-20 15:05:05', 1, 0, 6);
INSERT INTO `comment` VALUES (41, 1, '测试景点6留言2-1\n', '2022-04-20 15:05:13', 1, 40, 6);
INSERT INTO `comment` VALUES (42, 5, '测试景点5的留言4-1', '2022-04-22 09:02:12', 1, 33, 5);
INSERT INTO `comment` VALUES (45, 5, '测试景点6留言3', '2022-04-22 10:18:12', 1, 0, 6);
INSERT INTO `comment` VALUES (46, 5, '测试景点6留言3-1\n', '2022-04-22 10:18:39', 1, 45, 6);
INSERT INTO `comment` VALUES (47, 5, '测试景点6留言4', '2022-04-22 10:18:47', 1, 0, 6);
INSERT INTO `comment` VALUES (48, 5, '测试景点6留言5', '2022-04-22 10:19:07', 1, 0, 6);
INSERT INTO `comment` VALUES (49, 5, '测试景点6留言6', '2022-04-22 10:19:26', 1, 0, 6);
INSERT INTO `comment` VALUES (50, 5, '测试留言5', '2022-04-22 10:21:15', 0, 0, 6);
INSERT INTO `comment` VALUES (51, 5, '测试留言5-1', '2022-04-22 10:21:26', 0, 50, 6);
INSERT INTO `comment` VALUES (52, 5, '测试留言5-2\n', '2022-04-23 10:21:11', 0, 51, 6);
INSERT INTO `comment` VALUES (53, 5, '测试景点5的留言4-2', '2022-04-23 10:22:22', 1, 42, 5);
INSERT INTO `comment` VALUES (54, 5, '测试景点5的留言4-2', '2022-04-23 10:22:58', 1, 42, 5);
INSERT INTO `comment` VALUES (55, 5, '测试留言5-3', '2022-04-23 10:24:45', 0, 52, 6);
INSERT INTO `comment` VALUES (56, 5, '测试留言5-4', '2022-04-23 10:26:04', 0, 55, 6);
INSERT INTO `comment` VALUES (57, 5, '测试留言6', '2022-04-23 10:26:17', 0, 0, 6);
INSERT INTO `comment` VALUES (58, 5, '测试留言5', '2022-04-23 10:26:34', 1, 0, 5);
INSERT INTO `comment` VALUES (59, 5, '测试留言5-1', '2022-04-23 10:26:39', 1, 58, 5);

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店简述',
  `hotel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店名称',
  `hotel_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店地址',
  `hotel_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题图像',
  `hotel_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店详情页',
  `user_id` int NULL DEFAULT NULL COMMENT '发布人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (6, '北京赛特饭店坐落于北京市建国门外长安街沿线南侧，位于国贸中央商务区至天安门广场的中间位置，与**使馆区（日坛路使馆区）、秀水街、首都儿研所、国贸中心、等核心地点举步之遥；地铁建国门站（1、2 号线换乘站）及各公交车站步行皆可到达，距天安门广场、故宫等景点约 3 公里，饭店位置四通八达，尽享便利交通。 饭店于 2017 年完成了整体改造和升级。新赛特饭店均按照高星级酒店的标准进行配置，设有不同风格的标准间、商务间、豪华间、高级套间、家庭套间，共两百余间；更有各种多媒体娱乐及商务设施，高速网络覆盖全店令您尽享', '北京赛特饭店', '北京', '12345676789', 'http://localhost:8800/image/e527300613184ab0ad85484afb94fd89.jpg', '<h2>服务及设施</h2><p><strong style=\"color: rgb(15, 41, 77);\">热门设施</strong></p><p>24小时大堂经理</p><p>会议厅<span style=\"background-color: rgb(239, 239, 239);\">额外收费</span></p><p><img src=\"https://dimg04.c-ctrip.com/images/0202d120008aifs5r508B_W_1080_808_R5_D.jpg\"><img src=\"https://dimg04.c-ctrip.com/images/0202y120008e4hs0i5CD1_W_1080_808_R5_D.jpg\"></p><p><img src=\"https://dimg04.c-ctrip.com/images/02068120008aichokC721_W_1080_808_R5_D.jpg\"><img src=\"https://dimg04.c-ctrip.com/images/02068120008aichokC721_W_1080_808_R5_D.jpg\"></p><p><br></p><p><br></p><p><strong>娱乐活动设施</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">室内泳池</span></li><li><span style=\"background-color: rgb(239, 239, 239);\">额外收费</span></li></ul><p><strong>康体设施</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">健身室</span></li></ul><p><strong>前台服务</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">行李寄存</span></li><li><span style=\"color: rgb(255, 255, 255); background-color: rgb(29, 163, 138);\">免费</span></li><li><span style=\"color: rgb(15, 41, 77);\">前台贵重物品保险柜</span></li><li><span style=\"color: rgb(15, 41, 77);\">24小时大堂经理</span></li><li><span style=\"color: rgb(15, 41, 77);\">叫车服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">礼宾服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">叫醒服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">信用卡结算服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">快速入住退房</span></li><li><span style=\"color: rgb(15, 41, 77);\">24小时中文服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">外币兑换服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">24小时前台</span></li><li><span style=\"color: rgb(15, 41, 77);\">专职门童</span></li><li><span style=\"color: rgb(15, 41, 77);\">旅游交通图</span></li><li><span style=\"color: rgb(15, 41, 77);\">邮政服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">一次性结账</span></li></ul><p><strong>清洁服务</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">每日打扫</span></li><li><span style=\"color: rgb(15, 41, 77);\">每日换毛巾</span></li><li><span style=\"color: rgb(15, 41, 77);\">被单1客1换</span></li></ul><p><strong>餐饮服务</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">中餐厅</span></li><li><span style=\"color: rgb(15, 41, 77);\">西餐厅</span></li><li><span style=\"color: rgb(15, 41, 77);\">餐厅</span></li><li><span style=\"color: rgb(15, 41, 77);\">咖啡厅</span></li><li><span style=\"color: rgb(15, 41, 77);\">送餐服务</span></li><li><span style=\"color: rgb(15, 41, 77);\">日式餐厅</span></li></ul><p><strong>其他服务</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">婚宴服务</span></li></ul><p><strong>公共区</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">公用区wifi</span></li><li><span style=\"color: rgb(255, 255, 255); background-color: rgb(29, 163, 138);\">免费</span></li><li><span style=\"color: rgb(15, 41, 77);\">非经营性客人休息区</span></li></ul><p><strong>商务服务</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">会议厅</span></li><li><span style=\"background-color: rgb(239, 239, 239);\">额外收费</span></li><li><span style=\"color: rgb(15, 41, 77);\">商务中心</span></li><li><span style=\"color: rgb(15, 41, 77);\">多媒体演示系统</span></li><li><span style=\"color: rgb(15, 41, 77);\">多功能厅</span></li></ul><p><strong>通用设施</strong></p><ul><li><span style=\"color: rgb(15, 41, 77);\">暖气</span></li><li><span style=\"color: rgb(15, 41, 77);\">电梯</span></li><li><span style=\"color: rgb(15, 41, 77);\">大堂吧</span></li><li><span style=\"color: rgb(15, 41, 77);\">公共音响系统</span></li><li><span style=\"color: rgb(15, 41, 77);\">无障碍客房</span></li><li><span style=\"color: rgb(15, 41, 77);\">大堂报纸</span></li><li><span style=\"color: rgb(15, 41, 77);\">公共区域禁烟</span></li><li><span style=\"color: rgb(15, 41, 77);\">全部客房禁烟</span></li><li><span style=\"color: rgb(15, 41, 77);\">无烟楼层</span></li><li><span style=\"color: rgb(15, 41, 77);\">公共区域闭路电视监控系统</span></li></ul><p><br></p>', 1);
INSERT INTO `hotel` VALUES (7, '测试1', '大酒店', '马鞍山', '11100991122', 'http://localhost:8800/image/4138008849934ba5ab9392309a4e0c3a.jpg', '<p>测试</p>', 1);
INSERT INTO `hotel` VALUES (11, '在小马', '马鞍山酒店', '马鞍山', '19800119922', 'http://localhost:8800/image/36d4cb5c269443d588fe7a380f59ba88.jpg', '<p>测试</p>', 1);

-- ----------------------------
-- Table structure for hotel_img
-- ----------------------------
DROP TABLE IF EXISTS `hotel_img`;
CREATE TABLE `hotel_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NULL DEFAULT NULL COMMENT '酒店id',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图像url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_img
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单表id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单指向的地址',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单对应的图标',
  `pid` int NULL DEFAULT 0 COMMENT '菜单的父节点id，一级菜单pid为0',
  `introduce` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单功能说明',
  `sort_flag` int NULL DEFAULT NULL COMMENT '菜单位置之间的排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '用户管理', '/home/userManage', 'el-icon-user', 4, '   ', 1);
INSERT INTO `menu` VALUES (2, '角色管理', '/home/roleManage', 'el-icon-s-custom', 4, NULL, 3);
INSERT INTO `menu` VALUES (3, '菜单管理', '/home/menuManage', 'el-icon-tickets', 4, NULL, 2);
INSERT INTO `menu` VALUES (4, '系统管理', '', 'el-icon-monitor', 0, '系统管理的菜单', 5);
INSERT INTO `menu` VALUES (19, '网站管理', '', 'el-icon-collection', 0, '', 11);
INSERT INTO `menu` VALUES (23, '功能测试', '/home/test', 'el-icon-s-claim', 19, '用作功能测试页面', 18);
INSERT INTO `menu` VALUES (25, '注册管理', '/home/registerManage', 'el-icon-mobile-phone', 4, '对角色是否可注册进行设置', 9);
INSERT INTO `menu` VALUES (26, '日志管理', '/home/logManage', 'el-icon-notebook-2', 4, '系统日志的管理', 10);
INSERT INTO `menu` VALUES (27, '首页面', '/home/index', 'el-icon-s-home', 0, '系统初始页面', 4);
INSERT INTO `menu` VALUES (31, '景点管理', '/home/allSpotManage', 'el-icon-tickets', 38, '景点列表', 12);
INSERT INTO `menu` VALUES (32, '酒店管理', '/home/hotelManage', 'el-icon-tickets', 37, '酒店列表', 14);
INSERT INTO `menu` VALUES (34, '房间管理', '/home/roomManage', 'el-icon-tickets', 37, '房间列表', 15);
INSERT INTO `menu` VALUES (35, '留言管理', '/home/commentManage', 'el-icon-tickets', 19, NULL, 17);
INSERT INTO `menu` VALUES (36, '订单管理', '/home/orderManage', 'el-icon-tickets', 19, NULL, 13);
INSERT INTO `menu` VALUES (37, '酒店管理', '/home/hotel', '', 0, '酒店模块的管理', 19);
INSERT INTO `menu` VALUES (38, '景点管理', '/home/spot', '', 0, '', 20);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `menu_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单id的集合',
  `introduce` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色简介',
  `is_register` int NULL DEFAULT 1 COMMENT '表示角色是否可注册，1：可以，0：不可以，默认可注册',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '游客', '', '游客的角色', 1);
INSERT INTO `role` VALUES (23, '网站管理员', '27,4,1,3,2,25,26,36,35,37,32,34,38,31,19', '管理员的角色1', 1);
INSERT INTO `role` VALUES (24, '景点管理员', '31,35,19', '景点的管理员', 0);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NULL DEFAULT NULL COMMENT '酒店id',
  `room_type` int NULL DEFAULT NULL COMMENT '房间类型（0，1）',
  `room_count` int NULL DEFAULT NULL COMMENT '房间数量',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间图像',
  `room_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '房间价格',
  `room_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间描述',
  `current_num` int NULL DEFAULT NULL COMMENT '当前剩余房间的数量',
  `user_id` int NULL DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (12, 7, 2, 12, 'http://localhost:8800/image/9b387eca08054e05a4eebe29f7a2eab6.jpg', 111.00, '测试这个', 12, 1);
INSERT INTO `room` VALUES (14, 6, 2, 12, 'http://localhost:8800/image/52f0a6c8b9cd4a27a482825a12cf6abe.jpg', 222.00, '测试机', 9, 1);
INSERT INTO `room` VALUES (17, 11, 1, 200, 'http://localhost:8800/image/54ac8f2c4f8143a7a9f8760213fa3766.jpg', 111.00, '吃十个', 197, 1);
INSERT INTO `room` VALUES (18, 6, 1, 10, 'http://localhost:8800/image/ede45c1caf3a4336a9620cc2381df2a8.jpg', 100.00, '测试多个房间', 10, 1);
INSERT INTO `room` VALUES (20, 11, 2, 5, 'http://localhost:8800/image/8b61cccf946a476993e5bd61ab5bbaf9.jpg', 222.00, '双人房', 4, 1);
INSERT INTO `room` VALUES (21, 7, 2, 2, 'http://localhost:8800/image/3b478fddb6ad45438d9aafe9d3c9afa0.jpg', 222.00, 'big', 2, 1);

-- ----------------------------
-- Table structure for room_order
-- ----------------------------
DROP TABLE IF EXISTS `room_order`;
CREATE TABLE `room_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NULL DEFAULT NULL COMMENT '房间id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '入住时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '退房时间',
  `hotel_id` int NULL DEFAULT NULL COMMENT '所属酒店id',
  `is_accept` int NULL DEFAULT NULL COMMENT '是否接受',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_order
-- ----------------------------
INSERT INTO `room_order` VALUES (41, 14, 5, '2022-04-28 00:00:00', '2022-04-29 00:00:00', 6, 1);
INSERT INTO `room_order` VALUES (43, 14, 5, '2022-05-17 00:00:00', '2022-05-18 00:00:00', 6, 1);
INSERT INTO `room_order` VALUES (57, 17, 5, '2022-04-22 00:00:00', '2022-04-23 00:00:00', 11, 0);
INSERT INTO `room_order` VALUES (58, 17, 5, '2022-04-22 00:00:00', '2022-04-23 00:00:00', 11, 0);
INSERT INTO `room_order` VALUES (61, 14, 5, '2022-04-15 00:00:00', '2022-04-16 00:00:00', 6, 0);
INSERT INTO `room_order` VALUES (65, 17, 5, '2022-05-10 00:00:00', '2022-05-11 00:00:00', 11, 0);
INSERT INTO `room_order` VALUES (71, 20, 5, '2022-04-21 00:00:00', '2022-04-28 00:00:00', 11, 0);

-- ----------------------------
-- Table structure for spot
-- ----------------------------
DROP TABLE IF EXISTS `spot`;
CREATE TABLE `spot`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `spot_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点简述',
  `spot_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点名称',
  `spot_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点地址',
  `spot_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '景点价格',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点图像',
  `spot_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '景点详述',
  `user_id` int NULL DEFAULT NULL COMMENT '发布人的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spot
-- ----------------------------
INSERT INTO `spot` VALUES (5, '★ 【服务保障】原创玩法，1天自由活动，1天跟团走行程，随心自选住宿，轻松周末游。\n★ 【精选酒店】优选市区酒店，距离总统府直线距离1公里内，舒适酒店任您选择，含早餐。\n★ 【缤纷景点】经典全含，南京总统府，中山陵，牛首山文化旅游区，夫子庙，嗨翻大蓝鲸。', '夫子庙', '南京', 0.00, 'http://localhost:8800/image/ae577e1cc3ac4c0b84153f9f2a3e9166.jpg', '<h5><span style=\"font-size: 13px; color: rgb(0, 134, 246);\">夫子庙秦淮风光带</span><strong style=\"font-size: 13px; color: rgb(0, 134, 246);\">4.5/5</strong></h5><p>夫子庙秦淮风光带是指以夫子庙为中心的秦淮河一带，包括两岸的街巷、民居及附近的古迹、风景点等。刘禹锡《乌衣巷》中的诗句“旧时王谢堂前燕，飞人寻常百姓家”便是说的这里。</p><p>景区概览</p><p>这一带自古以来都是南京较为繁华的地方之一，也是众多游客来到南京的必玩之处。在这里不仅能看到古都南京的历史建筑，还能吃到地道的秦淮风味小吃。在这里你可以深入到街巷中或是泛舟秦淮河，从不同视角感受河畔风土人情。夜晚景区内四处亮起彩灯，无比辉煌，“夜泊秦淮”更是美妙。风光带四季都有节庆活动，如春季文化庙会、夏季秦淮之夏、秋季夫子庙美食节、冬季金陵灯会等。</p><p>景区内各景点</p><p>这里除了夫子庙，风光带还有瞻园、中国古代的科举考场江南贡院、明末清初“桃花扇”传奇人物李香君故居、东晋贵族王导谢安故居乌衣巷、明代开国功臣徐达的私家花园白鹭洲公园、瓮城中华门、《儒林外史》作者吴敬梓故居等景点。</p><p>美食</p><p>游玩秦淮河一带，美食也是一大特色。这遍地都是茶楼饭店、街边小吃，其中“秦淮八绝”值得一尝。“秦淮八绝”是指南京八家小吃馆的十六道名点，分别为：魁光阁的五香茶叶蛋、五香豆；永和园的蟹壳黄烧饼、开洋干丝；奇芳阁的鸭油酥烧饼、麻油干丝；六凤居的葱油饼、豆腐脑儿；奇芳阁的什锦菜包、鸡丝面；蒋有记的牛肉锅贴、牛肉汤；瞻园面馆的薄皮包饺、红汤爆鱼面；莲湖糕团店的五色小糕、桂花夹心小元宵。</p><p>购物</p><p>这一带也是热闹的商业区，各种店铺林立，既有特色传统纪念品，也有时尚潮流小玩意，你可以挑选一些中意的物品作为留念。</p><p>秦淮画舫</p><p>想要泛舟秦淮河的话，可以在夫子庙对面的码头登船，游船上都有景点讲解。在船上可以一边欣赏景色，一边了解历史故事。</p><p><br></p><p><img src=\"https://dimg02.c-ctrip.com/images/100g1f000001gqya4D90B_D_256_180.jpg\" alt=\"travel picture\">  <img src=\"https://dimg01.c-ctrip.com/images/100p12000000s1um90B6D_D_256_180.jpg\" alt=\"travel picture\">  <img src=\"https://dimg02.c-ctrip.com/images/100s0g00000086s9zD645_D_256_180.jpg\" alt=\"travel picture\">  <img src=\"https://dimg08.c-ctrip.com/images/10070y000000mksq823D9_D_256_180.jpg\" alt=\"travel picture\"></p>', 1);
INSERT INTO `spot` VALUES (6, '飞机往返+环球影城大酒店&诺金度假酒店『新晋网红乐园』专属入园通道，沉浸式体验7大主题，身临其境，畅游影视场景｜全球第5家&亚洲第3家', '北京环球度假区', '北京', 1509.00, 'http://localhost:8800/image/e573d180ff8f4091b0dde473f675095a.jpg', '<p><strong style=\"color: rgb(51, 51, 51);\">前往环球影城度假区</strong></p><h5>﻿交通</h5><p>🚗自行前往北京环球度假区。</p><p>『交通推荐』</p><p>1.加购康辉北京环球度假区直通车&amp;门票</p><p>2.自驾前往：高速-京哈高速公路“田家府站”及六环路“张家湾北站”两个高速公路出站可直达北京环球度假区</p><p>3.公交前往：589路（颐瑞东路，环球大道东口，环球度假区 3站），T116路（度假区北街，探奇路，环球大道，颐瑞东路 4站）</p><p>4.地铁前往：7号线/8号线(环球度假区站，B/C/D出站口）</p><p><br></p><p><br></p><h5>景点</h5><p>前往：<span style=\"color: rgb(0, 134, 246);\">北京环球度假区</span><strong style=\"color: rgb(0, 134, 246);\">4.5/5</strong></p><p>北京环球度假区是一个广受期待的主题公园旅游目的地，包括开园规模最大的环球主题公园，北京环球城市大道，以及两家度假酒店。北京环球度假区糅合中国文化元素精心打造独特体验，拥有七大主题景区，37个骑乘娱乐设施及地标景点，24个表演演出，80个餐饮门店以及30个零售门店。</p><p><img src=\"https://dimg02.c-ctrip.com/images/0106j120008y7o3hcC541_D_256_180.jpg\" alt=\"travel picture\">   <img src=\"https://dimg02.c-ctrip.com/images/0106j120008y7o3hcC541_D_256_180.jpg\" alt=\"travel picture\">    <img src=\"https://dimg08.c-ctrip.com/images/0100i120008y7o60eD123_D_256_180.jpg\" alt=\"travel picture\">   <img src=\"https://dimg08.c-ctrip.com/images/0100i120008y7o60eD123_D_256_180.jpg\" alt=\"travel picture\"></p><p><span style=\"color: rgb(51, 51, 51);\">做为全球第五家，亚洲第三家的北京环球影城，拥7大主题乐园。</span><span class=\"ql-cursor\">﻿</span></p><p><span style=\"color: rgb(51, 51, 51);\">1.功夫熊猫盖世之地</span></p><p><span style=\"color: rgb(51, 51, 51);\">2.变形金刚基地</span></p><p><span style=\"color: rgb(51, 51, 51);\">3.小黄人乐园</span></p><p><span style=\"color: rgb(51, 51, 51);\">4.哈利·波特的魔法世界™</span></p><p><span style=\"color: rgb(51, 51, 51);\">5.侏罗纪世界努布拉岛</span></p><p><span style=\"color: rgb(51, 51, 51);\">6.好莱坞</span></p><p><span style=\"color: rgb(51, 51, 51);\">7.未来水世界</span></p><p><br></p>', 1);
INSERT INTO `spot` VALUES (7, '【春季限定 | 林芝桃花 · 金川梨花 】&【全程舒适住宿+2-6人VIP小包团&5-7座专车】—4个经典桃花观测点+1个梨花观测点+岗云杉林徒步+新措小瑞士+墨石公园+稻城+然乌湖【单反或无人机】随车', '川藏公路', '成都', 0.00, 'http://localhost:8800/image/50947a957f5d426f810d57c11dfb1f30.jpg', '<p><strong style=\"color: rgb(51, 51, 51);\">全国各地—抵达成都 | 集结锦官城，开启春日花事序曲</strong></p><p><br></p><h5>航班</h5><p>【抵达成都双流机场】</p><p>搭乘飞机或火车前往成都，抵达后，我们的工作人员会在机场等候专车接您送到酒店。</p><p>接机后自由活动，时间充裕可以自行游览附近景观，结束后自行返回酒店休息。</p><p>接机机场：成都双流国际机场（天府机场接机需补差价，差价详询客服）。</p><p>【特别提醒】</p><p>1、集合日为自由活动，请在自由活动时注意人身财产安全。</p><p>2、到集合酒店拿房，房费已付，押金自付。对于拼房的队员，客服会将拼房者的电话互换。</p><p>3、领队会在今日21：00之前，通知明日的集合时间，如果21：00尚未接到领队的通知，请及时联系行程管家确认。</p><p><br></p><h5>自由活动</h5><p>推荐：<span style=\"color: rgb(0, 134, 246);\">春熙路</span><strong style=\"color: rgb(0, 134, 246);\">4.6/5</strong></p><p>春熙路是成都的时尚中心、也是当地美食和美女的集中地。来这条成都最具代表性的商业步行街逛逛，吃吃东西，看看养眼的美女，是来成都必做的一件事。</p><p>春熙路不仅仅是一条街，而是指北新街以东、总府路以南、红星路以西、东大街以北、南新街、中新街及其临街区域。外地人来到成都，如果不逛逛春熙路，就好比到北京不去王府井，到上海不到南京路一样会非常遗憾。</p><p>春熙路街道两边，百年老店、时尚商场、品牌专卖、美味小吃店云集，钟水饺、赖汤圆、韩包子、龙抄手等名吃在春熙路上都有分店。周末，这里也是成都市民休闲的绝佳去处。春熙路还是打望成都美女的最好时机。而周末的春熙路，则是一场美女云集的盛会。</p><p>春熙路主街的交汇处是著名的中山广场，屹立着孙中山铜像。北口还有用花岗石雕制而成的成都风俗浮雕艺术墙，描绘了唐代成都的庙会、花会、灯会、采桑等各个景观。</p><p><br></p><p><img src=\"https://youimg1.c-ctrip.com/target/100410000000owden3387_D_10000_1200.jpg?proc=autoorient\"></p><h5>自由活动</h5><p>推荐：<span style=\"color: rgb(0, 134, 246);\">宽窄巷子</span><strong style=\"color: rgb(0, 134, 246);\">4.4/5</strong></p><p>宽窄巷子是成都惟一遗留下来的清朝古街道，由宽巷子、窄巷子和井巷子三条平行排列的城市老式街道及其之间的四合院群落组成。来这里，喝茶、吃火锅，感受成都的闲生活、慢生活和新生活。</p><p>你可以在这里要一杯蒙山黄芽，与旁边的老爷子摆摆龙门阵；也可以唤一名“舒耳郎”，舒舒服服的享受掏耳朵的惬意；更可以在小吃摊边，面对着琳琅满目的小吃大快朵颐。夜幕下的宽窄巷子也是别有韵味，点醉、白夜、胡里等酒吧，都充满了成都的时尚感，在夜间绽放它的魅力。</p><p><br></p><p><img src=\"https://youimg1.c-ctrip.com/target/fd/tg/g2/M06/8B/19/Cghzf1Ww3R2ADXvCAA6Z1674nWU845_D_10000_1200.jpg?proc=autoorient\"></p>', 1);
INSERT INTO `spot` VALUES (9, '赠取消险『高星4晚连住| 开年巨折推荐-费尔蒙·红树林·康年·喜来登』买到即赚到:1. 超优惠的机酒打包价 2. 亚特兰蒂斯水世界/水族馆门票6折起 3. 赠旅拍 4. 一日游/游艇/租车优享价 | 直减300~', '三亚', '三亚', 2292.00, 'http://localhost:8800/image/15dc8507ca344df5b9a66510e491c431.jpg', '<p><strong style=\"color: rgb(0, 112, 192);\">湾区概况：</strong></p><p><strong style=\"color: rgb(0, 112, 192);\">﻿</strong><img src=\"http://localhost:8800/image/e6515b3da60242ecbeb1da20df53d716.jpg\"></p>', 1);

-- ----------------------------
-- Table structure for spot_img
-- ----------------------------
DROP TABLE IF EXISTS `spot_img`;
CREATE TABLE `spot_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `spot_id` int NULL DEFAULT NULL COMMENT '景点id',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spot_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行的方法名称',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法所在的类名',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义的模块名',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义的操作名',
  `record_date` datetime NULL DEFAULT NULL COMMENT '操作的时间',
  `execute_time` int NULL DEFAULT NULL COMMENT '执行的时间（毫秒）',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行的用户ip地址',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传递的参数',
  `operate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户的姓名',
  `operate_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作的账户',
  `operate_result` int NULL DEFAULT NULL COMMENT '操作结果，0失败，1成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1071 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-04 20:07:17', 221, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (2, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-09-04 20:12:16', 6, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>策划师</p>\",\"createTime\":1630757536390,\"id\":16,\"title\":\"1111111\",\"userId\":1}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (3, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2021-09-04 20:16:02', 5, '0:0:0:0:0:0:0:1', '\"16\"', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (4, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-09-04 20:18:17', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (5, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-09-04 20:46:27', 4, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (6, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-09-04 20:46:47', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (7, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-05 08:50:17', 788, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (8, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 09:15:27', 771, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (9, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2021-09-06 09:34:32', 5, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"1111\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (10, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2021-09-06 09:34:35', 4, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"2222\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (11, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2021-09-06 09:34:40', 5, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"2222\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (12, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2021-09-06 09:49:16', 4, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"4342\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (13, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 10:14:56', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (14, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 12:58:04', 10, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (15, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 13:01:20', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (16, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 13:01:59', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (17, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 13:03:12', 11, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (18, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 13:54:00', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (19, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 13:54:50', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (20, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-09-06 13:55:40', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (21, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:18:10', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (22, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:43:50', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (23, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:45:28', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (24, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:48:45', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (25, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:50:34', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (26, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-09-06 14:50:57', 4, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (27, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-09-06 14:51:06', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (28, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:51:28', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (29, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:51:43', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (30, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-09-06 14:52:04', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (31, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 14:54:25', 255, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (32, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 15:12:37', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (33, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 15:13:34', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (34, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 15:14:39', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (35, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2021-09-06 19:02:18', 6, '0:0:0:0:0:0:0:1', '\"20\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (36, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 19:36:45', 244, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (37, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-06 19:39:13', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (38, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 09:08:28', 827, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (39, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 09:29:12', 6, '0:0:0:0:0:0:0:1', '3', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (40, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 09:29:36', 2, '0:0:0:0:0:0:0:1', '4', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (41, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:29:41', 2, '0:0:0:0:0:0:0:1', '24', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (42, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:30:00', 1, '0:0:0:0:0:0:0:1', '24', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (43, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:30:18', 3, '0:0:0:0:0:0:0:1', '23', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (44, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:30:53', 1, '0:0:0:0:0:0:0:1', '23', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (45, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 09:31:01', 4, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (46, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:31:44', 3, '0:0:0:0:0:0:0:1', '20', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (47, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 09:32:12', 2, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (48, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:32:13', 3, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (49, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-09-07 09:36:47', 3, '0:0:0:0:0:0:0:1', '24', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (50, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 09:41:28', 5, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (51, 'getAllRole', 'com.framework.quickly.controller.RoleController', '角色', '获取所有角色', '2021-09-07 10:39:17', 167, '192.168.1.101', '无参数', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (52, 'getAllRole', 'com.framework.quickly.controller.RoleController', '角色', '获取所有角色', '2021-09-07 10:39:41', 4, '192.168.1.101', '无参数', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (53, 'getAllRole', 'com.framework.quickly.controller.RoleController', '角色', '获取所有角色', '2021-09-07 10:39:46', 2, '192.168.1.101', '无参数', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (54, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 14:54:22', 792, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (55, 'addMenu', 'com.framework.quickly.controller.MenuController', '菜单', '添加菜单', '2021-09-07 14:57:26', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (56, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2021-09-07 14:57:40', 5, '0:0:0:0:0:0:0:1', '{\"id\":2,\"isRegister\":0,\"menuIds\":\"4,1,3,2,25,26,19,20,24,23,27\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (57, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 14:57:53', 7, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (58, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-09-07 14:58:04', 5, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (59, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 15:01:58', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (60, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 16:32:27', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (61, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 16:32:39', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (62, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 16:33:10', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (63, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 16:42:15', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (64, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 17:52:28', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (65, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 17:57:35', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (66, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 17:59:38', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (67, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:00:02', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (68, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:01:57', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (69, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:02:55', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (70, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:05:20', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (71, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:06:06', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (72, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:06:35', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (73, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:08:14', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (74, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:11:00', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (75, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:13:08', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (76, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:13:22', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (77, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:14:32', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (78, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:16:53', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (79, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:17:26', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (80, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:31:00', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (81, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:34:05', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (82, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:36:40', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (83, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:38:01', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (84, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:39:08', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (85, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 18:39:50', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (86, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 19:14:51', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (87, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-07 19:15:51', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (88, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 07:56:32', 795, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (89, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:10:40', 5, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (90, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:10:54', 5, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (91, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:11:05', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (92, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:11:55', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (93, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:12:04', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (94, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:12:09', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (95, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:13:47', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (96, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:20:36', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (97, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 08:24:36', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (98, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-08 19:08:14', 7, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (99, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 19:41:27', 857, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (100, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 19:49:24', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (101, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 19:49:46', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (102, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 19:57:09', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (103, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 20:09:04', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (104, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 20:09:21', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (105, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-09-09 20:12:46', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (106, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-05 10:45:15', 797, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (107, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:56:31', 4, '0:0:0:0:0:0:0:1', '15', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (108, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:26', 6, '0:0:0:0:0:0:0:1', '16', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (109, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:27', 5, '0:0:0:0:0:0:0:1', '17', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (110, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:27', 6, '0:0:0:0:0:0:0:1', '18', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (111, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:30', 11, '0:0:0:0:0:0:0:1', '17', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (112, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:30', 5, '0:0:0:0:0:0:0:1', '16', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (113, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:31', 6, '0:0:0:0:0:0:0:1', '15', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (114, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2021-10-05 10:57:32', 5, '0:0:0:0:0:0:0:1', '18', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (115, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-05 21:08:21', 244, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (116, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-06 18:39:16', 801, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (117, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2021-10-06 20:16:20', 8, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"学长\"}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (118, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-07 10:02:46', 872, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (119, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-07 20:20:13', 330, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (120, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2021-10-07 20:43:29', 10, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (121, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-10 10:35:27', 815, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (122, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-10-10 10:41:13', 14, '0:0:0:0:0:0:0:1', '27', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (123, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-10-10 17:59:57', 7, '0:0:0:0:0:0:0:1', '{\"content\":\"\",\"id\":19,\"title\":\"22222222\",\"updateTime\":1633859997145}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (124, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-10-10 18:02:22', 4, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>这是正文内容</p>\",\"id\":19,\"title\":\"22222222\",\"updateTime\":1633860141662}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (125, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-10-10 18:02:30', 5, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>这是正文内容</p>\",\"id\":19,\"title\":\"232323\",\"updateTime\":1633860150308}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (126, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-10-10 18:24:48', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (127, 'editArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '修改文章', '2021-10-10 18:25:36', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (128, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-10-10 19:49:48', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (129, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-10 22:10:42', 221, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (130, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 14:24:18', 826, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (131, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 14:29:22', 5, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (132, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 15:54:08', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (133, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 15:55:24', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (134, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 15:55:38', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (135, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 15:57:05', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (136, 'addMenu', 'com.framework.quickly.controller.MenuController', '菜单', '添加菜单', '2021-10-11 16:14:12', 10, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (137, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2021-10-11 16:14:54', 6, '0:0:0:0:0:0:0:1', '{\"id\":2,\"isRegister\":0,\"menuIds\":\"27,4,1,3,2,25,26,28,19,20,24,23\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (138, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:18:59', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (139, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:19:13', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (140, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:19:40', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (141, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:20:07', 11, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (142, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:21:38', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (143, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:21:45', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (144, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:21:59', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (145, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:22:12', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (146, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:23:34', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (147, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:28:16', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (148, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:29:08', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (149, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:30:20', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (150, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:34:33', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (151, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:34:58', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (152, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:35:14', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (153, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:36:03', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (154, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:38:16', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (155, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:55:49', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (156, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:56:46', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (157, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:57:57', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (158, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:58:44', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (159, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 16:59:47', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (160, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 17:09:13', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (161, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 17:09:58', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (162, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 17:10:14', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (163, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 17:10:47', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (164, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-11 21:24:21', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (165, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-13 15:45:57', 846, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (166, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-10-13 16:30:43', 6, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (167, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-10-13 16:31:17', 1, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (168, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-10-13 16:31:42', 3, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (169, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-13 16:46:30', 7, '0:0:0:0:0:0:0:1', '图片信息', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (170, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-13 16:47:59', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (171, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-13 16:58:43', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (172, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 09:47:23', 819, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (173, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 10:09:30', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (174, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 10:16:38', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (175, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 10:29:44', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (176, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 10:32:16', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (177, 'delMenu', 'com.framework.quickly.controller.MenuController', '菜单', '删除菜单', '2021-10-14 13:19:45', 12, '0:0:0:0:0:0:0:1', '28', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (178, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 15:03:10', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (179, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-14 15:03:33', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (180, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:36:06', 228, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (181, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:36:08', 5, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (182, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:36:17', 255, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (183, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:42:39', 246, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (184, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:44:57', 458, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (185, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:47:01', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (186, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:48:26', 261, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (187, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:50:32', 263, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (188, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 19:55:21', 454, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (189, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-28 21:20:36', 268, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (190, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-29 14:03:56', 261, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (191, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2021-10-29 14:04:33', 7, '0:0:0:0:0:0:0:1', '{\"id\":3,\"isRegister\":0,\"menuIds\":\"27,4,1,3,2,25,26,19,20,24,23\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (192, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2021-10-29 14:05:23', 10, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (193, 'editUser', 'com.framework.quickly.controller.UserController', '用户', '修改信息', '2021-10-29 14:05:49', 8, '0:0:0:0:0:0:0:1', '{\"id\":1,\"password\":\"\",\"realName\":\"陈微微\",\"roleId\":2,\"username\":\"123456\"}', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (194, 'delUser', 'com.framework.quickly.controller.UserController', '用户', '批量删除', '2021-10-29 14:06:07', 7, '0:0:0:0:0:0:0:1', '\"15,14,13,12,11,10,9\"', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (195, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-10-29 14:06:19', 5, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (196, 'downMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单下移', '2021-10-29 14:06:21', 4, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (197, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2021-10-29 14:06:24', 4, '0:0:0:0:0:0:0:1', '27', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (198, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2021-10-29 14:06:36', 7, '0:0:0:0:0:0:0:1', '19', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (199, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2021-10-29 14:06:39', 7, '0:0:0:0:0:0:0:1', '17', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (200, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2021-10-29 14:06:41', 6, '0:0:0:0:0:0:0:1', '18', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (201, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2021-10-29 14:06:43', 6, '0:0:0:0:0:0:0:1', '16', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (202, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2021-10-29 14:06:46', 7, '0:0:0:0:0:0:0:1', '15', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (203, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-29 14:10:27', 4, '0:0:0:0:0:0:0:1', '图片信息', '陈微微', '5', 1);
INSERT INTO `sys_log` VALUES (204, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-29 14:12:06', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (205, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-29 14:12:08', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '5', 0);
INSERT INTO `sys_log` VALUES (206, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-29 14:12:13', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (207, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2021-10-29 14:41:15', 7, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (208, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-29 14:41:21', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (209, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-31 15:49:18', 249, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (210, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-31 15:53:01', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (211, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-10-31 15:53:41', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (212, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-31 16:00:19', 4, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (213, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2021-10-31 16:02:36', 11, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (214, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2021-10-31 16:02:48', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (215, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2021-10-31 16:06:13', 6, '0:0:0:0:0:0:0:1', '\"22,21,19,18\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (216, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2021-10-31 16:06:53', 5, '0:0:0:0:0:0:0:1', '\"11\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (217, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 08:40:25', 247, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (218, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 08:46:33', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (219, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 08:47:12', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (220, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 08:47:37', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (221, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 08:51:28', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (222, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:04:51', 2, '192.168.76.177', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (223, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:20:44', 2, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (224, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:22:44', 1, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (225, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:25:02', 2, '192.168.76.177', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (226, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:30:12', 2, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (227, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:34:20', 2, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (228, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:35:02', 2, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (229, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 09:48:45', 2, '192.168.76.1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (230, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:08:54', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (231, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:14:02', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (232, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:15:14', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (233, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:21:51', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (234, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:26:59', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (235, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:31:40', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (236, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2021-11-15 10:32:06', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (237, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-08 10:21:21', 250, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (238, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-08 10:27:04', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (239, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-01-08 10:47:12', 9, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (240, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-01-08 10:47:30', 8, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (241, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2022-01-08 10:52:22', 5, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"bbb\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (242, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2022-01-08 10:52:25', 6, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"ccc\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (243, 'addRole', 'com.framework.quickly.controller.RoleController', '角色', '新增角色', '2022-01-08 10:52:28', 6, '0:0:0:0:0:0:0:1', '{\"introduce\":\"\",\"isRegister\":0,\"roleName\":\"dasd\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (244, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-08 10:54:52', 6, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>asdfasdfasdf</p>\",\"createTime\":1641610492095,\"id\":23,\"title\":\"dadf\",\"userId\":16}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (245, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2022-01-08 10:56:20', 7, '0:0:0:0:0:0:0:1', '\"23\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (246, 'delUser', 'com.framework.quickly.controller.UserController', '用户', '批量删除', '2022-01-08 13:10:50', 6, '0:0:0:0:0:0:0:1', '\"18,19\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (247, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:05:33', 245, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (248, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:12:57', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (249, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:19:48', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (250, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:19:57', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (251, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:21:24', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (252, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:21:27', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (253, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:21:31', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (254, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:21:35', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (255, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:21:52', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 0);
INSERT INTO `sys_log` VALUES (256, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:22:07', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (257, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:22:26', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (258, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:23:13', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (259, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2022-01-09 12:23:51', 5, '0:0:0:0:0:0:0:1', '{\"id\":2,\"isRegister\":0,\"menuIds\":\"27,2,26,20,23,4,19\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (260, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:24:04', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (261, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:24:39', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (262, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2022-01-09 12:24:48', 4, '0:0:0:0:0:0:0:1', '{\"id\":2,\"isRegister\":0,\"menuIds\":\"27,4,2,26,19,20,24,23\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (263, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 12:25:01', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (264, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 13:49:00', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (265, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 13:49:09', 1, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (266, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 13:50:12', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (267, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 13:50:39', 227, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (268, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-09 13:53:17', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (269, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 19:59:31', 5, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (270, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:00:56', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (271, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:16:31', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (272, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:19:56', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (273, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:20:26', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (274, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:22:04', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (275, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:24:39', 2, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (276, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:24:49', 0, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (277, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:26:20', 2, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (278, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:34:52', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (279, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:35:21', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (280, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-09 20:40:58', 2, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (281, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-10 19:40:25', 254, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (282, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-10 19:40:44', 4, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (283, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-10 19:42:19', 5, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (284, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-10 20:04:46', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (285, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-10 20:05:33', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (286, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-10 20:05:54', 2, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (287, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 10:34:47', 263, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (288, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-01-11 11:59:26', 10, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (289, 'editUser', 'com.framework.quickly.controller.UserController', '用户', '修改信息', '2022-01-11 11:59:38', 11, '0:0:0:0:0:0:0:1', '{\"id\":20,\"password\":\"\",\"realName\":\"cfdafsd\",\"roleId\":2,\"username\":\"abd\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (290, 'delUser', 'com.framework.quickly.controller.UserController', '用户', '批量删除', '2022-01-11 11:59:44', 6, '0:0:0:0:0:0:0:1', '\"20\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (291, 'addMenu', 'com.framework.quickly.controller.MenuController', '菜单', '添加菜单', '2022-01-11 12:00:27', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (292, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2022-01-11 12:00:37', 8, '0:0:0:0:0:0:0:1', '29', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (293, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2022-01-11 12:00:41', 4, '0:0:0:0:0:0:0:1', '29', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (294, 'upMenu', 'com.framework.quickly.controller.MenuController', '菜单', '菜单上移', '2022-01-11 12:00:43', 5, '0:0:0:0:0:0:0:1', '29', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (295, 'grantRole', 'com.framework.quickly.controller.RoleController', '角色', '角色授权', '2022-01-11 12:00:54', 4, '0:0:0:0:0:0:0:1', '{\"id\":3,\"isRegister\":0,\"menuIds\":\"27,4,1,3,2,25,26,19,29,20,24,23\"}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (296, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2022-01-11 12:01:15', 13, '0:0:0:0:0:0:0:1', '3', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (297, 'editStatus', 'com.framework.quickly.controller.RoleController', '角色', '更改角色可注册状态', '2022-01-11 12:01:16', 10, '0:0:0:0:0:0:0:1', '3', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (298, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 12:03:38', 7, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (299, 'delMenu', 'com.framework.quickly.controller.MenuController', '菜单', '删除菜单', '2022-01-11 14:00:32', 8, '0:0:0:0:0:0:0:1', '29', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (300, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 15:46:40', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (301, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 15:47:26', 3, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (302, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 15:49:18', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (303, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 15:51:07', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (304, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 15:51:44', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (305, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 19:24:57', 3, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (306, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 19:26:37', 217, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (307, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 19:38:06', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (308, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-01-11 19:38:31', 1, '0:0:0:0:0:0:0:1', '图片信息', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (309, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 19:39:19', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (310, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-11 19:39:55', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (311, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-11 19:40:42', 6, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>213131</p>\",\"createTime\":1641901242320,\"id\":24,\"title\":\"11\",\"userId\":16}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (312, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2022-01-11 19:42:14', 6, '0:0:0:0:0:0:0:1', '\"24\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (313, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-11 21:07:33', 5, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>42343434</p>\",\"createTime\":1641906452895,\"id\":25,\"title\":\"42\",\"userId\":16}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (314, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-11 21:07:57', 7, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>特特</p>\",\"createTime\":1641906476989,\"id\":26,\"title\":\"ere\",\"userId\":16}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (315, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-12 13:47:24', 235, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (316, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2022-01-12 13:47:48', 8, '0:0:0:0:0:0:0:1', '20', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (317, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2022-01-12 13:47:50', 7, '0:0:0:0:0:0:0:1', '21', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (318, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2022-01-12 13:47:52', 6, '0:0:0:0:0:0:0:1', '22', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (319, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2022-01-12 13:48:08', 9, '0:0:0:0:0:0:0:1', '\"26,25\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (320, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-13 16:04:12', 233, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (321, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-14 11:25:45', 241, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (322, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-14 17:08:51', 219, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (323, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 10:18:43', 236, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (324, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 10:19:42', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (325, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-15 10:32:51', 8, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>啊但是发射点发射点发的算法</p>\",\"createTime\":1642213971477,\"id\":27,\"title\":\"评论区测试\",\"userId\":1}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (326, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 10:33:40', 234, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (327, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-01-15 10:47:03', 7, '0:0:0:0:0:0:0:1', '{\"content\":\"<p>打发士大夫</p>\",\"createTime\":1642214822687,\"id\":28,\"title\":\"评论测试\",\"userId\":16}', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (328, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2022-01-15 10:51:22', 6, '0:0:0:0:0:0:0:1', '\"28\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (329, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 11:47:00', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (330, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 16:24:03', 230, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (331, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 16:24:38', 3, '0:0:0:0:0:0:0:1', '参数保密', '陈微微', '123456', 1);
INSERT INTO `sys_log` VALUES (332, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 16:25:33', 2, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (333, 'delUser', 'com.framework.quickly.controller.UserController', '用户', '批量删除', '2022-01-15 17:07:27', 19, '0:0:0:0:0:0:0:1', '\"1,16\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (334, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-01-15 17:09:20', 9, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (335, 'delUser', 'com.framework.quickly.controller.UserController', '用户', '批量删除', '2022-01-15 17:09:27', 13, '0:0:0:0:0:0:0:1', '\"21,1\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (336, 'delRole', 'com.framework.quickly.controller.RoleController', '角色', '删除角色', '2022-01-15 17:09:57', 2, '0:0:0:0:0:0:0:1', '2', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (337, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-01-15 17:11:04', 306, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (338, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-04 23:27:55', 647, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (339, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-05 15:09:15', 672, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (340, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-07 18:49:21', 681, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (341, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-04-07 18:51:04', 55, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (342, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-07 18:51:37', 5, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (343, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-07 19:02:19', 4, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (344, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-07 19:03:11', 644, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (345, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-04-07 19:05:16', 29, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (346, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-08 16:06:19', 819, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (347, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-04-08 16:06:30', 59, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (348, 'login', 'com.framework.quickly.controller.UserController', '用户', '登录', '2022-04-08 19:50:20', 16, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (349, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-04-08 19:51:44', 335, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (350, 'upload', 'com.framework.quickly.controller.FileController', '文件', '上传文件', '2022-04-08 20:22:58', 31, '0:0:0:0:0:0:0:1', '图片信息', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (351, 'issueArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '发布文章', '2022-04-08 20:23:02', 13, '0:0:0:0:0:0:0:1', '参数过多不显示', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (352, 'delArticle', 'com.framework.quickly.controller.ExtendArticleController', '文章', '删除文章', '2022-04-08 20:23:28', 11, '0:0:0:0:0:0:0:1', '\"29\"', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (353, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-04-08 21:12:06', 19, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (354, 'register', 'com.framework.quickly.controller.UserController', '用户', '注册', '2022-04-08 21:12:34', 13, '0:0:0:0:0:0:0:1', '参数保密', '陈希', 'admin', 1);
INSERT INTO `sys_log` VALUES (357, 'addMenu', 'com.example.trip.controller.MenuController', '菜单', '添加菜单', '2022-04-20 09:59:22', 29, '0:0:0:0:0:0:0:1', '{\"icon\":\"\",\"id\":38,\"introduce\":\"\",\"menuName\":\"景点管理\",\"menuPath\":\"/home/spot\",\"pid\":0,\"sortFlag\":20}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (358, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 10:04:55', 40, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (359, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 10:05:03', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (360, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:05:14', 41, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (361, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:05:47', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (362, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:06:24', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (363, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:07:19', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (364, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:08:04', 13, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (365, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:08:37', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (366, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:08:43', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (367, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:12:15', 327, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (368, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:12:15', 5, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (369, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:12:48', 4, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (370, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:13:44', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (371, 'delComment', 'com.example.trip.controller.CommentController', '留言', '删除留言', '2022-04-20 10:15:32', 43, '0:0:0:0:0:0:0:1', '\"22\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (372, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:16:09', 12, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (373, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:18:42', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (374, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:18:57', 10, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (375, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:20:05', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (376, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:21:16', 9, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (377, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:21:27', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (378, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:21:41', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (379, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:21:53', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (380, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:21:57', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (381, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:22:15', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (382, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:26:24', 67, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (383, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:26:36', 12, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (384, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 10:28:56', 9, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (385, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:29:04', 4, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (386, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:29:14', 9, '0:0:0:0:0:0:0:1', '{\"createTime\":1650421754255,\"id\":25,\"pid\":23,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (387, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:29:26', 6, '0:0:0:0:0:0:0:1', '{\"createTime\":1650421766245,\"id\":26,\"pid\":25,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (388, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:30:00', 3, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (389, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:33:22', 48, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (390, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:34:55', 5, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (391, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:35:25', 4, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (392, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:35:49', 4, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (393, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:37:19', 3, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (394, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:38:41', 39, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (395, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:39:10', 4, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (396, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:39:34', 7, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (397, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 10:40:20', 3, '127.0.0.1', '参数保密', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (398, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:40:31', 7, '0:0:0:0:0:0:0:1', '{\"createTime\":1650422430507,\"id\":27,\"pid\":25,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (399, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:41:20', 7, '0:0:0:0:0:0:0:1', '{\"commentContent\":\"\",\"createTime\":1650422480436,\"id\":28,\"pid\":0,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (400, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:41:43', 9, '0:0:0:0:0:0:0:1', '{\"commentContent\":\"\",\"createTime\":1650422502997,\"id\":29,\"pid\":27,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (401, 'delComment', 'com.example.trip.controller.CommentController', '留言', '删除留言', '2022-04-20 10:43:13', 41, '0:0:0:0:0:0:0:1', '\"25,26,27\"', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (402, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:43:25', 6, '0:0:0:0:0:0:0:1', '{\"commentContent\":\"\",\"createTime\":1650422604604,\"id\":30,\"pid\":24,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (403, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:44:36', 6, '0:0:0:0:0:0:0:1', '{\"commentContent\":\"测试景点5的留言1-3\\n\",\"createTime\":1650422675770,\"id\":31,\"pid\":30,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (404, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:44:46', 7, '0:0:0:0:0:0:0:1', '{\"commentContent\":\"测试景点5的留言3\",\"createTime\":1650422686002,\"id\":32,\"pid\":0,\"userId\":1}', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (405, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:46:50', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, '11', 1);
INSERT INTO `sys_log` VALUES (406, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 10:59:14', 30, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (407, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 11:04:42', 15, '0:0:0:0:0:0:0:1', '参数保密', '1', '1', 1);
INSERT INTO `sys_log` VALUES (408, 'editStatus', 'com.example.trip.controller.RoleController', '角色', '更改角色可注册状态', '2022-04-20 11:58:26', 13, '0:0:0:0:0:0:0:1', '1', '1', '1', 1);
INSERT INTO `sys_log` VALUES (409, 'editStatus', 'com.example.trip.controller.RoleController', '角色', '更改角色可注册状态', '2022-04-20 11:58:34', 10, '0:0:0:0:0:0:0:1', '1', '1', '1', 1);
INSERT INTO `sys_log` VALUES (410, 'editStatus', 'com.example.trip.controller.RoleController', '角色', '更改角色可注册状态', '2022-04-20 11:58:35', 10, '0:0:0:0:0:0:0:1', '23', '1', '1', 1);
INSERT INTO `sys_log` VALUES (411, 'editStatus', 'com.example.trip.controller.RoleController', '角色', '更改角色可注册状态', '2022-04-20 11:58:36', 6, '0:0:0:0:0:0:0:1', '24', '1', '1', 1);
INSERT INTO `sys_log` VALUES (412, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 12:04:43', 3, '0:0:0:0:0:0:0:1', '参数保密', '1', '1', 1);
INSERT INTO `sys_log` VALUES (413, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 12:08:36', 3, '0:0:0:0:0:0:0:1', '参数保密', '1', '1', 1);
INSERT INTO `sys_log` VALUES (414, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 13:57:43', 3, '0:0:0:0:0:0:0:1', '参数保密', '1', '1', 1);
INSERT INTO `sys_log` VALUES (415, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 14:12:01', 10, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (416, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:03:13', 25, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (417, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:03:31', 11, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (418, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:04:43', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (419, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:04:54', 8, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (420, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:05:05', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (421, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-20 15:05:13', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (422, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 15:18:05', 24, '127.0.0.1', '{\"hotelId\":6,\"id\":15,\"isAccept\":0,\"roomId\":14,\"userId\":1}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (423, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 15:42:28', 15, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (424, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 15:43:22', 38, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (425, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-20 15:46:57', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (426, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-20 15:47:00', 8, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (427, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 15:53:06', 32, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (428, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 15:53:36', 30, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (429, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-20 15:53:37', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (430, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 15:56:02', 6, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (431, 'insertSpot', 'com.example.trip.controller.SpotController', '景点', '添加景点信息', '2022-04-20 15:56:06', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (432, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-20 15:56:12', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (433, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 15:56:21', 5, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (434, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-20 15:56:21', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (435, 'delSpot', 'com.example.trip.controller.SpotController', '景点', '删除景点', '2022-04-20 15:56:25', 7, '0:0:0:0:0:0:0:1', '\"8\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (436, 'delComment', 'com.example.trip.controller.CommentController', '留言', '删除留言', '2022-04-20 15:59:48', 16, '0:0:0:0:0:0:0:1', '\"32,31\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (437, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:08:49', 32, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (438, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-20 16:08:59', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (439, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 16:09:07', 9, '0:0:0:0:0:0:0:1', '\"9\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (440, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:10:05', 4, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (441, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:10:14', 7, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (442, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 16:10:15', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (443, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:17:42', 11, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (444, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 16:20:25', 89, '0:0:0:0:0:0:0:1', '\"10,14,15,16,17\"', '11', '11', 1);
INSERT INTO `sys_log` VALUES (445, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-20 16:25:05', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (446, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-20 16:25:22', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (447, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 16:25:31', 27, '0:0:0:0:0:0:0:1', '\"10,11\"', '11', '11', 1);
INSERT INTO `sys_log` VALUES (448, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:31:01', 39, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (449, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:34:25', 36, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (450, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:34:26', 37, '0:0:0:0:0:0:0:1', '图片信息', '11', '11', 1);
INSERT INTO `sys_log` VALUES (451, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-20 16:34:27', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (452, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:39:09', 344, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (453, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:39:09', 274, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (454, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:39:09', 344, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (455, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:40:27', 274, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (456, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:41:17', 274, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (457, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:42:05', 272, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (458, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 16:43:27', 272, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (459, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-20 16:44:17', 12, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (460, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:44:28', 9, '0:0:0:0:0:0:0:1', '图片信息', '11', '11', 1);
INSERT INTO `sys_log` VALUES (461, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-20 16:44:28', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (462, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 16:44:48', 39, '0:0:0:0:0:0:0:1', '图片信息', '11', '11', 1);
INSERT INTO `sys_log` VALUES (463, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-20 16:44:48', 13, '0:0:0:0:0:0:0:1', '参数过多不显示', '11', '11', 1);
INSERT INTO `sys_log` VALUES (464, 'delRoom', 'com.example.trip.controller.RoomController', '房间', '删除房间', '2022-04-20 16:44:53', 12, '0:0:0:0:0:0:0:1', '\"15\"', '11', '11', 1);
INSERT INTO `sys_log` VALUES (465, 'delRoom', 'com.example.trip.controller.RoomController', '房间', '删除房间', '2022-04-20 16:45:53', 3, '0:0:0:0:0:0:0:1', '\"12\"', '11', '11', 0);
INSERT INTO `sys_log` VALUES (466, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:42:39', 358, '0:0:0:0:0:0:0:1', '\"10\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (467, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 18:43:10', 40, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (468, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-20 18:43:14', 16, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (469, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:43:19', 12, '0:0:0:0:0:0:0:1', '\"8\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (470, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 18:47:26', 33, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (471, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 18:47:29', 8, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (472, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 18:47:46', 30, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (473, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-20 18:47:46', 12, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (474, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:47:54', 16, '0:0:0:0:0:0:0:1', '\"11\"', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (475, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:48:49', 6, '0:0:0:0:0:0:0:1', '\"11\"', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (476, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 18:48:49', 16, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (477, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:49:22', 5, '0:0:0:0:0:0:0:1', '\"11\"', '11', '11', 0);
INSERT INTO `sys_log` VALUES (478, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:52:17', 6, '0:0:0:0:0:0:0:1', '\"11\"', '11', '11', 0);
INSERT INTO `sys_log` VALUES (479, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:53:30', 7, '0:0:0:0:0:0:0:1', '\"11\"', '11', '11', 0);
INSERT INTO `sys_log` VALUES (480, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 18:53:35', 3, '127.0.0.1', '参数保密', '11', '11', 1);
INSERT INTO `sys_log` VALUES (481, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:53:42', 7, '0:0:0:0:0:0:0:1', '\"11\"', '11', '11', 0);
INSERT INTO `sys_log` VALUES (482, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 18:54:07', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (483, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 18:54:13', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (484, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 18:54:19', 3, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (485, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 18:54:33', 7, '0:0:0:0:0:0:0:1', '图片信息', '2', '2', 1);
INSERT INTO `sys_log` VALUES (486, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 18:54:37', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (487, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:54:41', 3, '0:0:0:0:0:0:0:1', '\"12\"', '2', '2', 0);
INSERT INTO `sys_log` VALUES (488, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 18:58:19', 336, '0:0:0:0:0:0:0:1', '\"12\"', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (489, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:01:05', 20, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (490, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 19:01:22', 6, '0:0:0:0:0:0:0:1', '\"12\"', '2', '2', 0);
INSERT INTO `sys_log` VALUES (491, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 19:10:20', 333, '0:0:0:0:0:0:0:1', '\"12\"', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (492, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:11:08', 21, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (493, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 19:15:51', 343, '0:0:0:0:0:0:0:1', '\"12\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (494, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:17:21', 13, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (495, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 19:21:07', 9, '0:0:0:0:0:0:0:1', '图片信息', '2', '2', 1);
INSERT INTO `sys_log` VALUES (496, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 19:21:09', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (497, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 19:21:33', 31, '0:0:0:0:0:0:0:1', '图片信息', '2', '2', 1);
INSERT INTO `sys_log` VALUES (498, 'insertHotel', 'com.example.trip.controller.HotelController', '酒店', '插入酒店信息', '2022-04-20 19:21:35', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (499, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 19:21:57', 6, '0:0:0:0:0:0:0:1', '\"11,13,14\"', '2', '2', 0);
INSERT INTO `sys_log` VALUES (500, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-20 19:22:02', 21, '0:0:0:0:0:0:0:1', '\"13,14\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (501, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-20 19:30:11', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (502, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-20 19:31:07', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (503, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-20 19:31:16', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (504, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-20 19:31:50', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (505, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 19:43:36', 19, '127.0.0.1', '\"11\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (506, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:44:34', 5, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (507, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:44:43', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (508, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:44:52', 2, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (509, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:46:35', 16, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (510, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:46:48', 6, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (511, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:47:04', 14, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (512, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:48:10', 13, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (513, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:49:42', 12, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (514, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:51:54', 15, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (515, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:53:16', 15, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (516, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:57:06', 2, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (517, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 19:57:47', 4, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (518, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:59:29', 12, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (519, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 19:59:53', 15, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (520, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:02:17', 10, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (521, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:08:22', 16, '127.0.0.1', '\"10\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (522, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:09:30', 12, '127.0.0.1', '\"18\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (523, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:09:38', 36, '127.0.0.1', '\"20,21,22\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (524, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:10:03', 28, '127.0.0.1', '\"19,23\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (525, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:11:05', 12, '127.0.0.1', '\"24\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (526, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:11:09', 25, '127.0.0.1', '\"25,26\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (527, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:16:29', 32, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (528, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:19:05', 18, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (529, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:19:22', 17, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (530, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:20:50', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (531, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:21:19', 3, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (532, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:21:40', 14, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (533, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:21:47', 12, '127.0.0.1', '\"29\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (534, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:21:58', 6, '127.0.0.1', '\"29\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (535, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:22:03', 6, '127.0.0.1', '\"27\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (536, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:23:53', 13, '127.0.0.1', '参数过多不显示', '2', '2', 1);
INSERT INTO `sys_log` VALUES (537, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:24:42', 5, '127.0.0.1', '\"27\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (538, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:24:42', 7, '127.0.0.1', '\"27\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (539, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:24:46', 6, '127.0.0.1', '\"28\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (540, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:24:52', 6, '127.0.0.1', '\"27\"', '2', '2', 1);
INSERT INTO `sys_log` VALUES (541, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:34:17', 33, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (542, 'delUser', 'com.example.trip.controller.UserController', '用户', '批量删除 同时删除留言订单', '2022-04-20 20:35:45', 41, '0:0:0:0:0:0:0:1', '\"7,8\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (543, 'editUser', 'com.example.trip.controller.UserController', '用户', '修改信息', '2022-04-20 20:39:37', 26, '0:0:0:0:0:0:0:1', '{\"id\":1,\"password\":\"\",\"realName\":\"管理员1\",\"roleId\":23,\"username\":\"1\"}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (544, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:39:43', 14, '0:0:0:0:0:0:0:1', '参数保密', '管理员1', '1', 1);
INSERT INTO `sys_log` VALUES (545, 'editUser', 'com.example.trip.controller.UserController', '用户', '修改信息', '2022-04-20 20:39:53', 9, '0:0:0:0:0:0:0:1', '{\"id\":1,\"password\":\"\",\"realName\":\"管理员\",\"roleId\":23,\"username\":\"1\"}', '管理员1', '1', 1);
INSERT INTO `sys_log` VALUES (546, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:39:56', 3, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (547, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-20 20:41:00', 14, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (548, 'grantRole', 'com.example.trip.controller.RoleController', '角色', '角色授权', '2022-04-20 20:41:31', 7, '0:0:0:0:0:0:0:1', '{\"id\":1,\"menuIds\":\"38\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (549, 'grantRole', 'com.example.trip.controller.RoleController', '角色', '角色授权', '2022-04-20 20:41:38', 7, '0:0:0:0:0:0:0:1', '{\"id\":1,\"menuIds\":\"\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (550, 'grantRole', 'com.example.trip.controller.RoleController', '角色', '角色授权', '2022-04-20 20:41:41', 6, '0:0:0:0:0:0:0:1', '{\"id\":23,\"menuIds\":\"27,4,1,3,2,25,26,19,31,36,35,23,37,32,34,38\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (551, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:42:15', 4, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (552, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:43:02', 14, '127.0.0.1', '{\"endTime\":1649779200000,\"hotelId\":6,\"id\":32,\"isAccept\":0,\"roomId\":14,\"startTime\":1649692800000}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (553, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:43:30', 14, '127.0.0.1', '{\"endTime\":1649347200000,\"hotelId\":7,\"id\":33,\"isAccept\":0,\"roomId\":12,\"startTime\":1649260800000}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (554, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:44:32', 13, '127.0.0.1', '{\"endTime\":1649779200000,\"hotelId\":6,\"id\":34,\"isAccept\":0,\"roomId\":14,\"startTime\":1649692800000}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (555, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:45:26', 3, '127.0.0.1', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (556, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:45:37', 2, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (557, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:45:44', 25, '127.0.0.1', '{\"endTime\":1649952000000,\"hotelId\":6,\"id\":35,\"isAccept\":0,\"roomId\":14,\"startTime\":1649865600000}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (558, 'grantRole', 'com.example.trip.controller.RoleController', '角色', '角色授权', '2022-04-20 20:46:21', 6, '0:0:0:0:0:0:0:1', '{\"id\":23,\"menuIds\":\"27,1,3,2,25,19,36,35,23,37,32,34,38,31,4\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (559, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:46:24', 2, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (560, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:46:27', 7, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (561, 'grantRole', 'com.example.trip.controller.RoleController', '角色', '角色授权', '2022-04-20 20:46:38', 5, '0:0:0:0:0:0:0:1', '{\"id\":23,\"menuIds\":\"27,4,1,3,2,25,26,36,35,37,32,34,38,31,19\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (562, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:46:41', 1, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (563, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:47:49', 4, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (564, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:48:00', 8, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (565, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:48:52', 7, '192.168.1.101', '\"28,29\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (566, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:49:36', 3, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (567, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:49:40', 3, '192.168.1.101', '\"28\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (568, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:51:21', 5, '192.168.1.101', '\"27,28\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (569, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:52:06', 3, '192.168.1.101', '\"31\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (570, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:52:23', 3, '192.168.1.101', '\"29\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (571, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:53:16', 3, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (572, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:53:36', 3, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (573, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:53:46', 3, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (574, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:54:06', 3, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (575, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:55:33', 4, '192.168.1.101', '\"27\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (576, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-20 20:58:56', 342, '192.168.1.101', '\"28,29\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (577, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 20:59:01', 33, '0:0:0:0:0:0:0:1', '图片信息', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (578, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:59:02', 11, '192.168.1.101', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (579, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-20 20:59:32', 334, '192.168.1.101', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (580, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 20:59:38', 15, '192.168.1.101', '参数保密', '2', '2', 1);
INSERT INTO `sys_log` VALUES (581, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-20 21:36:50', 38, '0:0:0:0:0:0:0:1', '图片信息', '2', '2', 1);
INSERT INTO `sys_log` VALUES (582, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-20 21:39:55', 5, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"123456\"}', '2', '2', 0);
INSERT INTO `sys_log` VALUES (583, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-20 21:45:21', 3, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (584, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-20 21:45:29', 3, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"123456\"}', '管理员', '1', 0);
INSERT INTO `sys_log` VALUES (585, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:48:43', 36, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (586, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 08:48:54', 8, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"123456\"}', '管理员', '1', 0);
INSERT INTO `sys_log` VALUES (587, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 08:53:15', 291, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"123456\"}', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (588, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 08:53:39', 4, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"123456\"}', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (589, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 08:54:59', 302, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\"}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (590, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:04', 7, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (591, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:07', 4, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (592, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:12', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (593, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:16', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (594, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:20', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (595, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:21', 4, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (596, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:22', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (597, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:22', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (598, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:22', 2, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (599, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:25', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (600, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:43', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (601, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:44', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (602, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:44', 4, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (603, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:44', 17, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (604, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:46', 4, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (605, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:46', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (606, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:55:57', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (607, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:59:18', 4, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (608, 'editPasswprd', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 08:59:24', 9, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"2\",\"password\":\"c4ca4238a0b923820dcc509a6f75849b\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (609, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 08:59:29', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (610, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:00:42', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (611, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:28', 346, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (612, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:31', 9, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (613, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 09:01:38', 14, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"2\",\"password\":\"c4ca4238a0b923820dcc509a6f75849b\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (614, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:42', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (615, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:43', 4, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (616, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:43', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (617, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:43', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (618, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:43', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (619, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:43', 2, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (620, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:44', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (621, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:44', 2, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (622, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:44', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (623, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:44', 2, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (624, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:01:44', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (625, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:02:29', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (626, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:03:02', 351, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (627, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:04:14', 314, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (628, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:04:33', 8, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (629, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:05:50', 340, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (630, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 09:05:56', 16, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"2\",\"password\":\"c4ca4238a0b923820dcc509a6f75849b\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (631, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:06:00', 3, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (632, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:06:02', 3, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (633, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 09:06:13', 9, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (634, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:06:20', 3, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (635, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 09:06:27', 3, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"1\",\"password\":\"1\"}', '管理员', '1', 0);
INSERT INTO `sys_log` VALUES (636, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 09:06:32', 9, '0:0:0:0:0:0:0:1', '{\"id\":1,\"imgUrl\":\"\",\"oldPass\":\"123456\",\"password\":\"c4ca4238a0b923820dcc509a6f75849b\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (637, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:07:30', 313, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (638, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:07:40', 6, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (639, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-21 09:07:47', 6, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (640, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-21 09:07:55', 11, '127.0.0.1', '参数保密', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (641, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:08:00', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (642, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-21 09:09:04', 10, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (643, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:09:10', 3, '127.0.0.1', '参数保密', NULL, '66', 1);
INSERT INTO `sys_log` VALUES (644, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:09:26', 17, '127.0.0.1', '参数过多不显示', NULL, '66', 1);
INSERT INTO `sys_log` VALUES (645, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:12:36', 3, '127.0.0.1', '{\"endTime\":1652112000000,\"hotelId\":6,\"isAccept\":0,\"roomId\":14,\"startTime\":1652025600000,\"userId\":1}', NULL, '66', 0);
INSERT INTO `sys_log` VALUES (646, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:12:41', 5, '0:0:0:0:0:0:0:1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (647, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:12:48', 3, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (648, 'editStatus', 'com.example.trip.controller.RoleController', '角色', '更改角色可注册状态', '2022-04-21 09:12:53', 11, '0:0:0:0:0:0:0:1', '23', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (649, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:14:35', 35, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (650, 'editRole', 'com.example.trip.controller.RoleController', '角色', '修改角色', '2022-04-21 09:14:57', 7, '0:0:0:0:0:0:0:1', '{\"id\":23,\"introduce\":\"管理员的角色1\",\"roleName\":\"网站管理员\"}', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (651, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:16:15', 6, '127.0.0.1', '参数保密', NULL, '66', 1);
INSERT INTO `sys_log` VALUES (652, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:17:00', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (653, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:18:56', 6, '127.0.0.1', '{\"endTime\":1650902400000,\"hotelId\":6,\"isAccept\":0,\"roomId\":14,\"startTime\":1650816000000,\"userId\":5}', '22', '22', 0);
INSERT INTO `sys_log` VALUES (654, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:19:48', 18, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (655, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 09:22:08', 48, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (656, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 09:22:51', 4, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (657, 'insertSpot', 'com.example.trip.controller.SpotController', '景点', '添加景点信息', '2022-04-21 09:22:53', 10, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (658, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:47:43', 32, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (659, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 09:51:48', 13, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (660, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 09:52:13', 26, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (661, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 09:55:16', 37, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (662, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 09:57:09', 9, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (663, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 09:57:37', 11, '127.0.0.1', '\"39,40\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (664, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 10:03:08', 232, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (665, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 10:04:28', 299, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (666, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:08:20', 15, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (667, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:08:55', 14, '127.0.0.1', '\"38,39\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (668, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:09:18', 6, '127.0.0.1', '\"40\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (669, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:11:28', 5, '127.0.0.1', '\"40\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (670, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:11:39', 13, '127.0.0.1', '\"40,39\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (671, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:20:11', 6, '127.0.0.1', '\"40\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (672, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:21:17', 14, '127.0.0.1', '\"40,39\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (673, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 10:22:07', 286, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (674, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:23:01', 16, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (675, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:23:11', 14, '127.0.0.1', '\"38,39\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (676, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:24:19', 6, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (677, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:24:22', 14, '0:0:0:0:0:0:0:1', '\"27,28\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (678, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:24:26', 7, '127.0.0.1', '\"39\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (679, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:25:02', 20, '0:0:0:0:0:0:0:1', '\"27,28,29\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (680, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:27:28', 421, '0:0:0:0:0:0:0:1', '\"30,31,32\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (681, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 10:28:42', 13, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (682, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:28:48', 41, '127.0.0.1', '\"38\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (683, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 10:28:57', 50, '127.0.0.1', '\"39,40\"', '22', '22', 1);
INSERT INTO `sys_log` VALUES (684, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 10:42:33', 78, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (685, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 10:43:16', 32, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (686, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 10:44:38', 26, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (687, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 10:45:01', 5, '127.0.0.1', '{\"endTime\":1652198400000,\"hotelId\":6,\"isAccept\":0,\"roomId\":14,\"startTime\":1652112000000,\"userId\":5}', '22', '22', 0);
INSERT INTO `sys_log` VALUES (688, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 10:45:12', 2, '127.0.0.1', '{\"endTime\":1652198400000,\"hotelId\":6,\"isAccept\":0,\"roomId\":14,\"startTime\":1652112000000,\"userId\":5}', '22', '22', 0);
INSERT INTO `sys_log` VALUES (689, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 11:45:22', 29, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (690, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 11:53:19', 15, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (691, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 11:54:35', 16, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (692, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 11:56:59', 32, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (693, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 11:58:03', 17, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (694, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 11:59:51', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (695, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 12:00:06', 19, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (696, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:12:17', 38, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (697, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:12:44', 16, '127.0.0.1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (698, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:12:56', 16, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (699, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:14:25', 3, '127.0.0.1', '{\"endTime\":1650038400000,\"hotelId\":6,\"isAccept\":0,\"roomId\":14,\"startTime\":1649952000000,\"userId\":5}', '22', '22', 0);
INSERT INTO `sys_log` VALUES (700, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:14:37', 16, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (701, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:16:19', 15, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (702, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:16:24', 20, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (703, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:16:28', 17, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (704, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:16:39', 20, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (705, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:20:15', 16, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (706, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:20:27', 21, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (707, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 13:20:43', 16, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (708, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:35:02', 6, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (709, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:39:03', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (710, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:40:15', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (711, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:43:10', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (712, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:45:11', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (713, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:46:06', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (714, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 13:47:36', 17, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (715, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:48:00', 18, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (716, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:50:36', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (717, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:51:16', 5, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (718, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:52:04', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (719, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:52:17', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (720, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:52:34', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (721, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:52:38', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (722, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:52:48', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (723, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:54:40', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (724, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:55:07', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (725, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:55:46', 4, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (726, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 13:55:56', 9, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (727, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 13:56:31', 27, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (728, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 13:58:17', 307, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (729, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:00:59', 15, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (730, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:02:59', 59, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (731, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:03:03', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (732, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:03:06', 3, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (733, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:03:10', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (734, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:03:16', 3, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (735, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:03:17', 18, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (736, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:03:44', 293, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (737, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:03:52', 7, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (738, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:03:54', 25, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (739, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:03:59', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (740, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:04:15', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (741, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:04:43', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (742, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:05:09', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (743, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:05:21', 12, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (744, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:11:28', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (745, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:15:14', 6, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (746, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 14:15:33', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (747, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 14:23:22', 105, '0:0:0:0:0:0:0:1', '\"27,28\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (748, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 14:27:25', 46, '0:0:0:0:0:0:0:1', '\"44,45\"', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (749, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-21 14:28:41', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (750, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 15:27:50', 45, '127.0.0.1', '{\"id\":5,\"oldPass\":\"22\",\"password\":\"c81e728d9d4c2f636f067f89cc14862c\"}', NULL, NULL, 1);
INSERT INTO `sys_log` VALUES (751, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:28:28', 12, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (752, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:28:40', 280, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (753, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:28:59', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (754, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 15:29:14', 17, '127.0.0.1', '{\"id\":5,\"oldPass\":\"2\",\"password\":\"b6d767d2f8ed5d21a44b0e5886680cb9\"}', '22', '22', 1);
INSERT INTO `sys_log` VALUES (755, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:30:14', 6, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (756, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:30:19', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (757, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:30:32', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (758, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:30:56', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (759, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:31:41', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (760, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:31:59', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (761, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:37:35', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (762, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:38:52', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (763, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:39:47', 44, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (764, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:40:16', 7, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (765, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:48:06', 45, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (766, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:48:32', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (767, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:49:20', 5, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (768, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:49:52', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (769, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 15:50:22', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (770, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:31:56', 20, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (771, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:33:11', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (772, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:33:56', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (773, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:34:11', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (774, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 17:36:35', 13, '127.0.0.1', '{\"id\":10,\"oldPass\":\"33\",\"password\":\"eccbc87e4b5ce2fe28308fd9f2a7baf3\"}', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (775, 'editPassword', 'com.example.trip.controller.UserController', '用户', '修改密码', '2022-04-21 17:37:48', 11, '127.0.0.1', '{\"id\":10,\"oldPass\":\"3\",\"password\":\"182be0c5cdcd5072bb1864cdee4d3d6e\"}', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (776, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:38:06', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (777, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:38:17', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (778, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:38:31', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (779, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:38:36', 2, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (780, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:38:42', 6, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (781, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 17:39:02', 3, '127.0.0.1', '参数保密', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (782, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 17:39:24', 26, '127.0.0.1', '参数过多不显示', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (783, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-21 17:39:32', 23, '127.0.0.1', '\"59\"', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (784, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 17:39:47', 18, '127.0.0.1', '参数过多不显示', NULL, '33', 1);
INSERT INTO `sys_log` VALUES (785, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:28:17', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (786, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:35:16', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (787, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:35:34', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (788, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:36:02', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (789, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:36:24', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (790, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:37:33', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (791, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:38:23', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (792, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:38:47', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (793, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:39:14', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (794, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:39:33', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (795, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:40:01', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (796, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:40:40', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (797, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:45:58', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (798, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:46:33', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (799, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:49:08', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (800, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:52:42', 5, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (801, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 18:55:54', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (802, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:13:58', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (803, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 19:43:51', 72, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (804, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:44:11', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (805, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:44:25', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (806, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:44:49', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (807, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:44:50', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (808, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 19:44:59', 5, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (809, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:45:03', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (810, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:46:16', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (811, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:46:47', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (812, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 19:47:21', 35, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (813, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:47:26', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (814, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:47:34', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (815, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:47:58', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (816, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:48:07', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (817, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:48:22', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (818, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:48:36', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (819, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:48:53', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (820, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:49:12', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (821, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:50:28', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (822, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-21 19:50:46', 15, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (823, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:52:11', 8, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (824, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:53:06', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (825, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:54:57', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (826, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 19:56:02', 7, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (827, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:56:06', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (828, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 19:56:59', 34, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (829, 'editSpot', 'com.example.trip.controller.SpotController', '景点', '修改景点', '2022-04-21 19:58:06', 10, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (830, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-21 20:07:09', 33, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (831, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-21 20:10:01', 9, '0:0:0:0:0:0:0:1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (832, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 20:44:36', 5, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (833, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-21 20:44:40', 5, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (834, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 08:56:37', 47, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (835, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 08:56:44', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (836, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 08:56:51', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (837, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 08:57:06', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (838, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 09:02:12', 9, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (839, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:08:21', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (840, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:08:35', 6, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (841, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:10:00', 7, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (842, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:10:18', 6, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (843, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:10:38', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (844, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:31:37', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (845, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:32:48', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (846, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:33:04', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (847, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:33:21', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (848, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:34:42', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (849, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:38:05', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (850, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:40:29', 5, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (851, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:42:19', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (852, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:42:42', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (853, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:43:30', 3, '127.0.0.1', '参数保密', NULL, NULL, 0);
INSERT INTO `sys_log` VALUES (854, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:43:34', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (855, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:47:43', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (856, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:48:09', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (857, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 09:48:32', 7, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (858, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 09:48:52', 5, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (859, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:49:36', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (860, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:50:10', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (861, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:50:40', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (862, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:51:18', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (863, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:51:46', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (864, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:52:00', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (865, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:52:16', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (866, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:53:56', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (867, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:56:32', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (868, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:57:29', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (869, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:58:54', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (870, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:59:00', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (871, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 09:59:56', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (872, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:00:50', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (873, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:12:21', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (874, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:15:28', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (875, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:16:59', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (876, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:17:58', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (877, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:18:12', 7, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (878, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:18:39', 7, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (879, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:18:47', 6, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (880, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:19:07', 6, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (881, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:19:26', 5, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (882, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:20:11', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (883, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:20:48', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (884, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:21:15', 5, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (885, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:21:26', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (886, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-22 10:21:26', 5, '127.0.0.1', '参数过多不显示', '22', '22', 1);
INSERT INTO `sys_log` VALUES (887, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:22:14', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (888, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:23:16', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (889, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:23:47', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (890, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:24:49', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (891, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:25:41', 1, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (892, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:32:58', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (893, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:33:14', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (894, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:33:42', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (895, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:34:27', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (896, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:34:48', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (897, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 10:36:08', 66, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (898, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:36:09', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (899, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:36:44', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (900, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:37:03', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (901, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:37:29', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (902, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 10:38:17', 27, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (903, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 10:39:03', 27, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (904, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 10:39:30', 5, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (905, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:39:37', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (906, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:41:21', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (907, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:41:36', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (908, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:42:47', 5, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (909, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 10:42:54', 6, '0:0:0:0:0:0:0:1', '图片信息', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (910, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 10:44:49', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (911, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 11:02:43', 4, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (912, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:04', 2, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (913, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:08', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (914, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:13', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (915, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:18', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (916, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:33', 3, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (917, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:06:38', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (918, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 12:12:26', 2, '127.0.0.1', '参数保密', '22', '22', 1);
INSERT INTO `sys_log` VALUES (919, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 14:59:18', 335, '0:0:0:0:0:0:0:1', '图片信息', '22', '22', 1);
INSERT INTO `sys_log` VALUES (920, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 15:21:20', 21, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (921, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 15:54:34', 9, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (922, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 15:55:11', 70, '127.0.0.1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (923, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 15:57:11', 19, '127.0.0.1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (924, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 15:58:30', 16, '127.0.0.1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (925, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 15:59:06', 16, '127.0.0.1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (926, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 15:59:51', 21, '127.0.0.1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (927, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:05:50', 14, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (928, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:13:45', 5, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (929, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:14:23', 5, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (930, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:17:19', 15, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (931, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:18:29', 14, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (932, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-22 16:18:30', 11, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (933, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:19:19', 29, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (934, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-22 16:19:19', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (935, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:19:57', 26, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (936, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-22 16:19:58', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (937, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 16:19:59', 22, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (938, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 16:20:09', 13, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (939, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:22:55', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (940, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:25:13', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (941, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:25:29', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (942, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:26:07', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (943, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:27:02', 1, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (944, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:28:39', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (945, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:30:06', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (946, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:31:58', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (947, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:32:36', 1, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (948, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 16:32:46', 11, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (949, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:37:55', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (950, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-22 16:40:54', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (951, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-22 16:40:56', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (952, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-22 16:41:01', 4, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (953, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-22 16:41:02', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (954, 'reciveOrder', 'com.example.trip.controller.RoomOrderController', '预定', '预定状态改变', '2022-04-22 16:43:30', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (955, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:50:56', 16, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (956, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:50:57', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (957, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:51:05', 8, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (958, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:51:05', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (959, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:54:03', 26, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (960, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-22 16:54:04', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (961, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:55:59', 6, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (962, 'editHotel', 'com.example.trip.controller.HotelController', '酒店', '修改酒店信息', '2022-04-22 16:56:04', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (963, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:56:15', 4, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (964, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:56:15', 7, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (965, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:56:18', 5, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (966, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:56:28', 32, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (967, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:56:29', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (968, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 16:56:38', 7, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (969, 'editRoom', 'com.example.trip.controller.RoomController', '房间', '修改房间信息', '2022-04-22 16:56:39', 6, '0:0:0:0:0:0:0:1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (970, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 16:59:17', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (971, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:00:14', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (972, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:38:28', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (973, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:39:29', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (974, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:44:37', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (975, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:45:04', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (976, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:48:02', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (977, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:48:59', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (978, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:51:40', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (979, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:55:25', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (980, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:55:58', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (981, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:57:10', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (982, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 17:59:58', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (983, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 18:00:56', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (984, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 18:26:21', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (985, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:15:54', 31, '127.0.0.1', '\"46\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (986, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:24:39', 50, '127.0.0.1', '\"47,48,49\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (987, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:25:10', 47, '127.0.0.1', '\"50,51,52\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (988, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:30:42', 34, '127.0.0.1', '\"53,54\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (989, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:31:01', 17, '127.0.0.1', '\"55\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (990, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:33:42', 16, '127.0.0.1', '\"62\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (991, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:34:10', 16, '127.0.0.1', '\"63\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (992, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:36:10', 23, '127.0.0.1', '\"64\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (993, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:37:26', 16, '127.0.0.1', '\"56\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (994, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:39:09', 18, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (995, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:39:46', 13, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (996, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:40:24', 31, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (997, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:41:30', 13, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (998, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:41:47', 19, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (999, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:42:08', 36, '127.0.0.1', '\"72,73\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1000, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:42:23', 29, '127.0.0.1', '\"74,68\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1001, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:43:08', 14, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1002, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:43:26', 21, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1003, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:43:53', 38, '127.0.0.1', '\"76,75\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1004, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 19:46:13', 15, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1005, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:46:57', 37, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1006, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 19:49:27', 16, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1007, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:49:34', 30, '127.0.0.1', '\"77\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1008, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:50:30', 21, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1009, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:53:59', 17, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1010, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:54:19', 17, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1011, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:54:26', 22, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1012, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:54:47', 33, '127.0.0.1', '\"80,81\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1013, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:56:57', 36, '127.0.0.1', '\"67,78\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1014, 'insertRoomOrder', 'com.example.trip.controller.RoomOrderController', '预定', '用户预定房间', '2022-04-22 19:57:57', 16, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1015, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-22 19:58:36', 102, '127.0.0.1', '\"42,82,70,66,69,79\"', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1016, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:00:37', 56, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1017, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:00:46', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1018, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:18:37', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1019, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:20:55', 39, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1020, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:21:03', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1021, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:23:13', 28, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1022, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 20:23:55', 10, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1023, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:23:59', 2, '127.0.0.1', '参数保密', NULL, '333', 1);
INSERT INTO `sys_log` VALUES (1024, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:24:16', 2, '127.0.0.1', '参数保密', NULL, '333', 1);
INSERT INTO `sys_log` VALUES (1025, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:48:57', 4, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1026, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:49:26', 4, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1027, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:49:54', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1028, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:51:51', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1029, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:56:31', 16, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1030, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 20:57:26', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1031, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:57:33', 36, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1032, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 20:57:46', 8, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1033, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 21:00:13', 4, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1034, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:00:23', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1035, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:00:33', 8, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1036, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:00:41', 4, '127.0.0.1', '参数保密', NULL, '666', 1);
INSERT INTO `sys_log` VALUES (1037, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:01:33', 6, '127.0.0.1', '参数保密', NULL, '666', 1);
INSERT INTO `sys_log` VALUES (1038, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:01:46', 2, '127.0.0.1', '参数保密', NULL, 'a', 1);
INSERT INTO `sys_log` VALUES (1039, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 21:02:20', 26, '0:0:0:0:0:0:0:1', '图片信息', NULL, 'a', 1);
INSERT INTO `sys_log` VALUES (1040, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 21:02:44', 4, '0:0:0:0:0:0:0:1', '图片信息', NULL, 'a', 1);
INSERT INTO `sys_log` VALUES (1041, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:02:52', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1042, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 21:03:02', 4, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1043, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-22 21:03:07', 31, '0:0:0:0:0:0:0:1', '图片信息', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1044, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:03:14', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1045, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:04:00', 9, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1046, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:06:17', 7, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1047, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:07:46', 8, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1048, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:07:51', 3, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1049, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:08:26', 2, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1050, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:09:09', 11, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1051, 'register', 'com.example.trip.controller.UserController', '用户', '注册', '2022-04-22 21:10:51', 8, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1052, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-22 21:10:57', 3, '127.0.0.1', '参数保密', NULL, '55', 1);
INSERT INTO `sys_log` VALUES (1053, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-23 09:26:49', 54, '0:0:0:0:0:0:0:1', '参数保密', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1054, 'delOrder', 'com.example.trip.controller.RoomOrderController', '预定', '删除预定', '2022-04-23 09:33:26', 164, '0:0:0:0:0:0:0:1', '\"29,34,35,37,36,60\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1055, 'delHotel', 'com.example.trip.controller.HotelController', '酒店', '删除酒店信息包括（酒店评论、房间、房间订单）', '2022-04-23 10:15:52', 15, '0:0:0:0:0:0:0:1', '\"11\"', '管理员', '1', 0);
INSERT INTO `sys_log` VALUES (1056, 'delRoom', 'com.example.trip.controller.RoomController', '房间', '删除房间', '2022-04-23 10:16:37', 10, '0:0:0:0:0:0:0:1', '\"20\"', '管理员', '1', 0);
INSERT INTO `sys_log` VALUES (1057, 'delRoom', 'com.example.trip.controller.RoomController', '房间', '删除房间', '2022-04-23 10:16:51', 17, '0:0:0:0:0:0:0:1', '\"19\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1058, 'upload', 'com.example.trip.controller.FileController', '文件', '上传文件', '2022-04-23 10:17:22', 42, '0:0:0:0:0:0:0:1', '图片信息', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1059, 'insertRoom', 'com.example.trip.controller.RoomController', '房间', '新增房间', '2022-04-23 10:17:23', 14, '0:0:0:0:0:0:0:1', '参数过多不显示', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1060, 'delComment', 'com.example.trip.controller.CommentController', '留言', '删除留言', '2022-04-23 10:18:39', 23, '0:0:0:0:0:0:0:1', '\"43\"', '管理员', '1', 1);
INSERT INTO `sys_log` VALUES (1061, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-23 10:20:33', 6, '127.0.0.1', '参数保密', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1062, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:21:11', 9, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1063, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:22:22', 6, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1064, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:22:58', 9, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1065, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:24:45', 5, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1066, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:26:04', 5, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1067, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:26:17', 8, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1068, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:26:34', 10, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1069, 'reply', 'com.example.trip.controller.CommentController', '留言', '发布留言', '2022-04-23 10:26:39', 6, '127.0.0.1', '参数过多不显示', '小小', '22', 1);
INSERT INTO `sys_log` VALUES (1070, 'login', 'com.example.trip.controller.UserController', '用户', '登录', '2022-04-23 10:27:16', 2, '127.0.0.1', '参数保密', '小小', '22', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 'c4ca4238a0b923820dcc509a6f75849b', 23, '管理员', 'http://localhost:8800/image/4f503ccbcd6e4fae9fd40bb3f110a37d.png');
INSERT INTO `user` VALUES (2, '2', 'c81e728d9d4c2f636f067f89cc14862c', 1, '小明', 'http://localhost:8800/image/6de0cc96badc440793600c60b01c6482.png');
INSERT INTO `user` VALUES (3, '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 24, '小星', 'http://localhost:8800/image/6de0cc96badc440793600c60b01c6482.png');
INSERT INTO `user` VALUES (4, '6', '1679091c5a880faf6fb5e6087eb1b2dc', 1, '小志', '');
INSERT INTO `user` VALUES (5, '22', 'b6d767d2f8ed5d21a44b0e5886680cb9', 1, '小小', 'http://localhost:8800/image/da9d5aa8deb749c493c0da6e552031ca.jpg');
INSERT INTO `user` VALUES (6, '7', '8f14e45fceea167a5a36dedd4bea2543', 1, '7', 'http://localhost:8800/image/6de0cc96badc440793600c60b01c6482.png');
INSERT INTO `user` VALUES (9, '景点管理员', 'e10adc3949ba59abbe56e057f20f883e', 24, '景点管理员', NULL);
INSERT INTO `user` VALUES (10, '33', '182be0c5cdcd5072bb1864cdee4d3d6e', 1, NULL, NULL);
INSERT INTO `user` VALUES (11, '66', '3295c76acbf4caaed33c36b1b5fc2cb1', 1, NULL, NULL);
INSERT INTO `user` VALUES (12, '333', '310dcbbf4cce62f762a2aaa148d556bd', 1, NULL, NULL);
INSERT INTO `user` VALUES (13, '666', 'fae0b27c451c728867a567e8c1bb4e53', 1, NULL, NULL);
INSERT INTO `user` VALUES (14, 'a', 'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL);
INSERT INTO `user` VALUES (15, 'aa', 'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL);
INSERT INTO `user` VALUES (16, 'aaa', 'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL);
INSERT INTO `user` VALUES (17, 'aaaa', 'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, NULL);
INSERT INTO `user` VALUES (18, '88', '2a38a4a9316c49e5a833517c45d31070', 1, NULL, NULL);
INSERT INTO `user` VALUES (19, '55', 'b53b3a3d6ab90ce0268229151c9bde11', 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
