<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

		<form action="/ReportUpdate.controller" method="post">
		<input type="hidden" name="_method" value="put">
				<table>
					<tr>
						<td>檢舉ID</td>
						<td><input type="text" name="reportId" value="${reportBean.reportId}"
							readonly>
						<td>檢舉內容</td>
						<td><input type="text" name=reportContent value="${reportBean.reportContent}">
						<td>文章ID</td>
						<td><input type="text" name="LTId" value="${reportBean.ltBean.getLtId()}"readonly>
						
					</tr>

				</table>
			<input class=SS type="submit" value="確定" />
			<a class="btn" href="/ReportSelectAll">返回首頁</a>
		</form>
	</div>
	
</body>
</html>