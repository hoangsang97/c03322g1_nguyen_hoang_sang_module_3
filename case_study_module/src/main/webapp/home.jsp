<%--
  Created by IntelliJ IDEA.
  User: HOANG SANG
  Date: 7/1/2022
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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

        .nav-left {

        }

        .nav-left scan {
            position: absolute;
            z-index: 1;
            margin-left: 10px;
            margin-top: 5px;
        }

        .nav-left input {
            position: relative;
            border-radius: 10px;
            width: 250px;
            padding-left: 30px;
        }

        .content {
            padding: 20px;
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
                <li><a href="">Home</a></li>
                <li><a href="">Employee</a></li>
                <li><a href="/customer">Customer</a></li>
                <li><a href="">Service</a></li>
                <li><a href="">Contract</a></li>
            </ul>
        </div>
        <div class="nav-left">
            <scan>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
            </scan>
            <input type="text" placeholder="Search">
        </div>
    </div>

    <div class="main">
        <div id="content">
        </div>
    </div>

    <div class="footer">
        <p>Footer</p>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
