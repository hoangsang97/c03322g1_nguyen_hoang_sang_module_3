<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 27/06/2022
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Test servlet</h1>
  <form action="/result.jsp" method="post">
    <div>
      <label>Tên sản phẩm</label>
      <input type="text" name="product">
      <br>
      <label>giá</label>
      <input type="text" name="price">
      <br>
      <label>số lượng</label>
      <input type="text" name="amount">
    </div>
    <div>
      <input type="submit" placeholder="submit">
    </div>
  </form>
  <h1>Tổng giá: ${result}</h1>
  </body>
</html>
