<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    .main {
        min-height: 55vh;
        /* 让 .slant 至少占据整个视口高度 */
    }

    .child {
        position: absolute;
        border: 1px red solid;
        top: 50%;
        left: 50%;
        margin: -150px 0 0 -150px;
        text-align: center;
    }

    .big-table {
        width: 100%;
        border-collapse: collapse;
    }
 
    .small-table {
        width: 33.33%;
        border: 1px solid black;
        text-align: center;
        
    }
</style>
<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
    crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4287c80df9.js"
    crossorigin="anonymous"></script>

<!--Google Font : Nunito-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
    href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap"
    rel="stylesheet">

<!-- For style(All CSS content) -->
<link rel="stylesheet" type="text/css" href="../styles/home.css" />
<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
<link rel="icon" href="images/favicon.ico">

<!-- JS Bundle for BS  -->
<script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous">

</script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
    crossorigin="anonymous">

</script>
<script>
    $(document).ready(function () {
        $('#user_details').hover(func_1, func_2);
    });

    function func_1() {
        $('#disabled_user_details').css("display", "block");
    }

    function func_2() {
        $('#disabled_user_details').css("display", "none");
    }

    function i() {
        $.ajax({
            url: "/matches", // 调用后端Controller方法的路径
            type: "GET",
            data: { userid: yourUserId }, // 传递的参数
            dataType: "json",
            success: function (response) {
                var userList = $("#userList");
                userList.empty(); // 清空列表
                $.each(response, function (index, user) {
                    var userHtml = "<li>";
                    userHtml += "<img src='" + user.picture + "' alt='User Image'>";
                    userHtml += "<p>Nickname: " + user.nickName + "</p>";
                    userHtml += "<p>Gender: " + user.gender + "</p>";
                    userHtml += "<p>Birthday: " + user.birthday + "</p>";
                    userHtml += "<p>Dance Character: " + user.danceCharacter + "</p>";
                    userHtml += "<p>Dance Age: " + user.danceAge + "</p>";
                    userHtml += "</li>";
                    userList.append(userHtml);
                });
            },
            error: function (xhr, status, error) {
                console.error("Error fetching user list:", error);
            }
        });
    }

</script>
<title>範本</title>
</head>

<body>


    <div class="container-fluid" style="margin-top: 150px;"></div>
    <!-- <section> -->
    <div class="main">
        <div class="child">

            <div id="disabled_user_details" style="display: none">
                <table style="color: blue;">
                    <tr>
                        <td>會員資料</td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td>白癡聒聒</td>
                    </tr>
                    <tr>
                        <td>暱稱</td>
                        <td>abcde</td>
                    </tr>
                    <tr>
                        <td>年齡</td>
                        <td>30</td>
                    </tr>
                    <tr>
                        <td>舞齡</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>角色</td>
                        <td>學生</td>
                    </tr>
                    <tr>
                        <td>簡介</td>
                        <td>從入門到放棄</td>
                    </tr>
                    <tr>
                        <td>圖片</td>
                        <td>不想放</td>
                    </tr>
                    <tr>
                        <td>性別</td>
                        <td>女</td>
                    </tr>
                </table>
            </div>

            <div id="user_details">
                <table>
                    <tr>
                        <td><button type="submit" style="background: #f99;">&#x2665;</button></td>
                        <td><button type="reset" style="background: #99f;">&#x2716;</button></td>
                    </tr>
                </table>
            </div>

        </div>
    </div>

  
    <table class="big-table">
        <c:forEach items="${matches}" var="user" varStatus="loop">
            <c:if test="${loop.index % 3 == 0}">
                <tr>
            </c:if>
            <td>
                <table class="small-table">
                    <tr>
                        <td>${user.nickName}</td>
                    </tr>
                    <tr>
                        <td>${user.gender}</td>
                    </tr>
                    <tr>
                        <td>${user.birthday}</td>
                    </tr>
                    <tr>
                        <td>${user.danceCharacter}</td>
                    </tr>
                    <tr>
                        <td>${user.danceAge}</td>
                    </tr>
                </table>
            </td>
            <c:if test="${loop.index % 3 == 2 || loop.last}">
                </tr>
            </c:if>
        </c:forEach>
    </table>

</body>

</html>
