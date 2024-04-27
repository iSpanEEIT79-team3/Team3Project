<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>所有課程</title>
			<style>
				lt-container {
					overflow: auto;
					/* 清除浮動 */
				}

				/*
.lt {
	position: absolute;
	left: 580px;
	float: center;
	width: 50%;
}*/

				.lt-table {
					width: 100%;
					border-collapse: collapse;
				}

				.lt th,
				.lt td {
					text-align: center;
					padding: 8px;
					border: 1px solid #ddd;
				}

				.lt th {
					background-color: #d8dbd9;
					padding: 3px;

				}

				input,
				button {
					/* Apply styles to both input and button elements */
					border: 0;
					background-color: #4f85a6;
					color: #fff;
					border-radius: 10px;
					padding: 8px 16px;
					/* Adjust padding to your liking */
					cursor: pointer;
					/* Makes it clear that the element is clickable */
				}

				input:hover,
				button:hover
				}

				a {
					text-decoration: none;
					/* Removes underline from links */
				}

				.table {
					padding: 3px;

				}

				.box {}
			</style>
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
		</head>

		<body>
			<div class="back-content"></div>
			<div class="lt">
				<h2>課程資料</h2>
				<div class="box">
					<table>
						<tr>
							<th>課程ID</th>
							<th>課程名稱</th>
							<th>課程描述</th>
							<th>開課日期</th>
							<th>結束日期</th>
							<th>報名截止日</th>
							<th>課程價格</th>
							<th>教師姓名</th>
							<th>教師聯絡方式</th>
							<th>報名人數</th>
							<th>上限人數</th>
							<th>課程圖片</th>
						</tr>
						<c:forEach items="${Courses}" var="course">
							<tr>

								<td>${course.courseID}</td>
								<td>${course.courseName}</td>
								<td>${course.description}</td>
								<td>${course.startDate}</td>
								<td>${course.endDate}</td>
								<td>${course.deadlineDate}</td>
								<td>${course.price}</td>
								<td>${course.teacherName}</td>
								<td>${course.teacherContact}</td>
								<td>${course.enrollmentCount}</td>
								<td>${course.maxCapacity}</td>
								<td>${course.courseImage}</td>

								<td><a href="/GetCourseById/${course.courseID}"><button>修改</button></a></td>
								<!--                     <td><form method="get" action="/GetCourseById">

                    <input type="hidden" name="courseID" value="${course.courseID}">
                                    <button type="submit" class="test">修改</button>
                                </form>  -->

								<td>
									<form method="post" action="/DeleteById?courseID=${course.courseID}">
										<input type="hidden" name="_method" value="DELETE">

										<button type="submit" class="test">刪除</button>
									</form>
						</c:forEach>
					</table>
				</div>

				<td><a href="/course-insert"><button>新增資料</button></a></td>

				<td><a href="/index"><button>回首頁</button></a></td>

			</div>


		</body>

		</html>