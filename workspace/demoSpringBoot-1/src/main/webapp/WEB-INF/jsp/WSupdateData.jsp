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



						<style>
							td {
								padding: 5px 10px;
								/* 上下各 10px，左右各 20px 的内边距 */
								white-space: nowrap;
								overflow: hidden;
								white-space: nowrap;
								text-overflow: ellipsis;
							}

							img {
								max-width: 150px;
								/* 最大寬度 */
								max-height: 150px;
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
								table-layout: fixed
							}
						</style>
					</head>

					<body style='background-color: #fdf5e6'>

						<main class="app-content">
							<div class="app-title">
								<div>
									<h1><i class="fa fa-th-list"></i> 活動資訊</h1>
									<br>
									<form method="get" action="/WSSearchByDate" enctype="multipart/form-data">
										活動開始時間 : <input type="date" id="EVENT_STARTIME" name="startTime" />
										<button type="submit">查詢</button>
									</form>
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
											<form method="post" action="${pageContext.request.contextPath}/WSupdate"
												enctype="multipart/form-data">
												<input type="hidden" name="_method" value="put" />
												<jsp:useBean id="eventBean" scope="request"
													class="com.mmmooonnn.model.Event" />
												<table>
													<tr>
														<td>活動編號</td>
														<td><input style="background-color: #7B7B7B;" type="text"
																value="${eventBean.eventId}" readonly name="PRODUCTID">
														</td>
													</tr>
													<tr>
														<td>活動名稱</td>
														<td><input type="text" value="${eventBean.eventName}"
																name="EVENT_NAME"></td>
													</tr>
													<tr>
														<td>報名開始日期</td>
														<td><input type="datetime-local"
																value="${eventBean.signupStartime}"
																name="SIGNUP_STARTIME"></td>
													</tr>
													<tr>
														<td>報名結束日期</td>
														<td><input type="datetime-local"
																value="${eventBean.signupEndtime}"
																name="SIGNUP_ENDTIME"></td>
													</tr>
													<tr>
														<td>活動開始時間</td>
														<td><input type="datetime-local" value="${eventBean.startTime}"
																name="EVENT_STARTIME"></td>
													</tr>
													<tr>
														<td>活動結束時間</td>
														<td><input type="datetime-local" value="${eventBean.endTime}"
																name="EVENT_ENDTIME"></td>
													</tr>

													<tr>
														<h2 style="  display: flex;"></h2>
														<td>活動詳細資料</td>
														<td>

															<textarea type="text" name="EVENT_DETAIL"
																style="width: 100%; height: 200px;overflow: auto;">${eventBean.eventDetail}</textarea>
														</td>
														</h2>
													</tr>
													<tr>
														<td>活動種類</td>
														<td><input type="text" value="${eventBean.eventCategory}"
																name="EVENT_CATEGORY"></td>
													</tr>
													<tr>
														<td>報名金額</td>
														<td><input type="text" value="${eventBean.eventPrice}"
																name="EVENT_PRICE"></td>
													</tr>
													<tr>
														<td>活動地址</td>
														<td><input type="text" value="${eventBean.eventLocation}"
																name="EVENT_ADDRES"></td>
													</tr>
													<tr>
														<td>組織者</td>
														<td><input type="text" value="${eventBean.organizer}"
																name="ORGANIZER"></td>
													</tr>
													<tr>
														<td><img alt="" src="${eventBean.picture}"></td>
													</tr>
													<tr>
														<td><input type="file" name="PICTURE"></td>
													</tr>
												</table>
												<!-- 	 <div class="img"> -->
												<!-- <%-- <img class="imgInput" src="<%= eventBean.getPicture()%>" alt="">
													--%> -->
												<!--         </div> -->
												<!--         <div> -->
												<!--             <label for="fileInput" class="custom-file-button">選擇照片</label> -->
												<!--         </div> -->

												<input type="hidden" value="${eventBean.picture}" name="oldPICTUREpath">
												<button name="type" value="upData">確定</button>
											</form>


										</div>
									</div>
								</div>
							</div>


							</table>


							<a href="html/WSinsert.html"><input type="submit" value="新增資料"></a>

							<a href="WSall"><input type="submit" value="查詢所有資料"></a>

							<!-- 	<form action="WSall" method="get"><input type="submit" value="查詢所有資料"></form> -->
							</div>
							<footer></footer>
							</div>
							<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
							<script src="https://cdn.datatables.net/v/dt/dt-2.0.1/datatables.min.js"></script>


							<script src="
		https://cdn.jsdelivr.net/npm/sweetalert2@11.10.8/dist/sweetalert2.all.min.js
		"></script>
							<script>
								// 定义一个函数，在点击按钮时显示确认是否删除的SweetAlert弹窗
								function confirmDelete() {
									// 调用SweetAlert函数，显示弹窗
									Swal.fire({
										title: '确认是否删除？',
										text: '您确定要删除吗？',
										icon: 'warning',
										showCancelButton: true, // 显示取消按钮
										confirmButtonText: '确认', // 确认按钮的文本
										cancelButtonText: '取消' // 取消按钮的文本
									}).then((result) => {
										// 如果点击了确认按钮，则执行相应的操作
										if (result.isConfirmed) {
											// 在这里可以执行删除操作或者其他操作
											// 此处仅作示例，可以替换为实际的操作代码
											Swal.fire('已删除！', '您已成功删除记录。', 'success');
										}
									});
								}
							</script>


							<!-- Essential javascripts for application to work-->
							<script src="../../back/js/jquery-3.2.1.min.js"></script>
							<script src="../../back/js/popper.min.js"></script>
							<script src="../../back/js/bootstrap.min.js"></script>
							<script src="../../back/js/main.js"></script>
							<!-- The javascript plugin to display page loading on top-->
							<script src="../js/plugins/pace.min.js"></script>
							<!-- Page specific javascripts-->
							<script type="text/javascript" src="../../back/js/plugins/chart.js"></script>
							<script type="text/javascript"
								src="../../back/js/plugins/jquery.dataTables.min.js"></script>
							<script type="text/javascript"
								src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>

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