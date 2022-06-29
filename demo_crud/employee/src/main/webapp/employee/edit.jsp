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
                        <option value="0">Nữ</option>
                        <option value="1">Nam</option>
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
