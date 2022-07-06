<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/4/2022
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Contract Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        h1, p {
            text-align: center;
        }
        a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<h1>Create Contract Detaile</h1>
<p>
    <a class="btn btn-primary" href="/contract">Back to home Contract</a>
</p>
<div class="container">
    <form action="/contract?action=createContractDetail" class="row g-3" method="post">
        <div class="col-12">
            <label class="form-label">Start Date</label>
            <input type="date" class="form-control" name="contractStartDate">
        </div>
        <div class="col-12">
            <label class="form-label">End Date</label>
            <input type="date" class="form-control" name="contractEndDate">
        </div>
        <div class="col-12">
            <label class="form-label">Deposit</label>
            <input type="text" class="form-control" name="unit">
        </div>
        <div class="col-12">
            <label class="form-label">Total Money</label>
            <input type="text" class="form-control" name="contractTotalMoney" disabled value="đ" id="result">
        </div>
        <div class="col-12">
            <label class="form-label">Customer Name</label>
            <select name="customerName" class="form-select" onchange="">
                <c:forEach items="${contract}" var="item">
                    <option value="${item.getCustomerName()}">${item.getCustomerName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-12">
            <label class="form-label">Service Name</label>
            <select name="serviceName" class="form-select">
                <c:forEach items="${contract}" var="item">
                    <option value="${item.getServiceName()}">${item.getServiceName()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-12">
            <button type="button" class="btn btn-primary" onclick="objCheck()">+</button>
        </div>
        <div class="col-12" id="check-box">
            <table class="table">
                <tr class="bg-primary" style="color: white">
                    <th>Id</th>
                    <th>Name</th>
                    <th>Cost</th>
                    <th>Unit</th>
                    <th>Status</th>
                </tr>
                <c:forEach items="${attach}" var="item">
                    <tr>
                        <td>${item.getAttachServiceId()}</td>
                        <td>${item.getAttachServiceName()}</td>
                        <td>${item.getAttachServiceCost()}</td>
                        <td>${item.getAttachServiceUnit()}</td>
                        <td>${item.getAttachServiceStatus()}</td>
                    </tr>
                </c:forEach>
            </table>
            <div>
                <%
                    int count = 1;
                    int name = 1;
                    int money = 1;
                %>
                <c:forEach items="${attach}" var="item">
                    <button class="btn btn-primary" type="button" value="${item.getAttachServiceCost()}" id="<%=count++%>" onclick="total<%=money++%>(${item.getAttachServiceId()})"><%=name++%></button>
                </c:forEach>
                    <button class="btn btn-primary" type="button" onclick="resetMoney()" value="0" id="reset">reset money</button>
            </div>
            <div id="message">
                <span>Bạn đã chọn: </span>
                <span id="selected" ></span>
            </div>
        </div>
        <div>
            <input type="text" hidden name="attachId" id="attachId">
        </div>
        <div class="col-12">
            <a href="/contract" class="btn btn-primary">Close</a>
            <input type="submit" class="btn btn-primary" value="Create Contract">
        </div>
    </form>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    document.getElementById("check-box").style.display ="none";
    function objCheck() {
        document.getElementById("check-box").style.display = "block";
    }

    let moneyId1 = document.getElementById("1").value;
    let moneyId2 = document.getElementById("2").value;
    let moneyId3 = document.getElementById("3").value;
    let moneyId4 = document.getElementById("4").value;
    let moneyId5 = document.getElementById("5").value;
    let moneyId6 = document.getElementById("6").value;
    let moneyReset = document.getElementById("reset").value;
    let result = 0;

    document.getElementById("message").style.display = "none";

    function total1(id) {
        moneyId1 = parseInt(moneyId1);
        result += moneyId1;
        document.getElementById("attachId").value = id;
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function total2(id) {
        moneyId2 = parseInt(moneyId2);
        result += moneyId2;
        document.getElementById("attachId").value = id;
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function total3(id) {
        moneyId3 = parseInt(moneyId3);
        result += moneyId3;
        document.getElementById("attachId").value = id
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function total4(id) {
        moneyId4 = parseInt(moneyId4);
        result += moneyId4;
        document.getElementById("attachId").value = id
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function total5(id) {
        moneyId5 = parseInt(moneyId5);
        result += moneyId5;
        document.getElementById("attachId").value = id
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function total6(id) {
        moneyId6 = parseInt(moneyId6);
        result += moneyId6;
        document.getElementById("attachId").value = id
        document.getElementById("result").value = result;
        document.getElementById("message").style.display = "block";
        document.getElementById("selected").innerText = id;
    }
    function resetMoney() {
        moneyReset = parseInt(moneyReset);
        result = moneyReset;
        document.getElementById("result").value = result;
    }
</script>
</html>

