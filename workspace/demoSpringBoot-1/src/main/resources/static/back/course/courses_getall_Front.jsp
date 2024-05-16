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
				.main {
					min-height: 55vh;
				}

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
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
				crossorigin="anonymous">
			<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

			<!--Google Font : Nunito-->
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

			<!-- For style(All CSS content) -->
			<link rel="stylesheet" type="text/css" href="../styles/home.css" />
			<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
			<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
			<link rel="icon" href="images/favicon.ico">


		</head>

		<body>




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
						<div class="product-item rounded-3 bs-secondary-color " style="background-color:#F5F7F9">
							<div class="product-thumb">
								<img class="z-1 object-fit-cover w-100 h-100 img-responsive" src="../images/dancer1.jpg"
									alt="product-img">
								<div class="preview-meta">

								</div>
							</div>
							<div class="product-content m-3">
								<p>
									${course.teacherContact}
								</p>
								<!-- <td>${course.teacherName}</td> -->
								<td>${course.productId}</td>

								<h4><a class="text-reset" href="">${course.teacherName}</a></h4>
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
							<h6 class="d-flex align-items-center">為每一個學員量身訂做</h6>
						</div>
						<!-- 循環開始前，確保結構正確並且只包裹一次 -->
						<div class="row">
							<c:forEach items="${Courses}" var="course">
								<div class="col-4 col-lg-4 col-sm-6 mb-4">
									<div class="portfolio-item">
										<!-- 隱藏起來 -->
										<div class="z-n1 d-none">
											<h6>${course.productId}</h6>
										</div>
										<a class="portfolio-link"
											href="${pageContext.request.contextPath}/courseDetailsFront/${course.productId}">
											<div class="portfolio-hover">
												<div class="portfolio-hover-content">
													<i class="fas fa-plus fa-3x"></i>
												</div>
											</div>
											<img class="img-fluid" src="${course.courseImage}" alt="..." />
										</a>
										<div class="portfolio-caption">
											<h4>${course.courseName}</h4>
											<h6>${course.description}</h6>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</section>


			</div>





			<!-- Optional JavaScript; choose one of the two! -->
			<script>

				fetch('html/basic.html')
					.then(response => response.text())
					.then(html => {
						document.body.innerHTML += html;
					});
			</script>

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