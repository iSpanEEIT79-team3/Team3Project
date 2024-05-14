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

<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.lt {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.button-container {
    margin-top: 20px;
    display: flex; /* 將按鈕水平排列 */
    justify-content: center; /* 對齊置中 */
}

.h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

.button-container button:hover {
    background-color: #4682b4;
}

.report-list {
    width: 100%;
    margin-top: 20px;
}

.report-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background-color: #f5f5f5;
    margin-bottom: 10px;
}

.report-item div {
    flex: 1;
    text-align: center;
}

.report-item button:hover {
    background-color: #ff4500;
}
</style>
</head>
<body class="app sidebar-mini rtl pace-done">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <main class="app-content">
    <div class="app-title">
        <h2 class="h2">回復檢舉區</h2>
    </div>
    
    
    <div class="row">
        <div class="col-md-12">
            <div class="button-container"> <!-- 將按鈕放入容器中 -->

                <a href="LTSelectAll" style="text-decoration: none;">
                    <button class="btn btn-primary mr-2" onclick="changeColor()">返回首頁</button>
                </a>
            <form method="get" action="html/ReportReplyInsert.html">
                <button class="btn btn-primary mr-2" type="submit">新增</button>
            </form>
            <form method="get" action="html/ReportReplySelect.html">
                <input type="hidden" name="reportReplyId"
                    value="${items.reportReplyId}">
                <button class="btn btn-primary mr-2" type="submit">搜尋</button>
            </form>
        </div>
    </div>

    <div class="report-list">
        <div class="report-item" >
            <div>檢舉ID</div>
            <div>檢舉內容</div>
            <div>回復ID</div>
            <div>操作</div>
        </div>
        <c:forEach items="${reportreplyBeans}" var="items">
            <div class="report-item">
                <div>${items.reportReplyId}</div>
                <div>${items.reportContent}</div>
                <div>${items.replyId}</div>
                <div>
                    <form method="post"
                        action="/ReportReplyDelete.controller?reportReplyId=${items.reportReplyId}">
                        <input type="hidden" name="_method" value="DELETE">
                        <button  class="btn btn-danger mr-2" type="submit">刪除</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
                fetch('/back')
                    .then(response => response.text())
                    .then(html => {
                        //內容
                        $('.back-content').html(html);
                    })
                    .catch(error => console.error('Error fetching back.html', error));
            </script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var deleteButtons = document.querySelectorAll('.delete');

        deleteButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // 阻止默认行为（即提交表单）

                Swal.fire({
                    title: '確定刪除嗎?',
                    text: "此操作將無法還原!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確認刪除👌!',
                    cancelButtonText: '取消🫠'  
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 如果用户点击了确认，则提交表单
                        button.closest('form').submit();
                    }
                });
            });
        });
    });
</script>
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
    <script type="text/javascript"
        src="../../back/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript"
        src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
    <script>
                fetch('../../back/exampleBack.html')
                    .then(response => response.text())
                    .then(html => {
                        document.body.insertAdjacentHTML('beforeend', html);
                    });



                function RWDTest() {
                    //let RWD = document.getElementsByClassName("RWDTest");
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
