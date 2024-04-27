<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>配對結果</title>
</head>
<body>
    <h1>配對結果</h1>
    
        <p>ID1: ${matchRecord.id1} , ID2: ${matchRecord.id2} </p>
        <img src="${matchRecord.picture}">
    
     
</body>
</html>
