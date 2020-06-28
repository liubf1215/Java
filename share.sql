/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : share

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2020-06-26 12:30:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adid` varchar(100) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('e4534535', 'liubf', '961215');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(100) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Java');
INSERT INTO `category` VALUES ('2', 'Python');
INSERT INTO `category` VALUES ('3', '大数据');
INSERT INTO `category` VALUES ('4', '经典电影');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `coid` varchar(100) NOT NULL,
  `collecttime` datetime NOT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `pid` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`coid`,`collecttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('11d0ef28-c3ff-42be-aa10-36248a295a6a', '2020-05-31 22:24:56', '1', 'bb', '3ca76a75e4f64db2bacd0974acc7c897', '23423423dfsdf');
INSERT INTO `collect` VALUES ('4354f84c-1dce-4d56-bc44-7798e4f835c1', '2020-05-31 22:24:45', '1', 'bb', '3ca76a75e4f64db2bacd0974acc7c897', '58403adb-060a-4bc9-ae38-13b0be792908');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(100) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `purl` varchar(100) DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `pcode` varchar(56) DEFAULT NULL,
  `coid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sfk_0001` (`cid`),
  CONSTRAINT `sfk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('08a36b15-492f-4096-97ee-1ea092aebd3e', 'java基础学习', 'https://pan.baidu.com/s/1LnlRlmhKDlxxZpFNIXu9nA', '/img/1593120969137.png', '2020-06-26', '1', '', '1', '2', '6jql', null);
INSERT INTO `product` VALUES ('2116a11f-a26c-4c57-871f-5cf9917a7d44', 'linux简单入门', 'https://pan.baidu.com/s/1MabCcXoHv5suMfMWN5gjAg', '/img/1593120092747.png', '2020-06-26', '1', '', '1', '1', 'vil9', null);
INSERT INTO `product` VALUES ('49fd8ebd-2a2b-42de-9c5c-cbe5315f9c0c', 'java基础入门学习', 'https://pan.baidu.com/s/1Xdw8FklMz6vHjpD56NavXw', '/img/1593119679956.png', '2020-06-26', '1', 'Java从0开始', '1', '1', '0py8', null);
INSERT INTO `product` VALUES ('54254d83-7c0e-484c-8351-8537bbfa653d', 'Mysql入门学习', 'https://pan.baidu.com/s/1GSDByVHj24Zcv3zzbH0B3A', '/img/1593120226535.png', '2020-06-26', '1', '', '1', '1', 'iasu', null);
INSERT INTO `product` VALUES ('796ea2bf-2a69-4823-9134-3d42663459e0', 'Html5基础入门', 'https://pan.baidu.com/s/1Lj_tU2V0OcV9o0uD5Td_hA', '/img/1593122086032.png', '2020-06-26', '1', '', '1', '1', 'uzww', null);
INSERT INTO `product` VALUES ('7f02f5fd-3b29-412a-a7ce-5a5289c0ecb3', 'Spring Boot学习入门', 'https://pan.baidu.com/s/1Y9E8FxNYP4Z9-kx_vuuyvg', '/img/1593122291343.png', '2020-06-26', '1', '', '1', '1', '0pac', null);
INSERT INTO `product` VALUES ('90f619ce-df36-4fe2-8aa2-3a118727cefe', '大数据学习', 'https://pan.baidu.com/s/1cwxc8X94AvvEeUkhRmHNhw', '/img/1593139490158.png', '2020-06-26', '1', '', '1', '3', 'j9jl', null);
INSERT INTO `product` VALUES ('9890f75f-07fe-4fb6-ac4e-8a7bec640814', 'Java web学习开启网站之旅', 'https://pan.baidu.com/s/1zGiPFpyzG0ZXDBSmCaU2GQ', '/img/1593122603904.png', '2020-06-26', '1', '', '1', '1', 'he93', null);
INSERT INTO `product` VALUES ('b1057aed-5c58-4c2e-8b50-450220938e8b', 'Java全套资源学习', 'https://pan.baidu.com/s/1tKJvwVwPq24OqoKeV_5MVQ', '/img/1593120750024.png', '2020-06-26', '1', '', '1', '1', '3uie', null);
INSERT INTO `product` VALUES ('b17e1540-d18d-4cc4-8833-ed6f1327b269', 'JavaScript学习', 'https://pan.baidu.com/s/18vJxErlv4z_w_uSWlstYNA', '/img/1593122167223.png', '2020-06-26', '1', '', '1', '1', 'wk8q', null);
INSERT INTO `product` VALUES ('beb1f79f-b1c1-44b9-a286-f90162eef57a', '泰坦尼克号电影经典欣赏', 'https://pan.baidu.com/s/1AVaSYVf6ez4xjHYzjSDuxw', '/img/1593140130914.png', '2020-06-26', '1', '', '1', '4', 'y7dx', null);
INSERT INTO `product` VALUES ('c8a35f61-96f9-4dc3-8777-df6beceb4f09', 'java spring学习', 'https://pan.baidu.com/s/1fMq8-2ClhV5QZhQe_NmCjw', '/img/1593120362700.png', '2020-06-26', '1', '', '1', '1', 'abfp', null);
INSERT INTO `product` VALUES ('ddafa961-7eb0-4a18-aa69-e54f3baad17d', 'spring mvc学习', 'https://pan.baidu.com/s/1d69jdF69_idw6BoftRhG1Q', '/img/1593120466667.png', '2020-06-26', '1', '', '1', '1', 'b6hd', null);
INSERT INTO `product` VALUES ('de2affbd-b2c5-4a11-863e-7ddcdbfe54b1', 'redis入门', 'https://pan.baidu.com/s/1jCqp7adS-iHLIHJQeV_kcA', '/img/1593120185040.png', '2020-06-26', '1', '', '1', '1', 'u8qp', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(100) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f55b7d3a352a4f0782c910b2c70f1ea4', 'liubf', '961215', '小刘', 'liubf1215@qq.com', '18127952279', '2000-02-01', '男', '1', null);
