<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Войти</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="/resources/css/stafflogin.css"%>
    </style>
</head>
<body>
    <div id="loginIn">
        <a href="/">
            <img src="../../resources/images/emblem.jpg" alt="InStoreLog">
        </a>
        <form action="/logininstaff" method="post">
            <input type="text" name="entryEmail" placeholder="Эл. адрес" maxlength="45"/>
            <input type="password" name="entryPassword" placeholder="Пароль" maxlength="45"/>
            <input type="submit" name="signinStaff" value="Войти" id="entrysubmit"/>
        </form>
        <p class="errInfo">${info}</p>
    </div>
</body>
</html>
