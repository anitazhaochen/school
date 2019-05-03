/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 03/05/2019 12:01:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remake` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `senderName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `errorRemake` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `audittype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of audit
-- ----------------------------
BEGIN;
INSERT INTO `audit` VALUES (1, 'sunwukong申请成为教师', 'sunwukong', '猴子别当老师', 3, 2);
INSERT INTO `audit` VALUES (2, 'zhangsan申请成为教师', 'zhangsan', '', 2, 2);
INSERT INTO `audit` VALUES (3, 'wangwu申请成为教师', 'wangwu', '', 2, 2);
INSERT INTO `audit` VALUES (4, 'zhaoliu申请成为教师', 'zhaoliu', '', 2, 2);
INSERT INTO `audit` VALUES (9, '张三发起开课申请', 'zhangsan', '', 2, 1);
INSERT INTO `audit` VALUES (10, '张三发起开课申请', 'zhangsan', '与课程类型不符', 3, 1);
INSERT INTO `audit` VALUES (11, '不做了我', 'zhangsan', '就是不行', 3, 3);
INSERT INTO `audit` VALUES (12, 'test1申请成为教师', 'test1', '', 2, 2);
INSERT INTO `audit` VALUES (13, '不想做了', 'test1', '', 2, 3);
INSERT INTO `audit` VALUES (14, '万夫发起开课申请', 'lenduiwanfu', '', 2, 1);
INSERT INTO `audit` VALUES (15, '张三发起开课申请', 'zhangsan', '', 2, 1);
INSERT INTO `audit` VALUES (16, '张三发起开课申请', 'zhangsan', '', 2, 1);
INSERT INTO `audit` VALUES (17, 'wupeng申请成为教师', 'wupeng', '', 2, 2);
INSERT INTO `audit` VALUES (18, '吴鹏发起开课申请', 'wupeng', '', 2, 1);
INSERT INTO `audit` VALUES (19, '吴鹏发起开课申请', 'wupeng', '', 2, 1);
INSERT INTO `audit` VALUES (20, '张三发起开课申请', 'zhangsan', '', 2, 1);
INSERT INTO `audit` VALUES (21, '吴鹏发起开课申请', 'wupeng', '', 2, 1);
INSERT INTO `audit` VALUES (22, '不想干了，告辞', 'wupeng', '', 2, 3);
INSERT INTO `audit` VALUES (23, 'ceshizhanghao申请成为教师', 'ceshizhanghao', '', 3, 2);
INSERT INTO `audit` VALUES (24, '张三发起开课申请', 'zhangsan', '', 2, 1);
INSERT INTO `audit` VALUES (25, '要去旅行', 'zhangsan', '', 2, 3);
COMMIT;

-- ----------------------------
-- Table structure for auditinfo
-- ----------------------------
DROP TABLE IF EXISTS `auditinfo`;
CREATE TABLE `auditinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auditinfo
-- ----------------------------
BEGIN;
INSERT INTO `auditinfo` VALUES (2, 9, 9);
INSERT INTO `auditinfo` VALUES (3, 10, 10);
INSERT INTO `auditinfo` VALUES (4, 14, 11);
INSERT INTO `auditinfo` VALUES (5, 15, 12);
INSERT INTO `auditinfo` VALUES (6, 16, 13);
INSERT INTO `auditinfo` VALUES (7, 18, 14);
INSERT INTO `auditinfo` VALUES (8, 19, 15);
INSERT INTO `auditinfo` VALUES (9, 20, 16);
INSERT INTO `auditinfo` VALUES (10, 21, 17);
INSERT INTO `auditinfo` VALUES (11, 24, 18);
COMMIT;

