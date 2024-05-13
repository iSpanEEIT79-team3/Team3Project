<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
	<%@page import="java.util.ArrayList" %>
		<%@page import="java.util.List" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>修改資料</title>
					<style>
						.bitch {
							float: right;
							margin-right: 350px;
						}

						img {
							width: 200px
						}
					</style>
				</head>

				<body style="background-color: #fdf5e6;">
					<div class="back-content"></div>
					<div class="bitch">

						<h2>會員資料</h2>
						<form action="GetById" method="get">
							<input type="text" name="id"> <input class="index" type="submit" value="確定" />
						</form>
						<table border="1">
							<tr style="background-color: #a8fefa">
								<th>會員編號
								<th>姓名
								<th>信箱
								<th>密碼
								<th>性別
								<th>生日
								<th>地址
								<th>簡介
								<th>照片
								<th>年齡
								<th>修改
								<th>刪除 <c:forEach items="${match}" var="match">

							<tr>
								<td><a href="/GetById?ID=${match.id}">${match.id}</a><br>
								<td>${match.name}<br>
								<td>${match.email}<br>
								<td>${match.password}<br>
								<td>${match.gender}<br>
								<td>${match.birthday}<br>
								<td>${match.location}<br>
								<td>${match.bio}<br>
								<td><img src="${match.profilePicture}"><br>
								<td>${match.age}<br>
								<td>
									<form method="post" action="UpdateMatch?id=${match.id}">
										<input type="hidden" name="_method" value="PUT">

										<button type="submit">修改</button>
									</form>
								</td>
								<!-- 							<td><form method="post" action="MatchByid/{id}"> -->
								<%-- <input type="hidden" name="ID" value="${match.id}"> --%>
									<!-- 									<button type="submit">刪除</button> -->
									<!-- 								</form> -->
									<td><button onclick="deleteMatch(${match.id})">刪除</button></td>
									</c:forEach>
						</table>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
						<script>
							function deleteMatch(id) {
								if (confirm("確定要刪除該筆資料？")) {
									$.ajax({
										url: '${pageContext.request.contextPath}/MatchDeleteByid/' + id,
										type: 'DELETE',
										success: function (response, status, xhr) {
											if (response == 'true') {
												alert('已刪除單筆資料');
												window.location.reload(); // 刷新頁面
											} else {
												alert('不能刪');
											}

										},
										error: function (xhr, status, error) {
											console.error(error);
											// 在刪除失敗時，顯示警告訊息給用戶
											alert('刪除失敗，請重試或聯繫管理員');
										}
									});
								}
							}
							fetch('/back')
								.then(response => response.text())
								.then(html => {
									//內容
									$('.back-content').html(html);
								})
								.catch(error => console.error('Error fetching back.html', error));
						</script>


					</div>

				</body>

				</html>