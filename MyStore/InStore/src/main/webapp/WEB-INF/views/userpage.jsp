<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Профиль</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/user.css"%>
    </style>
</head>
<body>
<%@include file="header.jsp"%>
    <div id="gallery">
        <div id="left" class="blocks">
            <img src="../../resources/images/user.jpg" alt="Наш пользователь">
            <div id="aboutuser">
                <c:if test="${not empty error}">
                    <h3 class="errInfo">${error}</h3>
                </c:if>
                <div class="user-details">
                    <h1>${user.name} ${user.surname}</h1>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('name-surname')">
                        <form:form action="/edit-user" id="name-surname" class="form" commandName="edit">
                            <form:input type="text" placeholder="Имя" value="" maxlength="45"  path="name"/>
                            <form:input type="text" placeholder="Фамилия" value="" maxlength="45" path="surname"/>
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Эл. адрес: ${user.email}</h3>
                </div>
                <div class="user-details">
                    <h3>Дата рождения: <fmt:formatDate value="${user.dateBirth}" pattern="dd-MM-yyyy"/></h3>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('date')">
                        <form:form action="/edit-user" id="date" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Дата рождения(dd-MM-yyyy)" value="" maxlength="45" path="dateBirth"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <h3>Изменить пароль</h3>
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('password')">
                        <form:form method="post" action="/edit-user" id="password" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="password" placeholder="Пароль" value="" maxlength="45" path="password"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Страна:
                        <c:if test="${user.userAddress.country !=null}">
                            ${user.userAddress.country}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('country')">
                        <form:form method="post" action="/edit-user" id="country" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Страна" value="" maxlength="45" path="userAddress.country"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Город/населенный пункт:
                        <c:if test="${user.userAddress.city !=null}">
                            ${user.userAddress.city}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('city')">
                        <form:form method="post" action="/edit-user" id="city" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Город/Населенный пункт" value="" maxlength="45" path="userAddress.city"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Почтовый код:
                        <c:if test="${user.userAddress.postalCode !=null}">
                            ${user.userAddress.postalCode}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('postalcode')">
                        <form:form method="post" action="/edit-user" id="postalcode" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Почтовый код" value="" maxlength="45" path="userAddress.postalCode"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Улица:
                        <c:if test="${user.userAddress.street !=null}">
                            ${user.userAddress.street}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('street')">
                        <form:form method="post" action="/edit-user" id="street" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Улица" value="" maxlength="45" path="userAddress.street"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Дом:
                        <c:if test="${user.userAddress.home !=null}">
                            ${user.userAddress.home}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('home')">
                        <form:form method="post" action="/edit-user" id="home" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Дом" value="" maxlength="45" path="userAddress.home"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <div class="user-details">
                    <h3>Квартира:
                        <c:if test="${user.userAddress.flat !=null}">
                            ${user.userAddress.flat}</h3>
                    </c:if>
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <img id="edit-user" class="img-form" src="../../resources/images/edit-user.png" onclick="showParam('flat')">
                        <form:form method="post" action="/edit-user" id="flat" class="form" commandName="edit">
                            <form:input type="hidden" value="${user.email}" path="email"/>
                            <form:input type="text" placeholder="Квартира" value="" maxlength="45" path="userAddress.flat"/>
                            <input class="submit" type="submit" value="Изменить">
                        </form:form>
                    </sec:authorize>
                </div>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <div id="action">
                        <h3 id="edit" onclick="edit()">Редактировать пользователя</h3>
                        <h3 id="sign_out"><a href="/j_spring_security_logout">Выйти</a></h3>
                    </div>
                </sec:authorize>
            </div>
        </div>
        <div id="right" class="blocks">
            <c:if test="${user.orders.size()!=0}">
                <h1>Мои заказы</h1>
                <c:forEach items="${user.orders}" var="order">
                    <div id="order_wrapper">
                        <img src="../../resources/images/${order.product.imagePath}.jpg" class="order">
                        <div id="desc" class="order">
                            <h3>${order.product.productName}</h3>
                            <h3>${order.amount}x${order.product.price}0&#8381</h3>
                            <h3>Способ оплаты: ${order.paymentMethod}</h3>
                            <h3>Способ доставки: ${order.deliveryMethod}</h3>
                            <h3>Cтатус оплаты: ${order.paymentStatus}</h3>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <form action="/changeOrder" method="post">
                                    <input type="hidden" name="userEmail" value="${user.email}">
                                    <input type="hidden" name="orderId" value="${(order).id}">
                                    <select name="payment_status">
                                        <option>Ожидает оплаты</option>
                                        <option>Оплачен</option>
                                    </select>
                                    <input type="submit" name="changePaymentStatus" value="Изменить" >
                                </form>
                            </sec:authorize>
                            <h3>Статус заказа: ${order.orderStatus}</h3>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <form action="/changeOrder" method="post">
                                    <input type="hidden" name="userEmail" value="${user.email}">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <select name="order_status">
                                        <option>Ожидает оплаты</option>
                                        <option>Ожидает отгрузки</option>
                                        <option>Отгружен</option>
                                        <option>Доставлен</option>
                                    </select>
                                    <input type="submit" name="changeOrderStatus" value="Изменить" >
                                </form>
                            </sec:authorize>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <%@include file="footer.jsp"%>
<script type="text/JavaScript" src="../../resources/js/jquery-3.1.1.min.js"></script>
<script type="text/JavaScript" src="../../resources/js/user.js"></script>
</body>
</html>
