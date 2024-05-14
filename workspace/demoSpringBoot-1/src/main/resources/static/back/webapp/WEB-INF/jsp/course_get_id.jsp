<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>所有課程</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .lt th, .lt td {
	text-align: center;
	padding: 8px;
	border: 1px solid #ddd;
}

.lt th {
	background-color: #a8fefa;
}
    </style>
</head>
<body>
	<div class="lt">
    <h2>課程資料</h2>
    <table>
        <tr>
            <th>課程ID</th>
            <th>課程名稱</th>
            <th>課程描述</th>
            <th>開課日期</th>
            <th>結束日期</th>
            <th>報名截止日</th>
            <th>課程價格</th>
            <th>教師姓名</th>
            <th>教師聯絡方式</th>
            <th>報名人數</th>
            <th>上線人數</th>
            <th>課程圖片</th>
        </tr>
            <tr>
                <td>${course.courseID}</td>
                <td>${course.courseName}</td>
                <td>${course.description}</td>
                <td>${course.startDate}</td>
                <td>${course.endDate}</td>
                <td>${course.deadlineDate}</td>
                <td>${course.price}</td>
                <td>${course.teacherName}</td>
                <td>${course.teacherContact}</td>
                <td>${course.enrollmentCount}</td>
                <td>${course.maxCapacity}</td>
                <td>${course.courseImage}</td>
                
                <td><form method="post" action="updata/$">
                <input type="hidden" name="courseID" value="${course.courseID}">
                <button type="submit">確認</button> 
                </form>          
            </tr>
            </div>
    </table>
</body>
</html>