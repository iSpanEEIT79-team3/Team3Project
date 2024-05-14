<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<meta charset="UTF-8">
<title>全部文章</title>
<style>
.main {
	min-height: 55vh;
}

.lt img {
	max-width: 200px;
	/* 設定圖片最大寬度為 800px */
	display: block;
	margin: 0 auto;
	/* 圖片置中 */
}

.input-row {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.input-label {
	margin-right: 10px;
	width: 100px;
}

.input-field {
	flex: 1;
	padding: 8px;
	border-radius: 4px;
	border: 1px solid #ccc;
}
</style>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>


	<!-- 主內容 -->

	<div class="main" style="margin-top: 10%;">
		<div class="back-content"></div>
		<div class="add-form">
			<div class="container">
				<h2>查詢</h2>
				<div class="input-row">
					<label class="input-label">論壇id</label> <input class="input-field"
						type="text" disabled value="${ltBean.ltId}">
				</div>
				<div class="input-row">
					<label class="input-label">標題</label> <input class="input-field"
						type="text" disabled value="${ltBean.title}">
				</div>
				<div class="input-row">
					<label class="input-label">使用者id</label> <input class="input-field"
						type="text" disabled value="${ltBean.userId}">
				</div>
				<div class="input-row">
					<label class="input-label">文章內容</label> <input class="input-field"
						type="text" disabled value="${ltBean.content}">
				</div>
				<div class="input-row">
					<label class="input-label">日期</label> <input class="input-field"
						type="text" disabled value="${ltBean.date}">
				</div>
				<div class="input-row">
					<label class="input-label" >照片</label> <img class="input-field"
						src="${ltBean.picture}" alt="照片"  style="max-width: 20%; height: 20%;">
				</div>

				<div class="input-row">
					<label class="input-label">讚</label> <input class="input-field"
						type="text" disabled value="${ltBean.saveLike}">
				</div>
				<a class="btn btn-home" href="/LTSelectAllFront"
					style="background-color: black; color: white;"
					onmouseover="this.style.backgroundColor='grey'; this.style.color='black';"
					onmouseout="this.style.backgroundColor='black'; this.style.color='white';">返回首頁</a>


			</div>







		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


	<script>

          
              function handleReportSuccess() {
        alert("檢舉成功！謝謝你的檢舉,我們將盡快處理❗❗");
    }
</script>
	<script>
                document.addEventListener('DOMContentLoaded', function () {
                    var deleteButtons = document.querySelectorAll('.delete');
                    deleteButtons.forEach(function (button) {
                        button.addEventListener('click', function (event) {
                            event.preventDefault();
                            Swal.fire({
                                title: '確定刪除嗎❌?',
                                text: "此操作將無法還原🫠!",
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: '確認刪除!',
                                cancelButtonText: '取消'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    button.closest('form').submit();
                                }
                            });
                        });
                    });
                });

                fetch('html/basic.html')
                    .then(response => response.text())
                    .then(html => {
                        document.body.innerHTML += html;
                    });
            </script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
                </script>
</body>

</html>