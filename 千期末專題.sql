CREATE TABLE EVENT(
PRODUCTID INT IDENTITY(300000,1) NOT NULL PRIMARY KEY,
EVENT_NAME NVARCHAR(50) NOT NULL, 
SIGNUP_STARTIME DATETIME2,
SIGNUP_ENDTIME DATETIME2,
EVENT_STARTIME DATETIME2,
EVENT_ENDTIME DATETIME2,
EVENT_DETAIL TEXT,
EVENT_CATEGORY NVARCHAR(MAX) NULL, --COURSE OR PARTY
EVENT_PRICE DECIMAL(10, 2) NOT NULL,
EVENT_ADDRES NVARCHAR(255) NOT NULL,
ORGANIZER NVARCHAR(MAX) NULL,
PICTURE NVARCHAR(MAX) NULL,
--photo_id INT FOREIGN KEY REFERENCES Photos(photo_id)
)

CREATE TABLE Photos (
    photo_id INT PRIMARY KEY IDENTITY,
    photo_name VARCHAR(255),
    photo_data VARBINARY(MAX),

);

insert into EVENT values('Charleston Movement','2024-05-06','2024-05-16','2024-06-15','2024-06-17','Concert with THREE COOL CATS',
'LINDY','400','Asi幸福站','JFSwing','/images/bubble.jpg');
insert into EVENT values('Jazz Feet Weekend','2024-06-01','2024-06-20','2024-08-08','2024-08-11','Nathan&Meti&Andante',
'LINDY','700','西門紅樓','JFSwing','/images/logo.jpg');
insert into EVENT values('Swing Rhythms','2024-07-01','2024-07-18','2024-09-24','2024-09-26','Program:BALBOA workshop with MELANIE & ALBERT',
'BALBOA','500','Big Apple studio 復興教室','Big Apple','/images/nathan.jpg');
insert into EVENT values('Keep Punching','2024-08-01','2024-08-20','2024-08-27','2024-08-30','Herrang Dance Camp',
'LINDY','800','shita空間','JFSwing','/images/andante.jpg');
insert into EVENT values('Live Band Foreast','2024-09-06 10:00:00','2024-09-25 12:00:00','2024-10-15 20:00:00','2024-10-17 23:00:00','Jhouse,Hopshbam DELUXE',
'LINDY','500','中山堂','JFSwing','/images/party.jpg');
insert into EVENT values('Live Band Foreast','2024-9-18 10:00:00','2024-09-28 12:00:00','2024-10-09 10:00:00','2024-10-11 12:00:00','Spring Hop',
'LINDY','600','中山堂','JFSwing','/images/catscorner.jpg');

select*from EVENT;
drop table EVENT;




--VIEW跟資料庫內容是不同的


-- 前台會員管理訂單
CREATE TABLE USEREVENT (
	EVENTORDERID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,--訂單編號--pk
	ORDERTDATE DATE NOT NULL, -- 訂單日期 
	PRODUCTID INT NOT NULL CONSTRAINT EVENT_PRODUCTID_fk REFERENCES EVENT(PRODUCTID),--fk
	EVENT_NAME NVARCHAR(50) NOT NULL, --join
	EVENT_STARTIME DATETIME2,--join--活動名稱(join產生EVENT_NAME活動名稱EVENT_STARTIME活動日期)
	EVENT_PRICE DECIMAL(10, 2) NOT NULL, 
	ORDER_STATUS  NVARCHAR(20) NOT NULL DEFAULT'已付款',--訂單取消,請求審核中	
	--FK_IDUSER--會員編號
	IDUSER INT NOT NULL CONSTRAINT USEREVENT_IDUSER_fk REFERENCES users(IDUSER),--fk
	MAXIMUM INT,--報名上限
	SIGNEDUP_NUMBER INT, --已報名人數
)
	
	--EVENT_NAME NVARCHAR(50) NOT NULL, --join
	--EVENT_STARTIME DATETIME2,--join--活動名稱(join產生EVENT_NAME活動名稱EVENT_STARTIME活動日期)

select u.EVENTORDERID,u.ORDERTDATE ,u.PRODUCTID,e.EVENT_NAME,e.EVENT_STARTIME ,u.EVENT_PRICE,u.ORDER_STATUS,u.IDUSER
,u.MAXIMUM,u.SIGNEDUP_NUMBER
FROM EVENT e LEFT JOIN USEREVENT u ON e.EVENT_NAME = u.EVENT_NAME;


select*from USEREVENT;
drop table USEREVENT;


CREATE TABLE users(
IDUSER INT IDENTITY(1000,1) NOT NULL PRIMARY KEY,
username NVARCHAR(MAX) NOT NULL,
)
select*from users;
insert into users values('Mary');
insert into users values('Leo');
insert into users values('Jhon');

DROP TABLE users;

