<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改文章</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <style>
        body {
            background-color: #fdf5e6;
            font-family: Arial, sans-serif;
        }

        .main {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            width: 400px;
            padding: 20px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 10px 20px;
            background-color: #D4b572;
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
<div class="main">
    <div class="container">
        <h2>修改文章</h2>
        <form action="/LTUpdateFront.controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_method" value="put">
            <div class="form-group">
                <label for="ltId">論壇ID</label>
                <input type="text" name="ltId" id="ltId" value="${ltBean.ltId}" readonly class="form-control">
            </div>
            <div class="form-group">
                <label for="title">標題</label>
                <input type="text" name="title" id="title" value="${ltBean.title}" class="form-control">
            </div>
            <div class="form-group">
                <label for="userId">使用者ID</label>
                <input type="text" name="userId" id="userId" value="${ltBean.userId}" class="form-control" readonly>
            </div>
            <div class="form-group">
                <label for="content">文章內容</label>
                <input type="text" name="content" id="content" value="${ltBean.content}" class="form-control">
            </div>
            <div class="form-group">
                <label for="date">日期</label>
                <input type="hidden" name="date" id="date" value="${ltBean.date}" readonly class="form-control">
            </div>
            <div class="form-group">
                <label for="saveLike">讚</label>
                <input type="text" name="saveLike" id="saveLike" value="${ltBean.saveLike}"readonly class="form-control">
            </div>
            <div class="form-group">
                <label for="picture">照片</label>
                <input type="file" name="picture" id="picture" value="${ltBean.picture}" class="form-control">
            </div>
            <div class="form-group">
                <label for="pageViews">瀏覽次數</label>
                <input type="text" name="pageViews" id="pageViews" value="${ltBean.pageViews}" class="form-control"readonly>
            </div>
            
            <input type="submit" class="btn" value="確定" />
        </form>
        <a href="/LTSelectAllFront" class="btn">返回首頁</a>
    </div>
</div>

</body>
</html>

