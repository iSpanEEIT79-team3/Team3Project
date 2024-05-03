<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1>User List</h1>
    <ul id="userList">
        <!-- 這裡將動態插入用戶列表 -->
    </ul>

    <script>
        $(document).ready(function(){
            $.ajax({
                url: "/GetAllUser2", // 您的後端端點
                type: "GET",
                dataType: "json",
                success: function(response){
                    // 在成功回調中處理返回的用戶列表
                    var userList = $("#userList");
                    $.each(response, function(index, user){
                        // 構建每個用戶的 HTML
                        var userHtml = "<li>";
                        userHtml += "<img src='" + user.picture + "' alt='User Image'>"; // 顯示用戶圖片
                        userHtml += "<p>Nickname: " + user.nickName + "</p>"; // 顯示用戶暱稱
                        userHtml += "<p>Gender: " + user.gender + "</p>"; // 顯示用戶性別
                        userHtml += "<p>Birthday: " + user.birthday + "</p>"; // 顯示用戶生日
                        userHtml += "<p>Dance Character: " + user.danceCharacter + "</p>"; // 顯示用戶舞蹈特色
                        userHtml += "<p>Dance Age: " + user.danceAge + "</p>"; // 顯示用戶舞蹈年資
                        userHtml += "</li>";
                        userList.append(userHtml); // 插入用戶項目到列表中
                    });
                },
                error: function(xhr, status, error){
                    console.error("Error fetching user list:", error);
                }
            });
        });
    </script>
</body>
</html>
