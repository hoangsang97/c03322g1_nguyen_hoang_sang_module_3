<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 03/07/2022
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Facility</title>
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
<c:if test="${createId == 1}">
    <h1>Create Facility Villa</h1>
    <p>
        <a class="btn btn-primary" href="/facility">Back to home Facility</a>
    </p>
    <div class="container" id="villa">
        <form action="/facility?action=create&createId=1" class="row g-3" method="post">
            <div class="col-12">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="col-12">
                <label class="form-label">Area</label>
                <input type="text" class="form-control" name="area">
            </div>
            <div class="col-12">
                <label class="form-label">Cost</label>
                <input type="text" class="form-control" name="cost">
            </div>
            <div class="col-12">
                <label class="form-label">Max People</label>
                <input type="text" class="form-control" name="maxPeople">
            </div>
            <div class="col-12">
                <label class="form-label">Ren type id</label>
                <select class="form-select" name="renTypeId">
                    <option selected>Choose...</option>
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Standard Room</label>
                <input type="text" class="form-control" name="standardRoom">
            </div>
            <div class="col-12">
                <label class="form-label">Description Other Convenience</label>
                <input type="text" class="form-control" name="descriptionOtherConvenience">
            </div>
            <div class="col-12">
                <label class="form-label">Pool Area</label>
                <input type="text" class="form-control" name="poolArea">
            </div>
            <div class="col-12">
                <label class="form-label">Number Of Floors</label>
                <input type="text" class="form-control" name="numberOfFloors">
            </div>
            <div class="col-12">
                <input type="submit" class="btn btn-primary" value="Create">
            </div>
        </form>
    </div>
</c:if>
<c:if test="${createId == 2}">
    <h1>Create Facility House</h1>
    <p>
        <a class="btn btn-primary" href="/facility">Back to home Facility</a>
    </p>
    <div class="container" id="villa">
        <form action="/facility?action=create&createId=2" class="row g-3" method="post">
            <div class="col-12">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="col-12">
                <label class="form-label">Area</label>
                <input type="text" class="form-control" name="area">
            </div>
            <div class="col-12">
                <label class="form-label">Cost</label>
                <input type="text" class="form-control" name="cost">
            </div>
            <div class="col-12">
                <label class="form-label">Max People</label>
                <input type="text" class="form-control" name="maxPeople">
            </div>
            <div class="col-12">
                <label class="form-label">Ren type id</label>
                <select class="form-select" name="renTypeId">
                    <option selected>Choose...</option>
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Standard Room</label>
                <input type="text" class="form-control" name="standardRoom">
            </div>
            <div class="col-12">
                <label class="form-label">Description Other Convenience</label>
                <input type="text" class="form-control" name="descriptionOtherConvenience">
            </div>
            <div class="col-12">
                <label class="form-label">Number Of Floors</label>
                <input type="text" class="form-control" name="numberOfFloors">
            </div>
            <div class="col-12">
                <input type="submit" class="btn btn-primary" value="Create">
            </div>
        </form>
    </div>
</c:if>
<c:if test="${createId == 3}">
    <h1>Create Facility Room</h1>
    <p>
        <a class="btn btn-primary" href="/facility">Back to home Facility</a>
    </p>
    <div class="container" id="villa">
        <form action="/facility?action=create&createId=3" class="row g-3" method="post">
            <div class="col-12">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="col-12">
                <label class="form-label">Area</label>
                <input type="text" class="form-control" name="area">
            </div>
            <div class="col-12">
                <label class="form-label">Cost</label>
                <input type="text" class="form-control" name="cost">
            </div>
            <div class="col-12">
                <label class="form-label">Max People</label>
                <input type="text" class="form-control" name="maxPeople">
            </div>
            <div class="col-12">
                <label class="form-label">Ren type id</label>
                <select class="form-select" name="renTypeId">
                    <option selected>Choose...</option>
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Facility Free</label>
                <input type="text" class="form-control" name="facilityFree">
            </div>
            <div class="col-12">
                <input type="submit" class="btn btn-primary" value="Create">
            </div>
        </form>
    </div>
</c:if>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
</script>
</html>
