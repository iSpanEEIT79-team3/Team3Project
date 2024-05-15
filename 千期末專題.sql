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

SELECT * FROM EVENT ORDER BY EVENT_STARTIME ASC;
--ASC表示升序排序，DESC表示降序排序。

insert into EVENT values('查爾斯頓搬到台灣','2024-05-06','2024-05-16','2024-06-15','2024-06-17','Concert with THREE COOL CATS',
'LINDY','400','Asi幸福站','JFSwing','/images/bubble.jpg');
insert into EVENT values('爵士腳週末','2024-06-01','2024-06-20','2024-08-08','2024-08-11','Nathan&Meti&Andante',
'LINDY','700','西門紅樓','JFSwing','/images/logo.jpg');
insert into EVENT values('Swing節奏','2024-07-01','2024-07-18','2024-09-24','2024-09-26','Program:BALBOA workshop with MELANIE & ALBERT',
'BALBOA','500','Big Apple studio 復興教室','Big Apple','/images/nathan.jpg');
insert into EVENT values('SwingFever搖擺舞派對','2024-05-06','2024-05-16','2024-06-15','2024-06-17','歡迎加入我們舉辦的 Swing Fever 搖擺舞派對！這是一個讓您盡情跳躍、歡笑和享受音樂的絕佳機會。我們將在 City Dance Studio 舉辦這個活動，活動期間將會有專業的搖擺舞老師為您帶來精彩的教學課程，同時也會有DJ為大家播放熱情歡快的 Swing 音樂。無論您是初學者還是搖擺舞高手，這都是一個與朋友們一起跳舞、放鬆身心的絕佳之夜。不要錯過這個難得的機會，穿上您的最佳舞鞋，加入我們一起搖擺吧！',
'LINDY','400','Asi幸福站','JFSwing','/images/bubble.jpg');
insert into EVENT values('KeepPunching','2024-08-01','2024-08-20','2024-08-27','2024-08-30','Herrang Dance Camp',
'LINDY','800','shita空間','JFSwing','/images/andante.jpg');


insert into EVENT values('現場樂隊森林','2024-09-06 10:00:00','2024-09-25 12:00:00','2024-10-15 20:00:00','2024-10-17 23:00:00','森林樂隊是一支具有活力和熱情的樂團，他們專注於搖擺樂和爵士樂的演奏。他們擁有多年的舞台經驗，以其精湛的音樂技藝和生動的表演風格而聞名。

在夏日搖擺帝國活動中，森林樂隊將為觀眾帶來一場精彩的音樂表演。他們將演奏搖擺樂曲目和經典的爵士樂作品，讓您沉浸在優美的旋律和活潑的節奏中。無論您是搖擺樂的愛好者還是想要體驗搖擺文化的新手，森林樂隊的表演都會讓您愉快地擺動起來。

請準時到達活動現場，並找到音樂廣場的最佳位置，以欣賞森林樂隊的表演。他們將為您帶來一個難忘的音樂體驗。

如果您對森林樂隊或其他活動方面有任何特定的問題，請隨時提出，我將樂意為您提供幫助。祝您在夏日搖擺帝國活動中度過一個愉快的時光！',
'LINDY','500','市中心公園音樂廣場','JFSwing','/images/party.jpg');


insert into EVENT values('夏日搖擺帝國','2024-9-18 10:00:00','2024-09-28 12:00:00','2024-10-09 10:00:00','2024-10-11 12:00:00','Spring Hop搖擺樂表演：享受一系列精彩的搖擺樂表演，包括現場樂團和DJ。跳舞吧，隨著節奏擺動，感受搖擺的魅力。
舞蹈教學：不熟悉搖擺舞步？沒問題！我們將提供免費的舞蹈教學課程，讓您學習基本的搖擺舞步，讓您在舞池中大放異彩。
美食攤位：品嚐各種美味的夏季小吃和飲料，讓您的味蕾也能跟著跳動。
娛樂活動：除了音樂和舞蹈，我們還準備了各種娛樂活動，例如遊戲攤位、面部彩繪和氣球藝術，讓您和家人一同度過快樂的時光。
活動攝影：我們將提供專業攝影師，捕捉您在活動中的美好時刻，並提供印刷照片或數位檔案供您保留回憶。',
'LINDY','600','中山堂','JFSwing','/images/catscorner.jpg');

select*from EVENT;
drop table EVENT;

DELETE FROM EVENT;

--Java Mail密碼
--aoqd ppyd onmb vhps

--VIEW跟資料庫內容是不同的
select * from order3
select * from ORDER_DETAILS
drop table order3
drop table ORDER_DETAILS

    CREATE TABLE ORDER3 (
    ORDER_ID BIGINT PRIMARY KEY ,
    FK_CONTACTID INT,
    TOTAL_PRICE INT,
    PAY_STATUS NVARCHAR(20),
    SHIPPING_STATUS NVARCHAR(20),
    ORDER_DATE NVARCHAR(20),
    SHIPPING_DATE NVARCHAR(20),
    PAY_DEADLINE NVARCHAR(20),
    ORDER_NOTE NVARCHAR(100),
    FOREIGN KEY (FK_CONTACTID) REFERENCES USERCONTACTNEW(CONTACTID)
);
CREATE TABLE ORDER_DETAILS (
     ORDER_DETAIL_ID BIGINT,
    ORDER_ID BIGINT,
    PRODUCT_NUM INT,
    PRODUCT_NAME NVARCHAR(20),
    PRODUCT_PRICE INT,
    PRODUCT_QUANTITY INT,
    ORDER_TOTALPRICE INT,
     FOREIGN KEY (ORDER_ID) REFERENCES ORDER3(ORDER_ID) 
);
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

