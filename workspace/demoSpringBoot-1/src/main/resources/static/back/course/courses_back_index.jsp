<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>所有課程</title>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- Main CSS-->
            <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
            <!-- Font-icon css-->
            <link rel="stylesheet" type="text/css"
                href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



            <style>
                .course-image {
                    max-width: 88px;
                    /* Set the maximum width */
                    max-height: 88px;
                    /* Set the maximum height */
                    /* Add other styles as needed */
                }

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
                            <th>用戶ID</th>
                            <th>產品ID</th>
                            <th>課程名稱</th>
                            <th>描述</th>
                            <th>課程類型</th>
                            <th>開始日期</th>
                            <th>結束日期</th>
                            <th>截止日期</th>
                            <th>地點</th>
                            <th>價格</th>
                            <th>教師名稱</th>
                            <th>教師聯繫方式</th>
                            <th>報名人數</th>
                            <th>最大容量</th>
                            <th>課程圖片</th>
                        </tr>
                        <c:forEach items="${Courses}" var="course">
                            <tr>

                                <td>${course.idUser}</td>
                                <td><a
                                        href="${pageContext.request.contextPath}/courseDetails/${course.productId}">${course.productId}</a>
                                </td>
                                <td>${course.courseName}</td>
                                <td>${course.description}</td>
                                <td>${course.courseType}</td>
                                <td>${course.startDate}</td>
                                <td>${course.endDate}</td>
                                <td>${course.deadlineDate}</td>
                                <td>${course.location}</td>
                                <td>${course.price}</td>
                                <td>${course.teacherName}</td>
                                <td>${course.teacherContact}</td>
                                <td>${course.enrollmentCount}</td>
                                <td>${course.maxCapacity}</td>
                                <td><img src="${course.courseImage}" style="width: 100px; height: 100px;"></td>

                                <td><a href="/GetCourseById/${course.productId}"><button>修改</button></a></td>


                                <td>
                                    <form method="post" action="/DeleteById?courseID=${course.productId}">
                                        <input type="hidden" name="_method" value="DELETE">

                                        <button type="submit" class="test">刪除</button>
                                    </form>
                        </c:forEach>
                    </table>
                </div>

                <td><a href="/course-insert"><button>新增資料</button></a></td>

                <td><a href="/index"><button>回首頁</button></a></td>

            </div>


            <!-- Essential javascripts for application to work-->
            <script src="../../back/js/jquery-3.2.1.min.js"></script>
            <script src="../../back/js/popper.min.js"></script>
            <script src="../../back/js/bootstrap.min.js"></script>
            <script src="../../back/js/main.js"></script>
            <!-- The javascript plugin to display page loading on top-->
            <script src="../../back/js/plugins/pace.min.js"></script>
            <!-- Page specific javascripts-->
            <script type="text/javascript" src="../../back/js/plugins/chart.js"></script>
            <script type="text/javascript" src="../../back/js/plugins/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="../../back/js/plugins/dataTables.bootstrap.min.js"></script>
            <script>
                fetch('../../back/exampleBack.html')
                    .then(response => response.text())
                    .then(html => {
                        document.body.insertAdjacentHTML('beforeend', html);
                    });
            </script>
        </body>

        </html>