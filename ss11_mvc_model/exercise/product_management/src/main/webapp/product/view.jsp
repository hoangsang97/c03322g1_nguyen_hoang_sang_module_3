<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 28/06/2022
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>View product</h1>
<p>
    <a href="/ProductServlet">Back to product list</a>
</p>
<fieldset>
    <legend>Product information</legend>
    <table>
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
    </table>
</fieldset>
</body>
</html>
