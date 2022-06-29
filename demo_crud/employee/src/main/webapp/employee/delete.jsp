<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 29/06/2022
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete Employee</title>
</head>
<body>
<h1>Delete Employee</h1>
<p>
    <a href="/employee">Back to home</a>
</p>
<form method="post">
    <fieldset>
        <legend>Employee information</legend>
        <table border="1">
            <tr>
                <td>Name:</td>
                <td>${employee.getName()}</td>
            </tr>
            <tr>
                <td>Gender:</td>
                <c:if test="${employee.getGender() == '0'}">
                    <td>Nữ</td>
                </c:if>
                <c:if test="${employee.getGender() == '1'}">
                    <td>Nam</td>
                </c:if>
            </tr>
            <tr>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
