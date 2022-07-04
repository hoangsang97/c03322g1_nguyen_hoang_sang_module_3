<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/2/2022
  Time: 8:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        h1, p {
            text-align: center;
        }
        a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>Edit Employee</h1>
<p>
    <a class="btn btn-primary" href="/employee">Back to home employee</a>
</p>
<div class="container">
    <form action="/employee?action=edit&id=${employee.getEmployeeId()}" class="row g-3" method="post">
        <div class="col-12">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name" value="${employee.getEmployeeName()}">
        </div>
        <div class="col-12">
            <label class="form-label">Birthday</label>
            <input type="text" class="form-control" name="birthday" value="${employee.getEmployeeBirthday()}">
        </div>
        <div class="col-12">
            <label class="form-label">IdCard</label>
            <input type="text" class="form-control" name="idCard" value="${employee.getEmployeeIdCard()}">
        </div>
        <div class="col-12">
            <label class="form-label">Salary</label>
            <input type="text" class="form-control" name="salary" value="${employee.getEmployeeSalary()}">
        </div>
        <div class="col-12">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="${employee.getEmployeeEmail()}">
        </div>
        <div class="col-12">
            <label class="form-label">Address</label>
            <input type="text" class="form-control" name="address" value="${employee.getEmployeeAddress()}">
        </div>
        <div class="col-12">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" value="${employee.getEmployeePhone()}">
        </div>
        <div class="col-md-4">
            <label class="form-label">Position</label>
            <select class="form-select" name="position">
                <c:if test="${employee.getPositionId() == 1}">
                    <option value="1" selected>Lễ tân</option>
                    <option value="2">phục vụ</option>
                    <option value="3">chuyên viên</option>
                    <option value="4">giám sát</option>
                    <option value="5">quản lý</option>
                    <option value="6">giám đốc</option>
                </c:if>
                <c:if test="${employee.getPositionId() == 2}">
                    <option value="1">Lễ tân</option>
                    <option value="2" selected>phục vụ</option>
                    <option value="3">chuyên viên</option>
                    <option value="4">giám sát</option>
                    <option value="5">quản lý</option>
                    <option value="6">giám đốc</option>
                </c:if>
                <c:if test="${employee.getPositionId() == 3}">
                    <option value="1">Lễ tân</option>
                    <option value="2">phục vụ</option>
                    <option value="3" selected>chuyên viên</option>
                    <option value="4">giám sát</option>
                    <option value="5">quản lý</option>
                    <option value="6">giám đốc</option>
                </c:if>
                <c:if test="${employee.getPositionId() == 4}">
                    <option value="1">Lễ tân</option>
                    <option value="2" selected>phục vụ</option>
                    <option value="3">chuyên viên</option>
                    <option value="4" selected>giám sát</option>
                    <option value="5">quản lý</option>
                    <option value="6">giám đốc</option>
                </c:if>
                <c:if test="${employee.getPositionId() == 5}">
                    <option value="1">Lễ tân</option>
                    <option value="2">phục vụ</option>
                    <option value="3">chuyên viên</option>
                    <option value="4">giám sát</option>
                    <option value="5" selected>quản lý</option>
                    <option value="6">giám đốc</option>
                </c:if>
                <c:if test="${employee.getPositionId() == 6}">
                    <option value="1">Lễ tân</option>
                    <option value="2">phục vụ</option>
                    <option value="3">chuyên viên</option>
                    <option value="4">giám sát</option>
                    <option value="5">quản lý</option>
                    <option value="6" selected>giám đốc</option>
                </c:if>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Education Degree</label>
            <select class="form-select" name="educationDegree">
                <c:if test="${employee.getEducationDegreeId() == 1}">
                    <option value="1" selected>Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Họ</option>
                </c:if>
                <c:if test="${employee.getEducationDegreeId() == 2}">
                    <option value="1">Trung Cấp</option>
                    <option value="2" selected>Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4">Sau Đại Họ</option>
                </c:if>
                <c:if test="${employee.getEducationDegreeId() == 3}">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3" selected>Đại Học</option>
                    <option value="4">Sau Đại Họ</option>
                </c:if>
                <c:if test="${employee.getEducationDegreeId() == 4}">
                    <option value="1">Trung Cấp</option>
                    <option value="2">Cao Đẳng</option>
                    <option value="3">Đại Học</option>
                    <option value="4" selected>Sau Đại Họ</option>
                </c:if>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Division</label>
            <select class="form-select" name="division">
                <c:if test="${employee.getDivisionId() == 1}">
                    <option value="1" selected>Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </c:if>
                <c:if test="${employee.getDivisionId() == 2}">
                    <option value="1">Sale-Marketing</option>
                    <option value="2" selected>Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4">Quản lý</option>
                </c:if>
                <c:if test="${employee.getDivisionId() == 3}">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3" selected>Phục vụ</option>
                    <option value="4">Quản lý</option>
                </c:if>
                <c:if test="${employee.getDivisionId() == 4}">
                    <option value="1">Sale-Marketing</option>
                    <option value="2">Hành chính</option>
                    <option value="3">Phục vụ</option>
                    <option value="4" selected>Quản lý</option>
                </c:if>
            </select>
        </div>
        <div class="col-12">
            <input type="submit" class="btn btn-primary" value="Update">
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
