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
}
</style>
<link href="/front/match/matchcss/bootstrap.css" rel="stylesheet" />
<link href="/front/match/matchcss/rotating-card.css" rel="stylesheet" />
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet" />


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
<title>範本</title>
</head>

<body>


	<div class="container-fluid" style="margin-top: 150px;">
		<h2 class="text-center">標題</h2>
	</div>
	<!-- <section> -->
	<div class="main">
		<div class="card-container">
			<div class="card">
				<div class="front">
					<div class="cover">
						<img src="images/rotating_card_thumb3.png" />
					</div>
					<div class="user">
						<img class="img-circle" src="images/rotating_card_profile.png" />
					</div>
					<div class="content">
						<div class="main">
							<h3 class="name">Inna Corman</h3>
							<p class="profession">Product Manager</p>

							<p class="text-center">"I'm the new Sinatra, and since I made
								it here I can make it anywhere, yeah, they love me everywhere"</p>
						</div>
						<div class="footer">
							<div class="rating">
								<i class="fa fa-mail-forward"></i> Auto Rotation
							</div>
						</div>
					</div>
				</div>
				<!-- end front panel -->
				<div class="back">
					<div class="header">
						<h5 class="motto">"To be or not to be, this is my awesome
							motto!"</h5>
					</div>
					<div class="content">
						<div class="main">
							<h4 class="text-center">Job Description</h4>
							<p class="text-center">Web design, Adobe Photoshop, HTML5,
								CSS3, Corel and many others...</p>

							<div class="stats-container">
								<div class="stats">
									<h4>235</h4>
									<p>Followers</p>
								</div>
								<div class="stats">
									<h4>114</h4>
									<p>Following</p>
								</div>
								<div class="stats">
									<h4>35</h4>
									<p>Projects</p>
								</div>
							</div>

						</div>
					</div>
					<div class="footer">
						<div class="social-links text-center">
							<a href="https://creative-tim.com" class="facebook"><i
								class="fa fa-facebook fa-fw"></i></a> <a
								href="https://creative-tim.com" class="google"><i
								class="fa fa-google-plus fa-fw"></i></a> <a
								href="https://creative-tim.com" class="twitter"><i
								class="fa fa-twitter fa-fw"></i></a>
						</div>
					</div>
				</div>
				<!-- end back panel -->
			</div>
			<!-- end card -->
		</div>
		<!-- end card-container -->






	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
            </script>
	<script>
      
        fetch('html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });

        
    </script>

</body>

</html>