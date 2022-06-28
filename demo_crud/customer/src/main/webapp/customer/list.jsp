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
    <title>List Customer</title>
</head>
<body>
<h1>List Customer</h1>
<p>
    <a href="/customer?action=add">Create New Customer</a>
</p>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>age</th>
        <th>address</th>
        <th>delete</th>
        <th>edit</th>
        <th>search</th>
    </tr>
    <c:forEach items="${customer}" var="item">
        <tr>
            <td>${item.getId()}</td>
            <td><a href="/customer?action=view&id=${item.getId()}">${item.getName()}</a></td>
            <td>${item.getAge()}</td>
            <td>${item.getAddress()}</td>
            <td><a href="/customer?action=delete&id=${item.getId()}">delete</a></td>
            <td><a href="/customer?action=view&id=${item.getId()}">edit</a></td>
            <td><a href="/customer?action=view&id=${item.getId()}">search</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
