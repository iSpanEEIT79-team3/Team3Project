<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8" isErrorPage="true"%>
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
	<tr><td>活動編號
		<td><input style="background-color: #7B7B7B; "type="text"   value="<%= eventBean.getEventId() %>" readonly name="PRODUCTID">
	<tr><td>活動名稱<td><input type="text" value="<%= eventBean.getEventName() %>" name="EVENT_NAME">
	<tr><td>報名開始日期<td><input type="text"  value="<%=eventBean.getSignupStartime() %>" name="SIGNUP_STARTIME">
	<tr><td>報名結束日期<td><input type="text"  value="<%=eventBean.getSignupEndtime()%>" name="SIGNUP_ENDTIME">
	<tr><td>活動開始時間<td><input type="text" value="<%=eventBean.getStartTime()%>" name="EVENT_STARTIME">
	<tr><td>活動結束時間<td><input type="text" value="<%=eventBean.getEndTime()%>" name="EVENT_ENDTIME">
	<tr><td>活動詳細資料<td><input type="text" value="<%=eventBean.getEventDetail()%>" name="EVENT_DETAIL">
	<tr><td>活動種類<td><input type="text" value="<%= eventBean.getEventCategory()%>" name="EVENT_CATEGORY">
	<tr><td>報名金額<td><input type="text" value="<%= eventBean.getEventPrice()%>" name="EVENT_PRICE">
	<tr><td>活動地址<td><input type="text" value="<%=eventBean.getEventLocation()%>" name="EVENT_ADDRES">
	<tr><td>組織者<td><input type="text" value="<%= eventBean.getOrganizer()%>" name="ORGANIZER">
	<tr><td><img alt="" src="<%= eventBean.getPicture()%>"></td></tr>
	<tr><td><input type="file" name="PICTURE"></td></tr>
<!-- 	 <div class="img"> -->
<%--             <img class="imgInput" src="<%= eventBean.getPicture()%>" alt=""> --%>
<!--         </div> -->
<!--         <div> -->
<!--             <label for="fileInput" class="custom-file-button">選擇照片</label> -->
<!--         </div> -->
	</table>
	
	<input type="hidden" value="<%= eventBean.getPicture()%>" name="oldPICTUREpath" >
	<button name="type" value="upData">確定</button>
</form>
</div>

</body>
</html>