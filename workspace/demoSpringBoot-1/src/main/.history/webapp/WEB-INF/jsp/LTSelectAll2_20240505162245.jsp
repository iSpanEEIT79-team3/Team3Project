<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>

.main {
    min-height: 55vh;
    padding-top: 50px; /* 將內容區域下移以避免 navbar 擋住 */
    background-color: #fff; /* 將背景顏色設置為白色 */
}

.lt img {
    max-width: 200px; /* 設定圖片最大寬度為 800px */
    display: block;
    margin: 0 auto; /* 圖片置中 */
}

.lt .article {
    width: 100%; /* 将文章内容宽度设置为 100% */
    display: flex;
    flex-direction: column;
    align-items: center;
}

.article-item {
    width: 100%;
    max-width: 800px; /* 设置最大宽度 */
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    display: flex;
    flex-direction: column;
}

.article-content {
    margin-top: 16px; /* 调整内容顶部间距 */
}

.article-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
}

.article-info p {
    margin: 0;
}

.article-actions {
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

.article-actions button {
    border: none;
    background-color: transparent;
    cursor: pointer;
}

.article-actions button:hover {
    color: blue;
}

/* 按鈕樣式 */
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
    margin-left: 5px;
}

.btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
    color: #fff;
    margin-left: 5px;
}

.btn-success {
    background-color: #28a745;
    border-color: #28a745;
    color: #fff;
    margin-left: 5px;
}

/* 按鈕 hover 樣式 */
.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.btn-danger:hover {
    background-color: #c82333;
    border-color: #c82333;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #218838;
}

/* 讚數樣式 */
.saveLike {
    margin-left: 10px;
    font-weight: bold;
    color: #007bff;
}

</style>
<!-- Bootstrap CSS -->
<  </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

    <!--Google Font : Nunito-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

    <!-- For style(All CSS content) -->
    <link rel="stylesheet" type="text/css" href="../styles/home.css" />
    <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
    <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
    <link rel="icon" href="images/favicon.ico">

    <!-- JS Bundle for BS  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>
</head>
<body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Your Brand</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 主內容 -->
    <div class="main">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <div class="back-content"></div>
        <div class="lt">
            <div class="h22">
                <h2 class="h2">互動區</h2>
            </div>
            <form method="get" action="/ReplySelectAll">
                <button class="REPLY" type="submit">回復區</button>
            </form>
            <form method="get" action="html/LTTitle.html">
                <button class="title" type="submit">模糊查詢</button>
            </form>
            <form method="get" action="/ReportSelectAll">
                <button class="REPORT" type="submit">檢舉區</button>
            </form>
            <form method="get" action="html/LTInsert.html">
                <button class="add" type="submit">新增</button>
            </form>
            <br>
            <form method="Get" action="html/LTSelect.html">
                <button class="select" type="submit">搜尋</button>
            </form>
            <div class="article col-12 col-md-8">
              <c:forEach items="${ltBeans}" var="items">
    <div class="article-item" style="background-color:Lightgray;"> <!-- 修改的部分 -->
    <div class="article-info">
        <p><strong>標題:</strong> ${items.title}</p>
        <p><strong>發文人:</strong> ${items.userId} <strong>時間:</strong> ${items.date}</p>
    </div>
    <div class="article-content">
        <p>${items.content}</p>
    </div>
    <img src="${items.picture}">
    <div class="article-actions">
        <form method="Get" action="/LTSelectById.controller/${items.ltId}">
            <button class="btn btn-primary btn-sm" type="submit">修改</button>
        </form>
        <form method="post" action="/LTDeleteById.controller?ltId=${items.ltId}">
            <input type="hidden" name="_method" value="DELETE">
            <button class="btn btn-danger btn-sm delete" type="submit">刪除</button>
        </form>
        <form method="POST" action="/Likeinsert.controller">
            <input type="hidden" name="userId" value="${items.userId}">
            <input type="hidden" name="ltId" value="${items.ltId}">
            <button class="btn btn-success btn-sm like" type="submit">讚</button>
            <span class="like-count">${items.saveLike}</span> <!-- 顯示讚數 -->
        </form>
    </div>
    <div>
    </div>
</div>
</c:forEach>

            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous">
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var deleteButtons = document.querySelectorAll('.delete');
            deleteButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    event.preventDefault(); // 防止預設表單提交行為
                    Swal.fire({
                        title: '確定刪除嗎❌?',
                        text: "此操作將無法還原🫠!",
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: '確認刪除!',
                        cancelButtonText: '取消'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // 如果使用者確認，則提交表單
                            button.closest('form').submit();
                        }
                    });
                });
            });
        });

        fetch('html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });
    </script>
</body>
</html>
