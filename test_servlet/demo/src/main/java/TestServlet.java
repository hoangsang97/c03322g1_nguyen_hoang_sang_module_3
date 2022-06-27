import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TestServlet", value = "/TestServlet")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        double total = price * amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Tên sản phẩm: " + product);
        writer.println("<h1>tổng giá: " + total);
        writer.println("</html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        double total = price * amount;

//        request.setAttribute("result", total);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
//        dispatcher.forward(request, response);

        request.setAttribute("result", total);
        request.getRequestDispatcher("/index.jsp").forward(request, response);

//        response.sendRedirect("/index.jsp");
    }
}
