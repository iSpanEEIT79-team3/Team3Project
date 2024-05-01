<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8" isErrorPage="true"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動資訊</title>
<style>
img{
	 max-width: 150px; /* 最大寬度 */
    max-height: 150px; /* 最大高度 */
    width: auto; /* 自動調整寬度 */
    height: auto; /* 自動調整高度 */
	}
</style>


</head>
<body style="bakground-color:#fdf5e6">
<div align="center">
<h2>活動資訊</h2>
<form method="post" action="${pageContext.request.contextPath}/WSupdate" enctype="multipart/form-data">
    <input type="hidden" name="_method" value="put"/>
    <jsp:useBean id="eventBean" scope="request" class="com.mmmooonnn.model.Event"/>
    <table>
        <tr>
            <td>活動編號</td>
            <td><input style="background-color: #7B7B7B;" type="text" value="${eventBean.eventId}" readonly name="PRODUCTID"></td>
        </tr>
        <tr>
            <td>活動名稱</td>
            <td><input type="text" value="${eventBean.eventName}" name="EVENT_NAME"></td>
        </tr>
         <tr>
            <td>報名開始日期</td>
            <td><fmt:formatDate value="${eventBean.signupStartime}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedSignupStartime" /><input type="text" value="${formattedSignupStartime}" name="SIGNUP_STARTIME"></td>
        </tr>
        <tr>
            <td>報名結束日期</td>
            <td><fmt:formatDate value="${eventBean.signupEndtime}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedSignupEndtime" /><input type="text" value="${formattedSignupEndtime}" name="SIGNUP_ENDTIME"></td>
        </tr>
        <tr>
            <td>活動開始時間</td>
            <td><fmt:formatDate value="${eventBean.startTime}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedStartTime" /><input type="text" value="${formattedStartTime}" name="EVENT_STARTIME"></td>
        </tr>
        <tr>
            <td>活動結束時間</td>
            <td><fmt:formatDate value="${eventBean.endTime}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedEndTime" /><input type="text" value="${formattedEndTime}" name="EVENT_ENDTIME"></td>
        </tr>
        <tr>
            <td>活動詳細資料</td>
            <td><input type="text" value="${eventBean.eventDetail}" name="EVENT_DETAIL"></td>
        </tr>
        <tr>
            <td>活動種類</td>
            <td><input type="text" value="${eventBean.eventCategory}" name="EVENT_CATEGORY"></td>
        </tr>
        <tr>
            <td>報名金額</td>
            <td><input type="text" value="${eventBean.eventPrice}" name="EVENT_PRICE"></td>
        </tr>
        <tr>
            <td>活動地址</td>
            <td><input type="text" value="${eventBean.eventLocation}" name="EVENT_ADDRES"></td>
        </tr>
        <tr>
            <td>組織者</td>
            <td><input type="text" value="${eventBean.organizer}" name="ORGANIZER"></td>
        </tr>
        <tr>
            <td><img alt="" src="${eventBean.picture}"></td>
        </tr>
        <tr>
            <td><input type="file" name="PICTURE"></td>
        </tr>
    </table>
    <!-- 	 <div class="img"> -->
<%--             <img class="imgInput" src="<%= eventBean.getPicture()%>" alt=""> --%>
<!--         </div> -->
<!--         <div> -->
<!--             <label for="fileInput" class="custom-file-button">選擇照片</label> -->
<!--         </div> -->
    
    <input type="hidden" value="${eventBean.picture}" name="oldPICTUREpath" >
    <button name="type" value="upData">確定</button>
</form>

</div>

</body>
</html>