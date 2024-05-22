<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <style>
                .main {
                    min-height: 55vh;
                }

                .card-horizontal {
                    display: flex;
                    flex: 1 1 auto;
                }

                .img-square-wrapper {
                    width: 150px;
                    height: 150px;
                    overflow: hidden;
                }

                .img-square-wrapper img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .card-body {
                    flex: 1 1 auto;
                    padding: 1.25rem;
                }
            </style>

            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="../styles/home.css" />
            <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
            <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
            <link rel="icon" href="images/favicon.ico">
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.js" crossorigin="anonymous"></script>
            <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap&libraries=&v=weekly"
                async>
                </script>

        </head>

        <body>
            <div class="container mt-5" style="height: 666px;">
                <h2 style="height: 120px;">Courses by Teacher</h2>
                <c:set var="teacherNameDisplayed" value="false" />
                <c:forEach items="${teacherCourses}" var="course">
                    <c:if test="${teacherNameDisplayed == false}">
                        <h3 class="d-flex align-items-center">${course.teacherName}</h3>
                        <c:set var="teacherNameDisplayed" value="true" />
                    </c:if>
                    <a href="${pageContext.request.contextPath}/courseDetailsFront/${course.productId}"
                        style="text-decoration: none; color: inherit;">
                        <div class="card mb-3" style="background-color:white;">
                            <div class="card-horizontal">
                                <div class="img-square-wrapper">
                                    <img src="${course.courseImage}" alt="Course image" class="img-fluid">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">${course.courseType}</h4>
                                    <h5 class="card-title">${course.courseName}</h5>
                                    <p class="card-text">${course.description}</p>
                                    <p class="card-text"><small class="text-muted">Start Date: ${course.startDate} ~ End
                                            Date: ${course.endDate}</small></p>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>


            <div id="new-content-container"></div>

            <script>
                fetch('/html/basic.html')
                    .then(response => response.text())
                    .then(html => {
                        document.getElementById('new-content-container').innerHTML += html;
                    });
            </script>
        </body>

        </html>