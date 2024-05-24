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
	width: 100%;
}

body {
	margin-top: 20px;
}

/*************** 1.Variables ***************/

/* ------------------ Color Pallet ------------------ */

/*************** 2.Mixins ***************/

/************************************************
        ************************************************
                                            Search Box
        ************************************************
    ************************************************/
.chat-search-box {
	-webkit-border-radius: 3px 0 0 0;
	-moz-border-radius: 3px 0 0 0;
	border-radius: 3px 0 0 0;
	padding: .75rem 1rem;
}

.chat-search-box .input-group .form-control {
	-webkit-border-radius: 2px 0 0 2px;
	-moz-border-radius: 2px 0 0 2px;
	border-radius: 2px 0 0 2px;
	border-right: 0;
}

.chat-search-box .input-group .form-control:focus {
	border-right: 0;
}

.chat-search-box .input-group .input-group-btn .btn {
	-webkit-border-radius: 0 2px 2px 0;
	-moz-border-radius: 0 2px 2px 0;
	border-radius: 0 2px 2px 0;
	margin: 0;
}

.chat-search-box .input-group .input-group-btn .btn i {
	font-size: 1.2rem;
	line-height: 100%;
	vertical-align: middle;
}

@media ( max-width : 767px) {
	.chat-search-box {
		display: none;
	}
}

/************************************************
        ************************************************
                                        Users Container
        ************************************************
    ************************************************/
.users-container {
	position: relative;
	padding: 1rem 0;
	border-right: 1px solid #e6ecf3;
	height: 100%;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
}

/************************************************
        ************************************************
                                                Users
        ************************************************
    ************************************************/
.users {
	padding: 0;
}

.users .person {
	position: relative;
	width: 100%;
	padding: 10px 1rem;
	cursor: pointer;
	border-bottom: 1px solid #f0f4f8;
}

