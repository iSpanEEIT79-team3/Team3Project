<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增課程</title>
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
<body>
<body>
    <div>
        <h1>新增課程</h1>
        <form method="post" action="${pageContext.request.contextPath}/insert" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>課程名稱:</td>
                    <td><input type="text" name="courseName" value="Intermediate" required /></td>
                </tr>
                <tr>
                    <td>描述:</td>
                    <td><input type="text" name="description" value="將提高舞蹈的技術水平並拓展舞蹈風格。" /></td>
                </tr>
                <tr>
                    <td>課程類型:</td>
                    <td><input type="text" name="courseType" value="多日課程" required /></td>
                </tr>
                <tr>
                    <td>開始日期:</td>
                    <td><input type="date" name="startDate" value="2024-04-01" required /></td>
                </tr>
                <tr>
                    <td>結束日期:</td>
                    <td><input type="date" name="endDate" value="2024-04-30" required /></td>
                </tr>
                <tr>
                    <td>截止日期:</td>
                    <td><input type="date" name="deadlineDate" value="2024-04-07" required /></td>
                </tr>
                <tr>
                    <td>地點:</td>
                    <td><input type="text" name="location" value="地點F" required /></td>
                </tr>
                <tr>
                    <td>價格:</td>
                    <td><input type="number" name="price" value="4000" step="0.01" required /></td>
                </tr>
                <tr>
                    <td>教師名稱:</td>
                    <td><input type="text" name="teacherName" value="Juan Rodriguez" required /></td>
                </tr>
                <tr>
                    <td>教師聯繫方式:</td>
                    <td><input type="text" name="teacherContact" value="juan@example.com" /></td>
                </tr>
                <tr>
                    <td>報名人數:</td>
                    <td><input type="number" name="enrollmentCount" value="28" required /></td>
                </tr>
                <tr>
                    <td>最大容量:</td>
                    <td><input type="number" name="maxCapacity" value="30" required /></td>
                </tr>
                <tr>
                    <td>課程圖片:</td>
                    <td><input type="file" name="courseImage" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Insert"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>