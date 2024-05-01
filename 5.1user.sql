use servdb;

--新會員-聯絡資訊
CREATE TABLE USERCONTACTNEW(
	CONTACTID INT IDENTITY(1001,1) NOT NULL PRIMARY KEY,
	USERNAME NVARCHAR(30)  NULL,
	USEREMAIL NVARCHAR(MAX)  NULL,
	USERPHONE NVARCHAR(10)  NULL,
	USERADDRESS NVARCHAR(MAX)  NULL
	
)
--新會員-基本資料
CREATE TABLE USERSNEW(
	USERID INT IDENTITY(1001,1) NOT NULL PRIMARY KEY ,
	FK_CONTACTID int not null,
	NICKNAME NVARCHAR(30)  NULL,
	GENDER NVARCHAR(1)  NULL,
	PASSWORD NVARCHAR(MAX) NULL,
	BIRTHDAY DATE  NULL,
	USERPICTURE NVARCHAR(MAX) NULL,
	DANCECHARACTER NVARCHAR(20) NULL,
	DANCEAGE NVARCHAR(20) NULL,
	THIRDPARTYLOGIN INT NULL, --第三方登入 0 = 無使用 1 = 使用
	PERMISSION INT NULL,      --權限       0 = 會員   1 = 管理者
	FOREIGN KEY (FK_CONTACTID) REFERENCES USERCONTACTNEW(CONTACTID)
)

select * from USERCONTACTNEW
select * from USERSNEW

drop table USERSNEW
drop table USERCONTACTNEW

--查詢Fk約束
SELECT name, OBJECT_NAME(parent_object_id) AS referencing_table
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('ORDER3');

--新增後端帳戶
INSERT INTO USERCONTACTNEW (USERNAME, USEREMAIL, USERPHONE, USERADDRESS)
VALUES 
    ('王大明', 'john.doe@example.com', '1234567890', '台北市中正區忠孝西路一段1號'),
    ('林小美', 'jane.smith@example.com', '0987654321', '新北市板橋區文化路2段2號'),
    ('張小偉', 'michael.johnson@example.com', '1112223333', '台中市西區中美街3號'),
    ('陳小芳', 'emily.brown@example.com', '5556667777', '高雄市鹽埕區大勇路4號'),
    ('李小強', 'david.lee@example.com', '7778889999', '台南市安南區安和路5號'),
    ('吳小華', 'sarah.wilson@example.com', '9998887777', '桃園市中壢區中山路6號'),
    ('劉小龍', 'daniel.taylor@example.com', '4445556666', '台東縣台東市中正路7號'),
    ('黃小玲', 'jessica.martinez@example.com', '3332221111', '宜蘭縣宜蘭市仁愛路8號'),
    ('許小軒', 'matthew.anderson@example.com', '2223334444', '彰化縣彰化市民生路9號'),
    ('蔡小娟', 'amanda.thomas@example.com', '6665554444', '花蓮縣花蓮市國聯一路10號');

INSERT INTO USERSNEW (FK_CONTACTID, NICKNAME, GENDER, PASSWORD, BIRTHDAY, USERPICTURE, DANCECHARACTER, DANCEAGE, THIRDPARTYLOGIN, PERMISSION)
VALUES 
    (1001, 'JohnDoe123', '男', 'password123', '1990-05-15', NULL, 'Hip Hop', 'Intermediate', 0, 1),
    (1002, 'JaneSmith456', '女', 'password456', '1985-08-20', NULL, 'Contemporary', 'Beginner', 0, 0),
    (1003, 'MichaelJ', '男', 'mikepass', '1982-03-10', NULL, 'Salsa', 'Advanced', 0, 0),
    (1004, 'EmBrownie', '女', 'brownie123', '1995-11-30', NULL, 'Ballet', 'Intermediate', 0, 0),
    (1005, 'DavidL', '男', 'davidpass', '1988-07-05', NULL, 'Ballroom', 'Advanced', 0, 0),
    (1006, 'SWilson', '女', 'sarah123', '1992-01-25', NULL, 'Tap', 'Beginner', 0, 0),
    (1007, 'DanT', '男', 'dantpass', '1983-09-12', NULL, 'Breakdance', 'Intermediate', 0, 0),
    (1008, 'JessMart', '女', 'jesspass', '1987-06-18', NULL, 'Jazz', 'Advanced', 0, 0),
    (1009, 'MattA', '男', 'matt123', '1993-04-08', NULL, 'Swing', 'Beginner', 0, 0),
    (1010, 'AmandaT', '女', 'amandapass', '1998-02-20', NULL, 'Irish Dance', 'Intermediate', 0, 0);

	--修改
	UPDATE USERCONTACTNEW
SET USERNAME = '王小明',
    USEREMAIL = 'mhou6vm000@gmail.com',
    USERPHONE = '1234567890',
    USERADDRESS = '台北市中正區忠孝西路一段1號'
WHERE CONTACTID = 1001;

UPDATE USERSNEW
SET NICKNAME = 'JohnDoe123',
    GENDER = '男',
    PASSWORD = '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm',
    BIRTHDAY = '1990-05-15',
    USERPICTURE = NULL,
    DANCECHARACTER = 'Hip Hop',
    DANCEAGE = 'Intermediate',
    THIRDPARTYLOGIN = 0,
    PERMISSION = 1
WHERE FK_CONTACTID = 1001;