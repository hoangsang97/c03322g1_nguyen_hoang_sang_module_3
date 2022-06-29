<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 29/06/2022
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
</head>
<body>
<h1>Create Employee</h1>
<form action="/employee?action=create" method="post">
    <fieldset>
        <legend>Employee information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <select name="gender">
                        <option value="0">Nữ</option>
                        <option value="1">Nam</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
