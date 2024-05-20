﻿		CREATE TABLE LT(
		LTID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
		TITLE NVARCHAR(100) NOT NULL,
		USERID INT ,
		DATE  DATETIME2 DEFAULT GETDATE() ,
		PICTURE NVARCHAR(100) NULL,
		CONTENT TEXT NOT NULL,
		SAVELIKE INT DEFAULT 1	,
		PAGEVIEWS INT,　
		COLLECT  int DEFAULT 1,
		USERNAME NVARCHAR(500)  

		);	
	
CREATE TABLE REPLY(
REPLYID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
REPLYTIME DATETIME2 DEFAULT GETDATE() ,
REPLYPOST NVARCHAR(500) NOT NULL,
USERID INT ,
LTID   INT ,
FOREIGN KEY(LTID) REFERENCES LT(LTID)
ON DELETE SET NULL
);

CREATE TABLE REPORTPOST(
REPORTID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
REPORTCONTENT NVARCHAR (500) NOT NULL,
LTID INT,
FOREIGN KEY(LTID) REFERENCES LT(LTID)
ON DELETE  SET NULL

)
CREATE TABLE REPORTREPLY(
REPORTREPLYID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
REPORTCONTENT NVARCHAR (500) NOT NULL,
REPLYID INT,
FOREIGN KEY(REPLYID) REFERENCES REPLY(REPLYID)
ON DELETE  SET NULL
)

CREATE TABLE LIKEpost (
    LikeID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID INT,
    LTID INT,
    CONSTRAINT fk_LTID1 FOREIGN KEY (LTID) REFERENCES LT(LTID) ON DELETE  CASCADE,
    CONSTRAINT fk_UserID1 FOREIGN KEY (UserID) REFERENCES USERSNEW(UserID) ON DELETE  CASCADE,
    CONSTRAINT UserArticle UNIQUE (UserID, LTID)
);

CREATE TABLE PAGEVIEWS (
    PAGEVIEWSID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID INT,
    LTID INT,
    CONSTRAINT fk_LTID2 FOREIGN KEY (LTID) REFERENCES LT(LTID) ON DELETE  CASCADE,
    CONSTRAINT fk_UserID2 FOREIGN KEY (UserID) REFERENCES USERSNEW(UserID) ON DELETE  CASCADE,
    CONSTRAINT PAGESArticle UNIQUE (UserID, LTID)
);


CREATE TABLE COLLECT (
    COLLECTID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    LTID INT,
    USERID INT,
    CONSTRAINT fk_LTID FOREIGN KEY (LTID) REFERENCES LT(LTID) ON DELETE CASCADE,
    CONSTRAINT fk_UserID FOREIGN KEY (UserID) REFERENCES USERSNEW(UserID) ON DELETE CASCADE,
    CONSTRAINT COLLECTArticle UNIQUE (UserID, LTID)
);


