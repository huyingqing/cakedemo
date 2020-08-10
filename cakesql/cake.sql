#设置客户端连接服务器为utf-8
set names utf8;
#丢弃数据库cake，如果存在
drop database if exists cake;
#创建数据库cake，设置储存编码为utf-8
create database cake charset=utf8;
#进入数据库cake
use cake;
#创建首页数据列表

/*导航栏地址*/
CREATE TABLE address(
	aid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	address varchar(64) #地址
);

/*导航栏所有产品项*/
CREATE TABLE products(
	pid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	products varchar(64) #所有蛋糕
);

/*蛋糕口味筛选*/
CREATE TABLE taste(
	tid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
	taste varchar(64) #口味
);

/*场景筛选*/
CREATE TABLE scene(
	tid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  fenlei varchar(12) ,#分类
	scene varchar(64) #场景
);


/*用户信息*/
CREATE TABLE users(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),#用户名
  upwd VARCHAR(32),#密码
	user_name VARCHAR(32),#昵称
	gender INT, #性别  0-女  1-男
	birth VARCHAR(32),#生日
  email VARCHAR(64),#邮箱
  phone VARCHAR(16),#电话
  avatar VARCHAR(128)   #头像图片路径
);
/*首页轮播广告商品*/
CREATE TABLE cakecarousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/*首页三排图片*/
CREATE TABLE threepictrue(
	tid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  href VARCHAR(128)
);
/*首页本季推荐下的图片*/
CREATE TABLE bigpicture(
	tid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  href VARCHAR(128)
);
/*商品列表头部口味*/
CREATE TABLE protaste(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  fenlei varchar(12) ,#分类
  proaddr VARCHAR(128)
);

/*蛋糕详情*/
CREATE TABLE list(
  lid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  fenlei varchar(12) ,#分类
	cname varchar(120) ,#蛋糕名称
  title varchar(120) ,#英文标题
  price decimal(6,2),#价格
  reserve varchar(64),#预定时间
  category varchar(64),#口味
  adetails varchar(64),#详情
  bdetails varchar(64),#详情
  cdetails varchar(64),#详情
  sweet varchar(64),#甜味
  tableware varchar(64),#标配餐具
  size varchar(64),#尺寸
  Storage varchar(64),#提示
  Sweight varchar(64),#分量
  shelfTime date,#上架时间
  img varchar(128),#图片路径
  xqimg  varchar(128),#详情页图片路径
  xqpcimg  varchar(128),#详情页图片路径
  spec  varchar(128),#详情页图片路径
  islndex bool #1>是,0>不是 是否为首页推荐
);

/*配件*/
CREATE TABLE peijian(
  lid INT PRIMARY KEY AUTO_INCREMENT,#主键约束
  img varchar(128),#配件1
  title varchar(120),#标题
  price decimal(6,2) #价格
);

/*导航栏地址*/
insert into address values
(null,"杭州市"),
(null,"上海市"),
(null,"苏州市"),
(null,"北京市");

/*导航栏所有产品项*/
insert into products values
(null,"所有蛋糕"),
(null,"所有小食"),
(null,"所有配件");

/*蛋糕口味筛选*/
insert into taste values
(null,"拿破仑系列"),
(null,"奶油系列"),
(null,"莫斯系列"),
(null,"芝士系列"),
(null,"巧克力系列"),
(null,"咖啡系列"),
(null,"坚果系列"),
(null,"水果系列"),
(null,"冰淇淋系列");

/*场景筛选*/
insert into scene values
(null,1,"生日"),
(null,2,"聚会"),
(null,1,"情侣"),
(null,3,"儿童"),
(null,3,"长辈"),
(null,2,"下午茶");

/*配件*/
insert into peijian values
(null,"http://localhost:3001/img/xaingqing/peijian/pj1.jpg","炫彩趣味礼包",39.90),
(null,"http://localhost:3001/img/xaingqing/peijian/pj2.jpg","缤纷欢乐礼包",29.90),
(null,"http://localhost:3001/img/xaingqing/peijian/pj3.jpg","生日牌",5.00),
(null,"http://localhost:3001/img/xaingqing/peijian/pj4.jpg","数字蜡烛",3.00);


