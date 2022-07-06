<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/4/2022
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contract List</title>
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
                <li><a href="/customer">Customer</a></li>
                <li><a href="/facility">Facility</a></li>
                <li><a href="/employee">Employee</a></li>
            </ul>
        </div>
        <div class="nav-left">
            <form action="/contract" method="get">
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

    <div class="container">
        <h1>Attach Service List</h1>
        <table class="table">
            <tr class="bg-primary" style="color: white">
                <th>Id</th>
                <th>Name</th>
                <th>Cost</th>
                <th>Unit</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${attachService}" var="item">
                <tr>
                    <td>${item.getAttachServiceId()}</td>
                    <td>${item.getAttachServiceName()}</td>
                    <td>${item.getAttachServiceCost()}</td>
                    <td>${item.getAttachServiceUnit()}</td>
                    <td>${item.getAttachServiceStatus()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="main">
        <div class="content">
            <h1>Contract List</h1>
            <div class="content-table">
                <table class="table">
                    <tr class="bg-primary">
                        <th>Id</th>
                        <th>Service</th>
                        <th>Customer</th>
                        <th>Contract Start Date</th>
                        <th>Contract End Date</th>
                        <th>Contract Deposit</th>
                        <th>Contract Total Money</th>
                        <th>Attach Service</th>
                    </tr>
                    <c:forEach items="${contract}" var="item">
                        <tr>
                            <td>${item.getContractId()}</td>
                            <td>${item.getServiceName()}</td>
                            <td>${item.getCustomerName()}</td>
                            <td>${item.getContractStartDate()}</td>
                            <td>${item.getContractEndDate()}</td>
                            <td>đ${item.getContractDeposit()}</td>
                            <td>đ${item.getContractTotalMoney()}</td>
                            <td>
                                <a href="/contract?action=createContractDetail" class="btn btn-primary">+</a>
                                <a href="/contract?action=showAttachContract&contractId=${item.getContractId()}"
                                   class="btn btn-primary">DSDV đi kèm</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
