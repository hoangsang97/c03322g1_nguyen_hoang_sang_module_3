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
    <title>List Customer</title>
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

        .content {
            padding: 20px;
        }

        .bg-primary {
            color: white;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/header.jsp"%>

    <div class="main">
        <div class="content">
            <h1>List Customer</h1>
            <p>
                <a class="btn btn-primary" href="/customer?action=create">Create Customer</a>
            </p>
            <form action="/customer" method="get">
                <div class="row g-3">
                    <div class="col">
                        <input type="text" class="form-control border border-danger" placeholder="Name Search" aria-label="First name"
                               name="nameSearch">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control border border-danger" placeholder="Id Search" aria-label="Id Search"
                               name="idSearch">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control border border-danger" placeholder="Email Search" aria-label="Email Search"
                               name="emailSearch">
                    </div>
                    <div class="col">
                        <input class="btn btn-primary" type="submit" name="action" value="search">
                    </div>
                </div>
            </form>

            <div class="container-fluid mt-2">
                <div class="row">
                    <div class="col-lg-12">
                        <table id="tableStudent" class="table table-striped table-bordered">
                            <thead>
                            <tr class="bg-primary">
                                <th>Id</th>
                                <th>TypeName</th>
                                <th>Name</th>
                                <th>Birthday</th>
                                <th>Gender</th>
                                <th>IdCard</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customer}" var="item">
                                <tr>
                                    <td>${item.getCustomerId()}</td>
                                    <td>${item.getCustomerTypeName()}</td>
                                    <td>${item.getCustomerName()}</td>
                                    <td>${item.getCustomerBirthday()}</td>
                                    <c:if test="${item.getCustomerGender() == 0}">
                                        <td>Nữ</td>
                                    </c:if>
                                    <c:if test="${item.getCustomerGender() == 1}">
                                        <td>Nam</td>
                                    </c:if>
                                    <td>${item.getCustomerIdCard()}</td>
                                    <td>${item.getCustomerPhone()}</td>
                                    <td>${item.getCustomerEmail()}</td>
                                    <td>${item.getCustomerAddress()}</td>

                                    <td>
                                        <%
                                            if (((User)request.getSession().getAttribute("userNameSession")).getRole().equals("ADMIN")) {
                                        %>
                                        <a class="btn btn-outline-success"
                                           href="/customer?action=edit&id=${item.getCustomerId()}">Edit</a>
                                        <%
                                        } else { %>
                                        <button hidden></button>
                                        <%
                                            }
                                        %>
                                    </td>

                                    <td>
                                        <%
                                            if (((User)request.getSession().getAttribute("userNameSession")).getRole().equals("ADMIN")) {
                                                %>
                                        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal"
                                                onclick="objDelete('${item.getCustomerId()}', '${item.getCustomerName()}')">
                                            Delete
                                        </button>
                                        <%
                                            } else { %>
                                        <button hidden></button>
                                        <%
                                            }
                                        %>
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

    <form action="/customer" method="get">
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
</script>
</html>
