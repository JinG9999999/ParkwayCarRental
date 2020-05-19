create database Pcr
go
use Pcr

--�û���(ע�ᡢ��¼)
create table Users
(
	  Uid		int identity primary key,
	  Name		varchar(50),--�û���
	  Pwd		varchar(50),--����
	  Email		varchar(50),--����
)
insert into Users values('zk','123456','56509647@qq.com')
insert into Users values('yyh','123456','714386517@qq.com')
insert into Users values('ycx','123456','2849985501@qq.com')
insert into Users values('lvj','123456','643241336@qq.com')
insert into Users values('zjl','123456','2455284942@qq.com')

------------------------------�û���¼��ǰ̨��----------------------------------------------
--��������
create table CarType
(
	CarTypeID	int identity primary key,
	Type		varchar(50) --��������
)
insert into CarType values('SUV'),('MPV'),('�ܳ�'),('Ƥ��')
select * from CarType

--����Ʒ��
create table CarBrand
(
	CarBrandID  int identity primary key,
	Brand		varchar(50) -- ����Ʒ��
)
insert into CarBrand values('����'),('�µ�'),('����'),('����')
select * from CarBrand

--������Ϣ��
create table CarInfo
(
	CarInfoID		int identity primary key,
	Image			varchar(max),   --ͼƬ
	bid				int foreign key references CarBrand(CarBrandID), -- Ʒ�����
	CarName			varchar(max),   --��������
	Years			int,			--�������
	cid				int foreign key references CarType(CarTypeID),--��������
	CC				varchar(50),    --��������
	Count			int,
	AMT				varchar(10),    --�ֶ����Զ�
	Price			varchar(50),    --�������ⵥ��
	Address			varchar(max)    --�귽��ַ
)
select * from CarInfo
insert into CarInfo values('Images/001.png',1,'��������',2010,1,'1.3L',10,'�ֶ�','888.6','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/002.png',2,'�µ�A3',2011,3,'2.1L',20,'�Զ�','600','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/003.png',3,'����x1',2012,3,'3.3L',5,'�ֶ�','555.5','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/004.png',4,'���ظ���˹',2013,3,'3.0L',3,'�Զ�','111.1','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/005.png',1,'����;��',2014,1,'1.0L',40,'�ֶ�','1230.2','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/006.png',2,'�µ�A8L',2015,1,'2.5L',11,'�Զ�','222.2','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/007.png',3,'����X5',2016,1,'4.0L',33,'�ֶ�','333.3','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/008.png',4,'����Ұ��',2017,1,'1.7L',24,'�Զ�','444.4','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/009.png',4,'���ظ���˹',2018,2,'3.0L',8,'�ֶ�','666.6','֣������ԭ������·�������ٳ��������������޹�˾')
insert into CarInfo values('Images/010.png',4,'�����ɵ�ŷ',2019,2,'1.5L',6,'�Զ�','2580.8','֣������ԭ������·�������ٳ��������������޹�˾')

select * from CarType c join Va v on c.CarTypeID=v.cid 
join CarBrand b on v.bid=b.CarBrandID


--������Ϣ��֤��(ʵ����֤)
create table UserInfo
(
	UserInfoID	int primary key identity,
	uid			int foreign key references Users(Uid), --�û����
	UName		varchar(50),--��ʵ����
	IDcard		nvarchar(18) --���֤��
)

--�����ҿ�
create table Va
(
	VID				int primary key identity,
	uid             int foreign key references Users(Uid),
	Image			varchar(max),   --ͼƬ
	bid				int foreign key references CarBrand(CarBrandID), -- Ʒ�����
	CarName			varchar(max),   --��������
	Years			int,			--�������
	cid				int foreign key references CarType(CarTypeID),--��������
	CC				varchar(50),    --��������
	AMT				varchar(10),    --�ֶ����Զ�
	Price			decimal,        --�������ⵥ��
	Vstate			int default(0)  --�Ƿ�����
)

insert into Va values(1,'Images/01.png',1,'����;��',2020,1,'1L','�Զ�','888.25',0)
insert into Va values(2,'Images/02.png',2,'�µ�A8L',2019,3,'1.5L','�ֶ�','777.25',1)
insert into Va values(3,'Images/03.png',3,'����X5',2018,3,'1.6L','�Զ�','999.25',0)
insert into Va values(4,'Images/04.png',4,'����Ұ��',2017,3,'2L','�ֶ�','888.25',1)
insert into Va values(5,'Images/05.png',1,'����;��',2016,1,'3L','�Զ�','777.25',0)
insert into Va values(3,'Images/06.png',2,'�µ�A6L',2015,1,'4L','�ֶ�','999.25',1)
insert into Va values(4,'Images/07.png',3,'����7ϵ',2014,1,'3.5L','�Զ�','888.25',0)
insert into Va values(2,'Images/08.png',4,'��������',2013,1,'3.8L','�ֶ�','777.25',1)
insert into Va values(1,'Images/09.png',4,'����̽����',2012,2,'2.7L','�Զ�','999.25',0)
insert into Va values(1,'Images/10.png',4,'�������',2012,2,'2.7L','�Զ�','999.25',0)

select * from Va

--������
create table Orders
(
	OrdersID		int primary key identity,
	Oid				varchar(max),--�������
	uid				int foreign key references Users(Uid),--�û����
	CarInfoid		int foreign key references CarInfo(CarInfoID), --������Ϣ���
	Useing			varchar(50),--�⳵��;
	StartTime		varchar(max),   --ȡ��ʱ��
	EndTime			varchar(max),   --����ʱ��
	Driver			int check(Driver>0 and Driver<3),		--�Ƿ�����˾��
	Price	        decimal,    --����
	ZT				int check(ZT>0 and ZT<4) default(1),--(1:����Ԥ�� 2:������· 3:ȡ������)
	Hitch			int check(Hitch>0 and Hitch<5) default(1)  --(1:�������� 2���������� 3������ͨ�� 4���д�����)
)

insert into Orders values('Bch20200504',1,1,'�Լ���','2020-05-04','2020-05-05',1,'200.2',default,default)
insert into Orders values('Bch20200504',2,2,'�Լ���','2020-05-04','2020-05-05',1,'222.2',default,2)
select * from Orders join CarInfo on Orders.CarInfoid=CarInfo.CarInfoID

--����ԭ���
create table Breakdown
(
	BreakdownID int primary key identity,
	Reson       varchar(max), --����ԭ������
	Phone		varchar(20), --��ϵ�绰
	OrdersID	int foreign key references Orders(OrdersID), --���������
)

insert into Breakdown values('û����','123456789',2)
select * from Breakdown join Orders on Breakdown.OrdersID=Orders.OrdersID where Orders.OrdersID=3

--�������ģ��������⣩
create table Trouble
(
	TroubleID		int primary key identity,
	Condition		varchar(max), --�⳵����
	Standard		varchar(max), --���ñ�׼
	ContactUs		varchar(max)  --��ϵ����
)

------------------------------ ����Ա��¼����̨��----------------------------------------------
 
--����Ա��¼  ������  ���� ������
create table Admins
(
	  Uid		int identity primary key,
	  Name		varchar(50),--�û���
	  Pwd		varchar(50),--����
	  Email		varchar(50),--����
)
insert into Admins values('zk','123456','56509647@qq.com')
insert into Admins values('yyh','123456','714386517@qq.com')
insert into Admins values('ycx','123456','2849985501@qq.com')
insert into Admins values('lvj','123456','643241336@qq.com')
insert into Admins values('zjl','123456','2455284942@qq.com')




