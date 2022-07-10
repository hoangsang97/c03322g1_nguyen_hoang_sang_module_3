<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 10/07/2022
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Teacher List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="text-primary mt-2 text-center">
        <h3>Teacher List</h3>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                                data-bs-target="#exampleModalCreate">
                            Create
                        </button>
                    </li>
                </ul>
                <form class="d-flex" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="name">
                    <input class="btn btn-outline-success" type="submit" name="action" value="search">
                </form>
            </div>
        </div>
    </nav>

    <table id="tableStudent" class="table table-striped table-bordered table-responsive-sm">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Id Card</th>
            <th scope="col">Class Name</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${teacher}" var="item">
            <tr>
                <th scope="row">${item.getTeacherId()}</th>
                <td>${item.getTeacherName()}</td>
                <td>${item.getTeacherIdCard()}</td>
                <td>${item.getClassName()}</td>
                <td>
                    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        Update
                    </button>
                    <input type="text" hidden value="${message}" id="errorCheck">
<%--                    <a href="/teacher?action=update&id=${item.getTeacherId()}" class="btn btn-outline-success">Update</a>--%>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="objDelete('${item.getTeacherId()}', '${item.getTeacherName()}')">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Delete-->
<form method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Teacher</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden id="idDelete" name="id">
                    <input type="text" hidden name="action" value="delete">
                    <span>Bạn có muốn xóa <span class="text-danger" id="nameDelete"></span> không?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-outline-danger" value="Delete">
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Modal Create-->
<form method="post">
    <div class="modal fade" id="exampleModalCreate" tabindex="-1" aria-labelledby="exampleModalLabelCreate" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelCreate">Create Teacher</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Id Card</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="idCard">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Class Name</label>
                        <div class="col-sm-10">
                            <select class="form-select" aria-label="Default select example" name="classId">
                                <option value="1">C-02</option>
                                <option value="2">C-03</option>
                                <option value="3">C-04</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                    <input type="text" hidden name="action" value="create">
                    <input type="submit" class="btn btn-outline-success" value="Create">
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Modal Update-->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Update Teacher</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" >
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">Id Card</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="idCard">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">Class Name</label>
                    <div class="col-sm-10">
                        <select class="form-select" aria-label="Default select example" name="classId">
<%--                            <c:if test="${teacher.getClassId() == 1}">--%>
<%--                                <option value="1" selected>C-02</option>--%>
<%--                                <option value="2">C-03</option>--%>
<%--                                <option value="3">C-04</option>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${teacher.getClassId() == 2}">--%>
<%--                                <option value="1">C-02</option>--%>
<%--                                <option value="2" selected>C-03</option>--%>
<%--                                <option value="3">C-04</option>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${teacher.getClassId() == 3}">--%>
<%--                                <option value="1">C-02</option>--%>
<%--                                <option value="2">C-03</option>--%>
<%--                                <option value="3" selected>C-04</option>--%>
<%--                            </c:if>--%>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline-success">Update</button>
            </div>
        </div>
    </div>
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
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>
<script type="text/javascript">
    let flag = document.getElementById("errorCheck").value
    if (flag == "0") {
        $(window).on('load', function() {
            $('#staticBackdrop').modal('show');
        });
    }
</script>
</html>
