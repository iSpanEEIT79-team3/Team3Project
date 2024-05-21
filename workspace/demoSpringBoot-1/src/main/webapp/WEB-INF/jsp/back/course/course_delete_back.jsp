<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>刪除成功</title>
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
	<h1>刪除成功</h1>
	<button class="index">回課程資料表</button>
		<script>
		const index = document.querySelector('.index')
        index.addEventListener('click', function () {
            location.href = 'http://localhost:8080/GetAllCourses'
        })
		</script>
</body>
</html>
