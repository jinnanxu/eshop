/*
Navicat MySQL Data Transfer

Source Server         : 本地MySQL
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2022-04-21 14:43:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '1234');
INSERT INTO `admin` VALUES ('2', 'admin2', '123456');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('20', '22', '2', '12');
INSERT INTO `cart` VALUES ('21', '19', '1', '12');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_delete` int(1) DEFAULT '0',
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'CPU', '0', 'http://129.211.222.131:18080/images/20220418202142mrsg3.jpg');
INSERT INTO `category` VALUES ('2', '内存', '0', null);
INSERT INTO `category` VALUES ('3', '硬盘', '0', 'http://129.211.222.131:18080/images/20220421093614ufkew.jpg');
INSERT INTO `category` VALUES ('8', '机箱电源', '0', 'http://129.211.222.131:18080/images/202204182022129jqdo.jpg');
INSERT INTO `category` VALUES ('9', '显示器', '0', 'http://129.211.222.131:18080/images/20220418203652aqk25.jpg');
INSERT INTO `category` VALUES ('10', '键盘鼠标', '0', 'http://129.211.222.131:18080/images/20220418202319rivab.jpg');
INSERT INTO `category` VALUES ('11', '显卡', '0', 'http://129.211.222.131:18080/images/202204182022030a618.jpg');
INSERT INTO `category` VALUES ('13', '外设配件', '0', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `publish_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '8', '5', null, '裙子很漂亮，面料舒适，这个季节穿很合适', '2022-03-26 22:07:34', null);
INSERT INTO `comment` VALUES ('2', '10', '4', null, '裙子很漂亮，通勤跟周末都适合', '2022-03-27 10:29:51', null);
INSERT INTO `comment` VALUES ('3', '5', '19', null, '显示效果非常好，用来办公效率明显提高！', '2022-04-20 09:19:21', '11');
INSERT INTO `comment` VALUES ('4', '5', '21', null, '性价比很高，适合学生党！', '2022-04-20 09:20:09', '11');
INSERT INTO `comment` VALUES ('5', '4', '20', null, '非常好用，显示清晰', '2022-04-21 12:12:03', '14');

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `express_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `express_no` varchar(32) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `curr_location` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`express_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('4', '11', '20219812741', '2022-04-18 09:47:13', '商家已发货', null);
INSERT INTO `express` VALUES ('5', '11', '20219812741', '2022-04-18 10:26:54', '快递已到达黄村站点', null);
INSERT INTO `express` VALUES ('6', '11', '20219812741', '2022-04-18 10:23:45', '黄村站点快递员黄永胜(18798231003)已揽收', null);
INSERT INTO `express` VALUES ('7', '11', '20219812741', '2022-04-18 18:26:17', '快递已到达义务物流园，准备发往杭州集散中心', null);
INSERT INTO `express` VALUES ('8', '13', 'SF82178993', '2022-04-21 09:30:14', '商家已发货', null);
INSERT INTO `express` VALUES ('9', '14', 'SF19983903', '2022-04-21 09:36:46', '商家已发货', null);
INSERT INTO `express` VALUES ('10', '14', 'SF19983903', '2022-04-21 09:37:02', '快递员已揽收', null);
INSERT INTO `express` VALUES ('11', '14', 'SF19983903', '2022-04-21 12:11:30', '开始派送', null);

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('7', '5', '20');
INSERT INTO `favorite` VALUES ('9', '12', '19');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(12) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `product_id` int(12) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qutity` int(10) DEFAULT '1',
  `iscomment` int(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('14', '11', '21', '2749', '1', '1');
INSERT INTO `item` VALUES ('15', '11', '19', '879', '1', '1');
INSERT INTO `item` VALUES ('16', '12', '17', '1499', '1', '0');
INSERT INTO `item` VALUES ('17', '13', '22', '29.9', '1', '0');
INSERT INTO `item` VALUES ('18', '13', '19', '879', '1', '0');
INSERT INTO `item` VALUES ('19', '14', '20', '1599', '1', '1');
INSERT INTO `item` VALUES ('20', '14', '22', '29.9', '1', '0');
INSERT INTO `item` VALUES ('21', '15', '27', '509', '1', '0');
INSERT INTO `item` VALUES ('22', '15', '19', '879', '1', '0');
INSERT INTO `item` VALUES ('23', '16', '22', '29.9', '2', '0');
INSERT INTO `item` VALUES ('24', '16', '18', '1588', '1', '0');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `content` text,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '春季大促', '2022-03-25 22:13:55', '4月30日前，春季大促，满199减20，满299减50！');
INSERT INTO `notice` VALUES ('2', '关于运费险的通知', '2022-03-25 22:24:05', '4月1日起不再赠送运费险');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pic` varchar(255) DEFAULT NULL,
  `describ` text,
  `discount` double DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `sub_title` text,
  `status` int(11) DEFAULT NULL,
  `view_count` int(11) unsigned zerofill DEFAULT NULL,
  `sale_count` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', '1', 'i5-12400F CPU', '1499', '2022-04-14 08:04:55', 'http://129.211.222.131:18080/images/202204141604537ggug.jpg', '<ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"英特尔i5-12400F\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：英特尔i5-12400F</li><li title=\"100031035610\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100031035610</li><li title=\"451.00g\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：451.00g</li><li title=\"马来西亚/越南/中国大陆等\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：马来西亚/越南/中国大陆等</li><li title=\"六核\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">核心数：六核</li><li title=\"Intel 7\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">制程工艺：Intel 7</li><li title=\"带风扇\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否自带风扇：带风扇</li><li title=\"intel\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">处理器：intel</li><li title=\"酷睿i5\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">型号：酷睿i5</li><li title=\"INTEL LGA1700\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：INTEL LGA1700</li><li title=\"Z690，B660\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">搭配主板(Intel)：Z690，B660</li><li title=\"不支持核显\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否支持核显：不支持核显</li><li title=\"12线程\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">线程数量：12线程</li><li title=\"家用/办公\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">类型：家用/办公</li></ul><div><img src=\"http://129.211.222.131:18080/images/2022041416043900gqu.jpg\" style=\"max-width:100%;\"><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px; white-space: nowrap;\"><br></span></div><p><img src=\"http://129.211.222.131:18080/images/20220414160450r5ktd.jpg\" style=\"max-width:100%;\"><br></p>', '0', '100', '英特尔（Intel）12代 i5-12400F CPU处理器 6核12线程 单核睿频至高4.4Ghz 10400F迭代升级款', '1', '00000000007', '00000000000');
INSERT INTO `product` VALUES ('18', '1', 'AMD 锐龙5 5600X', '1588', '2022-04-14 08:15:01', 'http://129.211.222.131:18080/images/20220414161459sdkdh.jpg', '<ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"AMD锐龙5 5600X 处理器\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：AMD锐龙5 5600X 处理器</li><li title=\"100016046824\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100016046824</li><li title=\"440.00g\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：440.00g</li><li title=\"美国/德国/新加坡/台湾/中国大陆/马来西亚\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：美国/德国/新加坡/台湾/中国大陆/马来西亚</li><li title=\"六核\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">核心数：六核</li><li title=\"B550，X570\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">搭配主板(AMD)：B550，X570</li><li title=\"带风扇\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否自带风扇：带风扇</li><li title=\"AMD\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">处理器：AMD</li><li title=\"锐龙 R5\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">型号：锐龙 R5</li><li title=\"AMD AM4\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：AMD AM4</li><li title=\"7纳米\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">制程工艺：7纳米</li><li title=\"不支持核显\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否支持核显：不支持核显</li><li title=\"12线程\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">线程数量：12线程</li><li title=\"家用/办公\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">类型：家用/办公</li></ul><p><img src=\"http://129.211.222.131:18080/images/202204141614577vafp.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '50', 'AMD 锐龙5 5600X 处理器(r5)7nm 6核12线程 3.7GHz 65W AM4接口 盒装CPU', '1', '00000000003', '00000000002');
INSERT INTO `product` VALUES ('19', '9', 'AOC 27英寸显示器', '879', '2022-04-14 08:45:27', 'http://129.211.222.131:18080/images/20220414171802ibz06.jpg', '<ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"AOC27B2H\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：AOC27B2H</li><li title=\"100005855774\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100005855774</li><li title=\"4.99kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：4.99kg</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"16:9\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕比例：16:9</li><li title=\"IPS技术\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">面板：IPS技术</li><li title=\"1000:1\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">对比度：1000:1</li><li title=\"75Hz\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕刷新率：75Hz</li><li title=\"HDMI，VGA，音频/耳机输出\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：HDMI，VGA，音频/耳机输出</li><li title=\"1920*1080\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">分辨率：1920*1080</li><li title=\"3年质保\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">售后服务：3年质保</li><li title=\"节能认证\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">特性：节能认证</li><li title=\"27英寸\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕尺寸：27英寸</li></ul>', '0', '33', 'AOC 27英寸 75Hz 微框 IPS技术屏 广视角 低蓝光爱眼 可壁挂 玄英质感黑 电脑办公液晶显示器 27B2H', '1', '00000000003', '00000000003');
INSERT INTO `product` VALUES ('20', '9', '戴尔27英寸显示器', '1599', '2022-04-15 07:57:16', 'http://129.211.222.131:18080/images/202204151557157f9vu.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"戴尔（DELL）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,688&amp;ev=exbrand_5821\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">戴尔（DELL）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"戴尔D2720DS\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：戴尔D2720DS</li><li title=\"100006246946\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100006246946</li><li title=\"7.1kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：7.1kg</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"16:9\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕比例：16:9</li><li title=\"IPS技术\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">面板：IPS技术</li><li title=\"1000:1\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">对比度：1000:1</li><li title=\"60Hz\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕刷新率：60Hz</li><li title=\"DP，HDMI\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：DP，HDMI</li><li title=\"27英寸\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">屏幕尺寸：27英寸</li><li title=\"3年质保\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">售后服务：3年质保</li><li title=\"旋转升降底座\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">特性：旋转升降底座</li><li title=\"2560*1440\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">分辨率：2560*1440</li></ul><p><img src=\"http://129.211.222.131:18080/images/202204151557059fuee.jpg\" style=\"max-width:100%;\"><br></p>', '0', '20', '2K D2720DS 27英寸 IPS 旋转升降 三面微边框 设计绘图 电脑显示器（带HDMI线）', '1', '00000000004', '00000000001');
INSERT INTO `product` VALUES ('21', '11', '微星GeForce RTX 3050', '2749', '2022-04-15 07:58:42', 'http://129.211.222.131:18080/images/20220415155842nb3r7.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"微星（MSI）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,679&amp;ev=exbrand_17443\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">微星（MSI）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"微星3050\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：微星3050</li><li title=\"100032161842\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100032161842</li><li title=\"1.605kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：1.605kg</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"8GB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存容量：8GB</li><li title=\"游戏\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">性能：游戏</li><li title=\"神作的终极形态\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">适用游戏：神作的终极形态</li><li title=\"3年\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">质保期：3年</li><li title=\"128bit\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存位宽：128bit</li><li title=\"NVIDIA\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">芯片组：NVIDIA</li><li title=\"HDMI，DP\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：HDMI，DP</li><li title=\"RTX 3050\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显卡型号：RTX 3050</li><li title=\"双风扇\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">散热风扇：双风扇</li><li title=\"GDDR6\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存类型：GDDR6</li><li title=\"RGB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">灯效：RGB</li></ul>', '0', '50', '微星（MSI）魔龙 GeForce RTX 3050 GAMING X 8G 超频版 旗舰款 电竞游戏设计专业电脑显卡', '1', '00000000012', '00000000000');
INSERT INTO `product` VALUES ('22', '10', '宏碁(Acer) 键鼠套装', '29.9', '2022-04-21 09:02:27', 'http://129.211.222.131:18080/images/20220421090226lq64b.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"宏碁（acer）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,686,689&amp;ev=exbrand_8354\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">宏碁（acer）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"宏碁宏碁有线键鼠套装\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：宏碁宏碁有线键鼠套装</li><li title=\"100006878603\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100006878603</li><li title=\"0.62kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：0.62kg</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"其他\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">轴体类型：其他</li><li title=\"键鼠套装\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">类型：键鼠套装</li><li title=\"＞98键\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">按键数：＞98键</li><li title=\"Windows，MacOS\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">兼容系统：Windows，MacOS</li><li title=\"有数字键盘\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">数字键盘：有数字键盘</li><li title=\"黑色\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">颜色：黑色</li><li title=\"有线\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">连接方式：有线</li><li title=\"无光\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">背光灯效：无光</li><li title=\"1台\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">同时连接设备：1台</li><li title=\"职场\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">适用场景：职场</li></ul>', '0', '100', '宏碁(Acer) 键盘 键鼠套装 有线键盘鼠标套装 办公鼠标键盘 防泼洒 USB笔记本台式机通用 OAK-030', '1', '00000000001', '00000000003');
INSERT INTO `product` VALUES ('23', '10', '雷柏 无线蓝牙鼠标', '39.9', '2022-04-21 09:08:47', 'http://129.211.222.131:18080/images/20220421090845nk670.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"雷柏（Rapoo）\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,686,690&amp;tid=17960&amp;ev=exbrand_11248\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">雷柏（Rapoo）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"雷柏M300G\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：雷柏M300G</li><li title=\"100011838388\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100011838388</li><li title=\"110.00g\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：110.00g</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"光电\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">工作方式：光电</li><li title=\"100-120mm\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">尺寸：100-120mm</li><li title=\"有可编程键\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">可编程键：有可编程键</li><li title=\"磨砂材质\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">特点：磨砂材质</li><li title=\"灰色\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">颜色：灰色</li><li title=\"Windows\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">兼容系统：Windows</li><li title=\"无线，蓝牙，多模\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">连接方式：无线，蓝牙，多模</li><li title=\"3台\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">同时连接设备：3台</li><li title=\"日常\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">适用场景：日常</li></ul>', '0', '50', '雷柏（Rapoo） M300G 无线蓝牙鼠标 办公鼠标 轻音鼠标 便携鼠标 人体工程学 电脑鼠标 笔记本鼠标 深灰色', '1', '00000000000', '00000000000');
INSERT INTO `product` VALUES ('24', '10', '雷柏（Rapoo） ralemo Air', '79.9', '2022-04-21 09:09:42', 'http://129.211.222.131:18080/images/20220421090941szxjc.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"雷柏（Rapoo）\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,686,690&amp;tid=17960&amp;ev=exbrand_11248\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">雷柏（Rapoo）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"雷柏Ralemo Air\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：雷柏Ralemo Air</li><li title=\"100010077571\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100010077571</li><li title=\"200.00g\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：200.00g</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"光电\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">工作方式：光电</li><li title=\"100-120mm\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">尺寸：100-120mm</li><li title=\"Windows，MacOS\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">兼容系统：Windows，MacOS</li><li title=\"磨砂材质\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">特点：磨砂材质</li><li title=\"日常\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">适用场景：日常</li><li title=\"无可编程键\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">可编程键：无可编程键</li><li title=\"3台\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">同时连接设备：3台</li><li title=\"无线，蓝牙，多模\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">连接方式：无线，蓝牙，多模</li><li title=\"粉色\" style=\"margin-bottom: 5px; padding-left: 42px; list-style: none; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">颜色：粉色</li></ul>', '0', '100', '雷柏（Rapoo） ralemo Air 1情人节版 无线蓝牙鼠标 办公鼠标 轻音鼠标 充电鼠标 乐萌女生鼠标 笔记本鼠标', '1', '00000000000', '00000000000');
INSERT INTO `product` VALUES ('25', '11', '华硕 AMD RX6500XT', '1899', '2022-04-21 09:11:04', 'http://129.211.222.131:18080/images/202204210911039vtcc.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"华硕（ASUS）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,679&amp;ev=exbrand_8551\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">华硕（ASUS）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"华硕（ASUS）6500XT\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：华硕（ASUS）6500XT</li><li title=\"10043805135040\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：10043805135040</li><li title=\"浩凌数码专营店\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">店铺：&nbsp;<a href=\"https://haolingshuma.jd.com/\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">浩凌数码专营店</a></li><li title=\"1.0kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：1.0kg</li><li title=\"4GB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存容量：4GB</li><li title=\"游戏，家用/办公\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">性能：游戏，家用/办公</li><li title=\"双风扇\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">散热风扇：双风扇</li><li title=\"其他\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存位宽：其他</li><li title=\"支持PCIE4.0\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否支持PCIE4.0：支持PCIE4.0</li><li title=\"3年\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">质保期：3年</li><li title=\"DP，DVI\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：DP，DVI</li><li title=\"RX6500XT\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显卡型号：RX6500XT</li><li title=\"AMD芯片\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">芯片组：AMD芯片</li><li title=\"其他\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存类型：其他</li><li title=\"无光\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">灯效：无光</li></ul>', '0', '100', '华硕（ASUS）AMD RX6500XT 4G 电竞吃鸡游戏电脑主机独立显卡 TUF-RX6500XT-O4G-GAMING', '1', '00000000000', '00000000000');
INSERT INTO `product` VALUES ('26', '1', '微星 GeForce RTX 3060', '3699', '2022-04-21 09:11:58', 'http://129.211.222.131:18080/images/20220421091157vwqew.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"微星（MSI）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,679&amp;ev=exbrand_17443\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">微星（MSI）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"微星RTX 3060\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：微星RTX 3060</li><li title=\"100015378541\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100015378541</li><li title=\"2.31kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：2.31kg</li><li title=\"中国大陆\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国大陆</li><li title=\"12GB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存容量：12GB</li><li title=\"游戏，发烧\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">性能：游戏，发烧</li><li title=\"神作的终极形态\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">适用游戏：神作的终极形态</li><li title=\"3年\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">质保期：3年</li><li title=\"RGB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">灯效：RGB</li><li title=\"支持PCIE4.0\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">是否支持PCIE4.0：支持PCIE4.0</li><li title=\"NVIDIA\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">芯片组：NVIDIA</li><li title=\"HDMI，DP\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：HDMI，DP</li><li title=\"RTX 3060\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显卡型号：RTX 3060</li><li title=\"GDDR6\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存类型：GDDR6</li><li title=\"三风扇\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">散热风扇：三风扇</li><li title=\"192bit\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">显存位宽：192bit</li></ul><p><br></p>', '0', '100', '微星（MSI）魔龙Z GeForce RTX 3060 GAMING Z TRIO 12G 超频版 旗舰款 电竞游戏设计专业电脑显卡', '1', '00000000000', '00000000000');
INSERT INTO `product` VALUES ('27', '3', '西部数据紫盘 4TB', '509', '2022-04-21 09:13:39', 'http://129.211.222.131:18080/images/2022042109133896h20.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"西部数据（WD）\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,683&amp;ev=exbrand_17861\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">西部数据（WD）</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"西部数据WD42EJRX\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：西部数据WD42EJRX</li><li title=\"100030160126\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：100030160126</li><li title=\"0.62kg\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：0.62kg</li><li title=\"泰国/马来西亚\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：泰国/马来西亚</li><li title=\"256MB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">缓存：256MB</li><li title=\"SATA接口\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：SATA接口</li><li title=\"其他\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">转速：其他</li><li title=\"4TB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">容量：4TB</li><li title=\"3.5英寸\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">硬盘尺寸：3.5英寸</li><li title=\"监控级硬盘\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">硬盘类型：监控级硬盘</li></ul>', '0', '100', '西部数据(Western Digital) 紫盘 4TB SATA6Gb/s 256M 垂直CMR 监控硬盘(WD42EJRX)', '1', '00000000000', '00000000001');
INSERT INTO `product` VALUES ('28', '3', '东芝1TB 机械硬盘', '498', '2022-04-21 09:35:40', 'http://129.211.222.131:18080/images/20220421093539ngrfe.jpg', '<ul id=\"parameter-brand\" style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"東芝\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 485px; float: left;\">品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=670,677,683&amp;ev=exbrand_6345\" clstag=\"shangpin|keycount|product|pinpai_1\" target=\"_blank\" style=\"color: rgb(94, 105, 173);\">東芝</a></li></ul><ul style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 20px; padding-bottom: 15px; list-style-position: initial; list-style-image: initial; overflow: hidden; color: rgb(102, 102, 102); font-family: tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif; font-size: 12px;\"><li title=\"东芝HDWD110\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品名称：东芝HDWD110</li><li title=\"2073071\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品编号：2073071</li><li title=\"500.00g\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品毛重：500.00g</li><li title=\"中国或菲律宾\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">商品产地：中国或菲律宾</li><li title=\"64MB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">缓存：64MB</li><li title=\"SATA接口\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">接口：SATA接口</li><li title=\"7200rpm\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">转速：7200rpm</li><li title=\"1TB\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">容量：1TB</li><li title=\"台式机硬盘\" style=\"margin-bottom: 5px; padding-left: 42px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width: 200px; float: left;\">硬盘类型：台式机硬盘</li></ul><p><img src=\"http://129.211.222.131:18080/images/202204210935361m0r4.jpg\" style=\"max-width:100%;\"><br></p>', '0', '100', '东芝(TOSHIBA)1TB 台式机机械硬盘 64MB 7200RPM SATA接口 P300系列(HDWD110)', '1', '00000000002', '00000000000');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` text,
  `total_price` double DEFAULT NULL,
  `receive_name` varchar(100) DEFAULT NULL,
  `full_address` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `exp_no` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('11', '220418174642001', '5', '2022-04-18 09:46:42', '请晚间配送', '3628', '张秋明', '杭州市萧山区南环大道129号丽水花园2栋901', '18922311091', '5', '20219812741');
INSERT INTO `t_order` VALUES ('12', '220418180455001', '5', '2022-04-18 10:04:55', '', '1499', '张萌萌', '杭州市萧山区南环大道129号丽水花园2栋901', '18933120987', '-1', null);
INSERT INTO `t_order` VALUES ('13', '220421092848001', '11', '2022-04-21 09:28:49', '', '908.9', '邱莉', '深圳市宝安区湖滨路129号2301', '18799031234', '3', 'SF82178993');
INSERT INTO `t_order` VALUES ('14', '220421093343002', '4', '2022-04-21 09:33:44', '尽快发货', '1628.9', '马冬梅', '上海市闵行区枫叶路129号', '17899091234', '4', 'SF19983903');
INSERT INTO `t_order` VALUES ('15', '220421094007003', '12', '2022-04-21 09:40:08', '请晚上配送', '1388', '章冬', '杭州市西湖区东环路139号2201', '18944891209', '2', null);
INSERT INTO `t_order` VALUES ('16', '220421094437001', '8', '2022-04-21 09:44:38', '', '1617.9', '许多多', '广州市天河区林和西路112号201', '13760613080', '2', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user01', '81DC9BDB52D04DC20036DBD8313ED055', '13899001234', 'user01@126.com');
INSERT INTO `user` VALUES ('2', 'tom', 'abc', '18699001234', 'tom@126.com');
INSERT INTO `user` VALUES ('4', '马冬梅', '81DC9BDB52D04DC20036DBD8313ED055', '13455990932', 'mary@126.com');
INSERT INTO `user` VALUES ('5', '海边的卡夫卡', '81DC9BDB52D04DC20036DBD8313ED055', '13900903232', 'tekls@163.com');
INSERT INTO `user` VALUES ('6', 'abcd', '1234', '13800003345', 'abcd@126.com');
INSERT INTO `user` VALUES ('7', 'lily', '123481DC9BDB52D04DC20036DBD8313ED055', '13877893345', 'lily@qq.com');
INSERT INTO `user` VALUES ('8', 'xujinnan', '81DC9BDB52D04DC20036DBD8313ED055', '13899990000', 'test@126.com');
INSERT INTO `user` VALUES ('9', 'kanser', '81DC9BDB52D04DC20036DBD8313ED055', '13760613080', 'kanser@126.com');
INSERT INTO `user` VALUES ('10', 'mytest', '1234', '18900001111', 'mytest@126.com');
INSERT INTO `user` VALUES ('11', '绿花朵', 'E10ADC3949BA59ABBE56E057F20F883E', '13788943871', '89832983@qq.com');
INSERT INTO `user` VALUES ('12', '章鱼哥', 'E10ADC3949BA59ABBE56E057F20F883E', '18944891209', '8303108414@qq.com');
SET FOREIGN_KEY_CHECKS=1;
