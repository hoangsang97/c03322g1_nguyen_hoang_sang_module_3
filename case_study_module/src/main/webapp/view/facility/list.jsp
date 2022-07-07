<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 02/07/2022
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Facility List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            color: dodgerblue;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid black;
            padding: 20px;
        }

        .header-left img {
            width: 70px;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            border-bottom: 1px solid black;
        }

        .nav-right {
            margin-left: 5%;
            width: 70%;
        }

        .nav-right ul {
            display: flex;
            justify-content: space-around;
        }

        .nav-left scan {
            position: absolute;
            z-index: 1;
            margin-left: 10px;
            margin-top: 10px;
        }

        .input-text {
            position: relative;
            border-radius: 10px;
            width: 250px;
            padding-left: 30px;
        }

        .content {
            padding: 20px;
        }

        .content-table {
            border: 1px solid;
            padding: 10px;
        }

        .bg-primary {
            color: white;
        }

        .footer {
            padding: 20px;
            border-top: 1px solid black;
        }
    </style>
</head>
<%
    int editId = 0;
%>
<body>
<div class="container-fluid">
    <div class="header">
        <div class="header-left">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" alt="">
        </div>
        <div class="header-right">
            <h3>Nguyễn Hoàng Sang</h3>
        </div>
    </div>

    <div class="nav">
        <div class="nav-right">
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a href="/customer">Customer</a></li>
                <li><a href="/employee">Employee</a></li>
                <li><a href="/contract">Contract</a></li>
            </ul>
        </div>
        <div class="nav-left">
            <form action="/facility" method="get">
                <div class="row">
                    <div class="col">
                        <input class="form-control border border-secondary" type="text" placeholder="Search"
                               name="nameSearch">
                    </div>
                    <div class="col">
                        <input class="btn btn-primary" type="submit" name="action" value="search">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="main">
        <div class="content">
            <h1>List Facility</h1>
            <div class="row">
                <div class="col-3">
                    <select aria-label="Default select example" onchange="createFacility(this)"
                            class="form-select border border-secondary">
                        <option selected>Create Facility</option>
                        <option value="1">Villa</option>
                        <option value="2">House</option>
                        <option value="3">Room</option>
                    </select>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <table id="tableStudent" class="table table-striped table-bordered">
                            <thead>
                            <tr class="bg-primary">
                                <th>Id</th>
                                <th>Name</th>
                                <th>Area</th>
                                <th>Cost</th>
                                <th>Max People</th>
                                <th>Ren type name</th>
                                <th>service type name</th>
                                <th>Standard Room</th>
                                <th>Description Other Convenience</th>
                                <th>Pool Area</th>
                                <th>Number Of Floors</th>
                                <th>Facility Free</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${facility}" var="item">
                                <tr>
                                    <td>${item.getServiceId()}</td>
                                    <td>${item.getServiceName()}</td>
                                    <td>${item.getServiceArea()}</td>
                                    <td>${item.getServiceCost()}</td>
                                    <td>${item.getServiceMaxPeople()}</td>
                                    <td>${item.getRentTypeName()}</td>
                                    <td>${item.getServiceTypeName()}</td>
                                    <div style="display: none">
                                        <c:if test="${item.getServiceTypeName() == 'Villa'}">
                                            <%=editId = 1%>
                                        </c:if>
                                        <c:if test="${item.getServiceTypeName() == 'House'}">
                                            <%=editId = 2%>
                                        </c:if>
                                        <c:if test="${item.getServiceTypeName() == 'Room'}">
                                            <%=editId = 3%>
                                        </c:if>
                                    </div>
                                    <td>${item.getStandardRoom()}</td>
                                    <td>${item.getDescriptionOtherConvenience()}</td>
                                    <td>${item.getPoolArea()}</td>
                                    <td>${item.getNumberOfFloors()}</td>
                                    <td>${item.getFacilityFree()}</td>
                                    <td><a class="btn btn-primary"
                                           href="/facility?action=edit&id=${item.getServiceId()}&editId=<%=editId%>">Edit</a>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal"
                                                onclick="objDelete('${item.getServiceId()}', '${item.getServiceName()}')">
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form action="/facility" method="get">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Villa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" hidden name="id" id="idDelete">
                        <input type="text" hidden name="action" value="delete">
                        <span>Do you want to delete? :</span>
                        <span id="nameDelete"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Delete">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<script>
    function objDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }

    function createFacility(obj) {
        var value = obj.value;
        if (value == 1) {
            window.location.replace("http://localhost:8080/facility?action=create&createId=1");
        } else if (value == 2) {
            window.location.replace("http://localhost:8080/facility?action=create&createId=2");
        } else if (value == 3) {
            window.location.replace("http://localhost:8080/facility?action=create&createId=3");
        }
    }
</script>
</html>