-- ----------------------------
-- Table structure for auditstatus
-- ----------------------------
DROP TABLE IF EXISTS `auditstatus`;
CREATE TABLE `auditstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auditstatus
-- ----------------------------
BEGIN;
INSERT INTO `auditstatus` VALUES (1, '待审核');
INSERT INTO `auditstatus` VALUES (2, '审核通过');
INSERT INTO `auditstatus` VALUES (3, '驳回审核');
COMMIT;

-- ----------------------------
-- Table structure for audittype
-- ----------------------------
DROP TABLE IF EXISTS `audittype`;
CREATE TABLE `audittype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audittype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of audittype
-- ----------------------------
BEGIN;
INSERT INTO `audittype` VALUES (1, '课程');
INSERT INTO `audittype` VALUES (2, '求职');
INSERT INTO `audittype` VALUES (3, '离职');
INSERT INTO `audittype` VALUES (4, '其他');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `courseRemake` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `maxSum` int(11) DEFAULT '20',
  `realsum` int(11) DEFAULT '0',
  `statusid` int(11) DEFAULT NULL,
  `startDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `endDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `coursetype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES (1, '马哲', '马克思主义哲学', 1, 40, 37, 2, '2018-05-08', '2018-08-08 ', 3);
INSERT INTO `course` VALUES (2, '思想品德', '思想品德', 1, 20, 14, 2, '2015-05-08', '2015-07-08', 3);
INSERT INTO `course` VALUES (3, '中国政治', '政治主修', 1, 20, 10, 2, '2015-07-08', '2015-07-08', 3);
INSERT INTO `course` VALUES (4, '马克思主义', '马克思主义', 1, 20, 1, 1, '2018-08-08', '2018-08-08 ', 3);
INSERT INTO `course` VALUES (9, '国际英语', '一月英语速成', 4, 20, 2, 2, '2018-08-21', '2018-08-20', 4);
INSERT INTO `course` VALUES (10, '法语', '一周法语速成', 4, 30, 0, 4, '2018-08-25', NULL, 4);
INSERT INTO `course` VALUES (11, '马克思主义2', '学习马克思主义', 1, 40, 1, 1, '2018-08-23', NULL, 1);
INSERT INTO `course` VALUES (12, '俄语', '俄语需要大舌头吗？', 4, 40, 1, 2, '2018-08-20', '2018-08-20', 4);
INSERT INTO `course` VALUES (13, '法语', '1433223', 4, 40, 1, 1, '2018-08-20', NULL, 4);
INSERT INTO `course` VALUES (14, 'JAVA', 'java课程', 8, 20, 2, 1, '2018-08-20', NULL, 2);
INSERT INTO `course` VALUES (15, '123123', '123123', 8, 112, 1, 2, '2018-08-21', '2018-08-20', 2);
INSERT INTO `course` VALUES (16, '计算机组成原理', '计算机组成原理', 4, 50, 2, 5, '2018-08-21', NULL, 4);
INSERT INTO `course` VALUES (17, 'c++', '123123123', 8, 11122, 1, 2, '2018-08-20', NULL, 2);
INSERT INTO `course` VALUES (18, '英语', '英语速成', 4, 20, 1, 2, '2018-08-21', '2018-08-20', 4);
COMMIT;

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) DEFAULT NULL,
  `stuid` int(11) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
BEGIN;
INSERT INTO `courseinfo` VALUES (1, 9, 29, 100);
INSERT INTO `courseinfo` VALUES (2, 11, 29, NULL);
INSERT INTO `courseinfo` VALUES (3, 12, 29, 90);
INSERT INTO `courseinfo` VALUES (4, 12, 28, 55);
INSERT INTO `courseinfo` VALUES (5, 11, 28, NULL);
INSERT INTO `courseinfo` VALUES (6, 9, 28, 77);
INSERT INTO `courseinfo` VALUES (7, 9, 27, 88);
INSERT INTO `courseinfo` VALUES (8, 13, 31, NULL);
INSERT INTO `courseinfo` VALUES (9, 14, 32, NULL);
INSERT INTO `courseinfo` VALUES (10, 14, 2, NULL);
INSERT INTO `courseinfo` VALUES (11, 15, 29, 99);
INSERT INTO `courseinfo` VALUES (12, 16, 2, NULL);
INSERT INTO `courseinfo` VALUES (13, 17, 32, 99);
INSERT INTO `courseinfo` VALUES (14, 16, 35, NULL);
INSERT INTO `courseinfo` VALUES (15, 18, 35, 89);
COMMIT;

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `adddate` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of homework
-- ----------------------------
BEGIN;
INSERT INTO `homework` VALUES (1, '致青春：我们都是追梦人', '<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　习近平总书记非常关心青年成长进步，多次出席青年活动，与青年座谈、给青年回信，和青年谈理想、谈追求、谈青春、谈事业，谆谆教诲语重心长，引领新时代年轻人走好人生之路。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　今年五四青年节恰逢五四运动100周年，习近平总书记将节日的祝贺再次送与全国各族各界青年，也将殷切的期待寄予亿万朝气蓬勃的中国青年。央视时政带您共同领悟，共同进步。</p><p class=\"\" style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　记者/申勇 王志明 史伟 邢彬 耿旭菲 钱子琦 伊斌 欧鹏鹏 吕洋</p><p><br/></p>', 4, '已提交', '1999-1-1');
INSERT INTO `homework` VALUES (2, 'asdfsadfsadfsadfas', '<p>fsadfsdaaaaaaaaaaaasdfasdfsafd</p>', 4, '未提交', NULL);
INSERT INTO `homework` VALUES (3, 'asfdsadfsadf', '<p>asdfsadfsadfsadf</p>', 4, '已提交', NULL);
INSERT INTO `homework` VALUES (4, '1111111111', '<p>1222222222222</p>', 4, '已提交', NULL);
INSERT INTO `homework` VALUES (5, '111111111122222222', '233333333333333333', 4, '已提交', '2019-05-02 16:05:164');
COMMIT;

-- ----------------------------
-- Table structure for logininfo
-- ----------------------------
DROP TABLE IF EXISTS `logininfo`;
CREATE TABLE `logininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `powerid` int(11) DEFAULT '3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of logininfo
-- ----------------------------
BEGIN;
INSERT INTO `logininfo` VALUES (1, 'admin', 'admin', '超级管理员', 1);
INSERT INTO `logininfo` VALUES (3, 'zhangsan', 'zhangsan', '张三', 4);
INSERT INTO `logininfo` VALUES (4, 'sunwukong', 'sunwukong', '卡卡罗特', 3);
INSERT INTO `logininfo` VALUES (5, 'lenduiwanfu', 'lenduiwanfu', '李老师', 2);
INSERT INTO `logininfo` VALUES (6, 'lisi', '123456', '李四', 3);
INSERT INTO `logininfo` VALUES (7, 'test30', '123456', '测试账号30', 3);
INSERT INTO `logininfo` VALUES (8, 'test29', '123456', '测试账号29', 3);
INSERT INTO `logininfo` VALUES (9, 'test28', '123456', '测试账号28', 3);
INSERT INTO `logininfo` VALUES (10, 'test27', '123456', '测试账号27', 3);
INSERT INTO `logininfo` VALUES (11, 'test26', '123456', '测试账号26', 3);
INSERT INTO `logininfo` VALUES (12, 'test25', '123456', '测试账号25', 3);
INSERT INTO `logininfo` VALUES (13, 'test24', '123456', '测试账号24', 3);
INSERT INTO `logininfo` VALUES (14, 'test23', '123456', '测试账号23', 3);
INSERT INTO `logininfo` VALUES (15, 'test22', '123456', '测试账号22', 3);
INSERT INTO `logininfo` VALUES (16, 'test21', '123456', '测试账号21', 3);
INSERT INTO `logininfo` VALUES (17, 'test20', '123456', '测试账号20', 3);
INSERT INTO `logininfo` VALUES (18, 'test19', '123456', '测试账号19', 3);
INSERT INTO `logininfo` VALUES (19, 'test18', '123456', '测试账号18', 3);
INSERT INTO `logininfo` VALUES (20, 'test17', '123456', '测试账号17', 3);
INSERT INTO `logininfo` VALUES (21, 'test16', '123456', '测试账号16', 3);
INSERT INTO `logininfo` VALUES (22, 'test15', '123456', '测试账号15', 3);
INSERT INTO `logininfo` VALUES (23, 'test14', '123456', '测试账号14', 3);
INSERT INTO `logininfo` VALUES (24, 'test13', '123456', '测试账号13', 3);
INSERT INTO `logininfo` VALUES (25, 'test12', '123456', '测试账号12', 3);
INSERT INTO `logininfo` VALUES (26, 'test11', '123456', '测试账号11', 3);
INSERT INTO `logininfo` VALUES (27, 'test10', '123456', '测试账号10', 3);
INSERT INTO `logininfo` VALUES (28, 'test9', '123456', '测试账号9', 3);
INSERT INTO `logininfo` VALUES (29, 'test8', '123456', '测试账号8', 3);
INSERT INTO `logininfo` VALUES (30, 'test7', '123456', '测试账号7', 3);
INSERT INTO `logininfo` VALUES (31, 'test6', '123456', '测试账号6', 3);
INSERT INTO `logininfo` VALUES (32, 'test5', '123456', '测试账号5', 3);
INSERT INTO `logininfo` VALUES (33, 'test4', '123456', '测试账号4', 3);
INSERT INTO `logininfo` VALUES (34, 'test3', '123456', '测试账号3', 3);
INSERT INTO `logininfo` VALUES (35, 'test2', '123456', '测试账号2', 3);
INSERT INTO `logininfo` VALUES (36, 'test1', '123456', '徐徐徐', 4);
INSERT INTO `logininfo` VALUES (37, 'wangwu', '123456', '王五', 2);
INSERT INTO `logininfo` VALUES (38, 'zhaoliu', '123456', '赵六', 2);
INSERT INTO `logininfo` VALUES (39, 'z156888358', '123456', '酒宿', 3);
INSERT INTO `logininfo` VALUES (40, 'wupeng', '123456', '吴鹏', 3);
INSERT INTO `logininfo` VALUES (41, 'gzx', '123456', '万祥', 3);
INSERT INTO `logininfo` VALUES (42, 'ceshizhanghao', '123456', '测试', 3);
INSERT INTO `logininfo` VALUES (43, '123123', '123123', '123123', 3);
COMMIT;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `addtime` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` VALUES (1, '打工是不可能打工的，这辈子不可能打工的。做生意又不会做，就是偷这种东西，才能维持得了生活这样子。', 1, '2018-5-1');
INSERT INTO `notice` VALUES (2, '                啊啊啊啊啊', 5, '2019-05-01 16:05:117');
INSERT INTO `notice` VALUES (3, '                阿斯蒂芬撒旦法撒旦法', 5, '2019-05-01 16:05:785');
INSERT INTO `notice` VALUES (4, '                撒旦法撒旦法十大', 5, '2019-05-01 16:05:937');
INSERT INTO `notice` VALUES (5, '                你好，', 5, '2019-05-01 16:05:950');
INSERT INTO `notice` VALUES (6, '                啊啊啊啊所', 5, '2019-05-01 16:05:551');
INSERT INTO `notice` VALUES (7, '                啊啊啊啊', 5, '2019-05-01 16:05:326');
INSERT INTO `notice` VALUES (8, '                asdfsdf sd', 5, '2019-05-01 16:05:149');
INSERT INTO `notice` VALUES (9, '                ', 5, '2019-05-01 16:05:616');
INSERT INTO `notice` VALUES (10, '                asdfsdf', 5, '2019-05-01 16:05:839');
INSERT INTO `notice` VALUES (11, '                aaasdfsdfsd', 5, '2019-05-01 16:05:92');
INSERT INTO `notice` VALUES (12, '                aaaaa', 5, '2019-05-01 16:05:685');
INSERT INTO `notice` VALUES (13, '                你好啊', 5, '2019-05-01 16:05:377');
COMMIT;

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `powerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of power
-- ----------------------------
BEGIN;
INSERT INTO `power` VALUES (1, '管理员');
INSERT INTO `power` VALUES (2, '教师');
INSERT INTO `power` VALUES (3, '学生');
INSERT INTO `power` VALUES (4, '离职教师');
INSERT INTO `power` VALUES (5, '游客');
COMMIT;

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of profession
-- ----------------------------
BEGIN;
INSERT INTO `profession` VALUES (1, '政治');
INSERT INTO `profession` VALUES (2, '软件编程');
INSERT INTO `profession` VALUES (3, '音乐');
INSERT INTO `profession` VALUES (4, '计算机');
INSERT INTO `profession` VALUES (5, '画画');
COMMIT;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of status
-- ----------------------------
BEGIN;
INSERT INTO `status` VALUES (1, '已开课');
INSERT INTO `status` VALUES (2, '已结课');
INSERT INTO `status` VALUES (3, '待审核');
INSERT INTO `status` VALUES (4, '被驳回');
INSERT INTO `status` VALUES (5, '学生提交中');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stuphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '17321555501',
  `age` int(11) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (1, '学生测试账号30', '17321555501', 18, 'test30', '男');
