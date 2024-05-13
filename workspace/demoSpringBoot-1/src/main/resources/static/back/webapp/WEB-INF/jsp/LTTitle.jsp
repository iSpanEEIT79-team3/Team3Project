<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fdf5e6;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        position: relative;
    }
    .table-container {
        overflow-x: auto;
        margin-top: 20px; /* 將表格往下移動以避免覆蓋 */
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #000;
        text-align: center;
    }
    th {
        background-color: #87CEEB;
        color: white;
    }
    img {
        max-width: 200px;
        max-height: 200px;
    }
.btn {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    background-color: #4DFFFF;
    border: none;
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    border-radius: 8px;
    cursor: pointer;
    margin-top: 10px; /* 將按鈕往下移動以避免覆蓋 */
}
    .btn:hover {
        background-color: #00CED1;
    }
    h2{
    margin-top:60px;
    }
</style>
</head>
<body>
    <div class="container">
        <a class="btn" href="LTSelectAll">返回首頁</a>
        <h2 align="center">查詢</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>文章ID</th>
                    <th>標題</th>
                    <th>使用者ID</th>
                    <th>文章內容</th>
                    <th>日期</th>
                    <th>讚</th>
                    <th>照片</th>
                </tr>
                <c:forEach items="${ltBeans}" var="items">
                    <tr>
                        <td>${items.ltId}</td>
                        <td>${items.title}</td>
                        <td>${items.userId}</td>
                        <td>${items.content}</td>
                        <td>${items.date}</td>
                        <td>${items.saveLike}</td>
                        <td><img src="${items.picture}"></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
