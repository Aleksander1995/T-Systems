<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
  <title>Index Page</title>
</head>

<body>
Hello
<sec:authorize access="hasRole('ROLE_USER')">
  <h1>Hello User</h1>
  <h1>${user.name}</h1>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
  <h1>Hello Admin</h1>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
  <h1>Hello User yeap</h1>
  <h1>${user.email}</h1>
</sec:authorize>
<a href="/j_spring_security_logout">выход</a>
</body>

</html>
