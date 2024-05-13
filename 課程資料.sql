CREATE TABLE COURSES (
    IDUSER INT NOT NULL,
    PRODUST_ID INT IDENTITY(200001, 1) PRIMARY KEY,
    COURSE_NAME NVARCHAR(100) NOT NULL,
    DESCRIPTION NVARCHAR(MAX) NOT NULL,
    COURSE_TYPE NVARCHAR(50) NOT NULL,
    START_DATE DATE NOT NULL,  -- �קאּ�M����������
    END_DATE DATE NOT NULL,    -- �קאּ�M����������
    DEADLINE_DATE DATE NOT NULL, -- �����W�٩M�ƾ�����
    LOCATION NVARCHAR(100) NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    TEACHER_NAME NVARCHAR(50) NOT NULL,
    TEACHER_CONTACT NVARCHAR(50) NOT NULL,
    ENROLLMENT_COUNT INT NOT NULL DEFAULT 0,
    MAX_CAPACITY INT NOT NULL,
    COURSE_IMAGE NVARCHAR(MAX) NULL
);


INSERT INTO COURSES (IDUSER, COURSE_NAME, DESCRIPTION, COURSE_TYPE, START_DATE, END_DATE, DEADLINE_DATE, LOCATION, PRICE, TEACHER_NAME, TEACHER_CONTACT, ENROLLMENT_COUNT, MAX_CAPACITY, COURSE_IMAGE)?VALUES?(1001, '��¦ (Basic)', '�򥻪��R�B', '�h��ҵ{', '2024-01-31', '2024-02-04', '2024-01-30', '�v�j��|�]/���ߩ�', 2000, 'Alice Smith', 'alice@example.com', 15, 20, '/images/Courses_class1.jpg'),??(1002, '��¦ (Basic)', '�D�ԻR�зR�n�̪��ޥ��M��{', '�h��ҵ{', '2024-03-05', '2024-03-26', '2024-03-04', '�ǩӱƽm���G��', 4000, 'Carlos Martinez', 'carlos@example.com', 20, 25, '/images/Courses_class3.jpg'),?(1003, '���� (Intermediate)', '���ɻR�Чޥ��M��{����', '���ҵ{', '2024-03-13', '2024-03-13', '2024-03-12', '�ǩӱƽm���G��', 1200,  'Michael Johnson', 'michael@example.com', 20, 25, '/images/Courses_class3.jpg'),?(1004, '���� (Advanced)', '�i�@�B���ɻR�Чޥ��M��{����', '���ҵ{', '2024-03-20', '2024-03-20', '2024-03-19', '�ǩӱƽm���G��', 1400, 'Emily Davis', 'emily@example.com', 25, 30, '/images/Courses_class3.jpg'),?(1005, '�M�~ (Professional)', '�`�ƱM�~�R�Чޥ��M��{', '���ҵ{', '2024-03-27', '2024-03-27', '2024-03-26', '�ǩӱƽm���G��', 1600, 'Jessica Brown', 'jessica@example.com', 25, 30, '/images/Courses_class3.jpg'),?(1006, '�F�H (Expert)', '��i���ŻR�Чޥ��M��{', '���ҵ{', '2024-03-15', '2024-03-15', '2024-03-17', '�ǩӱƽm���G��', 2000, 'Alice Smith', 'alice@example.com', 25, 30, '/images/Courses_class3.jpg'),??(1007, '��¦ (Basic)', '�D�ԻR�зR�n�̪��ޥ��M��{', '�h��ҵ{', '2024-04-09', '2024-04-30', '2024-04-08', '�ǩӱƽm���G��', 4000, 'Carlos Martinez', 'carlos@example.com', 20, 25, '/images/Courses_class4.jpg'),?(1008, '���� (Intermediate)', '���ɻR�Чޥ��M��{����', '���ҵ{', '2024-04-10', '2024-04-10', '2024-04-09', '�ǩӱƽm���G��', 1200,  'Michael Johnson', 'michael@example.com', 20, 25, '/images/Courses_class4.jpg'),?(1009, '���� (Advanced)', '�i�@�B���ɻR�Чޥ��M��{����', '���ҵ{', '2024-04-16', '2024-04-16', '2024-04-15', '�ǩӱƽm���G��', 1400, 'Emily Davis', 'emily@example.com', 25, 30, '/images/Courses_class4.jpg'),?(1010, '�M�~ (Professional)', '�`�ƱM�~�R�Чޥ��M��{', '���ҵ{', '2024-04-23', '2024-04-23', '2024-04-22', '�ǩӱƽm���G��', 1600, 'Jessica Brown', 'jessica@example.com', 25, 30, '/images/Courses_class4.jpg'),?(1011, '�F�H (Expert)', '��i���ŻR�Чޥ��M��{', '���ҵ{', '2024-04-30', '2024-04-30', '2024-04-29', '�ǩӱƽm���G��', 2000, 'Alice Smith', 'jessica@example.com', 25, 30, '/images/Courses_class4.jpg');?????
SELECT * FROM COURSESdrop table COURSES