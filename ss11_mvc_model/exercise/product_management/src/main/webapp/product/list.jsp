<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 28/06/2022
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        a {
            text-decoration: none;
            color: red;
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    <div class="border p-3">
        <table class="table table-success table-striped">
            <tr>
                <th scope="col">Name</th>
                <th scope="col">price</th>
                <th scope="col">description</th>
                <th scope="col">producer</th>
                <th scope="col">edit</th>
                <th scope="col">delete</th>
                <th scope="col">search</th>
            </tr>
            <c:forEach items="${products}" var="item">
                <tr>
                    <td><a href="/products?action=view&id=${item.getId()}">${item.getName()}</a></td>
                    <td>${item.getPrice()}</td>
                    <td>${item.getDescription()}</td>
                    <td>${item.getProducer()}</td>
                    <td><a href="/products?action=view&id=${item.getId()}">edit</a></td>
                    <td><a href="/products?action=view&id=${item.getId()}">delete</a></td>
                    <td><a href="/products?action=view&id=${item.getId()}">search</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
