<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新課程</title>
    <style>
        body {
            background-color: #fdf5e6;
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
            vertical-align: middle;
        }
        td:first-child {
            text-align: right;
            font-weight: bold;
            color: #333;
        }
        input, button {
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 12px 20px;
            margin: 5px 0;
            font-size: 16px;
            width: 100%;
        }
        input[type="file"] {
            padding: 0;
        }
        input:hover, button:hover {
            background-color: #4f85a6;
            color: #fff;
        }
        .submit-btn {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>更新課程</h1>
        <form method="post" action="${pageContext.request.contextPath}/upd" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>產品ID:</td>
                    <td><input type="text" value="${course.productId}" readonly name="productId" style="background-color: #ddd;"></td>
                </tr>
                <tr>
                    <td>用戶ID:</td>
                    <td><input type="text" name="idUser" value="${course.idUser}"></td>
                </tr>
                <tr>
                    <td>課程名稱:</td>
                    <td><input type="text" name="courseName" value="${course.courseName}"></td>
                </tr>
                <tr>
                    <td>描述:</td>
                    <td><input type="text" name="description" value="${course.description}"></td>
                </tr>
                <tr>
                    <td>課程類型:</td>
                    <td><input type="text" name="courseType" value="${course.courseType}"></td>
                </tr>
                <tr>
                    <td>開始日期:</td>
                    <td><input type="text" name="startDate" value="${course.startDate}"></td>
                </tr>
                <tr>
                    <td>結束日期:</td>
                    <td><input type="text" name="endDate" value="${course.endDate}"></td>
                </tr>
                <tr>
                    <td>截止日期:</td>
                    <td><input type="text" name="deadlineDate" value="${course.deadlineDate}"></td>
                </tr>
                <tr>
                    <td>地點:</td>
                    <td><input type="text" name="location" value="${course.location}"></td>
                </tr>
                <tr>
                    <td>價格:</td>
                    <td><input type="text" name="price" value="${course.price}"></td>
                </tr>
                <tr>
                    <td>教師名稱:</td>
                    <td><input type="text" name="teacherName" value="${course.teacherName}"></td>
                </tr>
                <tr>
                    <td>教師聯繫方式:</td>
                    <td><input type="text" name="teacherContact" value="${course.teacherContact}"></td>
                </tr>
                <tr>
                    <td>報名人數:</td>
                    <td><input type="text" name="enrollmentCount" value="${course.enrollmentCount}"></td>
                </tr>
                <tr>
                    <td>最大容量:</td>
                    <td><input type="text" name="maxCapacity" value="${course.maxCapacity}"></td>
                </tr>
                <tr>
                    <td>課程圖片:</td>
                    <td>
                        <img src="${course.courseImage}" width="100" height="100" alt="Course Image">
                        <input type="file" name="courseImage" accept="image/*">
                    </td>
                </tr>
            </table>
            <button type="submit" class="submit-btn">更新課程</button>
        </form>
    </div>
</body>
</html>
