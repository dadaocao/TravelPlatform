/*
 Navicat Premium Data Transfer

 Source Server         : INFO5100
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 17/04/2023 18:51:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'baizhan@bz.com', 'baizhan', '$2a$10$oIofZttC0sVloQPo0bHvxemHq.fvTt8WPfor3JGoFpHMPhyenrzpG', '13835351231', 1);
INSERT INTO `admin` VALUES (4, 'sxt@bz.com', 'sxt', '$2a$10$FilWY.5YOicSsUYlUQ9q.enAA.Hbq2vuSDFYmGFroXiWa4lRPCePC', '13835351231', 1);
INSERT INTO `admin` VALUES (19, 'wei.xinyi2@northeastern.edu', 'Frank', '$2a$10$pHBsnLdGjpP8bo7QT1fwnew/ohQ9BMkdqHxzmkEvtv9k8T1zsn8CK', '12345678', 1);
INSERT INTO `admin` VALUES (20, '123@gmail.com', 'liuber', '$2a$10$FsDdMS6KJHisUlN19UGm2uPNqyXTS9EdP5P/jN85pNP66LR5LdQlK', '12345', 1);
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `aid` varchar(32) NOT NULL,
  `rid` varchar(32) NOT NULL,
  PRIMARY KEY (`aid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES ('1', '1');
INSERT INTO `admin_role` VALUES ('1', '2');
INSERT INTO `admin_role` VALUES ('16', '1');
INSERT INTO `admin_role` VALUES ('16', '2');
INSERT INTO `admin_role` VALUES ('16', '3');
INSERT INTO `admin_role` VALUES ('2', '1');
INSERT INTO `admin_role` VALUES ('2', '2');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `AK_nq_categoryname` (`cname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (7, 'Custom Travel');
INSERT INTO `category` VALUES (9, 'Discount Flight');
INSERT INTO `category` VALUES (2, 'Discount Hotel');
INSERT INTO `category` VALUES (5, 'Domestic Travel');
INSERT INTO `category` VALUES (1, 'Entrance Tickets');
INSERT INTO `category` VALUES (8, 'Global Travel');
COMMIT;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `mid` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`pid`,`mid`),
  KEY `FK_user_favorite` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of favorite
-- ----------------------------
BEGIN;
INSERT INTO `favorite` VALUES (3, 1);
INSERT INTO `favorite` VALUES (3, 2);
INSERT INTO `favorite` VALUES (3, 3);
INSERT INTO `favorite` VALUES (3, 4);
INSERT INTO `favorite` VALUES (3, 5);
INSERT INTO `favorite` VALUES (3, 6);
INSERT INTO `favorite` VALUES (3, 7);
INSERT INTO `favorite` VALUES (3, 8);
INSERT INTO `favorite` VALUES (3, 9);
INSERT INTO `favorite` VALUES (3, 10);
INSERT INTO `favorite` VALUES (3, 11);
INSERT INTO `favorite` VALUES (3, 12);
INSERT INTO `favorite` VALUES (3, 13);
INSERT INTO `favorite` VALUES (4, 509);
INSERT INTO `favorite` VALUES (4, 512);
INSERT INTO `favorite` VALUES (4, 513);
INSERT INTO `favorite` VALUES (9, 521);
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `phoneNum` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `AK_nq_username` (`username`),
  UNIQUE KEY `AK_nq_code` (`activeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES (3, 'baizhan', '$2a$10$s8A8EPUzinL.NCoTyXKu3eza5BTliAQEyeiv.R53R7Hw4hFhPVH8W', '2022-06-05', '男', '13855555555', '461618768@qq.com', 1, '0a2c48d2-b270-4590-a0bc-4b8e5bd6cb7b');
INSERT INTO `member` VALUES (9, 'wei.xinyi2@northeastern.edu', '$2a$10$XPvA7uWbGAtEScq2EhWRNeEcjRcGSpEnUohNIaVuV1MGkLU9qiH/u', '2023-04-14', '女', '88888888', 'wei.xinyi2@northeastern.edu', 1, 'a2cd2d4d-b005-4e18-accb-2bd1b1bf62f3');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `permissionDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, 'Query Administrator', '/admin/all');
INSERT INTO `permission` VALUES (2, 'Query Role', '/role/all');
INSERT INTO `permission` VALUES (3, 'Query Permission', '/permission/all');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `hotline` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `productDesc` varchar(1000) DEFAULT NULL,
  `pImage` varchar(200) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK_category_route` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, '【旅展 半价特惠 重走丝路•漫游宁夏 双飞4天】银川西部影视城 穆民新村 中卫沙坡头【品美酒 回族学唱花儿 感悟民俗】', 999, '13812345678', 1, '走进【宁夏沙坡头】，感受西北大漠风情、体会“大漠孤烟直，长河落日圆”的塞上风光！', '/upload/img/product/small/m304b69a4c8328f7d6b8d5dadef020fe07.jpg', 5);
INSERT INTO `product` VALUES (2, '【官网专享 立减¥500 张家界天门山+大峡谷+凤凰古城+玻璃栈道+玻璃桥 高铁4天 无自费5钻】印象鲵宴-赶年宴+2晚蓝湾博格酒店', 1799, '13812345678', 1, '官网专线，顶级品质！全程超豪华住宿，2晚入住超豪华铂金-蓝湾博格国际酒店，独家尊享金马VIP贵宾专用楼层。', '/upload/img/product/small/m34866f055de8630e94e25c40f277a79ba.jpg', 5);
INSERT INTO `product` VALUES (3, '【官网专享 5折预售 越南下龙湾+河内+芒街 高铁4天 高级团】双导游服务 免收服务小费【越超值·美食越南】', 1199, '13812345678', 1, '双导游服务，免收服务小费，周全照顾贴心服务随心出游！品尝越南特色国宝美食，升级一餐越式炸鸡火锅宴！', '/upload/img/product/small/m3db4d2277b5df3d98597f79082ef92d6d.jpg', 5);
INSERT INTO `product` VALUES (4, '【官网专享 送箱 ¥1099秒杀 华东五市+乌镇+南浔 双飞6天 南京进上海出】升级1晚豪华酒店 漫步西湖【水墨江南】', 1099, '13812345678', 1, '升级入住1晚豪华酒店；畅玩江南两大经典水乡——乌镇水乡和南浔水乡，体验这里的历史文化底蕴、清丽婉约的水乡古镇风貌。', '/upload/img/product/small/m3d91ef60e0c7fdeee97a4e2d3e5a42e84.jpg', 5);
INSERT INTO `product` VALUES (5, '梅州 双飞3天2晚 自由行套票【含广州直飞梅州早对晚含税往返机票+2晚梅州市区酒店】', 999, '13812345678', 1, '含广州直飞梅州早对晚含税往返机票+2晚梅州市区酒店！', '/upload/img/product/small/m3ac1aa10b493b4b22221e19ba39f7e6a1.jpg', 5);
INSERT INTO `product` VALUES (6, '【宁夏银川 双飞4天】 银川中华回乡文化园 中卫沙坡头 宁夏回族自治区博物馆 西关清真寺', 1299, '13812345678', 1, '中卫升级1晚豪华酒店！走进【宁夏沙坡头】，感受西北大漠风情、体会“大漠孤烟直，长河落日圆”的塞上风光！', '/upload/img/product/small/m312cf97538027a813a4fb0bd6980a7fea.jpg', 5);
INSERT INTO `product` VALUES (7, '【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店', 1099, '13812345678', 1, '畅玩乌镇水乡和木渎水乡，游览上海迪士尼小镇，其中升级入住2晚豪华酒店，品尝杭州特色宴“乾隆御茶宴”，送品尝金秋肥美大闸蟹一只！', '/upload/img/product/small/m370365f2ea91b638695218a6df13e3819.jpg', 5);
INSERT INTO `product` VALUES (8, '【¥1099秒杀 特惠华东五市+乌镇+木渎+灵山大佛 双飞6天 上海进杭州出】升级2晚豪华酒店', 1099, '13812345678', 1, '升级两晚豪华酒店，畅游双水乡乌镇+木渎古镇，南京中山陵，杭州西湖！', '/upload/img/product/small/m30971b3d22ab37242636088780cfb8eb5.jpg', 5);
INSERT INTO `product` VALUES (9, '【豪叹喜来登 桂林 阳朔西街高铁4天纯玩 高级团】漓江 西山公园 象鼻山 银子岩', 1299, '13812345678', 1, '1晚指定入住福朋喜来登酒店，船游全程大漓江，游览世界溶洞奇观银子岩', '/upload/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg', 5);
INSERT INTO `product` VALUES (10, '【春节 湖南郴州莽山+东江湖+冰雪森林温泉 高铁3天 顶贵团】欢迎年宴+温泉养生宴+农家菜【金狗闹郴晚·冰天雪地泡温泉】', 2399, '13812345678', 1, '莽山景区入住“森林中的皇宫”之美誉的莽山森林温泉酒店；市区入住享“酒店就是景区”美誉的国际奢华品牌酒店---温德姆至尊豪庭酒店！', '/upload/img/product/small/m3c9823bc50368af0fe83eff14a5587c0a.jpg', 5);
INSERT INTO `product` VALUES (11, '【春节 莽山+东江湖+冰雪森林温泉 高铁3天 贵宾团】年夜欢迎晚宴+温泉养身宴+特色火锅+湘南风味餐+莽山农家菜', 1999, '13812345678', 1, '独家首创“画中游”游览方式—-徒步醉美小东江景区，颁发徒步证书；特别赠送：美味·东江鱼品尝装礼盒！', '/upload/img/product/small/m3501326413840ce82b9ba14db3a3a5eea.jpg', 5);
INSERT INTO `product` VALUES (12, '【立减¥400 桃花季包列 西藏拉萨+日喀则+林芝 双卧12天】青藏铁路 布达拉宫 东方瑞士鲁朗 圣湖羊卓雍措 扎什伦布寺', 5599, '13812345678', 1, '【包列进藏】乘坐世界最先进的青藏列车，观世界坐标级景观带，有氧车厢进入西藏，由低海拔至高海拔逐步适应，安全保障。畅享拉林高等级公路沿途“颜值担当”雪域江南风光！', '/upload/img/product/small/m32bdf1849b307712c4a0843b89ed83b5f.jpg', 5);
INSERT INTO `product` VALUES (13, '【立减¥200 桃花季包列 西藏拉萨+林芝桃花季双卧10天】青藏铁路景观带 布达拉宫 东方瑞士鲁朗 嘎拉桃花村', 4399, '13812345678', 1, '【包列进藏】乘坐世界最先进的青藏列车，观世界坐标级景观带，有氧车厢进入西藏，由低海拔至高海拔逐步适应，安全保障。畅享拉林高等级公路沿途“颜值担当”雪域江南风光！', '/upload/img/product/small/m3f535b6065c0085e6e69d1df7337bc60c.jpg', 5);
INSERT INTO `product` VALUES (14, '【¥999/2人 广西北海双飞4天 南航往返】北海银滩 北海海景大道 北部湾广场 侨港镇 南迈渔村', 999, '13812345678', 1, '南航飞机直达北海不用1个半小时，畅游真正“天下第一滩”北海十里银滩！漫步北海老街，探秘南迈渔村！', '/upload/img/product/small/m3d62aa9f19c84f99a8b700f12824b195b.jpg', 5);
INSERT INTO `product` VALUES (15, '【¥1999秒杀 新疆乌鲁木齐+天山天池+鄯善+火焰山 双飞5天 超贵团】库姆塔格沙漠 坎儿井', 1999, '13812345678', 1, '升级一晚超豪华酒店！鄯善沙漠哈密瓜的故乡，沙漠中的绿洲吐 鲁 番，畅游天山天池！', '/upload/img/product/small/m3b73ad0712746ef03019e34fb9757401d.jpg', 5);
INSERT INTO `product` VALUES (16, '【越南下龙湾+巡洲岛+吉婆岛+河内 高铁5天 纯玩贵宾团】0购物0自费 尊享1晚国际品牌超豪华酒店+1晚巡洲岛豪华海边度假酒店海景房', 1899, '13812345678', 1, '畅游·下龙湾，登陆巡洲岛，游恬静的北越明珠吉婆岛！尊享1晚国际品牌超豪华酒店+1晚巡洲岛豪华海边度假酒店海景房', '/upload/img/product/small/m391ef27749fd523c757403de0a5d033d5.jpg', 5);
INSERT INTO `product` VALUES (17, '【海南三亚+兴隆+海口+蜈支洲岛+西岛+亚龙湾+天涯海角双飞4天 超贵团】海口/三亚进 三亚/海口出 不走回头路【经典皇牌 至尊双岛】', 1899, '13812345678', 1, '不走回头路，劲省4小时车程，升级三亚一晚超豪华度假酒店，畅游天涯海角+亚龙湾沙滩+椰田古寨！', '/upload/img/product/small/m3552ce9d728ca8c85323df5395e8de1a2.jpg', 5);
INSERT INTO `product` VALUES (18, '【江西井冈山双飞4天】笔架山 游菖蒲古村 穿红军服走红军路', 1199, '13812345678', 1, '广州直飞井冈山机场，车程劲省2小时；乘坐十公里长的亚洲第一索道——笔架山索道；', '/upload/img/product/small/m3bc92ed09dc80f91641ea195983bf1284.jpg', 5);
INSERT INTO `product` VALUES (19, '【湘西360°全景 张家界高铁5天】韶山 天子山 袁家界 天门山 玻璃栈道 大峡谷景区玻璃桥 凤凰古城', 2099, '13812345678', 1, '挑战天门山玻璃栈道、大峡谷玻璃桥，享侗族才家合拢宴 ，特色蘑菇宴，土家风味宴，游览韶山毛主席故里！', '/upload/img/product/small/m3d69b0ea3165d04302cc068ac14192bd1.jpg', 5);
INSERT INTO `product` VALUES (20, '【莽山+森林温泉+东江湖高铁3天 纯玩顶贵团5钻】湖南郴州 鬼子寨 天台山 猴王寨 自然博物馆【醉美4A郴州莽山·雾漫5A东江湖】', 1499, '13812345678', 1, '全程 不进“旅游特色”购物场所，行摄布置撒网、捕鱼的场景，享用游水三文鱼+野生东江鱼', '/upload/img/product/small/m30e5efc21e11e76fbf0e75da4b7b9d97e.jpg', 5);
INSERT INTO `product` VALUES (21, '【莽山+森林温泉+东江湖高铁3天 纯玩超贵团4+5钻】湖南郴州 鬼子寨 天台山 猴王寨 自然博物馆【醉美4A郴州莽山·雾漫5A东江湖】', 1399, '13812345678', 1, '全程 不进“旅游特色”购物场所，行摄布置撒网、捕鱼的场景，享用游水三文鱼+野生东江鱼', '/upload/img/product/small/m30e5efc21e11e76fbf0e75da4b7b9d97e.jpg', 5);
INSERT INTO `product` VALUES (22, '【莽山+森林温泉+东江湖高铁3天 纯玩贵宾团4钻】湖南郴州 鬼子寨 天台山 猴王寨 自然博物馆【醉美4A郴州莽山·雾漫5A东江湖】', 1199, '13812345678', 1, '全程 不进“旅游特色”购物场所，行摄布置撒网、捕鱼的场景，享用游水三文鱼+野生东江鱼', '/upload/img/product/small/m3e58cd1b85e778b6f57a3745037704b35.jpg', 5);
INSERT INTO `product` VALUES (23, '【江西庐山 三清山 婺源纯玩双飞5天】庐山植物园 婺源篁岭“晒秋” 景德镇', 1999, '13812345678', 1, '三清山脚升级1晚超豪华酒店；直飞景德镇，全程纯玩，旅程更舒适；', '/upload/img/product/small/m35b95dd85d2fe9fe53f743e618f67d891.jpg', 5);
INSERT INTO `product` VALUES (24, '【品味江西双飞4天纯玩】三清山 夜宿庐山 婺源篁岭晒秋 瓷都景德镇', 1599, '13812345678', 1, '全程纯玩，品尝婺源农家宴，三清山生态宴，解析徽派建筑—婺源，因“晒秋”闻名遐迩！', '/upload/img/product/small/m3ce75dde0868132a5b0e2b303b9e5dd0c.jpg', 5);
INSERT INTO `product` VALUES (25, '【+1元换购两大夜景 华东五市双飞六天纯玩】扬州瘦西湖 灵山大佛 双水乡乌镇+南浔', 2699, '13812345678', 1, '升级一晚超豪华酒店 ，加1元换购：价值280元苏州游船+上海环球金融中心94层！灵山大佛许下美好的愿望！', '/upload/img/product/small/m3f15936372dc3462d335b0e4ae95ef10b.jpg', 5);
INSERT INTO `product` VALUES (26, '【安徽黄山 双飞4天跟团游】直飞黄山 住1晚山上 宏村探古 夜宿鲍家花园 品徽州火锅【超贵团】', 2099, '13812345678', 1, '黄山直飞！入住一晚入住黄山山酒店，1晚花园式的私家园林内酒店—歙县鲍家花园大酒店！品尝徽州火锅！', '/upload/img/product/small/m3eedfb8ee93dfc041aa9dea6f2751a0d8.jpg', 5);
INSERT INTO `product` VALUES (27, '【3.18出发 厨神夜宴·龙脊放水节 高铁3天·专场篝火晚会】龙脊古壮寨梯田 平安梯田 西山桃花节【超贵团】', 499, '13812345678', 1, '“世界梯田之冠”龙脊梯田水满田畴，层层银链的震撼风景！金马贵宾独家尊享：金牌全猪宴、高山篝火晚会！精选住宿：升级1晚超豪华酒店。', '/upload/img/product/small/m3cfa8355222bddde5a05ce589a602079f.jpg', 5);
INSERT INTO `product` VALUES (28, '【春节 买1送1 云南香格里拉+丽江+大理 高铁7天 超贵团】石卡雪山 虎跳峡 独克宗祈福 拉市海 洱海公园 花语牧场 昆明红嘴鸥【畅享温泉SPA】', 5799, '13812345678', 1, '昆明1晚入住超豪华温泉酒店，尽享地道温泉SPA！登顶香格里拉+藏族神山石卡雪山，尽享玩雪乐趣，走进藏区古镇独克宗，感受地道藏式民俗，转动世界最大转经筒，祈福新年大吉！', '/upload/img/product/small/m3420d7f66c7aec9d0cf5c2654aa973f8c.jpg', 5);
INSERT INTO `product` VALUES (29, '【3.17出发 龙脊放水节】龙脊平安梯田 古壮寨梯田 船游一江四湖 桂林城徽象鼻山 兴坪古镇 骥马村油菜花海 阳朔西街动车三天团', 599, '13812345678', 1, '“世界梯田之冠”龙脊梯田水满田畴，层层银链的震撼风景！金马贵宾独家尊享：金牌全猪宴，金马专场高山篝火晚会！', '/upload/img/product/small/m3ef702190f1c51354db5b9e754573428b.jpg', 5);
INSERT INTO `product` VALUES (30, '【春节 张家界天门山+大峡谷玻璃桥+凤凰古城 高铁4天】玻璃栈道 溪布老街【品土家三下锅】', 2599, '13812345678', 1, '全程入住豪华标准舒适酒店或精装客栈，提升旅游体验！品年味：湘西民族特色风味【土家三下锅/蘑菇宴（588元/桌）】欢欢喜喜过大年！', '/upload/img/product/small/m39428c374b8f8debe994cfbff6de4a3db.jpg', 5);
INSERT INTO `product` VALUES (31, '【春节 张家界森林公园+大峡谷玻璃桥+凤凰古城 高铁4天 升级超豪华酒店】百龙天梯 袁家界 杨家界 金鞭溪 溪布老街 土司王-赶年盛宴【品质纯玩 超贵团】', 1899, '13812345678', 1, '升级一晚超豪铂金酒店，华而不奢，温情似家【蓝湾博格国际酒店】；赠送袁家界景区百龙天梯双程（价值144元/位），VIP通道、无需排队、尽享贵宾礼遇！', '/upload/img/product/small/m3c9c87a1175252d187eb8c4bc228c317d.jpg', 5);
INSERT INTO `product` VALUES (32, '【春节爆款 张家界天门山玻璃栈道+大峡谷玻璃桥+凤凰古城 高铁4天】游飘在水上的溪布老街 品土家三下锅【贵宾团 4钻】', 2099, '13812345678', 1, '零购物·一价全含；畅玩年味四大核心热门景区：天门山国家森林公园、大峡谷玻璃桥、凤凰古城、溪布街；每人一份平安发财贺新春小礼品！', '/upload/img/product/small/m349baf8219aca81648fa94e66ca09014e.jpg', 5);
INSERT INTO `product` VALUES (33, '【春节 张家界国家森林公园+大峡谷玻璃桥+凤凰古城 高铁4天】袁家界 金鞭溪 飘在水上的溪布老街 品土家三下锅【贵宾团 4钻】', 2099, '13812345678', 1, '零购物，一价全含；游玩热门景区：张家界国家森林公园、大峡谷玻璃桥、凤凰古城、溪布街；全程入住豪华标准舒适酒店或精装客栈，舒适温馨', '/upload/img/product/small/m324c5af15cf5e02bdf68873e4d485a182.jpg', 5);
INSERT INTO `product` VALUES (34, '【春节 北京+天津+雪世界滑雪 双飞5天 天津往返 纯玩3+5钻】升级1晚丽都皇冠假日酒店 新春庙会 雍和宫祈福 八达岭长城【津津有味】', 3599, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；升级体验乘坐25分钟京津城际高速列车！加游华北户外至大的滑雪场-雪世界滑雪！北京升级1晚入住国际品牌超豪华酒店-【丽都皇冠假日酒店】！', '/upload/img/product/small/m3b2c6e8fa0e92882b9362c68dfa504324.jpg', 5);
INSERT INTO `product` VALUES (35, '【超值·越南船游下龙湾+芒街+首都河内 高铁4天 高级团】巴亭广场 镇国寺 【享越式炸鸡火锅宴】', 599, '13812345678', 1, '包船游誉为世界自然遗产亦有海上桂林美誉的【下龙湾】！入住两晚下龙度假区酒店，感受异域风情；入住一晚河内市区酒店，感受异域民风！', '/upload/img/product/small/m3b350a4abe82f0a7d0fd2897ce7d59ae5.jpg', 5);
INSERT INTO `product` VALUES (36, '【春节 直飞北京 双飞6天 纯玩4钻】新春庙会 雍和宫祈福 故宫 八达岭长城 什刹海 雪世界滑雪', 4399, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；加游历代皇帝御用寺庙——雍和宫祈福；赠送北京市第一家以3D画形式展现北京千年皇家文化的专业画廊—【明清宫3D画廊】！', '/upload/img/product/small/m3b2c6e8fa0e92882b9362c68dfa504324.jpg', 5);
INSERT INTO `product` VALUES (37, '【春节陕西西安兵马俑+华山+延安+黄河壶口冰瀑 双飞5天 西安往返】华清宫 黄帝陵轩辕庙 汉城湖新春庙会【贵宾团】', 4699, '13812345678', 1, '观摩“世界第八大奇迹”——【兵马俑】，领略秦王军阵雄风； 问鼎五岳之巅【西岳华山】，回味金庸笔下的侠客柔情！', '/upload/img/product/small/m3a6e5b5ba8ef83b3057c1ac58cb0a51a9.jpg', 5);
INSERT INTO `product` VALUES (38, '【春节 云南香格里拉+丽江+大理+昆明+玉龙雪山+洱海 双飞6天 昆明往返 纯玩超贵团】升级楚雄入住当地超豪华型酒店', 3999, '13812345678', 1, '尽享冬色香格里拉，登顶玉龙雪山；畅享丽江、大理双古城，体验小资洱海风光；升级一晚入住当地超豪华型酒店！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (39, '【春节 立减¥200 云南香格里拉+丽江+大理+昆明+玉龙雪山+洱海 高铁7天 昆明往返 纯玩超贵团】楚雄升级当地超豪华酒店', 3899, '13812345678', 1, '升级楚雄入住当地超豪华型酒店！团团赠品云南名食：丽江土鸡宴&野生菌火锅！', '/upload/img/product/small/m3791748e3f2093699116c6bd3fd8a8752.jpg', 5);
INSERT INTO `product` VALUES (40, '【第2位5折 春节 贵州黄果树瀑布+西江千户苗寨+贵阳 高铁4天 纯玩】特别升级1晚超豪华酒店【苗韵西江】', 2999, '13812345678', 1, '贵州旅游精品线：黄果树、西江千户苗寨。加游非遗文化聚集地的丹寨万达小镇！全程入住豪华酒店，升级一晚超豪华酒店！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (41, '【春节爆款 直飞北京 双飞6天 纯玩3钻】新春庙会 雍和宫祈福 故宫 八达岭长城 什刹海', 3099, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；加游历代皇帝御用寺庙——雍和宫祈福；赠送北京市第一家以3D画形式展现北京千年皇家文化的专业画廊—【明清宫3D画廊】！', '/upload/img/product/small/m34df74737b1cae0f6893d5b9895d4545b.jpg', 5);
INSERT INTO `product` VALUES (42, '【春节 北京+天津 双飞5天 天津往返 纯玩4钻】新春庙会 雍和宫祈福 八达岭长城 天津三街 周邓纪念馆【津津有味】', 3599, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；升级体验乘坐25分钟京津城际高速列车！加游华北户外至大的滑雪场-雪世界滑雪！ 参观以3D画形式展现北京千年皇家文化的专业画廊—【明清宫3D画廊】', '/upload/img/product/small/m3e5a38453ae434a21243962988d559a78.jpg', 5);
INSERT INTO `product` VALUES (43, '【春节 北京滑雪+天津 双飞5天 天津往返 纯玩3+5钻】升级1晚喜来登 新春庙会 雍和宫祈福 雪世界 八达岭长城【津津有味】', 3199, '13812345678', 1, '北京升级1晚入住国际品牌超豪华酒店-【喜来登】；赠送北京市第一家以3D画形式展现北京千年皇家文化的专业画廊—【明清宫3D画廊】', '/upload/img/product/small/m3b2c6e8fa0e92882b9362c68dfa504324.jpg', 5);
INSERT INTO `product` VALUES (44, '【春节 北京滑雪+秦皇岛 双飞6天 秦皇岛往返 纯玩3钻】山海关 北戴河 北京庙会 雍和宫祈福 八达岭长城 【京彩联游】', 3399, '13812345678', 1, '一次畅游北京、秦皇岛、北戴河三大风光城市，特别体验雪世界滑雪，品尝北京特色烤鸭，1号蒸菜！', '/upload/img/product/small/m34a3bd4d04ba909d08a02d9ea30c6235d.jpg', 5);
INSERT INTO `product` VALUES (45, '【春节 桂林+阳朔 高铁3天 贵宾团】纯玩0自费 住豪华酒店 船游大漓江 开运迎春宴 西山桃花展 訾洲郁金香花海【经典桂林】', 1199, '13812345678', 1, '全程入住豪华酒店；其乐融融的春节气氛，特别安排享用迎春开运宴（价值888元/围）、阳朔啤酒鱼宴；乘船游全程【大漓江】，身心体验“舟行碧波上，人在画中游”的山水画卷！', '/upload/img/product/small/m3fa7b43b0cc93b78676a5cd9e5a32c309.jpg', 5);
INSERT INTO `product` VALUES (46, '【春节爆款 桂林+阳朔 高铁3天 惠贵团】纯玩0自费 住高级酒店 船游大漓江 开运迎春宴 西山桃花展 訾洲郁金香花海【经典桂林】', 1099, '13812345678', 1, '春节期间阳朔升级入住豪华酒店；其乐融融的春节气氛，特别安排享用迎春开运宴（价值888元/围）、阳朔啤酒鱼宴；乘船游全程【大漓江】，身心体验“舟行碧波上，人在画中游”的山水画卷！', '/upload/img/product/small/m3d3fabe71ace1184426ac6df14bfb6cd6.jpg', 5);
INSERT INTO `product` VALUES (47, '【春节 桂林+阳朔 高铁3天 贵宾团】纯玩0自费 住豪华酒店 船游兴坪漓江 开运迎春宴 西山桃花展 訾洲郁金香花海【浪漫桂林】', 1059, '13812345678', 1, '全程入住豪华酒店，充分时间游览异国情调的阳朔西街；其乐融融的春节气氛，特别安排享用迎春开运宴（价值888元/围）、阳朔啤酒鱼宴！', '/upload/img/product/small/m3ec4a602492df72816ec03871f2bb59df.jpg', 5);
INSERT INTO `product` VALUES (48, '【春节 桂林+阳朔高铁3天 惠贵团】纯玩0自费 住高级酒店 船游兴坪漓江 开运迎春宴 西山桃花展 訾洲郁金香花海【浪漫桂林】', 999, '13812345678', 1, '其乐融融的春节气氛，特别安排享用迎春开运宴（价值888元/围）、阳朔啤酒鱼宴！', '/upload/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg', 5);
INSERT INTO `product` VALUES (49, '【春节 云南丽江+大理+昆明+玉龙雪山+洱海 高铁6天 昆明往返 纯玩贵宾团】纯享云南•一价全包无自费', 3399, '13812345678', 1, '全程纯玩、一价全包、无必须自费项目！', '/upload/img/product/small/m3249bc7b6808cc74080f1bb45d5e82c4e.jpg', 5);
INSERT INTO `product` VALUES (50, '【春节 张家界天门山+玻璃栈道+大峡谷+玻璃桥+凤凰古城+《魅力湘西》 高铁4天 纯玩5钻】团年盛宴+洲际皇冠假日 零购物零加点', 2299, '13812345678', 1, '升级1晚顶级国际奢华集团连锁品牌【洲际-皇冠假日酒店】！四大核心景区、三大特色景点，行程丰富，门票过千，绝不走马观花！', '/upload/img/product/small/m36e65da7aaabb0e8e29ddd56f9f79cbe8.jpg', 5);
INSERT INTO `product` VALUES (51, '【春节 桂林漓江+象鼻山+银子岩+世外桃源+阳朔西街 高铁4天 超贵团】纯玩0自费 豪叹喜来登', 1799, '13812345678', 1, '享受其乐融融的春节气氛，特别安排享用迎春开运宴（价值600元/围）、喜来登自助晚餐；2晚入住豪华酒店，桂林1晚入住国际品牌福朋喜来登酒店！', '/upload/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg', 5);
INSERT INTO `product` VALUES (52, '【春节 神农架滑雪 双飞4天 纯玩高级团 直飞宜昌】官门山 神农架滑雪场 大熊猫馆 三峡大坝【火辣辣南方滑雪胜地·神农架】', 2099, '13812345678', 1, '直飞宜昌，前往南方规模最大、雪质最好的神农架滑雪场，探访【国宝熊猫大熊猫白面书生，宜昌升级1晚当地豪华酒店！', '/upload/img/product/small/m354c084c1f16b42021e8af859532a5045.jpg', 5);
INSERT INTO `product` VALUES (53, '【春节 越南岘港+下龙湾+河内 双高铁双飞6天 纯玩贵宾团】0购物0自费【越识叹·南北越联游·玩转巴拿山】', 4699, '13812345678', 1, '零购物零自费！全程入住超豪华度假酒店，尊享越南法式度假！全程越式料理+豪叹价值268元SEN莲花国际自助餐+越式炸鸡火锅宴！凭祥进东兴出，全程不走回头路', '/upload/img/product/small/m3a97735f3c1f4d895c2950abbf7e758fd.jpg', 5);
INSERT INTO `product` VALUES (54, '【云南泸沽湖+丽江+大理+昆明+玉龙雪山+洱海双飞6天 贵宾团】里务比岛 猪槽船游湖 拉市海【梦幻女儿国】', 2899, '13812345678', 1, '深度游玩丽江，特别安排入住三晚丽江当地豪华酒店；探秘女儿国【泸沽湖】，特别安排乘坐【猪槽船】感受泸沽湖里务比岛独特的美！', '/upload/img/product/small/m3de663b67f7fa51bc482d40c87aea6da9.jpg', 5);
INSERT INTO `product` VALUES (55, '【春节 海南三亚+蜈支洲岛 双飞4天 海口入三亚出/三亚入海口出 超贵团】独家安排游艇出海 升级1晚海边超豪华度假酒店', 4399, '13812345678', 1, '海口入三亚出/三亚入海口出，不走回头路！独家安排私家豪华游艇（容纳20-30人）包艇出海，拒绝散拼大游船！举办私家游艇派对：卡拉OK、红酒、点心、海上浮潜、海上垂钓……', '/upload/img/product/small/m34332119c1d3b137dee37e76e5d2d9391.jpg', 5);
INSERT INTO `product` VALUES (56, '【春节 云南香格里拉+丽江+大理+昆明+玉龙雪山+洱海 双飞6天 昆入丽出/丽入昆出 超贵团】纯玩无购物 松赞林寺祈福【金品游】', 7299, '13812345678', 1, '精选云南三大国家5A级景点•专业策划合理路线，全程不走回头路•享受最具特色的云南年味；昆明和香格里拉升级当地超豪华酒店，其余当地豪华型酒店，享受优质的住宿！', '/upload/img/product/small/m3cbf47c96c3a70765eb9c90efb345f0d3.jpg', 5);
INSERT INTO `product` VALUES (57, '【春节 云南丽江+大理+昆明+玉龙雪山+洱海双飞6天 昆明往返 超贵团】全程纯玩 无购物 无必须自费 丽江河灯祈福', 5799, '13812345678', 1, '全程纯玩，无指定购物店，一价全包，无必须自费；包含玉龙雪山等经典景点门票索道价值约500元，行程丰富，绝不走马观花', '/upload/img/product/small/m37e6079026b2f5357598dee8bb2c1772a.jpg', 5);
INSERT INTO `product` VALUES (58, '阳朔 高铁3天2晚 自由行套票【含广州往返二等座高铁票+西街口豪华型阳朔万丽花园大酒店2晚+每日西式自助早餐】', 459, '13812345678', 1, '广州到阳朔往返二等座高铁票+西街口豪华型阳朔万丽花园大酒店2晚+每日西式自助早餐！', '/upload/img/product/small/m338695211e1e6b944cba365c06ce98ba0.jpg', 5);
INSERT INTO `product` VALUES (59, '【广西龙脊梯田放水节+桂林 高铁3天·豪叹希尔顿】龙脊古壮寨梯田 平安梯田 布尼梯田 篝火晚会 美食厨神专场全猪宴团【超贵团】', 666, '13812345678', 1, '“世界梯田之冠”龙脊梯田水满田畴，层层银链的震撼风景！（至佳观赏期3月-4月上旬）；深度游览龙脊梯田两大核心观景区：古壮寨梯田、平安寨梯田！', '/upload/img/product/small/m32d0abfffd0a64b397315bd0eed5776d4.jpg', 5);
INSERT INTO `product` VALUES (60, '【云南罗平油菜花+贵州兴义万峰林+黄果树大瀑布 高铁5天·纯玩0自费】船游万峰湖 马岭河大峡谷 雨补鲁天坑【金马自营-赏花·温泉·山水瀑布】', 1999, '13812345678', 1, '游云南罗平油菜花，观赏最壮观的万亩金色油菜花海，一年仅一个月的花期。特别升级一晚超豪华住宿以及当地温泉酒店，尊享舒适旅程！', '/upload/img/product/small/m3af93767375fa2a989f1c82b3df3da7c7.jpg', 5);
INSERT INTO `product` VALUES (61, '【特价 东北雪乡+亚布力+哈尔滨双飞5天】童话世界雪乡 亚布力激情滑雪 林海雪源威虎寨【经典小东北】', 2499, '13812345678', 1, '穿越林海，深入匪窝，化身杨子荣去大闹威虎寨！体验贵族式运动“亚布力激情滑雪”！超值体验价值180元的赫哲族冰上捕鱼！', '/upload/img/product/small/m3049f23927f06d90e98fc254acd839846.jpg', 5);
INSERT INTO `product` VALUES (62, '【宁夏双飞4天】 银川华夏西部影视城 宁夏回族自治区博物馆 中卫沙坡头 穆民新村', 1499, '13812345678', 1, '', '/upload/img/product/small/m312cf97538027a813a4fb0bd6980a7fea.jpg', 5);
INSERT INTO `product` VALUES (63, '【特价 东北长白山+雪乡+亚布力+吉林+哈尔滨+长春双飞6天】亚布力激情滑雪 吉林雾凇【东北小环游】', 6599, '13812345678', 1, '亚布力滑雪度假区激情滑雪！雪地自驾欢乐卡丁车！长白山下酒店舒适温泉！升级2晚超豪华酒店！', '/upload/img/product/small/m32147bf064e03b7313fe250b262d902c1.jpg', 5);
INSERT INTO `product` VALUES (64, '【春节 广西桂林+阳朔动车三天 品开运迎春宴·豪叹希尔顿·全程0自费】訾洲郁金香花海 城徽象鼻山 船游一江四湖 兴坪古镇【超贵团】', 839, '13812345678', 1, '金马贵宾独家尊享迎春开运宴；一块儿包饺子！桂林入住国际品牌希尔顿欢朋酒店，舒适客房35平米超大自由空间！品希尔顿酒店中西式自助早餐！阳朔安排入住豪华酒店！', '/upload/img/product/small/m3a0b210f47a778170efe260bd75a2fd01.jpg', 5);
INSERT INTO `product` VALUES (65, '【旅展特价 贵州黄果树瀑布+西江千户苗寨+荔波大小七孔 高铁5天】丹寨万达小镇 荔波古镇 时光贵州古镇【经典全景·升级一晚超豪华酒店】', 1799, '13812345678', 1, '乘贵广高铁，观赏“亚洲第一瀑布”，世界双自然遗产地“荔波大小七孔”，游玩西江千户苗寨；安顺升级一晚超豪华酒店！', '/upload/img/product/small/m39f7d21f616436e6d795e98a43c93f8fa.jpg', 5);
INSERT INTO `product` VALUES (66, '【女神月·广西龙脊放水节+西山桃花节·高铁3天】平安梯田 金坑梯田 小寨油菜花海 侗情水庄 金牌全猪宴 漓江鱼油茶宴【超贵团 全程0自费+豪叹大公馆】', 666, '13812345678', 1, '龙脊梯田，水满田畴，层层银链的震撼风景！前往《绝地逃亡》拍摄地【平安梯田】“九龙五虎”震撼实景真实再现！金坑梯田，邂逅金坑小寨油菜花海！', '/upload/img/product/small/m3ef702190f1c51354db5b9e754573428b.jpg', 5);
INSERT INTO `product` VALUES (67, '【买1送1 致享云南香格里拉+丽江+大理+昆明 双飞6天 超贵团】石卡雪山 虎跳峡 独克宗古镇 拉市海 洱海公园 花语牧场 昆明九乡溶洞【美食篝火•温泉SPA•河灯许愿】', 4399, '13812345678', 1, '门票一价全包；登顶香格里拉藏族神山：石卡雪山；昆明1晚免费升级超豪华温泉酒店！', '/upload/img/product/small/m31baca2c10aeda9fbb13bc14e0411a9ec.jpg', 5);
INSERT INTO `product` VALUES (68, '【买1送1 云南香格里拉+丽江+大理+昆明 高铁7天 超贵团】石卡雪山 虎跳峡 独克宗古镇 拉市海 洱海公园 花语牧场 昆明九乡溶洞【美食篝火•温泉SPA•河灯许愿】', 3999, '13812345678', 1, '门票一价全包；登顶香格里拉藏族神山-石卡雪山；走进藏区古镇独克宗，感受地道藏式民俗；安排价值50元/人餐标的纳西风味宴+纳西篝火舞动；昆明1晚升级超豪华温泉酒店！', '/upload/img/product/small/m3420d7f66c7aec9d0cf5c2654aa973f8c.jpg', 5);
INSERT INTO `product` VALUES (69, '【山东泰山+曲阜孔府+青岛+威海+蓬莱+济宁 双飞6天】升级1晚超豪华酒店', 2099, '13812345678', 1, '欧韵青岛、花园威海、蓬莱寻仙、风筝潍坊、泰山祈福、曲阜圣城、佛国兖州、泉城济南；一次游遍山东全景，不走回头路！', '/upload/img/product/small/m359078394c93364d01d2dafd60a4ac78b.jpg', 5);
INSERT INTO `product` VALUES (70, '【春节 湖南长沙+张家界天门山+大峡谷玻璃桥+凤凰古城 奢华度假 高铁5天 顶贵团5钻】玻璃栈道vs玻璃桥 澧水游船【观冯小刚执导《魅力湘西》+全程超豪华酒店】', 2599, '13812345678', 1, '升级1晚顶级国际奢华集团连锁品牌【洲际-皇冠假日酒店】！五大核心景区，行程丰富，门票过千，绝不走马观花！品新春盛宴——火宫殿、才家合拢宴，一起吃顿土家盛宴团年饭！', '/upload/img/product/small/m31beb6833a226867f4e9c4d9b1d3679ed.jpg', 5);
INSERT INTO `product` VALUES (71, '【贵州专列2· 赏樱·温泉·优宿 黄果树大瀑布+荔波大小七孔+西江千户苗寨 高铁5天】平坝万亩樱花 贵定音寨“金海雪山”花海·赏花摄影之旅【金马自营】', 2599, '13812345678', 1, '贵阳特别升级入住挂五星温泉酒店——保利国际温泉酒店，尊享温泉体验；【使用飞天航拍器，配置专业摄影人员跟队指导】全景直击音寨“金海雪山”油菜花海以及平坝万亩樱花高空俯瞰盛况！', '/upload/img/product/small/m3e820d274755c674e67d0e0da5bdbf8a9.jpg', 5);
INSERT INTO `product` VALUES (72, '【贵州赏樱专列1·玩转航拍 黄果树大瀑布+西江千户苗寨 高铁4天】平坝万亩樱花 贵定音寨“金海雪山”花海·赏花摄影之旅【金马自营】', 1899, '13812345678', 1, '【使用飞天航拍器，配置专业摄影人员跟队指导】全景直击音寨“金海雪山”油菜花海以及平坝万亩樱花高空俯瞰盛况！入住1晚“中国首家布依族艺术酒店”的超豪华【黄果树爱度艺术酒店】！', '/upload/img/product/small/m379471f9320ee1e879f28986eea488fff.jpg', 5);
INSERT INTO `product` VALUES (73, '【春节 湖南张家界+大峡谷玻璃桥+凤凰古城+重庆酉阳桃花源+湖北恩施大峡谷 高铁5天 一价全包】湘鄂渝三省联游 尊享恩施土家团年饭-刨汤宴', 3299, '13812345678', 1, '湘鄂渝联游：经典张凤+重庆酉阳桃花源+湖北恩施大峡谷，一次出行，玩转湖南湖北重庆精华景点， 一价全含，零加点，零购物！尊享恩施土家团年饭-刨汤宴，欢欢喜喜过土家年！', '/upload/img/product/small/m324c5af15cf5e02bdf68873e4d485a182.jpg', 5);
INSERT INTO `product` VALUES (74, '【春节 私享湖南 张家界森林公园+天门山玻璃栈道+凤凰古城+大峡谷玻璃桥高铁5天】袁家界 金鞭溪 观冯小刚《魅力湘西》 游宝峰湖【顶贵团】', 5499, '13812345678', 1, '私家定制4人即走；全景湘西，行程丰富，门票过千，绝不走马观花；全程超豪华住宿，张家界升级三晚挂牌五星！', '/upload/img/product/small/m349baf8219aca81648fa94e66ca09014e.jpg', 5);
INSERT INTO `product` VALUES (75, '【2月 桂林龙脊梯田放水节+阳朔高铁3天·全程0自费】龙脊梯田+平安寨梯田+阳朔葡萄峰林+遇龙河风光【豪叹杀猪宴】', 739, '13812345678', 1, '游览素有“世界梯田之冠”美誉的龙脊梯田；独家尊享•龙脊壮家最高礼遇：品尝价值680元/围的龙脊杀猪宴！安排1晚入住特色龙脊吊脚楼！', '/upload/img/product/small/m3ef702190f1c51354db5b9e754573428b.jpg', 5);
INSERT INTO `product` VALUES (76, '【春节 云南罗平油菜花+贵州兴义万峰林+广西百色 高铁5天·0购物0自费】乌蒙大草原滑雪 雨布鲁天坑 马岭河大峡谷 民族篝火晚会【云贵桂三省纯玩团】', 2699, '13812345678', 1, '乘坐南昆高铁直抵百色，独家揭秘《爸爸去哪儿5》最火拍摄地，玩转金色花海，探访远离喧嚣的古寨人家！ 全程升级4晚超豪华酒店，享受美妙的黔西南之夜！', '/upload/img/product/small/m3180b564776c1e140b73f15de5f3a5312.jpg', 5);
INSERT INTO `product` VALUES (77, '【春节 贵州黄果树瀑布+荔波小七孔+西江千户苗寨 单飞单动5天之旅】陡坡塘 天星桥 丹寨万达小镇 贵阳青岩古镇【单飞荔波·畅游贵州】', 2799, '13812345678', 1, '成人报名即送价值188元茅台镇酱香型白酒一瓶；入住两晚豪华酒店+升级一晚超豪华酒店，西江入住景区特色客栈！ 品尝西江长桌宴、黄果树土鸡宴，感受当地贵州美食！', '/upload/img/product/small/m39f7d21f616436e6d795e98a43c93f8fa.jpg', 5);
INSERT INTO `product` VALUES (78, '【春节 贵州黄果树大瀑布+云南罗平油菜花 高铁5天】兴义万峰林船游万峰湖 马岭河大峡谷 雨补鲁天坑【赏花 温泉 山水瀑布 0自费 金马自营】', 2499, '13812345678', 1, '一次满足你赏花+叹温泉+赏山水瀑布美景三个愿望！游云南罗平油菜花，观赏最壮观的万亩金色油菜花海！', '/upload/img/product/small/m34f047ea4d1d1e0b832aa8a5dd55716c4.jpg', 5);
INSERT INTO `product` VALUES (79, '【春节 贵州黄果树+云南罗平油菜花高铁4天 纯玩0自费】天星桥 陡坡塘瀑布 云南罗平金鸡岭油菜花 贵阳青岩古镇【金马自营】', 1999, '13812345678', 1, '游云南罗平油菜花，观赏最壮观的万亩金色油菜花海，一年仅一个月的花期最佳观赏期为2月中旬-3月份；全程入住当地豪华酒店！品尝价值500元/围安顺特色药膳宴及贵州地道【酸汤鱼宴】！', '/upload/img/product/small/m3aaaaa5b07f6835ebb28ac4821052f94b.jpg', 5);
INSERT INTO `product` VALUES (80, '【张家界天门山+大峡谷+凤凰古城+玻璃栈道+玻璃桥 高铁4天 纯玩5钻】纯玩无自费 尊享1晚张家界挂牌五星京武铂尔曼酒店', 1849, '13812345678', 1, '全程品质超豪华标准酒店！赠送最高户外电梯-百龙天梯·体验66秒直达山顶，免除排队烦恼！含金量足：门票总价达￥758/人。', '/upload/img/product/small/m3465e6dbdbd77e48ef66862436c36d0a3.jpg', 5);
INSERT INTO `product` VALUES (81, '【春节 武汉+神农架滑雪 高铁5天 纯玩】入住1晚滑雪场酒店 升级1晚武汉香格里拉酒店', 3899, '13812345678', 1, '入住一晚滑雪场酒店，武汉升级入住香格里拉酒店！', '/upload/img/product/small/m354c084c1f16b42021e8af859532a5045.jpg', 5);
INSERT INTO `product` VALUES (82, '【春节 云南罗平油菜花+贵州+广西 高铁5天 超贵纯玩团】0购物0自费 三大特色宴 布依族篝火晚会【云贵桂三省联游】', 2699, '13812345678', 1, '独家揭秘《爸爸去哪儿5》最火拍摄地，玩转金色花海，探访远离喧嚣的古寨人家！', '/upload/img/product/small/m3180b564776c1e140b73f15de5f3a5312.jpg', 5);
INSERT INTO `product` VALUES (83, '【越南岘港+APEC领导人峰会公园+山茶半岛+下龙湾+天堂岛+河内 单高铁双飞6天 惠贵团】东兴入岘港出 【南北越联游】', 1699, '13812345678', 1, '东兴入岘港出，不走回头路！中越双导游服务，全程专业导游讲解，团团必派广州领队全程贴心服务！', '/upload/img/product/small/m3c59f2779e7e8389160c59974f514e257.jpg', 5);
INSERT INTO `product` VALUES (84, '【张家界深度纯玩 高铁4天贵宾团 】天门山 玻璃栈道 大峡谷玻璃桥 橘子洲头', 2199, '13812345678', 1, '游览天门山森林公园，挑战玻璃栈道+大峡谷玻璃桥 ，品张家界土家风味餐！', '/upload/img/product/small/m3c9c87a1175252d187eb8c4bc228c317d.jpg', 5);
INSERT INTO `product` VALUES (85, '【旅展特价 厦门鼓浪屿3天2晚自由行套餐】含：广州往返二等座高铁票，1晚厦门海边度假客栈+1晚鼓浪屿特色客栈', 799, '13812345678', 1, '含：广州往返二等座高铁票，1晚厦门海边度假客栈+1晚鼓浪屿特色客栈，避开城市的喧嚣，总能找到一个虚度光阴的理由', '/upload/img/product/small/m317ba719d8bcaed4f6e9d0636b7b41888.jpg', 5);
INSERT INTO `product` VALUES (86, '【旅展 买1送1 美食越南·船游下龙湾+芒街+河内 高铁4天】巴亭广场 镇国寺 越式炸鸡火锅宴【佛山出发 高级团】', 999, '13812345678', 1, '入住两晚下龙度假区酒店，感受异域风情；入住一晚河内市区酒店，感受异域民风！', '/upload/img/product/small/m37e9d416ccd26ac920f2f8073cf680011.jpg', 5);
INSERT INTO `product` VALUES (87, '【旅展】梅州双飞3天2晚自由行套票【含广州直飞往返南航含税机票+两晚入住梅州市区豪华精品酒店】', 399, '13812345678', 1, '含广州直飞往返南航含税机票+两晚入住梅州市区豪华精品酒店！', '/upload/img/product/small/m31e09326b42fd836ce5fc34e0a2351d39.jpg', 5);
INSERT INTO `product` VALUES (88, '【旅展买1送1 东北+俄罗斯联游 双飞6天】异域风情俄罗斯 魅力海参崴 醉美吉林长白山 朝鲜族民俗村 长春【赠送长白山下矿物温泉】', 5399, '13812345678', 1, '赴俄罗斯远东最大的城市【海参崴】，体验俄中朝三国交界海湾的异国情调！登中华十大名山——【长白山】，朝鲜族与满族人朝拜的圣山，邂逅神秘美丽的长白山天池！', '/upload/img/product/small/m329953e2c2cc49be10810e70c396bb002.jpg', 5);
INSERT INTO `product` VALUES (89, '【旅展特惠】三亚4天3晚自由行套餐【含广州往返经济舱含税机票，每日自助早餐，3晚三亚万嘉戴斯度假酒店及亚龙湾凯莱仙人掌度假酒店二选一，特惠+1元赠送蜈支洲岛一天游】', 1499, '13812345678', 1, '含广州往返经济舱含税机票，每日自助早餐，3晚三亚万嘉戴斯度假酒店及亚龙湾凯莱仙人掌度假酒店二选一，特惠+1元赠送蜈支洲岛一天游！', '/upload/img/product/small/m3fd7637f5a1a26457acf474e1b6e19504.jpg', 5);
INSERT INTO `product` VALUES (90, '【3.8女神节 • 普者黑赏花包列】— 云南普者黑十里桃花园 千亩玫瑰园 青龙山 太阳魂酒庄 动车四天【纯玩贵宾团】', 1499, '13812345678', 1, '探寻剧版《三生三里十里桃花》拍摄地【菜花箐】，花季醉美千株【桃花园】+【玫瑰园】，亲自体验制作鲜花饼！', '/upload/img/product/small/m31bc451c6678057b8d2aed383fb3243f9.jpg', 5);
INSERT INTO `product` VALUES (91, '【皇牌厦门 动车三天贵宾团】厦门鼓浪屿、演武大桥观景台、云上厦门、沙坡尾“吃堡”美食、厦门大学、南普陀、曾厝垵', 1199, '13812345678', 1, '欣赏极具参观价值、文化价值和艺术价值的旅游景点，深厚的地域特色，将闽南文化完美展现！', '/upload/img/product/small/m31b7e6805e116982076fa15ece3c515a1.jpg', 5);
INSERT INTO `product` VALUES (92, '【旅展 第2位5折】梅州双飞3天2晚自由行套餐【含广州往返含税机票+1晚梅州市区豪华酒店+1晚升级五星级客天下国际大酒店+额外赠送客家小镇门票】', 799, '13812345678', 1, '含广州往返含税机票，入住1晚梅州市区豪华酒店，第二晚升级住五星级客天下国际大酒店，额外赠送客家小镇门票，感受浓郁的客家文化！', '/upload/img/product/small/m33ba04de59f51957cdb9e2d4fac106ac2.jpg', 5);
INSERT INTO `product` VALUES (93, '【厦门动车四天贵宾团】鼓浪屿 演武大桥观景台 沙坡尾“吃堡”美食 厦门大学 集美学村 南普陀 老院子民俗园', 1299, '13812345678', 1, '欣赏极具参观价值、文化价值和艺术价值的旅游景点，深厚的地域特色，将闽南文化完美展现！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (94, '【桂林赏樱·漫步阳朔油菜花】桂林阳朔高铁3天2晚半自由行套餐【含广州往返二等座高铁票+全程入住豪华型酒店+赠送价值75元南溪山樱花园门票一张】', 699, '13812345678', 1, '含广州往返二等座高铁票，全程入住豪华型酒店，特别赠送价值75元南溪山樱花园门票一张！', '/upload/img/product/small/m347fb11112d9d1beca8eb05fa512f8ab5.jpg', 5);
INSERT INTO `product` VALUES (95, '（春季）【玩遍江南&尊享希尔顿 华东五市 纯玩双飞六天 】灵山大佛 禅意拈花湾 双水乡乌镇+南浔', 2299, '13812345678', 1, '超值换购：加1元换购价值280元的上海环球金融中心94层夜景和苏州七里山塘（含船）两大夜景，超值！', '/upload/img/product/small/m3d5d79457cd1f3c2b54a10994d7d9dc08.jpg', 5);
INSERT INTO `product` VALUES (96, '【上海迪斯尼+杭州+无锡+乌镇 纯玩双飞四天】迪士尼烟火秀 船游浪漫西湖 无锡“鼋头渚”赏樱花 杭州太子湾公园赏郁金香 乌镇西栅', 2499, '13812345678', 1, '【玩转迪士尼&夜宿乌镇】上海迪士尼乐园保证游玩一天，无锡鼋头渚樱花漫天，春日品江南、漫度好时光~', '/upload/img/product/small/m317098a81ebfb14cbf99231f2366ba904.png', 5);
INSERT INTO `product` VALUES (97, '【爆款 客都梅州】梅州双飞3天2晚自由行套票【含广州直飞往返含税机票，南方航空往返，入住两晚梅州市区豪华精品酒店】', 399, '13812345678', 1, '含广州直飞往返含税机票，南方航空往返，入住两晚梅州市区豪华精品酒店！', '/upload/img/product/small/m36f8479f515d53d1dd70eb1427bba5223.jpg', 5);
INSERT INTO `product` VALUES (98, '【湖北宜昌+东湖樱花园+长江三峡+恩施大峡谷+维多利亚号豪华邮轮体验 单高单卧5天】女儿城 云龙河地缝 巴乡古寨特色“摔碗酒”篝火晚会 恩施土司城【贵宾团】', 2199, '13812345678', 1, '安排维多利亚豪华游轮，住涉邮轮标双一晚。沿途观赏长江三峡“巫峡十二峰”等美景；到中国最大的樱花园—东湖磨山樱花，5000株樱花竞吐芬芳！', '/upload/img/product/small/m384d4636d5e230082ce3f8ab56541171e.jpg', 5);
INSERT INTO `product` VALUES (99, '【华东五市+乌镇西栅 双飞6天 纯玩】杭州西湖 西溪湿地 上海外滩 太湖 G20新杭城【冬游江南&夜宿乌镇 金马自营】', 1899, '13812345678', 1, '全程纯玩无购物，只收20人，全陪陪伴玩遍江南！品味舌尖江南！无锡三白宴、杭州御茶宴、乌镇水乡特色风味宴！', '/upload/img/product/small/m33f0d22d87eee526e0c25384f78654b05.jpg', 5);
INSERT INTO `product` VALUES (100, '【甘肃敦煌+张掖+兰州+莫高窟+鸣沙山+嘉峪关单高铁单卧6天】西域豪情 重走河西走廊', 2699, '13812345678', 1, '寻访敦煌“东方艺术宝地”莫高窟，沙漠奇观—鸣沙山；天下沙漠第一泉月牙泉；登临明万里长城西止点、戈壁幻海--嘉峪关！', '/upload/img/product/small/m3f25da4da92afb6220a8ca5dd79ba7103.jpg', 5);
INSERT INTO `product` VALUES (101, '【越南南北越联游 双动双飞6天】越南岘港 美溪海滩 会安 船游下龙湾 山 首都河内', 1599, '13812345678', 1, '海：越南特色红木游船畅游下龙湾；陆：动车往返安全准时；空：越南境内安排双飞实现南北越联游！特别安排岘港一天自由活动!', '/upload/img/product/small/m310f6788ab0c5cc832a227c91e131492a.jpg', 5);
INSERT INTO `product` VALUES (102, '【张家界高铁4天 深度纯玩高级团】天门山 玻璃栈道 大峡谷玻璃桥', 1999, '13812345678', 1, '游览天门山森林公园，挑战玻璃栈道+大峡谷玻璃桥 ，品张家界土家风味餐！', '/upload/img/product/small/m3465e6dbdbd77e48ef66862436c36d0a3.jpg', 5);
INSERT INTO `product` VALUES (103, '【春节 山西大同云冈石窟+太原滑雪+五台山+平遥 双飞5天 超贵团】晋商民俗文化祈福+新春灯会+常家庄园游【超贵团】', 3299, '13812345678', 1, '平遥“古城狂欢喜乐汇”晚宴，欣赏精彩的民俗歌舞表演，现场学习扭秧歌；大同“新春灯会”，一场展示古都大同文化魅力的春节盛会，将带给人们震撼的视觉盛宴。', '/upload/img/product/small/m3215fa33f149b8414832b064356c5527b.jpg', 5);
INSERT INTO `product` VALUES (104, '【旅展特惠】三亚4天3晚自由行套餐【含广州往返经济舱含税机票+3晚三亚万嘉戴斯度假酒店或亚龙湾凯莱仙人掌度假酒店二选一+每日自助早餐，特惠+1元赠送蜈支洲岛一天游】', 1499, '13812345678', 1, '含广州往返经济舱含税机票，每日自助早餐，3晚三亚万嘉戴斯度假酒店及亚龙湾凯莱仙人掌度假酒店二选一，特惠+1元赠送蜈支洲岛一天游！', '/upload/img/product/small/m318d363b3ad3d3bf0308318d012f338a1.jpg', 5);
INSERT INTO `product` VALUES (105, '【旅展 玩转越南芽庄+下龙湾+河内 双高双飞6天】芽庄大教堂 婆那加占婆塔 芽庄沙滩【高级团】', 1899, '13812345678', 1, '海陆空联游南北越线路：一次轻松联游越南国南北两大板块，穿越南北气候大体验！两晚芽庄海边度假区，近距离尽情享受亚热带海滩度假情趣！', '/upload/img/product/small/m3cfada653cee3cfa258970e836465f6ae.jpg', 5);
INSERT INTO `product` VALUES (106, '【寒假 上海迪士尼+乌镇+杭州西湖 双飞4天】入住2晚国际品牌喜来登酒店 夜宿乌镇西栅【上海世嘉都市乐园+乌镇水乡提灯走桥+船游浪漫西湖】', 3299, '13812345678', 1, '畅玩中国内地第一个迪士尼主题乐园——上海迪士尼乐园，让您回味童年时光，开启新的冒险旅程。', '/upload/img/product/small/m3bf14f8464a1b270d90fbf7a3a923fe8f.jpg', 5);
INSERT INTO `product` VALUES (107, '【春节 华东五市+南浔+乌镇+灵山大佛 双飞6天 纯玩】南浔水乡民俗年 灵山祈福 宋城庙会 夫子庙灯会【喜贺新岁·十全十美玩转江南】', 3599, '13812345678', 1, '闲逛三大庙会，十大新春体验，至正大鱼大肉，各种好玩活动，悦享品质住宿，赠送新春礼包！', '/upload/img/product/small/m3439569622eef1de3271e64cbb51ed957.jpg', 5);
INSERT INTO `product` VALUES (108, '【湖南郴州莽山+寻雾东江湖+森林温泉 单高3天顶贵团】龙景大峡谷+瀑布 猴王寨 天台山 鬼子寨 自然博物馆【全程五星·饕餮盛宴】', 1299, '13812345678', 1, '市区入住拥有“酒店如景区”美誉的国际奢华品牌酒店---温德姆至尊豪廷酒店！第二晚入住“森林中的皇宫”之美誉的莽山森林温泉酒店，享受“莽山三绝”国家一级水质·富含偏硅酸的高山温泉！', '/upload/img/product/small/m3501326413840ce82b9ba14db3a3a5eea.jpg', 5);
INSERT INTO `product` VALUES (109, '桂林+龙脊 高铁3天2晚 半自由行套票【含广州往返高铁票+2晚桂林市区豪华型酒店+龙脊梯田一天游】', 659, '13812345678', 1, '含广州往返高铁票+2晚桂林市区豪华型酒店+安壮族梯田一天游！', '/upload/img/product/small/m3245e8fae59aa629c11de582562c984b0.jpg', 5);
INSERT INTO `product` VALUES (110, '【三八女神节 厦门+小嶝岛 动车四天纯玩超贵团】厦门鼓浪屿、香山赏花、小嶝岛联欢晚会、小嶝海鲜火锅 、两晚超豪华酒店', 1799, '13812345678', 1, '特别安排体验小嶝岛休闲渔村、美人海漂浮、三八“女神节”联欢晚会、海岛转转乐，赚翻金元宝，更有机会赢取小嶝大礼包', '/upload/img/product/small/m317ba719d8bcaed4f6e9d0636b7b41888.jpg', 5);
INSERT INTO `product` VALUES (111, '【旅展买1送1 海南三亚西岛+亚龙湾沙滩+兴隆南国热带雨林+博鳌 双飞4天】北仍村 “第一夫人”茶点 椰田古寨【高级团】', 1899, '13812345678', 1, '游玩西岛、博鳌论坛成立会址、南国热带雨林、椰田古寨、亚龙湾！', '/upload/img/product/small/m3dc9f22d10070d66a939555d3e63aaef2.jpg', 5);
INSERT INTO `product` VALUES (112, '【黄金邮轮：宜昌至重庆 高铁5天 超贵团】长江三峡 三峡大坝 小三峡 丰都鬼城 白帝城 重庆磁器口 解放碑【观景大床房】', 3299, '13812345678', 1, '直达双动，不走回头路，直达目的地；游览仙境般的长江三峡支流峡谷----大宁河小三峡；享用游船上精美中西自助美食！', '/upload/img/product/small/m39db8ff93b2163506bda46a137adc0147.jpg', 5);
INSERT INTO `product` VALUES (113, '【长江黄金邮轮 重庆-宜昌 高铁5天 超贵团】长江三峡 三峡大坝 小三峡 丰都鬼城 重庆磁器口 解放碑【阳台标双房】', 3499, '13812345678', 1, '直达双动，不走回头路，直达目的地；游览仙境般的长江三峡支流峡谷----大宁河小三峡；享用游船上精美中西自助美食！', '/upload/img/product/small/m3caa309cf45feb26ae050469ddaca1bac.jpg', 5);
INSERT INTO `product` VALUES (114, '【买1送1·贵港+北海 高铁4天 超贵团】九龙瀑布群 北海银滩 侨港镇 茉莉花园 南迈渔村 普度寺 北海老街【 全程超豪华酒店】', 1799, '13812345678', 1, '游田园风光茉莉花园；观广西最大九龙瀑布群；叹美食四餐特色美味宴，让您的味蕾融入当地特色！特别安排入住三晚超豪华酒店，悉心安排，舒适旅程！', '/upload/img/product/small/m36348b23619f62edbe09880c8756364ff.jpg', 5);
INSERT INTO `product` VALUES (115, '【旅展 越南下龙湾+芒街+首都河内双飞4天 南航往返·美食越南】巴亭广场 镇国寺 越式炸鸡火锅宴【高级团】', 699, '13812345678', 1, '独家包船游下龙湾，升级一餐越式炸鸡火锅宴，双导游服务，免收服务小费，周全照顾贴心服务随心出游！', '/upload/img/product/small/m36c0ae831791eb95edb5f4f7573d83021.jpg', 5);
INSERT INTO `product` VALUES (116, '【旅展买1送1 致享云南大理+丽江+香格里拉+昆明 超贵团】石卡雪山 虎跳峡 独克宗 拉市海 大理古城 洱海公园 昆明九乡溶洞 动车七天【美食篝火•温泉SPA•河灯许愿】', 3799, '13812345678', 1, '致享云南—玩转地道景点—品味地道美食—享受地道温泉，就是要玩地道云南', '/upload/img/product/small/m38bb4bcb4d9610a756c655ccb881b8629.jpg', 5);
INSERT INTO `product` VALUES (117, '【旅展买1送1·美食越南 高铁4天】船游下龙湾 芒街 首都河内 巴亭广场 镇国寺 越式炸鸡火锅宴【高级团】', 999, '13812345678', 1, '漫步异域首都、百花春城—河内！升级一餐越式炸鸡火锅宴，双导游服务，免收服务小费，周全照顾贴心服务随心出游！', '/upload/img/product/small/m36c0ae831791eb95edb5f4f7573d83021.jpg', 5);
INSERT INTO `product` VALUES (118, '【旅展买1送1 厦门高铁3天·无自费】环岛路 曾厝垵小吃街 著名学府—厦门大学 南普陀寺 忠仑公园赏花 鼓浪屿【高级团 深圳北出发】', 999, '13812345678', 1, '鼓浪屿，中山路，南普陀寺，环岛路，曾厝垵，厦门大学，漫步海上花园，寻幽万国建筑。著名小吃如土笋冻，海蛎煎，叶氏麻糍！', '/upload/img/product/small/m31b7e6805e116982076fa15ece3c515a1.jpg', 5);
INSERT INTO `product` VALUES (119, '【乐游中原 赏牡丹】古都西安 洛阳牡丹花 黄河壶口瀑布 革命地延安 黄帝陵 秦始皇兵马俑 西岳华山 嵩山少林寺 郑州 双卧八天全景游一价全包', 2950, '13812345678', 1, '【乐游中原 赏牡丹】畅游陕西、河南、山西三省各大精华景点，探索大中原地区的黄河文化底蕴，了解中国的千年历史文化。', '/upload/img/product/small/m329417d0ce48c867d55038ab39779fef3.jpg', 5);
INSERT INTO `product` VALUES (120, '【80后情怀：江西庐山 休闲游 高铁3天】醉美三叠泉瀑布 美庐别墅【贵宾团】', 1799, '13812345678', 1, '庐山一地深度纯玩游，全程入住豪华酒店！', '/upload/img/product/small/m361e9c3aa97573555ac770f5b63e1a598.jpg', 5);
INSERT INTO `product` VALUES (121, '【旅展买1送1 山西+内蒙古联游 双飞5天】呼和浩特 响沙湾 希拉穆仁草原 内蒙古博物馆 达旗 山西大同【贵宾团】', 2999, '13812345678', 1, '山西＋内蒙游，感受响沙湾“大漠孤烟直”的雄浑与壮美、亲临牧户家庭；品尝地道的内蒙古美食、手把肉、正宗涮羊肉，体会独特浓郁的蒙古民族文化风情！', '/upload/img/product/small/m3a70558ab3e3d4e57ea005eb317cd18fd.jpg', 5);
INSERT INTO `product` VALUES (122, '【女神月 桂林+阳朔高铁3天 畅游海洋乡+恭城双桃花节 骥马村油菜花海】侗情水庄 桂林船游一江四湖 金牌漓江鱼油茶宴【超贵团·豪叹大公馆·全程0自费】', 599, '13812345678', 1, '畅游3大桂林最美的赏花胜地：十里桃花长廊、赏油菜花海；桂林升级一晚超豪华度假酒店【桂林大公馆】，叹享绝美山水梦境！品尝超高好评率价值800元/围【全猪宴】+价值800元/围【漓江鱼油茶宴】！', '/upload/img/product/small/m3e5d098135b9249aab3ba5c2b71759773.jpg', 5);
INSERT INTO `product` VALUES (123, '【春节 云南香格里拉+丽江+大理 双飞6天超贵团】石卡雪山 虎跳峡 独克宗古镇 拉市海 洱海公园 花语牧场 昆明乃古石林【登峰玩雪•美食篝火•温泉SPA•河灯许愿】', 2999, '13812345678', 1, '门票一价全包；登顶香格里拉藏族神山—石卡雪山；走进藏区古镇独克宗，感受地道藏式民俗；闲叹魅力双古城（丽江+大理）！', '/upload/img/product/small/m31baca2c10aeda9fbb13bc14e0411a9ec.jpg', 5);
INSERT INTO `product` VALUES (124, '【3-4月 北京+天津+赏花专线 双飞5天 3钻】北京玉渊潭樱花 故宫 八达岭长城 颐和园白玉兰 天坛杏花林 景山公园牡丹花 奥运场馆 天津之眼 天津三街 周邓纪念馆', 1599, '13812345678', 1, '春暖花开，北京玉渊潭樱花，邂逅樱花雨；天坛公园杏花林，鲜为人知的千年暗香；颐和园白玉兰，被誉为“霓裳羽衣静闹春”配上颐和园宫廷景色，美不可言；景山公园牡丹花，京城最大的牡丹观赏园！', '/upload/img/product/small/m32d3dddcfc618e1a72a4233e581db79de.jpg', 5);
INSERT INTO `product` VALUES (125, '【3-4月直飞北京+赏花专线 双飞6天 3钻】故宫 八达岭长城 奥运场馆【赏花专线：玉渊潭樱花 颐和园白玉兰 天坛杏花林 景山公园牡丹花】', 1699, '13812345678', 1, '春暖花开，北京玉渊潭樱花，邂逅樱花雨；天坛公园杏花林，鲜为人知的千年暗香；颐和园白玉兰，被誉为“霓裳羽衣静闹春”配上颐和园宫廷景色，美不可言；景山公园牡丹花，京城最大的牡丹观赏园！', '/upload/img/product/small/m3816f0affbd6e8f4a63ea5c92040c5c15.jpg', 5);
INSERT INTO `product` VALUES (126, '【春节轻奢·直飞张家界 天门山玻璃栈道+大峡谷玻璃桥+凤凰古城 双飞5天 顶贵团 5钻】盘龙崖+赏雾凇 【品土司王赶年盛宴+全程超豪华酒店】', 2099, '13812345678', 1, '南航包机、直飞张家界只需1.5小时，路程劲省6小时；全程无购物，全程入住超豪华酒店/客栈，20人精品小团，更舒适更温馨；独家尊享土司王团年宴！', '/upload/img/product/small/m39428c374b8f8debe994cfbff6de4a3db.jpg', 5);
INSERT INTO `product` VALUES (127, '【张家界天门山+大峡谷玻璃桥+凤凰古城 高铁4天 】寒假不涨价·赏雾凇 独家安排韩式全地暖超豪酒店【5钻 零自费】', 1299, '13812345678', 1, '畅游4大核心热门景区：张家界天门山森林公园、玻璃栈道、大峡谷景区+玻璃桥、澧水船说、凤凰古城；全程超豪华酒店，张家界入住首家韩式全地暖超豪酒店！', '/upload/img/product/small/m3220493598a144aceec2e7c6ed8f69c2e.jpg', 5);
INSERT INTO `product` VALUES (128, '【广西资源+天门山风景区+船游资江+兴安水街高铁3天 超贵团】观中国丹霞奇观 全程入住温泉酒店 品农家河鲜宴【浪漫尊享•桂北恋歌】', 839, '13812345678', 1, '资源1晚入住【资源丹霞温泉酒店】，泡浴丹霞森林温泉！1晚豪华体验：兴安入住中国十大最受欢迎度假酒店、中国建筑最高品质“鲁班奖”【乐满地度假酒店】，独家赠送泡浴乐满地温泉！', '/upload/img/product/small/m3a92bdb8a11c5f83bdeddb8ee3abbd3fc.jpg', 5);
INSERT INTO `product` VALUES (129, '【山东 泰山+曲阜古城+济南+青岛+威海 双飞6天】 佛国兖州 鸢都潍坊 仙境蓬莱【升级1晚超豪华酒店】', 2199, '13812345678', 1, '欧韵青岛、花园威海、蓬莱寻仙、风筝潍坊、泰山祈福、曲阜圣城、佛国兖州、泉城济南；一次游遍山东全景，不走回头路！', '/upload/img/product/small/m382f1a4f592ab77e152fa9eb59d5eaee7.jpg', 5);
INSERT INTO `product` VALUES (130, '【贵州黄果树大瀑布+荔波小七孔+西江千户苗寨 单飞单动5天】陡坡塘 天星桥 丹寨万达小镇 贵阳青岩古镇【直飞荔波】', 1899, '13812345678', 1, '单飞单动玩转贵州精华景点，直飞荔波劲省7小时车程！加游非遗文化聚集地的丹寨万达小镇！住宿升级：入住两晚豪华酒店+升级一晚超豪华酒店，西江入住景区特色客栈！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (131, '【2月 北京+天津+雪世界滑雪双飞5天 3钻】明清宫3D画廊 颐和园 故宫 八达岭 天坛 奥运场馆 天津三街 周邓纪念馆', 2499, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；升级体验乘坐25分钟京津城际高速列车！加游华北户外至大的滑雪场-雪世界滑雪！', '/upload/img/product/small/m34df74737b1cae0f6893d5b9895d4545b.jpg', 5);
INSERT INTO `product` VALUES (132, '【云南罗平油菜花+贵州荔波大小七孔+高山滑雪 高铁6天】乌蒙大草原 兴义万峰林 船游万峰湖 马岭河大峡谷 雨补鲁天坑【金马自营】', 2499, '13812345678', 1, '云贵大穿越！畅游世界双自然遗产地 荔波大小七孔，赏罗平油花，领略坡上草原乌蒙滑雪，探秘世界地质公园尽享最美自然，醉美风情！', '/upload/img/product/small/m3fe89654cb1d095d30a90eca1dbfd77c5.jpg', 5);
INSERT INTO `product` VALUES (133, '【春节 桂林 高铁3天·豪叹罗山湖温泉】兴安水街 船游灵渠 猫儿山 桂林訾洲郁金香花海 城徽象鼻山【全程0自费】', 1479, '13812345678', 1, '全程入住超豪华酒店，1晚指定入住国际品牌一一罗山湖温泉度假酒店！含酒店自助早餐，室内室外温泉泡池多达20个免费无限畅泡！', '/upload/img/product/small/m3c1ba05da8b7267e4c0bb1bcfee0f2f0b.jpg', 5);
INSERT INTO `product` VALUES (134, '【春节 海南三亚分界洲岛+南山文化苑+亚龙湾双飞4天 超贵团】椰田古寨 兴隆南国热带雨林【祈福南山 邂逅美女岛 品尝美食大餐】', 3999, '13812345678', 1, '全程升级超豪华酒店；品海南四大名菜、海鲜餐、琼海温泉鹅、南山禅悦苑素斋！', '/upload/img/product/small/m339fc97b006caec2baf3ca8ff462c0c1c.jpg', 5);
INSERT INTO `product` VALUES (135, '【春节 华东三市+绍兴+乌镇 双飞4天 入住奢华酒店】上海城隍庙逛庙会 苏州寒山寺祈福 杭州船游西湖 绍兴鲁迅故居探古 乌镇行大运', 2399, '13812345678', 1, '入住1晚国际品牌五星标准酒店；畅游华东精华景点：中华艺术宫、两大庙会、苏州狮子林、寒山寺祈福、乌镇景区、船游西湖、G20会址；', '/upload/img/product/small/m3017784848ae0091547160f77e682d9d8.jpg', 5);
INSERT INTO `product` VALUES (136, '【春节 福建厦门高铁3天】鼓浪屿、南普陀寺、南普陀祈福 、冬暖闽南佛跳墙、枫满老院子【瑞狗贺岁 红火过大年】', 1899, '13812345678', 1, '厦门小资胜地鼓浪屿、曾厝垵，充足自由活动时间，让您尽情品尝地道美食；冬日滋补品尝两大闽菜经典正宗佛跳墙、姜母鸭！', '/upload/img/product/small/m3b989a3f3653eaab8d291362474e7d2b0.jpg', 5);
INSERT INTO `product` VALUES (137, '【桂林+龙脊梯田放水节高铁4天 纯玩0自费】兴坪漓江 银子岩 訾洲郁金香花海 象鼻山【漓水人家体验非遗文化 福利古镇扇画体验 超贵团】', 1499, '13812345678', 1, '欣赏“世界梯田之冠”龙脊梯田水满田畴，层层银链的震撼风景；体验漓水人家非遗传统文化，亲子同乐一起感受手工皂制作、辣酱的制作工艺、古法榨油、蜡染扎染织布等体验', '/upload/img/product/small/m32d0abfffd0a64b397315bd0eed5776d4.jpg', 5);
INSERT INTO `product` VALUES (138, '【春节普陀山祈福 双飞4天 宁波往返】游佛国仙境普陀山 南海观音大佛 慧济寺', 2299, '13812345678', 1, '宁波往返，广州南航直飞，并安排舟山连岛大桥，便捷又可观赏胜景；一晚入住普陀山，感受佛国的梵音、感受海岛清静；~', '/upload/img/product/small/m313e7dd333f562f2830ba00744d4f4a77.jpg', 5);
INSERT INTO `product` VALUES (139, '【春节 安徽过大年黄山+宏村双飞4天 黄山直航】叹徽州火锅大餐 品舌尖上的美食黄山臭鳜鱼 夜宿鲍家花园', 3299, '13812345678', 1, '直飞黄山，畅游世界自然文化遗产地黄山，观日出，看云海；畅游享有\"中国画里的乡村\"之称的宏村；入住一晚花园式的私家园林内酒店—歙县鲍家花园大酒店享世外桃源之宁静！', '/upload/img/product/small/m3e4645981ee23d9b89ba41ad7363ae3fa.jpg', 5);
INSERT INTO `product` VALUES (140, '【春节 福建厦门 高铁3天】柔情鼓浪屿+厦门大学+房车主题公园+世贸海峡大厦+年夜饭+曾厝垵+环岛路【纯玩团】', 1899, '13812345678', 1, '浪漫情人节，赠送每对情人可获赠臻品进口红酒一瓶+新鲜玫瑰一支！', '/upload/img/product/small/m317ba719d8bcaed4f6e9d0636b7b41888.jpg', 5);
INSERT INTO `product` VALUES (141, '【春节 江西三清山+婺源篁岭+景德镇+南昌 双飞4天 纯玩】升级1晚超豪华酒店 赠新春大礼包【赏雪景 品美食 篁岭过大年】', 2599, '13812345678', 1, '全程纯玩0购物；深度体验婺源的浓浓春节年味--乡村过大年，深度体验“晒秋人家---篁岭”古村落滚铁轮、踩高跷、观看民俗小吃制作、晒乡俗等民俗活动。', '/upload/img/product/small/m374cc1984c1f76571bf6aab86f3f613d1.jpg', 5);
INSERT INTO `product` VALUES (142, '【春节 江西庐山赏雾凇+三清山+婺源+景德镇+南昌 高铁5天 纯玩】特别安排婺源体验年俗活动 升级1晚超豪华酒店【浓浓年味 品享江西】', 2949, '13812345678', 1, '深度体验婺源的浓浓春节年味--乡村过大年，深度体验“晒秋人家---篁岭”古村落滚铁轮、踩高跷、观看民俗小吃制作、晒乡俗等民俗活动。三清山脚升级一晚超豪华酒店。', '/upload/img/product/small/m349831f96902ff1e8382bcedeb4929d5d.jpg', 5);
INSERT INTO `product` VALUES (143, '【春节爆款 越南下龙湾+天堂岛+巡洲岛+河内 高铁5天 超贵纯玩团】0购物0自费 全程超豪华酒店 叹海滩温泉【越识叹·奢叹北越】', 2899, '13812345678', 1, '全程入住超豪华度假酒店+河内一晚国际五星酒店，尊享越南法式度假！国内入住最新落成宁明花山温泉度假酒店，尽享温泉夜！赠送观光环保小巴畅游河内三十六行古街带您领略河内“地胆“文化！', '/upload/img/product/small/m3cc6cf2d161de7dbf8a963b0451ea7cfe.jpg', 5);
INSERT INTO `product` VALUES (144, '【春节 江西三清山+婺源篁岭+景德镇+南昌 高铁4天 纯玩】0购物 赠新春大礼包 升级1晚超豪华酒店【赏雪景·品美食·篁岭过大年】', 2499, '13812345678', 1, '全程纯玩0购物；深度体验婺源的浓浓春节年味--乡村过大年，深度体验“晒秋人家---篁岭”古村落滚铁轮、踩高跷、观看民俗小吃制作、晒乡俗等民俗活动；升级一晚超豪华酒店！', '/upload/img/product/small/m349831f96902ff1e8382bcedeb4929d5d.jpg', 5);
INSERT INTO `product` VALUES (145, '【东北雪乡+亚布力滑雪+吉林雾凇+哈尔滨+长春 双飞5天 纯玩】全程入住3晚豪华酒店 雪乡入住特色暖炕【精华小东北】', 4899, '13812345678', 1, '每个城市住一晚，行程适中，提供充足赏雪、玩雪时间！全程入住3晚豪华酒店，雪乡入住特色暖炕！', '/upload/img/product/small/m325da9a174979787845fe6c7b71e8f095.jpg', 5);
INSERT INTO `product` VALUES (146, '【1月 云南罗平油菜花+贵州兴义万峰林+广西百色高铁4天 超贵纯玩团】0购物0自费 马岭河大峡谷 起义纪念馆 三大特色宴', 1599, '13812345678', 1, '全程纯玩0购物0自费！贵州升级2晚超豪华酒店！享用当地三大特色宴：贵州兴义特色宴、酸汤鱼宴、广西百色农家宴！', '/upload/img/product/small/m3fb75c5e8b6c0ca4b851c98a6c709b7fb.jpg', 5);
INSERT INTO `product` VALUES (147, '【春节 华东五市+上海迪士尼乐园+灵山大佛祈福+乌镇 双飞6天】纯玩0自费 1晚乌镇特色客栈+升级1晚超豪华酒店', 3499, '13812345678', 1, '一价全包，上海迪士尼乐园游足一天；感受江南三大夜景：古镇乌镇赏西栅水乡灯会，祈福新年；杭州宋城观宋城千古情，感受一场最震撼的视觉盛宴；上海登环球金融中心，览尽璀璨夜上海！', '/upload/img/product/small/m30425fcc7f1b2f1b7c40cfe29e3d0b1a1.jpg', 5);
INSERT INTO `product` VALUES (148, '【特价 东北亚布力滑雪+雪乡+哈尔滨+大连 三飞6天】特别升级1晚超豪华酒店', 5599, '13812345678', 1, '大连、雪乡、亚布力、哈尔滨，看海赏雪三飞之旅精彩畅游！爸爸去哪儿”取景地中国第一雪乡双峰林场，雪韵大街美美摆拍！', '/upload/img/product/small/m30e6aedf6e0d7e753016dd9fc9a9e93f9.jpg', 5);
INSERT INTO `product` VALUES (149, '【云南腾冲+瑞丽+芒市 双飞5天 腾冲往返 顶贵团】 和顺古镇+热海+云峰山温泉SPA【至尊全景游】', 4199, '13812345678', 1, '广州直飞腾冲往返，正点航班；全程一价全包；全程当地超豪华型酒店，升级1晚腾冲超豪华云峰山温泉度假酒店；品尝滇西特色美食：孔雀宴、簸箕宴，给您至尊享受！', '/upload/img/product/small/m39060b0883d8a358677b8c222abcc7bae.jpg', 5);
INSERT INTO `product` VALUES (150, '【春节 四川成都+西岭雪山 双飞5天 超贵团】全程不进购物店', 4599, '13812345678', 1, '春节出游成都入住五星豪华酒店；精心安排全球最大——泰迪熊博物馆和四川熊猫地基乐园！', '/upload/img/product/small/m3d283063b783a4c89670c3f6f68877e8f.jpg', 5);
INSERT INTO `product` VALUES (151, '【春节 四川+重庆+西岭雪山滑雪 双飞5天 成都进重庆出 纯玩贵宾团】全程入住超豪华酒店 不进购物店', 4799, '13812345678', 1, '双飞一动，乐游成都、重庆两地，不走回头路，尽享川渝美景；探寻巴渝美食；品地道四川麻辣火锅；全程入住超豪华酒店；', '/upload/img/product/small/m3d283063b783a4c89670c3f6f68877e8f.jpg', 5);
INSERT INTO `product` VALUES (152, '【春节 四川成都+西岭雪山滑雪+峨眉山+乐山大佛+黄龙溪古镇 双飞5天 贵宾纯玩】全程入住超豪华酒店 全程不进购物点', 4999, '13812345678', 1, '全程入住超豪华酒店；精心安排四川特色麻辣火锅，峨眉养生农家宴；全程不进购物点；感受休闲成都、逛锦里，游古镇，美食享不尽；', '/upload/img/product/small/m3d283063b783a4c89670c3f6f68877e8f.jpg', 5);
INSERT INTO `product` VALUES (153, '【春节 张家界天门山+大峡谷+凤凰古城+玻璃栈道+玻璃桥 高铁4天】土司王团年盛宴+超豪华酒店', 1799, '13812345678', 1, '一价全含！升级一晚超豪铂金酒店，华而不奢，温情似家【蓝湾博格国际酒店】；品独家尊享【土司王团年宴】，土司王敬酒，欢欢喜喜过大年！', '/upload/img/product/small/m3c9c87a1175252d187eb8c4bc228c317d.jpg', 5);
INSERT INTO `product` VALUES (154, '【春节 越南下龙湾+巡洲岛+茶古半岛+芒街+南宁 双飞4天】+1元换购680元天堂岛+惊讶洞 0购物0自费', 2999, '13812345678', 1, '全程入住超豪华度假酒店，承诺纯玩0购物0自费！重本包游世界级奇观007明日帝国、金刚拍摄胜地世界七大自然奇观之一【下龙湾】！', '/upload/img/product/small/m37e9d416ccd26ac920f2f8073cf680011.jpg', 5);
INSERT INTO `product` VALUES (155, '【2月 直飞北京+雪世界滑雪 双飞6天 纯玩3钻】北京故宫 八达岭长城 明清宫3D画廊 颐和园 天坛 奥运场馆 什刹海', 2599, '13812345678', 1, '加游华北户外至大的滑雪场-雪世界滑雪，体验北方冰雪世界，一尽滑雪乐趣！', '/upload/img/product/small/m34df74737b1cae0f6893d5b9895d4545b.jpg', 5);
INSERT INTO `product` VALUES (156, '【春节 四川西岭雪山滑雪+峨眉山+乐山大佛+成都 双飞5天 纯玩顶贵团】全程入住超豪华酒店 全程不进购物点', 4899, '13812345678', 1, '全程入住当地超豪华酒店！精心安排四川特色麻辣火锅，峨眉养生农家宴！全程不进购物点！', '/upload/img/product/small/m3779b5ee17cc9ec56b24c3aa3c8b691fc.jpg', 5);
INSERT INTO `product` VALUES (157, '【春节 神农架滑雪 双飞4天 宜昌往返 纯玩高级团】午对晚航班 安排特色团年饭 宜昌升级1晚豪华酒店', 3999, '13812345678', 1, '午对晚航班广州直飞宜昌！安排特色团年饭！宜昌升级1晚豪华酒店！', '/upload/img/product/small/m31a276fb64f35d765c941aade4e436e2d.jpg', 5);
INSERT INTO `product` VALUES (158, '【含春节 私家小团 上海迪士尼乐园+莫干山过大年 双飞4天 杭州进上海出】全程7座别克商务车或15座丰田海狮商务车', 5399, '13812345678', 1, '本产品专为亲子家庭服务，不拼陌生人；入住西湖风景区挂牌五星酒店；1晚风靡海内外民宿圣地莫干山下莫莫民宿；1晚迪士尼附近挂牌五星酒店；全程使用7座别克车/15座丰田海狮商务用车', '/upload/img/product/small/m3bf14f8464a1b270d90fbf7a3a923fe8f.jpg', 5);
INSERT INTO `product` VALUES (159, '【含春节 私家小团 上海迪士尼+乌镇西栅 双飞4天 上海往返】全程豪华住宿 使用7座别克商务车或15座丰田海狮商务车', 5650, '13812345678', 1, '全程使用7座别克车/15座丰田海狮商务用车，商务司机点对点接送无缝对接！博物馆+迪士尼+水乡乌镇，与孩子一起边学边玩，过一个轻松愉快的假期！', '/upload/img/product/small/m36491998889e9597f0e7753beea037ae3.jpg', 5);
INSERT INTO `product` VALUES (160, '【春节 华东三市+乌镇西栅 双飞4天】全程超豪华酒店 乌镇西栅闹新年 上海城隍庙逛庙会 乌镇春节长街宴 吃货天堂外婆家【尊享小江南】', 3499, '13812345678', 1, '特别安排乌镇“长街宴”、“吃货天堂”杭州“外婆家”，品尝杭帮盛宴。全程入住超豪华酒店，乌镇入住一晚乌镇景区内客栈，全程睡眠舒适安心！', '/upload/img/product/small/m33f0d22d87eee526e0c25384f78654b05.jpg', 5);
INSERT INTO `product` VALUES (161, '【春节 韶山+张家界+天门山+大峡谷+凤凰古城+玻璃栈道+玻璃桥 高铁5天 4钻】土司王团年盛宴 纯玩团·零购物·一价全含【湘西全景】', 2099, '13812345678', 1, '新春游张家界森林公园、天门山国家森林公园、大峡谷玻璃桥、凤凰古城、土司王宫；新春幸福团圆，零购物·一价全含；独家尊享土司王团年宴，欢欢喜喜过大年！', '/upload/img/product/small/m3d07a3e37145d623e59f4e4e33544ce2f.jpg', 5);
INSERT INTO `product` VALUES (162, '【春节 神农架滑雪+三峡大坝 双飞4天 宜昌往返 纯玩惠贵团】东航早对晚航班 神农架特色团年饭', 2699, '13812345678', 1, '直飞宜昌，东航早对晚航班！特别安排神农架团年饭！安排入神农架木鱼镇旅游区酒店、升级一晚神农架超豪华酒店、升级一晚宜昌豪华酒店！', '/upload/img/product/small/m3da261c8b05a2b8f6d7c4026fbd8fadfa.jpg', 5);
INSERT INTO `product` VALUES (163, '【寒假 华东三市+周庄+南浔 双飞4天 纯玩】全程入住超豪华酒店', 2699, '13812345678', 1, '登上海环球金融中心，鸟瞰夜上海璀璨星光，尽享精彩之夜。全程入住超豪华酒店；浙沪网红人气名店畅吃饕餮美食，红红火火”锅“大年！', '/upload/img/product/small/m3c448e5f5c39ecb30d560b6c2f75aa6a9.jpg', 5);
INSERT INTO `product` VALUES (164, '【寒假 华东五市+乌镇西栅+灵山大佛+西溪湿地 双飞6天 纯玩】一价全包 全程无自费无购物 独家安排体验提灯走桥', 2799, '13812345678', 1, '一次感受江南三大夜景：古镇乌镇赏西栅水乡灯会，月明人圆，祈福新年；杭州宋城观宋城千古情，感受一场最震撼的视觉盛宴；上海登环球金融中心，览尽璀璨夜上海。', '/upload/img/product/small/m3c448e5f5c39ecb30d560b6c2f75aa6a9.jpg', 5);
INSERT INTO `product` VALUES (165, '【春节 宁夏银川+贺兰山滑雪 双飞4天】激情高山滑雪 畅享冰雪温泉 银川入住超豪华酒店', 3699, '13812345678', 1, '中国西北规模最大最完善的专业高山滑雪场【贺兰山国家森林公园滑雪场】！领略塞外冰雪美景，享受贺兰山麓下的天然温泉【瑞信.天沐温泉度假小镇】！', '/upload/img/product/small/m304b69a4c8328f7d6b8d5dadef020fe07.jpg', 5);
INSERT INTO `product` VALUES (166, '【春节 四川西岭雪山+成都+重庆 双飞5天 顶贵团】成都入重庆出 不走回头路 全程豪华酒店 不进购物店', 4499, '13812345678', 1, '双飞一动，乐游成都、重庆两地，不走回头路！春节出游全程入住豪华酒店，不进购物店！', '/upload/img/product/small/m3a74265f502594009829cb41e17db56ac.jpg', 5);
INSERT INTO `product` VALUES (167, '【普陀山+乌镇+杭州+绍兴+宁波 双飞4天 宁波往返】普陀山祈福平安 夜宿普陀山山上 安排一晚乌镇外豪华酒店', 2299, '13812345678', 1, '宁波往返，直达普陀山，穿梭舟山连岛大桥，便捷交通又可观赏到海天一线胜景；', '/upload/img/product/small/m313e7dd333f562f2830ba00744d4f4a77.jpg', 5);
INSERT INTO `product` VALUES (168, '【第2位5折 贵州黄果树瀑布+西江千户苗寨+贵阳 高铁4天 纯玩】【苗韵西江】', 2099, '13812345678', 1, '贵州旅游精品线：黄果树、西江千户苗寨。加游非遗文化聚集地的丹寨万达小镇！全程入住豪华酒店，升级一晚超豪华酒店！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (169, '【春节 黄山+徽州 纯玩双飞四天】南屏古村过大年 寻找徽州最纯正的年味儿', 3499, '13812345678', 1, '徽州南屏村，年味浓浓，放鞭炮、贴春联、坐火桶、打食挑！古朴、纯正的南屏古村落，带你远离城市的喧嚣，让我们走进徽州人家，感受与城市不同的徽州年俗！', '/upload/img/product/small/m347cc17d669c313c534ac8a9570bde7ef.jpg', 5);
INSERT INTO `product` VALUES (170, '【贵州黄果树瀑布+西江千户苗寨+荔波大小七孔 高铁5天 纯玩】打糍粑 苗服体验 升级1晚当地超豪华酒店【金马自营】', 2099, '13812345678', 1, '游醉美贵州山色，感受苗家打糍粑、苗服体验；地质美景与少数名族风情大融合！升级一晚当地超豪华酒店', '/upload/img/product/small/m39f7d21f616436e6d795e98a43c93f8fa.jpg', 5);
INSERT INTO `product` VALUES (171, '【春节 上海迪士尼乐园+杭州+西塘+江南天地滑雪场 双飞4天 纯玩】独家策划“西塘财神贺大年”', 4199, '13812345678', 1, '游上海迪士尼乐园，邂逅江南的冰雪，享独特滑雪体验！特别安排习大大提出“青山绿水就是金山银山”的余村农家乐！', '/upload/img/product/small/m3d5d79457cd1f3c2b54a10994d7d9dc08.jpg', 5);
INSERT INTO `product` VALUES (172, '【春节 海南三亚蜈支洲岛+分界洲岛 双飞4天 海口往返】一价全包 全程0自费 夜游三亚湾 南山观音祈福【经典皇牌 至尊双岛】', 3499, '13812345678', 1, '赠送价值200元/人夜游三亚湾，乘坐游船畅游美丽的三亚湾；与激情沙滩吧，聚首狂欢，独享自在海岛风情；', '/upload/img/product/small/m31bb179bb190f2077ff0bafa3f46eb591.jpg', 5);
INSERT INTO `product` VALUES (173, '【云南香格里拉+丽江+大理+昆明+玉龙雪山+洱海 双飞6天 昆明往返 贵宾团】经典云南•登顶《玉龙之巅》', 2799, '13812345678', 1, '尽享冬色香格里拉，登顶玉龙雪山；畅享丽江、大理双古城，体验小资洱海风光；全程入住当地豪华型酒店；', '/upload/img/product/small/m3cbf47c96c3a70765eb9c90efb345f0d3.jpg', 5);
INSERT INTO `product` VALUES (174, '【云南香格里拉+丽江+大理+昆明+玉龙雪山+洱海 双飞6天 昆入丽出 超贵团】香格里拉升级1晚希尔顿 丽江1晚古城内特色客栈', 3399, '13812345678', 1, '香格里拉升级1晚国际品牌希尔顿，丽江1晚古城内特色客栈；赠品云南名食：药材土鸡宴&洱海砂锅鱼，感受舌尖上的云南味道！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (175, '【春节 华东五市+西塘+乌镇+灵山大佛祈福 纯玩双飞6天】升级1晚入住希尔顿酒店 西塘“闹”大年（派利是、全家乐、做年俗）', 3599, '13812345678', 1, '全程9个5A级景区5个4A级景区，门票价值超过800元！全程含杭州最高人气自助大餐任意吃，还有太湖三白、杭州御茶宴等，一路大饱口福；', '/upload/img/product/small/m379570c015cfce5df6f5c04f964e6e1fa.jpg', 5);
INSERT INTO `product` VALUES (176, '【春节 黄山+千岛湖+杭州+乌镇 双飞6天 纯玩】登顶黄山赏雪景 船游千岛湖 文渊狮城欢欢喜喜过大年', 3299, '13812345678', 1, '舌尖上的旅行：千岛湖春节长桌宴，摆满了各种千岛湖美食；黄山脚下山民家里品山珍野味风味餐，品尝到野猪、野兔等珍馐美馔！', '/upload/img/product/small/m378d9bef35484a824a3e0b12c77d3bb05.jpg', 5);
INSERT INTO `product` VALUES (177, '【春节 华东三市+周庄 双飞4天 纯玩】上海城隍庙新年灯会+杭州宋城新春大庙会', 3199, '13812345678', 1, '登上海环球金融中心，鸟瞰夜上海璀璨星光，尽享精彩之夜。游上海城隍庙会彩灯张结，宋城新春大庙会人声鼎沸，热闹非凡；全程入住超豪华酒店！', '/upload/img/product/small/m3d5d79457cd1f3c2b54a10994d7d9dc08.jpg', 5);
INSERT INTO `product` VALUES (178, '【春节 普陀山祈福+珞珈山 双飞4天 纯玩】西天景区参拜观世音 普陀山三大佛寺祈愿阖家安康', 2499, '13812345678', 1, '深度游览普陀山，观南海观音像，参拜三大佛寺——普济寺、慧济寺、法雨寺，祈求新年福运连绵。', '/upload/img/product/small/m313e7dd333f562f2830ba00744d4f4a77.jpg', 5);
INSERT INTO `product` VALUES (179, '【春节 上海迪士尼+乌镇+杭州 双飞4天 纯玩】逛新春城隍庙灯会 入住2晚喜来登酒店 船游西湖', 4299, '13812345678', 1, '畅玩上海迪士尼乐园，让您回味童年时光，开启新的冒险旅程。刺激您的视觉和听觉。游走外滩南京路，逛盛大城隍庙灯会，年味满满。特别安排入住一晚乌镇特色客栈。', '/upload/img/product/small/m3d5d79457cd1f3c2b54a10994d7d9dc08.jpg', 5);
INSERT INTO `product` VALUES (180, '【越南岘港+下龙湾+天堂岛+河内 双飞单高6天 高级团】直飞岘港·南北越联游·岘港入东兴出', 1699, '13812345678', 1, '海陆空联游线路；中越双导游服务，全程专业导游讲解，周全照顾贴心服务随心出游！', '/upload/img/product/small/m3a97735f3c1f4d895c2950abbf7e758fd.jpg', 5);
INSERT INTO `product` VALUES (181, '【春节 海南三亚+蜈支洲岛 双飞4天 海口入三亚出或三亚入海口出】升级1晚超豪华酒店 体验价值298元/人的沙滩项目', 3599, '13812345678', 1, '全程豪华酒店，升级一晚超豪华酒店；独家定制沙滩项目：体验价值298元/人的沙滩项目：海上自行车、沙滩排球、沙滩足球、独木舟、冲浪板、蹦床等', '/upload/img/product/small/m3fd7637f5a1a26457acf474e1b6e19504.jpg', 5);
INSERT INTO `product` VALUES (182, '【海南三亚+蜈支洲岛+天涯海角+夜游三亚湾 双飞4天 超贵团】升级2晚希尔顿欢朋酒店 升级1餐海鲜风味大餐', 2599, '13812345678', 1, '全程超豪华酒店，三亚两晚国际品牌-希尔顿欢朋酒店（若满房则安排备选酒店）；赠送升级1餐海鲜风味大餐！', '/upload/img/product/small/m3cc0ae9ebf1a693d03ec69d94a5b79a75.jpg', 5);
INSERT INTO `product` VALUES (183, '【春节 江西三清山+庐山+婺源+景德镇 单飞单高铁4天 纯玩贵宾团】全程纯玩 入住豪华酒店 品尝婺源农家宴、三清山生态宴', 1999, '13812345678', 1, '全程纯玩，入住豪华酒店，高性价比品质团；读徽商文化，解析徽派建筑—婺源，景德镇赏千年陶瓷文化；', '/upload/img/product/small/m30ecbc817325b6580154d21e2ba4945b3.jpg', 5);
INSERT INTO `product` VALUES (184, '【春节 贵州黄果树+荔波大小七孔+西江千户苗寨 高铁5天 纯玩超贵团】人手一个利是小红包+春节特别赠送新春礼包【金马自营】', 2899, '13812345678', 1, '新春“豪”玩贵州、四大美食享不停；庙会、灯谜以及各地民族传统活动庆祝，让你感受浓郁的春节氛围！“亚洲第一瀑布”、世界双自然遗产地—荔波大小七孔、“中国第一苗寨”全景贵州必玩景点一网打尽！', '/upload/img/product/small/m3f048ef0b9076f47c670c63018d70e6bf.jpg', 5);
INSERT INTO `product` VALUES (185, '【春节 北京滑雪+秦皇岛 双飞7天 秦皇岛往返 纯玩3+5钻】夜游司马台长城 海探老龙头 北戴河 北京庙会 雍和宫祈福【京彩联游】', 3399, '13812345678', 1, '一次畅游北京、秦皇岛、北戴河；带你360度游长城：海探老龙头长城、夜游司马台长城、宏观八达岭长城；古北水镇升级1晚入住五星古北水镇大酒店，凭房卡可无限次进出古北水镇水乡景区！', '/upload/img/product/small/m3ae1f3a49daf6ff79871f6211d49e9c26.jpg', 5);
INSERT INTO `product` VALUES (186, '【春节 越南下龙湾+河内+巡洲岛 高铁5天】0自费0购物 全程叹超豪华酒店【+1元换购680元越南天堂岛+惊讶洞】', 2999, '13812345678', 1, '纯玩0购物0自费，全程入住超豪华度假酒店+河内一晚国际五星酒店，尊享越南法式度假！', '/upload/img/product/small/m341f0cf591f059a084ec9bdc3eff7a938.jpg', 5);
INSERT INTO `product` VALUES (187, '【春节 山东+大连滑雪 纯玩双飞5天】浪漫青岛 蓬莱仙境 荣成烟墩角 旅顺军港【美食之旅 品质游】', 3699, '13812345678', 1, '全程入住2晚豪华酒店，特别升级1晚超豪华酒店；探索大连、醉美青岛、至美天鹅湖、仙境游历，不走回头路！赠送滑雪2小时！自由堆雪人、打雪仗！', '/upload/img/product/small/m3b5dbd9d954571142d7dd25cccb22b86f.jpg', 5);
INSERT INTO `product` VALUES (188, '【江西井冈山+笔架山 双飞4天 贵宾团】 唱响红歌 穿红军服走红军路【革命情怀 重走红军路】', 1299, '13812345678', 1, '穿一次红军服，走一段红军路，当一回英雄红军；广州直飞井冈山，入住三晚豪华酒店；乘坐十公里长的亚洲第一索道——笔架山索道；', '/upload/img/product/small/m31ab5068b200aa3a61ac91e0729e65e53.jpg', 5);
INSERT INTO `product` VALUES (189, '【春节 亲子游 越南河内+吉婆岛+下龙太阳世界乐园 高铁5天 纯玩超贵团】0购物0自费 美食：海岛风味宴 越式炸鸡火锅宴 DIY越南春卷', 2899, '13812345678', 1, '亲子活动安排下龙乐园，乘坐世界吉尼斯纪录跨海缆车+下龙之眼摩天轮；体验DIY越式春卷体验，又好吃又好玩！', '/upload/img/product/small/m3b4d19539864a93b01c7803edb6b916a0.jpg', 5);
INSERT INTO `product` VALUES (190, '【趣冬游 12月 北京滑雪+天津 双飞5天 天津往返 纯玩3+5钻】北京升级1晚入住喜来登酒店 升级体验乘坐单程京津城际高速列车', 2399, '13812345678', 1, '北京升级1晚入住喜来登酒店！升级体验乘坐单程京津城际高速列车！', '/upload/img/product/small/m3d97f3c41f82329b7a45e67e9de2c96ca.jpg', 5);
INSERT INTO `product` VALUES (191, '【2月 北京滑雪+秦皇岛 双飞7天 秦皇岛往返 纯玩3+5钻】夜游司马台长城 海探老龙头 宏观八达岭 古北水镇 山海关 北戴河【京彩联游】', 2599, '13812345678', 1, '古北水镇升级1晚入住五星古北水镇大酒店！畅游北京22大知名经典一个不少！', '/upload/img/product/small/m3ca81e31ce4a93bb9350d968b55a9129e.jpg', 5);
INSERT INTO `product` VALUES (192, '【东北哈尔滨+沈阳+长白山+魔界+雪乡+亚布力 双飞7天 纯玩】升级1晚长白山下超豪华温泉酒店【全景大东北】', 4799, '13812345678', 1, '长白山，赏天池冬韵，泡正宗长白山硫磺矿物温泉！特别体验高寒动车;全程入住4晚豪华酒店，特别升级1晚长白山下超豪华温泉酒店，雪乡入住特色暖炕2-3人间！', '/upload/img/product/small/m36227cbbdc79cea94ab43c7db54e43403.jpg', 5);
INSERT INTO `product` VALUES (193, '【1-2月 北京滑雪+秦皇岛 双飞6天 秦皇岛往返 纯玩3钻】山海关 北戴河 故宫 雪世界 颐和园 八达岭长城 什刹海【京彩联游】', 2399, '13812345678', 1, '一次畅游北京、秦皇岛、北戴河三大风光城市；加游华北户外至大的滑雪场-雪世界滑雪，体验北方冰雪世界，一尽滑雪乐趣！', '/upload/img/product/small/m3774d9019ce8f65e7823859891353d31e.jpg', 5);
INSERT INTO `product` VALUES (194, '【春节 江西井冈山+笔架山 双飞4天 纯玩贵宾团】南航直飞 制作江西特色米馃 学唱红歌 赠精美小礼品', 1699, '13812345678', 1, '广州直飞井冈山；纯玩无购物，全程豪华酒店；乘坐亚洲第一索道，观笔架山雾凇美景；观中国财山五指峰，享新年财运滚滚来；', '/upload/img/product/small/m3a579364858089195e32fdded77adbba9.jpg', 5);
INSERT INTO `product` VALUES (195, '【春节 厦门+鼓浪屿 高铁3天 高级团】南普陀祈福 集美学村 曾厝垵 品“滋补佛跳墙”', 1799, '13812345678', 1, '参团每人赠送鼓浪屿盖章本一本，收集印章最多的游客还可获赠纯装进口红酒一瓶！', '/upload/img/product/small/m31b7e6805e116982076fa15ece3c515a1.jpg', 5);
INSERT INTO `product` VALUES (196, '【云南丽江+大理+昆明+玉龙雪山+洱海 双飞6天 昆明往返 纯玩贵宾团】一价全包无自费 【纯享云南】', 3199, '13812345678', 1, '全程安排当地豪华型酒店；全程纯玩、一价全包；包含玉龙雪山等经典景点门票索道价值约450元，行程丰富，绝不走马观花！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (197, '【特价 东北哈尔滨+吉林+沈阳+长白山+雪乡+亚布力 双飞6天 升级版】亚布力激情滑雪 吉林雾凇长廊', 2999, '13812345678', 1, '一次走遍东北三省，不走回头路！邂逅中国四大自然奇观之一吉林雾凇，犹入“花非花雾非雾”的绝奇仙境！', '/upload/img/product/small/m306423ad0c68230c9d4a441da788772e5.jpg', 5);
INSERT INTO `product` VALUES (198, '【春节 直飞北京滑雪 双飞6天 纯玩4钻 珠海往返】新春庙会 雍和宫祈福 雪世界 八达岭长城 什刹海', 3599, '13812345678', 1, '升级定制-特色餐饮：全聚德烤鸭、东来顺涮羊肉、1号蒸菜、老北京炸酱面！入住豪华酒店，尊享中西式自助早餐！', '/upload/img/product/small/m3b2c6e8fa0e92882b9362c68dfa504324.jpg', 5);
INSERT INTO `product` VALUES (199, '【江西三清山+婺源+景德镇 高铁4天 超贵团】篁岭晒秋 皇窑 南昌江西博物馆 赠3斤当季赣南脐橙【四人橙行●三婺】', 2149, '13812345678', 1, '全程纯玩0购物！梦里老家婺源欣赏水墨乡村美景，在江南仙山三清山观奇松怪石；婺源入住豪华酒店；三清山脚升级一晚超豪华酒店；当地赠送每人3斤装正宗赣南脐橙。', '/upload/img/product/small/m3af7062cd24cb520c8eae99265a9dee5e.jpg', 5);
INSERT INTO `product` VALUES (200, '【云南泸沽湖+西昌泸山+邛海+成都 双飞6天 贵宾团】摩梭风情篝火晚会【亲爱的客栈 醉美女儿国】', 2199, '13812345678', 1, '全程0自费；广州直飞成都；探秘全球唯一“男不婚、女不嫁的”摩梭文化，寻梦女儿国，四川段+云南段泸沽湖360度全景环湖游！', '/upload/img/product/small/m38c2b01f1fd85866263ebcd4cb76e29dd.jpg', 5);
INSERT INTO `product` VALUES (201, '【张家界天门山+玻璃栈道+大峡谷+玻璃桥+凤凰古城 高铁4天 纯玩品质5+4钻】赏雾凇 溪布街 侗族合拢宴 升级超豪酒店【冰雪天门山·直击玻璃桥】', 1799, '13812345678', 1, '超贵团升级1晚张家界超豪（16年开业-蓝湾博格国际酒店）；冬雪是张家界冬季风光三绝之一，近观雾凇奇观，远观奇峰雪景；挑战号称世界最长、最高的全透明【玻璃桥】！', '/upload/img/product/small/m36e65da7aaabb0e8e29ddd56f9f79cbe8.jpg', 5);
INSERT INTO `product` VALUES (202, '【一价全包 张家界大峡谷+玻璃桥+三江侗乡+凤凰古城 高铁4天 无自费4钻】矮寨大桥 古丈苗寨 篝火晚会 品湘味小龙虾', 999, '13812345678', 1, '全程零自费！广西+湖南联游，360°全景玻璃桥【大峡谷玻璃桥】；体验世界第一悬索桥【矮寨大桥】；', '/upload/img/product/small/m3d07a3e37145d623e59f4e4e33544ce2f.jpg', 5);
INSERT INTO `product` VALUES (203, '【安徽黄山+九华山双飞6天 纯玩】 享黄山丰大温泉 赏舞台秀《徽韵》【寻冬季&两山联游】', 2699, '13812345678', 1, '游黄山送九华山，来黄山看《徽剧》，全程门票价值超700元！全程高级酒店，其中一晚屯溪市区升级超豪华酒店，一晚升级入住超豪华温泉度假酒店；', '/upload/img/product/small/m347cc17d669c313c534ac8a9570bde7ef.jpg', 5);
INSERT INTO `product` VALUES (204, '【安徽黄山+齐云山+宏村双飞4天 纯玩】直飞黄山 升级1晚精品文化客栈', 2399, '13812345678', 1, '广州直飞黄山机场，黄山山顶足足游览两整天，游黄山不再匆匆；名山+徽派古村落，自然与人文的绝佳搭配，体会“一生痴绝处，无梦到徽州”；', '/upload/img/product/small/m347cc17d669c313c534ac8a9570bde7ef.jpg', 5);
INSERT INTO `product` VALUES (205, '【东北长白山+雪乡+亚布力+吉林+哈尔滨+长春双飞6天 纯玩】亚布力激情滑雪 吉林雾凇【乐享大东北】', 5399, '13812345678', 1, '中国最大的国际级滑雪场——亚布力滑雪场，赠送初级滑雪两小时；观中国四大奇观之一——吉林雾凇！全程入住3晚豪华酒店，升级1晚长白山下超豪华温泉酒店，雪乡入住特色暖炕2-3人间！', '/upload/img/product/small/m384ee9d8432a540b153a4afd300794e76.jpg', 5);
INSERT INTO `product` VALUES (206, '【宁夏银川+贺兰山国家森林公园滑雪场双飞4天】体验滑雪项目 含雪具 游玩4小时以上【冰雪银川 动感之旅】', 2699, '13812345678', 1, '畅游宁夏经典精华景点，亲临《爸爸去哪儿》拍摄地-【沙坡头】，穿越中国第四大沙漠腾格里；了解伊斯兰建筑、礼俗、饮食文化；品尝宁夏特色餐：蒿子面、烩小吃、黄河鲤鱼、蘑菇炖土鸡', '/upload/img/product/small/m3f9f8d93ca103baee7ca3186c27f97717.jpg', 5);
INSERT INTO `product` VALUES (207, '【西宁+青海湖 双飞4天】东关清真寺 互助彩虹部落 彩虹冰雪节【冬游青海】', 1699, '13812345678', 1, '打个飞的到西北寻味美食。来杯高原青稞美酒，品尝滋补羊蝎子火锅、西北手抓羊肉；狗浇尿油饼；西北酿皮；青海酸奶；尕面片；到彩虹冰雪节滑雪、滑冰！', '/upload/img/product/small/m34c5ad879aa37ed3b067f2adc0fabec15.jpg', 5);
INSERT INTO `product` VALUES (208, '【厦门+鼓浪屿+武夷山+大红袍景区+福州高铁5天 贵宾团】入住武夷山豪华酒店 赠送大红袍岩茶【福建·厦武福联游】', 2199, '13812345678', 1, '畅游世界自然与文化双重遗产【武夷山】，玩转小资厦门【鼓浪屿】【曾厝垵】，游览福州【西湖公园】【三坊七巷】！', '/upload/img/product/small/m31b7e6805e116982076fa15ece3c515a1.jpg', 5);
INSERT INTO `product` VALUES (209, '【爆款 直飞张家界+天门山+大峡谷+凤凰古城+玻璃栈道+玻璃桥高双飞5天 纯玩顶贵团】尊享全程超豪华酒店+特色餐', 2999, '13812345678', 1, '直飞张家界只要1.5小时、大峡谷玻璃桥VS天门山国家森林公园玻璃栈道，全程0购物，全程入住超豪华酒店/客栈，20人精品小团，更舒适更温馨。', '/upload/img/product/small/m3c9c87a1175252d187eb8c4bc228c317d.jpg', 5);
INSERT INTO `product` VALUES (210, '【长沙+张家界+袁家界+大峡谷+玻璃桥+凤凰古城高铁4天】品湘西地道美食：侗族—才家合拢宴 特色蘑菇宴 土家风味宴【VIP纯玩·精品张凤】', 1849, '13812345678', 1, '升级1晚超豪酒店-蓝湾博格国际酒店，享受五星自助早餐；赠游墨戎苗寨，体验湘西风情苗家文化风情，享受湘西苗族礼仪', '/upload/img/product/small/m30aae1ff572409c9082aff495dcaaa54a.jpg', 5);
INSERT INTO `product` VALUES (211, '【海南三亚+蜈支洲岛+西岛+博鳌双飞4天 超贵团】天涯海角 椰田古寨 亚龙湾 玉带滩【直飞博鳌 皇牌双岛】', 1799, '13812345678', 1, '南航广州直飞往返博鳌，全程升级超豪华酒店！', '/upload/img/product/small/m3dc9f22d10070d66a939555d3e63aaef2.jpg', 5);
INSERT INTO `product` VALUES (212, '【江西庐山+三清山+婺源+景德镇+南昌 火车5天 超贵团】三清山脚升级1晚超豪华酒店 品尝婺源农家宴、庐山三石宴【江山本色·火车三庐】', 1799, '13812345678', 1, '南昌、庐山、婺源入住豪华酒店，三清山脚升级一晚超豪华酒店；细化接待安排，导游服务贴心细致，保证游览时间，省心省力；', '/upload/img/product/small/m349831f96902ff1e8382bcedeb4929d5d.jpg', 5);
INSERT INTO `product` VALUES (213, '【江山本色．品享三庐】江西庐山 福地三清山 徽派婺源 景德镇 南昌高铁五天 超贵团', 2499, '13812345678', 1, '南昌、庐山、婺源入住豪华酒店，三清山脚升级一晚超豪华酒店；', '/upload/img/product/small/m37bd8032ed701e2b91f0d094c2d4c564e.jpg', 5);
INSERT INTO `product` VALUES (214, '【千山婺景●徽浙赣联游】黄山 长江后花园千岛湖 婺源篁岭 屯溪宋朝老街 景德镇双飞五天 惠贵团', 2099, '13812345678', 1, '屯溪两晚升级豪华酒店；特别安排一晚入住黄山山上，更充沛时间欣赏品味黃山之奇、黃山之美，观看黄山美丽日出！', '/upload/img/product/small/m36e4a93743a0d22a76d89c6b99efa23a1.jpg', 5);
INSERT INTO `product` VALUES (215, '【西宁青海湖+嘉峪关+敦煌莫高窟+鸣沙山月牙泉+张掖双飞6天】西宁至嘉峪关乘坐动车 西宁升级入住超豪华酒店【青海敦煌联游】', 3299, '13812345678', 1, '青海湖+敦煌+嘉峪关最具代表西北景点强强联游！西宁至嘉峪关乘坐动车，动车穿越祁连山山脉，体验西北高铁之旅！', '/upload/img/product/small/m37f0841e97b579b77683abc4888e8f5e2.jpg', 5);
INSERT INTO `product` VALUES (216, '【四川稻城亚丁+新都桥+海子山+理塘+康定+泸定桥+成都双卧9天】春季稻城亚丁预售特惠【春摄稻亚 高级团】', 2399, '13812345678', 1, '稻城亚丁被评为“中国最美的十大名山之一”、“中国最美的地方”等。保存有我国目前最完整、最原始的高山自然生态系统。', '/upload/img/product/small/m3a68de1243ad26c7e25dc5d43a0f1d5fa.jpg', 5);
INSERT INTO `product` VALUES (217, '【特价 东北长白山+亚布力+雪乡+哈尔滨+沈阳双飞6天】行摄魔界 亚布力激情滑雪【经典大东北】', 4999, '13812345678', 1, '全景体验 品味关东：沈阳吊炉烧饼、长白山野味火锅、雪乡农家山珍宴！优质住宿：特别升级一晚长白山下超豪华温泉酒店！', '/upload/img/product/small/m3ad15a67a7da74d3690cd1bcc6582d529.jpg', 5);
INSERT INTO `product` VALUES (218, '【特价 东北长白山+雪乡+亚布力+吉林+哈尔滨+沈阳双飞7天】亚布力激情滑雪 吉林雾凇长廊 哈进沈出不走回头路【升级版】', 3099, '13812345678', 1, '一次走遍东北三省，不走回头路！穿过茫茫林海雪原，赴长白山脉赏长白山天池雪域胜景！', '/upload/img/product/small/m384ee9d8432a540b153a4afd300794e76.jpg', 5);
INSERT INTO `product` VALUES (219, '【西藏拉萨+布达拉宫+林芝+鲁朗林海三飞6天】拉萨升级入住豪华酒店 林芝升级一餐享用石锅鸡【约惠鲁朗】', 2999, '13812345678', 1, '挂经幡，感受藏式祈福，藏族村寨家访体验异域民风民俗；朝圣财神殿扎基寺，赏鲁朗林海雪峰牧场！', '/upload/img/product/small/m3c8e0b59aa2be71e6057decbae24cb1ce.jpg', 5);
INSERT INTO `product` VALUES (220, '【甘肃+青海 双飞单动单卧6天】敦煌莫高窟 鸣沙山月牙泉 嘉峪关城楼 张掖丹霞地质公园 西宁塔尔寺 青海湖', 2999, '13812345678', 1, '沙漠奇观—鸣沙山；天下沙漠第一泉，寻访敦煌“东方艺术宝地”莫高窟、入住豪华酒店', '/upload/img/product/small/m3f25da4da92afb6220a8ca5dd79ba7103.jpg', 5);
INSERT INTO `product` VALUES (221, '【皇牌全景 张家界高铁5天纯玩】袁家界 金鞭溪 天门山玻璃栈道 大峡谷玻璃桥 凤凰古城 < 赠百龙天梯双程 >', 2299, '13812345678', 1, '零自费·零购物，尊享百年餐饮老字号火宫殿美食（400元/桌），全程品质超豪华标准酒店或豪华特色客栈，大峡谷玻璃桥+玻璃栈道。', '/upload/img/product/small/m32c962363cb678508de0b99aaab1de198.jpg', 5);
INSERT INTO `product` VALUES (222, '【纯玩 东北长白山+雪乡+亚布力+镜泊湖+吉林+沈阳+哈尔滨双飞6天】天池 吉林雾凇 亚布力激情滑雪【全景大东北（雾凇版）】', 4299, '13812345678', 1, '登中华十大名山长白山，中国第一雪乡双峰林场，亚布力滑雪场滑雪，特别安排游览雾凇岛，升级1晚长白山下超豪华温泉酒店！', '/upload/img/product/small/m32147bf064e03b7313fe250b262d902c1.jpg', 5);
INSERT INTO `product` VALUES (223, '【张家界+大峡谷+玻璃桥+凤凰古城 高铁4天 纯玩5钻】零自费 零购物 一价全含 金牌优秀导游贴心一站式服务 VIP旅游专车专用 绝不套团', 1899, '13812345678', 1, '挑战大峡谷玻璃桥，尊享百年餐饮老字号火宫殿美食（400元/桌） ，百龙天梯·体验66秒直达山顶，全程品质超豪华标准酒！', '/upload/img/product/small/m3cb94ab4f0dda8cd5ce1769e138a07971.jpg', 5);
INSERT INTO `product` VALUES (224, '【张家界大峡谷+玻璃桥+凤凰古城 高铁4天 纯玩5+4钻】升级1晚超豪华大成山水国际酒店 全程零购物 零自费 门票全包', 1399, '13812345678', 1, '全程零购物，零自费，入住一晚大成山水国际酒店，品尝火宫殿特色宴，大型民俗篝火欢迎晚会！', '/upload/img/product/small/m34d11a1ccddf9b6b538944f868ebfc4af.jpg', 5);
INSERT INTO `product` VALUES (225, '【锦绣潇湘·春暖湖南】南岳衡山祈福 韶山毛主席故居 刘少奇花明楼 橘子洲头 岳麓山 爱晚亭 高铁三天 【纯玩 贵宾团】', 1499, '13812345678', 1, '全程不购物、保证广东省内成团，绝不全国大散拼！', '/upload/img/product/small/m3d5684b0a84605a17b418d547ccb30431.jpg', 5);
INSERT INTO `product` VALUES (226, '【包船·黄金邮轮：重庆至宜昌 高铁5天 超贵团】长江三峡 三峡大坝 入住 小三峡 丰都鬼城 重庆磁器口 解放碑【阳台标双房】', 3399, '13812345678', 1, '直达双动，不走回头路，直达目的地；游览仙境般的长江三峡支流峡谷----大宁河小三峡；享用游船上精美中西自助美食！', '/upload/img/product/small/m3caa309cf45feb26ae050469ddaca1bac.jpg', 5);
INSERT INTO `product` VALUES (227, '【深圳出发 买1送1·厦门 高铁3天 升级一晚超豪华酒店】鼓浪屿 曾厝垵 环岛路 闽南老院子 观5D大咖秀 品太极养生素食宴', 1499, '13812345678', 1, '买一送一！深圳北往返，特别安排一晚厦门特色客栈，充分时间体验小资情调，升级厦门一晚超豪华酒店；', '/upload/img/product/small/m319ebf7585e9734b5ca16924c8fb9ac0f.jpg', 5);
INSERT INTO `product` VALUES (228, '【重庆+武隆+仙女山 双飞5天 遵义往返】武隆升级入住超豪华酒店', 2499, '13812345678', 1, '', '/upload/img/product/small/m37e0bed5f73a83d4684472698191a6d1e.jpg', 5);
INSERT INTO `product` VALUES (229, '【私家小团 云南泸沽湖+丽江 双飞5天 丽江往返 纯玩贵宾团】丽江入住当地精选超豪华客栈+特别安排泸沽湖两晚一线湖景诗莉莉系列独家客栈', 4899, '13812345678', 1, '直飞丽江往返！丽江入住当地精选超豪华客栈+特别安排泸沽湖两晚一线湖景诗莉莉系列独家客栈！品尝纳西特色马帮菜！', '/upload/img/product/small/m358bdda3897fcf0948c73908201b33fcd.jpg', 5);
INSERT INTO `product` VALUES (230, '【云南腾冲+热海热谷温泉+瑞丽 双飞6天 保山往返 贵宾团】全程入住当地精选豪华酒店', 3599, '13812345678', 1, '特别赠送：价值268元/人热海风景区-热谷温泉泡澡，真正的硫磺温泉水；全程入住当地精选豪华酒店！', '/upload/img/product/small/m39060b0883d8a358677b8c222abcc7bae.jpg', 5);
INSERT INTO `product` VALUES (231, '【湖北恩施大峡谷+长江三峡+重庆酉阳桃花源+湖南凤凰古城+广西三江 高铁5天 纯玩团】玩转湘鄂渝桂黔精华景点', 2299, '13812345678', 1, '经典张凤+重庆酉阳桃花源+湖北恩施大峡谷+广西三江风雨桥+湘黔渝交界处，一次出行，玩转五省精华景点，体验各个民族多彩风情！', '/upload/img/product/small/m3c0b7f553102b0dd7c23bad24045381ec.jpg', 5);
INSERT INTO `product` VALUES (232, '【甘肃敦煌雷音寺祈福+莫高窟+兰州黄河风情 双飞双卧6天】入住豪华酒店【西域豪情 遇见敦煌】', 2499, '13812345678', 1, '寻访敦煌“东方艺术宝地”莫高窟，世界上现存规模最大，内容最丰富的的佛教艺术圣地；登临明万里长城西止点、戈壁幻海—嘉峪关；尽览黄河风情！', '/upload/img/product/small/m39ee453f46eebea01eef0fbe95aa9ddd5.jpg', 5);
INSERT INTO `product` VALUES (233, '【1月 新疆乌鲁木齐+喀纳斯+禾木+福海冬捕牧鱼纳福 双飞5天 纯玩贵宾团】入住禾木特色酒店 喀纳斯段乘越野 独家4人成团', 4999, '13812345678', 1, '独家4人成团！阿勒泰段全程越野，喀纳斯上的去下的来！禾木景区特色民宿，有暖气！仰望冬日星空，感受一份没有烦恼的静谧！', '/upload/img/product/small/m3b08e4d7f21ac03d7c759446017cc33c4.jpg', 5);
INSERT INTO `product` VALUES (234, '【春节 西安+华山+郑州+龙门石窟+嵩山少林寺+开封 双飞5天 纯玩贵宾团】大慈恩寺祈福 翰园新春大庙会 品喜福宴【中原全景.阖家欢】', 4599, '13812345678', 1, '两省精华景点，一次旅行尽览“西京长安、东京洛阳、商城郑州、宋城开封”！全程升级四晚豪华酒店！', '/upload/img/product/small/m3145a0d023af6818fea166ee33880cd87.jpg', 5);
INSERT INTO `product` VALUES (235, '【春节 西安+华山+秦岭滑雪+兵马俑博物馆 双飞4天 纯玩顶贵团】全程5星酒店 大唐芙蓉园灯会+大慈恩寺祈福+汉城湖新春庙会', 4599, '13812345678', 1, '西安升级2晚指定酒店高新希尔顿酒店或同级、华山入住当地最好五星酒店——华山国际酒店！', '/upload/img/product/small/m337209b6487f8ee9e2c11e470a89e13a8.jpg', 5);
INSERT INTO `product` VALUES (236, '【春节 西安+延安+黄河壶口冰瀑+兵马俑+华山 双飞5天】汉城湖新春庙会【陕西全景】', 2999, '13812345678', 1, '观摩“世界第八大奇迹”兵马俑；问鼎五岳之巅华山；祭拜华夏儿女共同的祖先黄帝陵；观赏混沌奇迹壶口瀑布；到访延安，追忆革命先驱精神！体验北方包饺子过大年，品尝西安春节特色餐—喜福宴！', '/upload/img/product/small/m337209b6487f8ee9e2c11e470a89e13a8.jpg', 5);
INSERT INTO `product` VALUES (237, '【春节 陕西西安+黄河壶口瀑布+延安+汉城湖新春庙会 双飞4天 贵宾团】升级3晚豪华酒店【红色陕北】', 3899, '13812345678', 1, '体验北方包饺子过大年，品尝西安春节特色餐—喜福宴！', '/upload/img/product/small/m311691a217249481ffde6287d925c647b.jpg', 5);
INSERT INTO `product` VALUES (238, '【春节 内蒙古呼和浩特+大召寺新年祈福+希拉穆仁草原+响沙湾 双飞4天 顶超团】升级2晚超豪华酒店 特别安排入住莲花酒店滑雪度假', 5599, '13812345678', 1, '“蒙享福”主题活动：包饺子、做奶食、行年礼、印年画、晒幸福、赢大礼！贺年福：亲临内蒙古佛教圣地大召寺，燃灯祈福、全家平安，幸福安康，聆听佛韵精髓！', '/upload/img/product/small/m30a86bc0ac9acd1233e03889c56c8879c.jpg', 5);
INSERT INTO `product` VALUES (239, '【春节 内蒙古呼和浩特滑雪+大召寺新年祈福+希拉穆仁草原+响沙湾 双飞4天 超贵团】升级2晚超豪华酒店', 3399, '13812345678', 1, '两晚呼和浩特国际五星酒店；亲临内蒙古佛教圣地大召寺，燃灯祈福；欣赏冬季雪景，畅玩滑雪，浩瀚大漠亲近大自然，草原牧户载歌载舞，乐在其中。', '/upload/img/product/small/m3053bfcfa01270dd328400557a4206412.jpg', 5);
INSERT INTO `product` VALUES (240, '【春节 山西+内蒙古 双飞5天 超贵团】升级1晚超豪华酒店 呼和浩特滑雪 大昭寺新年祈福', 4499, '13812345678', 1, '2018新春山西＋内蒙游，大昭寺新年祈福、感受响沙湾“大漠孤烟直”的雄浑与壮美、亲临牧户家庭；赏雪景、玩滑雪、品尝地道的内蒙古美食、手把肉、正宗涮羊肉，体会独特浓郁的蒙古民族文化风情！', '/upload/img/product/small/m3a70558ab3e3d4e57ea005eb317cd18fd.jpg', 5);
INSERT INTO `product` VALUES (241, '【新疆乌鲁木齐+天山天池+天山滑雪+库姆塔格沙漠 双飞6天】南航直飞·景点全包0购物·全程超豪华酒店【皇牌新疆.五星亲子游】', 4399, '13812345678', 1, '全程入住精选豪华五星国际酒店；走进沙漠绿洲吐鲁番、赏坎儿井、观火焰山、葡萄沟长廊、观2016年全国冬运会主场馆-天池国际滑雪场、亲身体验国内最好的滑雪场地！', '/upload/img/product/small/m3b73ad0712746ef03019e34fb9757401d.jpg', 5);
INSERT INTO `product` VALUES (242, '【春节 宁夏银川+贺兰山苏峪口滑雪场 双飞4天】升级一晚温泉酒店 送酒店内温泉体验【神奇宁夏 玩转银川】', 2999, '13812345678', 1, '玩冰雪、探秘西夏文化、体验回乡风情、品美酒、尝暧心火锅、住温泉酒店泡温泉、晒暖暖的阳光，享受别样的“新春之旅”！', '/upload/img/product/small/m34548a35fb0e211ca8d666eb6dd6e433d.jpg', 5);
INSERT INTO `product` VALUES (243, '【春节 甘肃敦煌+莫高窟+鸣沙山+嘉峪关+张掖+玉门关+兰州 单高铁单卧6天】西北最具代表景点全囊括【西域豪情 重走河西走廊】', 4399, '13812345678', 1, '参与敦煌市文化馆新春猜灯谜等比赛和游艺活动！西北最具代表景点全囊括！赠送西北特色小礼品！', '/upload/img/product/small/m34b223e87d54d5d5cf8bb4355a9a58d93.jpg', 5);
INSERT INTO `product` VALUES (244, '【山西太原滑雪+五台山+壶口瀑布+平遥古城 双飞5天 纯玩贵宾团】黄河 常家庄园 荷花园温泉【冬游经典：当滑雪.瀑布遇上温泉】', 2399, '13812345678', 1, '山西一次旅行南北景点一网打尽，全程入住豪华酒店，襄汾荷花园养生温泉任泡，尝老陈醋养生、佛国素斋、山西面食、平遥特色小吃。', '/upload/img/product/small/m319eedc28a703d18423fef5cdac5c67e8.jpg', 5);
INSERT INTO `product` VALUES (245, '【山西太原滑雪+五台山+平遥古城+大同 双飞5天 贵宾团】悬空寺 常家庄园【畅游山西.冬季滑雪】', 1999, '13812345678', 1, '一次看遍山西著名景点，玩转山西。全程入住豪华酒店，体验一晚平遥民俗客栈', '/upload/img/product/small/m376e20eb3585db8de742aa741f0309afe.jpg', 5);
INSERT INTO `product` VALUES (246, '【春节 佛山出发 湖南张家界大峡谷+凤凰古城+重庆酉阳桃花源+湖北恩施大峡谷 高铁5天 贵宾团】升级特色风味餐【湘鄂渝三省联游】', 3399, '13812345678', 1, '升级特色餐：恩施土家摔碗酒、苗家风味宴、侗族才家合拢宴！', '/upload/img/product/small/m3880c0d905f2b5a0211079a7d9f048314.jpg', 5);
INSERT INTO `product` VALUES (247, '【春节 华东五市+上海迪士尼喜迎奇妙年 双飞6天】牛首山新年祈福 第一水乡周庄 特色年俗闹新春 逛三大庙会 【赏2大夜景迪士尼烟花秀+拈花禅意灯光秀 金马自营】', 3699, '13812345678', 1, '上海迪士尼喜迎奇妙年；一晚超豪华酒店、四晚自助早餐商务酒店，品质的保障！', '/upload/img/product/small/m32e710553e4cd4ffc711ac8123ba1bf3c.png', 5);
INSERT INTO `product` VALUES (248, '【增从专线 越南下龙湾+河内+芒街 双飞4天 高级团】南航广州直飞南宁 升级一餐越式炸鸡火锅宴', 699, '13812345678', 1, '南航正点航班往返1小时直达南宁！升级一餐越式炸鸡火锅宴！双导游服务，免收服务小费，周全照顾贴心服务随心出游！', '/upload/img/product/small/m341f0cf591f059a084ec9bdc3eff7a938.jpg', 5);
INSERT INTO `product` VALUES (249, '【佛山出发 2-3月直飞北京 双飞6天 特惠3钻】北京故宫 八达岭 颐和园 天坛 奥运场馆 高级团【珠海往返】', 1299, '13812345678', 1, '一次畅游北京22大知名景点！', '/upload/img/product/small/m34dd570b4f897d6a3196e66ad00b37f77.jpg', 5);
INSERT INTO `product` VALUES (250, '【佛山出发 春节 云南罗平油菜花+贵州+广西 高铁5天·0购物0自费】 雨布鲁天坑 马岭河大峡谷 布依族篝火晚会【超贵团云贵桂联游】', 2799, '13812345678', 1, '独家揭秘《爸爸去哪儿5》最火拍摄地，玩转婺源金色花海，探访远离喧嚣的古寨人家！ 享用当地三大特色宴：贵州兴义特色宴、酸汤鱼宴、广西百色农家宴！贵州全程升级3晚超豪华酒店！', '/upload/img/product/small/m34f047ea4d1d1e0b832aa8a5dd55716c4.jpg', 5);
INSERT INTO `product` VALUES (251, '【佛山出发 春节 张家界天门山+玻璃栈道+大峡谷玻璃桥+凤凰古城 高铁4天·叹超豪华酒店】+1元换购魅力湘西千人大型民俗歌舞晚会', 2899, '13812345678', 1, '全程零购物•零自费！欢欢喜喜过大年：看追爱《魅力湘西》千人大型民俗歌舞晚会；听侗族大戏，专场大湘西民俗风情合拢宴；感受打糍粑、祈福上红；猜灯迷、三棒鼓、茅古斯等民间传统文化活动。', '/upload/img/product/small/m3465e6dbdbd77e48ef66862436c36d0a3.jpg', 5);
INSERT INTO `product` VALUES (252, '【春节 华东六市+双水乡乌镇、南浔古镇纯玩双飞6天】扬州瘦西湖、灵山祈福、苏州光福赏梅、西湖游船', 3699, '13812345678', 1, '合家欢经典江南景点：灵山大佛、瘦西湖、乌镇西栅、南浔古镇、中山陵、光福赏梅、船游西湖；新春之旅享4晚豪华酒店+升级一晚超豪华酒店！', '/upload/img/product/small/m33f0d22d87eee526e0c25384f78654b05.jpg', 5);
INSERT INTO `product` VALUES (253, '【春节 普陀山祈福+杭州+西塘+上海 双飞4天 杭州入上海出】纯玩0购物', 3599, '13812345678', 1, '纯玩0购物，祈福时光充裕不匆忙！', '/upload/img/product/small/m313e7dd333f562f2830ba00744d4f4a77.jpg', 5);
INSERT INTO `product` VALUES (254, '【佛山专线 春节 直飞北京 滑雪双飞5天 纯玩4钻】新春庙会 雪世界 颐和园 故宫 八达岭长城 天坛 奥运场馆 什刹海', 4799, '13812345678', 1, '游玩北京一年一度的大庆典——新春庙会；登故宫新区：登上【雁翅楼】、摆驾【寿康宫】、探秘【慈宁宫花园】！', '/upload/img/product/small/m3a91779e64adcd291562b59dd225639b7.jpg', 5);
INSERT INTO `product` VALUES (255, '【佛山专线 春节 贵州黄果树瀑布+荔波大小七孔+西江千户苗寨 高铁5天 纯玩】体验民俗活动打糍粑 穿苗服 青岩古镇逛庙会【+1元全程豪叹超豪华酒店】', 2999, '13812345678', 1, '贵州“亚洲第一瀑布”黄果树、世界双自然遗产地——荔波大/小七孔、“中国第一苗寨”千户苗寨必玩景点一网打尽！庙会、灯谜以及各地民族传统活动庆祝，让你感受浓郁的春节氛围！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (256, '【佛山专线 内蒙古+呼和浩特滑雪 双飞4天】享亲子活动包饺子、做奶食、行年礼+大召寺新年燃灯祈福【两晚呼和浩特超豪华酒店】', 3399, '13812345678', 1, '独家举办 “蒙幸福”亲子主题活动：包饺子、做奶食、行年礼、晒幸福、赢大礼！佛教圣地大昭寺祈福、赏冬季草原美景、印象响沙湾畅游大漠、内蒙新春体验之旅；豪享两晚呼和浩特超豪华酒店！', '/upload/img/product/small/m350346b5defdf13cacd729af60a4c3560.jpg', 5);
INSERT INTO `product` VALUES (257, '【佛山专线 内蒙古+响沙湾+希拉穆仁草 双飞4天】大召寺新年祈福 莲花酒店滑雪度假 牧民家访', 5799, '13812345678', 1, '“蒙享福”主题活动：包饺子、做奶食、行年礼、印年画、晒幸福、赢大礼！贺年福：亲临内蒙古佛教圣地大召寺，燃灯祈福、全家平安，幸福安康，聆听佛韵精髓！', '/upload/img/product/small/m3053bfcfa01270dd328400557a4206412.jpg', 5);
INSERT INTO `product` VALUES (258, '【佛山专线 春节 山西平遥古城+云丘山+壶口瀑布+五台山+太原滑雪 双飞5天】太原升级一晚超豪华酒店【过大年民俗亲子体验活动】', 3599, '13812345678', 1, '独家推出“平遥赏民俗、云丘品文化、山西过大年”，2+1亲子民俗体验游，给幸福加分、为成长加油。', '/upload/img/product/small/m32ac04bacecdc6377dec1abef32b4fa9d.jpg', 5);
INSERT INTO `product` VALUES (259, '【春节 越南船游下龙湾+巡洲岛+南宁 双飞4天】0购物0自费 +1元全程豪叹超豪华酒店【奢华纯玩越南】', 2999, '13812345678', 1, '全程承诺纯玩0购物0自费；+1元全程豪叹超豪华酒店！', '/upload/img/product/small/m37a2af301a56ba722ffae8ae2a666e263.jpg', 5);
INSERT INTO `product` VALUES (260, '【佛山专线 春节 越南岘港+下龙湾+河内 双高铁双飞6天 纯玩贵宾团】0购物0自费【越识叹·南北越联游·玩转巴拿山】', 4699, '13812345678', 1, '海陆空联游线路！纯玩0购物0自费！中越双导游服务，全程专业粤语导游讲解，周全照顾贴心服务随心出游！', '/upload/img/product/small/m313c5693d579f6fb55ab6cc935f0ea034.jpg', 5);
INSERT INTO `product` VALUES (261, '【陕西西安+河南洛阳龙门石窟+黄河壶口瀑布+延安+华山+郑州全景双卧8天】黄帝陵 兵马俑博物馆 嵩山少林寺', 2950, '13812345678', 1, '畅游陕西、河南、山西三省各大精华景点，升级洛阳-华山乘动车，游览黄河壶口瀑布，秦始皇兵马俑，西岳华山！', '/upload/img/product/small/m337209b6487f8ee9e2c11e470a89e13a8.jpg', 5);
INSERT INTO `product` VALUES (262, '【初春·约惠厦门 动车三天纯玩高级团】厦门鼓浪屿、曾厝垵、五色环岛路、环岛路木栈道、南普陀寺祈福', 949, '13812345678', 1, '漫步海上花园，寻幽万国建筑。找猫、找路、找风景、找历史、找美食，寻找专属自己的浪漫时光', '/upload/img/product/small/m323e1d43221d7b9014f7546ccab67a46f.jpg', 5);
INSERT INTO `product` VALUES (263, '【龙脊梯田+崀山赏花 豪华动车四天团】龙脊平安寨梯田 天一巷 八角寨 辣椒峰 石田油菜花海 瑶王宴 木龙湖', 1169, '13812345678', 1, '游览素有“世界梯田之冠”美誉的龙脊梯田（安排古壮寨、平安寨双梯田美景）！', '/upload/img/product/small/m32d0abfffd0a64b397315bd0eed5776d4.jpg', 5);
INSERT INTO `product` VALUES (264, '【至尊江西庐山+三清山+婺源+南昌 高铁五天】婺源古村落 篁岭油菜花 景德镇古窑 南昌滕王阁【美食盛宴+全程超豪华优质酒店】', 4199, '13812345678', 1, '美食盛宴，5大特色餐要你舔舔脷！庐山三石宴、婺源徽菜宴、景德镇陶瓷宴、南昌赣菜宴、三清山生态宴；一价全含：行程中所有门票、索道、观光车全含，门票总价值920元。全程入住超豪华酒店，旅途舒适安心！', '/upload/img/product/small/m3e3bd7b061c32a7ea6a21d93641c806cb.jpg', 5);
INSERT INTO `product` VALUES (265, '【3月特惠 陕西西安+华山 双飞4天】古都西安 青龙寺赏樱花 兵马俑 梦回大秦 西岳华山 大小雁塔汉城湖【贵宾团】', 2199, '13812345678', 1, '特别安排：全国重点文物保护单位---青龙寺赏樱花！升级3晚四星豪华标准酒店！', '/upload/img/product/small/m3e92a5813376e788457b488dc1c686499.jpg', 5);
INSERT INTO `product` VALUES (266, '【￥3888送五福之一】新疆乌鲁木齐+托克逊杏花园+天山天池+火洲吐鲁番+坎儿井+库姆塔格沙漠 双飞6天【需咨询客服】', 1999, '13812345678', 1, '￥3888元尊享新疆线和五福选一！天池雪景风光+鄯善库木塔格沙漠+火洲吐鲁番感受少数民族风情+托克逊杏福园花开第一春，尊享之旅！', '/upload/img/product/small/m3cda62bd923c9daeb8e34fb1e6b9f1a82.jpg', 5);
INSERT INTO `product` VALUES (267, '【豪叹喜来登 桂林动车纯玩四天贵宾团】船游大漓江 象鼻山 梦幻漓江山水表演 阳朔西街 银子岩 骥马村油菜花海（佛山出发）', 1299, '13812345678', 1, '全市独家线路，第三晚升级入住福朋喜来登酒店', '/upload/img/product/small/m37c7b02b2e7195de7792cec5db3bafd0e.jpg', 5);
INSERT INTO `product` VALUES (268, '【龙脊放水节 豪叹希尔顿 动车三天团超贵团】龙脊古壮寨梯田 平安梯田 布尼梯田 桂林訾洲岛 城徽象鼻山', 666, '13812345678', 1, '精选住宿：1晚入住特色吊脚楼+1晚指定入住希尔顿欢朋酒店，舒适客房35平米超大自由空间！品希尔顿酒店中西式自助早', '/upload/img/product/small/m361092f35ec7d5441b7546781cef4a380.jpg', 5);
INSERT INTO `product` VALUES (269, '【桂林赏花 豪叹喜来登 动车纯玩四天贵宾团】船游大漓江 西山公园 城徽象鼻山 梦幻漓江山水表演 银子岩 骥马村油菜花海', 1299, '13812345678', 1, '1晚指定入住福朋喜来登酒店，品价值138元中西式自助早餐，室内恒温游泳池免费畅游/高级健身房尽情挥洒汗水', '/upload/img/product/small/m3fd95ae517091220d8430dbb36418ad4c.jpg', 5);
INSERT INTO `product` VALUES (270, '【桂林崀山赏花 动车三天贵宾团】中国丹霞之魂 八角寨 辣椒峰 南溪山樱花园 木龙湖 崀山瑶王宴 升级一晚桂林超豪华酒店', 899, '13812345678', 1, '游【南溪山樱花园】，每年春天，这里的樱花竞相开放，樱花随风起舞，翩然而落，美不胜收', '/upload/img/product/small/m3554151406645ebce104f463c2c2e3c8c.jpg', 5);
INSERT INTO `product` VALUES (271, '【尊享内蒙古·呼和浩特+希拉穆仁草原+响沙湾 双飞4天】伊利工业园，畅玩沙漠＋草原＋民俗＋美食+滑雪【超贵团】', 1699, '13812345678', 1, '升级一晚超豪华酒店，尊享不一样的住宿体验。品尝醇正蒙古奶茶、诚邀您草原大锅煮手扒肉，体验不一样的蒙古族美食文化。', '/upload/img/product/small/m3b3f923ddb50bb855305a5c60e264185a.jpg', 5);
INSERT INTO `product` VALUES (272, '【江西庐山+三清山+婺源篁岭油菜花 双飞4天】景德镇古窑 南昌滕王阁 美食盛宴【全程超豪华优质酒店 12人封顶小团】', 3699, '13812345678', 1, '美食盛宴，5大特色餐要你舔舔脷！庐山三石宴、婺源徽菜宴、景德镇陶瓷宴、南昌赣菜宴、三清山生态宴；一价全含：行程中所有门票、索道、观光车全含，门票总价值920元。全程入住超豪华酒店，旅途舒适安心！', '/upload/img/product/small/m37bd8032ed701e2b91f0d094c2d4c564e.jpg', 5);
INSERT INTO `product` VALUES (273, '【寒假 华东五市·禅意祈福 双飞6天】杭州宋城景区 上海环球金融中心 七里山塘游船 无锡鼋头渚 南京牛首山祈福 拈花湾灯光秀《禅行》【三大加点一价全含】', 2799, '13812345678', 1, '三大加点一价全含，门票价值高达620元！杭州宋城景区，窥杭城变迁足迹；茂俯瞰大上海风云变幻；七里山塘游船，品老苏州自在生活，感受不同城市之间的风貌与魅力！', '/upload/img/product/small/m3f15936372dc3462d335b0e4ae95ef10b.jpg', 5);
INSERT INTO `product` VALUES (274, '【预售 云南丽江+大理+昆明+玉龙雪山+洱海 双飞6天·一价全包无自费】玉龙雪山 拉市海 大理古城 洱海风光 乃古石林 陆军讲武堂【贵宾团】', 2499, '13812345678', 1, '全程安排当地豪华型酒店；全程纯玩、一价全包；包含玉龙雪山等经典景点门票索道价值约450元，行程丰富，绝不走马观花！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (275, '【春节】北京5天4晚自由行奢华酒店套餐【全程入住IHG酒店集团旗下丽都皇冠假日酒店，享豪华中西自助早餐，提供24小时接机/接站服务】', 1888, '13812345678', 1, '全程入住IHG酒店集团旗下丽都皇冠假日酒店，享豪华中西自助早餐，提供24小时接机/接站服务！', '/upload/img/product/small/m3d277c4162a89fec039c3b96e083ac4eb.jpg', 5);
INSERT INTO `product` VALUES (276, '【春节】丽江+大理 双飞5天4晚 自由行套餐【含广州直飞往返机票+3晚丽江古城豪华客栈+1晚洱海特色客栈+大理2天游+机场到酒店往返接送】', 5599, '13812345678', 1, '含广州直飞丽江往返机票+3晚丽江古城豪华型客栈+1晚洱海特色客栈+大理2天游+机场到酒店往返接送！', '/upload/img/product/small/m396e332e6fe9c1a7396837bd17730c47f.jpg', 5);
INSERT INTO `product` VALUES (277, '【春节】丽江 双飞5天4晚 自由行套餐【含广州直飞往返机票+3晚丽江古城内豪华客栈+泸沽湖2日游+机场到酒店往返接送】', 5499, '13812345678', 1, '含广州直飞丽江往返机票+3晚丽江古城内豪华客栈+泸沽湖2日游+机场到酒店往返接送！', '/upload/img/product/small/m32d5f7517d1f822788efbfc58ee0371a8.jpg', 5);
INSERT INTO `product` VALUES (278, '【春节】厦门 高铁3天2晚 自由行套票【含广州往返高铁票+2晚厦门市区豪华酒店】', 1499, '13812345678', 1, '含广州往返高铁票+2晚厦门市区豪华酒店！', '/upload/img/product/small/m3b3bbdd11f3ea6f1a849b7f744f432e7f.jpg', 5);
INSERT INTO `product` VALUES (279, '【春节】阳朔 高铁3天2晚 自由行套票【含广州往返高铁票+2晚豪华型阳朔喆啡酒店（田园店）+每日自助早餐+天籁·蝴蝶泉门票】', 599, '13812345678', 1, '含广州往返高铁票+2晚豪华型阳朔喆啡酒店（田园店）+每日自助早餐+天籁·蝴蝶泉门票！', '/upload/img/product/small/m399c4e65d810fd27f462e8807684711de.jpg', 5);
INSERT INTO `product` VALUES (280, '【春节】阳朔 高铁3天2晚 自由行套票【含广州往返高铁票+2晚西街口豪华型阳朔万丽花园大酒店+每日西式自助早餐】', 799, '13812345678', 1, '含广州往返高铁票+2晚西街口豪华型阳朔万丽花园大酒店+每日西式自助早餐！', '/upload/img/product/small/m39c080ecfa42c2511244f532e13f793b1.jpg', 5);
INSERT INTO `product` VALUES (281, '【春节】三亚 双飞3天2晚 自由行套票【含广州直飞往返机票+2晚海棠湾理文索菲特度假酒店+每日自助早餐+VIP专车接送机服务】', 5899, '13812345678', 1, '含广州直飞三亚往返机票+2晚海棠湾理文索菲特度假酒店+每日自助早餐+VIP专车接送机服务！', '/upload/img/product/small/m3471424a0d20c4c3a57a498430a82be41.jpg', 5);
INSERT INTO `product` VALUES (282, '【春节】三亚 双飞3天2晚 自由行套票【含广州直飞往返机票+2晚海居铂尔曼酒店高级花园房+每日中西式自助早餐+VIP专车接送机服务】', 5099, '13812345678', 1, '含广州直飞三亚往返机票+2晚海居铂尔曼酒店高级花园房+每日中西式自助早餐+VIP专车接送机服务！', '/upload/img/product/small/m34332119c1d3b137dee37e76e5d2d9391.jpg', 5);
INSERT INTO `product` VALUES (283, '长白山 双飞5天4晚 半自由行套票【含广州往返机票+2晚长春当地高级酒店+2晚长白山万达小镇豪华酒店+万达小镇门票大礼包】', 7999, '13812345678', 1, '含广州往返机票+2晚长春当地高级酒店+2晚长白山万达小镇豪华型酒店+万达小镇门票大礼包！', '/upload/img/product/small/m31527368eef1e90e2e1eca8bc6d56ffde.jpg', 5);
INSERT INTO `product` VALUES (284, '厦门+鼓浪屿 高铁3天2晚 自由行套票【含广州往返高铁票+1晚厦门市区豪华型酒店+1晚厦门鼓浪屿特色客栈】', 899, '13812345678', 1, '含广州往返高铁票+1晚厦门市区豪华型酒店+1晚厦门鼓浪屿特色客栈！', '/upload/img/product/small/m3b989a3f3653eaab8d291362474e7d2b0.jpg', 5);
INSERT INTO `product` VALUES (285, '长白山 双飞5天4晚 半自由行套票【含广州往返机票+1晚吉林当地豪华酒店+1晚二道白河当地超豪华酒店+2晚万达小镇豪华型酒店+万达小镇门票大礼包+接送机】', 9599, '13812345678', 1, '含广州往返机票+1晚吉林当地豪华酒店+1晚二道白河当地超豪华酒店+2晚万达小镇豪华型酒店+万达小镇门票大礼包+接送机！', '/upload/img/product/small/m31527368eef1e90e2e1eca8bc6d56ffde.jpg', 5);
INSERT INTO `product` VALUES (286, '西藏朝圣之旅 三飞7天6晚 自由行套票【含广州往返机票+2晚拉萨当地超豪华型酒店+1晚重庆机场酒店】', 2299, '13812345678', 1, '含广州往返机票+2晚拉萨当地超豪华型酒店+1晚重庆机场酒店！', '/upload/img/product/small/m3958e1b9c2b8b43da1c3440b71155dc7d.jpg', 5);
INSERT INTO `product` VALUES (287, '新疆 双飞5天4晚 半自由行套票【含广州直飞往返机票+4晚希尔顿酒店+南山滑雪1天游+机场到酒店单程交通】', 3999, '13812345678', 1, '含广州直飞乌鲁木齐往返机票+4晚希尔顿酒店+南山滑雪1天游+机场到酒店单程交通！', '/upload/img/product/small/m3b73ad0712746ef03019e34fb9757401d.jpg', 5);
INSERT INTO `product` VALUES (288, '兰州 双飞6天5晚 自由行套票【含广州直飞往返机票+1晚兰州当地高档型酒店】', 1899, '13812345678', 1, '含广州直飞兰州往返机票+1晚兰州当地高档型酒店！', '/upload/img/product/small/m3824f8d34ac79533f1eea1b48869ae356.jpg', 5);
INSERT INTO `product` VALUES (289, '厦门+鼓浪屿 高铁4天3晚 自由行套票【含广州往返高铁票+2晚厦门市区高级型/连锁酒店+1晚厦门鼓浪屿特色客栈/酒店】', 999, '13812345678', 1, '含广州往返高铁票+2晚厦门市区高级型/连锁酒店+1晚厦门鼓浪屿特色客栈/酒店！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (290, '阳朔 高铁3天2晚 自由行套票【含广州往返高铁票+2晚悦榕庄山脉印象套房+每日中西式自助早餐+竹筏漓江游+高铁站到酒店去程或回程交通】', 1999, '13812345678', 1, '含广州往返高铁票+2晚悦榕庄山脉印象套房+每日中西式自助早餐+竹筏漓江游+高铁站到酒店去程或回程交通！', '/upload/img/product/small/m3395dd088670dfb34bbff4367c06acbcb.jpg', 5);
INSERT INTO `product` VALUES (291, '北海+涠洲岛 高铁3天2晚 半自由行套票【含广州往返高铁票+2晚北海高档型酒店+每日自助早餐+涠洲岛1日游】', 699, '13812345678', 1, '含广州到北海往返高铁票+2晚北海高档型酒店+每日自助早餐+涠洲岛1日游！', '/upload/img/product/small/m3767fc94b0d88476ce08e0d08780ac528.jpg', 5);
INSERT INTO `product` VALUES (292, '北海+涠洲岛 高铁3天2晚 自由行套票【含广州往返高铁+1晚北海高档型酒店+1晚涠洲岛高档型酒店+涠洲岛1日游】', 699, '13812345678', 1, '含广州到北海往返高铁+1晚北海高档型酒店+1晚涠洲岛高档型酒店+涠洲岛1日游！', '/upload/img/product/small/m3767fc94b0d88476ce08e0d08780ac528.jpg', 5);
INSERT INTO `product` VALUES (293, '丽江+泸沽湖 双飞5天4晚 半自由行套票【含广州直飞往返机票+3晚丽江古城内豪华客栈+泸沽湖2日游】', 2699, '13812345678', 1, '含广州直飞丽江往返机票+3晚丽江古城内豪华客栈+泸沽湖2日游！', '/upload/img/product/small/m38c2b01f1fd85866263ebcd4cb76e29dd.jpg', 5);
INSERT INTO `product` VALUES (294, '丽江+香格里拉 双飞5天 半自由行套票【含广州直飞往返机票+3晚丽江豪华客栈+香格里拉2日游】', 2499, '13812345678', 1, '含广州直飞丽江往返机票+3晚丽江豪华客栈+香格里拉2日游！', '/upload/img/product/small/m3f5bee4251593b892bb3275e6957e5c07.jpg', 5);
INSERT INTO `product` VALUES (295, '丽江+大理 双飞5天4晚 半自由行套票【含广州直飞往返机票+3晚丽江古城豪华型客栈+1晚洱海特色客栈+大理2天游+机场到酒店往返接送】', 5599, '13812345678', 1, '含广州直飞丽江往返机票+3晚丽江古城豪华型客栈+1晚洱海特色客栈+大理2天游+机场到酒店往返接送！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (296, '三亚海棠湾喜来登度假酒店 3天2晚 自由行套票【含2晚园景房+每日中西式自助早餐】', 1099, '13812345678', 1, '含2晚三亚海棠湾喜来登度假酒店园景房+每日中西式自助早餐！', '/upload/img/product/small/m3a094372e25fd4b78bd9427ecda266a2a.JPG', 5);
INSERT INTO `product` VALUES (297, '长白山+长春 6天5晚 自由行套票【含2晚长春高级酒店+2晚长白山万达智选假日酒店+1晚长白山温泉皇冠假日酒店+长春到长白山万达往返交通+大礼包】', 2799, '13812345678', 1, '含2晚长春高级酒店+2晚长白山万达智选假日酒店+1晚长白山温泉皇冠假日酒店+长春到长白山万达往返交通+大礼包！', '/upload/img/product/small/m3fa508d84cd1f43ec2a91eed76e084297.jpg', 5);
INSERT INTO `product` VALUES (298, '上海浦东 康桥大酒店 精品房（含早）', 115, '13812345678', 1, '上海康桥大酒店，28年温馨品质，新装升级，集住宿餐饮为一身，丰富东海小海鲜每日直达。', '/upload/img/product/small/m305540886e77a92c50cac8862dfcac2a9.jpg', 5);
INSERT INTO `product` VALUES (299, '三亚锦江宝宏酒店 3天2晚 自由行套票【含2晚主楼标准房+每日中西式自助早餐】', 439, '13812345678', 1, '含2晚三亚锦江宝宏酒店主楼标准房+每日中西式自助早餐！', '/upload/img/product/small/m3cc0ae9ebf1a693d03ec69d94a5b79a75.jpg', 5);
INSERT INTO `product` VALUES (300, '阳朔喆啡酒店（田园店） 3天2晚 自由行套票【含2晚标准房+天籁·蝴蝶泉门票】', 249, '13812345678', 1, '含2晚喆啡酒店标准房+天籁·蝴蝶泉门票！', '/upload/img/product/small/m399c4e65d810fd27f462e8807684711de.jpg', 5);
INSERT INTO `product` VALUES (301, '【买1送1】阳朔万丽花园大酒店 3天2晚 自由行套票【含2晚豪华房+每日西式自助早餐+天籁·蝴蝶泉门票】', 959, '13812345678', 1, '含2晚万丽花园大酒店豪华房+每日西式自助早餐+天籁·蝴蝶泉门票！', '/upload/img/product/small/m3b0ce750a53fc3ea9a5c65fbe63f13c5f.jpg', 5);
INSERT INTO `product` VALUES (302, '三亚理文索菲特度假酒店 3天2晚 自由行套票【含2晚豪华海景房+每日中西式自助早餐】', 999, '13812345678', 1, '含2晚理文索菲特度假酒店豪华海景房+每日中西式自助早餐！', '/upload/img/product/small/m33fac12460ee3a6ac26d844409dbe3743.jpg', 5);
INSERT INTO `product` VALUES (303, '三亚丽禾温德姆酒店 4天3晚 自由行套票【含3晚豪华海景房+每日中西式自助早餐+1份环球海鲜BBQ晚餐+mini吧畅饮】', 1099, '13812345678', 1, '含3晚丽禾温德姆酒店豪华海景房+3份中西式自助早餐+1份环球海鲜BBQ自助晚餐+mini吧畅饮！', '/upload/img/product/small/m3ab024d539778cfee109fddf4e08a31fd.jpg', 5);
INSERT INTO `product` VALUES (304, '长白山+长春 5天4晚 自由行套票【含2晚长春高级酒店+2晚长白山万达智选假日酒店+长春到长白山万达往返交通+大礼包】', 2399, '13812345678', 1, '含2晚长春高级酒店+2晚长白山万达智选假日酒店+长春到长白山万达度假区往返交通+大礼包！', '/upload/img/product/small/m348f6cf9a11a1faaad4a0f289e8badd55.jpg', 5);
INSERT INTO `product` VALUES (305, '阳朔天籁·蝴蝶泉景区（含侗族歌舞表演）电子 成人 门票', 50, '13812345678', 1, '阳朔天籁蝴蝶泉是国家aaaa级景区，广西民族风情旅游示范点，位于阳朔十里画廊精华地段。', '/upload/img/product/small/m314dc331a075464b636fa50a37af86561.jpg', 5);
INSERT INTO `product` VALUES (306, '阳朔世外桃源景区（含游船休闲游）电子 成人 门票', 65, '13812345678', 1, '景区的游览方式主要分水上游览和徒步观赏。水上游览乘轻舟顺流而下，经田园村舍，过绿树丛林，又穿山而出，沿途可经原始形态的迎宾、祭祀、狩猎，又可欣赏到民族特色的狂歌劲舞、边寨风情。', '/upload/img/product/small/m3057f3fb8520c175e48b6a914d0d6e397.jpg', 5);
INSERT INTO `product` VALUES (307, '上海迪士尼乐园 一日 门票（成人/儿童/长者）', 375, '13812345678', 1, '参考景区营业时间：10:00 - 20:00！凭本人有效二代身份证原件到上海迪士尼乐园门口刷身份证进园！', '/upload/img/product/small/m36491998889e9597f0e7753beea037ae3.jpg', 5);
INSERT INTO `product` VALUES (308, '长白山万达智选假日酒店 3天2晚 自由行套票【含标准房1间2晚+长春到长白山万达度假区往返交通+大礼包】', 1799, '13812345678', 1, '含长白山万达智选假日酒店标准房1间2晚+长春到长白山万达度假区往返交通+大礼包！', '/upload/img/product/small/m3400aec403decab9d880fd8036a8490c3.jpg', 5);
INSERT INTO `product` VALUES (309, '广州——宁波 4天 往返机票', 1099, '13812345678', 1, '含广州直飞宁波往返经济舱含税机票！', '/upload/img/product/small/m313e7dd333f562f2830ba00744d4f4a77.jpg', 5);
INSERT INTO `product` VALUES (310, '成都——西岭雪山 当天 往返交通', 60, '13812345678', 1, '成都到西岭雪山当天往返交通！', '/upload/img/product/small/m3fde4e5c0a5ee7362fcb2d9767a607340.jpg', 5);
INSERT INTO `product` VALUES (311, '【当地参团】北海+涠洲岛 1天游', 490, '13812345678', 1, '含往返船票+上岛门票+1正餐+讲解员+行程内用车！包含景点：火山地质公园+主标志碑广场+石螺口海滩！', '/upload/img/product/small/m39e0caefe49275de05203249776afa9b3.jpg', 5);
INSERT INTO `product` VALUES (312, '【3月特惠西藏：拉萨+林芝+鲁朗 三飞7天】西藏布达拉宫 八廓街 财神庙扎基寺 西藏江南林芝 尼洋阁 鲁朗林海', 2899, '13812345678', 1, '特别林芝安排入住2晚，（海拔2900米）更容易适应高原，更充裕时间赏雪域江南美景。参加藏式传统活动米拉雪山山口【挂经幡祈福】！', '/upload/img/product/small/m33081ca28401171fcb24fbf22496edb50.jpg', 5);
INSERT INTO `product` VALUES (313, '【3月西藏桃花季：拉萨+林芝+鲁朗+羊卓雍措+波密 双飞一卧10天】布达拉宫 秀巴古堡 鲁朗国际旅游小镇 波密桃花沟 观青藏铁路景观带', 5399, '13812345678', 1, '乘坐世界最先进铁路成果青藏列车，观世界坐标级景观带：造访林芝桃花村，漫步青稞田埂、赏醉美雪域野生桃花；寻秘秀巴古堡历史悠久，春色桃花掩映！', '/upload/img/product/small/m33081ca28401171fcb24fbf22496edb50.jpg', 5);
INSERT INTO `product` VALUES (314, '【3月西藏·雪域桃花季 双飞一卧7天】 拉萨布达拉宫 西藏江南林芝 巴松措 嘎啦桃花村 雅鲁藏布大峡谷 青藏铁路景观带', 5799, '13812345678', 1, '乘坐世界最先进铁路成果【青藏铁路列车】，游玩桃花首选之地【嘎啦桃花村】，在雪山的环抱之下，怒放的桃花在山坡间绵延。', '/upload/img/product/small/m38f213d7e2bbb0e4185ce942443be2946.jpg', 5);
INSERT INTO `product` VALUES (315, '【3月林芝桃花季： 西宁+拉萨+林芝 三飞一卧7天】青海湖 布达拉宫 八廓街 嘎啦桃花村 巴松措 雅鲁藏布大峡谷【观青藏铁路景观带】', 6799, '13812345678', 1, '乘坐世界最先进铁路成果【青藏铁路列车】，游玩桃花首选之地【嘎啦桃花村】，在雪山的环抱之下，怒放的桃花在山坡间绵延。', '/upload/img/product/small/m3140f1784474b53135bcb7fa5250bbf86.jpg', 5);
INSERT INTO `product` VALUES (316, '【3月 西藏桃花季：青海+林芝+拉萨 三飞一卧8天】嘎拉桃花村 鲁朗林海 鲁朗小镇 布达拉宫 扎基寺 青海省博物馆【观青藏铁路景观】', 4999, '13812345678', 1, '乘坐世界最先进铁路成果【青藏铁路列车】，游观赏“神仙居住的地方”【鲁朗林海】，在色季拉山口有机会邂逅中国最美【南迦巴瓦峰】！', '/upload/img/product/small/m32bdf1849b307712c4a0843b89ed83b5f.jpg', 5);
INSERT INTO `product` VALUES (317, '【3月特惠 林芝桃花季：林芝+拉萨+鲁朗林海+羊卓雍措 三飞6天】嘎拉桃花村 鲁朗林海 鲁朗小镇 布达拉宫', 3999, '13812345678', 1, '游西藏林芝地区历史悠久、保存完整的古堡群【秀巴古堡】，掩映春色桃花；观赏“神仙居住的地方”【鲁朗林海】，在色季拉山口有机会邂逅中国最美【南迦巴瓦峰】！', '/upload/img/product/small/m32bdf1849b307712c4a0843b89ed83b5f.jpg', 5);
INSERT INTO `product` VALUES (318, '【3月特惠 林芝桃花季 三飞7天】西藏江南林芝 嘎拉桃花村 鲁朗林海 拉萨 布达拉宫 财神庙扎基寺 圣湖羊卓雍措', 3999, '13812345678', 1, '游西藏林芝地区历史悠久、保存完整的古堡群【秀巴古堡】，掩映春色桃花；观赏“神仙居住的地方”【鲁朗林海】，在色季拉山口有机会邂逅中国最美【南迦巴瓦峰】！', '/upload/img/product/small/m3d79fd84589ebf3b83293ee1b3c2520f6.jpg', 5);
INSERT INTO `product` VALUES (319, '【西藏拉萨+林芝 赏花之旅 双飞一卧10天】青藏铁路景观带 拉萨布达拉宫 藏东南桃花沟 鲁朗林海 巴松措 波密十里桃花 日喀则 扎什伦布寺', 4699, '13812345678', 1, '乘坐世界最先进铁路成果【青藏铁路列车】，深入藏东南，探秘中国最美的景观大道——林芝至波密段十里桃花；游览世界最高、最神圣的宫殿【布达拉宫】', '/upload/img/product/small/m3285ab2afad8d9c78aa6f37895597a795.jpg', 5);
INSERT INTO `product` VALUES (320, '【3月西藏桃花：西宁+拉萨+林芝+羊卓雍措 三飞一卧8天】布达拉宫 林芝 藏东南桃花沟 鲁朗林海 圣湖巴松措【观青藏铁路景观带】', 5699, '13812345678', 1, '乘坐青藏铁路精华段“西宁—拉萨”，阶梯式逐渐适应高原环境；走进雅鲁藏布江流域雪山下桃花盛开的【桃花沟】，拍摄醉美雪域桃花；加游西藏三大圣湖之一，西藏最秀美妖艳的湖泊【羊卓雍措】！', '/upload/img/product/small/m3d4e24bd288c8b9ecbd81d20dbf9fe5bc.jpg', 5);
INSERT INTO `product` VALUES (321, '【3月赏西藏桃花：拉萨+林芝+羊卓雍措 三飞7天】布达拉宫 财神庙扎基寺 林芝桃花沟 米林桃花谷 巴松措', 3799, '13812345678', 1, '登上世界奇迹、世界屋脊明珠：布达拉宫，感受世界之巅的磅礴大气。特别安排夜游布达拉宫广场；走进雅鲁藏布江流域雪山下桃花盛开的【桃花沟】，拍摄醉美雪域桃花！', '/upload/img/product/small/m3d79fd84589ebf3b83293ee1b3c2520f6.jpg', 5);
INSERT INTO `product` VALUES (322, '【3月雪域桃花：拉萨+林芝+巴松措+羊卓雍措 双卧11天】布达拉宫 财神庙扎基寺 八廓街 林芝桃花沟 米林桃花谷【观青藏铁路景观带】', 2999, '13812345678', 1, '乘坐世界最先进铁路成果【青藏铁路列车】，畅游“世界屋脊上的原生态博物馆”——巴松措；走进雅鲁藏布江流域雪山下桃花盛开的【桃花沟】，拍摄醉美雪域桃花！', '/upload/img/product/small/m32bdf1849b307712c4a0843b89ed83b5f.jpg', 5);
INSERT INTO `product` VALUES (323, '【3888元报新疆送友善福】贵州乌蒙大草原高山杜鹃红+兴义马岭河大峡谷+雨补鲁天坑+青岩古镇 高铁5天【需咨询客服】', 1889, '13812345678', 1, '打包价￥3888元，即可享受新疆和贵州杜鹃花之旅！乘贵广高铁，游多彩贵州，领略坡上草原乌蒙高山杜鹃，深度黔西南，畅游喀斯特地貌的峰林绝品。', '/upload/img/product/small/m3fb75c5e8b6c0ca4b851c98a6c709b7fb.jpg', 5);
INSERT INTO `product` VALUES (324, '【￥3888报新疆线送富强福】山西杏花村品酒赏杏+五台山新春祈福+赏黄河壶口冰瀑 桃花汛+平遥古城 双飞5天【需咨询客服】', 1889, '13812345678', 1, '￥3888元尊享新疆线和五福选一！赏在杏花村，品在汾酒厂。佛教圣地五台山祈福零距离接触，观赏中国第二大瀑布－壶口瀑，感受壶口冰瀑和桃花汛天下第一美景！', '/upload/img/product/small/m35cfd19f76b6135fa6e20453462b4672e.jpg', 5);
INSERT INTO `product` VALUES (325, '【￥3888元报新疆线 送敬业福】山东泰山+曲阜古城+兖州+济南+潍坊+青岛+威海+蓬莱 双飞6天【需请咨询客服】', 1889, '13812345678', 1, '￥3888元尊享新疆线和五福选一！全程入住豪华酒店，特别升级一晚超豪华酒店，享受轻奢假期！', '/upload/img/product/small/m359ee4de78ec38b362bd4e11664029ebf.jpg', 5);
INSERT INTO `product` VALUES (326, '【￥3888报新疆线 送和谐福 云南腾冲风情游+热海瑞丽+大理 高铁6天】国殇墓园 绮罗古镇 一寨两国 中缅国门 大理洱海 船游龙宫 金梭岛【需咨询客服】', 1889, '13812345678', 1, '￥3888元尊享新疆线和五福选一！寻民族古迹+品民族美食+观民俗景点+体地道民族文化+叹火山温泉！', '/upload/img/product/small/m39060b0883d8a358677b8c222abcc7bae.jpg', 5);
INSERT INTO `product` VALUES (327, '【￥3888报新疆线·送爱国福】北京+秦皇岛+山海关+北戴河海滨浴场 双飞6天 观玉渊潭樱花【纯玩3钻 需咨询客服】', 1889, '13812345678', 1, '￥3888元尊享新疆线和五福选一！一次畅游北京、秦皇岛、北戴河三大风光城市！', '/upload/img/product/small/m3ae1f3a49daf6ff79871f6211d49e9c26.jpg', 5);
INSERT INTO `product` VALUES (328, '【旅展 云南腾冲+大理+瑞丽 高铁6天】热海 国殇墓园 绮罗古镇 一寨两国 中缅国门 大理洱海 船游龙宫 金梭岛【贵宾团】', 1999, '13812345678', 1, '游玩四座不同的城市，访问四个各具特色的少数民族聚集地；寻民族古迹+品民族美食+观民俗景点+体地道民族文化+叹火山温泉！', '/upload/img/product/small/m3cc3bbbb47e4899597a160233b4ac5080.jpg', 5);
INSERT INTO `product` VALUES (329, '【经典•桂林 动车三天纯玩贵宾团】船游大漓江 西山桃花节 城徽象鼻山 骥马村油菜花海 鲁家村 阳朔西街（佛山出发）', 959, '13812345678', 1, '漫步【阳朔骥马村】，赏金色花田“油菜花海”（至佳观赏期3月初至3月下旬）', '/upload/img/product/small/m3e5d098135b9249aab3ba5c2b71759773.jpg', 5);
INSERT INTO `product` VALUES (330, '【旅展 买1送1 越南岘港+船游下龙湾+河内 双高双飞6天】美溪海滩 会安古城 山茶半岛【南北越联游】', 2999, '13812345678', 1, '游览媲美夏威夷海滩的度假胜地【岘港】，世界著名的六大海滩之一，其水天一色的海滩亦不逊于马尔代夫！漫步体验越南政治中心百花春城【河内】！', '/upload/img/product/small/m3ebcff17fe65524c427d98e811fc476a7.jpg', 5);
INSERT INTO `product` VALUES (331, '【龙脊放水节 桂林+龙脊 动车三天团】龙脊梯田 兴坪古镇 骥马村油菜花海 船游一江四湖 桂林城徽象鼻山 阳朔西街', 599, '13812345678', 1, '“世界梯田之冠”龙脊梯田水满田畴，层层银链的震撼风景！（至佳观赏期3月-4月上旬）', '/upload/img/product/small/m3ef702190f1c51354db5b9e754573428b.jpg', 5);
INSERT INTO `product` VALUES (332, '【旅展 贵州黄果树瀑布+西江千户苗寨+荔波大小七孔 高铁5天 +1元升级超豪华酒店】陡坡塘 天星桥 贵阳青岩古城【佛山出发】', 1999, '13812345678', 1, '经典贵州之旅，升级一晚当地超豪华酒店，尊享舒适旅程！享用地道美食：品尝特色【西江长桌宴】，唱《敬酒歌》感受苗家“高山流水”的饮酒乐趣！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (333, '【旅展 越南岘港+船游下龙湾+山茶半岛+河内 双高双飞6天 南北越联游】越南岘港 美溪海滩 会安古城【高级团】', 1499, '13812345678', 1, '海陆空联游线路！特别安排岘港一天自由活动，漫步世界六大最美丽的海滩【美溪海滩】！', '/upload/img/product/small/m3bdf71ba19f26095333c7026708f80276.jpg', 5);
INSERT INTO `product` VALUES (334, '【桂林赏花 豪叹喜来登 动车纯玩四天高级团】船游大漓江 西山公园 城徽象鼻山 梦幻漓江山水表演 银子岩 骥马村油菜花海', 1199, '13812345678', 1, '1晚指定入住福朋喜来登酒店，品价值138元中西式自助早餐，室内恒温游泳池免费畅游/高级健身房尽情挥洒汗水', '/upload/img/product/small/m32451ae93a546797238af08e3227d599d.jpg', 5);
INSERT INTO `product` VALUES (335, '【旅展 呼和浩特+畅游双草原+响沙湾+哈素海湿地+天鹅堡温泉 双飞5天】希拉穆仁草原 敕勒川草原 升级3晚超豪华酒店 体验蒙古包【金马自营 超贵团】', 1999, '13812345678', 1, '特别安排双草原，体验不同类型草原之美。安排环湖自行车，骑行国家湿地公园哈素海，观鸟，踏青，看芦苇，体验富含矿物质地下3368米的真温泉。', '/upload/img/product/small/m363bc5fa2b902e795e4ac5b07cbbd0d04.jpg', 5);
INSERT INTO `product` VALUES (336, '【旅展爆款 山西杏花村+平遥古城+五台山祈福+黄河壶口桃花汛 双飞5天】品酒赏杏 五台山新春祈福.赏壶口冰瀑 桃花汛【金马自营】', 1999, '13812345678', 1, '赏在杏花村，品在汾酒厂。佛教圣地五台山祈福零距离接触，漫游北方“阳朔”－平遥古城，明清古城的风韵、感受明清的传奇历史。观赏中国第二大瀑布－壶口瀑布，自然风光与华夏文化完美结合。', '/upload/img/product/small/m3718a0c8445e1d51deca91f07f8e11d5c.jpg', 5);
INSERT INTO `product` VALUES (337, '【旅展爆款 山西太原+平遥古城+壶口“桃花汛”+太行山 双飞6天 超贵团】赏壶口桃花汛.优选南航商务航班.升级超豪华客栈【金马自营】', 1799, '13812345678', 1, '全程优选豪华酒店，升级一晚超豪华客栈；优选南航商务航班，无需早起烦恼！', '/upload/img/product/small/m311691a217249481ffde6287d925c647b.jpg', 5);
INSERT INTO `product` VALUES (338, '【旅展特价 江西婺源篁岭油菜花+龙虎山 单卧单高3天】古代悬棺表演 品特色水浒宴 农家生态宴', 1229, '13812345678', 1, '婺源篁岭赏满山遍野油菜花海！游世界自然遗景观龙虎山，探索崖墓悬棺的奥秘，走进姹紫嫣红的花语世界；品尝特色特色水浒宴、品地道生态绿色婺源当地农家菜！', '/upload/img/product/small/m341d07de8a2473a2cf6db76e58bb95a39.jpg', 5);
INSERT INTO `product` VALUES (339, '【旅展爆款 女神月 女士立减200】张家界大峡谷+全新魔鬼悬崖玻璃栈道+黄龙洞油菜花海+凤凰古城 高铁4天【包场《烟雨张家界》音乐剧 豪叹无自费 4钻】', 1099, '13812345678', 1, '张家界大峡谷玻璃桥，世界最长、最高的全透明【玻璃桥】，对决矮寨大桥玻璃栈道，世界第一悬索大桥！', '/upload/img/product/small/m35eb7f526b46873c872ca5638340f26f3.jpg', 5);
INSERT INTO `product` VALUES (340, '【旅展特价 江西婺源篁岭油菜花+道教龙虎山 火车4天】欣赏奇绝的古代悬棺表演 品特色水浒宴、农家生态宴', 999, '13812345678', 1, '婺源篁岭赏满山遍野油菜花海！游世界自然遗景观龙虎山，探索崖墓悬棺的奥秘，走进姹紫嫣红的花语世界；品尝特色特色水浒宴、品地道生态绿色婺源当地农家菜！', '/upload/img/product/small/m3cba55e9edc086502e0bc95c8db2ca498.jpg', 5);
INSERT INTO `product` VALUES (341, '【旅展爆款 云南西双版纳 高铁6天】野象谷 独树成林 傣族园 曼听公园 告庄大金塔 傣家村寨 万亩茶园 昆明石林【贵宾团】', 1399, '13812345678', 1, '游览西双版纳优质景点，全程入住当地豪华型酒店！', '/upload/img/product/small/m3ed6000c0edb3ab4737004f6852e5c02f.jpg', 5);
INSERT INTO `product` VALUES (342, '【旅展爆款 华东六市+乌镇+木渎 双飞6天】杭州西湖 上海中华艺术宫 常熟尚湖牡丹节 苏州耦园 南京中山陵', 1599, '13812345678', 1, '', '/upload/img/product/small/m3439569622eef1de3271e64cbb51ed957.jpg', 5);
INSERT INTO `product` VALUES (343, '【旅展 第2位￥999 湖北神农架+宜昌 双飞4天】神农顶 小龙潭动物救护站 小呼伦贝尔之称 “大九湖” 官门山 大熊猫馆【高级团】', 2399, '13812345678', 1, '特别安排神农架野山笋、神农架腊肉、野生蕨菜，神农架黄金果、懒人做的懒豆腐、神农腊猪蹄、香溪绿茶、土家菜…地地道道的神农架特色美味等特色美食。', '/upload/img/product/small/m30f94dad08c676141916d1737078a8d8e.jpg', 5);
INSERT INTO `product` VALUES (344, '【爆款桂林赏花·豪叹希尔顿 动车三天团超贵团】畅游海洋乡+恭城双桃花节 骥马村油菜花海 侗情水庄 桂林船游一江四湖（佛山出发）', 999, '13812345678', 1, '春天的桂林美如画！精心策划线路带您畅游3大桂林最美的赏花胜地！', '/upload/img/product/small/m3e5d098135b9249aab3ba5c2b71759773.jpg', 5);
INSERT INTO `product` VALUES (345, '【旅展爆款 湖北恩施+宜昌+两坝一峡 双飞4天】恩施大峡谷 土司城 女儿城 云龙河地缝 三峡大坝【高级团】', 1699, '13812345678', 1, '直飞宜昌往返，节省15小时车程！游玩万米绝壁画廊、千丈飞瀑流芳、百座独峰矗立、十里深壑幽绝、电影《三生三世十里桃花》取景地—【恩施大峡谷】！', '/upload/img/product/small/m3e99b3ae168835b4811d450045d544c9c.jpg', 5);
INSERT INTO `product` VALUES (346, '【旅展爆款 广渝动车 潼南油菜花+重庆 高铁3天】磁器口古镇 洪崖洞 解放碑 双江古镇【纯玩高级团】', 1399, '13812345678', 1, '体验全新开通的广渝动车，直达魅力山城——重庆，安排潼南油菜花欣赏中国最大油菜花太极图！', '/upload/img/product/small/m347fb11112d9d1beca8eb05fa512f8ab5.jpg', 5);
INSERT INTO `product` VALUES (347, '【旅展爆款 湘桂黔渝川五省大联游 高铁6天】湖南凤凰 广西三江侗乡 贵州遵义会址 赤水大瀑布 国酒之都仁怀 山城重庆 四川泸州【贵宾团】', 2099, '13812345678', 1, '环游大西南五省：湖南、广西、贵州、重庆、四川，不走回头路；享用特色餐：贵州赤水长桌宴，重庆麻辣火锅宴，湖南凤凰苗王宴；特别安排国酒之都——仁怀一晚，品尝茅台镇佳酿，了解茅台酒文化！', '/upload/img/product/small/m33a4a9104d68e57ab9e0b0fbbc624a156.jpg', 5);
INSERT INTO `product` VALUES (348, '【广渝动车·印象武隆+魅力重庆+冰雪温泉 高铁4天】武隆天生三桥 仙女山国家森林公园 金佛山 解放碑 洪崖洞 天星国际温泉', 2099, '13812345678', 1, '体验全新开通的广渝动车，劲省5小时，直达魅力山城——重庆！安排金佛山温泉，泡去一身疲惫；赠送重庆火锅，感受真正的吃香喝辣！', '/upload/img/product/small/m3a83f43dab8c480f4e046f3e64c16fdaf.jpg', 5);
INSERT INTO `product` VALUES (349, '【旅展特价 贵川渝三省联游 高铁5天】重庆解放碑 洪崖洞 磁器口古镇 贵州世遗赤水大瀑布 佛光岩 丙安古镇 国酒门 茅台古镇 遵义会议旧址 四度赤水纪念馆 四川泸州尧坝古镇', 1899, '13812345678', 1, '渝贵高铁新时代，万名金粉畅游贵渝川！感受高铁新时速，在家门口就可以直接搭高铁一次直达山城重庆！黔贵山水风光、最炫民族风与重庆/四川麻辣火锅&美食相碰撞，让你感受不一样的旅游体验！', '/upload/img/product/small/m35f2bebadf1ca01e9407ecffd3bf8f5ef.jpg', 5);
INSERT INTO `product` VALUES (350, '【特价 贵州黄果树瀑布+荔波大小七孔+西江千户苗寨 单高单飞4天】青岩古镇 荔波直飞·畅游全景【金马自营】', 1899, '13812345678', 1, '升级一晚豪华酒店！地道美食：品尝【西江长桌宴】、【安顺土鸡宴】……感受当地贵州美食！', '/upload/img/product/small/m322e835000a086328e8de69b5fd9f68ee.jpg', 5);
INSERT INTO `product` VALUES (351, '【旅展爆款 海南分界洲岛+西岛 双飞4天 三亚往返·豪叹温德姆】亚龙湾沙滩 椰田古寨 玫瑰谷 兴隆南国热带雨林【惠贵团】', 1499, '13812345678', 1, '精华景点一价全包，全程0自费！5A级海岛，触摸世界上最白，最细，最柔软的细沙——【蜈支洲岛】 ！', '/upload/img/product/small/m339fc97b006caec2baf3ca8ff462c0c1c.jpg', 5);
INSERT INTO `product` VALUES (352, '【旅展特价 贵州 春摄杜鹃·万亩茶海 高铁4天】贵州毕节百里杜鹃 湄潭永兴万亩茶海 遵义会议旧址 娄山关【金马自营】', 1599, '13812345678', 1, '乘渝广高铁，观赏世界上最大的天然花园、杜鹃王国！深入湄潭万亩茶海，养眼、养胃、养心；红与绿的完美融合！', '/upload/img/product/small/m3c93f7358519269872e3c3ba141ff7d8b.jpg', 5);
INSERT INTO `product` VALUES (353, '【长江黄金邮轮：宜昌至重庆 高铁5天 超贵团】长江三峡 三峡大坝 小三峡 丰都鬼城 白帝城 重庆磁器口 解放碑【阳台标双房】', 3399, '13812345678', 1, '直达双动，不走回头路，直达目的地；游览仙境般的长江三峡支流峡谷----大宁河小三峡；享用游船上精美中西自助美食！', '/upload/img/product/small/m3c359cf10f1cf1f24c4444b7b311d921f.jpg', 5);
INSERT INTO `product` VALUES (354, '【黄金邮轮宜昌-重庆 高铁5天 超贵团】长江三峡 三峡大坝 小三峡 丰都鬼城 重庆磁器口 解放碑【观景大床房】', 3399, '13812345678', 1, '直达双动，不走回头路，直达目的地；游览仙境般的长江三峡支流峡谷----大宁河小三峡；享用游船上精美中西自助美食！', '/upload/img/product/small/m3bfe3cfbbcb0fc5ce2b79cb022c07f2d6.jpg', 5);
INSERT INTO `product` VALUES (355, '【春节 畅游广西北海 双飞4天 贵宾团】钦州 八寨沟 北海银滩【南航往返·叹超豪华酒店】', 1899, '13812345678', 1, '感受北海文化漫步中国最小镇“觅食”中越结合之美味；畅游真正“天下第一滩”北海十里银滩！', '/upload/img/product/small/m397f2bfa9a9efa2221301209ec70bfad1.jpg', 5);
INSERT INTO `product` VALUES (356, '【旅展·福建永定土楼+厦门 高铁4天】厦门鼓浪屿 南普陀 曾厝垵 永定高北土楼 云水谣古镇 品《客家.家宴》【广州南出发】', 1199, '13812345678', 1, '畅游福建两大世界遗产：厦门鼓浪屿，永定土楼！厦门全程入住厦门特色客栈酒店；尊享客家家宴，品尝客家味道！', '/upload/img/product/small/m3b27aaee35823a32b5a95da019df3620f.jpg', 5);
INSERT INTO `product` VALUES (357, '【世遗武隆+重庆+大足石刻 高铁5天】武隆天生三桥 仙女山国家森林公园 磁器口古镇 李子坝轻轨车站 洪崖洞【贵宾团】', 2399, '13812345678', 1, '独家赠送仙女山冰雪城室内滑雪场滑雪一小时+玻璃观景眺台，透视绝壁下280米深的亚洲最大天生桥群景观！', '/upload/img/product/small/m37e0bed5f73a83d4684472698191a6d1e.jpg', 5);
INSERT INTO `product` VALUES (358, '【旅展 漫游厦门·畅玩鼓浪屿高铁3天】南普陀 厦门大学 2晚厦门特色客栈 半天自由时间【广州出发】', 999, '13812345678', 1, '鼓浪屿，中山路，南普陀寺，环岛路，曾厝垵，厦门大学，漫步海上花园，寻幽万国建筑。著名小吃如土笋冻，海蛎煎，叶氏麻糍！', '/upload/img/product/small/m31b7e6805e116982076fa15ece3c515a1.jpg', 5);
INSERT INTO `product` VALUES (359, '【春节 年味江西三清山+庐山+婺源 高铁4天】体验新春包艾果 放鞭炮【三清山脚升级一晚超豪华酒店】', 2499, '13812345678', 1, '全程豪华酒店，三清山脚升级一晚超豪华酒店；品尝婺源农家宴、三清山生态宴；特色安排：放烟花、打炮竹，篁岭体验包艾果，祈福迎春，感受浓浓的年味！', '/upload/img/product/small/m37bd8032ed701e2b91f0d094c2d4c564e.jpg', 5);
INSERT INTO `product` VALUES (360, '（踏青赏花）【日出黄山·超值三省联游】安徽大美黄山 江西仙境三清山 浙江衢州龙游石窟 婺源篁岭油菜花 瓷都景德镇双飞五天', 1899, '13812345678', 1, '徽商文化，解析徽派建筑—婺源，景德镇赏千年陶瓷文化！包机独家线路：直飞景德镇往返，更舒适，时间更充裕。', '/upload/img/product/small/m35e5be6dbc9c2e4a43c8b7e146eb1c63e.jpg', 5);
INSERT INTO `product` VALUES (361, '【春节新疆：乌鲁木齐+天山天池+鄯善库姆塔格沙漠+坎儿井 双飞5天】直飞往返.升级一晚超豪华酒店【超贵团】', 2880, '13812345678', 1, '专业导游使你的旅程更舒心！广州直飞，早对晚航班，行程游玩时间更充足！', '/upload/img/product/small/m3b73ad0712746ef03019e34fb9757401d.jpg', 5);
INSERT INTO `product` VALUES (362, '（佛山出发）华东五市：船游兴化千垛油菜花、南京牛首山朝圣、扬州瘦西湖+早茶宴、无锡太湖鼋头渚、溧阳南山竹海挖嫩笋、苏州园林双飞纯玩六天', 1999, '13812345678', 1, '【烟花3月醉美江南•春花烂漫赏花季】南京（中山陵、瞻园、夫子庙风光带、玄武湖）、扬州（东关街）、溧阳（南山竹海）、兴化（千岛剁田）、无锡（鼋头渚）', '/upload/img/product/small/m345488297fe7cd6a0b236a0cbfd16f729.jpg', 5);
INSERT INTO `product` VALUES (363, '【皇牌新疆：乌鲁木齐+天山天池滑雪+库姆塔格沙漠+坎儿井+火焰山+吐鲁番 双飞五天 亲子游】直飞往返·景点全含 全程超豪华酒店 无自费压力 尽享滑雪乐趣【顶贵团】', 4999, '13812345678', 1, '全程入住超豪华酒店；全程0自费，亲身体验国内最好的滑雪场地，特别天山安排滑雪！行走世界唯一与城市相连的沙漠库姆塔格沙漠，探秘古楼兰消失的最后一片圣地！', '/upload/img/product/small/m3d3b7e41457ca4476f1eb0fe76e6dcac9.jpg', 5);
INSERT INTO `product` VALUES (364, '【新疆乌鲁木齐+雪乡喀纳斯+吐鲁番+鄯善沙漠 双飞双卧5天戏雪之旅】直飞乌鲁木齐 早对晚航班【贵宾团】', 5999, '13812345678', 1, '品尝新疆特色美食——抓饭、拌面、大盘鸡，让你的舌头去旅行；入住当地四星未挂牌标准+1晚禾木小木屋+2晚火车硬卧，行程更舒适！', '/upload/img/product/small/m3b08e4d7f21ac03d7c759446017cc33c4.jpg', 5);
INSERT INTO `product` VALUES (365, '【新品 山西太原+太行山+五台山+平遥古城 双飞5天】太行山通天峡大峡谷山水世界 绝美挂壁公路 晋商民俗常家庄园【纯玩.贵宾团】', 1999, '13812345678', 1, '全程豪华酒店，体验一晚平遥民俗客栈！ 春季冰山水世界，一生必去的太行山大峡谷、挂壁公路视觉盛宴，亲临佛教圣地五台山，祈福平安。', '/upload/img/product/small/m35cfd19f76b6135fa6e20453462b4672e.jpg', 5);
INSERT INTO `product` VALUES (366, '【山西太原+悬空寺+五台山+平遥古城+常家庄园+大同 双飞5天】佛国圣地祈福.北魏古都探秘.逛古城住客栈.三晋地道美食【贵宾团】', 1999, '13812345678', 1, '四大体验：佛国圣地祈福：佛教圣地五台山，智慧文殊祈福平安幸福，点灯、绕塔、品素斋，禅修文化体验；独家安排：山西常家庄园赏杏花！', '/upload/img/product/small/m319eedc28a703d18423fef5cdac5c67e8.jpg', 5);
INSERT INTO `product` VALUES (367, '【特惠山西：五台山+太原+平遥古城 双飞五天 贵宾团】山西博物院 五台山祈福.常家庄园赏杏花', 1899, '13812345678', 1, '山西常家庄园赏杏花，浓艳秀美的朵朵杏花掩映在古朴典雅的亭台楼阁之间；乐享初春幸福汇主题活动，民俗剪纸、面食制作、才艺表演、扭秧歌、唱民歌！', '/upload/img/product/small/m3013b314280b1da09fae1fbb3de70d35c.jpg', 5);
INSERT INTO `product` VALUES (368, '【经典山西：壶口瀑布赏“桃花汛”+五台山+平遥古城 双飞五天】荷花园温泉 常家赏杏花 太原【贵宾团】', 1999, '13812345678', 1, '全程入住豪华酒店，体验一晚平遥民俗客栈，享受襄汾荷花园温泉酒店。', '/upload/img/product/small/m376e20eb3585db8de742aa741f0309afe.jpg', 5);
INSERT INTO `product` VALUES (369, '【武汉赏樱线 高铁3天】武汉大学樱园 东湖磨山樱花园 湖北省博物馆 东湖“听涛”风景区 江口江滩 归元禅寺 晴川阁赏樱【贵宾团 4钻】', 1799, '13812345678', 1, '全程0购物，0自费，0加点！三月武汉大学赏樱之旅；亲临【湖北省博物馆】观摩“越王勾践剑”；走进【东湖磨山樱花园】仿佛跨进日式园林，5000株樱花竞吐芬芳，给人以置身东瀛的错觉；', '/upload/img/product/small/m3456adc3fa8dac62dd9f5f1abee71dd77.jpg', 5);
INSERT INTO `product` VALUES (370, '【女士立减200 张家界大峡谷+黄龙洞油菜花海+矮寨大桥+凤凰古城 玻璃桥VS悬崖栈道 高铁四天 B线顶贵团】包场《烟雨张家界》【豪叹无自费+独家韩式全地暖酒店】', 1199, '13812345678', 1, '￥100再升级一晚顶级国际奢华集团品牌—洲际-皇冠假日酒店；赠送每位女王优雅民族风薄披巾一条，油菜花儿开，伊人丛中笑，拍照巨美的道具哦！', '/upload/img/product/small/m3c9c87a1175252d187eb8c4bc228c317d.jpg', 5);
INSERT INTO `product` VALUES (371, '【女士立减300 张家界森林公园+大峡谷玻璃桥+凤凰古城 高铁4天 A线顶贵团】袁家界悬浮山 杨家界 金鞭溪 墨戎苗寨【印象鲵宴+超豪酒店+尊属VIP楼层】', 1299, '13812345678', 1, '安排金牌导游；全程超豪华酒店，独家尊享金马VIP贵宾专用楼层。独家享用土家风味—印象鲵宴-赶年宴（588元/桌）品美容养颜汤，品湘西地道美食。', '/upload/img/product/small/m39428c374b8f8debe994cfbff6de4a3db.jpg', 5);
INSERT INTO `product` VALUES (372, '【春节 陕西私家小团 双飞五天 顶贵团】古都西安 法门寺 袁家村 汉城湖 兵马俑 西岳华山 秦岭滑雪 大小雁塔 【游新春灯会 秦岭滑雪 入住5星酒店 品美食】', 4999, '13812345678', 1, '观摩“世界第八大奇迹”——【兵马俑】，领略秦王军阵雄风； 问鼎五岳之巅【西岳华山】，回味金庸笔下的侠客柔情！全程入住超豪华5星酒店，高端就此区分！', '/upload/img/product/small/m3e92a5813376e788457b488dc1c686499.jpg', 5);
INSERT INTO `product` VALUES (373, '【立减￥100 2月神农架滑雪 双飞四天 早对早直飞宜昌】神农架自然保护区 官门山 神农架滑雪场 大熊猫馆 三峡大坝【贵宾团】', 3199, '13812345678', 1, '直飞宜昌，东航早对早航班；神农架滑雪场滑雪；全程入住当地豪华酒店 ！', '/upload/img/product/small/m30f94dad08c676141916d1737078a8d8e.jpg', 5);
INSERT INTO `product` VALUES (374, '【特惠 华东五市+乌镇+南浔 双飞6天】苏州园林 观G20峰会博览中心 灵山祈福【升级1晚豪华酒店】', 1099, '13812345678', 1, '特别安排品尝南京咸水鸭、无锡酱排骨、杭州东坡肉等等；特别赠送：钱江新城【城市阳台】观杭州G20标志建筑！', '/upload/img/product/small/m3c448e5f5c39ecb30d560b6c2f75aa6a9.jpg', 5);
INSERT INTO `product` VALUES (375, '【寻梦丝路·甘肃兰州+敦煌+张掖 双飞单高单卧6天】兰州黄河风情线 敦煌莫高窟 敦煌博物馆 嘉峪关城楼 张掖丹霞地质公园', 2699, '13812345678', 1, '广州直飞兰州往返，乘坐丝绸之路旅游列车，穿越河西走廊，感受千年丝路风情；乘坐兰新高铁，穿越祁连山，观赏冬季天境祁连风光；全程纯玩，不进购物店，轻松游玩大西北！', '/upload/img/product/small/m34b223e87d54d5d5cf8bb4355a9a58d93.jpg', 5);
INSERT INTO `product` VALUES (376, '【湖北恩施+山城重庆+宜昌三峡大坝 双高单飞四天】湖北恩施大峡谷 女儿城 土司城 云龙河地缝 重庆白公馆 解放碑 洪崖洞 磁器口古镇', 2099, '13812345678', 1, '重庆入住豪华酒店，恩施1晚入住特色客栈，升级1晚恩施当地超豪华酒店，尊贵享受！', '/upload/img/product/small/m3a83f43dab8c480f4e046f3e64c16fdaf.jpg', 5);
INSERT INTO `product` VALUES (377, '双享1+2 • 三亚子悦康年+海棠湾索菲特4天3晚自由行套餐【含1晚三亚子悦康年+2晚海棠湾文理索菲特酒店+蜈支洲岛一天游+自助晚餐1次+来回机场至酒店VIP接送服务】', 1799, '13812345678', 1, '含1晚三亚子悦康年+2晚海棠湾文理索菲特酒店，蜈支洲岛一天游，含自助晚餐一次，来回机场至酒店VIP接送服务！', '/upload/img/product/small/m31b2f3e22477516410853a1f105e6aff6.jpg', 5);
INSERT INTO `product` VALUES (378, '【2-3月 直飞北京双飞6天 珠海往返】北京故宫 八达岭 颐和园 天坛 奥运场馆【高级团】需加收接送费￥200', 1299, '13812345678', 1, '一次畅游北京22大知名景点！需加收￥200接送费用！', '/upload/img/product/small/m36faf5a4db2c1c4e94d033102167a0dfe.jpg', 5);
INSERT INTO `product` VALUES (379, '【厦门+永定土楼 高铁4天 】鼓浪屿 沙坡尾 品“土楼客家家宴 海鲜餐 【“百花争艳，舞动青春”号专列·第五季 厨娘争霸 赢千元奖金】', 1099, '13812345678', 1, '第五季【最美女人·厨娘争霸赛】，将于3月25日盛大热辣开启！美俏厨娘煮动出击！厨霸可得千元现金大奖、优秀厨娘得价值388元/套精美茶具、厨娘得价值188元/套茶礼一份！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (380, '【山东+辽宁+河北+天津四省联游 火车13天】曲阜孔府 五岳之都泰安 济南大明湖 台儿庄古城 青岛栈桥 蓬莱八仙过海 大连旅顺军港 北戴河山海关 金山岭长城 承德普佑寺', 3599, '13812345678', 1, '一次畅游山东精华旅游城市、辽宁大连旅顺、河北北戴河承德、天津，轻松不走回头路！', '/upload/img/product/small/m38afd0ac156e1c099e79dc16511b8f3b6.jpg', 5);
INSERT INTO `product` VALUES (381, '【3月 广渝动车·印象武隆+仙女山+潼南油菜花+重庆 高铁5天】武隆天坑三硚 双江古镇 洪崖洞 磁器口古镇 解放碑【贵宾团】', 2199, '13812345678', 1, '体验全新开通的广渝动车，直达魅力山城重庆！加游应季中国最美花海潼南油菜花海；特别赠送重庆火锅，感受真正的吃香喝辣！', '/upload/img/product/small/m3a02b93b97f0764d6a3ac4fc75a30b495.jpg', 5);
INSERT INTO `product` VALUES (382, '【广渝动车·武隆+重庆+仙女山 高铁4天】武隆天坑三硚 洪崖洞 磁器口古镇 解放碑【贵宾团】', 1899, '13812345678', 1, '体验全新开通的广渝动车，直达魅力山城重庆！特别赠送重庆火锅，感受真正的吃香喝辣！', '/upload/img/product/small/m3325e6a8c0948ea9b1636e96b3983b21a.jpg', 5);
INSERT INTO `product` VALUES (383, '【3-4月醉美四川：成都+峨眉山+乐山大佛 双飞5天】峨眉山金顶 乐山大佛 黄龙溪古镇 锦里古街 郫县油菜花【贵宾团】', 1899, '13812345678', 1, '广州直飞成都；一价全含，峨眉山门票、乐山船票全含；全程入住豪华品质酒店！', '/upload/img/product/small/m34889f03dfae0c0b888514b1db7ba4043.jpg', 5);
INSERT INTO `product` VALUES (384, '【春节 华东四市+乌镇+南浔 •乐享迪士尼 双飞6天】赏两大夜景 玩上海迪士尼乐园 游苏州四大名园狮子林 杭州西湖【宿水乡乌镇+南浔古镇】', 3999, '13812345678', 1, '仅限除夕至年初四出发团队，享受价值188元/人迎新春晚宴（表演+晚餐），礼品送不停，精彩演出陆续有来....无压力自费项目，合理安排不紧凑，阖家欢聚时刻更充裕！', '/upload/img/product/small/m3ca551a5fd855bb72d76b7ff5ae23bf19.jpg', 5);
INSERT INTO `product` VALUES (385, '【4月 广渝动车·重庆+武隆 单飞单高4天 贵宾团】武隆天坑三硚 仙女山国家森林公园 山城重庆 洪崖洞 磁器口古镇 解放碑', 1999, '13812345678', 1, '体验全新开通的广渝动车，劲省5小时，直达魅力山城！', '/upload/img/product/small/m37e0bed5f73a83d4684472698191a6d1e.jpg', 5);
INSERT INTO `product` VALUES (386, '【漫游京城 • 寻觅京味】北京双飞5天4晚半自由行套票【含广州往返经济舱含税机票+全程入住超豪华型酒店（含早）+赠送故宫+长城一日游】', 5199, '13812345678', 1, '广州往返经济舱含税机票，全程入住超豪华型酒店，享中西自助早餐，赠送故宫+长城一日游，告别传统跟团游，行程更舒适，时间更充裕！', '/upload/img/product/small/m34a3bd4d04ba909d08a02d9ea30c6235d.jpg', 5);
INSERT INTO `product` VALUES (387, '【江西龙虎山+三清山+婺源 高铁5天】篁岭油菜花 瓷都景德镇 庐山白鹿洞 观音桥 安排龙虎山美味特色宴【超贵团】', 1999, '13812345678', 1, '特别安排婺源篁岭，带您360度高空俯瞰婺源梯田油菜花；全程入住当地豪华酒店，九江升级一晚超豪华酒店！', '/upload/img/product/small/m38567be688cb612891cc4cdfe4406dcb0.png', 5);
INSERT INTO `product` VALUES (388, '【美食山东+大连双飞7天】泉城济南 泰安泰山 曲阜古城 浪漫青岛 幸福威海 仙境蓬莱 大连旅顺【升级一晚豪华酒店】', 2399, '13812345678', 1, '品尝地道美食：济南饺子宴、泰安御膳宴、孔府什锦铜锅、青岛胶东风味宴、大连特色农家菜，特色美食享不停！升级一晚豪华酒店，享受休闲度假！', '/upload/img/product/small/m302843097a00692ec4368000b3de73c53.jpg', 5);
INSERT INTO `product` VALUES (389, '【畅享丽甸：云南丽江+香格里拉+普达措 双飞五天】丽江古城 玉龙雪山登冰川大索道 拉市海 香格里拉虎跳峡 普达措森林公园【丽江往返】', 4099, '13812345678', 1, '3晚丽江特色超豪华精品客栈+1晚升级国际品牌香格里拉希尔顿大酒店。独家安排：年初四、初五携手松赞林寺，胜请八大康参之一绒巴康参请活佛喇嘛“举办祈福法会”，每人赠送活佛开光的转经筒带回家！', '/upload/img/product/small/m3bdddf4e87f0c6726bae49a9c71311d50.jpg', 5);
INSERT INTO `product` VALUES (390, '【行摄山东+大连 双飞5天】浪漫青岛 即墨古城 荣城成山头 幸福威海 蓬莱仙境 大连旅顺【升级1晚豪华酒店】', 1999, '13812345678', 1, '不走回头路，游览辽东半岛（大连+旅顺）和山东半岛（烟台+蓬莱+青岛）两大北方重要省份！品尝特色美食：东北铁锅炖、蓬莱小面、胶东八大碗、鱼饺子宴、锅贴宴……品味不同的齐鲁美食！', '/upload/img/product/small/m382f1a4f592ab77e152fa9eb59d5eaee7.jpg', 5);
INSERT INTO `product` VALUES (391, '【湖南 “崀”漫花海：广西+湖南崀山 高铁3天·全程0自费】崀山油菜花 八角寨 天下第一巷 辣椒峰 骆驼峰 木龙湖 瑶王宴篝火晚会【超贵团】', 859, '13812345678', 1, '畅游世界自然遗产，国家地质公园，5A景区——崀山！独家安排崀山最具代表体验的价值880元/桌【崀山瑶王宴】，与瑶族阿妹饮酒欢歌特色盛宴！', '/upload/img/product/small/m3323448ad2a95ef58c1195c9e7f6a2406.jpg', 5);
INSERT INTO `product` VALUES (392, '【3-4月直飞北京 双飞5天 3钻】北京玉渊潭樱花 故宫 八达岭长城 奥运场馆【赏花专线：玉渊潭樱花 颐和园白玉兰 天坛杏花林 景山公园牡丹花】', 2299, '13812345678', 1, '春暖花开，邂逅樱花雨，游览杏花林；景山公园牡丹花，景色极佳！', '/upload/img/product/small/m3602c2a9f1a0cf10deffa55cfec7b38da.jpg', 5);
INSERT INTO `product` VALUES (393, '【3-4月北京+天津 双飞5天 豪叹喜来登 3+5钻】故宫 八达岭长城 奥运场馆 天津之眼 天津三街 周邓纪念馆【赏花专线：玉渊潭樱花 颐和园白玉兰 天坛杏花林 景山公园牡丹花】', 2199, '13812345678', 1, '春暖花开！北京升级1晚入住国际品牌超豪华酒店【喜来登】！体验单程京津城际高速列车—用时只需25分钟，穿梭北京天津两地，', '/upload/img/product/small/m36faf5a4db2c1c4e94d033102167a0dfe.jpg', 5);
INSERT INTO `product` VALUES (394, '【3-4月北京+天津 双飞5天 花开京城·豪享喜来登】故宫 八达岭长城 奥运场馆 天津之眼 天津三街 周邓纪念馆【赏花专线：玉渊潭樱花 颐和园白玉兰 天坛杏花林 景山公园牡丹花】', 1799, '13812345678', 1, '春暖花开！北京升级1晚入住国际品牌超豪华酒店【喜来登】！体验单程京津城际高速列车—用时只需25分钟，穿梭北京天津两地，', '/upload/img/product/small/m34a3bd4d04ba909d08a02d9ea30c6235d.jpg', 5);
INSERT INTO `product` VALUES (395, '【佛山出发 贵州+云南罗平油菜花 高铁5天】贵州乌蒙滑雪场滑雪 黔灵山公园 黔西南兴义【+1元升级超豪华酒店-当滑雪遇上花海】', 1899, '13812345678', 1, '3小时西南最高操场的滑雪场【乌蒙滑雪场】尽情嗨！品贵阳地道特色宴【贵阳酸汤鱼】【正宗羊肉汤锅】；豪叹三晚当地超豪华度假酒店，享受美好品质旅行！', '/upload/img/product/small/m3180b564776c1e140b73f15de5f3a5312.jpg', 5);
INSERT INTO `product` VALUES (396, '【3-4月 北京赏花+秦皇岛 双飞6天 3钻】山海关 北戴河海滨浴场 玉渊潭樱花 颐和园 景山公园 故宫 八达岭 天坛 奥运场馆 什刹海', 2299, '13812345678', 1, '特别加游天下第一关：山海关；长城最东起点入海段长城：老龙头；不一样的北边大海沙滩：北戴河海滨浴场；加游全国三大樱花基地之一：玉渊潭樱花！', '/upload/img/product/small/m37a0d7ca230ff725a157f8c1f1592e8f8.jpg', 5);
INSERT INTO `product` VALUES (397, '【3-4月 北京赏花+秦皇岛 双飞六天 3钻】玉渊潭樱花 颐和园 景山公园 故宫 八达岭 天坛 奥运场馆 什刹海 山海关 北戴河海滨浴场', 1599, '13812345678', 1, '特别加游天下第一关——山海关，长城最东起点入海段长城——老龙头，不一样的北边大海沙滩——北戴河海滨浴场；加游全国三大樱花基地之一 ——玉渊潭樱花；登上景山至高处，可一览紫禁城全景的壮观景象！', '/upload/img/product/small/m3ae1f3a49daf6ff79871f6211d49e9c26.jpg', 5);
INSERT INTO `product` VALUES (398, '【陕西西安+青龙寺赏花 双飞5天 顶贵团】古都西安 法门寺 袁家村 兵马俑 华清宫 西岳华山 大小雁塔【私家小团 品尝特色餐 全程超豪华酒店】', 3699, '13812345678', 1, '问鼎五岳之巅——【西岳华山】，回味金庸笔下的侠客柔情！升级4晚五星超豪华标准酒店！', '/upload/img/product/small/m3ea92816a6378ea6d6ba4c49e6fc6fbc3.jpg', 5);
INSERT INTO `product` VALUES (399, '【中原全景：陕西+河南 双飞5天】陕西西安 兵马俑 西岳华山 青龙寺赏花 河南郑州 洛阳龙门石窟 嵩山少林寺 宋城开封【顶贵团】', 3399, '13812345678', 1, '两省精华景点、四大文明古都，一次旅行尽览“西京长安、东京洛阳、商城郑州、宋城开封”；全程升级四晚超豪华标准酒店，高端就此区分！', '/upload/img/product/small/m3145a0d023af6818fea166ee33880cd87.jpg', 5);
INSERT INTO `product` VALUES (400, '【中原全景：陕西+河南双飞5天】西安兵马俑 西岳华山 青龙寺赏花 郑州 洛阳龙门石窟 嵩山少林寺 开封【贵宾团】', 3099, '13812345678', 1, '两省精华景点，一次旅行尽览“西京长安、东京洛阳、商城郑州、宋城开封”！全程升级四晚豪华酒店，舒适之旅！', '/upload/img/product/small/m329417d0ce48c867d55038ab39779fef3.jpg', 5);
INSERT INTO `product` VALUES (401, '【陕西西安+延安+壶口瀑布+西岳华山 双飞5天】青龙寺樱花 黄帝陵轩辕庙 黄河壶口瀑布 兵马俑【延安往返 贵宾团】', 2899, '13812345678', 1, '升级四晚入住豪华酒店！观摩“世界第八大奇迹”——【兵马俑】，领略秦王军阵雄风！', '/upload/img/product/small/m3e92a5813376e788457b488dc1c686499.jpg', 5);
INSERT INTO `product` VALUES (402, '【云南普者黑 赏十里桃源 高铁4天】泛舟普者黑 探访三生三世影视拍摄地 赏樱花谷 天鹅湖 登青龙山 彝族篝火晚会', 1999, '13812345678', 1, '一次畅游《三生三世十里桃花》取景地-菜花箐，拍摄醉美普者黑日出日落之地-青龙山，《爸爸去哪儿》拍摄地-天鹅湖景区，普者黑经典景区-激情柳叶小舟划船！', '/upload/img/product/small/m32abbafaca26330f294c121341cc0f064.jpg', 5);
INSERT INTO `product` VALUES (403, '【广渝专列：重庆+武隆 高铁5日】武隆天生三桥 彭水九黎城 摩围山 芭拉胡 乌江画廊 酉阳桃花源 龚滩古镇 洪崖洞 解放碑', 1899, '13812345678', 1, '渝东南联游：重庆、彭水、黔江、酉阳、龚滩、南川，秘境探奇；一晚超豪华温泉酒店，一晚入住龚滩古镇特色吊脚楼，赏古镇依山傍水的迷人夜色；包含乌江画廊游船，千里乌江，百里画廊邀您同醉！', '/upload/img/product/small/m35f2bebadf1ca01e9407ecffd3bf8f5ef.jpg', 5);
INSERT INTO `product` VALUES (404, '【寻摄云南：轿子雪山+东川红土地+元谋土林+圆通山樱花 高铁6天】寻摄云南滇中奇景•金马专场奇技Show【纯玩超贵团】', 2599, '13812345678', 1, '一价全包无自费！寻摄滇中圣山轿子雪山、色彩绚丽的东川红土地以及千奇百怪的元谋世林，地道优宿+温泉SPA：升级昆明1晚超豪华温泉酒店，豪叹极致的温泉SPA！', '/upload/img/product/small/m39903f7a29048bdd7fbc1e8403f4ca057.jpg', 5);
INSERT INTO `product` VALUES (405, '【陕西西安+西岳华山+黄河壶口冰瀑+延安 双飞5天】兵马俑 青龙寺赏樱花 黄帝陵【西安往返】', 3099, '13812345678', 1, '升级四晚入住豪华酒店！观摩“世界第八大奇迹”——【兵马俑】，领略秦王军阵雄风！', '/upload/img/product/small/m3e92a5813376e788457b488dc1c686499.jpg', 5);
INSERT INTO `product` VALUES (406, '【2月 尽享奢华 •戏雪北京】北京5天4晚自由行酒店套票【含4晚入住雅辰悦居酒店，享双人自助早餐，独家赠送房间mini吧一次+丰台长辛店冰雪嘉年华2大1小套票】', 1899, '13812345678', 1, '超豪华型品牌酒店，精选酒店邻近地铁站，著名景点、餐饮、娱乐中心咫尺之遥。独家赠送八达岭长城、鸟巢水立方一日游（含午餐）！', '/upload/img/product/small/m3d97f3c41f82329b7a45e67e9de2c96ca.jpg', 5);
INSERT INTO `product` VALUES (407, '【华东五市+夜宿乌镇 双飞6天】春游西湖放风筝 江南双夜色乌镇西栅+禅意拈花湾 上海外滩 G20新杭城【金马自营】', 1699, '13812345678', 1, '特别安排入住1晚拈花湾景区内豪华特色客栈，专属通道及专属电瓶车接送景区门口到酒店；特别安排在西湖边放风筝，迎着江南温柔的春风，与家人、好友一起，放飞心情，春游拾趣！', '/upload/img/product/small/m30164d93d7c0a1283cd9d664ffb74cb3f.jpg', 5);
INSERT INTO `product` VALUES (408, '【春节 滑雪+云南罗平 高铁5天】贵阳黔灵山公园 乌蒙滑雪场滑雪 贵州黔西南兴义 云南罗平油菜花海【1晚温泉度假酒店】', 1799, '13812345678', 1, '豪叹三晚当地超豪华度假酒店，安排一晚温泉度假酒店，享受美好品质旅行！', '/upload/img/product/small/m3fb75c5e8b6c0ca4b851c98a6c709b7fb.jpg', 5);
INSERT INTO `product` VALUES (409, '【3月·武汉樱花盛开】湖北省博物馆 户部巷 武汉 黄鹤楼 半自由高铁三天团【全程入住豪华酒店】', 1899, '13812345678', 1, '全程入住豪华酒店，豪华舒适；武汉精华景点荟萃：【黄鹤楼】、【湖北省博物馆】、【户部巷】；时间充足、轻松安排自己行程赏闻名国内外的武汉樱花！', '/upload/img/product/small/m3456adc3fa8dac62dd9f5f1abee71dd77.jpg', 5);
INSERT INTO `product` VALUES (410, '【3月湖南崀山+广西 漫游油菜花花海 高铁3天 全程0自费】八角寨 天下第一巷 辣椒峰 骆驼峰 木龙湖 瑶王宴篝火晚会【贵宾团】', 799, '13812345678', 1, '畅游世界自然遗产，国家地质公园，5A景区——崀山！独家安排崀山最具代表体验的价值880元/桌【崀山瑶王宴】，与瑶族阿妹饮酒欢歌特色盛宴！', '/upload/img/product/small/m3323448ad2a95ef58c1195c9e7f6a2406.jpg', 5);
INSERT INTO `product` VALUES (411, '【玩转云南：丽江+大理+昆明 双飞6日】丽江古城 玉龙雪山冰川公园 拉市海 大理古城 洱海敞篷车【超贵团】', 3199, '13812345678', 1, '全程入住豪华型酒店，昆明升级入住当地超豪华温泉酒店！', '/upload/img/product/small/m3e31ced52280430a63722deaec010dda9.jpg', 5);
INSERT INTO `product` VALUES (412, '【全景精华：云南香格里拉+丽江+大理+昆明 双飞6天】普达措国家公园 虎跳峡 玉龙雪山 丽江古城 大理古城 洱海敞篷车 昆明路南石林【超贵团】', 4199, '13812345678', 1, '升级昆入丽出/丽入昆出，不走回头路；全程入住当地超豪华酒店，舒适住宿！', '/upload/img/product/small/m3420d7f66c7aec9d0cf5c2654aa973f8c.jpg', 5);
INSERT INTO `product` VALUES (413, '【春节 广渝动车·武隆+重庆 高铁4天】山城重庆 武隆天坑三硚 仙女山国家森林公园滑雪 洪崖洞 磁器口古镇 解放碑【纯玩贵宾团】', 2099, '13812345678', 1, '体验全新开通的广渝动车，劲省5小时，直达魅力山城——重庆!赠游玻璃观景眺台，透视绝壁下280米深的亚洲最大天生桥群景观;前往仙女山滑雪场赠送1小时滑雪，让滑雪不用远飞千里 !', '/upload/img/product/small/m3a83f43dab8c480f4e046f3e64c16fdaf.jpg', 5);
INSERT INTO `product` VALUES (414, '【湖北全景：神农架+大九湖+恩施大峡谷+三峡 双飞5天】女儿城 云龙河地缝【贵宾团】', 2399, '13812345678', 1, '游览小桥+流水+人家+小吃共同组成的天然世外桃源——天生桥；电影《三生三世十里桃花》取景地-恩施大峡谷；恩施土家最负盛名的特色民俗相亲活动—女儿会！', '/upload/img/product/small/m341f683b7120f1694ea9cf0e251221f06.jpg', 5);
INSERT INTO `product` VALUES (415, '【山西太行山+五台山+平遥古城+常家庄园 双飞6天】通天峡大峡谷冰雪世界 绝美挂壁公路 体验晋商民俗', 1999, '13812345678', 1, '中国最美十大峡谷之一太行山大峡谷通天峡景区尽享冰雪乐趣。游绝美挂壁公路、佛国圣地五台山。乐享初春民俗剪纸、捏花馍、才艺表演、扭秧歌， 感受自然奇观与人文历史的完美结合！', '/upload/img/product/small/m3013b314280b1da09fae1fbb3de70d35c.jpg', 5);
INSERT INTO `product` VALUES (416, '【春节 云南昆明+大理+丽江双飞6天 昆明往返】昆明路南石林 大理花语牧场 丽江玉龙雪山 滇池大坝 休闲双古城', 4199, '13812345678', 1, '昆明往返，纯玩不购物；畅游千年古镇：5A丽江古城、大理古城、玉龙雪山、路南石林、花语牧场！ 全程入住当地豪华酒店！', '/upload/img/product/small/m3de51fe9d86478b06e9d7a0ea07268b2b.jpg', 5);
INSERT INTO `product` VALUES (417, '【春节 云南丽江+大理+昆明 高铁7天】香格里拉 石卡雪山 虎跳峡 丽江古城 拉市海 大理 洱海公园 花语牧场 昆明红嘴鸥【登峰玩雪•温泉SPA•河灯许愿超贵团】', 5799, '13812345678', 1, '新春玩转云南地道景点，品味地道美食，享受地道温泉；门票一价全包，登峰玩雪==登顶香格里拉藏族神山：石卡雪山，冬季玩雪圣地；藏式祈福，走进藏区古镇独克宗，转动世界最大转经筒，祈福新年大吉！', '/upload/img/product/small/m396e332e6fe9c1a7396837bd17730c47f.jpg', 5);
INSERT INTO `product` VALUES (418, '【3月湖北恩施大峡谷+宜昌+两坝一峡 双飞4天】土司城 女儿城 云龙河地缝【贵宾团】', 1999, '13812345678', 1, '直飞宜昌往返，节省15小时车程，旅途更舒适；升级1晚恩施当地超豪华酒店！', '/upload/img/product/small/m341f683b7120f1694ea9cf0e251221f06.jpg', 5);
INSERT INTO `product` VALUES (419, '三亚海棠湾·亚特兰蒂斯度假酒店 3天2晚自由行套餐【含广州往返经济舱含税机票+2晚三亚亚特兰蒂斯度假酒店海景房（含早）+VIP专车接送机服务】', 4699, '13812345678', 1, '含广州往返经济舱含税机票，每日自助早餐，2晚三亚亚特兰蒂斯度假酒店海景房，VIP专车接送机服务！', '/upload/img/product/small/m3540ae74a316311404126b408ed03d731.jpg', 5);
INSERT INTO `product` VALUES (420, '【春节 越南岘港+下龙湾+河内 双高双飞6天】美溪海滩 会安古城 船游下龙湾 山茶半岛【南北越联游】', 3199, '13812345678', 1, '游览媲美夏威夷海滩的度假胜地【岘港】！漫步体验越南政治中心百花春城【河内】！不走回头路！特别安排岘港一天自由活动，漫步世界六大最美丽的海滩【美溪海滩】！', '/upload/img/product/small/m3f8fceb05373509d23444720352c903e8.jpg', 5);
INSERT INTO `product` VALUES (421, '【3月湖北武汉+东湖樱花+恩施恩大峡谷+三峡大坝 单卧单飞5天】户部巷风情街 湖北省博物馆 楚河汉街 土司城 土家女儿城 【品全鱼宴 品尝特色“摔碗酒”】', 2199, '13812345678', 1, '游览中国最大的樱花园·东湖磨山樱花，中国最大的樱花园，5000株樱花竞吐芬芳，给人幻境般的感觉。电影《三生三世十里桃花》取景地【湖北恩施大峡谷】，被专家誉为与美国科罗拉多大峡谷难分伯仲；', '/upload/img/product/small/m3a4a779ae66c256ebb6c4409d6f5d6ca2.jpg', 5);
INSERT INTO `product` VALUES (422, '【2-3月 山东环游+辽宁大连 双飞七天】曲阜孔府 泰安泰山 泉城济南 欧式青岛 幸福威海 蓬莱仙境 大连旅顺', 2699, '13812345678', 1, '升级1晚超豪华酒店；品尝特色农家菜、青岛锅贴宴、养生生态宴、曲阜铜锅宴、济南鲁西南风味宴餐餐特色美食！', '/upload/img/product/small/m3fc57a9c3b08b5bb6146117d5b16c0cb0.jpg', 5);
INSERT INTO `product` VALUES (423, '【预售 越南船游下龙湾+芒街+河内 双飞4天 南航往返】巴亭广场 镇国寺 【享越式炸鸡火锅宴】', 799, '13812345678', 1, '南航正点航班往返1小时直达南宁！包船游—联合国教科文组织誉为世界自然遗产亦有海上桂林美誉的【下龙湾】！', '/upload/img/product/small/m324f5f9fd36d11ac7730a6a927e35ef6d.jpg', 5);
INSERT INTO `product` VALUES (424, '【春节 广西北海 双飞4天·叹超豪华酒店+南航往返】钦州 八寨沟 北海银滩【贵宾团】', 1899, '13812345678', 1, '南航飞机直达北海不用1个半小时，畅游真正“天下第一滩”北海十里银滩！漫步北海老街，探秘南迈渔村！', '/upload/img/product/small/m39e0caefe49275de05203249776afa9b3.jpg', 5);
INSERT INTO `product` VALUES (425, '【春节桂林+阳朔 高铁3天 豪叹大公馆·全程0自费】訾洲象鼻山 船游兴坪漓江 《山水间》表演 银子岩 遇龙河风光 浪漫西街【超贵团】', 1229, '13812345678', 1, '全程入住超豪华酒店！桂林指定入住超豪华度假酒店【桂林大公馆】，叹享绝美山水梦境！', '/upload/img/product/small/m3ec4a602492df72816ec03871f2bb59df.jpg', 5);
INSERT INTO `product` VALUES (426, '三亚·康年酒店2晚自由行酒店套票【含两晚豪华海景房（含双早）+豪华帆船出海体验+星级酒店自助晚餐一天游+三亚国际免税店免费往返穿梭巴士】', 1099, '13812345678', 1, '含两晚豪华海景房（含双早）+豪华帆船出海体验+星级酒店自助晚餐一天游+三亚国际免税店免费往返穿梭巴士！', '/upload/img/product/small/m31b2f3e22477516410853a1f105e6aff6.jpg', 5);
INSERT INTO `product` VALUES (427, '【春节 贵州黄果树大瀑布+荔波小七孔+西江千户苗寨 高铁5天·升级一晚超豪华】天星桥 陡坡塘瀑布 丹寨万达小镇 贵阳青岩古镇', 2799, '13812345678', 1, '住宿升级：入住两晚准四豪华酒店+升级一晚超豪华酒店，西江入住景区特色客栈！品尝地道美食：品尝西江长桌宴、黄果树土鸡宴，感受当地贵州美食！', '/upload/img/product/small/m322e835000a086328e8de69b5fd9f68ee.jpg', 5);
INSERT INTO `product` VALUES (428, '三亚湾·胜意海景度假酒店2晚自由行酒店套票【含两晚豪华胜景房（含双早）+1次胜意大酒店BBQ自助晚餐+三亚国际免税店免费往返穿梭巴士】', 699, '13812345678', 1, '含两晚豪华胜景房（含双早）+1次胜意大酒店BBQ自助晚餐+三亚国际免税店免费往返穿梭巴士！', '/upload/img/product/small/m3b0cfc51a46104ff8fafcf6692eb4ad64.jpg', 5);
INSERT INTO `product` VALUES (429, '【春节 甘肃兰州+西宁青海湖+张掖七彩丹霞+敦煌莫高窟 三飞单动6天】游览兰州黄河风情线 嘉峪关城楼 鸣沙山月牙泉', 3999, '13812345678', 1, '西宁-张掖乘坐动车，动车穿越祁连山山脉，体验西北高铁之旅！西宁【青海湖】被称为《中国国家地理》杂志评为中国最美的五大湖之一、中国最大的咸水湖泊；', '/upload/img/product/small/m34c5ad879aa37ed3b067f2adc0fabec15.jpg', 5);
INSERT INTO `product` VALUES (430, '【山东青岛+大连 双飞五天】蓬莱仙境 幸福威海 大连旅顺 体验大连老式有轨电车【纯玩 美食之旅】', 1999, '13812345678', 1, '进入西方拉姆酒庄的酒庄城堡，品尝真正的橡木桶窖藏六年的法国原浆葡萄酒！品尝特色美食：东北农家宴、炕上东北菜、胶东风味餐、特色阿胶宴！', '/upload/img/product/small/m3f44a47d91cb6cb8c74b4f7cd5d430152.jpg', 5);
INSERT INTO `product` VALUES (431, '【3月 山东济南+泰山+曲阜古城+青岛+威海+蓬莱 双飞6天】行摄“世界天鹅故乡”—烟墩角 游历明清小城—青州古城', 1999, '13812345678', 1, '赠送观看非物质文化遗产演出——【泰山皮影戏】！品尝精选美食南饺子宴、青岛锅贴宴、泰安煎饼卷大葱、胶东烟墩角渔家风情美食……', '/upload/img/product/small/m382f1a4f592ab77e152fa9eb59d5eaee7.jpg', 5);
INSERT INTO `product` VALUES (432, '【海南三亚+兴隆 双飞4天 直飞博鳌】醉美西岛 三亚亚龙湾沙滩 天涯海角 大东海 椰田古寨 博鳌玉带滩【惠贵团】', 1699, '13812345678', 1, '游玩醉美分界洲，天下第一滩“亚龙湾沙滩”，赏花玫瑰谷，潜水基地‘大东海’、天涯海角等精华景点；入住2晚豪华旅游度假酒店；报名即送新春大礼包一份！', '/upload/img/product/small/m3dc9f22d10070d66a939555d3e63aaef2.jpg', 5);
INSERT INTO `product` VALUES (433, '【尊享云南：昆明九乡+大理洱海+丽江玉龙冰川大索道 双飞六天】洱海拉风敞篷车 花语牧场 逛双古城【纯玩 不走回头路 丽进昆出】', 3999, '13812345678', 1, '当地超豪华酒店+2晚丽江古城超豪华精品客栈+1晚大理超豪华洱海主题酒店！尽享美食：全程高餐标、特别安排丽江山林土鸡宴、大理网红特色餐厅、野生菌火锅！', '/upload/img/product/small/m3de51fe9d86478b06e9d7a0ea07268b2b.jpg', 5);
INSERT INTO `product` VALUES (434, '【寒假：桂林+全州滑雪 高铁3天·豪叹喜来登·0自费】湘山寺 镇湘塔 訾洲岛 城徽象鼻山【品全州醋血鸭+专场自助晚宴】', 1099, '13812345678', 1, '包含天湖冰雪世界滑雪套票价值368元/人，品尝全州名菜醋血鸭+喜来登专场自助晚宴；全程超豪华酒店；送价值268元乳胶U形枕！', '/upload/img/product/small/m3c1ba05da8b7267e4c0bb1bcfee0f2f0b.jpg', 5);
INSERT INTO `product` VALUES (435, '【江西庐山+福建武夷山+婺源油菜花+景德镇+南昌 高铁6天】赠送梦里老家•演艺小镇带你穿越古今【福赣联游 升级一晚南昌超豪华酒店】', 3099, '13812345678', 1, '一次性畅游两大名山：武夷山、庐山；赏醉美乡村婺源一年最美踏春处——篁岭梯田油菜花，让您过足“赏花瘾” ！ 全程入住豪华酒店，升级一晚超豪华酒店！', '/upload/img/product/small/m3855c0ca36fc6059a6e54c6c35fc474f8.jpg', 5);
INSERT INTO `product` VALUES (436, '【江西婺源江岭油菜花+景德镇 高铁3天 纯玩品质团】屯溪黎阳In巷 宋代彩虹桥 特别安排品尝特色徽宴', 2099, '13812345678', 1, '全程纯玩无购物！婺源春季最美旅游地——江岭油菜花地；游览自古文风鼎盛、人才辈出、著名的徽派建筑——李坑村；', '/upload/img/product/small/m358bff0bceeb908789e4f321652693fb1.jpg', 5);
INSERT INTO `product` VALUES (437, '【江西婺源江岭油菜花+景德镇+三清山 高铁4天】李坑 宋代彩虹桥【品尝徽菜 体验打糍粑民俗赠游婺源：梦里老家•演艺小镇】', 2349, '13812345678', 1, '游玩婺源春季最美旅游地：江岭油菜花地；全程入住豪华酒店，升级一晚超豪华酒店；赠送景点【梦里老家•演艺小镇】挖掘徽州文化精髓，体味古今历史活文化；特别安排徽州—特色徽宴！', '/upload/img/product/small/m358bff0bceeb908789e4f321652693fb1.jpg', 5);
INSERT INTO `product` VALUES (438, '【贵州专列3·玩转航拍 荔波大小七孔+西江千户苗寨 高铁6天】平坝万亩樱花 船游毕节威宁草海 贵定音寨“金海雪山”花海·摄影之旅【金马自营】', 2999, '13812345678', 1, '升级一晚织金超豪华酒店！【使用飞天航拍器，配置专业摄影人员跟队指导】全景直击音寨“金海雪山”油菜花海以及平坝万亩樱花高空俯瞰盛况！', '/upload/img/product/small/m3f42939e7991367d0120c7e49fdefeaa9.jpg', 5);
INSERT INTO `product` VALUES (439, '【江西庐山+安徽黄山+婺源油菜花+景德镇+南昌 高铁五天】赏醉美油菜花 赠送游览梦里老家•演艺小镇+石钟山 【徽赣联游】', 2899, '13812345678', 1, '一次性畅游赣、皖两省精华景区，不留遗憾；赏乡村婺源一年最美踏春处——篁岭梯田油菜花，让您过足“赏花瘾” ！ 全程入住豪华酒店，升级一晚超豪华酒店！途中贴心为您准备当地小零食：皇菊茶，茶饼……', '/upload/img/product/small/m347cc17d669c313c534ac8a9570bde7ef.jpg', 5);
INSERT INTO `product` VALUES (440, '【除夕专场 莽山+寻雾东江湖 高铁3天 享原生态冰雪森林温泉 顶贵团】鬼子寨 天台山 猴王寨 自然博物馆【高餐标新年晚宴+超豪华国际酒店】', 1999, '13812345678', 1, '独家首创“画中游”游览方式—-徒步醉美小东江景区，颁发徒步证书；全程入住国际奢华品牌酒店---温德姆至尊豪庭酒店+莽山森林温泉酒店！', '/upload/img/product/small/m34e24944a3f5e48209cc729a86620ba18.JPG', 5);
INSERT INTO `product` VALUES (441, '【华东五市+乌镇+七宝古镇+西塘 双飞6天】鼋头渚赏樱花 禅意小镇拈花湾 梵天花海 漫步西湖 【加1元换购三大胜景：上海金茂大厦+船游古运河听评弹+拈花湾灯光秀】', 1999, '13812345678', 1, '加1元换购价值520元三大夜景：上海金茂大厦88层夜景、苏州古运河（含船）、拈花湾禅意秀！', '/upload/img/product/small/m3c448e5f5c39ecb30d560b6c2f75aa6a9.jpg', 5);
INSERT INTO `product` VALUES (442, '【春节 西宁+拉萨+林芝+巴松措+雅鲁藏布大峡谷 三飞一卧7天】青藏铁路景观带 青海湖 拉萨布达拉宫 苯日神山 雅鲁藏布大峡谷', 8899, '13812345678', 1, '青藏铁路【有氧车厢】进入西藏，观赏青藏铁路世界级景观！林芝飞回，省却回头路。西藏段升级国际品牌五星标准【拉萨圣地天堂洲际大饭店】【米林希尔顿庄园酒店】，尊享舒适睡眠！', '/upload/img/product/small/m32bdf1849b307712c4a0843b89ed83b5f.jpg', 5);
INSERT INTO `product` VALUES (443, '【HIGH翻云南 大理洱海+丽江+玉龙雪山双飞6天 贵宾团】拉市海 圆通山樱花 昆明 【敞篷车环游洱海 旅拍四大网红胜地】', 2599, '13812345678', 1, '一价全包！包含玉龙雪山等经典景点门票索道价值约450元；金马独家安排乘坐【敞篷车】近距离high玩洱海，畅游四大网红景点【挖色、小普陀、下河村扣船、洱海】乐享自由旅拍，特别赠送每人5张照片！', '/upload/img/product/small/m3249bc7b6808cc74080f1bb45d5e82c4e.jpg', 5);
INSERT INTO `product` VALUES (444, '【三月下扬州：扬州瘦西湖万花荟+鼋头渚赏樱花+兴化千垛油菜花+尚湖牡丹节 双飞6天】 +1晚无锡拈花湾景区超豪华客栈', 2499, '13812345678', 1, '升级1晚无锡拈花湾景区超豪华客栈！品尝兴化荷花宴、太湖三白宴、太湖渔民农家乐、南京聚贤楼品秦淮八绝小吃宴、扬州瘦西湖安排【冶春茶社】早茶，感受扬州\"早上皮包水\"的生活乐趣！', '/upload/img/product/small/m353e47405ee70ab11da21fc7ecffa39b3.jpg', 5);
INSERT INTO `product` VALUES (445, '【春节祈福·湖南衡山+韶山+长沙 高铁3天 4钻】南岳衡山赏雪祈福 韶山毛主席故居 刘少奇花明楼 橘子洲头 九洲龙骧豪华游船【贵宾团】', 1799, '13812345678', 1, '新春年味三大核心热门景区：长沙、南岳衡山、红色韶山；赠送橘子洲-九洲龙骧豪华游船+环游橘子洲环保车，感受毛主席“指点江山，激扬文字”的豪迈！', '/upload/img/product/small/m3d5684b0a84605a17b418d547ccb30431.jpg', 5);
INSERT INTO `product` VALUES (446, '【云南丽江+大理+昆明 双飞6天】玉龙雪山 大理花语牧场 洱海骑行 大理古城 丽江古城 昆明海埂公园', 1699, '13812345678', 1, '全程当地豪华舒适酒店；品尝美食：大理酸辣鱼、丽江三文鱼！特别安排：丽江酒吧High Party,大理半天自由活动、环洱海骑行！', '/upload/img/product/small/m31ce39524c56ba38c2833529f34d205fb.jpg', 5);
INSERT INTO `product` VALUES (447, '【新疆乌鲁木齐+天山天池+吐鲁番+库姆塔格沙漠 双飞6天 超贵团】坎儿井 二道桥国际大巴扎 野马古生态园【升级一晚超豪华酒店】', 1999, '13812345678', 1, '专业安排天山天池、火洲吐鲁番、坎儿井、库姆塔格沙漠等多个精华景点，创造玩美旅游体验.；品尝新疆的特色美食，过油肉拌面、手抓羊肉、锅包肉、烤羊肉、馕坑肉......', '/upload/img/product/small/m3ea170da1eace118d3c266f55b67d530b.jpg', 5);
INSERT INTO `product` VALUES (448, '【春节普陀山新年祈福 双飞四天】南海观音大佛 慧济寺 宁波慈城古镇 绍兴鲁迅故居【金马自营】', 3480, '13812345678', 1, '宁波往返，广州南航直飞，即便捷又可观赏胜景；祈福海天佛国-普陀山；特别入住1晚普陀山，感受佛国的梵音！', '/upload/img/product/small/m388113a2e0566b2d86acb9aea00165606.jpg', 5);
INSERT INTO `product` VALUES (449, '【春节 海南三亚 畅游蜈支洲+呀诺达热带雨林 双飞4天】 天涯海角 南山观音文化苑 大东海 椰田古寨【直飞三亚 纯玩团】', 4499, '13812345678', 1, '直飞三亚，玩尽精华景点；全程连住品质酒店；零购物，全程不进购物店！', '/upload/img/product/small/m3ab024d539778cfee109fddf4e08a31fd.jpg', 5);
INSERT INTO `product` VALUES (450, '【春节新玩法：北京+长沙+滑雪 单飞双高6天】北京新春庙会 雍和宫祈福 雪世界滑雪 长沙岳麓山 橘子洲头【纯玩高级团】', 2899, '13812345678', 1, '特别加游长沙1天全景游：岳麓山、爱晚亭、橘子洲头等；游玩北京一年一度的大庆典——新春庙会！', '/upload/img/product/small/m3b2c6e8fa0e92882b9362c68dfa504324.jpg', 5);
INSERT INTO `product` VALUES (451, '【艺术著称•直奔网红】贵州黄果树3天2晚自由行套票【含广州往返二等座高铁票+全程入住超豪华网红酒店安顺黄果树】', 899, '13812345678', 1, '含广州往返二等座高铁票，全程入住超豪华网红酒店安顺黄果树【爱度·艺术酒店】，离黄果树景区仅需3分钟车程！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (452, '【陕西+山西赏樱 双飞5天】西安兵马俑+西岳华山+青龙寺赏樱+黄河壶口冰布：桃花汛+ 黄帝陵轩辕庙+山西运城+鹳雀楼【金马自营】', 2999, '13812345678', 1, '观摩“世界第八大奇迹”——【兵马俑】，领略秦王军阵雄风！ 问鼎五岳之巅——【西岳华山】，回味金庸笔下的侠客柔情！', '/upload/img/product/small/m3a6e5b5ba8ef83b3057c1ac58cb0a51a9.jpg', 5);
INSERT INTO `product` VALUES (453, '【古韵陕西：西安+华山+黄河壶口冰瀑+延安 双飞5天】0购物·0自费 西安往返【贵宾团】', 4399, '13812345678', 1, '全程0购物0自费，四星住宿！ 观摩世界八大奇迹之一【兵马俑】；欣赏【皮影戏】和中国古老摇滚乐【华阴老腔】；叹为观止的壶口冰瀑；感受华山险峻之俊秀；拜访延安重拾革命情怀；', '/upload/img/product/small/m3a6e5b5ba8ef83b3057c1ac58cb0a51a9.jpg', 5);
INSERT INTO `product` VALUES (454, '【春节 湖南衡山+寻雾东江高铁3天 顶贵团】衡山祝融峰 南天门 【赏王仙岭冰雪樱花 享高餐标迎春晚宴+湘南风味餐 5钻】', 2299, '13812345678', 1, '冬季可独赏衡山绝美雾凇奇景；走进相山樱花园，赏南国多种美不胜收的樱花；市区入住享“酒店就是景区”美誉的国际奢华品牌酒店---温德姆至尊豪庭酒店！', '/upload/img/product/small/m3e58cd1b85e778b6f57a3745037704b35.jpg', 5);
INSERT INTO `product` VALUES (455, '【春节 湖南衡山+寻雾东江高铁3天 贵宾团】衡山祝融峰 南天门 【赏王仙岭冰雪樱花 享高餐标迎春晚宴+湘南风味餐 4钻】', 1999, '13812345678', 1, '冬季可独赏衡山绝美雾凇奇景！游王仙岭风景区，赏南国多种美不胜收品种樱花；品尝游水三文鱼、野生东江鱼、莽山蕨根糍粑等当地美食！', '/upload/img/product/small/m3501326413840ce82b9ba14db3a3a5eea.jpg', 5);
INSERT INTO `product` VALUES (456, '【春节 华东五市+扬州瘦西湖+水乡乌镇 双飞6天·一价全包】西塘闹大年 牛首山祈福 禅意小镇拈花湾 【含三大夜景：宋城千古情+上海金茂大厦+苏州古运河船游】', 3399, '13812345678', 1, '超高性价比：华东六大城市、三大夜景全含，宋城千古情、上海金茂88层、苏州船游古运河三大夜景，全程导游不推自费景点。', '/upload/img/product/small/m3ee132c9d26413f60239bf1a307805004.jpg', 5);
INSERT INTO `product` VALUES (457, '【春节 华东五市+上海迪士尼+常州恐龙园 双飞6天 1晚超豪华酒店】无锡鼋头渚 苏州香雪海赏梅花 船游杭州西湖 【畅玩苏沪双乐园：常州恐龙园 上海迪士尼乐园 纯玩0自费】', 3199, '13812345678', 1, '独家双乐园行程：梦幻迪士尼乐园+“东方侏罗纪”中华恐龙园。升级一晚入住超豪华酒店，尽享舒适睡眠。', '/upload/img/product/small/m3ca7779ce012cb9f8a1e2993437228a1b.png', 5);
INSERT INTO `product` VALUES (458, '丽江悦榕庄双飞5天4晚半自由行套票【含广州往返经济舱含税机票+丽江2晚悦榕庄花园套房（含双人自助早餐）】', 3099, '13812345678', 1, '含广州往返经济舱含税机票，丽江入住两晚悦榕庄花园套房，含双人自助早餐！', '/upload/img/product/small/m32d5f7517d1f822788efbfc58ee0371a8.jpg', 5);
INSERT INTO `product` VALUES (459, '【海南三亚 蜈支洲岛+分界洲岛双飞5天 全程0自费】天涯海角 大东海 南山望海观音 2晚入住海景房 品疍家海鲜火锅【超贵团】', 2299, '13812345678', 1, '3晚入住豪华酒店，琼海升级1晚超豪华酒店，其中2晚升级入住海景房。', '/upload/img/product/small/m3ab024d539778cfee109fddf4e08a31fd.jpg', 5);
INSERT INTO `product` VALUES (460, '【寒假 华东四市+乐享迪士尼+乌镇+南浔 双飞6天】禅意小镇拈花湾 苏州狮子林 杭州西湖 夜宿乌镇', 3099, '13812345678', 1, '畅玩迪士尼一整天，游乌镇、南浔双水乡，体验江南人家水乡风情；品尝华东当地特色菜，杭州东坡肉、无锡酱排骨、南京咸水鸭等等；全程0购物；全程4晚豪华酒店及1晚乌镇外豪华特色客栈！', '/upload/img/product/small/m3ee132c9d26413f60239bf1a307805004.jpg', 5);
INSERT INTO `product` VALUES (461, '【除夕专场 桂林+阳朔 高铁3天 品除夕年夜饭+豪叹希尔顿】船游兴坪漓江 訾洲郁金香花海 城徽象鼻山 侗情水庄 阳朔西街【全程0自费】', 939, '13812345678', 1, '除夕夜独家安排年夜饭！大年初一大伙们一块儿包饺子！桂林入住国际品牌希尔顿欢朋酒店，舒适客房35平米超大自由空间；', '/upload/img/product/small/m3c1ba05da8b7267e4c0bb1bcfee0f2f0b.jpg', 5);
INSERT INTO `product` VALUES (462, '【从化专线 越南超值游 船游下龙湾+芒街+河内双飞4天·南航往返】巴亭广场 镇国寺 越式炸鸡火锅宴【高级团】', 669, '13812345678', 1, '包船游誉为世界自然遗产亦有海上桂林美誉的【下龙湾】！入住两晚下龙度假区酒店，感受异域风情；入住一晚河内市区酒店，感受异域民风！', '/upload/img/product/small/m37e9d416ccd26ac920f2f8073cf680011.jpg', 5);
INSERT INTO `product` VALUES (463, '【广西德天大瀑布+北海+南宁 高铁4天·全程超豪华酒店】北海银滩 侨港镇 壮家古寨', 999, '13812345678', 1, '升级全程三晚超豪华酒店及四餐特色美味宴，让您的味蕾融入当地特色！游世界第四大、亚洲第一大跨国瀑布【德天跨国大瀑布】；漫步在百年历史【北海老街】，感受北海文化！', '/upload/img/product/small/m33bf8842e905dfc0a9ff4c10a90cee7f8.jpg', 5);
INSERT INTO `product` VALUES (464, '【春节 广西三江+龙胜梯田+桂林高铁3天】 三江风雨桥 鼓楼 冠洞村百家宴 桂林訾洲郁金香花海 《坐妹》实景演出【超贵团】', 999, '13812345678', 1, '畅享魅力三江+“世界梯田之冠”龙脊梯田，体验多彩民族风情！赠送价值198元的中国首部侗族风情大型震撼实景演出【坐妹】！游览世界最长风雨桥【三江风雨桥】和世界上最大鼓楼【三江鼓楼】！', '/upload/img/product/small/m35b4a93ef19a444967d205d90a0a4560e.jpg', 5);
INSERT INTO `product` VALUES (465, '【春节 湖南崀山八角寨+广西兴安古镇+桂林乐满地曼陀罗园 高铁4天】世界丹霞瑰宝 辣椒峰 天一巷 新春脐橙宴 篝火晚会【超贵团】', 1259, '13812345678', 1, '湘桂双省联游，“浪漫崀山.橙意满满”2017中国崀山脐橙文化节，看崀山美景，品脐橙盛宴！报名当地即送每成人一箱【崀山红心脐橙】', '/upload/img/product/small/m3323448ad2a95ef58c1195c9e7f6a2406.jpg', 5);
INSERT INTO `product` VALUES (466, '【春节• 滑雪胜地神农架+三峡大坝 高铁4天】神农架官门山 熊猫馆 东湖听涛风景区', 3099, '13812345678', 1, '广州到武汉双高铁体验。观“中国最美水上生态公路”古昭公路，游东湖听涛风景区，观雄坝天下之【三峡大坝】，漫步【楚河汉街】；神农架原生态滑雪场亲身体验滑雪、玩雪、赏雪的乐趣；', '/upload/img/product/small/m30f94dad08c676141916d1737078a8d8e.jpg', 5);
INSERT INTO `product` VALUES (467, '【春节 海南三亚蜈支洲岛+亚龙湾+南山观音文化苑 双飞4天】天涯海角 七仙岭黎乡之夜 宋城千古情景区【玩海·品海鲜·泡温泉·黎族过大年】', 4199, '13812345678', 1, '一价全包0自费！赠送价值200元/人海鲜风味大餐；七仙岭黎乡之夜篝火晚会；南山素斋；奢享七仙岭温泉酒店·泡天然温泉+三亚海边酒店海景房！', '/upload/img/product/small/m3ab024d539778cfee109fddf4e08a31fd.jpg', 5);
INSERT INTO `product` VALUES (468, '【春节 越南岘港+美溪海滩+船游下龙湾+河内 双动双飞6天】会安古城 山茶半岛【南北越联游 高级团】', 2999, '13812345678', 1, '海陆空联游线路！越南特色红木游船畅游下龙湾；动车往返安全准时；空：越南境内安排双飞实现南北越联游！游览媲美夏威夷海滩的度假胜地【岘港】，其水天一色的海滩亦不逊于马尔代夫！', '/upload/img/product/small/m313c5693d579f6fb55ab6cc935f0ea034.jpg', 5);
INSERT INTO `product` VALUES (469, '【特惠 东北雪乡+亚布力滑雪+哈尔滨+山东青岛+济南 四飞六天】游东北 送山东！', 4099, '13812345678', 1, '亲临“爸爸去哪儿”剧组取景地，感受中国第一雪乡迷人风采！亚布力初级滑雪场体验滑雪、娱雪的乐趣！游青岛最美海湾浮山湾、特色老街劈柴院！', '/upload/img/product/small/m31e1206e209a1cf61b531311ab465a8fb.jpg', 5);
INSERT INTO `product` VALUES (470, '【春节 海南三亚蜈支洲岛+呀诺达热带雨林 双飞4天】3晚超豪华酒店 出海游艇 海上垂钓【私家小团·二人成团】', 7699, '13812345678', 1, '3晚超豪华品牌酒店——三亚红树林度假世界木棉酒店；一家一车，专车专送，酒店与景点间无缝接驳，省去打车烦忧！', '/upload/img/product/small/m34332119c1d3b137dee37e76e5d2d9391.jpg', 5);
INSERT INTO `product` VALUES (471, '北海双飞4天3晚自由行套票【含广州往返经济舱含税机票+3晚北海市区豪华型酒店】', 699, '13812345678', 1, '含广州往返经济舱含税机票，全程入住北海市区豪华型酒店！', '/upload/img/product/small/m36348b23619f62edbe09880c8756364ff.jpg', 5);
INSERT INTO `product` VALUES (472, '【春节】厦门3天2晚自由行套票【含广州往返二等座高铁票+1晚豪华型酒店+1晚超豪华型温泉酒店（含早与独立温泉泡池+户外温泉+乘坐免费穿梭巴士）】', 1699, '13812345678', 1, '含广州往返二等座高铁票，入住一晚豪华型酒店和升级一晚超豪华型温泉酒店（享自助早餐和独立温泉泡池+户外温泉+乘坐免费穿梭巴士）！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (473, '【赤水大瀑布+遵义会议旧址+茅台国酒门双飞5天·直飞遵义】佛光岩 竹海国家森林公园 丙安古镇 四洞沟【金马自营】', 1699, '13812345678', 1, '广州直飞遵义，仅需2小时航程！一次畅游世界自然遗产地赤水大瀑布，丹霞地貌的典型代表！漫步休闲黔北古镇、探访国酒茅台以及红色岁月印记！', '/upload/img/product/small/m3752fe432ffd9476c106a177fb74d0510.jpg', 5);
INSERT INTO `product` VALUES (474, '【春节 贵州肇兴侗寨+广西桂林银子岩 高铁4天】岜沙苗寨 船游兴坪漓江 訾洲公园 阳朔西街【贵桂联游】', 1799, '13812345678', 1, '全程入住超豪华酒店，肇兴入住特色客栈，感受少数民族特色住宿体验；特别安排侗家长桌宴，升级体验少数民族自助餐！', '/upload/img/product/small/m373af3b755a110210d1e17e27db3e4e22.jpg', 5);
INSERT INTO `product` VALUES (475, '【贵州黄果树瀑布+西江千户苗寨+荔波小七孔 高铁5天】丹寨万达小镇 青岩古镇', 1899, '13812345678', 1, '住宿升级！入住两晚准四豪华酒店+升级一晚超豪华酒店，西江入住景区特色客栈！品尝地道美食：西江长桌宴、黄果树土鸡宴！', '/upload/img/product/small/m31827c9b3257e86f5359a54da9e2cab2c.jpg', 5);
INSERT INTO `product` VALUES (476, '【春节 湖南行摄小东江·王仙岭赏樱花+蔡伦竹海高铁三天】全程超豪华酒店+农家柴火饭【顶贵团】', 2180, '13812345678', 1, '入住拥有“酒店如景区”美誉的国际奢华品牌酒店---温德姆至尊豪廷酒店（房间价值1780元/间）！', '/upload/img/product/small/m3a1c3be962560ab5e4bc39146f4749973.jpg', 5);
INSERT INTO `product` VALUES (477, '【春节 湖南行摄小东江+王仙岭赏樱花+蔡伦竹海 高铁三天】开心尝迎春晚宴+农家柴火饭【贵宾团】', 1880, '13812345678', 1, '独家首创“画中游”游览方式—-徒步醉美小东江景区，颁发【徒步证书】，评比【最具人气奖】！', '/upload/img/product/small/m3f3be8f913e34b9f9345bf9990f005a2d.jpg', 5);
INSERT INTO `product` VALUES (478, '【华东五市+西塘+乌镇 双飞6天】西塘“闹“大年 牛首山新年祈福 全程超豪华酒店【赠送两大夜景：拈花湾禅意灯光秀+千年古镇西塘夜景】', 3749, '13812345678', 1, '全程超豪华酒店+夜宿拈花湾客栈酒店+西塘精品酒店；', '/upload/img/product/small/m3ca551a5fd855bb72d76b7ff5ae23bf19.jpg', 5);
INSERT INTO `product` VALUES (479, '【华东四市+木渎+西塘 双飞5天尊享团】全程入住超豪华酒店【赠三大夜景 宋城千古情表演+夜赏乌镇西栅+拈花湾禅意灯光秀】', 4099, '13812345678', 1, '全程入住超豪华酒店，一晚入住拈花湾禅意客栈，乌镇入住一晚精品酒店；特别安排御茶宴杭帮菜等各地特色餐！', '/upload/img/product/small/m30164d93d7c0a1283cd9d664ffb74cb3f.jpg', 5);
INSERT INTO `product` VALUES (480, '【春节 厦门鼓浪屿+漳州云水谣古道 高铁四天】土楼年夜饭、环岛路曾厝垵、外观金砖会址、梅林古镇', 2299, '13812345678', 1, '游玩闽南海上花园鼓浪屿、游文艺清新小村曾厝垵；特别推荐外观金砖五国厦门会晤会址-厦门国际会议中心；品尝客家特色【年夜饭】、闽南【姜母鸭】，福建特色小吃！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (481, '【春节 厦门高铁3天】鼓浪屿 曾厝垵 南普陀寺 新春祈福集美学村 演武大桥观景平台', 1799, '13812345678', 1, '行走海上花园，漫步环岛海滨，美景不胜收；特别安排两晚厦门豪华酒店，舒适体验行程！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (482, '【宁波自由行】宁波威斯汀酒店双飞4天3晚自由行套票【含广州往返宁波含税机票+1晚宁波威斯汀酒店】', 2099, '13812345678', 1, '含广州往返宁波经济舱含税机票，一晚宁波威斯汀酒店！', '/upload/img/product/small/m3a93c305bc6c9c74acee9e566ec40c765.jpg', 5);
INSERT INTO `product` VALUES (483, '【私享云南 丽江+玉龙雪山登顶+大理 双飞5天 超贵团】拉市海 苍山感通索道 崇圣寺三塔 周城扎染【尊享国际品牌酒店铂尔曼】', 4999, '13812345678', 1, '丽江往返！尊享1晚国际品牌铂尔曼+1晚古城内精品客栈+2晚大理跑男同款《小院子精品酒店》！赠送观赏价值350元大型实景表演《丽江千古情》，感受丽江最古老的马帮文化！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (484, '【春节 江西庐山赏雾凇+三清山+景德镇手工制陶+南昌 高铁5天】东林大佛祈福 婺源体验制作特色小吃清明果', 3399, '13812345678', 1, '在人文圣山-庐山感受诗画意境；在婺源欣赏水墨村庄﹑田园牧歌的乡村美景；在江南第一仙山三清山观奇松怪石。景德镇手工制作哇陶！', '/upload/img/product/small/m374cc1984c1f76571bf6aab86f3f613d1.jpg', 5);
INSERT INTO `product` VALUES (485, '【潮宝少年体验营·广西桂林阳朔 高铁4天】兴坪渔村 图腾古道 遇龙河 马海村 靖江王城“秀”才课堂 纯玩团', 1499, '13812345678', 1, '潮宝少年体验营，采用开放式交际课程，加入多样的特色活动：丛林计划之我和野人有次约会、潮宝少年“秀才”课堂、诗画潮堂......奇趣多多，感受文人墨客的气节！', '/upload/img/product/small/m32d0abfffd0a64b397315bd0eed5776d4.jpg', 5);
INSERT INTO `product` VALUES (486, '【春节私享团 江西三清山+庐山+婺源篁岭+南昌 双飞4天 0自费】千年瓷都景德镇古窑 南昌滕王阁 全程入住超豪华酒店', 3799, '13812345678', 1, '精品小团，在庐山感受诗画意境，在婺源欣赏水墨村庄﹑田园牧歌的乡村美景﹑在三清山观奇松怪石，赏云海流岚；全程入住超豪华酒店，旅途舒适安心；', '/upload/img/product/small/m361e9c3aa97573555ac770f5b63e1a598.jpg', 5);
INSERT INTO `product` VALUES (487, '【海棠湾福湾 • 方圆贝高莉】三亚海棠湾福湾贝高莉度假酒店3天2晚自由行酒店套餐【含两晚豪华海景房+每日中西式自助早餐+VIP专车往返接送机服务】', 699, '13812345678', 1, '含两晚豪华海景房，每日中西式自助早餐，VIP专车往返接送机服务！', '/upload/img/product/small/m38a4a2a7afb4e59e99dcbf41bf03d5281.jpg', 5);
INSERT INTO `product` VALUES (488, '【越南 船游下龙湾+芒街+河内 高铁4天 贵宾团】巴亭广场 镇国寺【全程豪华酒店 越式炸鸡火锅宴】', 799, '13812345678', 1, '包船游—联合国教科文组织誉为世界自然遗产亦有海上桂林美誉的【下龙湾】！全程入住豪华酒店，尊享舒适体验！', '/upload/img/product/small/m37a2af301a56ba722ffae8ae2a666e263.jpg', 5);
INSERT INTO `product` VALUES (489, '【普陀▪朝拜】宁波普陀山双飞4天3晚自由行套餐【含广州往返含税机票+2晚入住普陀山慧宝农庄+1晚宁波市中心汉庭酒店】', 1499, '13812345678', 1, '含广州往返宁波经济舱含税机票，入住普陀山慧宝农庄2晚+宁波市中心汉庭酒店1晚，含营养早餐，抵玩的价格诚心的朝拜！', '/upload/img/product/small/m35dc9656353291d916b49c6ed1ff016a1.jpg', 5);
INSERT INTO `product` VALUES (490, '【春节 山东大连+济南+泰山+青岛三飞七天游 不坐船】曲阜孔府 鸢都潍坊 幸福威海 蓬莱仙境 大连旅顺【全程入住超豪华酒店】', 6688, '13812345678', 1, '新春祈福-泰山、儒家圣地-孔府、人间仙境-八仙渡、梦幻圣地—蓬莱阁冰雪艺术世界、青岛标志-栈桥、天鹅栖息地—烟墩角、激情滑雪2小时……畅游精彩齐鲁，不走回头路！', '/upload/img/product/small/m382f1a4f592ab77e152fa9eb59d5eaee7.jpg', 5);
INSERT INTO `product` VALUES (491, '【贵经典·贵州黄果树瀑布+荔波大小七孔 高铁4天】陡坡塘 天星桥 贵阳青岩古镇【金马自营】', 1799, '13812345678', 1, '乘贵广高铁，观赏“亚洲第一大瀑布”和世界自然遗产地荔波大小七孔；升级一晚超豪华酒店住宿！特别安排贵州酸汤鱼宴，感受当地美食。', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (492, '【贵深度·贵州黄果树大瀑布+荔波大小七孔+西江千户苗寨+黔东南肇兴侗寨高铁7天】堂安梯田 镇远古镇 青龙洞 天龙屯堡观地戏【全景之旅 金马自营】', 2799, '13812345678', 1, '观赏贵州东南部精华全景，品最地道的民族美食！特别安排苗家特色【打糍粑】，免费赠送苗服体验；特别安排品尝贵州酸汤鱼、苗家长桌宴、荔波石锅鱼、安顺土鸡宴会，感受风土人情，体验舌尖上的贵州！', '/upload/img/product/small/m37d8d151694fd4efe55f6fc82fff568b0.jpg', 5);
INSERT INTO `product` VALUES (493, '【春节 广西南宁+北海银滩+德天跨国大瀑布双飞4天 超贵团】钦州 青秀山 壮家古寨 八寨沟【南航往返·南广全景】', 1999, '13812345678', 1, '游亚洲第一大跨国瀑布、中国至美的瀑布—德天跨国大瀑布！玩真正“天下第一滩”，北海十里银滩！壮家古寨，与壮家姑娘对歌跳舞，融入少数民族生活圈！赏广西醉美风景—八寨沟风景区！', '/upload/img/product/small/m3c4068c49014303df7086f8f2df14ca47.jpg', 5);
INSERT INTO `product` VALUES (494, '【春节 南宁+ 北海银滩+德天跨国大瀑布 高铁4天】青秀山 八寨沟 壮家古寨【南广全景 超贵团】', 1999, '13812345678', 1, '游亚洲第一大跨国瀑布、中国至美的瀑布—德天跨国大瀑布！玩真正“天下第一滩”，北海十里银滩！壮家古寨，与壮家姑娘对歌跳舞，融入少数民族生活圈！赏广西醉美风景—八寨沟风景区！', '/upload/img/product/small/m32042dda7cbec1e5c8925ec5d3b06002d.jpg', 5);
INSERT INTO `product` VALUES (495, '【越南船游下龙湾+河内 双飞4天】芒街 巴亭广场 镇国寺 越式炸鸡火锅宴【南航往返】', 699, '13812345678', 1, '南航正点航班往返1小时直达南宁！包船游—联合国教科文组织誉为世界自然遗产亦有海上桂林美誉的【下龙湾】！', '/upload/img/product/small/m37e9d416ccd26ac920f2f8073cf680011.jpg', 5);
INSERT INTO `product` VALUES (496, '【东北长白山+魔界雾凇+雪乡+亚布力+哈尔滨 双飞6天】全程入住3晚豪华酒店+长白山下升级1晚超豪华温泉酒店【精玩大东北】', 5999, '13812345678', 1, '品舌尖上的东北，满族三套碗、长白山野味火锅、雪乡山珍宴、传统杀猪菜、东北饺子宴！享受优质住宿，全程入住3晚豪华酒店，长白山下升级一晚超豪华温泉酒店，雪乡入住特色暖炕', '/upload/img/product/small/m359f25b76fafbca847eac3340fc37ba42.jpg', 5);
INSERT INTO `product` VALUES (497, '【贵州+广西 高铁3天 惠贵团】肇兴侗寨 侗族长桌宴 万佛山风景名胜区 龙胜布尼梯田【纯玩0自费】', 1699, '13812345678', 1, '特别安排享用侗族特色长桌宴！', '/upload/img/product/small/m336b66406fd68f548909c43760076b508.jpg', 5);
INSERT INTO `product` VALUES (498, '大连双飞4天3晚自由行套票【含广州往返含税机票+3晚入住大连市中心繁华路段超豪华型酒店】', 1699, '13812345678', 1, '含广州往返经济舱含税机票，入住大连市中心繁华路段超豪华型酒店三晚，酒店邻近亚洲最大的城市地标星海广场，可欣赏巨型华表、音乐喷泉和各式雕塑', '/upload/img/product/small/m38afd0ac156e1c099e79dc16511b8f3b6.jpg', 5);
INSERT INTO `product` VALUES (499, '【冬游内蒙古：呼和浩特滑雪+希拉穆仁草原牧民家访+响沙湾 双飞4天超贵团】赏冬季大草原银装素裹 感受沙漠“大漠孤烟直”的雄浑', 1999, '13812345678', 1, '升级一晚国际超豪华酒店；品尝蒙族特色涮羊肉、草原手扒肉、手工熬制奶茶、奶食品、莜面；走进草原牧户家庭，了解原生态蒙元文化，穿蒙古族服饰、学说蒙语、进羊圈。', '/upload/img/product/small/m375800c4364fff1d378a9ac467c373016.jpg', 5);
INSERT INTO `product` VALUES (500, '【新疆乌鲁木齐+天山天池+吐鲁番双飞六天 超贵团 自营】坎儿井 库姆塔格沙漠 二道桥国际大巴扎 野马古生态园【玩雪 品美食 赏汗血宝马+升级1晚超豪华酒店】', 1999, '13812345678', 1, '高山湖泊与火洲成为鲜明的对比，这里不但有美景，有古城，有沙漠，更有古老的维吾尔民俗，让您眼花缭乱；品尝新疆美食过油肉拌面、手抓羊肉、锅包肉、烤羊肉、馕坑肉等等！', '/upload/img/product/small/m37113025fe77ee2c1a24ed4853d61093c.jpg', 5);
INSERT INTO `product` VALUES (501, '【冬季东北长白山+吉林雾凇长廊+长春 双飞5天高端】万达国际度假区 激情滑雪 行摄魔界', 8099, '13812345678', 1, '尊享升级2晚超豪华酒店；登中华十大名山——长白山，赏中国天池冬韵！山下泡纯正硫磺矿物温泉！赴万达国际度假区欧式风格度假小镇，激情滑雪不限时，体验驰骋雪场快感！', '/upload/img/product/small/m384ee9d8432a540b153a4afd300794e76.jpg', 5);
INSERT INTO `product` VALUES (502, '迪士尼+华东双飞4天3晚自由行套票【含广州飞上海-杭州飞广州往返经济舱含税机票+上海迪士尼乐园附近豪华酒店2晚+乌镇外豪华酒店1晚+迪士尼乐园成人一日票】', 2299, '13812345678', 1, '含广州飞上海，杭州飞广州往返经济舱含税机票，上海迪士尼乐园附近豪华酒店2晚+乌镇外豪华酒店1晚，迪士尼乐园成人一日票！', '/upload/img/product/small/m36491998889e9597f0e7753beea037ae3.jpg', 5);
INSERT INTO `product` VALUES (503, '【春节 西藏拉萨+布达拉宫+林芝+鲁朗+羊卓雍措+巴松措 三飞7天】2晚升级入住超豪华酒店 享用一餐烤全羊特色餐', 4899, '13812345678', 1, '游览西藏最美的【鲁朗林海】，观中国最美的南迦巴瓦峰！藏族家访，学跳锅庄舞，学做酥油茶，做一次地道的藏族人；', '/upload/img/product/small/m3f9cb1c7e3488f60e3b3da09b8700df5d.jpg', 5);
INSERT INTO `product` VALUES (504, '【￥2999约惠西藏鲁朗三飞7天】拉萨 布达拉宫 扎基寺 西藏江南林芝 卡定沟 秀巴古堡 鲁朗林海 鲁朗小镇', 2999, '13812345678', 1, '登上世界奇迹、世界屋脊明珠——【布达拉宫】，感受世界之巅的磅礴大气；赏【鲁朗林海】雪峰牧场、田园溪流的五彩山居图，在色季拉山口有机会邂逅中国最美【南迦巴瓦峰】；', '/upload/img/product/small/m3b867dc2e6b28708eeb0961a4cd9aa3c8.jpg', 5);
INSERT INTO `product` VALUES (505, '【福建厦门高铁4天】鼓浪屿 南普陀寺 云水谣土楼 曾厝铵 集美学村', 1399, '13812345678', 1, '“海上花园”鼓浪屿；世界遗产“福建土楼”；闽南佛学院“南普陀寺”…，全程纯玩不进店，参观福建土楼！', '/upload/img/product/small/m3afc3e64f7ad9d519511704c449558522.jpg', 5);
INSERT INTO `product` VALUES (506, '【12月山东一地纯玩双飞6天】泰安泰山 曲阜孔府 欧式青岛 幸福威海 蓬莱仙境 济宁双飞六天游', 2099, '13812345678', 1, '特别升级1晚超豪华酒店，登泰山求一生平安！游览美丽渔村烟敦角，赏特色海草房、品味泰山农家宴、泰安御膳宴、胶东特色餐！', '/upload/img/product/small/m382f1a4f592ab77e152fa9eb59d5eaee7.jpg', 5);
INSERT INTO `product` VALUES (507, '【广西德天巴马高铁4天】德天瀑布 通灵大峡谷 巴马长寿村', 1499, '13812345678', 1, '游览享誉中外的【德天跨国大瀑布】，《中国国家地理》选美中国，德天瀑布被评为最美的瀑布！', '/upload/img/product/small/m33bf8842e905dfc0a9ff4c10a90cee7f8.jpg', 5);
INSERT INTO `product` VALUES (508, '【安徽九华山双飞三天纯玩】肉身宝殿 化城寺 百岁宫 天台景区', 1599, '13812345678', 1, '亲眼近距离参拜九华山的最古老的“肉身菩萨”，深度九华山', '/upload/img/product/small/m3b17a076ba82f824ceeaebb2cdc0cf9d6.jpg', 5);
INSERT INTO `product` VALUES (509, '【三亚西岛+亚龙湾沙滩+兴隆南国热带雨林 双飞四天】石梅湾 北仍村 万泉河竹筏漂流【贵宾团】', 2199, '13812345678', 1, '全程入住豪华酒！店指定南航，博鳌往返；优选海南热门景点：万泉河竹筏漂流、兴隆南国热带雨林、西岛、石梅湾、亚龙湾海滩等。', '/upload/img/product/small/m31bb179bb190f2077ff0bafa3f46eb591.jpg', 5);
INSERT INTO `product` VALUES (510, '【直飞芒市 云南腾冲银杏村双飞5天】和顺古镇 邦腊掌热矿温泉SPA 热海公园 瑞丽 勐焕大金塔', 4999, '13812345678', 1, '高端定制优雅小团，团团不超过10人', '/upload/img/product/small/m3e55b5c21f86efb34f3dcc3fa6a5cd2cb.jpg', 5);
INSERT INTO `product` VALUES (511, '【旅展爆款 云南丽江+大理+昆明 双飞6天★一价全包无自费】玉龙雪山 乐游古城 拉市海 大理古城 花语牧场 洱海风光 昆明翠湖公园 【贵宾团】', 1899, '13812345678', 1, '全程安排当地豪华型酒店！包含玉龙雪山等经典景点门票价值约450元，行程丰富，绝不走马观花！', '/upload/img/product/small/m3fbf284c91f951d6a5a071a3f02010669.jpg', 5);
INSERT INTO `product` VALUES (512, '【双12爆款】阳朔 高铁3天2晚 自由行套餐【含广州往返高铁票+2晚汉唐·馨阁酒店+每日早餐+天籁·蝴蝶泉景区门票】', 999, '13812345678', 1, '含广州往返二等座高铁票，酒店西式自助早餐，全程入住汉唐·馨阁酒店，额外赠送天籁·蝴蝶泉景区门票一张！', '/upload/img/product/small/m3c1ba05da8b7267e4c0bb1bcfee0f2f0b.jpg', 5);
INSERT INTO `product` VALUES (513, '【春节】三亚 双飞3天2晚 自由行套票【含广州直飞往返机票+2晚海居铂尔曼酒店高级花园房+每日中西式自助早餐+VIP专车接送机服务】', 999999, '13812345678', 1, '含广州直飞三亚往返机票+2晚海居铂尔曼酒店高级花园房+每日中西式自助早餐+VIP专车接送机服务！', '/upload/img/product/small/m3fd7637f5a1a26457acf474e1b6e19504.jpg', 5);
INSERT INTO `product` VALUES (518, '普吉岛11日游', 10001, '13812345677', 1, '<p><img src=\"/upload/0162ef94-7ade-4e8c-af5e-e1b44d727809img1.jpeg\" style=\"max-width:100%;\"><br></p><p>又到一年寒冬，又是一度的雾霾。</p><p>依旧是忙到跳脚的工作，还是每天紧绷的神经。</p><p>此刻的我，</p><p>满脑都是梁静茹那首歌不想过冬，厌倦沉重，就飞去热带的岛屿游泳。</p><p>恰逢泰国免签政策提前，我们一合计，挑了个周末的时间。</p><p>决定放肆的浪，去看看久违的蓝天，阳光和海滩。</p><p>我来了，<a target=\"_blank\" href=\"https://you.ctrip.com/place/phuket364.html#ctm_ref=gs_290606_3896839_364_l\">普吉岛</a>！</p><p>此行的三个关键词：时间灵活，花费超低，说走就走。</p><p>事实证明，一个周末的时间（周五晚上出发，周一早上返回），在<a target=\"_blank\" href=\"https://you.ctrip.com/place/phuket364.html#ctm_ref=gs_290606_3896839_364_l\">普吉岛</a>照样能玩的称心如意，哈哈！</p><p>下面就跟随我，利用两天的时间，领略别样的普吉吧！</p><p>别样普吉——租一辆摩托车，在普吉的最南端追逐日落的脚步</p><p>彻底放弃冬天的枷锁，换上背心人字拖。租一辆帅气的摩托车，驰骋在普吉的沿海公路上，速度不用太快（毕竟安全第一），40码的速度，吹着海风，你就能感受到那是自由的味道！</p><p><br></p>', '/upload/588ca81f-888d-4534-83fc-06d6564fbec7img1.jpeg', 5);
INSERT INTO `product` VALUES (519, 'Demo', 999, '999', 1, '<p>Demo</p>', '', 7);
INSERT INTO `product` VALUES (521, 'Test', 1111, '999', 1, '<p><img src=\"/upload/6d17a3cd-5bb5-4732-bcda-be1b6ec48826111111.jpg\" style=\"max-width:100%;\"><br></p>', '/upload/8b8ca50d-1055-4f6c-8d2a-32b40f832e29111111.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'Super Administrator', 'Manage all data');
INSERT INTO `role` VALUES (2, 'Merchandise Administrator', 'Manage Merchandise');
INSERT INTO `role` VALUES (3, 'Webmaster', 'Webmaster manages the website');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rid` varchar(32) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('4', '2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
