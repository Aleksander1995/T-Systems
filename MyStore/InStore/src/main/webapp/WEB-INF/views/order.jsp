<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Оформить заказ</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/order.css"%>
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div id="container">
    <div id="gallery">
        <h1>Оформление заказа</h1>
        <div id="content">
            <div id="left">
                <img src="/resources/images/${product.imagePath}.jpg">
                <h2>${product.productName}</h2>
                <h2><span id="price">${product.price}</span>0 &#8381</h2>
            </div>
            <form action="/makeAnOrder" method="post">
                <input type="hidden" name="productId" value="${product.id}"/>
                <div id="right">
                        <p>Выберите количество:
                            <select name="amount" onchange="show(this.value)">
                                <c:forEach var="i" begin="1" end="${product.amount}">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>шт.
                        </p>
                        <p>Способ оплаты
                            <select name="payment_method">
                                <option>Наличный</option>
                                <option>По карте</option>
                            </select>
                        </p>
                        <p>Способ доставки
                            <select name="delivery_method">
                                <option>Самовывоз</option>
                                <option>Курьером</option>
                                <option>Экспресс-доставка</option>
                                <option>Почта России</option>
                            </select>
                        </p>
                    <h2>К оплате: <span id="payment">${product.price}</span> &#8381</h2>
                    <c:choose>
                        <c:when test="${product.amount==0}">
                            <input id="submit" type="submit" name="order" value="Заказать" disabled/>
                            <p class="errInfo">Нет в наличии</p>
                        </c:when>
                        <c:when test="${product.amount!=0}">
                            <input id="submit" type="submit" name="order" value="Заказать" />
                        </c:when>
                    </c:choose>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<script>
    <%@include file="/resources/js/order.js"%>
</script>
</body>
</html>
