<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>

		<html>

		<head>
			<meta charset="UTF-8">
			<title>全部文章</title>

			<style>
				body {
					overflow: auto;
					/* 清除浮动 */
					margin: 0;
					padding: 0;
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
					border: 1px solid #ddd;
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
					/* 移除过渡效果 */
					outline: none;
					/* 去除默认轮廓 */
				}

				.lt button.edit {
					background-color: #87ceeb;
					/* 绿色 */
					color: white;
				}

				.lt button.delete {
					background-color: #ffa500;
					/* 红色 */
					color: white;
				}

				.lt button.add {
					background-color: #a8fefa;
					/* 天空蓝 */
					color: black;
				}

				.lt td a {
					color: inherit;
					/* 使用父元素的颜色 */
					font-size: inherit;
					/* 使用父元素的字体大小 */
					text-decoration: none;
					/* 去除下划线 */
				}
			</style>
		</head>

		<body>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<div class="back-content"></div>
			<div class="lt">
				<h2>互動區</h2>
				<form method="get" action="html/LTInsert.html">

					<button class="add" type="submit">新增</button>
				</form>
				<!-- 		<a href="LT.controller" ><button>搜尋</button></a> -->
				<br>
				<form method="Get" action="html/LTSelect.html">
					<button class="select" type="submit">搜尋</button>
				</form>

				<table border="1">
					<tr style="background-color: #a8fefa">
						<th>論壇id</th>
						<th>標題</th>
						<th>使用者ID</th>
						<th>輸入文章內容</th>
						<th>日期</th>
						<th>分類</th>
						<th>照片</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${ltBeans}" var="items">
						<tr>
							<td><a href="ReplySelectAll?ename=${items.ltId}">${items.ltId}</a></td>
							<td>${items.title}</td>
							<td>${items.userId}</td>
							<td>${items.content}</td>
							<td>${items.date}</td>
							<td>${items.classify}</td>
							<td><img src="${items.picture}"></td>
							<td>
								<form method="Get" action="/LTSelectById.controller/${items.ltId}">

									<button class="edit" type="submit">修改</button>
								</form>
								<form method="post" action="/LTDeleteById.controller?ltId=${items.ltId}">
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
				fetch('/back')
					.then(response => response.text())
					.then(html => {
						//內容
						$('.back-content').html(html);
					})
					.catch(error => console.error('Error fetching back.html', error));
			</script>
			<script>
				document.addEventListener('DOMContentLoaded', function () {
					var deleteButtons = document.querySelectorAll('.delete');

					deleteButtons.forEach(function (button) {
						button.addEventListener('click', function (event) {
							event.preventDefault(); // 阻止默认行为（即提交表单）

							Swal.fire({
								title: '確定刪除嗎👌?',
								text: "此操作將無法還原🫠!",
								icon: 'question',
								showCancelButton: true,
								confirmButtonColor: '#3085d6',
								cancelButtonColor: '#d33',
								confirmButtonText: '確認刪除!',
								cancelButtonText: '取消'
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