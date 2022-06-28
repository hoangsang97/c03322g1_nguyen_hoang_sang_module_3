<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 6/28/2022
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search Product</title>
</head>
<body>
<h1>Search product</h1>
<p>
    <a href="/ProductServlet">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Nhập tên muốn tiềm kiếm: </td>
                <td><input type="text" placeholder="search" name="name"></td>
            </tr>
            <c:if test="${product != null}">
                <tr>
                    <td>Name:</td>
                    <td>${product.getName()}</td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>${product.getPrice()}</td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>${product.getDescription()}</td>
                </tr>
                <tr>
                    <td>Producer:</td>
                    <td>${product.getProducer()}</td>
                </tr>
            </c:if>
            <c:if test="${product == null}">
                <tr>
                    <td>${message}</td>
                </tr>
            </c:if>
            <tr>
                <td><input type="submit" value="Search"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
