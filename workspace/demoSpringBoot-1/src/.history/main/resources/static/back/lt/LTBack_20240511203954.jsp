<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="description"
        content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>JFSwing後台</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../back/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="app sidebar-mini rtl pace-done">
    <main class="app-content">
        <div class="app-title">
            <h1>大標題</h1>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-title">
                        <!-- <h2>小標題</h2> -->
                    </div>
                    <div class="tile-body">ㄎㄎㄎㄎ


                    </div>
                </div>
            </div>
        </div>


    </main>


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



        function RWDTest() {
            //let RWD = document.getElementsByClassName("RWDTest");
            let RWD = document.body;
            if (RWD.className === "app sidebar-mini rtl sidenav-toggled pace-done") {
                RWD.className = "app sidebar-mini rtl pace-done";
            } else {
                RWD.className = "app sidebar-mini rtl sidenav-toggled pace-done";
            }
        }

    </script>

</body>

</html>