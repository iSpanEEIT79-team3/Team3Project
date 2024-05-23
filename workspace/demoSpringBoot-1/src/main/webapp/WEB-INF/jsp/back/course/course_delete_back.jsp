<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>刪除成功</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <style>
                body {
                    background-color: #f8f9fa;
                }

                .container {
                    max-width: 600px;
                    margin-top: 50px;
                    background: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    text-align: center;
                }

                h1 {
                    font-family: 'Nunito', sans-serif;
                    font-weight: 700;
                    margin-bottom: 20px;
                }

                .btn-primary {
                    font-weight: 600;
                    border-radius: 50px;
                    padding: 10px 20px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1>刪除成功</h1>
                <button class="btn btn-primary index">回課程資料表</button>
            </div>
            <script>
                const index = document.querySelector('.index')
                index.addEventListener('click', function () {
                    location.href = 'http://localhost:8080/GetAllCourses'
                })
            </script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: 'exampleBack.html',
                        dataType: 'html',
                        success: function (data) {
                            $('body').append(data);
                            $('#sampleTable').DataTable();
                        },
                        error: function () {
                            console.error('Failed to load HTML file');
                        }
                    });
                });
            </script>
        </body>

        </html>