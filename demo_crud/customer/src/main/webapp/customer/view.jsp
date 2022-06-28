<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 6/28/2022
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Customer</title>
</head>
<body>
<h1>View Customer</h1>
<p>
    <a href="/customer">Back to home</a>
</p>
<table border="1">
    <tr>
        <td>Name:</td>
        <td>${customer.getName()}</td>
    </tr>
    <tr>
        <td>Age:</td>
        <td>${customer.getAge()}</td>
    </tr>
    <tr>
        <td>Address:</td>
        <td>${customer.getAddress()}</td>
    </tr>
</table>
</body>
</html>
