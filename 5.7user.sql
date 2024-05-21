
use servdb;

--�s�|��-�p����T
CREATE TABLE USERCONTACTNEW(
	CONTACTID INT IDENTITY(1001,1) NOT NULL PRIMARY KEY,
	USERNAME NVARCHAR(30)  NULL,
	USEREMAIL NVARCHAR(MAX)  NULL,
	USERPHONE NVARCHAR(10)  NULL,
	USERADDRESS NVARCHAR(MAX)  NULL
	
)
--�s�|��-�򥻸��
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
	THIRDPARTYLOGIN INT NULL, --�ĤT��n�J 0 = �L�ϥ� 1 = �ϥ�
	PERMISSION INT NULL,      --�v��       0 = �|��   1 = �޲z��
	FOREIGN KEY (FK_CONTACTID) REFERENCES USERCONTACTNEW(CONTACTID)
)

select * from USERCONTACTNEW
select * from USERSNEW

drop table USERSNEW
drop table USERCONTACTNEW

--�d��Fk����
SELECT name, OBJECT_NAME(parent_object_id) AS referencing_table
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('ORDER3');

--�s�W��ݱb��
INSERT INTO USERCONTACTNEW (USERNAME, USEREMAIL, USERPHONE, USERADDRESS)
VALUES 
    ('���j��', 'john.doe@example.com', '1234567890', '�x�_�������ϩ�������@�q1��'),
    ('�L�p��', 'jane.smith@example.com', '0987654321', '�s�_���O���Ϥ�Ƹ�2�q2��'),
    ('�i�p��', 'michael.johnson@example.com', '1112223333', '�x������Ϥ�����3��'),
    ('���p��', 'emily.brown@example.com', '5556667777', '�������Q�L�Ϥj�i��4��'),
    ('���p�j', 'david.lee@example.com', '7778889999', '�x�n���w�n�Ϧw�M��5��'),
    ('�d�p��', 'sarah.wilson@example.com', '9998887777', '��饫���c�Ϥ��s��6��'),
    ('�B�p�s', 'daniel.taylor@example.com', '4445556666', '�x�F���x�F��������7��'),
    ('���p��', 'jessica.martinez@example.com', '3332221111', '�y�����y�������R��8��'),
    ('�\�p�a', 'matthew.anderson@example.com', '2223334444', '���ƿ����ƥ����͸�9��'),
    ('���p�S', 'amanda.thomas@example.com', '6665554444', '�Ὤ���Ὤ�����p�@��10��');

INSERT INTO USERSNEW (FK_CONTACTID, NICKNAME, GENDER, PASSWORD, BIRTHDAY, USERPICTURE, DANCECHARACTER, DANCEAGE, THIRDPARTYLOGIN, PERMISSION)
VALUES 
    (1001, 'JohnDoe123456', '�k', 'password123', '1990-05-15', NULL, 'Hip Hop', 'Intermediate', 0, 1),
    (1002, 'JaneSmith456', '�k', 'password456', '1985-08-20', NULL, 'Contemporary', 'Beginner', 0, 1),
    (1003, 'MichaelJ', '�k', 'mikepass', '1982-03-10', NULL, 'Salsa', 'Advanced', 0, 1),
    (1004, 'EmBrownie', '�k', 'brownie123', '1995-11-30', NULL, 'Ballet', 'Intermediate', 0, 1),
    (1005, 'DavidL', '�k', 'davidpass', '1988-07-05', NULL, 'Ballroom', 'Advanced', 0, 1),
    (1006, 'SWilson', '�k', 'sarah123', '1992-01-25', NULL, 'Tap', 'Beginner', 0, 1),
    (1007, 'DanT', '�k', 'dantpass', '1983-09-12', NULL, 'Breakdance', 'Intermediate', 0, 1),
    (1008, 'JessMart', '�k', 'jesspass', '1987-06-18', NULL, 'Jazz', 'Advanced', 0, 0),
    (1009, 'MattA', '�k', 'matt123', '1993-04-08', NULL, 'Swing', 'Beginner', 0, 0),
    (1010, 'AmandaT', '�k', 'amandapass', '1998-02-20', NULL, 'Irish Dance', 'Intermediate', 0, 0);

	--�ק�
	UPDATE USERCONTACTNEW
SET USERNAME = '���p��',
    USEREMAIL = 'mhou6vm000@gmail.com',
    USERPHONE = '1234567890',
    USERADDRESS = '�x�_�������ϩ�������@�q1��'
WHERE CONTACTID = 1001;

UPDATE USERSNEW
SET NICKNAME = '�����x',
    GENDER = '�k',
    PASSWORD = '$2a$10$O8Hkpldxv2SqkJMgQGVf1uFlomsnI469Chx7xd3KyfqO8wkSpCYGm',
    BIRTHDAY = '1990-05-15',
    USERPICTURE = NULL,
    DANCECHARACTER = 'Hip Hop',
    DANCEAGE = 'Intermediate',
    THIRDPARTYLOGIN = 0,
    PERMISSION = 1
WHERE FK_CONTACTID = 1001;


--�����Τ�ШD�o�e�l��� �ͦ���token�H�� �H�β��ͮɶ��A�P�_�s���O�_���T�H�Υ���
create table usertoken(
	id int identity(1,1) not null PRIMARY KEY,
	userid int null,
	token varchar(max)  null,
	out_time datetime2 null
	CONSTRAINT uc_userid UNIQUE (userid)
)
select * from usertoken;
drop table usertoken;

Select * from USERSNEW
Select * from USERCONTACTNEW
