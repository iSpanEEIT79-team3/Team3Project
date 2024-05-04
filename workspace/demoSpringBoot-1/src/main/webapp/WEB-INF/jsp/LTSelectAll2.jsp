<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>

.main {
	min-height: 55vh;
	padding-top: 50px; /* 將內容區域下移以避免 navbar 擋住 */
}

.lt img {
	max-width: 200px; /* 設定圖片最大寬度為 800px */
	display: block;
	margin: 0 auto; /* 圖片置中 */
}

.lt .article {
	  width: 800px; /* 将文章内容宽度设置为 800px */
        margin-left: 35%;
}

.article table {
	width: 100%;
	border-collapse: collapse;
}

.article th, .article td {
	border: 1px solid #ddd; /* 框線 */
	padding: 8px;
	text-align: left;
}

.article th {
	background-color: #f2f2f2;
}
</style>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/4287c80df9.js"
	crossorigin="anonymous"></script>
<!-- Google Font: Nunito -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap"
	rel="stylesheet">
<!-- 自訂樣式 -->
<link rel="stylesheet" type="text/css" href="../styles/home.css" />
<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
<link rel="icon" href="images/favicon.ico">
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Your Brand</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 主內容 -->
	<div class="main">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<div class="back-content"></div>
		<div class="lt">
			<div class="h22">
				<h2 class="h2">互動區</h2>
			</div>
			<form method="get" action="/ReplySelectAll">
				<button class="REPLY" type="submit">回復區</button>
			</form>
			<form method="get" action="html/LTTitle.html">
				<button class="title" type="submit">模糊查詢</button>
			</form>
			<form method="get" action="/ReportSelectAll">
				<button class="REPORT" type="submit">檢舉區</button>
			</form>
			<form method="get" action="html/LTInsert.html">
				<button class="add" type="submit">新增</button>
			</form>
			<br>
			<form method="Get" action="html/LTSelect.html">
				<button class="select" type="submit">搜尋</button>
			</form>
			<div class="article col-12 col-md-8">
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th>文章ID</th>
							<th>標題</th>
							<th>使用者ID</th>
							<th>輸入文章內容</th>
							<th>日期</th>
							<th>讚</th>
							<th>照片</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ltBeans}" var="items">
							<tr>
								<td><a href="/findLTID/${items.ltId}">${items.ltId}</a></td>
								<td>${items.title}</td>
								<td>${items.userId}</td>
								<td>${items.content}</td>
								<td>${items.date}</td>
								<td>${items.saveLike}</td>
								<td><img src="${items.picture}" alt="文章圖片"></td>
								<td>
									<form method="Get"
										action="/LTSelectById.controller/${items.ltId}">
										<button class="btn btn-primary btn-sm" type="submit">修改</button>
									</form>
									<form method="post"
										action="/LTDeleteById.controller?ltId=${items.ltId}">
										<input type="hidden" name="_method" value="DELETE">
										<button class="btn btn-danger btn-sm delete" type="submit">刪除</button>
									</form>
									<form method="POST" action="/Likeinsert.controller">
										<input type="hidden" name="userId" value="${items.userId}">
										<input type="hidden" name="ltId" value="${items.ltId}">
										<button class="btn btn-success btn-sm like" type="submit">讚</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
</script>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        var deleteButtons = document.querySelectorAll('.delete');
        deleteButtons.forEach(function (button) {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // 防止預設表單提交行為
                Swal.fire({
                    title: '確定刪除嗎❌?',
                    text: "此操作將無法還原🫠!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確認刪除!',
                    cancelButtonText: '取消'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 如果使用者確認，則提交表單
                        button.closest('form').submit();
                    }
                });
            });
        });
    });

    fetch('html/basic.html')
        .then(response => response.text())
        .then(html => {
            document.body.innerHTML += html;
        });
</script>
</body>
</html>
