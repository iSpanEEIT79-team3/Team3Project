<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>
.btn.btn-warning.btn-sm {
    background-color: blue; /* 背景色設為藍色 */
    color: white; /* 文字顏色設為白色 */
}
.like-count {
    border: 1px solid black; /* 添加1像素寬度的黑色實線框框 */
    padding: 2px 4px; /* 可選：添加一些內邊距，使內容與框框之間有一些空間 */
}

input[name="reportContent"] {
    float: right;
}


		
.main {
    mmin-height: 50vh; /* 將區域高度設置為整個視窗的高度 */
    padding-top: 30px; /* 將內容區域下移以避免 navbar 擋住 */
  background-image: url('/Static/images/FB.jpg'); /* 背景圖片的 URL */
    background-size: cover; /* 以 cover 的方式填滿整個區域 */
    background-position: center center; /* 將背景圖片水平和垂直都置中 */
    background-repeat: no-repeat; /* 不重複顯示背景圖片 */
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
    background-color: #f9f9f9; /* 設置背景顏色 */
}

.article-content {
    margin-top: 16px; /* 调整内容顶部间距 */
}
.btn.btn-info {
    color: white; /* 设置按钮文字颜色为白色 */
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

.article-info hr, .article-content hr, .article-actions hr {
    border: none;
    border-bottom: 1px solid #ddd;
    margin: 8px 0;
}
.add-form {
    text-align: center; /* 將內容置中 */
    margin-top: 25px; /* 調整上方間距 */
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
    transition: color 0.3s ease-in-out; /* 添加按鈕顏色變化的動畫效果 */
}

.article-actions button:hover {
    color: #007bff; /* 淺藍色 */
}
.article-actions button {
    margin-right: 5px; /* 添加右边距，分隔按钮 */
    border: none;
    background-color: transparent;
    cursor: pointer;
    transition: color 0.3s ease-in-out; /* 添加按钮颜色变化的动画效果 */
}
.youtube-video {

    margin-right: 1000px; /* 可以根據需要調整右邊距 */
}


	

/* 讚數樣式 */
.saveLike {
    margin-left: 10px;
    font-weight: bold;
    color: #007bff;
}

</style>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <div class="back-content"></div>
        <div class="lt">
            <div class="h22">
                <h2 class="h2">互動區</h2>
            </div>
              <div style="position: absolute; top: 110px; right: 110px;">
            <form method="get" action="/findtitleFront">
                <input type="text" name="title" placeholder="輸入關鍵字" />
                <button class="btn btn-info btn-sm title" type="submit">關鍵字搜尋</button>
            </form>
        </div>
        <div style="position: absolute; top: 160px; right: 110px;">
        <form method="Get" action="html/LTSelect.html">
            <button class="btn btn-info btn-sm select" type="submit">搜尋文章ID</button>
        </form>
        </div>
        <div class="add-form">
        <form method="get" action="html/LTInsertFront.html">
            <button class="btn btn-info btn-sm add" type="submit">發布文章</button>
        </form>
        </div>
        <br>
        <div class="youtube-video">
    <iframe width="350" height="350" src="https://www.youtube.com/embed/Z1DjmnCNceA?mute=1&autoplay=1"
    style=" position: fixed;"
        title="非常好听🎄宮崎駿 水晶音樂 放鬆身心 輕音樂, 每天調心洗滌心性🎄 正能量,早晨音樂無廣告, Relaxing Piano Music, relax music" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        allowfullscreen></iframe>
     
 </div>
            <div class="article col-12 col-md-8">
              <c:forEach items="${ltBeans}" var="items">
    <div class="article-item"> 
    <div class="article-info">
    <p><strong>文章ID:</strong> ${items.ltId}</p>
        <p><strong>標題:</strong> ${items.title}</p>
          <hr>
        <p><strong>發文人:</strong> ${items.userId} <strong>時間:</strong> ${items.date}</p>
    </div>
          <hr>
  <div class="article-content">
    <h4 style="color: black; font-weight: bold;">文章內容:</h4>	
    <p >${items.content}</p>
</div>

    <img src="${items.picture}">
      <hr>
    <div class="article-actions">
        
	            <form method="post" action="/Reportinsert.controller">
	            <input type="hidden" name="ltId" value="${items.ltId}">
    <input type="text" name="reportContent" placeholder="请输入檢舉內容">
    <button class="btn btn-warning btn-sm" type="submit">檢舉</button>
    </form>
        <form method="Get" action="/LTSelectByIdFront.controller/${items.ltId}">
            <button class="btn btn-primary btn-sm" type="submit"style="background-color:blue">修改</button>
        </form>
        
        <form method="post" action="/LTDeleteByIdFront.controller?ltId=${items.ltId}">
            <input type="hidden" name="_method" value="DELETE">
            <button class="btn btn-danger btn-sm delete" type="submit"style="background-color:blue"required>刪除</button>
        </form>
            <form method="get" action="/findLTIDFront/${items.ltId}">
                <button class="btn btn-info btn-sm REPLY" type="submit"style="background-color:blue">回復區</button>
            </form>
        <form method="POST" action="/LikeinsertFront.controller">
            <input type="hidden" name="userId" value="${items.userId}">
            <input type="hidden" name="ltId" value="${items.ltId}">
            <button class="btn btn-success btn-sm like " type="submit" style="background-color:blue">讚</button>
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
    
    </script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var deleteButtons = document.querySelectorAll('.delete');
        deleteButtons.forEach(function (button) {
            button.addEventListener('click', function (event) {
                event.preventDefault();
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
