<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
  <meta name="description"
    content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
  <title>JFSwing後台</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .container .btn {
      margin-bottom: 20px;
    }

    h2 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .article {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }

    .article-item {
      width: 300px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .article-item img {
      max-width: 100%;
      height: auto;
      border-radius: 8px;
    }

    .article-item h3 {
      margin-top: 10px;
      font-size: 18px;
    }

    .article-item p {
      margin-top: 10px;
      font-size: 14px;
      color: #666;
    }

    .article-item .article-details {
      margin-top: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 14px;
      color: #888;
    }

    .article-item .article-details a {
      color: #007bff;
      text-decoration: none;
    }
  </style>
</head>
<body class="app sidebar-mini rtl pace-done">
    <main class="app-content">
  <div class="app-title">
    <h2>查詢相關資料</h2>
  </div>
        <a class="btn btn-primary mr-2" href="LTSelectAll">返回首頁</a>
  <div class="row">
    <div class="col-md-12">
      <div class="button-container">
      </div>
      <div class="container">
        <div class="article">
          <c:forEach items="${ltBeans}" var="items">
            <div class="article-item">
              <img src="${items.picture}" alt="文章圖片">
              <h3>${items.title}</h3>
              <p>${items.content}</p>
              <div class="article-details">
                <span>文章ID: ${items.ltId}</span>
                <span>使用者ID: ${items.userId}</span>
                <span>日期: ${items.date}</span>
                <span>讚: ${items.saveLike}</span>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
  </main>
  <!-- Essential javascripts for application to work-->
  <script src="../../back/js/jquery-3.2.1.min.js"></script>
  <script src="../../back/js/popper.min.js"></script>
  <script src="../../back/js/bootstrap.min.js"></script>
  <script src="../../back/js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="../../back/js/plugins/pace.min.js"></script>
  <!-- Page specific javascripts-->
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
