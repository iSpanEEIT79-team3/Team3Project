<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <style>
                .main {
                    min-height: 55vh;
                }

                .expired {
                    font-size: 24px;
                    color: red;
                    text-align: center;
                }

                .course-image-container {
                    width: 100%;
                    height: auto;
                    position: relative;
                }

                .course-image {
                    width: 100%;
                    height: auto;
                    object-fit: cover;
                }

                .course-content {
                    display: flex;
                    flex-direction: column;
                    flex-grow: 1;
                    overflow: hidden;
                }

                .course-description {
                    white-space: normal;
                    word-wrap: break-word;
                }

                .button {
                    width: 250px;
                    height: 60px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .button button {
                    width: 100%;
                    height: 100%;
                }

                #registerNowButton,
                #mail {
                    outline: none;
                    background-color: #B15A5E;
                    border: none;
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
                async></script>

        </head>

        <body>
            <div style="height: 140px;"></div>
            <div class="row justify-content-center">
                <div class="col-7 m-2">
                    <div class=" border border-dark">
                        <div class="course-image-container">
                            <img src="${course.courseImage}" class="course-image" alt="Course Image">
                            <div class="d-flex flex-column justify-content-end align-items-start position-absolute"
                                style="width: 100%; height: 100%; top: 0; left: 0; z-index: 1;">
                            </div>

                        </div>

                        <div class="course-content">
                            <div class="mt-2 course-description">
                                <h1 class="m-1">${course.courseName}</h1>
                                <h3 class="m-1">${course.courseType}</h3>
                                <h6 class="m-2">${course.description}</h6>
                            </div>
                        </div>
                    </div>




                </div>
                <div class="col-3">
                    <div style="height: 8px;"></div>
                    <div class=" d-flex flex-column align-items-center border border-dark fixed"
                        style="width: 300px; height: 820px;">

                        <div class="align-items-center m-1" style="width: 250px; height: 80px;">

                            <div class="mt-2 ml-2" id="deadline" style="display: none;">
                                ${course.deadlineDate}
                            </div>
                            <div id="countdown" class="row g-0 mt-1 text-center">
                                <div class="col border border-dark">
                                    <h2 class="mt-1" id="days"></h2>
                                    <small>Days</small>
                                </div>
                                <div class="col border border-dark">
                                    <h2 class="mt-1" id="hours"></h2>
                                    <small>Hours</small>
                                </div>
                                <div class="col border border-dark">
                                    <h2 class="mt-1" id="minutes"></h2>
                                    <small>Minutes</small>
                                </div>
                                <div class="col border border-dark">
                                    <h2 class="mt-1" id="seconds"></h2>
                                    <small>Seconds</small>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex align-items-center m-1 border border-dark"
                            style="width: 250px; height: 40px;">
                            <h6 class="m-2">SHOW DETAILS</h6>
                        </div>
                        <div class="d-flex flex-column align-items-start m-1" style="width: 250px; height: 160px;">
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
                                <a href="https://maps.google.com/?q=${course.location}"
                                    target="_blank">${course.location}</a>
                            </div>
                        </div>
                        <div class="d-flex align-items-center m-1 border border-dark"
                            style="width: 250px; height: 40px;">
                            <h6 class="m-2">TEACHER DETAILS</h6>
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
                        <div class="d-flex align-items-center m-1 border border-dark"
                            style="width: 250px; height: 40px;">
                            <h6 class="m-2">人數</h6>
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
                            <form id="registerCourseForm" action="${pageContext.request.contextPath}/registerCourse"
                                method="post" style="width: 100%; height: 100%;">
                                <input type="hidden" name="productId" value="${course.productId}" />
                                <input type="hidden" name="courseName" value="${course.courseName}" />
                                <input type="hidden" name="START_DATE" value="${course.startDate}" />
                                <button id="registerNowButton" type="submit" class="btn btn-primary custom-button"
                                    style="width: 100%; height: 100%;background-color:#B15A5E;">
                                    <h4 class=" mt-2">立即報名</h4>
                                </button>
                            </form>
                        </div>
                        
<div class="d-flex align-items-center m-1" style="width: 250px; height: 60px;" onclick="buy(${course.productId})">
    <a href="http://localhost:8080/front/order/OrderForClient.html" type="submit" class="btn btn-primary custom-button"
        style="width: 100%; height: 100%; background-color: #B15A5E;">
        <h4 class="mt-2">訂單</h4>
    </a>
</div>


                    </div>
                </div>
                         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
    crossorigin="anonymous"></script>      
                <script>

                    function calculateCountdown(deadline) {
                        const deadlineDate = new Date(deadline.replace(/-/g, "/")); // 正确格式化日期字符串以跨浏览器兼容
                        const now = new Date();
                        const timeDifference = deadlineDate.getTime() - now.getTime(); // 使用getTime()获取毫秒数

                        if (timeDifference <= 0) {
                            return "已過期";
                        }

                        const days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
                        const hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                        const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
                        const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

                        return {
                            days: days,
                            hours: hours,
                            minutes: minutes,
                            seconds: seconds
                        };
                    }

                    function updateCountdown() {
                        const deadlineElement = document.getElementById('deadline');
                        const daysElement = document.getElementById('days');
                        const hoursElement = document.getElementById('hours');
                        const minutesElement = document.getElementById('minutes');
                        const secondsElement = document.getElementById('seconds');
                        const deadline = deadlineElement.innerText.trim();
                        const countdown = calculateCountdown(deadline);

                        if (countdown === "已過期") {
                            daysElement.innerText = "";
                            hoursElement.innerText = "";
                            minutesElement.innerText = "";
                            secondsElement.innerText = "";
                            document.getElementById('countdown').innerHTML = `<div class="expired">已過期</div>`;
                            registerNowButton.disabled = true; // 禁用按钮

                        } else {
                            daysElement.innerText = countdown.days;
                            hoursElement.innerText = countdown.hours;
                            minutesElement.innerText = countdown.minutes;
                            secondsElement.innerText = countdown.seconds;
                        }
                    }

                    document.addEventListener("DOMContentLoaded", function () {
                        updateCountdown();
                        setInterval(updateCountdown, 1000); // 每秒更新一次倒计时
                    });


                </script>
                
                                <script>

                    function buy(num) {
                        var url = "http://localhost:8080/orders"; // 請求的 URL
                        console.log(num);
                        fetch("/ajaxcourseDetailsFront/" + num).then(function (response) {
                            return response.json();
                        }).then(function (data) {
                            console.log(data);

                            if (data.idUser != null) {

                                var jsonObject = {
                                    productNum: data.productId,
                                    productName: data.courseName,
                                    productPrice: data.price,
                                    productQuantity: '1',
                                    orderTotalPrice: data.price
                                };

                                console.log(jsonObject);

                                let dataTest = {
                                    "userContactNew": { "contactId": data.idUser },
                                    "orderNote": "",
                                    "orderDetails": [jsonObject]
                                };


                                // 使用 fetch 函數發送 POST 請求
                                fetch(url, {
                                    method: "POST", // 使用 POST 方法
                                    body: JSON.stringify(dataTest), // 將 JSON 數據轉換為字符串並指定為請求主體
                                    headers: new Headers({
                                        "Content-Type": "application/json", // 指定 Content-Type 為 application/json
                                    }),
                                })
                                    .then((res) => res.json()) // 解析服務器的 JSON 響應
                                    .catch((error) => {
                                        console.error("Error:", error); swal.fire("Error", "加入購物車的過程發生錯誤", "error");

                                    }) // 處理錯誤
                                    .then((response) => {
                                        console.log("Success:", response); swal.fire({ title: "已加入購物車", html: `跳轉點擊 <a href="http://localhost:8080/front/order/OrderForClient.html">結帳畫面</a>`, icon: "success" });

                                    }); // 處理成功響應
                                    

                            } else {
                                swal.fire("Error", "您尚未登入", "error");
                            }


                        }

                        );
                    }

                </script>
                
                <script>


                    $(document).ready(function () {
                        $(document).on('click', '#registerCourseForm, #mail2', function () {
                            var formId = $(this).attr('id') === 'registerCourseForm' ? '#registerCourseForm' : '#mail1';
                            var isRegisterForm = formId === '#registerCourseForm';

                            $(formId).submit(function (event) {
                                event.preventDefault(); // 先阻止默认提交行为
                                var form = $(this);

                                Swal.fire({
                                    title: isRegisterForm ? '確定要報名嗎？' : '確定要將課程收藏至Email嗎？',
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonText: '確定',
                                    cancelButtonText: '取消'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        $.ajax({
                                            type: "POST",
                                            url: form.attr("action"),
                                            data: form.serialize(),
                                            success: function (response) {

                                                Swal.fire({
                                                    title: "Success",
                                                    text: isRegisterForm ? "報名成功" : "Email 已成功發送",
                                                    icon: "success"
                                                });
                                                
                                            },
                                            error: function (xhr, status, error) {
                                                Swal.fire({
                                                    title: "Error",
                                                    text: isRegisterForm ? "報名失敗: " + "已額滿" : "Email 發送失敗: " + "請等侯再發送訊息",
                                                    icon: "error"
                                                });
                                            }
                                        });
                                    }
                                });
                            });
                        });
                    });


                    fetch('/html/basic.html')
                        .then(response => response.text())
                        .then(html => {
                            document.body.innerHTML += html;
                        });
                </script>
     <script src="/front/LoginUser.js"></script>
        </body>

        </html>