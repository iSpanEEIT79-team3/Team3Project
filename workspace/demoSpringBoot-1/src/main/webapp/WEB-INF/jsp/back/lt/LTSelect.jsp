<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JFSwing後台</title>
  <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .article-content {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #fff;
    }

    .data-container > * {
      margin-bottom: 20px;
    }

    .data-container label {
      font-weight: bold;
      display: block;
    }

    .data-container input {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
    }

    hr {
      border: none;
      border-top: 1px solid #ccc;
      margin: 20px 0;
    }

    .button-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

  

    .button-container .btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body class="app sidebar-mini rtl pace-done">
  <main class="app-content">
    <div class="article-container">
      <div class="article-content">
        
        <div class="button-container">
          <a class="btn btn-primary mr-2" href="/LTSelectAll">返回首頁</a>
        </div>
        <div class="data-container">
          <label for="ltId">論壇ID:</label>
          <input type="text" id="ltId" disabled value="${ltBean.ltId}">
          <label for="title">標題:</label>
          <input type="text" id="title" disabled value="${ltBean.title}">
          <label for="userId">使用者ID:</label>
          <input type="text" id="userId" disabled value="${ltBean.userId}">
          <label for="date">發文時間:</label>
          <input type="text" id="date" disabled value="${ltBean.date}">
          <hr>
          <label for="content">文章內容:</label>
          <input type="text" id="content" disabled value="${ltBean.content}">
          <hr>
          <label for="picture">照片:</label>
          <input type="text" id="picture" disabled value="${ltBean.picture}">
          <hr>
          <label for="saveLike">讚:</label>
          <input type="text" id="saveLike" disabled value="${ltBean.saveLike}">
        </div>
      </div>
    </div>
  </main>
  <script src="../../back/js/jquery-3.2.1.min.js"></script>
  <script src="../../back/js/popper.min.js"></script>
  <script src="../../back/js/bootstrap.min.js"></script>
  <script src="../../back/js/main.js"></script>
  <script src="../../back/js/plugins/pace.min.js"></script>
  <script type="text/javascript" src="../../back/js/plugins/chart.js"></script>
  <script type="text/javascript" src="../../back/js/plugins/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
  <script>
    fetch('../../back/exampleBack.html')
      .then(response => response.text())
      .then(html => {
        document.body.insertAdjacentHTML('beforeend', html);
      });

    function RWDTest() {
      let RWD = document.body;
      if (RWD.className === "app sidebar-mini rtl sidenav-toggled pace-done") {
        RWD.className = "app sidebar-mini rtl pace-done";
      } else {
        RWD.className = "app sidebar-mini rtl sidenav-toggled pace-done";
      }
    }
  </script>
</body>
</html>
