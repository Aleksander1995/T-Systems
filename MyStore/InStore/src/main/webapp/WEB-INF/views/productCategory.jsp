<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Наша продукция</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/ourproducts.css"%>
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <div id="gallery">
        <h1>Наша продукция</h1>
        <div id="ourProducts">

            <c:forEach items="${ourproducts}" var="product">
                <a href="/getProductByCategory?parameter=${product.category}">
                    <%--<input type="hidden" name="parameter" value=""/>--%>
                    <div id="productCategory">
                        <img src="/resources/images/${product.imagePath}.jpg" class="img_ourProducts">
                        <br>
                        <figcaption>${product.category}</figcaption>
                    </div>
                </a>
           </c:forEach>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
