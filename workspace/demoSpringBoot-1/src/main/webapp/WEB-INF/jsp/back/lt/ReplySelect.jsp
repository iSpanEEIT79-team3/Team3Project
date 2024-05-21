<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>

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
    <style>
        body {
            overflow: auto;
            margin: 0;
            padding: 0;
        }

        .lt img {
            max-width: 300px;
            height: 300px;
        }

        .content {
            max-width: 400px;
            /* 設定最大寬度 */
            overflow: hidden;
            /* 隱藏超出的內容 */
            text-overflow: ellipsis;
            /* 使用省略符號表示被隱藏的內容 */
            white-space: nowrap;
            /* 避免文字換行 */
        }

        .row {
            display: flex;
            flex-direction: column;
            align-items: center;
            /* 垂直居中 */
        }

        .input-group {
            display: flex;
            align-items: center;
            margin: 10px;
            /* 設定間距 */
        }

        .input-group label {
            margin-right: 5px;
            /* 調整標籤和輸入框之間的間距 */
            align-self: flex-start;
            /* 垂直對齊到頂部 */
        }

        .input-group input {
            flex: 1;
            /* 讓輸入框自動填滿剩餘空間 */
        }
    </style>
</head>

<body class="app sidebar-mini rtl pace-done">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <main class="app-content">
        <div class="app-title">
            <h2>查詢</h2>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="button-container"  style="display: flex; flex-direction: column; align-items: center;">>
                    <!-- 將按鈕放入容器中 -->
                    <div class="input-group">
                        <label for="replypost">回復ID:</label>
                        <input type="text" disabled value="${replyBean.replyId}">
                    </div>

                    <div class="input-group">
                        <label for="replytime">回復時間:</label>
                        <input type="text" disabled value="${replyBean.replytime}">
                    </div>

                    <div class="input-group">
                        <label for="replypost">回覆內容:</label>
                        <input type="text" disabled value="${replyBean.replypost}">
                    </div>

                    <div class="input-group">
                        <label for="userId">使用者ID:</label>
                        <input type="text" disabled value="${replyBean.userId}">
                    </div>

                    <div class="input-group">
                        <label for="ltId">文章ID:</label>
                        <input type="text" disabled value="${replyBean.ltBean.getLtId()}">
                    </div>
                </div>
            </div>
        </div>

        <a href="LTSelectAll" style="text-decoration: none;">
            <button class="btn btn-primary mr-2" onclick="changeColor()">返回首頁</button>
        </a>
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
