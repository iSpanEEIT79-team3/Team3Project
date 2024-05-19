CREATE TABLE COURSES (
    IDUSER INT NOT NULL,
    PRODUST_ID INT IDENTITY(200001, 1) PRIMARY KEY,
    COURSE_NAME NVARCHAR(100) NOT NULL,
    DESCRIPTION NVARCHAR(MAX) NOT NULL,
    COURSE_TYPE NVARCHAR(50) NOT NULL,
    START_DATE DATE NOT NULL,  -- 修改為專門的日期欄位
    END_DATE DATE NOT NULL,    -- 修改為專門的日期欄位
    DEADLINE_DATE DATE NOT NULL, -- 更正欄位名稱和數據類型
    LOCATION NVARCHAR(100) NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    TEACHER_NAME NVARCHAR(50) NOT NULL,
    TEACHER_CONTACT NVARCHAR(50) NOT NULL,
    ENROLLMENT_COUNT INT NOT NULL DEFAULT 0,
    MAX_CAPACITY INT NOT NULL,
    COURSE_IMAGE NVARCHAR(MAX) NULL
);


INSERT INTO COURSES (IDUSER, COURSE_NAME, DESCRIPTION, COURSE_TYPE, START_DATE, END_DATE, DEADLINE_DATE, LOCATION, PRICE, TEACHER_NAME, TEACHER_CONTACT, ENROLLMENT_COUNT, MAX_CAPACITY, COURSE_IMAGE)?VALUES?(1001, '基礎 (Basic)', '基本的舞步', '多日課程', '2024-01-31', '2024-02-04', '2024-01-30', '師大體育館/韻律房', 2000, 'Alice Smith', 'alice@example.com', 15, 20, '/images/Courses_class1.jpg'),??(1002, '基礎 (Basic)', '挑戰舞蹈愛好者的技巧和表現', '多日課程', '2024-03-05', '2024-03-26', '2024-03-04', '傳承排練場二樓', 4000, 'Carlos Martinez', 'carlos@example.com', 20, 25, '/images/Courses_class3.jpg'),?(1003, '中級 (Intermediate)', '提升舞蹈技巧和表現水平', '單日課程', '2024-03-13', '2024-03-13', '2024-03-12', '傳承排練場二樓', 1200,  'Michael Johnson', 'michael@example.com', 20, 25, '/images/Courses_class3.jpg'),?(1004, '高級 (Advanced)', '進一步提升舞蹈技巧和表現水平', '單日課程', '2024-03-20', '2024-03-20', '2024-03-19', '傳承排練場二樓', 1400, 'Emily Davis', 'emily@example.com', 25, 30, '/images/Courses_class3.jpg'),?(1005, '專業 (Professional)', '深化專業舞蹈技巧和表現', '單日課程', '2024-03-27', '2024-03-27', '2024-03-26', '傳承排練場二樓', 1600, 'Jessica Brown', 'jessica@example.com', 25, 30, '/images/Courses_class3.jpg'),?(1006, '達人 (Expert)', '精進高級舞蹈技巧和表現', '單日課程', '2024-03-15', '2024-03-15', '2024-03-17', '傳承排練場二樓', 2000, 'Alice Smith', 'alice@example.com', 25, 30, '/images/Courses_class3.jpg'),??(1007, '基礎 (Basic)', '挑戰舞蹈愛好者的技巧和表現', '多日課程', '2024-04-09', '2024-04-30', '2024-04-08', '傳承排練場二樓', 4000, 'Carlos Martinez', 'carlos@example.com', 20, 25, '/images/Courses_class4.jpg'),?(1008, '中級 (Intermediate)', '提升舞蹈技巧和表現水平', '單日課程', '2024-04-10', '2024-04-10', '2024-04-09', '傳承排練場二樓', 1200,  'Michael Johnson', 'michael@example.com', 20, 25, '/images/Courses_class4.jpg'),?(1009, '高級 (Advanced)', '進一步提升舞蹈技巧和表現水平', '單日課程', '2024-04-16', '2024-04-16', '2024-04-15', '傳承排練場二樓', 1400, 'Emily Davis', 'emily@example.com', 25, 30, '/images/Courses_class4.jpg'),?(1010, '專業 (Professional)', '深化專業舞蹈技巧和表現', '單日課程', '2024-04-23', '2024-04-23', '2024-04-22', '傳承排練場二樓', 1600, 'Jessica Brown', 'jessica@example.com', 25, 30, '/images/Courses_class4.jpg'),?(1011, '達人 (Expert)', '精進高級舞蹈技巧和表現', '單日課程', '2024-04-30', '2024-04-30', '2024-04-29', '傳承排練場二樓', 2000, 'Alice Smith', 'jessica@example.com', 25, 30, '/images/Courses_class4.jpg');?????
SELECT * FROM COURSESdrop table COURSES