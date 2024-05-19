<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.main {
	min-height: 55vh;
	/* 让 .slant 至少占据整个视口高度 */
}

body {
	font-family: Arial, sans-serif;
	background-color: #fdf5e6; /* 背景顏色 */
}

.container {
	max-width: 800px;
}

.article {
	border: 1px solid #ddd;
	flex-direction: column;
	background-color: #f9f9f9;
}

.article div {
	
}

.article img {
	max-width: 200px;
	display: block;
}

.btn-container {
	text-align: center; /* 將按鈕置中 */
}

.btn {
	background-color: #ffd700; /* 與標題一樣的黃色 */
	color: black;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
}

.btn:hover {
	background-color: #ffdf00; /* 滑鼠懸停時的顏色 */
}

h2 {
	text-align: center;
	color: #ffd700; /* 與按鈕一樣的黃色 */
}

.article-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 8px;
}

.article-info p {
	margin: 0;
}

.article-info hr, .article-content hr, .article-actions hr {
	border: none;
	border-bottom: 1px solid #ddd;
}

.article {
	border: 1px solid #ddd;
	flex-direction: column;
	background-color: #f9f9f9;
	margin-bottom: 20px; /* 添加了底部间距 */
}
</style>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4287c80df9.js"
	crossorigin="anonymous"></script>

<!--Google Font : Nunito-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap"
	rel="stylesheet">

<!-- For style(All CSS content) -->
<link rel="stylesheet" type="text/css" href="../styles/home.css" />
<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
<link rel="icon" href="images/favicon.ico">

<!-- JS Bundle for BS  -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous">
        </script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>範本</title>
</head>

<body>

	<div class="main" style="margin-top: 10%;">
		<div class="container">
			<div class="article-container">
					<div style="text-align: center; padding: 10px 0;">
						<a href="LTSelectAllFront"
							style="background-color: #D4B572; color: white; text-decoration: none; padding: 10px 20px; border-radius: 5px; margin-top: 10px;">返回首頁</a>
					</div>

					<!-- 页面其他内容 -->

				<c:forEach items="${ltBeans}" var="items">
					<div class="article">
						<!-- 文章相關資訊 -->
						<div class="article-info">
							<div>文章ID: ${items.ltId}</div>
							<div>標題: ${items.title}</div>
							<div>使用者ID: ${items.userId}</div>
							<div>日期: ${items.date}</div>
						</div>
						<hr>
						<div>文章內容: ${items.content}</div>
						<div class="article-img">
							<img src="${items.picture}" alt="文章圖片">
						</div>
						<hr>
						<div>讚: ${items.saveLike}</div>
					</div>
				</c:forEach>
			</div>
			<div class="btn-container"></div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
        </script>
	<script>
        fetch('/html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.insertAdjacentHTML('beforeend', html);
            });
    </script>
	<script src="LoginUser.js"></script>
</body>

</html>
