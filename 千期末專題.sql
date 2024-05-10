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
--ASC��ܤɧǱƧǡADESC��ܭ��ǱƧǡC

insert into EVENT values('�d�����y�h��x�W','2024-05-06','2024-05-16','2024-06-15','2024-06-17','Concert with THREE COOL CATS',
'LINDY','400','Asi���֯�','JFSwing','/images/bubble.jpg');
insert into EVENT values('��h�}�g��','2024-06-01','2024-06-20','2024-08-08','2024-08-11','Nathan&Meti&Andante',
'LINDY','700','�������','JFSwing','/images/logo.jpg');
insert into EVENT values('Swing�`��','2024-07-01','2024-07-18','2024-09-24','2024-09-26','Program:BALBOA workshop with MELANIE & ALBERT',
'BALBOA','500','Big Apple studio �_���Ы�','Big Apple','/images/nathan.jpg');
insert into EVENT values('SwingFever�n�\�R����','2024-05-06','2024-05-16','2024-06-15','2024-06-17','�w��[�J�ڭ��|�쪺 Swing Fever �n�\�R����I�o�O�@�����z�ɱ����D�B�w���M�ɨ����֪����ξ��|�C�ڭ̱N�b City Dance Studio �|��o�Ӭ��ʡA���ʴ����N�|���M�~���n�\�R�Ѯv���z�a�Ӻ�m���оǽҵ{�A�P�ɤ]�|��DJ���j�a��������w�֪� Swing ���֡C�L�ױz�O��Ǫ��٬O�n�\�R����A�o���O�@�ӻP�B�̤ͭ@�_���R�B���P���ߪ����Τ��]�C���n���L�o�����o�����|�A��W�z���̨λR�c�A�[�J�ڭ̤@�_�n�\�a�I',
'LINDY','400','Asi���֯�','JFSwing','/images/bubble.jpg');
insert into EVENT values('KeepPunching','2024-08-01','2024-08-20','2024-08-27','2024-08-30','Herrang Dance Camp',
'LINDY','800','shita�Ŷ�','JFSwing','/images/andante.jpg');
insert into EVENT values('�{���ֶ��˪L','2024-09-06 10:00:00','2024-09-25 12:00:00','2024-10-15 20:00:00','2024-10-17 23:00:00','Jhouse,Hopshbam DELUXE',
'LINDY','500','���s��','JFSwing','/images/party.jpg');
insert into EVENT values('�L��n�\�Ұ�','2024-9-18 10:00:00','2024-09-28 12:00:00','2024-10-09 10:00:00','2024-10-11 12:00:00','Spring Hop',
'LINDY','600','���s��','JFSwing','/images/catscorner.jpg');

select*from EVENT;
drop table EVENT;

DELETE FROM EVENT;

--Java Mail�K�X
--aoqd ppyd onmb vhps

--VIEW���Ʈw���e�O���P��
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
-- �e�x�|���޲z�q��
CREATE TABLE USEREVENT (
	EVENTORDERID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,--�q��s��--pk
	ORDERTDATE DATE NOT NULL, -- �q���� 
	PRODUCTID INT NOT NULL CONSTRAINT EVENT_PRODUCTID_fk REFERENCES EVENT(PRODUCTID),--fk
	EVENT_NAME NVARCHAR(50) NOT NULL, --join
	EVENT_STARTIME DATETIME2,--join--���ʦW��(join����EVENT_NAME���ʦW��EVENT_STARTIME���ʤ��)
	EVENT_PRICE DECIMAL(10, 2) NOT NULL, 
	ORDER_STATUS  NVARCHAR(20) NOT NULL DEFAULT'�w�I��',--�q�����,�ШD�f�֤�	
	--FK_IDUSER--�|���s��
	IDUSER INT NOT NULL CONSTRAINT USEREVENT_IDUSER_fk REFERENCES users(IDUSER),--fk
	MAXIMUM INT,--���W�W��
	SIGNEDUP_NUMBER INT, --�w���W�H��
)
	
	--EVENT_NAME NVARCHAR(50) NOT NULL, --join
	--EVENT_STARTIME DATETIME2,--join--���ʦW��(join����EVENT_NAME���ʦW��EVENT_STARTIME���ʤ��)

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

