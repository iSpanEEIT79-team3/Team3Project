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
<link rel="stylesheet" type="text/css" href="../html/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="app sidebar-mini rtl pace-done">
	<main class="app-content">
		<div class="app-title">
			<h1>大標題</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-title">
						<h2>配對紀錄</h2>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>配對紀錄</th>
								<th>會員1</th>
								<th>會員2</th>
								<th>配對時間</th>
								<th>配對狀態</th>
								<th>配對成功</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${Allmatches}" var="Allmatches">
								<tr>
									<td>${Allmatches.matchid}</td>

									<td>${Allmatches.user1id}</td>
									<td>${Allmatches.user2id}</td>
									<td>${Allmatches.matchdate}</td>
									<td>${Allmatches.matchsuccess}</td>
									<td>${Allmatches.matchstatus}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		</div>


	</main>

	<script type="text/javascript"
            src="../../back/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
            src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#page').DataTable();</script>
	<!-- Essential javascripts for application to work-->
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="../js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="../js/plugins/chart.js"></script>
    <script type="text/javascript" src="../js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/plugins/dataTables.bootstrap.min.js"></script>
    <script>
        fetch('/html/exampleBack.html')
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
</html>