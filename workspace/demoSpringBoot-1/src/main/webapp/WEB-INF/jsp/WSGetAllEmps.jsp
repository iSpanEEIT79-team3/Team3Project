<%@page import="java.time.format.DateTimeFormatter" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.mmmooonnn.model.Event"
		isErrorPage="true" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%!@SuppressWarnings("unchecked")%>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>活動資訊</title>

						<!-- Main CSS-->
						<link rel="stylesheet" type="text/css" href="../../back/css/main.css">
						<!-- Font-icon css-->
						<link rel="stylesheet" type="text/css"
							href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

						<link href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.10.8/dist/sweetalert2.min.css
" rel="stylesheet">

						<script>
							function upload() {
								// 取得表單元素
								var form = document.getElementById('myForm');



								// 所有欄位都已填滿，執行表單提交
								var formData = new FormData(form);
								fetch('/WSinsert', {
									method: 'POST',
									body: formData
								})
									.then(function (response) {
										if (response.status != 200) {
											console.log('response status1:' + response.status);
											return;
										}
										console.log('response status2:' + response.status);
										window.location.href = "/WSall";
									});
							}

						</script>

						<style>
							td {
								text-align: middle;
								padding: 5px 10px;
								/* 上下各 10px，左右各 20px 的内边距 */
								max-height: 3em;
								overflow: hidden;
								white-space: pre-line;
								/* white-space: nowrap; */
								text-overflow: ellipsis;
							}

							img {
								max-width: 100px;
								/* 最大寬度 */
								max-height: 100px;
								/* 最大高度 */
								width: auto;
								/* 自動調整寬度 */
								height: auto;
								/* 自動調整高度 */
							}

							footer {
								height: 60px;
							}

							tr {
								background-color: #ffffff;
							}

							table {
								width: 100%;
								border-collapse: collapse;
								/* max-height: 3em;
								max-width: 3em; */
								/* table-layout: fixed */
							}
						</style>
					</head>

					<body style='background-color: #fdf5e6'>

						<main class="app-content">
							<div class="app-title">
								<div>
									<h1>
										<i class="fa fa-th-list"></i> 活動資訊
									</h1>
									<br>
									<div class="row justify-content-start">
										<div class="col-auto">
											<form method="get" action="/WSSearchByDate" enctype="multipart/form-data">
												活動開始時間 : <input type="date" id="startTime" name="startTime" />
												<button type="submit" class="btn btn-primary">查詢</button>
											</form>
										</div>
										<!--------------------------------- 新增活動modal ---------------------------------->

										<div class="col-auto">
											<button type="button" class="btn btn-primary" data-toggle="modal"
												data-target="#staticBackdrop">
												新增活動
											</button>
										</div>
									</div>
								</div>
							</div>


							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
								tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">新增活動 (請輸入資料)</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form method="post" action="/WSinsert" id="myForm"
												enctype="multipart/form-data">

												輸入活動名稱 : <input type="text" id="EVENT_NAME" name="EVENT_NAME" /><br>
												<br> 報名開始日期 : <input type="datetime-local" id="SIGNUP_STARTIME"
													name="SIGNUP_STARTIME" /><br>
												<br> 報名結束日期 : <input type="datetime-local" id="SIGNUP_ENDTIME"
													name="SIGNUP_ENDTIME" /><br>
												<br> 活動開始時間 : <input type="datetime-local" id="EVENT_STARTIME"
													name="EVENT_STARTIME" /><br>
												<br> 活動結束時間 : <input type="datetime-local" id="EVENT_ENDTIME"
													name="EVENT_ENDTIME" /><br>
												<br>


												<!-- 		活動詳細資料 : <input type="text" id="EVENT_DETAIL" name="EVENT_DETAIL" /><br><br> -->

												<div style="width: 97.7%;">
													<label for="" class="col-form-label">活動詳細資料 :</label>
													<textarea class="form-control" id="EVENT_DETAIL" name="EVENT_DETAIL"
														placeholder="請輸入資訊" style="height: 300px"></textarea>
												</div><br>
												<br>

												活動種類 : <input type="text" class="form-control" id="EVENT_CATEGORY"
													name="EVENT_CATEGORY" /><br>
												<br> 報名金額 : <input type="text" class="form-control" id="EVENT_PRICE"
													name="EVENT_PRICE" /><br>
												<br> 活動地址 : <input type="text" class="form-control" id="EVENT_ADDRES"
													name="EVENT_ADDRES" /><br>
												<br> 組織者 : <input type="text" class="form-control" id="ORGANIZER"
													name="ORGANIZER" /><br>
												<br>
												<div style="width: 600px; float: left;">
													<p>活動照片:</p>
													<div>
														<img id="imgPreview" src="${eventBean.picture}"
															style="max-width: 200px; max-height: 200px; display: none" />
														<input type="file" id="PICTURE" name="PICTURE"></input>
													</div>
												</div>
												<!-- 												<br> 圖片 : <input type="file" id="PICTURE" name="PICTURE" /><br> -->
												<br>

												<div class="modal-footer">
													<button type="submit" class="btn btn-primary"
														onclick="upload()">確定</button>
													<button type="reset" class="btn btn-primary">清除</button>
													<button type="button" id="fillData"
														class="fastfilldata-data-btn btn btn-primary">一鍵輸入</button>
												</div>

												<!-- 		<button type="reset" class="my-reset-data-btn btn btn-outline-primary">清除</button> -->
												<!-- 		<button type="button" id="fillData" class="fastfilldata btn btn-outline-primary">一鍵輸入</button> -->
												<!-- 		<button type="button" onclick="upload()">確定</button> -->


											</form>
										</div>

									</div>
								</div>
							</div>
							<!--------------------------------- 以上新增活動modal ---------------------------------->

							</div>
							<ul class="app-breadcrumb breadcrumb side">
								<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
								<li class="breadcrumb-item">Tables</li>
								<li class="breadcrumb-item active"><a href="#">Data Table</a></li>
							</ul>
							</div>


							<div class="row">
								<div class="col-md-12">
									<div class="tile">
										<div class="tile-body">
											<table class="table table-hover table-bordered" id="sampleTable">
												<thead>
													<tr style="background-color: #bedfbd">
														<th>活動編號
														<th>活動名稱
														<th>報名開始日期
														<th>報名結束日期
														<th>活動開始時間
														<th>活動結束時間
														<th>活動詳細資料
														<th>活動種類
														<th>報名金額
														<th>活動地址
														<th>組織者
														<th>圖片
														<th>Update
														<th>Delete</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${eventBeans}" var="evBean">
														<tr>
															<td>${evBean.eventId}</td>
															<td>${evBean.eventName}</td>
															<td>
																<fmt:formatDate value="${evBean.signupStartime}"
																	pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td>
																<fmt:formatDate value="${evBean.signupEndtime}"
																	pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td>
																<fmt:formatDate value="${evBean.startTime}"
																	pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td>
																<fmt:formatDate value="${evBean.endTime}"
																	pattern="yyyy-MM-dd HH:mm" />
															</td>

															<td style="width: 400px;">${evBean.eventDetail}</td>
															<td>${evBean.eventCategory}</td>
															<td>${evBean.eventPrice}</td>
															<td>${evBean.eventLocation}</td>
															<td>${evBean.organizer}</td>
															<td><img src="${evBean.picture}"></td>

															<td class="align-middle">
																<form action="Getupdate/${evBean.eventId}"
																	method="post">
																	<input type="hidden" name="_method" value="put">
																	<button type="submit" class="update">更新</button>
																</form>
															</td>

															<td class="align-middle">
																<form
																	action="${pageContext.request.contextPath}/Event?PRODUCTID=${evBean.eventId}"
																	method="post">
																	<input type="hidden" name="_method" value="delete">
																	<button onclick="confirmDelete()" type="submit"
																		class="delete align-middle">刪除</button>
																</form>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>


							</table>


							<a href="WSall"><input class="btn btn-primary" type="submit" value="查詢所有資料"></a>

							<!-- 	<form action="WSall" method="get"><input type="submit" value="查詢所有資料"></form> -->
							</div>
							<footer></footer>
							</div>
							<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
							<script src="https://cdn.datatables.net/v/dt/dt-2.0.1/datatables.min.js"></script>
							<script>
								$("#PICTURE").change(function () {
									readURL(this);
								})

								function readURL(input) {
									if (input.files && input.files[0]) {
										var reader = new FileReader();
										reader.onload = function (e) {
											$("#imgPreview").attr('src', e.target.result).css({ "display": "block" });
										}
										reader.readAsDataURL(input.files[0]);
									}
								}

							</script>

							<script>

								//<!--  新增資料: 一鍵輸入 -->


								const btnFilldata = document.querySelector(".fastfilldata-data-btn");

								document.getElementById("fillData").addEventListener("click", fillData);

								function fillData() {

									document.getElementById("EVENT_NAME").value = "SwingFever搖擺舞派對";
									document.getElementById("SIGNUP_STARTIME").value = "2024-05-01T09:18";
									document.getElementById("SIGNUP_ENDTIME").value = "2024-05-16T00:00";
									document.getElementById("EVENT_STARTIME").value = "2024-05-24T09:18";
									document.getElementById("EVENT_ENDTIME").value = "2024-05-26T00:00";
									document.getElementById("EVENT_DETAIL").value = "歡迎加入我們舉辦的 Swing Fever 搖擺舞派對！這是一個讓您盡情跳躍、歡笑和享受音樂的絕佳機會。我們將在 City Dance Studio 舉辦這個活動，活動期間將會有專業的搖擺舞老師為您帶來精彩的教學課程，同時也會有DJ為大家播放熱情歡快的 Swing 音樂。無論您是初學者還是搖擺舞高手，這都是一個與朋友們一起跳舞、放鬆身心的絕佳之夜。不要錯過這個難得的機會，穿上您的最佳舞鞋，加入我們一起搖擺吧！";
									document.getElementById("EVENT_CATEGORY").value = "BALBOA";
									document.getElementById("EVENT_PRICE").value = "500";
									document.getElementById("EVENT_ADDRES").value = "Big Apple studio 復興教室";
									document.getElementById("ORGANIZER").value = "Big Apple";

								}


							</script>

							<script src="
		https://cdn.jsdelivr.net/npm/sweetalert2@11.10.8/dist/sweetalert2.all.min.js
		"></script>
							<script>
								$(document).ready(function () {
									function confirmDelete() {
										// 使用 SweetAlert 提示框顯示刪除確認訊息
										swal.fire({
											title: "確定要刪除嗎？",
											text: "刪除後將無法復原！",
											icon: "warning",
											buttons: true,
											showCancelButton: true,
											dangerMode: true,
										})
											.then((result) => {
												if (result.isConfirmed) {
													// 使用者點擊確定按鈕後執行刪除動作
													// 在這裡加入刪除動作的程式碼
													$("form").submit();
													swal.fire("已成功刪除！", {
														icon: "success",
													});
												} else {
													// 使用者點擊取消按鈕
													swal.fire("已取消刪除。");
												}
											});
									}

									// 綁定刪除按鈕的點擊事件
									$(".delete").click(function () {
										event.preventDefault();
										confirmDelete();
									});
								});
							</script>


							<!-- Essential javascripts for application to work-->
							<script src="../../back/js/jquery-3.2.1.min.js"></script>
							<script src="../../back/js/popper.min.js"></script>
							<script src="../../back/js/bootstrap.min.js"></script>
							<script src="../../back/js/main.js"></script>
							<!-- The javascript plugin to display page loading on top-->
							<script src="../../back/js/plugins/pace.min.js"></script>
							<!-- Page specific javascripts-->
							<script type="text/javascript" src="../../back/js/plugins/chart.js"></script>
							<script type="text/javascript"
								src="../../back/js/plugins/jquery.dataTables.min.js"></script>
							<script type="text/javascript"
								src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>

							<script type="text/javascript">$('#sampleTable').DataTable();</script>

							<!-- Google analytics script-->
							<script type="text/javascript">
								if (document.location.hostname == 'pratikborsadiya.in') {
									(function (i, s, o, g, r, a, m) {
										i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
											(i[r].q = i[r].q || []).push(arguments)
										}, i[r].l = 1 * new Date(); a = s.createElement(o),
											m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
									})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
									ga('create', 'UA-72504830-1', 'auto');
									ga('send', 'pageview');
								}

							</script>

							<script>
								fetch('/back/exampleBack.html')
									.then(response => response.text())
									.then(html => {
										document.body.insertAdjacentHTML('beforeend', html);
									});



								function RWDTest() {
									//let RWD = document.getElementsByClassName("RWDTest");
									let RWD = document.body;
									if (RWD.className === "app sidebar-mini rtl sidenav-toggled pace-done") {
										RWD.className = "app sidebar-mini rtl pace-done";
									} else {
										RWD.className = "app sidebar-mini rtl sidenav-toggled pace-done";
									}
								}

							</script>
					</body>

					</html>