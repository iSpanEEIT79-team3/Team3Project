<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>更新課程</title>
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
                text-align: center;
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
    </head>

    <body>
        <div class="container">
            <h1 class="mb-4">更新課程</h1>
            <form method="post" action="${pageContext.request.contextPath}/upd" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productId">產品ID:</label>
                    <input type="text" class="form-control" id="productId" name="productId" value="${course.productId}"
                        readonly style="background-color: #ddd;">
                </div>
                <div class="form-group">
                    <label for="idUser">用戶ID:</label>
                    <input type="text" class="form-control" id="idUser" name="idUser" value="${course.idUser}" required>
                </div>
                <div class="form-group">
                    <label for="courseName">課程名稱:</label>
                    <input type="text" class="form-control" id="courseName" name="courseName"
                        value="${course.courseName}" required>
                </div>
                <div class="form-group">
                    <label for="description">描述:</label>
                    <textarea class="form-control" id="description" name="description"
                        rows="3">${course.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="courseType">課程類型:</label>
                    <input type="text" class="form-control" id="courseType" name="courseType"
                        value="${course.courseType}" required>
                </div>
                <div class="form-group">
                    <label for="startDate">開始日期:</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" value="${course.startDate}"
                        required>
                </div>
                <div class="form-group">
                    <label for="endDate">結束日期:</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" value="${course.endDate}"
                        required>
                </div>
                <div class="form-group">
                    <label for="deadlineDate">截止日期:</label>
                    <input type="date" class="form-control" id="deadlineDate" name="deadlineDate"
                        value="${course.deadlineDate}" required>
                </div>
                <div class="form-group">
                    <label for="location">地點:</label>
                    <input type="text" class="form-control" id="location" name="location" value="${course.location}"
                        required>
                </div>
                <div class="form-group">
                    <label for="price">價格:</label>
                    <input type="number" class="form-control" id="price" name="price" step="0.01"
                        value="${course.price}" required>
                </div>
                <div class="form-group">
                    <label for="teacherName">教師名稱:</label>
                    <input type="text" class="form-control" id="teacherName" name="teacherName"
                        value="${course.teacherName}" required>
                </div>
                <div class="form-group">
                    <label for="teacherContact">教師聯繫方式:</label>
                    <input type="text" class="form-control" id="teacherContact" name="teacherContact"
                        value="${course.teacherContact}">
                </div>
                <div class="form-group">
                    <label for="enrollmentCount">報名人數:</label>
                    <input type="number" class="form-control" id="enrollmentCount" name="enrollmentCount"
                        value="${course.enrollmentCount}" required>
                </div>
                <div class="form-group">
                    <label for="maxCapacity">最大容量:</label>
                    <input type="number" class="form-control" id="maxCapacity" name="maxCapacity"
                        value="${course.maxCapacity}" required>
                </div>
                <div class="form-group">
                    <label for="courseImage">課程圖片:</label>
                    <div class="mb-2">
                        <img src="${course.courseImage}" width="100" height="100" alt="Course Image">
                    </div>
                    <input type="file" class="form-control-file" id="courseImage" name="courseImage" accept="image/*">
                </div>
                <button type="submit" class="btn btn-success btn-block">更新課程</button>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

    </html>