<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <td>回復ID</td>
    <td>回覆時間</td>
    <td>回覆文章</td>
    <td>使用者ID</td>
    <td>文章ID</td>
</tr>
<c:forEach var="reply" items="${replyBean}">
    <tr>
        <td><input type="text" disabled value="${reply.replyId}"></td>
        <td><input type="text" disabled value="${reply.replytime}"></td>
        <td><input type="text" disabled value="${reply.replypost}"></td>
        <td><input type="text" disabled value="${reply.userId}"></td>
        <td><input type="text" disabled value="${reply.ltBean.ltId}"></td>
    </tr>
</c:forEach>

		</table>
		<a class="btn" href="/ReplySelectAll">返回首頁</a>
	</div>
</body>
</html>