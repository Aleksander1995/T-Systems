<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${staff.staffName}</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="/resources/css/admin.css"%>
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div id="container">
    <div id="gallery">
        <div id="left" class="blocks">
            <div id="aboutuser">

                <h1>${staff.staffName} ${staff.staffSurname}</h1>
                <h3>Эл. адрес: ${staff.staffEmail}</h3>
                <h3>Дата рождения: ${staff.staffDateBirth}</h3>

                <h3 id="sign_out">
                    <a href="">Выйти</a>
                </h3>
            </div>

        </div>
        <div id="right" class="blocks">

            <h2 id="orders">К заказам</h2>
            <form method="get" action="/user">
                <input type="text" name="findEmailByStaff" placeholder="Введите email клиента" value="" maxlength="45">
                <input id="findClient" class="submit" type="submit" value="Найти">
            </form>
            <c:if test="${errorINFO!=null}">
                <p class="errInfo">${errorINFO}</p>
                <c:set var="errNotFound" scope="session" value="${null}"/>
            </c:if>

            <h2 id="products">Добавить товар</h2>
            <form method="post" action="/products">
                <input type="text" name="productName" placeholder="Наименование товара" value="" maxlength="45">
                <input type="text" name="price" placeholder="Цена, *.00р." value="" maxlength="">
                <input type="text" name="category" placeholder="Категория" value="" maxlength="45">
                <input type="text" name="weight" placeholder="Вес, *грамм" value="" maxlength="11" >
                <input type="text" name="volume" placeholder="Объем, AxBxC" value="" maxlength="45">
                <input type="text" name="amount" placeholder="Количество, шт." value="" maxlength="11">
                <input type="text" name="imagePath" placeholder="Путь к картинке(категория_имя товара_id товара)" value="" maxlength="45">
                <input type="text" name="brand" placeholder="Бренд" value="" maxlength="45">
                <input type="text" name="color" placeholder="Цвет" value="" maxlength="45">
                <input type="text" name="info" placeholder="Параметры" value="" maxlength="199">
                <input id="addProduct" class="submit" name="addProduct" type="submit" value="Добавить">
            </form>
            <c:if test="${errInfo!=null}">
                <p class="errInfo">${errInfo}</p>
                <c:set var="errInfo" scope="session" value="${null}"/>
            </c:if>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<%--<script>
 /* /!*!/!*  <%@include file="/resources/js/user.js"%>*!/!*!/*/
</script>--%>
</body>
</html>
