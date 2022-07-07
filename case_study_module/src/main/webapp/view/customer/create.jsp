<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/1/2022
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        h1, p {
            text-align: center;
        }
        a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<h1>Create Customer</h1>
<p>
    <a class="btn btn-primary" href="/customer">Back to home</a>
</p>
<div class="container">
    <form action="/customer?action=create" class="row g-3" method="post">
        <div class="col-12">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name" value="${customer.getCustomerName()}">
        </div>
        <div class="text-danger">${error.errName}</div>
        <div class="col-12">
            <label class="form-label">Birthday</label>
            <input type="text" class="form-control" name="birthday" value="${customer.getCustomerBirthday()}">
        </div>
        <div class="text-danger">${error.errBirthday}</div>
        <div class="col-12">
            <label class="form-label">IdCard</label>
            <input type="text" class="form-control" name="idCard" value="${customer.getCustomerIdCard()}">
        </div>
        <div class="text-danger">${error.errIdCard}</div>
        <div class="col-12">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="${customer.getCustomerEmail()}">
        </div>
        <div class="text-danger">${error.errEmail}</div>
        <div class="col-12">
            <label class="form-label">Address</label>
            <input type="text" class="form-control" name="address">
        </div>
        <div class="col-md-4">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" value="${customer.getCustomerPhone()}">
        </div>
        <div class="text-danger">${error.errPhone}</div>
        <div class="col-md-4">
            <label class="form-label">Gender</label>
            <select class="form-select" name="gender">
                <option selected>Choose...</option>
                <option value="0">FeMale</option>
                <option value="1">Male</option>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">TypeId</label>
            <select class="form-select" name="typeId">
                <option selected>Choose...</option>
                <option value="1">Diamond</option>
                <option value="2">Platinum</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select>
        </div>
        <div class="col-12">
            <input type="submit" class="btn btn-primary" value="Create">
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
