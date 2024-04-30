<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>
    .btn {
        background-color: #4DFFFF; /* Green */
        border: none;
        color: black;
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
    }
</style>
</head>
<body style="background-color: #fdf5e6">
	<div align="center">
		<h2>查詢</h2>
		<table>
		
			<tr>
				<td>檢舉ID</td>
				<td><input type="text" disabled value="${reportBean.reportId}">
				<td>檢舉內容</td>
				<td><input type="text" disabled value="${reportBean.reportContent }">
				<td>文章ID</td>
				<td><input type="text" disabled value="${reportBean.LTId}">
			</tr>
		</table>
		<a class="btn" href="ReplySelectAll">返回首頁</a>
	</div>
</body>
</html>