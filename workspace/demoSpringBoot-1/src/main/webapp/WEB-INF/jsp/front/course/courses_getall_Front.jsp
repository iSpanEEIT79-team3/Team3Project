<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Bootstrap CSS -->
            <!-- 引入Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!--Google Font : Nunito-->
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">
            <!-- Font Awesome icons (free version)-->
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <!-- For style(All CSS content) -->
            <link rel="stylesheet" type="text/css" href="../styles/home.css" />
            <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
            <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
            <link rel="icon" href="images/favicon.ico">
            <link href="../Course_All/css/styles.css" rel="stylesheet" />

            <!-- JS Bundle for BS  -->
            <!-- 引入JQuery -->
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
                integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
                crossorigin="anonymous"></script>

            <style>
                .main {
                    min-height: 55vh;
                }

                .course-image {
                    max-width: 88px;
                    /* Set the maximum width */
                    max-height: 88px;
                    /* Set the maximum height */
                    /* Add other styles as needed */
                }

                .lt-container {
                    overflow: auto;
                    /* 清除浮动 */
                }

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
                    border: 0;
                    background-color: #4f85a6;
                    color: #fff;
                    border-radius: 10px;
                    padding: 8px 16px;
                    cursor: pointer;
                }

                input:hover,
                button:hover {
                    text-decoration: none;
                    /* Removes underline from links */
                }

                .table {
                    padding: 3px;
                }

                .separator {
                    width: 1px;
                    height: 22px;
                    background-color: #808080;
                    margin: 0 10px;
                    /* 可以调整线的左右间距 */
                }

                .hotclass {
                    border-radius: 30px;
                }

                .smallbox {
                    border-radius: 12px;
                }

                .card {
                    width: 100%;
                }

                /* Media query for screens smaller than 576px */
                @media (max-width: 576px) {
                    /* Your styles for small screens go here */
                }

                /* Media query for screens smaller than 768px */
                @media (max-width: 767px) {
                    /* Your styles for medium screens go here */
                }

                /* Media query for 1024px wide screens */
                @media (min-width: 1024px) {
                    .hot {
                        width: 572px;
                        height: 319px;
                    }
                }

                /* Media query for 1440px wide screens */
                @media (min-width: 1440px) {
                    .hot {
                        width: 600px;
                        height: 336px;
                    }
                }
            </style>
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
            <!-- 引入Bootstrap的JavaScript（在jQuery之后加载） -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
                crossorigin="anonymous"></script>


        </head>

        <body>




            <!-- 熱門課程 -->
            <div class="container">
                <div style="height:120px;"></div>
                <div class="d-flex">
                    <h2 class="section-heading text-uppercase">熱門課程</h2>
                    <div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
                    <h6 class="d-flex align-items-center">一段美好的開始</h3>
                </div>

                <div class="d-flex justify-content-center text-center" style="width: 1900px; height: 400px;">
                    <div class="ratio mx-2" style="width: 600px;">
                        <a href="${pageContext.request.contextPath}/courseDetailsFront/200004" target="_blank">
                            <img id="courseImage200004" src="../images/hot1.jpg"
                                class="img-fluid object-fit-cover rounded-5" alt="Image 1" />
                            <div class="z-n1 d-none">
                                <h6>200004</h6>
                            </div>
                        </a>
                    </div>
                    <div class="ratio mx-2" style="width: 600px;">
                        <a href="${pageContext.request.contextPath}/courseDetailsFront/200005" target="_blank">
                            <img id="courseImage200005" src="../images/hot2.jpg"
                                class="img-fluid object-fit-cover rounded-5" alt="Image 2" />
                            <div class="z-n1 d-none">
                                <h6>200005</h6>
                            </div>
                        </a>
                    </div>
                    <div class="ratio mx-2" style="width: 600px;">
                        <a href="${pageContext.request.contextPath}/courseDetailsFront/200006" target="_blank">
                            <img id="courseImage200006" src="../images/hot3.jpg"
                                class="img-fluid object-fit-cover rounded-5" alt="Image 3" />
                            <div class="z-n1 d-none">
                                <h6>200006</h6>
                            </div>
                        </a>
                    </div>
                </div>



                <div class="container mb-1">
                    <div class="d-flex">
                        <h2 class="section-heading text-uppercase">專業師資</h2>
                        <div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
                        <h6 class="d-flex align-items-center">看看學員們怎麼說</h3>
                    </div>
                </div>
                <!-- 直視圖片區 -->
                <div class="row d-flex">
                    <div class="col-md-3">
                        <div class="product-item rounded-3 bs-secondary-color"
                            style="background-color: #F5F7F9; height: 500px;">
                            <div class="product-thumb" style="height: 70%; overflow: hidden;">
                                <a href="#">
                                    <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
                                        src="../images/dancer1.jpg" alt="product-img"
                                        style="height: 100%; object-fit: cover;">
                                </a>
                            </div>
                            <div class="product-content m-3"
                                style="height: 30%; display: flex; flex-direction: column; justify-content: center;">
                                <p>帶來如詩如畫的舞蹈饗宴，展現優雅和美麗。</p>
                                <h4>Carlos Martinez</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="product-item rounded-3 bs-secondary-color"
                            style="background-color: #F5F7F9; height: 500px;">
                            <div class="product-thumb" style="height: 70%; overflow: hidden;">
                                <a href="#">
                                    <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
                                        src="../images/Teacher5.jpg" alt="product-img"
                                        style="height: 100%; object-fit: cover;">
                                </a>
                            </div>
                            <div class="product-content m-3"
                                style="height: 30%; display: flex; flex-direction: column; justify-content: center;">
                                <p>讓每個人都感受到舞蹈的力量，舞動人生。</p>
                                <h4>Michael Johnson</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="product-item rounded-3 bs-secondary-color"
                            style="background-color: #F5F7F9; height: 500px;">
                            <div class="product-thumb" style="height: 70%; overflow: hidden;">
                                <a href="#">
                                    <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
                                        src="../images/Teacher6.jpg" alt="product-img"
                                        style="height: 100%; object-fit: cover;">
                                </a>
                            </div>
                            <div class="product-content m-3"
                                style="height: 30%; display: flex; flex-direction: column; justify-content: center;">
                                <p>如飄逸的雲彩般，輕盈而自由地穿越舞台。</p>
                                <h4>Emily Davis</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="product-item rounded-3 bs-secondary-color"
                            style="background-color: #F5F7F9; height: 500px;">
                            <div class="product-thumb" style="height: 70%; overflow: hidden;">
                                <a href="#">
                                    <img class="z-1 object-fit-cover w-100 h-100 img-responsive"
                                        src="../images/dancer4.jpg" alt="product-img"
                                        style="height: 100%; object-fit: cover;">
                                </a>
                            </div>
                            <div class="product-content m-3"
                                style="height: 30%; display: flex; flex-direction: column; justify-content: center;">
                                <p>韻律的大師，她熟練掌握著每一個節奏。</p>
                                <h4>Jessica Brown</h4>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- 各種索引搜尋 -->




                <!--課程等級-->
                <section class="page-section rounded-3" id="portfolio">
                    <div class="container">

                        <div class="d-flex container mt-5" style="height:30px;">
                            <div class="smallbox border border-dark m-2" style="width: 60px;height:30px;"
                                id="sortByDate">
                                <h5 class="text-center m-1">日期</h5>
                            </div>
                            <div class="smallbox border border-dark m-2" style="width: 82px;height:30px;"
                                id="searchBasic">
                                <h5 class="text-center m-1">基礎課</h5>
                            </div>
                            <div class="smallbox border border-dark m-2" style="width: 150px;height:30px;"
                                id="filterDate">
                                <h5 class="text-center m-1">更多篩選條件</h5>
                            </div>
                            <div class="smallbox border border-dark m-2" style="width: 82px;height:30px;"
                                id="searchIntermediate">
                                <h5 class="text-center m-1">中級課</h5>
                            </div>
                        </div>

                        <div style="height: 50px;"></div>

                        <div class="d-flex">
                            <h2 class="section-heading text-uppercase">難度分級</h2>
                            <div class="separator d-flex align-items-center m-3"></div> <!-- 這是分隔線 -->
                            <h6 class="d-flex align-items-center">為每一個學員量身訂做</h6>
                        </div>
                        <!-- 循環開始前，確保結構正確並且只包裹一次 -->
                        <div class="row">
                            <c:forEach items="${Courses}" var="course">
                                <div class="col-4 col-lg-4 col-sm-6 mb-4">
                                    <div class="portfolio-item">
                                        <!-- 隱藏起來 -->
                                        <div class="z-n1 d-none">
                                            <h6>${course.productId}</h6>
                                        </div>
                                        <a class="portfolio-link"
                                            href="${pageContext.request.contextPath}/courseDetailsFront/${course.productId}">
                                            <div class="portfolio-hover">
                                                <div class="portfolio-hover-content">
                                                    <i class="fas fa-plus fa-3x"></i>
                                                </div>
                                            </div>
                                            <img class="img-fluid" src="${course.courseImage}" alt="..." />
                                        </a>
                                        <div class="portfolio-caption">
                                            <h4>${course.courseName}</h4>
                                            <h5>${course.startDate}~${course.endDate}</h5>
                                            <h6>${course.description}</h6>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>


            </div>





            <!-- Optional JavaScript; choose one of the two! -->
            <script>
                $(document).ready(function () {
                    let sortOrder = 'asc';

                    function fetchCourses(filter = {}) {
                        $.ajax({
                            url: '/getCourses',
                            method: 'GET',
                            data: filter,
                            success: function (courses) {
                                let coursesContainer = $('#topCourses');
                                coursesContainer.empty();
                                courses.forEach(course => {
                                    let courseHtml = `
                            <div class="active ratio" style="width: 600px;">
                                <img src="${course.courseImage}" class="d-block object-fit-cover rounded-5 mx-auto my-auto"
                                     style="width: auto; height: auto; max-width: 100%; max-height: 100%;" alt="${course.courseName}" />
                                <div class="card-body">
                                    <h5 class="card-title">${course.courseName}</h5>
                                    <p class="card-text">${course.description}</p>
                                    <p class="card-text"><small class="text-muted">Enrollment: ${course.enrollmentCount}/${course.maxCapacity}</small></p>
                                </div>
                            </div>
                        `;
                                    coursesContainer.append(courseHtml);
                                });
                            },
                            error: function (error) {
                                console.error('Error fetching courses:', error);
                            }
                        });
                    }

                    $('#sortByDate').click(function () {
                        sortOrder = sortOrder === 'asc' ? 'desc' : 'asc';
                        fetchCourses({ sortBy: 'date', order: sortOrder });
                    });

                    $('#searchBasic').click(function () {
                        fetchCourses({ search: '基礎' });
                    });

                    $('#searchIntermediate').click(function () {
                        fetchCourses({ search: '中級' });
                    });

                    $('#filterDate').click(function () {
                        Swal.fire({
                            title: '選擇日期範圍',
                            html: '<input type="date" id="startDate" class="swal2-input" placeholder="開始日期">' +
                                '<input type="date" id="endDate" class="swal2-input" placeholder="結束日期">',
                            confirmButtonText: '確認',
                            focusConfirm: false,
                            preConfirm: () => {
                                const startDate = Swal.getPopup().querySelector('#startDate').value;
                                const endDate = Swal.getPopup().querySelector('#endDate').value;
                                return { startDate: startDate, endDate: endDate };
                            }
                        }).then((result) => {
                            fetchCourses({ startDate: result.value.startDate, endDate: result.value.endDate });
                        });
                    });

                    // Initial fetch
                    fetchCourses();
                });
            </script>
            <script>
                fetch('/html/basic.html')
                    .then(response => response.text())
                    .then(html => {
                        document.body.innerHTML += html;
                    });
            </script>


            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
                crossorigin="anonymous"></script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->

        </body>

        </html>