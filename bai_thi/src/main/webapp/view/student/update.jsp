<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/10/2022
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="text-center mt-2 text-primary">
        <h3>Update Student</h3>
    </div>
    <form action="/student?action=update&id=${student.getStudentId()}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="name" value="${student.getStudentName()}">
                <div class="text-danger">${error.errName}</div>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Birthday</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="birthday" value="${student.getStudentBirthday()}">
                <div class="text-danger">${error.errBirthday}</div>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Class Name</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" name="classId">
                    <c:if test="${student.getClassId() == 1}">
                        <option value="1" selected>C-02</option>
                        <option value="2">C-03</option>
                        <option value="3">C-04</option>
                    </c:if>
                    <c:if test="${student.getClassId() == 2}">
                        <option value="1">C-02</option>
                        <option value="2" selected>C-03</option>
                        <option value="3">C-04</option>
                    </c:if>
                    <c:if test="${student.getClassId() == 3}">
                        <option value="1">C-02</option>
                        <option value="2">C-03</option>
                        <option value="3" selected>C-04</option>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Level Name</label>
            <div class="col-sm-10">
                <select class="form-select" aria-label="Default select example" name="levelId">
                    <c:if test="${student.getLevelId() == 1}">
                        <option value="1" selected>giỏi</option>
                        <option value="2">khá</option>
                        <option value="3">trung bình</option>
                    </c:if>
                    <c:if test="${student.getLevelId() == 2}">
                        <option value="1">giỏi</option>
                        <option value="2" selected>khá</option>
                        <option value="3">trung bình</option>
                    </c:if>
                    <c:if test="${student.getLevelId() == 3}">
                        <option value="1">giỏi</option>
                        <option value="2">khá</option>
                        <option value="3" selected>trung bình</option>
                    </c:if>
                </select>
            </div>
        </div>
        <a href="/student" class="btn btn-outline-danger">Back</a>
        <input type="submit" class="btn btn-outline-success" value="Update">
    </form>
</div>
</body>
</html>
