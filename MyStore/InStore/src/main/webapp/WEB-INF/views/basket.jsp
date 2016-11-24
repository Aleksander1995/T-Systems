<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Корзина</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/basket.css"%>
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
        <div id="gallery">
            <h1>Корзина</h1>
            <div id="content">
                <c:forEach items="${products}" var="product">
                    <div id="product_wrapper">
                        <div>
                            <h2 id="productName">${product.productName}</h2>
                        </div>
                        <div>
                            <img src="/resources/images/${product.imagePath}.jpg" class="product">
                        </div>
                        <div>
                            <h2 class="product">${product.price}0 &#8381</h2>
                        </div>
                        <form action="/order" method="post">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="submit" id="order" name="order" value="Оформить заказ"/>
                        </form>
                        <form action="/deletefrombasket" method="post">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="submit" id="remove" name="remove" value="Удалить заказ"/>
                        </form>
                    </div>
                </c:forEach>
            </div>

    </div>
</body>
</html>
