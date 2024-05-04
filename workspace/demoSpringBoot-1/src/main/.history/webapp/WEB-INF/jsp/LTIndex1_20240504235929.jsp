<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<>
			body {
			overflow: auto;
			margin: 0;
			padding: 0;
			}

			.REPLY {
			position: absolute;
			top: 10px;
			/* 调整按钮距离顶部的距离 */
			left: 50%;
			transform: translateX(-50%);
			background-color: #87CEEB;
			/* 设置按钮颜色为浅蓝色 */
			color: white;
			padding: 10px 16px;
			border: none;
			cursor: pointer;
			border-radius: 4px;
			font-size: 14px;
			transition: none;
			/* 移除过渡效果 */
			outline: none;
			/* 去除默认轮廓 */
			}

			.REPLY:hover {
			background-color: #4DFFFF;
			/* 悬停时改变按钮颜色 */
			}

			.REPORT {
			position: absolute;
			top: 65px;
			/* 调整按钮距离顶部的距离 */
			left: 50%;
			transform: translateX(-50%);
			background-color: #87CEEB;
			/* 设置按钮颜色为浅蓝色 */
			color: white;
			padding: 10px 16px;
			border: none;
			cursor: pointer;
			border-radius: 4px;
			font-size: 14px;
			transition: none;
			/* 移除过渡效果 */
			outline: none;
			/* 去除默认轮廓 */
			}

			.REPORT:hover {
			background-color: #4DFFFF;
			/* 悬停时改变按钮颜色 */
			}

			.title {
			position: absolute;
			top: 125px;
			/* 调整按钮距离顶部的距离 */
			left: 50%;
			transform: translateX(-50%);
			background-color: #87CEEB;
			/* 设置按钮颜色为浅蓝色 */
			color: white;
			padding: 10px 16px;
			border: none;
			cursor: pointer;
			border-radius: 4px;
			font-size: 14px;
			transition: none;
			/* 移除过渡效果 */
			outline: none;
			/* 去除默认轮廓 */
			}

			.title:hover {
			background-color: #4DFFFF;
			/* 悬停时改变按钮颜色 */
			}

			.lt img {
			max-width: 250px;
			height: auto;
			}

			.lt {
			position: absolute;
			left: 50%;
			transform: translateX(-50%);
			width: 50%;
			}

			.lt table {
			width: 110%;
			border-collapse: collapse;
			}

			.lt th,
			.lt td {
			text-align: center;
			padding: 8px;
			border: 1px solid #000000;
			font-weight: bold;
			}

			.lt th {
			background-color: #a8fefa;
			}

			.lt button {
			padding: 10px 16px;
			border: none;
			cursor: pointer;
			border-radius: 4px;
			font-size: 14px;
			transition: none;
			outline: none;
			}

			.lt button.edit {
			background-color: #87ceeb;
			/* 浅蓝色 */
			color: white;
			}

			.lt button.delete {
			background-color: #ffa500;
			/* 橙色 */
			color: white;
			}

			.lt button.add {
			background-color: #a8fefa;
			color: black;
			}

			.lt td a {
			color: inherit;
			font-size: inherit;
			text-decoration: none;
			}

			.main {
			min-height: 55vh;
			/* 让 .slant 至少占据整个视口高度 */

			}
			</style>

			<!-- Bootstrap CSS -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
				crossorigin="anonymous">
			<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

			<!--Google Font : Nunito-->
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

			<!-- For style(All CSS content) -->
			<link rel="stylesheet" type="text/css" href="static/styles/home.css" />
			<link rel="stylesheet" type="text/css" href="static/styles/footer.css" />
			<link rel="stylesheet" type="text/css" href="static/styles/navbar.css" />
			<link rel="icon" href="images/favicon.ico">

			<!-- JS Bundle for BS  -->
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
				integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
				crossorigin="anonymous">
				</script>
			<title>範本</title>
	</head>

	<body>


		<div class="container-fluid" style="margin-top: 150px;">
			<h2 class="text-center">標題</h2>
		</div>
		<!-- <section> -->
		<div class="main">

		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
			</script>
		<script>

			fetch('html/basic.html')
				.then(response => response.text())
				.then(html => {
					document.body.innerHTML += html;
				});


		</script>

	</body>

	</html>