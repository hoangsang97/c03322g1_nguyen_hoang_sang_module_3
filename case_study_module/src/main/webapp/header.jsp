<%@ page import="model.user.User" %><%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/7/2022
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

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
        width: 100%;
    }

    .nav-right ul {
        display: flex;
        justify-content: space-around;
    }
</style>
<div class="header">
    <div class="header-left">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" alt="">
    </div>
    <div class="header-right">
        <span class="text-success">
            <%=request.getSession().getAttribute("userNameSession")!=null?((User)session.getAttribute("userNameSession")).getName() : ""%>
        </span>
        <span class="text-success">
            <%=request.getSession().getAttribute("userNameSession") == null ? ("<a href='/login'>Login</a>") : ("<a href='/logout'>Logout</a>")%>
        </span>
    </div>
</div>

<div class="nav">
    <div class="nav-right">
        <ul>
            <li><a href="/home">Home</a></li>
            <li><a href="/employee">Employee</a></li>
            <li><a href="/customer">Customer</a></li>
            <li><a href="/facility">Facility</a></li>
            <li><a href="/contract">Contract</a></li>
        </ul>
    </div>
</div>
