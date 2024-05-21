<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body class="app sidebar-mini rtl pace-done">
        <main class="app-content">
            <div class="app-title">
                <h1>大標題</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-title">
                            <!-- <h2>小標題</h2> -->
                        </div>
                        <div class="tile-body">
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

                                <table border="1">
                                    <tr style="background-color: #a8fefa">
                                        <th>文章ID</th>
                                        <th style="width: 100px">標題</th>
                                        <th>使用者ID</th>
                                        <th style="width: 50px">輸入文章內容</th>
                                        <th>日期</th>
                                        <th>讚</th>
                                        <th>照片</th>
                                        <th>操作</th>
                                    </tr>
                                    <c:forEach items="${ltBeans}" var="items">
                                        <tr>
                                            <td><a href="/findLTID/${items.ltId}">${items.ltId}</a></td>
                                            <td>${items.title}</td>
                                            <td>${items.userId}</td>
                                            <td>${items.content}</td>
                                            <td>${items.date}</td>
                                            <td>${items.saveLike}</td>
                                            <td><img src="${items.picture}"></td>
                                            <td>
                                                <form method="Get" action="/LTSelectById.controller/${items.ltId}">
                                                    <button class="edit" type="submit">修改</button>
                                                </form>
                                                <form method="post"
                                                    action="/LTDeleteById.controller?ltId=${items.ltId}">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <button class="delete" type="submit">刪除</button>
                                                </form>
                                                <form method="POST" action="/Likeinsert.controller">
                                                    <input type="hidden" name="userId" value="${items.userId}"> <input
                                                        type="hidden" name="ltId" value="${items.ltId}">
                                                    <button class="like" type="submit">讚</button>

                                                </form>
                                                
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
                            

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    var deleteButtons = document.querySelectorAll('.delete');

                                    deleteButtons.forEach(function (button) {
                                        button.addEventListener('click', function (event) {
                                            event.preventDefault(); // 阻止默认行为（即提交表单）

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
                                                    // 如果用户点击了确认，则提交表单
                                                    button.closest('form').submit();
                                                }
                                            });
                                        });
                                    });
                                });
                            </script>



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