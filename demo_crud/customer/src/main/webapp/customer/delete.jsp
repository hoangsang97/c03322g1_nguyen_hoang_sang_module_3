<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 6/28/2022
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Customer</title>
</head>
<body>
<h1>Delete Customer</h1>
<p>
    <a href="/customer">Back to home</a>
</p>
<form method="post">
    <filedset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${customer.getName()}</td>
            </tr>
            <tr>
                <td>Age: </td>
                <td>${customer.getAge()}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${customer.getAddress()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="deleteCustomer"></td>
            </tr>
        </table>
    </filedset>
</form>
</body>
</html>
