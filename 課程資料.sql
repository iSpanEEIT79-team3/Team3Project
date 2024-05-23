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


INSERT INTO COURSES (IDUSER, COURSE_NAME, DESCRIPTION, COURSE_TYPE, START_DATE, END_DATE, DEADLINE_DATE, LOCATION, PRICE, TEACHER_NAME, TEACHER_CONTACT, ENROLLMENT_COUNT, MAX_CAPACITY, COURSE_IMAGE) VALUES (1001, '基礎 (Basic)', '基本的舞步', '多日課程', '2024-01-31', '2024-02-04', '2024-01-30', '師大體育館/韻律房', 2000, 'Alice Smith', 'alice@example.com', 18, 20, '/images/Courses_Basic.png'),  (1002, '基礎 (Basic)', '挑戰舞蹈愛好者的技巧和表現', '多日課程', '2024-06-05', '2024-06-26', '2024-06-04', '台北市博愛路 29 號 2F', 4000, 'Carlos Martinez', 'carlos@example.com', 0, 25, '/images/Courses_Basic.png'), (1003, '中級 (Intermediate)', '提升舞蹈技巧和表現水平', '單日課程', '2024-06-13', '2024-06-13', '2024-06-12', '台北市博愛路 29 號 2F', 1200,  'Michael Johnson', 'michael@example.com', 0, 25, '/images/Intermediate.png'), (1004, '高級 (Advanced)', '進一步提升舞蹈技巧和表現水平', '單日課程', '2024-06-20', '2024-06-20', '2024-06-19', '台北市博愛路 29 號 2F', 1400, 'Emily Davis', 'emily@example.com', 0, 30, '/images/Advanced.png'), (1005, '專業 (Professional)', '深化專業舞蹈技巧和表現', '單日課程', '2024-06-27', '2024-06-27', '2024-06-26', '台北市博愛路 29 號 2F', 1600, 'Jessica Brown', 'jessica@example.com', 0, 30, '/images/Professional.png'), (1006, '達人 (Expert)', '精進高級舞蹈技巧和表現', '單日課程', '2024-06-15', '2024-06-15', '2024-06-17', '台北市博愛路 29 號 2F', 2000, 'Alice Smith', 'alice@example.com', 0, 30, '/images/Expert.png'),  (1007, '基礎 (Basic)', '挑戰舞蹈愛好者的技巧和表現', '多日課程', '2024-04-09', '2024-04-30', '2024-04-08', '台北市博愛路 29 號 2F', 4000, 'Carlos Martinez', 'carlos@example.com', 0, 25, '/images/Courses_Basic.png'), (1008, '中級 (Intermediate)', '提升舞蹈技巧和表現水平', '單日課程', '2024-04-10', '2024-04-10', '2024-04-09', '台北市博愛路 29 號 2F', 1200,  'Michael Johnson', 'michael@example.com', 0, 25, '/images/Intermediate.png'), (1009, '高級 (Advanced)', '進一步提升舞蹈技巧和表現水平', '單日課程', '2024-04-16', '2024-04-16', '2024-04-15', '台北市博愛路 29 號 2F', 1400, 'Emily Davis', 'emily@example.com', 0, 30, '/images/Advanced.png'), (1010, '專業 (Professional)', '深化專業舞蹈技巧和表現', '單日課程', '2024-04-23', '2024-04-23', '2024-04-22', '台北市博愛路 29 號 2F', 1600, 'Jessica Brown', 'jessica@example.com', 0, 30, '/images/Professional.png'), (1011, '達人 (Expert)', '精進高級舞蹈技巧和表現', '單日課程', '2024-04-30', '2024-04-30', '2024-04-29', '傳承排練場二樓', 2000, 'Alice Smith', 'jessica@example.com', 0, 30, '/images/Expert.png');  INSERT INTO COURSES (IDUSER, COURSE_NAME, DESCRIPTION, COURSE_TYPE, START_DATE, END_DATE, DEADLINE_DATE, LOCATION, PRICE, TEACHER_NAME, TEACHER_CONTACT, ENROLLMENT_COUNT, MAX_CAPACITY, COURSE_IMAGE) VALUES (1006, '達人 (Expert)', '精進高級舞蹈技巧和表現', '單日課程', '2024-06-15', '2024-06-15', '2024-06-17', '台北市博愛路 29 號 2F', 2000, 'Alice Smith', 'alice@example.com', 30, 30, '/images/Expert.png'),    
SELECT * FROM COURSES

 DROP TABLE COURSES;

