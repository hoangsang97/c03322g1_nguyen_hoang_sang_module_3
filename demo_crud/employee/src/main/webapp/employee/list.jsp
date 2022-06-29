<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 29/06/2022
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Employee</title>
</head>
<body>
<h1>List Employee</h1>
<form>
    <input type="text" placeholder="tìm kiếm" name="nameSearch">
    <input type="submit" value="search" name="action">
</form>

<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Edit</th>
        <th>Create</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${employee}" var="item">
        <tr>
            <td>${item.getId()}</td>
            <td>${item.getName()}</td>
            <c:if test="${item.getGender() == '0'}">
                <td>Nữ</td>
            </c:if>
            <c:if test="${item.getGender() == '1'}">
                <td>Nam</td>
            </c:if>
            <td><a href="/employee?action=edit&id=${item.getId()}">Edit</a></td>
            <td><a href="/employee?action=create">Create</a></td>
            <td><a href="/employee?action=delete&id=${item.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
