<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>新增成功</h1>
<button class="index">回首頁</button>
		<script>
		const index = document.querySelector('.index')
        index.addEventListener('click', function () {
            location.href = 'MatchIndex.html'
        })
		</script>
</body>
</html>