<%--
  Created by IntelliJ IDEA.
  User: hoangsangnguyen
  Date: 27/06/2022
  Time: 08:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String description = request.getParameter("description");
    float price = Float.parseFloat(request.getParameter("price"));
    int discount_percent = Integer.parseInt(request.getParameter("discount"));
    float discount = (float) (price * discount_percent * 0.01);
    float total = price - discount;
%>
<h1>product description: <%=description%></h1>
<h1>price: <%=price%></h1>
<h1>discount_percent : <%=discount_percent%></h1>
<h1>discount: <%=discount%></h1>
<h1>total: <%=total%></h1>
</body>
</html>