.users .person:hover {
	background-color: #ffffff;
	/* Fallback Color */
	background-image: -webkit-gradient(linear, left top, left bottom, from(#e9eff5),
		to(#ffffff));
	/* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(right, #e9eff5, #ffffff);
	/* Chrome 10+, Saf5.1+, iOS 5+ */
	background-image: -moz-linear-gradient(right, #e9eff5, #ffffff);
	/* FF3.6 */
	background-image: -ms-linear-gradient(right, #e9eff5, #ffffff);
	/* IE10 */
	background-image: -o-linear-gradient(right, #e9eff5, #ffffff);
	/* Opera 11.10+ */
	background-image: linear-gradient(right, #e9eff5, #ffffff);
}

.users .person.active-user {
	background-color: #ffffff;
	/* Fallback Color */
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f7f9fb),
		to(#ffffff));
	/* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(right, #f7f9fb, #ffffff);
	/* Chrome 10+, Saf5.1+, iOS 5+ */
	background-image: -moz-linear-gradient(right, #f7f9fb, #ffffff);
	/* FF3.6 */
	background-image: -ms-linear-gradient(right, #f7f9fb, #ffffff);
	/* IE10 */
	background-image: -o-linear-gradient(right, #f7f9fb, #ffffff);
	/* Opera 11.10+ */
	background-image: linear-gradient(right, #f7f9fb, #ffffff);
}

.users .person:last-child {
	border-bottom: 0;
}

.users .person .user {
	display: inline-block;
	position: relative;
	margin-right: 10px;
}

.users .person .user img {
	width: 48px;
	height: 48px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
}

.users .person .user .status {
	width: 10px;
	height: 10px;
	-webkit-border-radius: 100px;
	-moz-border-radius: 100px;
	border-radius: 100px;
	background: #e6ecf3;
	position: absolute;
	top: 0;
	right: 0;
}

.users .person .user .status.online {
	background: #9ec94a;
}

.users .person .user .status.offline {
	background: #c4d2e2;
}

.users .person .user .status.away {
	background: #f9be52;
}

.users .person .user .status.busy {
	background: #fd7274;
}

.users .person p.name-time {
	font-weight: 600;
	font-size: .85rem;
	display: inline-block;
}

.users .person p.name-time .time {
	font-weight: 400;
	font-size: .7rem;
	text-align: right;
	color: #8796af;
}

@media ( max-width : 767px) {
	.users .person .user img {
		width: 30px;
		height: 30px;
	}
	.users .person p.name-time {
		display: none;
	}
	.users .person p.name-time .time {
		display: none;
	}
}

/************************************************
        ************************************************
                                        Chat right side
        ************************************************
    ************************************************/
.selected-user {
	width: 100%;
	padding: 0 15px;
	min-height: 64px;
	line-height: 64px;
	border-bottom: 1px solid #e6ecf3;
	-webkit-border-radius: 0 3px 0 0;
	-moz-border-radius: 0 3px 0 0;
	border-radius: 0 3px 0 0;
}

.selected-user span {
	line-height: 100%;
}

.selected-user span.name {
	font-weight: 700;
}

.chat-container {
	position: relative;
	padding: 1rem;
}

.chat-container li.chat-left, .chat-container li.chat-right {
	display: flex;
	flex: 1;
	flex-direction: row;
	margin-bottom: 40px;
}

.chat-container li img {
	width: 48px;
	height: 48px;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
}

.chat-container li .chat-avatar {
	margin-right: 20px;
}

.chat-container li.chat-right {
	justify-content: flex-end;
}

.chat-container li.chat-right>.chat-avatar {
	margin-left: 20px;
	margin-right: 0;
}

.chat-container li .chat-name {
	font-size: .75rem;
	color: #999999;
	text-align: center;
}

.chat-container li .chat-text {
	padding: .4rem 1rem;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	background: #ffffff;
	font-weight: 300;
	line-height: 150%;
	position: relative;
}

.chat-container li .chat-text:before {
	content: '';
	position: absolute;
	width: 0;
	height: 0;
	top: 10px;
	left: -20px;
	border: 10px solid;
	border-color: transparent #ffffff transparent transparent;
}

.chat-container li.chat-right>.chat-text {
	text-align: right;
}

.chat-container li.chat-right>.chat-text:before {
	right: -20px;
	border-color: transparent transparent transparent #ffffff;
	left: inherit;
}

.chat-container li .chat-hour {
	padding: 0;
	margin-bottom: 10px;
	font-size: .75rem;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	margin: 0 0 0 15px;
}

.chat-container li .chat-hour>span {
	font-size: 16px;
	color: #9ec94a;
}

.chat-container li.chat-right>.chat-hour {
	margin: 0 15px 0 0;
}

@media ( max-width : 767px) {
	.chat-container li.chat-left, .chat-container li.chat-right {
		flex-direction: column;
		margin-bottom: 30px;
	}
	.chat-container li img {
		width: 32px;
		height: 32px;
	}
	.chat-container li.chat-left .chat-avatar {
		margin: 0 0 5px 0;
		display: flex;
		align-items: center;
	}
	.chat-container li.chat-left .chat-hour {
		justify-content: flex-end;
	}
	.chat-container li.chat-left .chat-name {
		margin-left: 5px;
	}
	.chat-container li.chat-right .chat-avatar {
		order: -1;
		margin: 0 0 5px 0;
		align-items: center;
		display: flex;
		justify-content: right;
		flex-direction: row-reverse;
	}
	.chat-container li.chat-right .chat-hour {
		justify-content: flex-start;
		order: 2;
	}
	.chat-container li.chat-right .chat-name {
		margin-right: 5px;
	}
	.chat-container li .chat-text {
		font-size: .8rem;
	}
}

.chat-form {
	padding: 15px;
	width: 100%;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ffffff;
	border-top: 1px solid white;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.card {
	border: 0;
	background: #f4f5fb;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	margin-bottom: 2rem;
	box-shadow: none;
}
.user-msg {
    background-color: #E6F0F2;
}
.card m-0 {
	d-flex: align-items-center;
}
</style>
<link href="/front/match/matchcss/rotating-card.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="/front/LoginUser.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4287c80df9.js"
	crossorigin="anonymous"></script>
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
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9crossorigin=" crossorigin="anonymous"> </script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
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
            	
            	var currentTime = new Date().toLocaleTimeString();
            	
            	 $("#chatBox").html($("#chatBox").html() + 
            		        '<li class="chat-left">' +
            		            '<div class="chat-avatar">' +
            		                '<img src="${picture2}" alt="User Image">' +
            		                '<div class="chat-name">${nickName2}</div>' +
            		            '</div>' +
            		            '<div class="chat-text" style="background-color:#F0EFF0;" id="userMsg">' +
            		            message  +
            		            '</div>' +
            		            '<div class="chat-hour">' +
            		            currentTime + '<span class="fa fa-check-circle"></span>' +
            		            '</div>' +
            		        '</li>'
            		    );
            }
        }

        function sendMsg() {
            var msg = document.getElementById('message').value;
            var currentTime = new Date().toLocaleTimeString();

            $("#chatBox").html($("#chatBox").html() + 
                '<li class="chat-right">' +
                    '<div class="chat-hour">' +
                    currentTime + '<span class="fa fa-check-circle"></span>' +
                    '</div>' +
                    '<div class="chat-text" style="background-color:#E6F0F2;" id="toMsg">' +
                    msg  +
                    '</div>' +
                    '<div class="chat-avatar">' +
                        '<img src="${loginuser.picture}" alt="User Image">' +
                        '<div class="chat-name">${loginuser.nickName}</div>' +
                    '</div>' +
                '</li>'
            );

            // 發送訊息到服務器
            stompClient.send("/sendMsg", {}, JSON.stringify({
                from: "${loginuser.userId}",
                to: "${user2id}",
                message: msg,
                time: new Date()
            }));

            // 清空訊息輸入框
            document.getElementById('message').value = '';
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
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="container">

		<div class="page-title">
			<div class="row gutters">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
					<h5 class="title">Chat App</h5>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12"></div>
			</div>
		</div>


		<div class="content-wrapper">

			<div class="row gutters  d-flex justify-content-center">
				<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8">
					<div class="card m-0" style="background-color:white;">

						<div class="row no-gutters">
							
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								
								<div class="chat-container">
									<ul class="chat-box chatContainerScroll" id="chatBox">
										<li class="chat-left">
											<div class="chat-avatar">
												<img
													src="${picture2}"
													alt="User Image">
												<div class="chat-name">${nickName2}</div>
											</div>
											<div class="chat-text user-msg" id="userMsg">
												Hello, I'm Russell. <br>How can I help you today?
											</div>
											<div class="chat-hour">
												08:55 <span class="fa fa-check-circle"></span>
											</div>
										</li>
										<li class="chat-right">
											<div class="chat-hour">
												08:56 <span class="fa fa-check-circle"></span>
											</div>
											<div class="chat-text user-msg" style="background-color:#E6F0F2;"id="toMsg">
												Hi, Russell <br> I need more information about
												Developer Plan.
											</div>
											<div class="chat-avatar">
												<img
													src="${loginuser.picture}"
													alt="User Image">

												<div class="chat-name">${loginuser.nickName}</div>
											</div>
										</li>
										</ul>
										<div class="form-group mt-3 mb-0">
											<textarea class="form-control" rows="3"
												placeholder="Type your message here..." id="message"></textarea>
											<button onclick="sendMsg()">發送</button>
										</div>
								</div>
							</div>
						</div>

					</div>
						<div style="height:60px;"></div>
				</div>
			</div>
		</div>

	</div>

	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">

    </script>


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
