<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Like Page</title>
    <style>
        .like-button {
            background-color: #87CEEB;
            color: white;
            padding: 10px 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            transition: none;
            outline: none;
        }

        .like-button:hover {
            background-color: #4DFFFF;
        }
    </style>
</head>
<body>
111111

    <input type="hidden" id="userId" value="${userId}">

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 获取所有的按赞按钮
            var likeButtons = document.querySelectorAll('.like-button');

            // 获取隐藏字段中的 userId 值
            var userId = document.getElementById('userId').value;

            // 遍历每个按赞按钮，为其添加点击事件监听器
            likeButtons.forEach(function(button) {
                button.addEventListener('click', function(event) {
                    event.preventDefault();

                    // 获取文章ID
                    var articleId = button.getAttribute('data-article-id');

                    // 向后端发送按赞请求
                    fetch('/Likeinsert.controller', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'userId=' + userId + 'ltId=' 
                    })
                    .then(response => response.text())
                    .then(result => {
                        // 处理后端的响应，例如刷新页面或者显示提示信息
                        console.log(result);
                    })
                    .catch(error => console.error('Error:', error));
                });
            });
        });
    </script>
</body>
</html>
