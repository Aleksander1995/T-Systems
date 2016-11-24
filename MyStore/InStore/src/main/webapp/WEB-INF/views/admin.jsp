<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Админ</title>
    <link rel="shortcut icon" href="/resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="/resources/css/admin.css"%>
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <div id="gallery">
        <h1>Администратор</h1>
        <div id="wrapper">
            <div id="left" class="blocks">
                <div id="aboutuser">
                    <h1>${user.name} ${user.surname}</h1>
                    <h2>Эл. адрес: ${user.email}</h2>
                    <h2 id="sign_out">
                        <a href="/j_spring_security_logout">Выйти</a>
                    </h2>
                </div>
            </div>
            <div id="right" class="blocks">
                <h2 id="orders">К заказам</h2>
                <form:form method="post" action="/finduser" commandName="findUser">
                    <form:input type="text" name="findEmailByStaff" placeholder="Введите email клиента" value="" maxlength="45" path="email" required="required"/>
                    <input id="findClient" class="submit" type="submit" value="Найти">
                </form:form>
                <c:if test="${not empty errorUser}">
                    <h3 class="errInfo">${errorUser}</h3>
                </c:if>
                <h2 id="products">Добавить товар</h2>
                <form:form method="post" action="/addproduct" commandName="product">
                    <form:input type="text" placeholder="Наименование товара" value="" maxlength="45" path="productName" required="required"/>
                    <form:input type="text" placeholder="Цена, *.00р." value="" maxlength="" path="price" required="required"/>
                    <form:input type="text" placeholder="Категория" value="" maxlength="45" path="category" required="required"/>
                    <form:input type="text" placeholder="Вес, *грамм" value="" maxlength="11"  path="weight" required="required"/>
                    <form:input type="text" placeholder="Объем, AxBxC" value="" maxlength="45" path="volume" required="required"/>
                    <form:input type="text" placeholder="Количество, шт." value="" maxlength="11" path="amount" required="required"/>
                    <form:input type="text" placeholder="Путь к картинке(категория_имя товара_id товара)" value="" maxlength="45" path="imagePath" required="required"/>
                    <form:input type="text" placeholder="Бренд" value="" maxlength="45" path="option.brand" required="required"/>
                    <form:input type="text" placeholder="Цвет" value="" maxlength="45" path="option.color" required="required"/>
                    <form:input type="text" placeholder="Параметры" value="" maxlength="199" path="option.info" required="required"/>
                    <input id="addProduct" class="submit" name="addProduct" type="submit" value="Добавить">
                </form:form>
                <c:if test="${not empty errorProduct}">
                    <c:forEach items="${errorProduct}" var="msg">
                        <p class="errInfo">${msg.defaultMessage}</p>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty success}">
                    <p class="errInfo">${success}</p>
                </c:if>
            </div>
        </div>
    </div>
<%@include file="footer.jsp"%>
<%--<script>
 /* /!*!/!*  <%@include file="/resources/js/client.js"%>*!/!*!/*/
</script>--%>
</body>
</html>
