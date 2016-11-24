<%--
  Created by IntelliJ IDEA.
  User: alex1_000
  Date: 22.11.2016
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Внимание</title>
    <style>
        <%@include file="../../resources/css/access-denied.css"%>
    </style>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
</head>
<body>
    <%@include file="header.jsp"%>
    <div id="wrapper">
        <h1>Данный пользователь не имеет доступ к  этой странице</h1>
        <h1>Пожалуйста, войдите под другим пользователем</h1>
        <h1><a href="/j_spring_security_logout">Выйти</a></h1>
    </div>
</body>
</html>
