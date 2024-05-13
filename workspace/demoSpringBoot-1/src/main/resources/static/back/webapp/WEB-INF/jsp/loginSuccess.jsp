<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首頁</title>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.1.0/uicons-brands/css/uicons-brands.css'>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.1.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<style>
body {
	margin: 0;
	background-color: #6C6C6C;
}

.front {
	width: auto;
	height: 60px;
	/* line-height: 50px; */
	background-color: #FFF8D7;
	font-size: large;
}

.front h4 {
	/* margin: 20px; */
	margin-top: 20px;
	margin-left: 80px;
	float: left;
	color: #EAC100;
}

.frontRight {
	float: right;
	margin-top: 20px;
}

.frontRight a {
	/* margin-left: 20px; */
	margin-right: 15px;
	padding-right: 25px;
	border-right: 1px solid #EAC100;
	font-weight: bold;
	text-decoration: none;
	color: black;
}

.frontRight a:hover {
	color: #FFDC35;
}

.frontRight span {
	color: #EAC100;
	margin-right: 10px;
	margin-left: 10px;
	font-size: larger;
	padding: 8px;
	padding-bottom: 0;
	border: 1px solid #EAC100;
	border-radius: 50%
}

.option {
	width: 500px;
	height: 93vh;
	background-color: white;
	padding-top: 130px;
	padding-left: 80px;
	/* border: 1px solid black; */
}

.option h2 {
	margin-top: 0;
}

.option #email, #password {
	width: 350px;
	height: 40px;
	border-radius: 17px;
	margin-bottom: 20px;
	font-size: 23px;
	text-indent: 10px;
	/*調整輸入框位置*/
}

.option #showPassword {
	width: 25px;
	height: 25px;
	margin-top: 10px;
	align-items: baseline
}

.option label {
	margin-left: 20px;
	font-size: larger;
}

.login, .register {
	width: 150px;
	height: 40px;
	margin-top: 25px;
	margin-right: 15px;
	border: 0;
	border-radius: 20px;
	font-size: larger;
	font-weight: bold;
	color: white;
	background-color: #EAC100;
}

.backstage {
	width: 100px;
	margin-left: 35px;
	border: 0;
	border-radius: 20px;
	font-weight: bold;
	font-size: larger;
	background-color: #EAC100;
}

button:active {
	transform: scale(0.90);
	/* 縮小按鈕 模擬點擊畫面 */
	transition: transform 0.1s ease;
	/* 動畫時間 */
}

.photo {
	/*max-height:170px;*/
	max-width: 170px;
	background-size: cover;
}
</style>
</head>

<body>
	<div class="front">
		<h4>JFDANCE</h4>
		<div class="frontRight">
			<a href="">首頁</a> <a href="">活動</a> <a href="html/StarMatch.html?ID=${match.id}">配對</a>
			<a href="">商城</a> <a href="">互動區</a> <a href="">課程</a> <span><i
				class="fi fi-sr-user"></i></span> <span><i
				class="fi fi-brands-facebook"></i></span> <span><i
				class="fi fi-brands-instagram"></i></span> <span><i
				class="fi fi-brands-line"></i></span>
		</div>
	</div>

	<div class="option">
		<h2>登入介面</h2>
		<c:set value="${sessionScope.Match}" var="match" />
		<table>
			<tr>
				<td>會員編號
				<td><input style="background-color: #7B7B7B;" type="text"
					value="${match.id} " name="ID" readonly>
			<tr>
				<td>姓名</td>
				<td><input type="text" value="${match.name}" name="NAME">
			<tr>
				<td>信箱
				<td><input type="text" value="${match.email}"
					name="EMAIL">
			<tr>
				<td>密碼
				<td><input type="text" value="${match.password}"
					name="PASSWORD">
			<tr>
				<td>性別
				<td><input type="text" value="${match.gender}"
					name="GENDER">
			<tr>
				<td>生日
				<td><input type="text" value="${match.birthday}"
					name="BIRTHDAY">
			<tr>
				<td>地址
				<td><input type="text" value="${match.location}"
					name="LOCATION">
			<tr>
				<td>簡介
				<td><input type="text" value="${match.bio}" name="BIO">
			<tr>
				<td>照片
				<td><img src="${match.profilePicture}" class="photo"><br>
			<tr>
				<td>年齡
				<td><input type="text" value="${match.age}" name="AGE">
		</table>


	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
        //登入
        $('.login').click(function () {
            if (checkdate()) {
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "送出確定",
                    showConfirmButton: false,
                    timer: 1500,
                    willClose: () => {
                        let email = $('#email').val();
                        let password = $('#password').val();
                        window.location.href = `/login?email=${email}&password=${password}`;
                    }
                });
            } else {
                // 沒填寫完
                Swal.fire({
                    icon: 'error',
                    title: '請輸入信箱及密碼'
                });
            }
        })
        //後台登入
        $('.backstage').click(function () {
            if (checkdate()) {
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "送出確定",
                    showConfirmButton: false,
                    timer: 1500,
                    willClose: () => {
                        let email = $('#email').val();
                        let password = $('#password').val();
                        window.location.href = `../Backstage?email=${email}&password=${password}`;
                    }
                });
            } else {
                // 沒填寫完
                Swal.fire({
                    icon: 'error',
                    title: '請輸入信箱及密碼'
                });
            }
        })
        //註冊會員
        $('.register').click(function () {
            window.location.href = "register.html"
        })
        //顯示密碼
        $('#showPassword').click(function () {
            $('#password').prop('type', this.checked ? 'text' : 'password');
        })
        //判定信箱及密碼有沒有值
        function checkdate() {
            let required = $('input[required]');
            for (let i = 0; i < required.length; i++) {
                if (!required[i].value) {
                    return false;
                }

            }
            return true;
        }
    </script>
</body>

</html>