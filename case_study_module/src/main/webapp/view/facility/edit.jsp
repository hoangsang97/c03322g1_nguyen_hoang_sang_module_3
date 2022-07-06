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
    <title>Edit Facility</title>
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
<%
    int editId = Integer.parseInt(request.getParameter("editId"));
    int id = Integer.parseInt(request.getParameter("id"));
%>
<body>
<h1>Edit Facility</h1>
<p>
    <a class="btn btn-primary" href="/facility">Back to Facility</a>
</p>
<div class="container">
    <form action="/facility?action=edit&editId=<%=editId%>&id=${facility.getServiceId()}" class="row g-3" method="post">
        <div class="col-md-3">
            <label class="form-label">Facility Type</label>
            <select class="form-select" name="serviceTypeId" onchange="createFacility(this)">
                <c:if test="<%=editId == 1%>">
                    <option value="1" selected>Villa</option>
                    <option value="2">House</option>
                    <option value="3">Room</option>
                </c:if>
                <c:if test="<%=editId == 2%>">
                    <option value="1">Villa</option>
                    <option value="2" selected>House</option>
                    <option value="3">Room</option>
                </c:if>
                <c:if test="<%=editId == 3%>">
                    <option value="1">Villa</option>
                    <option value="2">House</option>
                    <option value="3" selected>Room</option>
                </c:if>
            </select>
        </div>
        <div class="col-12">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name" value="${facility.getServiceName()}">
        </div>
        <div class="col-12">
            <label class="form-label">Area</label>
            <input type="text" class="form-control" name="area" value="${facility.getServiceArea()}">
        </div>
        <div class="col-12">
            <label class="form-label">Cost</label>
            <input type="text" class="form-control" name="cost" value="${facility.getServiceCost()}">
        </div>
        <div class="col-12">
            <label class="form-label">Max People</label>
            <input type="text" class="form-control" name="maxPeople" value="${facility.getServiceMaxPeople()}">
        </div>
        <div class="col-12">
            <label class="form-label">Ren type id</label>
            <select class="form-select" name="renTypeId">
                <c:if test="${facility.getRentTypeId() == 1}">
                    <option value="1" selected>year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </c:if>
                <c:if test="${facility.getRentTypeId() == 2}">
                    <option value="1">year</option>
                    <option value="2" selected>month</option>
                    <option value="3">day</option>
                    <option value="4">hour</option>
                </c:if>
                <c:if test="${facility.getRentTypeId() == 3}">
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3" selected>day</option>
                    <option value="4">hour</option>
                </c:if>
                <c:if test="${facility.getRentTypeId() == 4}">
                    <option value="1">year</option>
                    <option value="2">month</option>
                    <option value="3">day</option>
                    <option value="4" selected>hour</option>
                </c:if>
            </select>
        </div>
        <c:if test="<%=editId == 1%>">
            <div class="col-12">
                <label class="form-label">Standard Room</label>
                <input type="text" class="form-control" name="standardRoom" value="${facility.getStandardRoom()}">
            </div>
            <div class="col-12">
                <label class="form-label">Description Other Convenience</label>
                <input type="text" class="form-control" name="descriptionOtherConvenience" value="${facility.getDescriptionOtherConvenience()}">
            </div>
            <div class="col-12">
                <label class="form-label">Pool Area</label>
                <input type="text" class="form-control" name="poolArea" value="${facility.getPoolArea()}">
            </div>
            <div class="col-12">
                <label class="form-label">Number Of Floors</label>
                <input type="text" class="form-control" name="numberOfFloors" value="${facility.getNumberOfFloors()}">
            </div>
        </c:if>
        <c:if test="<%=editId == 2%>">
            <div class="col-12">
                <label class="form-label">Standard Room</label>
                <input type="text" class="form-control" name="standardRoom" value="${facility.getStandardRoom()}">
            </div>
            <div class="col-12">
                <label class="form-label">Description Other Convenience</label>
                <input type="text" class="form-control" name="descriptionOtherConvenience" value="${facility.getDescriptionOtherConvenience()}">
            </div>
            <div class="col-12">
                <label class="form-label">Number Of Floors</label>
                <input type="text" class="form-control" name="numberOfFloors" value="${facility.getNumberOfFloors()}">
            </div>
        </c:if>
        <c:if test="<%=editId == 3%>">
            <div class="col-12">
                <label class="form-label">Facility Frees</label>
                <input type="text" class="form-control" name="facilityFree" value="${facility.getFacilityFree()}">
            </div>
        </c:if>
        <div class="col-12">
            <input type="submit" class="btn btn-primary" value="Update">
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    function createFacility(obj) {
        var value = obj.value;
        if (value == 1) {
            window.location.replace("http://localhost:8080/facility?action=edit&editId=1&id=<%=id%>");
        } else if (value == 2) {
            window.location.replace("http://localhost:8080/facility?action=edit&editId=2&id=<%=id%>");
        } else if (value == 3) {
            window.location.replace("http://localhost:8080/facility?action=edit&editId=3&id=<%=id%>");
        }
    }
</script>
</html>
