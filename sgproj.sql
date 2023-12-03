/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : sgproj

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2021-06-06 12:25:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `f_teacher` varchar(30) CHARACTER SET utf8 NOT NULL,
  `f_time` date NOT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('10', '19计科一班', '曹老师', '2021-06-04');
INSERT INTO `t_class` VALUES ('11', '19计科二班', '刘老师', '2021-06-04');
INSERT INTO `t_class` VALUES ('12', '19软件测试1班', '孙老师', '2021-06-04');
INSERT INTO `t_class` VALUES ('13', '19软件测试2班', '王老师', '2021-02-19');
INSERT INTO `t_class` VALUES ('16', '19广电二班', '王老师', '2021-06-02');

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_time` date NOT NULL,
  `f_info` text CHARACTER SET utf8,
  `f_isok` tinyint(4) NOT NULL,
  `fk_roomid` int(11) NOT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `f_room` (`fk_roomid`),
  CONSTRAINT `f_room` FOREIGN KEY (`fk_roomid`) REFERENCES `t_room` (`pk_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES ('16', '2021-06-02', '厕所洗手台漏水', '0', '8');
INSERT INTO `t_record` VALUES ('18', '2021-06-01', '防盗门损坏', '1', '21');
INSERT INTO `t_record` VALUES ('19', '2021-06-01', '浴室花洒损坏', '1', '21');
INSERT INTO `t_record` VALUES ('20', '2021-06-02', '门把手损坏', '1', '22');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_address` varchar(25) CHARACTER SET utf8 NOT NULL,
  `f_maxnum` int(11) NOT NULL,
  `f_stucount` int(11) NOT NULL DEFAULT '0',
  `f_price` int(6) NOT NULL,
  `f_master` varchar(10) CHARACTER SET utf8 NOT NULL,
  `f_phone` varchar(15) NOT NULL,
  `f_state` tinyint(4) NOT NULL,
  `f_type` varchar(25) CHARACTER SET utf8 NOT NULL,
  `f_sextype` tinyint(4) NOT NULL,
  `f_pay` varchar(15) CHARACTER SET utf8 NOT NULL,
  `f_time` date NOT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('8', '人民南路二段21号', '2', '2', '1200', '王先生', '2681734', '2', '两室一厅', '2', '月租', '2021-06-01');
INSERT INTO `t_room` VALUES ('19', '桐梓林东路12号', '4', '2', '1400', '刘先生', '2798462', '1', '三室两厅', '1', '月租', '2021-06-01');
INSERT INTO `t_room` VALUES ('20', '华桂路18号', '4', '3', '1300', '李先生', '2795483', '1', '三室两厅', '1', '月租', '2021-06-23');
INSERT INTO `t_room` VALUES ('21', '龙周路233号', '5', '0', '1300', '刘先生', '2459873', '1', '两室一厅', '1', '月租', '2021-06-01');
INSERT INTO `t_room` VALUES ('22', '金周路530号', '4', '0', '800', '谢先生', '1829307', '1', '两室一厅', '2', '季付', '2021-06-08');
INSERT INTO `t_room` VALUES ('23', '二环路东1段25号', '3', '0', '1200', '杨先生', '1029836', '1', '三室一厅', '2', '月租', '2019-11-14');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `f_sex` tinyint(4) NOT NULL,
  `f_photo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `f_phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `f_time` date NOT NULL,
  `fk_classid` int(11) NOT NULL,
  `fk_roomid` int(11) NOT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `fk_class` (`fk_classid`),
  KEY `fk_room` (`fk_roomid`),
  CONSTRAINT `fk_class` FOREIGN KEY (`fk_classid`) REFERENCES `t_class` (`pk_id`),
  CONSTRAINT `fk_room` FOREIGN KEY (`fk_roomid`) REFERENCES `t_room` (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('14', '猪八戒', '1', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '131', '2021-06-02', '10', '19');
INSERT INTO `t_student` VALUES ('15', '黄盖', '1', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '185123989', '2021-06-01', '16', '20');
INSERT INTO `t_student` VALUES ('16', '孙权', '1', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '1951230123', '2021-06-16', '10', '20');
INSERT INTO `t_student` VALUES ('17', '关羽', '1', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '1223123123', '2021-06-08', '10', '19');
INSERT INTO `t_student` VALUES ('18', '张飞', '1', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '1851239231', '2021-06-15', '12', '20');
INSERT INTO `t_student` VALUES ('19', '小乔', '2', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '18221374671', '2021-06-01', '13', '8');
INSERT INTO `t_student` VALUES ('20', '大乔', '2', 'C:\\Users\\yangx\\Pictures\\Saved Pictures\\defaultHead.JPG', '19019856992', '2021-05-01', '13', '8');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `pk_userid` int(11) NOT NULL AUTO_INCREMENT,
  `f_username` varchar(21) CHARACTER SET utf8 NOT NULL,
  `f_password` varchar(21) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`pk_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '1');
DROP TRIGGER IF EXISTS `insertAftert_student`;
DELIMITER ;;
CREATE TRIGGER `insertAftert_student` AFTER INSERT ON `t_student` FOR EACH ROW UPDATE t_room SET f_stucount = f_stucount + 1 WHERE  pk_id = new.fk_roomid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteAftert_student`;
DELIMITER ;;
CREATE TRIGGER `deleteAftert_student` AFTER DELETE ON `t_student` FOR EACH ROW UPDATE t_room SET f_stucount = f_stucount - 1 WHERE  pk_id = old.fk_roomid
;;
DELIMITER ;
