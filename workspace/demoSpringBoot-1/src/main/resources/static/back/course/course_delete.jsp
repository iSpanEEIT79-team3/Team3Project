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
        	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Main CSS-->
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<!-- Font-icon css-->
	<link rel="stylesheet" type="text/css"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
</head>
<body>
	<h1>刪除成功</h1>
	<button class="index">回課程資料表</button>
		<script>
		<!-- Essential javascripts for application to work-->
		<script src="../js/jquery-3.2.1.min.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/main.js"></script>
		<!-- The javascript plugin to display page loading on top-->
		<script src="../js/plugins/pace.min.js"></script>
		<!-- Page specific javascripts-->
		<script type="text/javascript" src="../js/plugins/chart.js"></script>
		<script type="text/javascript" src="../js/plugins/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="../js/plugins/dataTables.bootstrap.min.js"></script>
		<script>
		fetch('../exampleBack.html')
		.then(response => response.text())
		.then(html => {
			document.body.insertAdjacentHTML('beforeend', html);
		});
		</script>
		
</body>
</html>
