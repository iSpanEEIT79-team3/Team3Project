<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改文章</title>
    <style>
        body {
            background-color: #fdf5e6;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4DFFFF;
            color: #000;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #00cccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>修改文章</h2>
        <form action="/LTUpdate.controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="put">
            <div class="form-group">
                <label for="ltId">論壇ID</label>
                <input type="text" name="ltId" id="ltId" value="${ltBean.ltId}" readonly>
            </div>
            <div class="form-group">
                <label for="title">標題</label>
                <input type="text" name="title" id="title" value="${ltBean.title}">
            </div>
            <div class="form-group">
                <label for="userId">使用者ID</label>
                <input type="text" name="userId" id="userId" value="${ltBean.userId}"readonly	>
            </div>
            <div class="form-group">
                <label for="content">文章內容</label>
                <input type="text" name="content" id="content" value="${ltBean.content}">
            </div>
            <div class="form-group">
                <label for="date">日期</label>
                <input type="hidden" name="date" id="date" value="${ltBean.date}" readonly>
            </div>
            <div class="form-group">
                <label for="saveLike">讚</label>
                <input type="text" name="saveLike" id="saveLike" value="${ltBean.saveLike}"readonly>
            </div>
            <div class="form-group">
                <label for="picture">照片</label>
                <input type="file" name="picture" id="picture" value="${ltBean.picture}">
            </div>
            <input type="submit" class="btn" value="確定" />
        </form>
        <a href="/LTSelectAll" class="btn">返回首頁</a>
    </div>
</body>
</html>