SELECT * FROM LT
SELECT * FROM Reply
SELECT * FROM REPORTPOST
SELECT * FROM REPORTREPLY
SELECT * FROM LIKEPOST
SELECT * FROM COLLECT
SELECT * FROM PAGEVIEWS

	
DROP TABLE LT;
DROP TABLE REPORPOST
DROP TABLE REPLY;
DROP TABLE REPORTREPLY;
DROP TABLE likePOST;
DROP TABLE PAGEVIEWS;
DROP TABLE COLLECT;


	
INSERT INTO LT (TITLE, USERID, PICTURE, CONTENT, SAVELIKE, PAGEVIEWS, COLLECT, USERNAME)
VALUES 
('可愛小貓', 201, 'images/cat2.jpg', '這是一隻可愛的小貓，它的毛色非常柔軟，總是讓人心情愉悅。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '張小明'),
('快樂小狗', 202, 'images/cat3.jpg', '這隻小狗非常快樂，它總是搖尾巴迎接每一位朋友，讓人感到溫暖。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '王小華'),
('機靈小兔', 203, 'images/dog1.jpg', '這隻小兔子非常機靈，總是在草叢中跳來跳去，像是在玩一場無憂無慮的遊戲。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '陳小美'),
('美麗小鳥', 204, 'images/catQQ.jpg', '這隻小鳥色彩繽紛，翅膀展開時宛如一幅美麗的畫作，讓人驚嘆大自然的奇妙。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '林小慧'),
('慵懶小熊', 205, 'images/cat2.jpg', '這隻小熊非常慵懶，喜歡找個舒適的地方打盹，讓人感受到一股悠閒的氛圍。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '李小龍'),
('勇敢小獅', 206, 'images/dog2.jpg', '這隻小獅子非常勇敢，總是敢於面對困難，展現出強大的勇氣和決心。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '張小華'),
('活潑小鹿', 207, 'images/cat3.jpg', '這隻小鹿非常活潑，總是在林間奔跑，展現出無盡的活力和生命力。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '陳小明'),
('溫柔小豬', 208, 'images/dog2.jpg', '這隻小豬非常溫柔，總是躺在泥巴中享受陽光，給人一種愜意的感覺。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '王小美'),
('聰明小猴', 209, 'images/dog1.jpg', '這隻小猴子非常聰明，總是能夠找到解決問題的方法，讓人對它刮目相看。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '吳小華'),
('活潑小松鼠', 210, 'images/cat3.jpg', '這隻小松鼠非常活潑，總是在樹上跳來跳去，展現出靈活的身手和敏捷的動作。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '林小華'),
('溫馴小鴿', 211, 'images/cat3.jpg', '這隻小鴿子非常溫馴，總是在公園裡和人們親近，讓人感受到和平與友愛。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '李小明')
('小松鼠', 212, 'images/catQQ.jpg', '這隻小鴿子非常溫馴，總是在公園裡和人們親近，讓人感受到和平與友愛。', FLOOR(RAND()*(7000-800+1)+800), FLOOR(RAND()*(10000-5000+1)+5000), FLOOR(RAND()*(6500-1700+1)+1700), '李小明')


SELECT DISTINCT LTID FROM REPLY WHERE LTID NOT IN (SELECT LTID FROM LT);

-- LTID = 13 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 13)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小狗太可愛了！', 307, 13),
    (GETDATE(), '我也想要一隻這樣的小狗！', 308, 13);
END

-- LTID = 14 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 14)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小貓的毛色好漂亮！', 309, 14),
    (GETDATE(), '小貓看起來好溫馴！', 310, 14);
END

-- LTID = 15 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 15)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小兔子的眼睛好大！', 311, 15),
    (GETDATE(), '小兔子的動作好可愛！', 312, 15);
END

-- LTID = 16 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 16)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小鳥的歌聲真動聽！', 313, 16),
    (GETDATE(), '小鳥飛得好高啊！', 314, 16);
END

-- LTID = 17 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 17)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小熊好可愛！', 315, 17),
    (GETDATE(), '小熊在做什麼呢？', 316, 17);
END


-- LTID = 1 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 1)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小貓太可愛了！', 317, 1),
    (GETDATE(), '小貓的眼睛好有神！', 318, 1);
END

-- LTID = 2 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 2)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小狗好開心啊！', 319, 2),
    (GETDATE(), '我也想要養一隻小狗！', 320, 2);
END

-- LTID = 3 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 3)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小兔子跳得好高啊！', 321, 3),
    (GETDATE(), '這隻小兔子的毛色好漂亮！', 322, 3);
END

-- LTID = 4 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 4)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小鳥飛得好快！', 323, 4),
    (GETDATE(), '小鳥的羽毛好亮啊！', 324, 4);
END

-- LTID = 5 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 5)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小熊好慵懶啊！', 325, 5),
    (GETDATE(), '我也想要一隻小熊當寵物！', 326, 5);
END
-- LTID = 6 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 6)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小獅子好勇敢！', 327, 6),
    (GETDATE(), '小獅子的鬃毛好漂亮！', 328, 6);
END

-- LTID = 7 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 7)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小鹿在跑步好優雅！', 329, 7),
    (GETDATE(), '我也想去森林看看小鹿！', 330, 7);
END

-- LTID = 8 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 8)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小豬好可愛啊！', 331, 8),
    (GETDATE(), '我想給小豬抱抱！', 332, 8);
END

-- LTID = 9 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 9)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小猴子好聰明啊！', 333, 9),
    (GETDATE(), '這隻小猴子看起來好活潑！', 334, 9);
END

-- LTID = 10 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 10)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小松鼠在樹上跳得好快！', 335, 10),
    (GETDATE(), '我想摸摸小松鼠的尾巴！', 336, 10);
END

-- LTID = 11 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 11)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小鴿子好溫馴！', 337, 11),
    (GETDATE(), '我喜歡小鴿子的羽毛顏色！', 338, 11);
END

-- LTID = 12 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 12)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小鼠好可愛啊！', 339, 12),
    (GETDATE(), '我也想養一隻小鼠當寵物！', 340, 12);
END

-- LTID = 18 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 18)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小兔子在草叢中好可愛！', 341, 18),
    (GETDATE(), '我也想摸摸小兔子！', 342, 18);
END

-- LTID = 19 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 19)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小鳥的羽毛顏色好漂亮！', 343, 19),
    (GETDATE(), '我也想要一隻小鳥當寵物！', 344, 19);
END

-- LTID = 20 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 20)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小熊好懶啊！', 345, 20),
    (GETDATE(), '我也想和小熊一起打盹！', 346, 20);
END

-- LTID = 21 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 21)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小獅子好勇敢！', 347, 21),
    (GETDATE(), '我喜歡小獅子的模樣！', 348, 21);
END

-- LTID = 22 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 22)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '這隻小鹿的角好漂亮！', 349, 22),
    (GETDATE(), '小鹿看起來好優雅！', 350, 22);
END

-- LTID = 23 的回覆
IF EXISTS (SELECT 1 FROM LT WHERE LTID = 23)
BEGIN
    INSERT INTO REPLY (REPLYTIME, REPLYPOST, USERID, LTID) 
    VALUES 
    (GETDATE(), '小豬好溫柔！', 351, 23),
    (GETDATE(), '我也想和小豬一起曬太陽！', 352, 23);
END
