<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>

    <!--Google Font : Nunito-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">

    <!-- For style(All CSS content) -->
    <link rel="stylesheet" type="text/css" href="../styles/home.css" />
    <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
    <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
    <link rel="icon" href="../images/favicon.ico">
    <link rel="stylesheet" href="../styles/Timerstyles.css" />

    <!-- JS Bundle for BS  -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
    <title>JFSwing Website</title>


</head>

<body>

    <!-- Shashank's Section -->
    <!-- <section class="title"> -->
    <!-- Navbar section -->


    <!-- Title -->
    <div class="container-fluid" style="margin-top: 150px;">
        <div id="title">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-5" id="fetchPicture">
                    <!-- <img src="https://dance-teacher.com/wp-content/uploads/2020/12/the-most-romantic-dance-movie-scenes-of-all-time.jpg"
                        class="d-block" style="width:100%"> -->
                </div>
                <div class="col-5">
                    <div id="countdown" class="countdown">

                        <div class="time">
                            <h2 id="days"></h2>
                            <small>Days</small>
                        </div>

                        <div class="time">
                            <h2 id="hours"></h2>
                            <small>Hours</small>
                        </div>

                        <div class="time">
                            <h2 id="minutes"></h2>
                            <small>Minutes</small>
                        </div>

                        <div class="time">
                            <h2 id="seconds"></h2>
                            <small>Seconds</small>
                        </div>

                    </div>
                    <table class="table table-dark table-hover">
                        <tbody id="eventTable">
                            <!-- <button onclick="getData();">取得資料</button> -->
                            <!-- fetch append表格的位置 -->
                        </tbody>
                    </table>


                    <button onclick="buy()" class="btn btn-primary">立即報名</button>



                    <form id="eventCollectionForm" action="../eventCollection" method="post">
                        <!--                         <input type="hidden" id="eventDate" name="EVENT_STARTIME" value=${data.startTime}>  -->
                        <!--                          <input type="hidden" id="eventName" name="EVENT_NAME" value=${data.eventName}> -->
                        <button class="btn btn-primary" type="submit">收藏活動到email</button>
                    </form>
                    <!-- 					<a href="/eventCollection"> -->
                    <!-- 						<button  class="btn btn-primary">收藏活動到email</button> -->
                    <!-- 					</a> -->

                </div>

                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-8">
                        <h3 class="neon-yellow">活動詳細資料</h3>
                        <div id="fetchDetails"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body >

</html >