INSERT INTO `student` VALUES (2, '学生测试账号29', '17321555501', 18, 'test29', '女');
INSERT INTO `student` VALUES (3, '学生测试账号28', '17321555501', 18, 'test28', '男');
INSERT INTO `student` VALUES (4, '学生测试账号27', '17321555501', 18, 'test27', '女');
INSERT INTO `student` VALUES (5, '学生测试账号26', '17321555501', 18, 'test26', '男');
INSERT INTO `student` VALUES (6, '学生测试账号25', '17321555501', 18, 'test25', '女');
INSERT INTO `student` VALUES (7, '学生测试账号24', '17321555501', 18, 'test24', '男');
INSERT INTO `student` VALUES (8, '学生测试账号23', '17321555501', 18, 'test23', '女');
INSERT INTO `student` VALUES (9, '学生测试账号22', '17321555501', 18, 'test22', '男');
INSERT INTO `student` VALUES (10, '学生测试账号21', '17321555501', 18, 'test21', '女');
INSERT INTO `student` VALUES (11, '学生测试账号20', '17321555501', 18, 'test20', '男');
INSERT INTO `student` VALUES (12, '学生测试账号19', '17321555501', 18, 'test19', '女');
INSERT INTO `student` VALUES (13, '学生测试账号18', '17321555501', 18, 'test18', '男');
INSERT INTO `student` VALUES (14, '学生测试账号17', '17321555501', 18, 'test17', '女');
INSERT INTO `student` VALUES (15, '学生测试账号16', '17321555501', 18, 'test16', '男');
INSERT INTO `student` VALUES (16, '学生测试账号15', '17321555501', 18, 'test15', '女');
INSERT INTO `student` VALUES (17, '学生测试账号14', '17321555501', 18, 'test14', '男');
INSERT INTO `student` VALUES (18, '学生测试账号13', '17321555501', 18, 'test13', '女');
INSERT INTO `student` VALUES (19, '学生测试账号12', '17321555501', 18, 'test12', '男');
INSERT INTO `student` VALUES (20, '学生测试账号11', '17321555501', 18, 'test11', '女');
INSERT INTO `student` VALUES (21, '学生测试账号10', '17321555501', 18, 'test10', '男');
INSERT INTO `student` VALUES (22, '学生测试账号9', '17321555501', 18, 'test9', '女');
INSERT INTO `student` VALUES (23, '学生测试账号8', '17321555501', 18, 'test8', '男');
INSERT INTO `student` VALUES (24, '学生测试账号7', '17321555501', 18, 'test7', '女');
INSERT INTO `student` VALUES (25, '学生测试账号6', '17321555501', 18, 'test6', '男');
INSERT INTO `student` VALUES (26, '学生测试账号5', '17321555501', 18, 'test5', '女');
INSERT INTO `student` VALUES (27, '学生测试账号4', '17321555501', 18, 'test4', '男');
INSERT INTO `student` VALUES (28, '学生测试账号3', '17321555501', 18, 'test3', '女');
INSERT INTO `student` VALUES (29, '学生测试账号2', '17321555501', 18, 'test2', '男');
INSERT INTO `student` VALUES (30, '学生测试账号1', '17321555501', 18, 'test1', '女');
INSERT INTO `student` VALUES (31, '周翔', '17321321321', 23, 'z156888358', '男');
INSERT INTO `student` VALUES (32, '高宗祥', '18051361392', 23, 'gzx', '男');
INSERT INTO `student` VALUES (33, '1111', '12345678912', 66, 'wupeng', '男');
INSERT INTO `student` VALUES (34, '测试1', '12345678912', 22, 'ceshizhanghao', '男');
INSERT INTO `student` VALUES (35, '周翔', '17321555501', 23, '123123', '男');
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseSum` int(11) DEFAULT '0',
  `teacherPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remake` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `profession` int(11) DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf16 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (1, '万夫', 3, '17321555506', 'lenduiwanfu', '我是一名政治老师', 30, 1, '男', 1);
INSERT INTO `teacher` VALUES (3, '孙悟空', 0, '17777777777', 'sunwukong', '孙老师教音乐', 30, 3, '男', 3);
INSERT INTO `teacher` VALUES (4, '张三', 3, '17777333372', 'zhangsan', '一名英语老师', 32, 4, '男', 2);
INSERT INTO `teacher` VALUES (5, '王五', 0, '12312312312', 'wangwu', '我想成为一名政治老师', 21, 1, '男', 1);
INSERT INTO `teacher` VALUES (6, '赵六', 0, '13013702975', 'zhaoliu', '我想当一名美术教师', 50, 5, '男', 1);
INSERT INTO `teacher` VALUES (7, '序序序', 0, '17321555501', 'test1', '一名资深画画教师', 23, 5, '男', 2);
INSERT INTO `teacher` VALUES (8, '吴鹏', 3, '13013702975', 'wupeng', '我想成为一名计算机教师', 23, 2, '男', 2);
COMMIT;

-- ----------------------------
-- Table structure for teacherstatus
-- ----------------------------
DROP TABLE IF EXISTS `teacherstatus`;
CREATE TABLE `teacherstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacherstatus
-- ----------------------------
BEGIN;
INSERT INTO `teacherstatus` VALUES (1, '在职');
INSERT INTO `teacherstatus` VALUES (2, '离职');
INSERT INTO `teacherstatus` VALUES (3, '申请待审核');
COMMIT;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oldname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pathname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video
-- ----------------------------
BEGIN;
INSERT INTO `video` VALUES (4, '1555691874409.mp4', '1556690780541.mp4', 5);
INSERT INTO `video` VALUES (5, '123.mp4', '1556690900478.mp4', 5);
INSERT INTO `video` VALUES (8, '技术原理简图.png', '1556706272402.png', 5);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
