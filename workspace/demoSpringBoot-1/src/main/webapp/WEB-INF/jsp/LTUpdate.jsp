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
	    .SS {
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
			<h2>修改</h2>
	
			<form action="/LTUpdate.controller" method="post">
				<input type="hidden" name="_method" value="put">
	
				<table>
					<tr>
						<td>論壇id</td>
						<td><input type="text" name="ltId" value="${ltBean.ltId}"
							readonly>
						<td>標題</td>
						<td><input type="text" name="title" value="${ltBean.title }">
						<td>使用者id</td>
						<td><input type="text" name="userId" value="${ltBean.userId }">
						<td>文章內容</td>
						<td><input type="text" name="content"
							value="${ltBean.content}">
						<td>日期</td>
						<td><input type="hidden" name="date" value="${ltBean.date}"readonly>
						<td>分類</td>
						<td><input type="text" name="classify"
							value="${ltBean.classify}">
						<td>照片</td>
						<td><input type="text" name="picture"
							value="${ltBean.picture}">
					</tr>
				</table>
				<input class=SS type="submit" value="確定" />
				<a class="btn" href="/LTSelectAll">返回首頁</a>
			</form>
	
		</div>
	</body>
	</html>