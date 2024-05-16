<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>


            <style>
                .main {
                    min-height: 55vh;
                }

                div {
                    border: 1px solid black;
                    /* 黑色實線邊框 */
                }
            </style>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

            <!--Google Font : Nunito-->
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

            <!-- For style(All CSS content) -->
            <link rel="stylesheet" type="text/css" href="../styles/home.css" />
            <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
            <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
            <link rel="icon" href="images/favicon.ico">

            <!-- JS Bundle for BS  -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous">
                </script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        </head>

        <body>
            <div style="height: 114px;"></div>
            <div class="row justify-content-center">



                <div class="col-7 m-2">
                    <div class="d-flex align-items-center g-0 position-relative" style="width: 700px; height: 700px;">
                        <img src="${course.courseImage}"
                            style="width: 100%; height: 100%; position: absolute; top: 0; left: 0; object-fit: cover;"
                            alt="Course Image">

                        <div class="d-flex flex-column justify-content-end align-items-start position-absolute"
                            style="width: 100%; height: 100%; top: 0; left: 0; z-index: 1;">
                            <h1>${course.courseName}</h1>
                            <h3>${course.courseType}</h3>
                        </div>
                    </div>

                    <div class="mt-2" style="height: 120px;">
                        ${course.description}


                    </div>
                </div>




                <div class="col-3 d-flex flex-column align-items-center" style="width: 300px; height: 1062px;">
                    <div class="align-items-center m-1" style="width: 250px; height: 80px;">

                        <div class="mt-2 ml-2">
                            <h6>截止日期</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.deadlineDate}
                        </div>

                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 40px;">

                        <h6 class="ml-2">SHOW DETAILS</h6>

                    </div>

                    <div class="d-flex flex-column align-items-start m-1" style="width: 250px; height: 260px;">

                        <div class="mt-2 ml-2">
                            <h6>時間</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.startDate}
                            ${course.endDate}
                        </div>


                        <div class="mt-2 ml-2">
                            <h6>地點</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.location}
                        </div>
                        <div class="mt-2 ml-2">
                            <h6>地點</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.location}
                        </div>

                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 40px;">


                        <h6 class="ml-2">TEACHER DETAILS</h6>



                    </div>

                    <div class="d-flex flex-column align-items-start m-1" style="width: 250px; height: 160px;">

                        <div class="mt-2 ml-2">
                            <h6>教師名稱</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.teacherName}
                        </div>
                        <div class="mt-2 ml-2">
                            <h6>教師聯繫方式</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.teacherContact}
                        </div>


                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 40px;">

                        <h6 class="ml-2">人數</h6>

                    </div>
                    <div class="d-flex flex-column align-items-start m-1" style="width: 250px; height: 160px;">

                        <div class="mt-2 ml-2">
                            <h6>目前報名人數</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.enrollmentCount}
                        </div>
                        <div class="mt-2 ml-2">
                            <h6>上限名額</h6>
                        </div>
                        <div class="mt-2 ml-2">
                            ${course.maxCapacity}
                        </div>
                    </div>




                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 60px;">

                        <h6 class="ml-2">+GOOGLE CALENDAR</h6>

                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 60px;">

                        <h6 class="ml-2">+ICAL EXPORT</h6>

                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 60px;">
                        <form action="${pageContext.request.contextPath}/registerCourse" method="post">
                            <input type="hidden" name="productId" value="${course.productId}" />
                            <input type="hidden" name="courseName" value="${course.courseName}" />
                            <button type="submit" class="btn btn-primary">Register Now</button>
                        </form>


                    </div>

                    <div class="d-flex align-items-center m-1" style="width: 250px; height: 60px;">
                        <form action="${pageContext.request.contextPath}/sendCourseEmail" method="post">
                            <input type="hidden" name="START_DATE" value="fmt:formatDate value=" ${course.startDate}
                                pattern="yyyy-MM-dd" />
                            <input type="hidden" name="COURSE_NAME" value="${course.courseName}" />
                            <button type="submit" class="btn btn-primary">Send Course Registration Email</button>
                        </form>


                    </div>


                </div>


            </div>
            <!-- Optional JavaScript; choose one of the two! -->
            <script>

                fetch('/html/basic.html')
                    .then(response => response.text())
                    .then(html => {
                        document.body.innerHTML += html;
                    });
            </script>
        </body>

        </html>