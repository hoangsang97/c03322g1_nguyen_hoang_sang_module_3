<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 28/06/2022
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1 style="font-weight: bold">Simple Calculator</h1>
<div class="border p-4 m-2">
    <form action="/CaluratorServlet" method="post">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="firstOperand" class="col-form-label" style="width: 120px">firstOperand</label>
            </div>
            <div class="col-auto">
                <input type="text" id="firstOperand" class="form-control" name="firstOperand">
            </div>
        </div>
        <br>
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label class="col-form-label" style="width: 130px">Operator</label>
            </div>
            <select class="form-select" style="width: 150px" name="operator">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
        </div>
        <br>
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="SecondOperand" class="col-form-label" style="width: 120px">SecondOperand</label>
            </div>
            <div class="col-auto">
                <input type="text" id="SecondOperand" class="form-control" name="secondOperand">
            </div>
        </div>
        <div>
            <input type="submit" placeholder="Submit">
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
