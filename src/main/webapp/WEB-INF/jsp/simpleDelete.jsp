<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@  taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body
<div class="container">

<div align="center">
<h1>Enter a name to delete</h1>
<f:form action="deleteUser" method="POST" modelAttribute="user">
<f:input path="name" value="${u.getUserName()}"/>
<input type="submit" value="Delete"/>
</f:form>

<br>
<h3> Users </h3>
<table class="table" border=1>
<th>Name</th><th>Email</th>
<c:forEach items="${users}" var="u">
<tr>
<td>${u.getName()}</td>
<td>${u.getEmail()}</td>
</tr>
</c:forEach>
</table>
</div>

<h1>changed a feature</h1>


</body>
</html>