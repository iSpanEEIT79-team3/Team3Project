<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        body {
            background-color: #FFDCB9;
            margin: 0;
            padding: 0;

        }


        .function {
            /*margin-left: 80px;*/
            padding-top: 15px;
            width: 15%;
            height: 98vh;
            background-color: aliceblue;
            float: left;
        }

        .user {
            margin: 0 15px 15px 15px;
            font-size: 20px;
        }

        .find {
            width: 200px;
            height: 35px;
            margin-left: 25px;

            font-weight: bold;
            text-indent: 35px;
            font-size: 30px;
            border-radius: 5px;
        }

        .option {
            margin: 15px;
            padding-left: 35px;
            font-size: 30px;

            border-bottom: 1px solid black;
        }

        a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #FFDC35;
            font-size: 1.2em;
        }

        .signOut {
            margin-top: 150px;
            margin-left: 40px;
        }

        .signOut button {

            width: 70px;
            height: 50px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 45px;
            transition: background-color 0.3s ease;
        }
        .signOut button:hover {
    		background-color: #2980b9; 
    		transform: scale(1.2);
		}
		 /* 按鈕樣式 */
  .button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    background-color: #ff7f00; /* 藍色 */
    color: #fff; /* 白色 */
    border: none;
    cursor: pointer;
  }

  /* 按鈕滑鼠懸停效果 */
  .button:hover {
    background-color: #cc6600; /* 懸停時深藍色 */
  }
    </style>



</head>
<body>
<form>

<h1>刪除成功</h1>
<div class="button" style="text-align: center; margin-top: 30px;">
    <a href="./jsp/back.jsp"> 返回首頁</a>
</div>
</form>
</body>
</html>