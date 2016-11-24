<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>InStore</title>
    <link rel="shortcut icon" href="../../resources/images/icon.png" type="image/x-icon">
    <style>
        <%@include file="../../resources/css/start.css"%>
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="container">
        <div class="slider">
            <input type="radio" id="radio1" name="slider" checked="checked"/>
            <label for="radio1" class="switcher"></label>
            <div class="slide"><img src="../../resources/images/slider_1.jpg"/></div>

            <input type="radio" id="radio2" name="slider"/>
            <label for="radio2" class="switcher"></label>
            <div class="slide"><img src="../../resources/images/slider_2.jpg"/></div>

            <input type="radio" id="radio3" name="slider"/>
            <label for="radio3" class="switcher"></label>
            <div class="slide"><img src="../../resources/images/slider_3.jpg"/></div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <script type="text/JavaScript" src="../../resources/js/start.js"></script>
</body>
</html>
