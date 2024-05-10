<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>

	<!DOCTYPE html>
	<html>

	<head>


		<meta charset="UTF-8">
		<title>全部文章</title>
		<style>
			.btn.btn-warning.btn-sm {
				/* 背景色設為藍色 */
				color: white;
				/* 文字顏色設為白色 */
			}

			.like-count {
				border: 1px solid black;
				/* 添加1像素寬度的黑色實線框框 */
				padding: 2px 4px;
				/* 可選：添加一些內邊距，使內容與框框之間有一些空間 */
			}

			input[name="reportContent"] {
				float: right;
			}

			.main {
				min-height: 55vh;
				/* 將區域高度設置為整個視窗的高度 */
				padding-top: 100px;
				/* 將內容區域下移以避免 navbar 擋住 */
				background-image: url('/Static/images/FB.jpg');
				/* 背景圖片的 URL */
				background-size: cover;
				/* 以 cover 的方式填滿整個區域 */
				background-position: center center;
				/* 將背景圖片水平和垂直都置中 */
				background-repeat: no-repeat;
				/* 不重複顯示背景圖片 */
			}

			.lt img {
				max-width: 200px;
				/* 設定圖片最大寬度為 800px */
				display: block;
				margin: 0 auto;
				/* 圖片置中 */
			}

			.lt .article {
				width: 100%;
				/* 将文章内容宽度设置为 100% */
				display: flex;
				flex-direction: column;
				align-items: center;
			}

			.article-item {
				width: 100%;
				max-width: 800px;
				/* 设置最大宽度 */
				border: 1px solid #ddd;
				border-radius: 8px;
				padding: 16px;
				margin-bottom: 16px;
				display: flex;
				flex-direction: column;
				background-color: #f9f9f9;
				/* 設置背景顏色 */
			}

			.article-content {
				margin-top: 16px;
				/* 调整内容顶部间距 */
			}

			.btn.btn-info {
				color: white;
				/* 设置按钮文字颜色为白色 */
			}

			.article-info {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-bottom: 8px;
			}

			.article-info p {
				margin: 0;
			}

			.article-info hr,
			.article-content hr,
			.article-actions hr {
				border: none;
				border-bottom: 1px solid #ddd;
				margin: 8px 0;
			}

			.add-form {
				text-align: center;
				/* 將內容置中 */
				margin-top: 25px;
				/* 調整上方間距 */
			}

			.article-actions {
				display: flex;
				justify-content: flex-start;
				align-items: center;
			}

			.article-actions button {
				border: none;
				background-color: transparent;
				cursor: pointer;
				transition: color 0.3s ease-in-out;
				/* 添加按鈕顏色變化的動畫效果 */
			}

			.article-actions button:hover {
				color: #007bff;
				/* 淺藍色 */
			}

			.article-actions button {
				margin-right: 5px;
				/* 添加右边距，分隔按钮 */
				border: none;
				background-color: transparent;
				cursor: pointer;
				transition: color 0.3s ease-in-out;
				/* 添加按钮颜色变化的动画效果 */
			}

			.youtube-video {
				margin-right: 1000px;
				/* 可以根據需要調整右邊距 */
			}

			/* 讚數樣式 */
			.saveLike {
				margin-left: 10px;
				font-weight: bold;
				color: #007bff;
			}
		</style>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

		<!--Google Font : Nunito-->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="" rel="stylesheet">


		<!-- For style(All CSS content) -->
		<link rel="stylesheet" type="text/css" href="../styles/home.css" />
		<link rel="stylesheet" type="text/css" href="../styles/footer.css" />
		<link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
		<link rel="icon" href="images/favicon.ico">

		<!-- JS Bundle for BS  -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
			</script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="https://kit.fontawesome.com/f5d8105b16.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<div class="container-fluid" style="margin-top: 50px;"></div>


		<!-- 主內容 -->

		<div class="main">
			<div class="back-content"></div>
			<div class="add-form">

				<form method="Get" action="/html/LTInsertFront.html">
					<button class="btn btn-info btn-sm add" type="submit">發布文章</button>
				</form>
			</div>


			<div style="float: right;">
				<form method="get" action="/findtitleFront">
					<input type="text" name="title" placeholder="輸入關鍵字" />
					<button class="btn btn-info btn-sm title" type="submit">關鍵字搜尋</button>
				</form>
			</div>
			<div class="lt">
				<div style="text-align: right; margin-top: -3%">
					<form method="Get" action="html/LTSelectFront.html">
						<button class="btn btn-info btn-sm select" type="submit">搜尋文章ID</button>
					</form>
				</div>
				<!--放洞悉-->
				<div id="LT"></div>

				<div class="youtube-video">
					<iframe width="350" height="350"
						src="https://www.youtube.com/embed/FWCIocUWpFw?si=kWqi-GvBApZNLfsy?mute=1&autoplay=1"
						style="position: fixed;" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>

				</div>

				<div></div>
			</div>


		</div>

		</div>
		</div>

		<script>

			function handleReportSuccess() {
				alert("檢舉成功！謝謝你的檢舉,我們將盡快處理❗❗");
			}
		</script>
		<script>
			fetch('html/basic.html')
				.then(response => response.text())
				.then(html => {
					document.body.innerHTML += html;
				});
		</script>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
			</script>


		<!-- 分页控件 -->
		<div class="container">
			<div class="row">
				<div class="col-auto">
					<div class="d-flex flex-column align-items-end">
						<div class="pagination-info m-2">
							<span id="paginationInfo"></span>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group">
							<input type="number" id="pageNumberInput" class="form-control" placeholder="跳轉頁碼"
								style="width: 120px;">
							<div class="input-group-append">
								<button id="goToPageBtn" class="btn btn-muted m-1">跳轉</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-7"></div>
				<!-- 空白的 col-auto -->
				<div class="col-auto ml-auto">
					<!-- 要置右邊的 col-auto -->
					<div class="pagination-container">
						<ul class="pagination justify-content-end m-3">
							<li class="page-item" id="firstPage"><a class="page-link" href="#">«</a></li>
							<li class="page-item" id="prevPage"><a class="page-link" href="#">‹</a></li>
							<li class="page-item" id="TTTTT"><a class="page-link" href="#">›</a></li>
							<li class="page-item" id="lastPage"><a class="page-link" href="#">»</a></li>
							<li class="page-item" id="niMa"><a class="page-link" href="#">我肏你媽</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- CMD -->
		<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
		<script>
			$(document).ready(function () {
				var pageSize = 5; // 顯示的筆數
				var currentPage = 0; // 目前頁碼

				// 发送 AJAX 请求
				function fetchOrders(page) {
					console.log('page' + page);
					$.ajax({
						url: 'pageALL',
						type: 'GET',
						dataType: 'json',
						data: { page: page, size: pageSize }, // 分頁參數
						success: function (response) { // 請求成功時執行的function
							// 清空表格内容
							$('#LT').empty();
							// 遍歷返回的數據並將每一行添加到表格中
							$.each(response.content, function (
								index, content) {
								var row = '<div>'
									+ content.ltId + '</div>'
									+ '<div>' + content.title
									+ '</div>' + '<div>'
									+ content.oriAmount + '</div>'
									+ '<div>' + content.userId
									+ '</div>' + '<div>'
									+ content.date
									+ '</div>' + '<div>'
									+ content.content
									+ '</div>' + '<div>'
									+ content.saveLike + '</div>'
									+ '</div>' + ' <div id=class="article col-12 col-md-8" >' +


									'<form method="post" action="/ReportinsertFront.controller" onsubmit="handleReportSuccess()">' +
									`<input type="hidden" name="ltId" value="` + content.ltId + `">` +
									`<input type="text" name="reportContent" placeholder="请输入檢舉內容">` +
									`<button class="btn btn-warning btn-sm" type="submit">
															<i class="fa-solid fa-triangle-exclamation" style="color: red"></i>
														</button>` +
									`</form>` +
									`<form method="Get" action="/LTSelectByIdFront.controller/` + content.ltId + `">` +
									`<button class="btn btn-primary btn-sm" type="submit"
															style="background-color: blue">修改</button>` +
									`</form>` +

									`<form method="post" action="/LTDeleteByIdFront.controller?ltId=` + content.ltId + `">` +
									`<input type="hidden" name="_method" value="DELETE">` +
									`<button class="btn btn-danger btn-sm delete" type="submit" style="background-color: blue"
																required>刪除</button>` +
									`</form>` +
									`<form method="get" action="/findLTIDFront/` + content.ltId + `">` +
									`<button class="btn btn-info btn-sm REPLY" type="submit"
															style="background-color: blue">回復區</button>` +
									`</form>` +
									`<form method="POST" action="/LikeinsertFront.controller">` +
									`<input type="hidden" name="userId" value="` + content.userId + `">` +
									`<input type="hidden" name="ltId" value="` + content.ltId + `">` +
									`<button class="btn btn-success btn-sm like " type="submit" style="background-color: blue">
																	<i class="fa-solid fa-thumbs-up"></i>
																</button>`+

									`<span class="like-count">` + content.saveLike + `</span>` +

									`</form>` +
									`</div>` + '</br>';
								$('#LT').append(row);
							});

							// 更新分頁狀態
							updatePagination(response);
						},
						error: function (xhr, status, error) { // 请求失敗時執行的function
							console.error(error);
						}
					});
				}

				// 更新分頁狀態和顯示信息
				function updatePagination(response) {
					var totalPages = response.totalPages;
					var totalElements = response.totalElements;
					var currentPageNumber = response.number + 1;

					// 更新分頁信息顯示
					$('#paginationInfo').text('Total Records: ' + totalElements + ', Page: ' + currentPageNumber + ' / ' + totalPages);

					// 更新分頁按鈕狀態
					if (response.first) {
						$('#firstPage, #prevPage').addClass('disabled');
					} else {
						$('#firstPage, #prevPage').removeClass('disabled');
					}
					if (response.last) {
						$('#lastPage, #nextPage').addClass('disabled');
					} else {
						$('#lastPage, #nextPage').removeClass('disabled');
					}

					// 更新页码按钮
					updatePageButtons(currentPageNumber, totalPages);

					// 加載當前頁上下兩筆資料
					loadAdjacentOrders(response.number, response.content);
				}

				// 襙你媽典及事件niMa
				$('#niMa').click(function () {
					alert('我肏你媽');
				});

				// 上一頁按鈕點擊事件
				$('#prevPage').click(function () {
					if (!$(this).hasClass('disabled')) {
						currentPage--;
						fetchOrders(currentPage);
					}
				});

				// 下一頁按鈕點擊事件
				$('#TTTTT').click(function () {
					console.log('currentPage1:' + currentPage);
					if (!$(this).hasClass('disabled')) {
						currentPage++;
						console.log('currentPage2:' + currentPage);
						fetchOrders(currentPage);
					}
				});

				// 第一頁按鈕點擊事件
				$('#firstPage').click(function () {
					if (!$(this).hasClass('disabled')) {
						currentPage = 0;
						fetchOrders(currentPage);
					}
				});

				// 最后一頁按鈕點擊事件
				$('#lastPage').click(function () {
					if (!$(this).hasClass('disabled')) {
						var totalPages = parseInt($('#paginationInfo').text().split('/')[1].trim());
						currentPage = totalPages - 1;
						fetchOrders(currentPage);
					}
				});

				// 更新页码按钮
				function updatePageButtons(currentPageNumber, totalPages) {
					// 更新页码按钮的显示内容
					$('#page1 a').text(currentPageNumber > 1 ? currentPageNumber - 1 : 1);
					$('#page2 a').text(currentPageNumber);
					$('#page3 a').text(currentPageNumber < totalPages ? currentPageNumber + 1 : totalPages);

					// 根据需要添加或删除页码按钮
					if (currentPageNumber === 1) {
						$('#page1').hide();
					} else {
						$('#page1').show();
					}

					if (currentPageNumber === totalPages || totalPages === 0) {
						$('#page3').hide();
					} else {
						$('#page3').show();
					}
				}

				// 新增的页码按钮点击事件
				$('.pagination-container').on('click', '#page1, #page2, #page3', function () {
					var page = parseInt($(this).text()) - 1;
					fetchOrders(page);

					// 更新当前页码
					currentPage = page;
				});

				$('#goToPageBtn').click(function () {
					var pageNumber = parseInt($('#pageNumberInput').val());
					var totalPages = parseInt($('#paginationInfo').text().split('/')[1].trim());

					// 检查输入的页码是否合法
					if (pageNumber >= 1 && pageNumber <= totalPages) {
						var page = pageNumber - 1;
						fetchOrders(page);
						currentPage = page;

						// 移除所有页面项上的 active 类
						$('.pagination-container .page-item').removeClass('active');

						// 添加 active 类到指定的页面项
						$('#page' + pageNumber).addClass('active');
					} else {
						// 提示用户输入的页码无效
						alert('Invalid page number! Please enter a number between 1 and ' + totalPages);
					}
				});

				// 初始化頁面 獲得第0頁的數據
				fetchOrders(currentPage);
			});



		</script>




		<!-- 分頁部分 -->



	</body>

	</html>