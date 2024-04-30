<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>匹配列表</h1>
    <table border="1">
        <tr>
            <th>匹配ID</th>
            <th>用戶1 ID</th>
            <th>用戶2 ID</th>
            <th>匹配日期</th>
            <th>匹配結果</th>
            <th>用戶1暱稱</th>
            <th>用戶1性別</th>
            <th>用戶1生日</th>
            <th>用戶1舞蹈性格</th>
            <th>用戶1舞齡</th>
            <th>用戶1圖片</th>
            <th>用戶2暱稱</th>
            <th>用戶2性別</th>
            <th>用戶2生日</th>
            <th>用戶2舞蹈性格</th>
            <th>用戶2舞齡</th>
            <th>用戶2圖片</th>
        </tr>
        <!-- 遍歷匹配列表，顯示每個匹配的詳細信息 -->
        <c:forEach items="${matches}" var="match">
            <tr>
                <td>${match.matchid}</td>
                <td>${match.user1id}</td>
                <td>${match.user2id}</td>
                <td>${match.matchdate}</td>
                <td>${match.matchsuccess}</td>
                <td>${match.user1NickName}</td>
                <td>${match.user1Gender}</td>
                <td>${match.user1Birthday}</td>
                <td>${match.user1DanceCharacter}</td>
                <td>${match.user1DanceAge}</td>
                <td>${match.user1Picture}</td>
                <td>${match.user2NickName}</td>
                <td>${match.user2Gender}</td>
                <td>${match.user2Birthday}</td>
                <td>${match.user2DanceCharacter}</td>
                <td>${match.user2DanceAge}</td>
                <td>${match.user2Picture}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>