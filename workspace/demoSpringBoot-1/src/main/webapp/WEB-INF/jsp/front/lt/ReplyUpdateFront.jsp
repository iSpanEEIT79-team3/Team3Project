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
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #fdf5e6;
        font-family: Arial, sans-serif;
    }
    .form-container {
        background-color: #ffffff;
        padding: 20px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h2 {
        color: #333;
        margin-bottom: 20px;
    }
    .form-group {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        width: 400px;
        margin-bottom: 15px;
    }
    .form-group label {
        margin-bottom: 5px;
        font-weight: bold;
    }
    .form-group input {
        padding: 10px;
        width: 100%;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form-group input[readonly] {
        background-color: #e0e0e0;
    }
    .btn, .SS {
        background-color: #d4b872; /* Green */
        border: none;
        color: white;
        padding: 12px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 10px 5px;
        cursor: pointer;
        border-radius: 8px;
        width: 120px;
        box-sizing: border-box;
    }
   
</style>
</head>
<body>
    <div class="form-container">
        <h2>修改</h2>
        <form action="/ReplyUpdateFront.controller" method="post">
            <input type="hidden" name="_method" value="put">
            <div class="form-group">
                <label for="replyId">回復ID</label>
                <input type="text" name="replyId" value="${replyBean.replyId}" readonly>
            </div>
            <div class="form-group">
                <label for="replytime">回復時間</label>
                <input type="text" name="replytime" value="${replyBean.replytime}" readonly>
            </div>
            <div class="form-group">
                <label for="replypost">回覆內容</label>
                <input type="text" name="replypost" value="${replyBean.replypost}">
            </div>
            <div class="form-group">
                <label for="userId">使用者id</label>
                <input type="text" name="userId" value="${replyBean.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="LTId">文章ID</label>
                <input type="text" name="LTId" value="${replyBean.ltBean.getLtId()}" readonly>
            </div>
            <input class="SS" type="submit" value="確定">
            <a class="btn" href="/LTSelectAllFront">返回首頁</a>
        </form>
    </div>
</body>
</html>
