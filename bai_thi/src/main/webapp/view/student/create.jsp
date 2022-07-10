<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/10/2022
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student</title>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="text-center mt-2 text-primary">
        <h3>Create Student</h3>
    </div>
    <form action="/student?action=create" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="name">
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Birthday</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="birthday">
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Class Name</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" name="classId">
                    <option value="1">C-02</option>
                    <option value="2">C-03</option>
                    <option value="3">C-04</option>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Level Name</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" name="levelId">
                    <option value="1">giỏi</option>
                    <option value="2">khá</option>
                    <option value="3">trung bình</option>
                </select>
            </div>
        </div>
        <a href="/student" class="btn btn-outline-danger">Back</a>
        <input type="submit" class="btn btn-outline-success" value="Create">
    </form>
</div>
</body>
</html>
