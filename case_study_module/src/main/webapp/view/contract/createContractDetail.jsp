<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/4/2022
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Contract Detail</title>
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
<h1>Create Contract Detail</h1>
<p>
    <a class="btn btn-primary" href="/contract">Back to home Employee</a>
</p>
<div class="container">
    <form action="/contract?action=createContractDetail" class="row g-3" method="post">
        <div class="col-12">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name">
        </div>
        <div class="col-12">
            <label class="form-label">Birthday</label>
            <input type="text" class="form-control" name="birthday">
        </div>
        <div class="col-12">
            <label class="form-label">IdCard</label>
            <input type="text" class="form-control" name="idCard">
        </div>
        <div class="col-12">
            <label class="form-label">Salary</label>
            <input type="text" class="form-control" name="salary">
        </div>
        <div class="col-12">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email">
        </div>
        <div class="col-12">
            <label class="form-label">Address</label>
            <input type="text" class="form-control" name="address">
        </div>
        <div class="col-12">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone">
        </div>
        <div class="col-md-4">
            <label class="form-label">Position</label>
            <select class="form-select" name="position">
                <option selected>Choose...</option>
                <option value="1">Lễ tân</option>
                <option value="2">phục vụ</option>
                <option value="3">chuyên viên</option>
                <option value="4">giám sát</option>
                <option value="5">quản lý</option>
                <option value="6">giám đốc</option>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Education Degree</label>
            <select class="form-select" name="educationDegree">
                <option selected>Choose...</option>
                <option value="1">Trung Cấp</option>
                <option value="2">Cao Đẳng</option>
                <option value="3">Đại Học</option>
                <option value="4">Sau Đại Họ</option>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Division</label>
            <select class="form-select" name="division">
                <option selected>Choose...</option>
                <option value="1">Sale-Marketing</option>
                <option value="2">Hành chính</option>
                <option value="3">Phục vụ</option>
                <option value="4">Quản lý</option>
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

