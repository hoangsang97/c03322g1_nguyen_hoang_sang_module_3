<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 6/28/2022
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer</title>
</head>
<link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
<body>
<h1>List Customer</h1>
<p>
    <a href="/customer?action=add">Create New Customer</a>
</p>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableStudent" class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>age</th>
                    <th>address</th>
                    <th>delete</th>
                    <th>edit</th>
                    <th>search</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customer}" var="item">
                    <tr>
                        <td>${item.getId()}</td>
                        <td><a href="/customer?action=view&id=${item.getId()}">${item.getName()}</a></td>
                        <td>${item.getAge()}</td>
                        <td>${item.getAddress()}</td>
                        <td><a href="/customer?action=delete&id=${item.getId()}">delete</a></td>
                        <td><a href="/customer?action=view&id=${item.getId()}">edit</a></td>
                        <td><a href="/customer?action=view&id=${item.getId()}">search</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        });
    });
</script>
</html>
