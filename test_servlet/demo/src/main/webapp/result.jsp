<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 27/06/2022
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String product = request.getParameter("product");
    double price = Double.parseDouble(request.getParameter("price"));
    int amount = Integer.parseInt(request.getParameter("amount"));
    double total = price * amount;

    request.setAttribute("result", total);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
    dispatcher.forward(request, response);
%>
<%--<h1>Tên sản phẩm: <%=product%></h1>--%>
<%--<h1>Tổng giá: <%=total%></h1>--%>
</body>
</html>
