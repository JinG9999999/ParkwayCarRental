create database Pcr
go
use Pcr

--用户表(注册、登录)
create table Users
(
	  Uid		int identity primary key,
	  Name		varchar(50),--用户名
	  Pwd		varchar(50),--密码
	  Email		varchar(50),--邮箱
)
insert into Users values('zk','123456','56509647@qq.com')
insert into Users values('yyh','123456','714386517@qq.com')
insert into Users values('ycx','123456','2849985501@qq.com')
insert into Users values('lvj','123456','643241336@qq.com')
insert into Users values('zjl','123456','2455284942@qq.com')

------------------------------用户登录（前台）----------------------------------------------
--汽车类型
create table CarType
(
	CarTypeID	int identity primary key,
	Type		varchar(50) --汽车类型
)
insert into CarType values('SUV'),('MPV'),('跑车'),('皮卡')
select * from CarType

--汽车品牌
create table CarBrand
(
	CarBrandID  int identity primary key,
	Brand		varchar(50) -- 汽车品牌
)
insert into CarBrand values('大众'),('奥迪'),('宝马'),('福特')
select * from CarBrand

--汽车信息表
create table CarInfo
(
	CarInfoID		int identity primary key,
	Image			varchar(max),   --图片
	bid				int foreign key references CarBrand(CarBrandID), -- 品牌外键
	CarName			varchar(max),   --汽车名字
	Years			int,			--汽车年份
	cid				int foreign key references CarType(CarTypeID),--汽车类型
	CC				varchar(50),    --汽车排量
	Count			int,
	AMT				varchar(10),    --手动、自动
	Price			varchar(50),    --汽车日租单价
	Address			varchar(max)    --店方地址
)
select * from CarInfo
insert into CarInfo values('Images/001.png',1,'大众朗逸',2010,1,'1.3L',10,'手动','888.6','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/002.png',2,'奥迪A3',2011,3,'2.1L',20,'自动','600','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/003.png',3,'宝马x1',2012,3,'3.3L',5,'手动','555.5','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/004.png',4,'福特福瑞斯',2013,3,'3.0L',3,'自动','111.1','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/005.png',1,'大众途锐',2014,1,'1.0L',40,'手动','1230.2','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/006.png',2,'奥迪A8L',2015,1,'2.5L',11,'自动','222.2','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/007.png',3,'宝马X5',2016,1,'4.0L',33,'手动','333.3','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/008.png',4,'福特野马',2017,1,'1.7L',24,'自动','444.4','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/009.png',4,'福特福克斯',2018,2,'3.0L',8,'手动','666.6','郑州市中原区建设路西三环百车汇汽车租赁有限公司')
insert into CarInfo values('Images/010.png',4,'福特蒙迪欧',2019,2,'1.5L',6,'自动','2580.8','郑州市中原区建设路西三环百车汇汽车租赁有限公司')

select * from CarType c join Va v on c.CarTypeID=v.cid 
join CarBrand b on v.bid=b.CarBrandID


--个人信息认证表(实名认证)
create table UserInfo
(
	UserInfoID	int primary key identity,
	uid			int foreign key references Users(Uid), --用户外键
	UName		varchar(50),--真实姓名
	IDcard		nvarchar(18) --身份证号
)

--车辆挂靠
create table Va
(
	VID				int primary key identity,
	uid             int foreign key references Users(Uid),
	Image			varchar(max),   --图片
	bid				int foreign key references CarBrand(CarBrandID), -- 品牌外键
	CarName			varchar(max),   --汽车名字
	Years			int,			--汽车年份
	cid				int foreign key references CarType(CarTypeID),--汽车类型
	CC				varchar(50),    --汽车排量
	AMT				varchar(10),    --手动、自动
	Price			decimal,        --汽车日租单价
	Vstate			int default(0)  --是否审批
)

insert into Va values(1,'Images/01.png',1,'大众途锐',2020,1,'1L','自动','888.25',0)
insert into Va values(2,'Images/02.png',2,'奥迪A8L',2019,3,'1.5L','手动','777.25',1)
insert into Va values(3,'Images/03.png',3,'宝马X5',2018,3,'1.6L','自动','999.25',0)
insert into Va values(4,'Images/04.png',4,'福特野马',2017,3,'2L','手动','888.25',1)
insert into Va values(5,'Images/05.png',1,'大众途昂',2016,1,'3L','自动','777.25',0)
insert into Va values(3,'Images/06.png',2,'奥迪A6L',2015,1,'4L','手动','999.25',1)
insert into Va values(4,'Images/07.png',3,'宝马7系',2014,1,'3.5L','自动','888.25',0)
insert into Va values(2,'Images/08.png',4,'福特猛禽',2013,1,'3.8L','手动','777.25',1)
insert into Va values(1,'Images/09.png',4,'福特探险者',2012,2,'2.7L','自动','999.25',0)
insert into Va values(1,'Images/10.png',4,'福特锐界',2012,2,'2.7L','自动','999.25',0)

select * from Va

--订单表
create table Orders
(
	OrdersID		int primary key identity,
	Oid				varchar(max),--订单编号
	uid				int foreign key references Users(Uid),--用户外键
	CarInfoid		int foreign key references CarInfo(CarInfoID), --汽车信息外键
	Useing			varchar(50),--租车用途
	StartTime		varchar(max),   --取车时间
	EndTime			varchar(max),   --还车时间
	Driver			int check(Driver>0 and Driver<3),		--是否配用司机
	Price	        decimal,    --费用
	ZT				int check(ZT>0 and ZT<4) default(1),--(1:您已预定 2:立刻上路 3:取消订单)
	Hitch			int check(Hitch>0 and Hitch<5) default(1)  --(1:暂无问题 2：故障申请 3：报修通过 4：有待商议)
)

insert into Orders values('Bch20200504',1,1,'自驾游','2020-05-04','2020-05-05',1,'200.2',default,default)
insert into Orders values('Bch20200504',2,2,'自驾游','2020-05-04','2020-05-05',1,'222.2',default,2)
select * from Orders join CarInfo on Orders.CarInfoid=CarInfo.CarInfoID

--故障原因表
create table Breakdown
(
	BreakdownID int primary key identity,
	Reson       varchar(max), --故障原因描述
	Phone		varchar(20), --联系电话
	OrdersID	int foreign key references Orders(OrdersID), --订单表外键
)

insert into Breakdown values('没油了','123456789',2)
select * from Breakdown join Orders on Breakdown.OrdersID=Orders.OrdersID where Orders.OrdersID=3

--帮助中心（常见问题）
create table Trouble
(
	TroubleID		int primary key identity,
	Condition		varchar(max), --租车条件
	Standard		varchar(max), --费用标准
	ContactUs		varchar(max)  --联系我们
)

------------------------------ 管理员登录（后台）----------------------------------------------
 
--管理员登录  （（（  新增 ）））
create table Admins
(
	  Uid		int identity primary key,
	  Name		varchar(50),--用户名
	  Pwd		varchar(50),--密码
	  Email		varchar(50),--邮箱
)
insert into Admins values('zk','123456','56509647@qq.com')
insert into Admins values('yyh','123456','714386517@qq.com')
insert into Admins values('ycx','123456','2849985501@qq.com')
insert into Admins values('lvj','123456','643241336@qq.com')
insert into Admins values('zjl','123456','2455284942@qq.com')




