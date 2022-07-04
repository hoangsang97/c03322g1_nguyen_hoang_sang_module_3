<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 01/07/2022
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                <li><a href="/employee">Employee</a></li>
                <li><a href="/facility">Facility</a></li>
                <li><a href="">Contract</a></li>
            </ul>
        </div>
        <div class="nav-left">
            <form action="/employee" method="get">
                <scan>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </scan>
                <input class="input-text" type="text" placeholder="Search" name="nameSearch">
                <input class="btn btn-primary" type="submit" name="action" value="search">
            </form>
        </div>
    </div>

    <div class="main">
        <div class="content">
            <h1>List Employee</h1>
            <p>
                <a class="btn btn-primary" href="/employee?action=create">Create Emloyee</a>
            </p>
            <div class="content-table">
                <table class="table">
                    <tr class="bg-primary">
                        <th>Id</th>
                        <th>Name</th>
                        <th>Birthday</th>
                        <th>IdCard</th>
                        <th>Salary</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Position</th>
                        <th>Education Degree</th>
                        <th>Division</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${employee}" var="item">
                        <tr>
                            <td>${item.getEmployeeId()}</td>
                            <td>${item.getEmployeeName()}</td>
                            <td>${item.getEmployeeBirthday()}</td>
                            <td>${item.getEmployeeIdCard()}</td>
                            <td>${item.getEmployeeSalary()}</td>
                            <td>${item.getEmployeePhone()}</td>
                            <td>${item.getEmployeeEmail()}</td>
                            <td>${item.getEmployeeAddress()}</td>
                            <td>${item.getPositionName()}</td>
                            <td>${item.getEducationDegreeName()}</td>
                            <td>${item.getDivisionName()}</td>
                            <td><a class="btn btn-primary" href="/employee?action=edit&id=${item.getEmployeeId()}">Edit</a></td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="objDelete('${item.getEmployeeId()}', '${item.getEmployeeName()}')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>Footer</p>
    </div>

    <form action="/employee" method="get">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
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
<script>
    function objDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</html>
