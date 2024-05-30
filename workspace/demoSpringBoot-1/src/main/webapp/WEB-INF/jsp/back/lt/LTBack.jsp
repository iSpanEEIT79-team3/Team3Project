<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta name="description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<title>JFSwing後台</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="../../back/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	overflow: auto;
	margin: 0;
	padding: 0;
}

.lt img {
	max-width: 300px;
	height: 300px;
}

.content {
	max-width: 400px;
	/* 設定最大寬度 */
	overflow: hidden;
	/* 隱藏超出的內容 */
	text-overflow: ellipsis;
	/* 使用省略符號表示被隱藏的內容 */
	white-space: nowrap;
	/* 避免文字換行 */
}
</style>
</head>

<body class="app sidebar-mini rtl pace-done">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<main class="app-content">
		<div class="app-title">
			<h1>互動區</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-title">
						<!-- <h2>小標題</h2> -->
					</div>
					<div class="tile-body">
						<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
						<div class="back-content"></div>
						<div class="container">
							<div class="lt d-flex justify-content-center mb-3">
								<form method="get" action="/ReplySelectAll">
									<button class="btn btn-primary mr-2" type="submit">回復區</button>
								</form>
								<form method="get" action="/back/lt/LTTitle.html">
									<button class="btn btn-primary mr-2" type="submit">模糊查詢</button>
								</form>
								<form method="get" action="/ReportSelectAll">
									<button class="btn btn-primary mr-2" type="submit">檢舉區</button>
								</form>
								<form method="get" action="/back/lt/LTInsert.html">
									<button class="btn btn-primary mr-2" type="submit">新增</button>
								</form>
								<form method="Get" action="/back/lt/LTSelect.html">
									<button class="btn btn-primary" type="submit">搜尋</button>
								</form>
							</div>

							<table class="table table-bordered" id="page">
								<thead class="thead-light">
									<tr>
										<th>文章ID</th>
										<th style="width: 100px">標題</th>
										<th>使用者ID</th>
										<th style="width: 50px">輸入文章內容</th>
										<th>日期</th>
										<th>讚</th>
										<th>照片</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ltBeans}" var="items">
										<tr>
											<td><a href="/findLTID/${items.ltId}">${items.ltId}</a></td>
											<td>${items.title}</td>
											<td>${items.userId}</td>
											<td title="${items.content}" class="content"
												data-toggle="modal" data-target="#contentModal"
												onclick="showcontent(this)">${items.content}</td>
											<!-- 加入 content 類別來控制文字截斷 -->
											<td>${items.date}</td>
											<td>${items.saveLike}</td>
											<td><a href="${items.picture}" onclick="showImg(event)"
												data-toggle="modal" data-target="#contentModal">圖片</a></td>
											<td>
												<!--                                                 <form method="Get" -->
												<%--                                                     action="/LTSelectById.controller/${items.ltId}"> --%>
												<!--                                                     <button class="btn btn-primary mr-2" type="submit">修改</button> -->
												<!--                                                 </form> -->
												<form method="post"
													action="/LTDeleteById.controller?ltId=${items.ltId}"
													onsubmit="return confirmDelete()">
													<input type="hidden" name="_method" value="DELETE">
													<button class="btn btn-danger mr-2" type="submit">刪除</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="modal fade" id="contentModal" tabindex="-1"
							aria-labelledby="contentModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="contentModalLabel">照片</h5>
										<button type="button" class="btn-close" data-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- 顯示完整內容 -->
									</div>
								</div>
							</div>
						</div>
						<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
						<script
							src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
						<script>
                        document.addEventListener('DOMContentLoaded', function () {
                            var deleteButtons = document.querySelectorAll('.delete');

                            deleteButtons.forEach(function (button) {
                                button.addEventListener('click', function (event) {
                                    event.preventDefault(); // 阻止默认行为（即提交表单）

                                    Swal.fire({
                                        title: '確定刪除嗎❌?',
                                        text: "此操作將無法還原🫠!",
                                        icon: 'question',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: '確認'
                                    });
                                });
                            });
                        });

                        function showcontent(e) {
                            let content = e.innerHTML;
                            let body = document.querySelector(".modal-body");
                            body.innerHTML = content;
                        }
                        function showImg(e){
                            e.preventDefault();
                            let path = e.target.getAttribute('href');
                            console.log(path);
                            let img = document.createElement("img");
                            let body = document.querySelector(".modal-body");
                            body.innerHTML = ""; // 清空模态框中的内容

                            // 创建图像元素
                            img.src = path;
                            img.style.maxWidth = "100%"; // 设置图像的最大宽度为模态框的宽度
                            img.style.height = "auto"; // 设置图像的高度自动适应
                            body.appendChild(img); // 将图像添加到模态框中
                        }

                    </script>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="../../back/js/plugins/jquery.dataTables.min.js"></script>
		<script type="text/javascript"
			src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
		<script type="text/javascript">
        $('#page').DataTable();

        $(document).ready(function () {
            $('.hoverText').popover({
                trigger: 'hover',
                placement: 'bottom'

            });
        });
    </script>
	</main>
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

	<script>
    fetch('../../back/exampleBack.html')
        .then(response => response.text())
        .then(html => {
            document.body.insertAdjacentHTML('beforeend', html);
        });

    function RWDTest() {
        let RWD = document.body;
        if (RWD.className === "app sidebar-mini rtl sidenav-toggled pace-done") {
            RWD.className = "app sidebar-mini rtl pace-done";
        } else {
            RWD.className = "app sidebar-mini rtl sidenav-toggled pace-done";
        }
    }
</script>
	<script>
    function confirmDelete() {
        return confirm('你確定要刪除嗎？');
    }
</script>
</body>
</html>