<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" type="text/css" href="../html/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 如果需要使表格垂直置中，可以設置容器高度 */
        }

        table {
            width: 80%; /* 调整表格宽度 */
            margin-top: 20px; /* 添加上边距 */
        }

        th,
        td {
            text-align: center;
            vertical-align: middle;
            padding: 8px;
            border: 1px solid #ddd;
        }
    </style>
</head>

<body class="app sidebar-mini rtl pace-done">
    <main class="app-content">
        <div class="center-content"> <!-- 在這裡包裹表格 -->
            <div class="app-title">
                <h1>大標題</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-title">
                            <h2>配對紀錄</h2>
                        </div>
                        <table class="table table-hover" id="page">
                            <thead>
                                <tr>
                                    <th>配對紀錄</th>
                                    <th>會員1</th>
                                    <th>會員2</th>
                                    <th>配對時間</th>
                                    <th>配對狀態</th>
                                    <th>配對成功</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${Allmatches}" var="match">
                                    <tr>
                                        <td>${match.matchid}</td>
                                        <td>${match.user1id}</td>
                                        <td>${match.user2id}</td>
                                        <td>${match.matchdate}</td>
                                        <td>${match.matchsuccess}</td>
                                        <td>${match.matchstatus}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Essential javascripts for application to work-->
    <script src="/html/js/jquery-3.2.1.min.js"></script>
    <script src="/html/js/popper.min.js"></script>
    <script src="/html/js/bootstrap.min.js"></script>
    <script src="/html/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/html/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="/html/js/plugins/chart.js"></script>
    <script type="text/javascript" src="/html/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/html/js/plugins/dataTables.bootstrap.min.js"></script>

    <script>
        $('#page').DataTable();
    </script>
</body>

</html>