/*蛋糕详情插入数据*/
insert into list values
(null,1,"约瑟玫瑰","Fleur de pêche",398.00,"提前24小时预定","奶油、水果","口味基底：Whipping Cream","口感：绵软细腻","口味：奶油/水果","甜味：2","标配餐具(免费)5份","SIZE:15cm*13cm(直径*高）","若不及时食用，请放置0-10℃冷藏","1.3磅(591g)适合2-3人食","2020-7-20","http://localhost:3001/img/list/new1.jpg","http://localhost:3001/img/xaingqing/1/detail1.jpg","http://localhost:3001/img/xaingqing/1/pc.jpg","约2磅 —— 900g",true),
(null,3,"爱之风物诗","Souhaiter Un Joyeux Anniversai",218.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new2.jpg","http://localhost:3001/img/xaingqing/2/detail1.jpg","http://localhost:3001/img/xaingqing/2/pc.jpg","约2磅 —— 900g",true),
(null,1,"男友力","Charmes masculins",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new3.jpg","http://localhost:3001/img/xaingqing/3/detail1.jpg","http://localhost:3001/img/xaingqing/3/pc.jpg","约2磅 —— 900g",true),
(null,6,"甜愿·生日蛋糕","Souhaiter Un Joyeux Anniversai",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new4.jpg","http://localhost:3001/img/xaingqing/4/detail1.jpg","http://localhost:3001/img/xaingqing/4/pc.jpg","约2磅 —— 900g",true),
(null,5,"阳光心芒","Le Soleil",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new5.jpg","http://localhost:3001/img/xaingqing/5/detail1.jpg","http://localhost:3001/img/xaingqing/5/pc.jpg","约2磅 —— 900g",true),
(null,2,"浓巧·迷情冰淇淋蛋糕","Choco ~ Mariage",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new6.jpg","http://localhost:3001/img/xaingqing/6/detail1.jpg","http://localhost:3001/img/xaingqing/6/pc.jpg","约2磅 —— 900g",true),
(null,4,"胖达乐园","Choco ~ Mariage",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new7.jpg","http://localhost:3001/img/xaingqing/7/detail1.jpg","http://localhost:3001/img/xaingqing/7/pc.jpg","约2磅 —— 900g",true),
(null,2,"尼诺 ","Nino",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new8.jpg","http://localhost:3001/img/xaingqing/8/detail1.jpg","http://localhost:3001/img/xaingqing/8/pc.jpg","约2磅 —— 900g",true),
(null,6,"安逸兔","lapin détendu",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new9.jpg","http://localhost:3001/img/xaingqing/9/detail1.jpg","http://localhost:3001/img/xaingqing/9/pc.jpg","约2磅 —— 900g",true),
(null,7,"黛西的旅行","Voyage de Daisy",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new10.jpg","http://localhost:3001/img/xaingqing/10/detail1.jpg","http://localhost:3001/img/xaingqing/10/pc.jpg","约2磅 —— 900g",true),
(null,9,"Finn的蘑菇星球","La planète champignon de Finn",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new11.jpg","http://localhost:3001/img/xaingqing/11/detail1.jpg","http://localhost:3001/img/xaingqing/11/pc.jpg","约2磅 —— 900g",true),
(null,8,"卢克和咚咚冰淇淋蛋糕","Luke et dondon",298.00,"提前5小时预定","慕斯、巧克力","口味基底：Mousse","口感：绵软细腻","口味：巧克力/干果","甜味：1","标配餐具(免费)10份","15.5cm*6cm（直径*高）","若不及时食用，请放置0-10℃冷藏","1.7磅(772g)适合4-7人食","2020-7-20","http://localhost:3001/img/list/new12.jpg","http://localhost:3001/img/xaingqing/12/detail1.jpg","http://localhost:3001/img/xaingqing/12/pc.jpg","约2磅 —— 900g",true);

/*用户信息插入数据*/
insert into users values
(null,"xiaoming","123456","王小明",1,"1998-03-30","1324546451@qq.com","18123304138",null),
(null,"dingding","121212","丁丁",0,"1997-04-10","1515421542@qq.com","18454542141",null);

/*首页轮播广告商品*/
INSERT INTO cakecarousel VALUES
(NULL,'http://localhost:3001/img/lunbo/big1.png','轮播广告商品1','/about/:1'),
(NULL,'http://localhost:3001/img/lunbo/big2.png','轮播广告商品2','/about/:2'),
(NULL,'http://localhost:3001/img/lunbo/big3.png','轮播广告商品3','/about/:3'),
(NULL,'http://localhost:3001/img/lunbo/big4.png','轮播广告商品4','/about/:4'),
(NULL,'http://localhost:3001/img/lunbo/big6.png','轮播广告商品5','/about/:5');

/*首页三排图片*/
INSERT INTO threepictrue VALUES
(NULL,'http://localhost:3001/img/body/3.1.jpg','/about/:1'),
(NULL,'http://localhost:3001/img/body/3.2.jpg','/about/:2'),
(NULL,'http://localhost:3001/img/body/3.3.jpg','/about/:3');
/*首页本季推荐下的图片*/
INSERT INTO bigpicture VALUES
(NULL,'http://localhost:3001/img/body/body1.jpg','/about/:4'),
(NULL,'http://localhost:3001/img/body/body2.jpg','/about/:5');

/*商品列表头部口味*/
INSERT INTO protaste VALUES
(null,1,"拿破仑"),
(null,2,"奶油"),
(null,3,"莫斯"),
(null,4,"芝士"),
(null,5,"巧克力"),
(null,6,"咖啡"),
(null,7,"坚果"),
(null,8,"水果"),
(null,9,"冰淇淋");





