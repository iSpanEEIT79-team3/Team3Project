<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.main {
	min-height: 55vh;
	grid-template-columns: repeat(5, 1fr);
	align-items: start; 
}

.user-container {
	text-align: center;
    padding-left: 300px; 
    padding-right: 300px;
 	flex-direction: column; 
    width:100%;
}

</style>
<link href="/front/match/matchcss/rotating-card.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="/front/LoginUser.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
<!-- Google Font : Nunito -->
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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9crossorigin=" crossorigin="anonymous"> </script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>


<!-- JS Bundle for BS  -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7N" crossorigin="anonymous"></script> -->
<script type="text/javascript">
$( document ).ready(function() {
	login()
});
        let stompClient
        function login() {
        	var uid = ${loginuser.userId};
        	alert(uid);
            let socket = new WebSocket(`ws://localhost:8080/websocket/`+uid)
            stompClient = Stomp.over(socket)	
            stompClient.connect({}, function () {
                // 所有想要接收给指定用户发送的信息的订阅地址都必须加上/user前缀
                // 这里是为了配合后台的 convertAndSendToUser 方法，如果使用
                // convertAndSend，就不需要 /user 前缀了，下面会再介绍
                stompClient.subscribe(`/chat/contact/`+uid, function (msg) {
                    let entity = JSON.parse(msg.body)
                    showGreeting(entity.message)
                })
                
            })


            function showGreeting(message) {
            	var oldToMsg = $("#toMsg").html()
                $("#toMsg").html(oldToMsg+"<span>${nickName2}:"+message+"</span></br>")
                $("#userMsg").html($("#userMsg").html()+"</br>")
            }
        }

        function sendMsg() {
            var msg = document.getElementById('message').value
            
            $("#userMsg").html($("#userMsg").html()+"<span>${loginuser.nickName}:"+msg+"</span></br>")
            $("#toMsg").html($("#toMsg").html()+"</br>")
            stompClient.send("/sendMsg", {}, JSON.stringify({
                from: ${loginuser.userId},
                to: ${user2id},
                message: msg,
                time: new Date()
            }))
        }
        
        function toMsg(){
            ws.on('message', data => {
                //data 為 Client 發送的訊息，現在將訊息原封不動發送出去
                ws.send(data)
            })
        }
    </script>

<title>範本</title>
</head>

<body>
	<div class="container-fluid" style="margin-top: 150px;">
		<h2 class="text-center">聊天室</h2>
	</div>
	<div class="main">
		<div class="user-container">
			<div class="row" style="padding-left:150px;padding-right: 150px;">
			    <div><input type="text" placeholder="請輸入文字" id="message"/><button onclick="sendMsg()">發送</button></div>
			</div>
			<div class="row" style="background-color:#DDDDDD;">
				<div id="userMsg" class="col"></div>
				<div id="toMsg" class="col"></div>
			</div>

		</div>
	</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
			crossorigin="anonymous"></script>
		<script>
        fetch('html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });
    </script>
    <script src="/front/LoginUser.js"></script>
</body>

</html>
