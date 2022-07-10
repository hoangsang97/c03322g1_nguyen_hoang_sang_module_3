<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/10/2022
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="text-primary mt-2 text-center">
        <h3>Student List</h3>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="/student?action=create" class="btn btn-outline-success">Create</a>
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
            <th scope="col">Birthday</th>
            <th scope="col">Class Name</th>
            <th scope="col">Level Name</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${student}" var="item">
            <tr>
                <th scope="row">${item.getStudentId()}</th>
                <td>${item.getStudentName()}</td>
                <td>${item.getStudentBirthday()}</td>
                <td>${item.getClassName()}</td>
                <td>${item.getLevelName()}</td>
                <td>
                    <a href="/student?action=update&id=${item.getStudentId()}" class="btn btn-outline-success">Update</a>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="objDelete('${item.getStudentId()}', '${item.getStudentName()}')">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal -->
<form method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Student</h5>
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
</html>
