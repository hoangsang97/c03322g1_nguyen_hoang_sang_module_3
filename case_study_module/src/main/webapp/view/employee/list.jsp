<%@ page import="java.security.Principal" %>
<%@ page import="java.io.PrintWriter" %><%--
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
    <link rel="stylesheet" href="/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .bg-primary {
            color: white;
        }

        #tableStudent {
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/header.jsp" %>

    <div class="row p-3">
        <div class="col-lg-4">
            <form action="/employee" method="get">
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
            <h1>List Employee</h1>
            <p>
                <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalCreate" href="/employee">Create
                    Employee</a>
            </p>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <table id="tableStudent" class="table table-striped table-bordered">
                            <thead>
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
                            </thead>
                            <tbody>
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
                                    <td>
                                        <%
                                            if (((User)request.getSession().getAttribute("userNameSession")).getRole().equals("ADMIN")) {
                                        %>
                                        <a class="btn btn-outline-success"
                                           href="/employee?action=edit&id=${item.getEmployeeId()}">Edit</a>
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
                                                onclick="objDelete('${item.getEmployeeId()}', '${item.getEmployeeName()}')">
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

    <form action="/employee?action=create" class="row g-3" method="post">
        <div class="modal fade" id="exampleModalCreate" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="col-12">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" value="${employee1.getEmployeeName()}">
                            <div class="text-danger">${error.errName}</div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Birthday</label>
                            <input type="text" class="form-control" name="birthday" value="${employee1.getEmployeeBirthday()}">
                            <div class="text-danger">${error.errBirthday}</div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">IdCard</label>
                            <input type="text" class="form-control" name="idCard">
                        </div>
                        <div class="col-12">
                            <label class="form-label">Salary</label>
                            <input type="text" class="form-control" name="salary" value="${employee1.getEmployeeSalary()}">
                            <div class="text-danger">${error.errSalary}</div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="${employee1.getEmployeeEmail()}">
                            <div class="text-danger">${error.errEmail}</div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Address</label>
                            <input type="text" class="form-control" name="address">
                        </div>
                        <div class="col-12">
                            <label class="form-label">Phone</label>
                            <input type="text" class="form-control" name="phone" value="${employee1.getEmployeePhone()}">
                            <div class="text-danger">${error.errPhone}</div>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Position</label>
                            <select class="form-select" name="position">
                                <option value="1">L??? t??n</option>
                                <option value="2">ph???c v???</option>
                                <option value="3">chuy??n vi??n</option>
                                <option value="4">gi??m s??t</option>
                                <option value="5">qu???n l??</option>
                                <option value="6">gi??m ?????c</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Education Degree</label>
                            <select class="form-select" name="educationDegree">
                                <option value="1">Trung C???p</option>
                                <option value="2">Cao ?????ng</option>
                                <option value="3">?????i H???c</option>
                                <option value="4">Sau ?????i H???</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Division</label>
                            <select class="form-select" name="division">
                                <option value="1">Sale-Marketing</option>
                                <option value="2">H??nh ch??nh</option>
                                <option value="3">Ph???c v???</option>
                                <option value="4">Qu???n l??</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Create">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<input type="text" hidden value="${message}" id="errorCheck">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<script type="text/javascript">
    let flag = document.getElementById("errorCheck").value
    if (flag == "0") {
        $(window).on('load', function() {
            $('#exampleModalCreate').modal('show');
        });
    }
</script>
</html>
