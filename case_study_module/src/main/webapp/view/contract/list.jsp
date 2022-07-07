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
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/header.jsp"%>

    <div class="row p-3">
        <div class="col-lg-4">
            <form action="/employee" method="get">
                <div class="row">
                    <div class="col">
                        <input class="form-control border border-secondary" type="text" placeholder="Search" name="nameSearch">
                    </div>
                    <div class="col">
                        <input class="btn btn-primary" type="submit" name="action" value="search">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--    <div class="container">--%>
    <%--        <h1>Attach Service List</h1>--%>
    <%--        <table class="table">--%>
    <%--            <tr class="bg-primary" style="color: white">--%>
    <%--                <th>Id</th>--%>
    <%--                <th>Name</th>--%>
    <%--                <th>Cost</th>--%>
    <%--                <th>Unit</th>--%>
    <%--                <th>Status</th>--%>
    <%--            </tr>--%>
    <%--            <c:forEach items="${attachService}" var="item">--%>
    <%--                <tr>--%>
    <%--                    <td>${item.getAttachServiceId()}</td>--%>
    <%--                    <td>${item.getAttachServiceName()}</td>--%>
    <%--                    <td>${item.getAttachServiceCost()}</td>--%>
    <%--                    <td>${item.getAttachServiceUnit()}</td>--%>
    <%--                    <td>${item.getAttachServiceStatus()}</td>--%>
    <%--                </tr>--%>
    <%--            </c:forEach>--%>
    <%--        </table>--%>
    <%--    </div>--%>

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
                                   id="target" onclick="objCheck()"
                                   class="btn btn-primary">DSDV đi kèm</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdropAbc" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Attach Service List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
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
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<input id="flag" value="${flag}" hidden>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    let flag = $('#flag').val();
    if (flag == 1) {
        $(document).ready(function () {
            $("#staticBackdropAbc").modal('show');
        })
    }
</script>
</html>
