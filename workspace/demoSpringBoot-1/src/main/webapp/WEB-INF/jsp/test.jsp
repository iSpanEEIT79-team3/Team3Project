<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Nunito', sans-serif;
    }

    .main {
        min-height: 55vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .big-table {
        width: 80%;
        border-collapse: collapse;
        table-layout: fixed;
        margin: auto;
    }

    .big-table td {
        padding: 10px;
    }

    .small-table {
        width: 100%;
        border: 1px solid black;
        text-align: center;
        padding: 10px;
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s;
    }

    .small-table:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .user-container {
        position: relative;
        width: 100%;
        
    }

    .user-details {
        display: none;
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        background-color: white;
        padding: 10px;
        border: 1px solid black;
        z-index: 1;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        margin-top: 10px;
    }

    .user-container:hover .user-details {
        display: block;
    }

    .button-container {
        margin-top: 10px;
        display: flex;
        justify-content: center;
    }

    .heart-button, .x-button {
        display: inline-block;
        text-align: center;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        font-size: 20px;
        margin: 5px;
        transition: transform 0.3s;
        cursor: pointer;
    }

    .heart-button {
        background: #f99;
        border: 1px solid #f66;
    }

    .x-button {
        background: #99f;
        border: 1px solid #66f;
    }

    .heart-button:hover, .x-button:hover {
        transform: scale(1.1);
    }

   .img {
    width: 100%;
    height: auto;
    max-width: 200px; /* 調整最大寬度 */
    max-height: 200px; /* 調整最大高度 */
    object-fit: cover;
    border-radius: 15px 15px 0 0;
}

    .user-details p {
        margin: 5px 0;
    }

    .user-details strong {
        font-weight: bold;
    }

    .btn {
        cursor: pointer;
    }
</style>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

<!-- Google Font : Nunito -->
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
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#user_image').hover(showUserData, hideUserData);
    });

    function showUserData() {
        $('#disabled_user_details').css("display", "block");
    }

    function hideUserData() {
        $('#disabled_user_details').css("display", "none");
    }
</script>
<title>範本</title>
</head>

<body>
    <div class="container-fluid" style="margin-top: 50px;"></div>
    <div class="main"></div>

    <table class="big-table">
        <c:forEach items="${matches}" var="user" varStatus="loop">
            <c:if test="${loop.index % 3 == 0}">
                <tr>
            </c:if>
            <td>
                <div class="small-table">
                    <div class="user-container">
                        <img id="user_image_${loop.index}" src="${user.picture}" alt="User Image" class="img">
                        <div class="button-container">
                            <form action="/createMatch" method="post">
                                <input type="hidden" name="userId1" value="${loginuser.userId}">
                                <input type="hidden" name="userId2" value="${user.userId}">
                                <input type="hidden" name="matchSuccess" value="2">
                                <input type="hidden" name="matchStatus" value="Y">
                                <button type="submit" class="heart-button">&#x2665;</button>
                            </form>
                            <form action="/createMatch" method="post">
                                <input type="hidden" name="userId1" value="${loginuser.userId}">
                                <input type="hidden" name="userId2" value="${user.userId}">
                                <input type="hidden" name="matchSuccess" value="0">
                                <input type="hidden" name="matchStatus" value="N">
                                <button type="submit" class="x-button">&#x2716;</button>
                            </form>
                        </div>
                        <div id="user_details_${loop.index}" class="user-details">
                            <p>Nickname: ${user.nickName}</p>
                            <p>Gender: ${user.gender}</p>
                            <p>Birthday: ${user.birthday}</p>
                            <p>Dance Character: ${user.danceCharacter}</p>
                            <p>Dance Age: ${user.danceAge}</p>
                        </div>
                    </div>
                </div>
            </td>
            <c:if test="${loop.index % 3 == 2 || loop.last}">
                </tr>
            </c:if>
        </c:forEach>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
    </script>

    <script>
        fetch('/html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });
    </script>
    <script src="/front/LoginUser.js"></script>
</body>
</html>
