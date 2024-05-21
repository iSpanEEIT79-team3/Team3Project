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
	background-color: #FBF8EC; /* 將背景顏色設置為白色 */
}

.lt img {
	width: 50px; /* 修改圖片寬度為 300px */
	height: auto; /* 保持圖片比例 */
	margin: auto; /* 圖片置中 */
}

.lt .article {
	width: 100%; /* 将文章内容宽度设置为 100% */
	display: flex;
	flex-direction: column;
	align-items: center;
}

.article-item {
	max-width: 1000px; /* 设置最大宽度 */
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 16px;
	margin-bottom: 16px;
	display: flex;
	flex-direction: column;
	background-color: #f9f9f9; /* 設置背景顏色 */
}

.article-content {
	margin-top: 16px; /* 调整内容顶部间距 */
}

.btn.btn-info {
	color: white; /* 设置按钮文字颜色为白色 */
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
	margin: 0 8px; /* 调整水平边距 */
}

.article-actions {
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.article-info hr, .article-content hr, .article-actions hr, .reply-info hr
	{
	border-color: #888;
}

.article-actions button {
	border: none;
	background-color: transparent;
	cursor: pointer;
	transition: color 0.3s ease-in-out; /* 添加按鈕顏色變化的動畫效果 */
}

.article-actions button:hover {
	color: #007bff; /* 淺藍色 */
}

.article-actions button {
	margin-right: 5px; /* 添加右边距，分隔按钮 */
	border: none;
	background-color: transparent;
	cursor: pointer;
	transition: color 0.3s ease-in-out; /* 添加按钮颜色变化的动画效果 */
}

.reply-item {
	width: 1000px;
	background-color: white;
	border-radius: 8px;
	padding: 16px;
	margin-bottom: 16px;
	height: 250px
}

.reply-item p {
	margin: 0;
	margin-bottom: 8px;
}

.reply-info {
	display: flex;
	justify-content: space-between;
}

.reply-info-item {
	margin-right: 20px; /* 调整每个信息项的右边距 */
}

.btn-inner {
	display: inline-block;
	white-space: nowrap; /* 避免文字換行 */
}
</style>
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
<script src="https://kit.fontawesome.com/f5d8105b16.js"
	crossorigin="anonymous"></script>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/f5d8105b16.js"
	crossorigin="anonymous"></script>
</head>
<body style="background-color: #fdf5e6">
	<div align="center">
		<div align="center" style="margin-top: 150px;">
			<div class="article-item">
				<!-- 修改的部分 -->
				<div class="article-info">
					<p>
						<strong>文章ID:</strong> ${items.ltId}
					</p>
					<p>
						<strong>標題:</strong> ${items.title}
					</p>
					<p>
						<strong>發文人:</strong> ${items.userId} <strong>時間:</strong>
						${items.date}
					</p>
				</div>
				<hr>
				<div class="article-content" style="text-align: left;">
					文章內容:
					<p>${items.content}</p>
				</div>
				<img src="/${items.picture}"
					style="width: 250px; height: 250px; /* 保持圖片比例 */ margin: auto">
				<hr>
				<div class="article-actions">
					<form method="post" action="/ReplyinsertFront.controller">
						<div style="display: flex; align-items: center; flex-grow: 1;">
							<button class="btn btn-danger btn-sm insertbtn" type="submit"
								style="background-color: blue">確定留言</button>
							<input type="hidden" name="LTId" value="${ltId}">
							<textarea name="replypost" placeholder="回覆貼文..."></textarea>

						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="article-info"></div>

		<div class="article-content">
			<c:forEach var="reply" items="${replyBean}">
				<div class="reply-item">
					<div class="reply-info">
						<div class="reply-info-item">
							<p>
								<strong>回復ID:</strong> ${reply.replyId}
							</p>

						</div>
						<div class="reply-info-item">
							<p>
								<strong>發文者ID:</strong> ${reply.userId}
							</p>
						</div>
						<div class="reply-info-item">
							<p>
								<strong>回覆時間:</strong> ${reply.replytime}
							</p>
						</div>

						<form method="get"
							action="/ReplySelectByIdFront.controller/${reply.replyId}">
							<input type="hidden" name="replyId" value="${reply.replyId}">
							<button class="btn btn-primary mr-2 editButton" type="submit"
								${reply.userId==userid?"":"hidden"} style=" font-size:15px; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);  border-radius: 15px;">
								<i class="fa-solid fa-pen "></i>修改
							</button>
						</form>
						<form method="post"
							action="/ReplyDeleteFront.controller?replyId=${reply.replyId}&LTId=${items.ltId}"
							onsubmit="return confirmDelete();">
							<input type="hidden" name="_method" value="DELETE">
							<button class="btn btn-danger deleteButton" type="submit"
								${reply.userId==userid ? "" : "hidden"} style=" font-size:15px; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);  border-radius: 15px;">
								<span class="btn-inner"></span> <i class="fa-solid fa-trash"></i>刪除
							</button>
						</form>
						<form method="post" action="/ReportReplyinsertFront.controller"
							onsubmit="handleReportSuccess()">
							<input type="hidden" name="replyId" value="${reply.replyId}">
							<div style="align-items: center;">
								<button class="btn btn-warning btn-sm" type="submit"
									style="color: white;  font-size:15px; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);  border-radius: 15px;">
									<i class="fa-solid fa-triangle-exclamation" style="color: red"></i>
									檢舉
								</button>
								<input type="text" name="reportContent" placeholder="请输入檢舉內容">
							</div>
						</form>




					</div>
					<hr>
					<div class="reply-content">
						<p>
							<strong>回覆文章:</strong> ${reply.replypost}
						</p>
					</div>
				</div>
			</c:forEach>
		</div>

		<a href="/LTSelectAllFront"
			style="background-color: #D4B572; color: white; text-decoration: none; padding: 10px 20px; border-radius: 5px; margin-top: 10px;">返回首頁</a>
	</div>
	<script src="/html/LoginUser.js"></script>

	<script>
		function handleReportSuccess() {
			alert("檢舉成功！謝謝你的檢舉,我們將盡快處理❗❗");
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


	<script>
		$.get('/html/basic.html', function(html) {
			$('body').append(html);
		});
	</script>

	<script>
		$('.insertbtn').click(function(e) {
			e.preventDefault(); // 阻止表单的默认提交行为
			let form = $(this).closest('form'); // 保存表单的引用

			let userID = "";
			$.ajax({
				url : "/getuserId",
				type : "GET",
				success : function(response) {
					console.log("1234", response);
					userID = response;
					if (userID == "") {
						window.location.href = "/UserLoginTest";
					} else {
						console.log("1234", response);
						// 如果需要在某些条件下继续提交表单，可以使用以下代码： 	
						form.submit();
					}
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	</script>
	<script>
		function confirmDelete() {
			return confirm("確定要刪除嗎？");
		}
	</script>


</body>
</html>
