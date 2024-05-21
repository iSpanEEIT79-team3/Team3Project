<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

    <!--Google Font : Nunito-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

    <!-- For style(All CSS content) -->
    <link rel="stylesheet" type="text/css" href="../styles/home.css" />
    <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
    <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
    <link rel="icon" href="images/favicon.ico">

    <!-- JS Bundle for BS  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<div class="back-content"></div>
	<div class="lt">
	<div class="h22">
		<h2 class="h2">回復區</h2>
		
		</div>
		<div style="text-align: center; margin-top: 20px;">
    <a href="LTSelectAll" style="text-decoration: none;">
        <button id="returnButton" onclick="changeColor()">返回首頁</button>
    </a>
</div>
		
		
		<form method="get" action="html/ReplyInsert.html">
			<button class="add" type="submit">新增</button>
		</form>
	<br>
			<form method="get" action="html/ReplySelect.html">
				<input type="hidden" name="replyId" value="${reply.replyId}">
				<button class="select" type="submit">搜尋</button>
			</form>
			
			<!-- 貼文 -->
			<div class="article col-12 col-md-8">
           
		<table border="1">
			<tr style="background-color: #a8fefa">
			<!-- 可以刪除 -->
				<th>回復ID</th>
				<th>回復時間</th>
				<th>回覆內容</th>
				<th>使用者ID</th>
				<th>文章ID</th>
				<th>操作</th>
				
			</tr>
			<c:forEach items="${replyBeans}" var="reply">
				<tr>
					<td>${reply.replyId}</td>
					<td>${#dates.format(reply.replytime,'yyyy-MM-dd HH:mm:ss')}
</td>
					<td>${reply.replypost}</td>
					<td>${reply.userId}</td>
					<td>${reply.ltBean.getLtId()}</td>
					
					
					<td>
						<form method="get" action="/ReplySelectById.controller/${reply.replyId}">
							<input type="hidden" name="replyId" value="${reply.replyId}">
							<button class="edit" type="submit">修改</button>
						</form>
						<form method="post" action="/ReplyDelete.controller?replyId=${reply.replyId}">
							<input type="hidden" name="_method" value="DELETE">
							<button class="delete" type="submit">刪除</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var deleteButtons = document.querySelectorAll('.delete');

        deleteButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // 阻止默认行为（即提交表单）

                Swal.fire({
                    title: '確定刪除嗎?',
                    text: "此操作將無法還原!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確認刪除👌!',
                    cancelButtonText: '取消🫠'	
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 如果用户点击了确认，则提交表单
                        button.closest('form').submit();
                    }
                });
            });
        });
    });
</script>		
		
	
</body>
</html>