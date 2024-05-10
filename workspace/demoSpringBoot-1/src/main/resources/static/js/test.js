$(document).ready(function () {
				var pageSize = 5; // 顯示的筆數
				var currentPage = 0; // 目前頁碼

				// 发送 AJAX 请求
				function fetchOrders(page) {
					console.log('page' + page);
					$.ajax({
						url: '/pageALL',
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

