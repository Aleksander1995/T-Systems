<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <title>InStore</title>
    <style>
        <%@include file="../../resources/css/authstyle.css"%>
    </style>
</head>
<body>
<div id="wrap" style="display: none;" onclick="show('none')"></div>
<div id="loginIn">
    <img src="../../resources/images/emblem.jpg" alt="InStoreLog">
    <form:form action="/loginin" method="post" commandName="logIn">
        <form:input type="text" placeholder="Эл. адрес"  path="email"  maxlength="45" required="required"/>
        <form:input type="password" placeholder="Пароль" path="password"  maxlength="45" required="required"/>
        <input type="submit" name="signin" value="Войти" id="entrysubmit"/>
    </form:form>
</div>
<div class="container">
    <div class="reg-image">
        <div id="image">
            <img src="../../resources/images/slider_1.jpg" alt="InStore" class="img">
        </div>
        <div id="reg-form">
            <div id="reg_part_one">
                <a href="/">
                    <img src="../../resources/images/emblem.jpg" alt="InStoreLog" class="img">
                </a>
                <h3>Зарегистрируйтесь, чтобы купить товар.</h3>
                <div id="forms">
                    <form:form action="/checkin" method="post" commandName="checkIn">
                        <form:input type="text" name="email" placeholder="Эл. адрес" value="" maxlength="45" path="email" required="required"/>
                        <form:input type="text" name="name" placeholder="Имя" value="" maxlength="45" path="name" equired="required"/>
                        <form:input type="text" name="surname" placeholder="Фамилия" value="" maxlength="45" path="surname" required="required"/>
                        <form:input type="text" name="datebirth" placeholder="Дата рождения(dd-MM-yyyy)" value="" maxlength="45" path="dateBirth" required="required"/>
                        <form:input type="password" name="password" placeholder="Пароль" value="" maxlength="45" path="password" required="required"/>
                        <input id="submit" name="register" type="submit" value="Продолжить">
                    </form:form>
                </div>
                <c:if test="${not empty errorINFO}">
                    <c:forEach items="${errorINFO}" var="msg">
                        <p class="errInfo">${msg.defaultMessage}</p>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty error}">
                    <p class="errInfo">${error}</p>
                </c:if>
                <p class="">Регистрируясь, вы соглашаетесь с нашими <b>Условиями и Политикой конфиденциальности</b></p>
            </div>
            <div id="reg_part_two">
                <p>Есть аккаунт?</p>
                <h3 id="signIn" onclick="show('block')">Вход</h3>
            </div>
        </div>
    </div>
</div>
<script>
    <%@include file="/resources/js/authscript.js"%>
</script>
</body>
</html>
