<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>新增課程</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                max-width: 600px;
                margin-top: 50px;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            h1 {
                font-family: 'Nunito', sans-serif;
                font-weight: 700;
                margin-bottom: 20px;
            }

            .form-group label {
                font-weight: 600;
            }

            .btn-primary,
            .btn-success {
                font-weight: 600;
                border-radius: 50px;
                padding: 10px 20px;
            }
        </style>
        <script>
            function autofillForm() {
                document.getElementById('idUser').value = '1022';
                document.getElementById('courseName').value = 'Intermediate';
                document.getElementById('description').value = '將提高舞蹈的技術水平並拓展舞蹈風格。';
                document.getElementById('courseType').value = '多日課程';
                document.getElementById('startDate').value = '2024-06-01';
                document.getElementById('endDate').value = '2024-06-30';
                document.getElementById('deadlineDate').value = '2024-05-31';
                document.getElementById('location').value = '傳承排練場二樓';
                document.getElementById('price').value = '4000';
                document.getElementById('teacherName').value = 'Juan Rodriguez';
                document.getElementById('teacherContact').value = 'juan@example.com';
                document.getElementById('enrollmentCount').value = '0';
                document.getElementById('maxCapacity').value = '30';
                document.getElementById('courseImage').value = '/images/Courses_class4.jpg';
            }
        </script>
    </head>

    <body>
        <div class="container">
            <h1 class="mb-4 text-center">新增課程</h1>
            <button class="btn btn-primary mb-3" onclick="autofillForm()">一鍵填寫</button>
            <form method="post" action="${pageContext.request.contextPath}/insert" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="idUser">會員ID:</label>
                    <input type="text" class="form-control" id="idUser" name="idUser" required />
                </div>
                <div class="form-group">
                    <label for="courseName">課程名稱:</label>
                    <input type="text" class="form-control" id="courseName" name="courseName" required />
                </div>
                <div class="form-group">
                    <label for="description">描述:</label>
                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label for="courseType">課程類型:</label>
                    <input type="text" class="form-control" id="courseType" name="courseType" required />
                </div>
                <div class="form-group">
                    <label for="startDate">開始日期:</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" required />
                </div>
                <div class="form-group">
                    <label for="endDate">結束日期:</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" required />
                </div>
                <div class="form-group">
                    <label for="deadlineDate">截止日期:</label>
                    <input type="date" class="form-control" id="deadlineDate" name="deadlineDate" required />
                </div>
                <div class="form-group">
                    <label for="location">地點:</label>
                    <input type="text" class="form-control" id="location" name="location" required />
                </div>
                <div class="form-group">
                    <label for="price">價格:</label>
                    <input type="number" class="form-control" id="price" name="price" step="0.01" required />
                </div>
                <div class="form-group">
                    <label for="teacherName">教師名稱:</label>
                    <input type="text" class="form-control" id="teacherName" name="teacherName" required />
                </div>
                <div class="form-group">
                    <label for="teacherContact">教師聯繫方式:</label>
                    <input type="text" class="form-control" id="teacherContact" name="teacherContact" />
                </div>
                <div class="form-group">
                    <label for="enrollmentCount">報名人數:</label>
                    <input type="number" class="form-control" id="enrollmentCount" name="enrollmentCount" required />
                </div>
                <div class="form-group">
                    <label for="maxCapacity">最大容量:</label>
                    <input type="number" class="form-control" id="maxCapacity" name="maxCapacity" required />
                </div>
                <div class="form-group">
                    <label for="courseImage">課程圖片:</label>
                    <input type="file" class="form-control-file" id="courseImage" name="courseImage" />
                </div>
                <button type="submit" class="btn btn-success btn-block">Insert</button>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

    </html>