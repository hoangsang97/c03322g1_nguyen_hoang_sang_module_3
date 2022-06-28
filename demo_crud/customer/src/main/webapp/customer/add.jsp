<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 6/28/2022
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<h1>Add Customer</h1>
<p>
    <a href="/customer">Back to home</a>
</p>
<p>
    <c:if test="${message != null}">
        <span style="color: green;">${message}</span>
    </c:if>
</p>
<form method="post">
    <filedset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Age: </td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td><input type="submit" value="addCustomer"></td>
            </tr>
        </table>
    </filedset>
</form>
</body>
</html>
