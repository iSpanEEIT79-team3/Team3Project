<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新課程</title>
        <style>
    input, button { /* Apply styles to both input and button elements */
    	border: 1px solid black; /* Thin black border */
        border-radius: 6px;
        padding: 12px 24px; /* Adjust padding to your liking */
        margin: 5px; /* Space around elements */
        cursor: pointer; /* Makes it clear that the element is clickable */
        font-size: 16px; /* Text size within the elements */
        
    }


    input:hover, button:hover { /* Hover effects for better user experience */
        background-color: #4f85a6;
    }

    a {
        text-decoration: none; /* Removes underline from links */
    }
    </style>
</head>
    <body style="background-color: #fdf5e6;">
    <div>
        <h1>更新課程</h1>
		<form method="post" action="${pageContext.request.contextPath}/upd">
			<table>
                <tr>
                    <td>課程編號:</td>
                    <td><input style="background-color: #7B7B7B;" type="text" value="${course.courseID}" readonly name="courseID"></td>
                </tr>
                <tr>
                    <td>課程名稱:</td>
                    <td><input type="text" name="courseName" value="${course.courseName}" ></td>
                </tr>
                <tr>
                    <td>課程描述:</td>
                    <td><input type="text" name="description" value="${course.description}"></td>
                </tr>
                <tr>
                    <td>開課日期:</td>
                    <td><input type="date" name="startDate" value="${course.startDate}"></td>
                </tr>
                <tr>
                    <td>結束日期:</td>
                    <td><input type="date" name="endDate" value="${course.endDate}"></td>
                </tr>
                <tr>
                    <td>報名截止日期:</td>
                    <td><input type="date" name="deadlineDate" value="${course.deadlineDate}"></td>
                </tr>
                <tr>
                    <td>價格:</td>
                    <td><input type="text" name="price" value="${course.price}"></td>
                </tr>
                <tr>
                    <td>老師姓名:</td>
                    <td><input type="text" name="teacherName" value="${course.teacherName}"></td>
                </tr>
                <tr>
                    <td>老師聯絡方式:</td>
                    <td><input type="text" name="teacherContact" value="${course.teacherContact}"></td>
                </tr>
                <tr>
                    <td>已報名人數:</td>
                    <td><input type="text" name="enrollmentCount" value="${course.enrollmentCount}"></td>
                </tr>
                <tr>
                    <td>最大容量:</td>
                    <td><input type="text" name="maxCapacity" value="${course.maxCapacity}"></td>
                </tr>
                <tr>
                    <td>課程圖片:</td>
                    <td><input type="text" name="courseImage" value="${course.courseImage}"></td>
                </tr>
            </table>
            <input type="submit" value="Update Course">
        </form>
    </div>
</body>
</html>