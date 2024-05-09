<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
						<td>
							<div class="user-container">
								<img id="user_image_${loop.index}" src="${user.picture}"
									alt="User Image" class="img">
								<div class="button-container">
									<form action="/createMatch" method="post">
										<input type="hidden" name="userId1" value="${loginuser.userId}">
										<input type="hidden" name="userId2" value="${user.userId}">
										<input type="hidden" name="matchSuccess" value="2">
										<input type="hidden" name="matchStatus" value="Waiting">
										
										<button type="submit" style="background: #f99;"
											class="heart-button">&#x2665;</button>
									</form>
									<form action="/createMatch" method="post">
										<input type="hidden" name="userId1" value="${loginuser.userId}">
										<input type="hidden" name="userId2" value="${user.userId}">
										<input type="hidden" name="matchSuccess" value="0">
										<input type="hidden" name="matchStatus" value="N">
									<button type="submit" style="background: #99f;" class="x-button">&#x2716;</button>
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
						</td>
					</tr>
				</table>
			</td>
			<c:if test="${loop.index % 3 == 2 || loop.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<style>
.user-container {
	position: relative;
	display: inline-block;
	width: 200px; /* 設置圖片的寬度 */
	height: 200px; /* 設置圖片的高度 */
}

.user-details {
	display: none;
	position: absolute;
	top: 100%; /* 讓詳細資料顯示在圖片下方 */
	left: 0;
	background-color: white;
	padding: 10px;
	border: 1px solid black;
	z-index: 1;
}

.button-container {
	position: absolute;
	bottom: 10px; /* 設置按鈕容器距離底部的距離 */
	left: 50%; /* 讓按鈕容器居中 */
	transform: translateX(-50%); /* 水平居中 */
}

.heart-button, .x-button {
	display: inline-block;
	text-align: center;
	width: 25px; /* 設置按鈕的寬度 */
	height: 25px; /* 設置按鈕的高度 */
	border: 1px solid black;
	border-radius: 20px;
}

.user-container:hover .user-details {
	display: block;
}

.img {
	width: 200px;
	max-height: 200px;
	object-fit: cover;
	margin-right: 20px;
	border-radius: 20px;
}
</style>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
	        </script>
	<script>
      
        fetch('/html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });

        
    </script>

</body>
</html>