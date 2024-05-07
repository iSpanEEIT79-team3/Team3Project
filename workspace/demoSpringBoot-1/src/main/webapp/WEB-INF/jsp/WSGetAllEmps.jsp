<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.mmmooonnn.model.Event" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!@SuppressWarnings("unchecked")%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>活動資訊</title>
<style>
.center {
	margin-right: 20px;
	float: right;
}

td {
	padding: 5px 10px;
	/* 上下各 10px，左右各 20px 的内边距 */
	white-space: nowrap;
}

img {
	max-width: 100px;
	/* 最大寬度 */
	max-height: 100px;
	/* 最大高度 */
	width: auto;
	/* 自動調整寬度 */
	height: auto;
	/* 自動調整高度 */
}

footer {
	height: 60px;
}

tr {
	background-color: #ffffff;
}
</style>
</head>

<body style='background-color: #fdf5e6'>
	<div class="back-content banner-container"></div>

	<div class="center">
		<h2>活動資訊</h2>


		<form method="get" action="/WSSearchByDate"
			enctype="multipart/form-data">
			活動開始時間 : <input type="date" id="EVENT_STARTIME" name="startTime" />
			<button type="submit">查詢</button>
		</form>

		<br>

		<table class="table">
			<thead>
				<tr style="background-color: #a8fefa">
					<th>活動編號
					<th>活動名稱
					<th>報名開始日期
					<th>報名結束日期
					<th>活動開始時間
					<th>活動結束時間
					<th>活動詳細資料
					<th>活動種類
					<th>報名金額
					<th>活動地址
					<th>組織者
					<th>圖片
					<th>Update
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${eventBeans}" var="evBean">
					<tr>
						<td>${evBean.eventId}</td>
						<td>${evBean.eventName}</td>
						<td><fmt:formatDate value="${evBean.signupStartime}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td><fmt:formatDate value="${evBean.signupEndtime}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td><fmt:formatDate value="${evBean.startTime}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td><fmt:formatDate value="${evBean.endTime}"
								pattern="yyyy-MM-dd HH:mm" /></td>

						<td>${evBean.eventDetail}</td>
						<td>${evBean.eventCategory}</td>
						<td>${evBean.eventPrice}</td>
						<td>${evBean.eventLocation}</td>
						<td>${evBean.organizer}</td>
						<td><img src="${evBean.picture}"></td>

						<td>
							<form action="Getupdate/${evBean.eventId}" method="post">
								<input type="hidden" name="_method" value="put">
								<button type="submit" class="update">更新</button>
							</form>
						</td>

						<td>
							<form action="${pageContext.request.contextPath}/Event"
								method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="hidden" name="PRODUCTID" value="${evBean.eventId}">
								<button type="submit" class="delete">刪除</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>


		</table>


		<a href="html/WSinsert.html"><input type="submit" value="新增資料"></a>

		<a href="WSall"><input type="submit" value="查詢所有資料"></a>

		<!-- 	<form action="WSall" method="get"><input type="submit" value="查詢所有資料"></form> -->
		<footer></footer>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script
		src="https://cdn.datatables.net/v/dt/dt-2.0.1/datatables.min.js"></script>

	<script>
                        fetch('/back')
                            .then(response => response.text())
                            .then(html => {
                                //內容
                                $('.back-content').html(html);
                            })
                            .catch(error => console.error('Error fetching back.html', error));
                    </script>


</body>

</html>