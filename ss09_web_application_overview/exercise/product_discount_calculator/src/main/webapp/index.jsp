<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 27/06/2022
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>$Title$</title>
<style>
  #content {
    width: 450px;
    margin: 0 auto;
    padding: 0 20px 20px;
    background: white;
    border: 2px solid navy;
  }

  label {
    width: 10em;
    padding-right: 1em;
    float: left;
  }

  #data input {
    float: left;
    width: 15em;
    margin-bottom: 0.5em;
  }
</style>
</head>
<body>
<div id="content">
    <form action="/ServletDemo" method="post">
        <div id="data">
            <label>Product description</label>
            <input type="text" name="description">
            <br>
            <label>Price</label>
            <input type="text" name="price">
            <br>
            <label>discount percent</label>
            <input type="text" name="discount">
        </div>
        <div>
            <br>
            <input type="submit" value="Discount Product">
        </div>
    </form>

    <h3>Product description: ${description}</h3>
    <h3>Discount Amount: ${discount}</h3>
    <h3>Discount Price: ${total}</h3>
</div>
</body>
</html>
