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
    <div>
        <h1>新增課程</h1>
        <form method="post" action="${pageContext.request.contextPath}/insert" >
            <table>
                <tr>
                    <td>用戶ID:</td>
                    <td><input type="text" name="idUser" required /></td>
                </tr>
                <tr>
                    <td>產品ID:</td>
                    <td><input type="text" name="productId" required /></td>
                </tr>
                <tr>
                    <td>課程名稱:</td>
                    <td><input type="text" name="courseName" required /></td>
                </tr>
                <tr>
                    <td>描述:</td>
                    <td><input type="text" name="description" /></td>
                </tr>
                <tr>
                    <td>課程類型:</td>
                    <td><input type="text" name="courseType" required /></td>
                </tr>
                <tr>
                    <td>開始日期:</td>
                    <td><input type="date" name="startDate" required /></td>
                </tr>
                <tr>
                    <td>結束日期:</td>
                    <td><input type="date" name="endDate" required /></td>
                </tr>
                <tr>
                    <td>截止日期:</td>
                    <td><input type="date" name="deadlineDate" required /></td>
                </tr>
                <tr>
                    <td>地點:</td>
                    <td><input type="text" name="location" required /></td>
                </tr>
                <tr>
                    <td>價格:</td>
                    <td><input type="number" name="price" step="0.01" required /></td>
                </tr>
                <tr>
                    <td>教師名稱:</td>
                    <td><input type="text" name="teacherName" required /></td>
                </tr>
                <tr>
                    <td>教師聯繫方式:</td>
                    <td><input type="text" name="teacherContact" /></td>
                </tr>
                <tr>
                    <td>報名人數:</td>
                    <td><input type="number" name="enrollmentCount" required /></td>
                </tr>
                <tr>
                    <td>最大容量:</td>
                    <td><input type="number" name="maxCapacity" required /></td>
                </tr>
                <tr>
                    <td>課程圖片:</td>
                    <td><input type="text" name="courseImage" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Insert"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
