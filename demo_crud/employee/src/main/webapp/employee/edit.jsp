<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 29/06/2022
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>
<h1>Edit Employee</h1>
<p>
    <a href="/employee">Back to home</a>
</p>
<form method="post">
    <fieldset>
        <legend>Employee information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${employee.getName()}"></td>
            </tr>
            <tr>
                <td>Gender: </td>
                <td>
                    <select name="gender">
                        <c:if test="${employee.getGender() == 0}">
                            <option value="0" selected>Nữ</option>
                            <option value="1">Nam</option>
                        </c:if>
                        <c:if test="${employee.getGender() == 1}">
                            <option value="0">Nữ</option>
                            <option value="1" selected>Nam</option>
                        </c:if>
                    </select>
                </td>
            </tr>
            <tr>
                <td>level: </td>
                <td>
                    <select name="id_level">
                        <c:if test="${employee.getLevel() == '1'}">
                            <option value="1" selected>good</option>
                            <option value="2">rather</option>
                            <option value="3">medium</option>
                        </c:if>
                        <c:if test="${employee.getLevel() == '2'}">
                            <option value="1">good</option>
                            <option value="2" selected>rather</option>
                            <option value="3">medium</option>
                        </c:if>
                        <c:if test="${employee.getLevel() == '3'}">
                            <option value="1">good</option>
                            <option value="2">rather</option>
                            <option value="3" selected>medium</option>
                        </c:if>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="Submit" value="Edit"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
