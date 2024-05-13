<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>刪除失敗</title>
</head>
<body>
<h1>找不到此筆資料</h1>
<button class="index">回首頁</button>
		<script>
		const index = document.querySelector('.index')
        index.addEventListener('click', function () {
            location.href = 'html/GetMatch.html'
        })
		</script>
</body>
</html>