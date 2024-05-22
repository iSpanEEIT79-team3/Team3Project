<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Teacher Courses</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
                crossorigin="anonymous">
            <style>
                .main {
                    min-height: 55vh;
                }
            </style>
        </head>

        <body>
            <div style="height: 160px;"></div>
            <div class="container mt-5">
                <h2>Courses by Teacher</h2>
                <c:forEach items="${teacherCourses}" var="course">
                    <div class="row mb-3">
                        <div class="col-9 container d-flex align-items-center">
                            <div class="">
                                <img src="${course.courseImage}" alt="Course image">
                            </div>
                            <div class="">
                                <h4 class="">${course.courseType}</h4>
                                <h5 class="">${course.courseName}</h5>
                                <p class="">${course.description}</p>
                                <p class=""><small class="text-muted">Start Date: ${course.startDate}</small>
                                </p>
                                <p class=""><small class="text-muted">End Date: ${course.endDate}</small></p>
                                <a href="${pageContext.request.contextPath}/courseDetailsFront/${course.productId}"
                                    class="btn btn-primary">繼續閱讀</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script>
                $(document).ready(function () {
                    fetch('${pageContext.request.contextPath}/html/exampleBack.html')
                        .then(response => response.text())
                        .then(html => {
                            document.body.innerHTML += html;
                            $('#sampleTable').DataTable();
                        })
                        .catch(error => {
                            console.error('Error loading exampleBack.html:', error);
                        });
                });
            </script>
        </body>

        </html>