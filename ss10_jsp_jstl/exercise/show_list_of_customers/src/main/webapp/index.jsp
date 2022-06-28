<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 28/06/2022
  Time: 08:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<table class="table table-hover text-center">
    <h1 class="text-center">Danh sách khách hàng</h1>
    <thead>
    <tr>
        <th scope="col">tên</th>
        <th scope="col">ngày sinh</th>
        <th scope="col">địa chỉ</th>
        <th scope="col">ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${studentList}" var="item">
        <tr>
            <td>${item.name}</td>
            <td>${item.ngaySinh}</td>
            <td>${item.diaChi}</td>
            <td><img style="width: 50px; height: 50px" src="${item.img}" alt=""></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
