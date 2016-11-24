<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>InStore</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <%--<script type="text/JavaScript" src="../../resources/js/jquery-3.1.1.min.js"></script>
    <script type="text/JavaScript" src="../../resources/js/tabs.js"></script>--%>
    <style>
        <%@include file="../../resources/css/header.css"%>
    </style>
</head>
<body>
    <header class="header">
        <div class="upper-header">
            <a href="/">
                <img src="../../resources/images/emblem.jpg" alt="Наша эмблема" id="emblem">
            </a>
            <div id="advertising">
                <img src="../../resources/images/header-image.jpg" alt="Картинка header" id="header-image" class="advertising-elem">
                <h1 class="advertising-elem">Брендов много – магазин один!</h1>
            </div>
            <div id="basket">
                <a href="/getBasket">
                    <c:choose>
                        <c:when test="${sessionScope.productId.size()==0}">
                            <img src="../../resources/images/basket-empty.jpg" alt="Наша корзина"/>
                        </c:when>
                        <c:when test="${sessionScope.productId.size()!=0}">
                            <img src="../../resources/images/basket-full.jpg" alt="Наша корзина"/>
                        </c:when>
                    </c:choose>
                </a>
            </div>
        </div>
        <div class="lower-header">
                <a href="/">
                    <h2 class="main-menu" id="main">Главная</h2>
                </a>
                <a href="/getCategory">
                    <h2 class="main-menu" id="product">Продукция</h2>
                </a>
                <a href="/user">
                    <h2 class="main-menu" id="profile">Профиль</h2>
                </a>
        </div>
    </header>
</body>
</html>