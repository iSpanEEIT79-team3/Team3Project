<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<style>
  .d-flex {
        display: flex;
    }
    .justify-content-between {
        justify-content: space-between;
    }
    .align-items-center {
        align-items: center;
    }

</style>
<meta name="description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<title>JFSwing後台</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="../html/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="app sidebar-mini rtl pace-done">
	<main class="app-content">
		<div class="app-title">
			<h1>JFSwing配對紀錄後台</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div
						class="tile-title d-flex justify-content-between align-items-center">
						<h2>配對紀錄</h2>
						<button type="button" onclick="reportMatch(${match.matchid})"
							class="btn btn-primary">檢舉紀錄</button>
					</div>
					<table class="table table-hover" id="page">
						<thead>
							<tr>
								<th>配對紀錄</th>
								<th>會員1</th>
								<th>會員2</th>
								<th>配對時間</th>
								<th>配對狀態</th>
								<th>配對成功</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${Allmatches}" var="match">
								<tr>
									<td>${match.matchid}</td>
									<td>${match.user1id}</td>
									<td>${match.user2id}</td>
									<td>${match.matchdate}</td>
									<td>${match.matchsuccess}</td>
									<td>${match.matchstatus}</td>
									<td>
										<!-- 刪除按鈕 -->
										<form id="deleteForm_${match.matchid}" action="/DeleteById"
											method="post">
											<input type="hidden" name="_method" value="put" /> <input
												type="hidden" name="userId1" value="${match.user1id}" /> <input
												type="hidden" name="userId2" value="${match.user2id}" /> <input
												type="hidden" name="matchSuccess" value="0" /> <input
												type="hidden" name="matchStatus" value="N" />
											<button type="button" onclick="deleteMatch(${match.matchid})">更新</button>

										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</main>

	<!-- Essential javascripts for application to work-->
	<script src="/html/js/jquery-3.2.1.min.js"></script>
	<script src="/html/js/popper.min.js"></script>
	<script src="/html/js/bootstrap.min.js"></script>
	<script src="/html/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="/html/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<script type="text/javascript" src="/html/js/plugins/chart.js"></script>
	<script type="text/javascript"
		src="/html/js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="/html/js/plugins/dataTables.bootstrap.min.js"></script>

	<script>
        $('#page').DataTable();
        function deleteMatch(matchId) {
            if (confirm('確定要更新這條記錄嗎？')) {
                // 提交表單
                document.getElementById('deleteForm_' + matchId).submit();
            }
        }
        fetch('/back/exampleBack.html')
            .then(response => response.text())
            .then(html => {
                document.body.insertAdjacentHTML('beforeend', html);
            });
        
        function reportMatch(matchId) {
            // 跳轉到檢舉頁面
            window.location.href = 'http://localhost:8080/reports?matchId=' + matchId;
        }

        function RWDTest() {
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
