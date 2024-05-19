<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>所有課程</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* 控制分頁按鈕的大小和顏色 */
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            margin-top: 15px;
            border-radius: 4px; /* 按鈕圓角 */
        }
        .dataTables_info{
            margin-top: 12px;
        }

        /* 表格樣式 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
            white-space: nowrap; /* 保持文字在單行顯示 */
        }

        th {
            background-color: #009688; /* 表頭背景色 */
        }

        tr:nth-child(even) {
            background-color: white;
        }

        tr:hover {
            background-color: white;
        }

        .table-responsive {
            overflow-x: auto;
        }

    </style>

        </head>

        <body class="app sidebar-mini rtl pace-done">
            <main class="app-content">
                <div class="app-title">
                    <h1>課程管理系統</h1>
                </div>
                <div class="row lt">
                	<div class="ml-4">
                    <button class="btn btn-success m-2" id="json">匯出json</button>
                    <button class="btn btn-success m-2" id="xml">匯出xml</button>
                    <button class="btn btn-success m-2" id="excel">匯出excel</button>
                    </div >
                    <div class="col-12 box table-responsive">
                        <table id="coursesTable" class="table">
                            <thead>
                                <tr>
                                    <th>用戶ID</th>
                                    <th>產品ID</th>
                                    <th>課程名稱</th>
                                    <th>描述</th>
                                    <th>課程類型</th>
                                    <th>開始日期</th>
                                    <th>結束日期</th>
                                    <th>截止日期</th>
                                    <th>地點</th>
                                    <th>價格</th>
                                    <th>教師名稱</th>
                                    <th>教師聯繫方式</th>
                                    <th>報名人數</th>
                                    <th>最大容量</th>
                                    <th>課程圖片</th>
                                    <th>修改</th>
                                    <th>刪除</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${Courses}" var="course">
                                    <tr>
                                        <td>${course.idUser}</td>
                                        <td><a
                                                href="${pageContext.request.contextPath}/courseDetails/${course.productId}">${course.productId}</a>
                                        </td>
                                        <td>${course.courseName}</td>
                                        <td>${course.description}</td>
                                        <td>${course.courseType}</td>
                                        <td>${course.startDate}</td>
                                        <td>${course.endDate}</td>
                                        <td>${course.deadlineDate}</td>
                                        <td>${course.location}</td>
                                        <td>${course.price}</td>
                                        <td>${course.teacherName}</td>
                                        <td>${course.teacherContact}</td>
                                        <td>${course.enrollmentCount}</td>
                                        <td>${course.maxCapacity}</td>
                                        <td><img src="${course.courseImage}" style="width: 100px; height: 100px;"></td>
                                        <td><a href="/GetCourseById/${course.productId}"><button class="btn btn-success">修改</button></a></td>
                                        <td>
                                            <form method="post" action="/DeleteById?courseID=${course.productId}">
                                                <input type="hidden" name="_method" value="DELETE">
                                                <button type="submit" class="btn btn-success test">刪除</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <td><a href="/course-insert"><button class="btn btn-success m-2" >新增資料</button></a></td>
					<td><a href="http://localhost:8080/back/user/UserGetAll.html"><button class="btn btn-success m-2">回首頁</button></a></td>
                </div>
            </main>

    <!-- 脚本 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="../../back/js/popper.min.js"></script>
    <script src="../../back/js/bootstrap.min.js"></script>
    <script src="../../back/js/plugins/jquery.dataTables.min.js"></script>
    <script src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
    <script src="../../back/js/main.js"></script>
    <script src="../../back/js/plugins/pace.min.js"></script>
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
    <script>
        $(document).ready(function () {
            $('#coursesTable').DataTable({
                "autoWidth": true,
                "scrollX": "1300px",
                "scrollCollapse": true,
                "language": {
                    "processing": "處理中...",
                    "loadingRecords": "載入中...",
                    "lengthMenu": "顯示 _MENU_ 項結果",
                    "zeroRecords": "沒有符合的結果",
                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                    "search": "搜尋:",
                    "paginate": {
                        "first": "第一頁",
                        "previous": "上一頁",
                        "next": "下一頁",
                        "last": "最後一頁"
                    },
                    "aria": {
                        "sortAscending": ": 升冪排列",
                        "sortDescending": ": 降冟排列"
                    }
                }
            });
        });
        $('#json').click(function () {
            if (confirm("確定要匯出json嗎？")) {
                $.post('/export/json')
                    .done(function () {
                        alert('JSON匯出成功，位置C:/Downloads')
                    })
                    .fail(function (xhr, status, error) {
                        alert('JSON匯出失敗: ' + xhr.responseText)
                    });
            }
        });

        $('#xml').click(function () {
            if (confirm("確定要匯出xml嗎？")) {
                $.post('/export/xml')
                    .done(function () {
                        alert('XML匯出成功，位置C:/Downloads')
                    })
                    .fail(function (xhr, status, error) {
                        alert('XML匯出失敗')
                    });
            }
        });

        $('#excel').click(function () {
            if (confirm("確定要匯出excel嗎？")) {
                $.post('/export/excel')
                    .done(function () {
                        alert('Excel匯出成功，位置C:/Downloads')
                    })
                    .fail(function (xhr, status, error) {
                        alert('Excel匯出失敗')
                    });
            }
        });
    </script>
</body>
</html>