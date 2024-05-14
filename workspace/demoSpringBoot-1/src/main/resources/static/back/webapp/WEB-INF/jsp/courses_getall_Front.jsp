<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<!-- Required meta tags -->
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">

			<!-- Bootstrap CSS -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
				crossorigin="anonymous">
			<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
			<!-- Favicon-->
			<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
			<!--Google Font : Nunito-->
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">
			<!-- Font Awesome icons (free version)-->
			<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
			<!-- For style(All CSS content) -->
			<link rel="stylesheet" type="text/css" href="../styles/home.css" />
			<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
			<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
			<link rel="icon" href="images/favicon.ico">
			<link href="../Course_All/css/styles.css" rel="stylesheet" />

			<!-- JS Bundle for BS  -->
			<script src="https://code.jquery.com/jquery-3.7.1.js"
				integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
				integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
				crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
				integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
				crossorigin="anonymous"></script>
			<style>
				.course-image {
					max-width: 88px;
					/* Set the maximum width */
					max-height: 88px;
					/* Set the maximum height */
					/* Add other styles as needed */
				}

				lt-container {
					overflow: auto;
					/* 清除浮動 */
				}

				/*
.lt {
	position: absolute;
	left: 580px;
	float: center;
	width: 50%;
}*/

				.lt-table {
					width: 100%;
					border-collapse: collapse;
				}

				.lt th,
				.lt td {
					text-align: center;
					padding: 8px;
					border: 1px solid #ddd;
				}

				.lt th {
					background-color: #d8dbd9;
					padding: 3px;

				}

				input,
				button {
					/* Apply styles to both input and button elements */
					border: 0;
					background-color: #4f85a6;
					color: #fff;
					border-radius: 10px;
					padding: 8px 16px;
					/* Adjust padding to your liking */
					cursor: pointer;
					/* Makes it clear that the element is clickable */
				}

				input:hover,
				button:hover a {
					text-decoration: none;
					/* Removes underline from links */
				}

				.table {
					padding: 3px;

				}

				.separator {
					width: 1px;
					/* 寬度為 1px */
					height: 22px;

					background-color: #808080;
					/* 線的顏色 */
					margin: 0 10px;
					/* 可以調整線的左右間距 */
				}

				/* 默认高度 */
				.hotclass {
					border-radius: 30px;

				}

				.smallbox {
					border-radius: 12px;

				}

				/* Media query for screens smaller than 576px */
				@media (max-width: 576px) {}

				/* Media query for screens smaller than 768px */
				@media (max-width: 767px) {}

				.card {
					width: 100%;
				}

				/* Media query for 1024px wide screens */
				@media (min-width: 1024px) {

					.hot {
						width: 572px;
						height: 319px;
					}
				}

				/* Media query for 1440px wide screens */
				@media (min-width: 1440px) {
					.hot {
						width: 600px;
						height: 336px;
					}


				}
			</style>
		</head>

		<body>

			<!-- Shashank's Section -->
			<!-- <section class="title"> -->
			<!-- Navbar section -->
			<nav class="header navbar navbar-expand-lg navbar-dark">
				<!-- <LOGO> -->
				<div width="50px" height="50px">

					<a class="" href="index.html"> <img src="../images/LOGO.png" width="50px" height="50px"
							alt="Eternals"> </a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#titleNav"
						aria-controls="titleNav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

				</div>

				<!-- <Content> -->

				<div class="container-fluid d-flex justify-content-center" id="titleNav">
					<ul class="navbar-nav ">
						<li class="nav-item">
							<a class="nav-link active" href="frontPage.html">Home </a>
						</li>
						<li>
							<a class="nav-link" href="EventAll.html">活動Events</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="about.html">配對</a>
						</li>
						<li class="nav-item">
							<a class="nav-link " href="teams.html">商城</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">互動區</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="contact.html">課程</a>
						</li>
					</ul>
				</div>
				<!-- <右上角的東西> -->
				<div class="navbar-nav justify-content-end">
					<ul class="navbar-nav">
						<li class="nav-item">
							<div class="m-2 rounded-circle overflow-hidden align-self-center ratio ratio-1x1"
								style="width: 40px">
								<img src="../images/LOVE.png" alt="" class="object-fit-cover w-100 h-100" />
							</div>
						</li>
						<li class="nav-item">
							<div class="m-2 rounded-circle overflow-hidden align-self-center ratio ratio-1x1"
								style="width: 40px">
								<img src="../images/SHOP.png" alt="" class="object-fit-cover w-100 h-100" />
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle z-1000" href="#" id="navbarDropdown" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
								Dropdown
							</a>
							<ul class="dropdown-menu z-1000" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item z-1000" href="#">Action</a></li>
								<li><a class="dropdown-item z-1000" href="#">Another action</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item z-1000" href="#">Something else here</a></li>
							</ul>
						</li>

					</ul>

				</div>
				<!-- <Between> -->

			</nav>


			<!-- 課程 -->
			<div style="height: 214px">
				<div class="box row py-lg-5 text-center vstack border border-dark" style="height: 211px">
					<div class="col-lg-6 col-md-8 mx-auto d-flex flex-column justify-content-center h-100">
						<h1 class="fw-bold custom-font-size mb-0" style="font-size: 64px; color: #4f85a6;">課程</h1>


					</div>
				</div>
			</div>



			<!-- 精選課程 -->
			<div class="container">
				<div class="d-flex">
					<h2 class="section-heading text-uppercase">熱門課程</h2>
					<div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
					<h6 class="d-flex align-items-center">一段美好的開始</h3>
				</div>

				<div class="d-flex text-center" style="width: 1900px;height:  400px;">

					<div class="active ratio" style="width: 600px;">
						<!-- img 放入 COURSE_IMAGE '/images/Courses_class4.jpg'讓圖片可以導入-->
						<td>${course.productId}</td>

						<img src="${course.courseImage}" class="d-block object-fit-cover rounded-5 mx-auto my-auto"
							style="width: auto; height: auto; max-width: 100%; max-height: 100%;" alt="..." />
					</div>

				</div>
				<!-- 各種索引搜尋 -->

				<div class="d-flex container" style="height:30px;">
					<div class="smallbox border border-dark" style="width: 60px;height:30px;">
						<h5 class="text-center m-1">日期</h5>
					</div>
					<div class="smallbox border border-dark" style="width: 82px;height:30px;">
						<h5 class="text-center m-1">初學者課</h5>
					</div>
					<div class="smallbox border border-dark" style="width: 150px;height:30px;">
						<h5 class="text-center m-1">更多篩選條件</h5>
					</div>

					<div class="smallbox border border-dark" style="width: 150px;height:30px;">
						<h5 class="text-center m-1">最受好評課程</h5>
					</div>

					<div class="smallbox border border-dark" style="width: 82px;height:30px;">
						<h5 class="text-center m-1">高級課程</h5>
					</div>

				</div>

				<div class="container mb-1">
					<div class="d-flex">
						<h2 class="section-heading text-uppercase">專業師資</h2>
						<div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
						<h6 class="d-flex align-items-center">看看學員們怎麼說</h3>
					</div>
				</div>
				    <!-- 直視圖片區 -->

				    <div class="row d-flex">

					      <div class="col-md-3">
						        <div class="product-item rounded-3 bs-secondary-color "
							style="background-color:#F5F7F9">
							          <div class="product-thumb">
								            <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
									src="../images/dancer1.jpg" alt="product-img">
								            <div class="preview-meta">

									            </div>
								          </div>
							          <div class="product-content m-3">
								            <p>
									              帶來如詩如畫的舞蹈饗宴。
									            </p>
								            <h4><a class="text-reset" href="">李舞妍</a></h4>
								          </div>
							        </div>
						      </div>
					      <div class="col-md-3">
						        <div class="product-item rounded-3 bs-secondary-color "
							style="background-color:#F5F7F9">
							          <div class="product-thumb">
								            <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
									src="../images/dancer1.jpg" alt="product-img">
								            <div class="preview-meta">

									            </div>
								          </div>
							          <div class="product-content m-3">
								            <p>
									              讓每個人都感受到舞蹈的力量。
									            </p>
								            <h4><a class="text-reset" href="">張舞風</a></h4>
								          </div>
							        </div>
						      </div>
					      <div class="col-md-3">
						        <div class="product-item rounded-3 bs-secondary-color "
							style="background-color:#F5F7F9">
							          <div class="product-thumb">
								            <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
									src="../images/dancer1.jpg" alt="product-img">
								            <div class="preview-meta">

									            </div>
								          </div>
							          <div class="product-content m-3">
								            <p>
									              如飄逸的雲彩般，輕盈而自由地穿越舞台。
									            </p>
								            <h4><a class="text-reset" href="">王舞雲</a></h4>
								          </div>
							        </div>
						      </div>
					      <div class="col-md-3">
						        <div class="product-item rounded-3 bs-secondary-color "
							style="background-color:#F5F7F9">
							          <div class="product-thumb">
								            <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
									src="../images/dancer1.jpg" alt="product-img">
								            <div class="preview-meta">

									            </div>
								          </div>
							          <div class="product-content m-3">
								            <p>
									              韻律的大師，她熟練掌握著每一個節奏。
									            </p>
								            <h4><a class="text-reset" href="">陳舞韻</a></h4>
								          </div>
							        </div>
						      </div>
					    </div>


				<!--課程等級-->
				<section class="page-section rounded-3" id="portfolio">
					<div class="container">
						<div class="d-flex">

							<h2 class="section-heading text-uppercase">難度分級</h2>
							<div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
							<h6 class="d-flex align-items-center">為每一個學員量身訂做</h3>
						</div>
						<div class="row">
							<div class="col-4 col-lg-4 col-sm-6 mb-4">
								<!-- Portfolio item 1-->
								<div class="portfolio-item">
									<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
										<div class="portfolio-hover">
											<div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i>
											</div>
										</div>
										<c:forEach items="${Courses}" var="course">

											<img class="img-fluid" src="${course.courseImage}" alt="..." />
									</a>
									<div class="portfolio-caption">
										<!-- 放入 -->
										<h6>${course.productId}</h6>
										<h4>
											${course.courseName}
										</h4>
										<!-- 放入-->

										<h6>
											${course.description}
										</h6>
									</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
				</section>


			</div>
			<div class="container-fluid w-100 h-100 g-0" style="width: 358px;">
				<footer class="below">


					<div class="container">
						<div class="row">
							<div class="col-lg-6">
								<p class="left">Follow us on social media to get the latest updates</p>
								<a href="#"><i class="fab fa-youtube"></i></a>
								<a href="#"><i class="fab fa-facebook-square"></i></a>
								<a href="#"><i class="fab fa-instagram"></i></a>

							</div>
							<div class="col-lg-6">

								<p class="right">Enter your email to view the list of your registered events</p>
								<input id="mail" placeholder="email address">
								<span><button id="bttn">
										Submit </button></span>


							</div>
						</div>
						<hr style="margin-top: 50px;">
					</div>
					<div class="last">&copy;Copyright 2024搖擺工坊 All Rights Reserved.</div>
					<p class="float-end mb-1">
						<a href="#" class="text-decoration-none">Back to top</a>
					</p>
				</footer>
			</div>





			<!-- Optional JavaScript; choose one of the two! -->

			<!-- Option 1: Bootstrap Bundle with Popper -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
				crossorigin="anonymous"></script>

			<!-- Option 2: Separate Popper and Bootstrap JS -->
			<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->

		</body>

		</html>