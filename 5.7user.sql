
use servdb;

CREATE TABLE USERCONTACTNEW(
	CONTACTID INT IDENTITY(1001,1) NOT NULL PRIMARY KEY,
	USERNAME NVARCHAR(30)  NULL,
	USEREMAIL NVARCHAR(MAX)  NULL,
	USERPHONE NVARCHAR(10)  NULL,
	USERADDRESS NVARCHAR(MAX)  NULL
	
)

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
	THIRDPARTYLOGIN INT NULL, 
	PERMISSION INT NULL,     
	FOREIGN KEY (FK_CONTACTID) REFERENCES USERCONTACTNEW(CONTACTID)
)

select * from USERCONTACTNEW
select * from USERSNEW

drop table USERSNEW
drop table USERCONTACTNEW

DBCC CHECKIDENT (USERCONTACTNEW, RESEED, 1011);
DBCC CHECKIDENT (USERSNEW, RESEED, 1011);

--�d��Fk����
SELECT name, OBJECT_NAME(parent_object_id) AS referencing_table
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('ORDER3');

--�s�W��ݱb��
INSERT INTO USERCONTACTNEW (USERNAME, USEREMAIL, USERPHONE, USERADDRESS)
VALUES 
('王大明', 'mhou6vm000@gmail.com', '0912345678', '台北市信義區忠孝東路'),
('林小美', 'lin.xiaomei@example.com', '0923456789', '新北市板橋區文化路'),
('陳阿財', 'chen.acai@example.com', '0934567890', '台中市西屯區市政北路'),
('張美麗', 'zhang.meili@example.com', '0945678901', '台南市安南區樹林路'),
('李大為', 'li.dawei@example.com', '0956789012', '高雄市前鎮區興中路'),
('吳小花', 'wu.xiaohua@example.com', '0967890123', '桃園市中壢區中北路'),
('劉阿英', 'liu.aaying@example.com', '0978901234', '新竹市東區中華路'),
('黃小龍', 'huang.xiaolong@example.com', '0989012345', '苗栗縣苗栗市國華路'),
('蔡大山', 'cai.dashan@example.com', '0990123456', '彰化縣彰化市中正路'),
('楊小明', 'yang.xiaoming@example.com', '0911122334', '南投縣南投市中興路');

INSERT INTO USERSNEW (FK_CONTACTID, NICKNAME, GENDER, PASSWORD, BIRTHDAY, USERPICTURE, DANCECHARACTER, DANCEAGE, THIRDPARTYLOGIN, PERMISSION)
VALUES 
(1001, 'JD', '男', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1985-01-15', '/images/user1.jpg', 'Leader', '5', 0, 1),
(1002, 'JS', '女', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1990-03-20', '/images/user2.jpg', 'Follower', '3', 0, 1),
(1003, 'MJ', '男', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1978-09-25', '/images/user3.jpg', 'Leader', '7', 0, 1),
(1004, 'ED', '女', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1982-07-10', '/images/user4.jpg', 'Follower', '4', 0, 1),
(1005, 'CB', '男', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1995-05-12', '/images/user5.jpg', 'Leader', '6', 0, 1),
(1006, 'JW', '女', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1989-11-30', '/images/user6.jpg', 'Follower', '2', 0, 1),
(1007, 'DT', '男', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1987-04-03', '/images/user7.jpg', 'Leader', '8', 0, 1),
(1008, 'AM', '女', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1992-12-18', '/images/user8.jpg', 'Follower', '5', 0, 1),
(1009, 'MA', '女', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1984-08-08', '/images/user9.jpg', 'Leader', '3', 0, 1),
(1010, 'JR', '男', '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm', '1997-02-28', '/images/user10.jpg', 'Follower', '6', 0, 0);

--�����Τ�ШD�o�e�l��� �ͦ���token�H�� �H�β��ͮɶ��A�P�_�s���O�_���T�H�Υ���
create table usertoken(
	id int identity(1,1) not null PRIMARY KEY,
	userid int null,
	token varchar(max)  null,
	out_time datetime2 null,
	statu int null,
	CONSTRAINT uc_userid UNIQUE (userid)
)
select * from usertoken;
drop table usertoken;

Select * from USERSNEW
Select * from USERCONTACTNEW

CREATE TABLE MATCHES (
    MATCH_ID INT IDENTITY(2001,1) NOT NULL PRIMARY KEY, 
    USER1_ID INT NOT NULL, 
    USER2_ID INT NOT NULL, 
    MATCH_DATE DATETIME NOT NULL,
    MATCH_SUCCESS BIT,
    MATCH_STATUS VARCHAR(10)
);