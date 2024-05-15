<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

            <style>
                div {
                    border: 1px solid black;
                    /* 黑色實線邊框 */
                }
            </style>

        </head>

        <body>




            <div class="row justify-content-center">



                <div class="col-7 m-2">
                    <div class="d-flex align-items-center g-0" style="width: 580px; height: 920px;">
                        <img class="z-n1" src="${course.courseImage}"
                            class="d-block object-fit-cover rounded-5 mx-auto my-auto"
                            style="max-width: 100%; max-height:  100%;" alt="..." />

                        <div class="d-flex flex-column justify-content-end align-items-start g-0" style="height: 95%;">
                            <h1>${course.courseName}</h1>
                            <h3>
                                ${course.courseType}

                            </h3>
                        </div>
                    </div>
                    <div>
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

                </div>
            </div>
        </body>

        </html>