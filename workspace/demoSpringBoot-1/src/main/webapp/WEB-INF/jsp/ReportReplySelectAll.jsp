<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部文章</title>
<style>
body {
	overflow: auto; /* 清除浮動 */
	margin: 0;
	padding: 0;
}
 button {
        padding: 10px 20px;
        background-color: #87ceeb;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s; /* 添加过渡效果 */
    }

    button:hover {
        background-color: #4682b4; /* 鼠标悬停时颜色变为深蓝色 */
    }

.lt {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	width: 50%;
}

.lt table {
	width: 100%;
	border-collapse: collapse;
}

.lt th, .lt td {
	text-align: center;
	padding: 8px;
	border: 1px solid #000000;
	font-weight: bold;
}

.lt th {
	background-color: #a8fefa;
}

.lt button {
	padding: 8px 16px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	transition: background-color 0.3s;
}

.lt button.edit {
	background-color: #87ceeb; /* 綠色 */
	color: white;
}

.lt button.delete {
	background-color: #ffa500; /* 紅色 */
	color: white;
}

.lt button.add {
		padding: 8px 16px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	transition: background-color 0.3s;
}

.lt button:hover {
	opacity: 0.8;
}
.h22{
	text-align:center;
	}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<div class="back-content"></div>	
	<div class="lt">
		<div class="h22">
		<h2 class="h2">回復檢舉區</h2>
		
		</div>
	<div style="text-align: center; margin-top: 20px;">
    <a href="LTSelectAll" style="text-decoration: none;">
        <button id="returnButton" onclick="changeColor()">返回首頁</button>
    </a>
</div>
		<form method="get" action="html/ReportReplyInsert.html">
			<button class="add" type="submit">新增</button>
		</form>
			<br>
			<form method="get" action="html/ReportReplySelect.html">
				<input type="hidden" name="reportReplyId" value="${items.reportReplyId}">
				<button class="select" type="submit">搜尋</button>
			</form>
		<table border="1">
			<tr style="background-color: #a8fefa">
				<th>檢舉ID</th>
				<th>檢舉內容</th>
				<th>回復ID</th>
				<th>操作</th>
				
			</tr>
			<c:forEach items="${reportreplyBeans}" var="items">
				<tr>
					<td>${items.reportReplyId}</td>
					<td>${items.reportContent}</td>
					<td>${items.replyId}</td>
					
					
					<td>
<%-- 						<form method="get" action="/ReportSelectId.controller/${items.reportId}"> --%>
<%-- 							<input type="hidden" name="reportId" value="${items.reportId}"> --%>
<!-- 							<button class="edit" type="submit">修改</button> -->
<!-- 						</form> -->
						<form method="post" action="/ReportReplyDelete.controller?reportReplyId=${items.reportReplyId}">
							<input type="hidden" name="_method" value="DELETE">
							<button class="delete" type="submit">刪除</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script>
				fetch('/back')
					.then(response => response.text())
					.then(html => {
						//內容
						$('.back-content').html(html);
					})
					.catch(error => console.error('Error fetching back.html', error));
			</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var deleteButtons = document.querySelectorAll('.delete');

        deleteButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // 阻止默认行为（即提交表单）

                Swal.fire({
                    title: '確定刪除嗎?',
                    text: "此操作將無法還原!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確認刪除👌!',
                    cancelButtonText: '取消🫠'	
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 如果用户点击了确认，则提交表单
                        button.closest('form').submit();
                    }
                });
            });
        });
    });
</script>		
	
	
</body>
</html>