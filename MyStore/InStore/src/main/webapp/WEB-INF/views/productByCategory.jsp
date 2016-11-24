<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${(products.get(0)).category}</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/categoryproducts.css"%>
    </style>
</head>
<body>
   <%@include file="header.jsp"%>
    <div id="container">
        <div id="filter">
            <form>
                <label class="product_filter">Бренд:
                    <input type="text" id="brand" class="form-control" placeholder="brand...">
                </label>
                <label class="product_filter">Цвет:
                    <input type="text" id="color" class="form-control" placeholder="color...">
                </label>
                <label class="product_filter">Цена:
                    <input type="text" id="price-from" class="form-control" placeholder="from...">
                    <input type="text" id="price-to" class="form-control" placeholder="to...">
                </label>
            </form>
            <div id="brandList">

            </div>
        </div>
        <div id="gallery">
            <h1>${(products.get(0)).category}</h1>
            <div id="сategoryProducts" >
                <c:forEach items="${products}" var="product">
                <div class="categoryProduct">
                    <%--<hr>--%>
                    <div class="product_wrapper">
                        <h2 class="pr">${(product).productName}</h2>
                        <img src="../../resources/images/${(product).imagePath}.jpg" id="image">
                    </div>
                    <div class="product_wrapper">
                        <h2>Параметры</h2>
                        <p>${(product).option.info}, <span class="colors">Цвет: ${(product).option.color}.</span></p>
                    </div>
                    <div class="product_wrapper">
                        <h2><span class="price">${(product).price}</span>0 &#8381</h2>
                        <div id="forBasket${product.id}">
                            <img src="../../resources/images/basket-add.png" onclick="sendId(${(product).id})" class="basket2">
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
   <%@include file="footer.jsp"%>
   <script type="text/JavaScript" src="../../resources/js/jquery-3.1.1.min.js"></script>
   <script type="text/JavaScript" src="../../resources/js/categoryproducts.js"></script>
</body>
</html>
