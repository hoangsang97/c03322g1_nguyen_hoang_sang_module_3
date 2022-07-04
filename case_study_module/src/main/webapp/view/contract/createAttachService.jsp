<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/4/2022
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Attach Service</title>
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
<h1>Create Attach Service</h1>
<p>
    <a class="btn btn-primary" href="/contract">Back to home Contract</a>
</p>
<div class="container">
    <form action="/contract?action=createAttachService" class="row g-3" method="post">
        <div class="col-12">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name">
        </div>
        <div class="col-12">
            <label class="form-label">Cost</label>
            <input type="text" class="form-control" name="cost">
        </div>
        <div class="col-12">
            <label class="form-label">Unit</label>
            <input type="text" class="form-control" name="unit">
        </div>
        <div class="col-12">
            <label class="form-label">Status</label>
            <input type="text" class="form-control" name="status">
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
