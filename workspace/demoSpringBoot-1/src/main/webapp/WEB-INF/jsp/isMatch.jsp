<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.main {
	min-height: 55vh;
}
</style>
<!-- Bootstrap CSS -->
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
<title>範本</title>
</head>

<body>


	<div class="container-fluid" style="margin-top: 150px;">
		<h2 class="text-center">標題</h2>
	</div>
	<!-- <section> -->
	<div class="main">
		<table class="big-table">
			<c:forEach items="${isMatch}" var="user" varStatus="loop">
				<c:if test="${loop.index % 3 == 0}">
					<tr>
				</c:if>
				<td>
					<table class="small-table">
						<tr>
							<td>
								<div class="user-container">
									<img id="user_image_${loop.index}" src="${user.picture}"
										alt="User Image" class="img">
									<div id="user_details_${loop.index}" class="user-details">
										<p>Nickname: ${user.nickName}</p>
										<p>Gender: ${user.gender}</p>
										<p>Birthday: ${user.birthday}</p>
										<p>Dance Character: ${user.danceCharacter}</p>
										<p>Dance Age: ${user.danceAge}</p>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</td>
				<c:if test="${loop.index % 3 == 2 || loop.last}">
					</tr>
				</c:if>
			</c:forEach>
		</table>







	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
            </script>
	<script>
      
        fetch('html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });

        
    </script>

</body>

</html>