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
            <script>
    function autofillForm() {
        document.getElementById('idUser').value = '1022';
        document.getElementById('courseName').value = 'Intermediate';
        document.getElementById('description').value = '將提高舞蹈的技術水平並拓展舞蹈風格。';
        document.getElementById('courseType').value = '多日課程';
        document.getElementById('startDate').value = '2024-04-01';
        document.getElementById('endDate').value = '2024-04-30';
        document.getElementById('deadlineDate').value = '2024-04-07';
        document.getElementById('location').value = '地點F';
        document.getElementById('price').value = '4000';
        document.getElementById('teacherName').value = 'Juan Rodriguez';
        document.getElementById('teacherContact').value = 'juan@example.com';
        document.getElementById('enrollmentCount').value = '28';
        document.getElementById('maxCapacity').value = '30';
        document.getElementById('courseImage').value = '/images/Courses_class4.jpg';

    }
    </script>
</head>

<body>
    <div>
        <h1>新增課程</h1>
        <button onclick="autofillForm()">一鍵填寫</button>
        <form method="post" action="${pageContext.request.contextPath}/insert" enctype="multipart/form-data">
            <table>
                <!-- Modified each input field to have an id for easy access -->
                <tr>
                    <td>會員ID:</td>
                    <td><input type="text" id="idUser" name="idUser" required /></td>
                </tr>
                <tr>
                    <td>課程名稱:</td>
                    <td><input type="text" id="courseName" name="courseName" required /></td>
                </tr>
                <tr>
                    <td>描述:</td>
                    <td><input type="text" id="description" name="description" /></td>
                </tr>
                <tr>
                    <td>課程類型:</td>
                    <td><input type="text" id="courseType" name="courseType" required /></td>
                </tr>
                <tr>
                    <td>開始日期:</td>
                    <td><input type="date" id="startDate" name="startDate" required /></td>
                </tr>
                <tr>
                    <td>結束日期:</td>
                    <td><input type="date" id="endDate" name="endDate" required /></td>
                </tr>
                <tr>
                    <td>截止日期:</td>
                    <td><input type="date" id="deadlineDate" name="deadlineDate" required /></td>
                </tr>
                <tr>
                    <td>地點:</td>
                    <td><input type="text" id="location" name="location" required /></td>
                </tr>
                <tr>
                    <td>價格:</td>
                    <td><input type="number" id="price" name="price" step="0.01" required /></td>
                </tr>
                <tr>
                    <td>教師名稱:</td>
                    <td><input type="text" id="teacherName" name="teacherName" required /></td>
                </tr>
                <tr>
                    <td>教師聯繫方式:</td>
                    <td><input type="text" id="teacherContact" name="teacherContact" /></td>
                </tr>
                <tr>
                    <td>報名人數:</td>
                    <td><input type="number" id="enrollmentCount" name="enrollmentCount" required /></td>
                </tr>
                <tr>
                    <td>最大容量:</td>
                    <td><input type="number" id="maxCapacity" name="maxCapacity" required /></td>
                </tr>
                <tr>
                    <td>課程圖片:</td>
                    <td><input type="file" id="courseImage" name="courseImage" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Insert"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>