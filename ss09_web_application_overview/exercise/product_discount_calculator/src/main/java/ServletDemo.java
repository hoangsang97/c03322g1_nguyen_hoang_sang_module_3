import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletDemo", urlPatterns = "/ServletDemo")
public class ServletDemo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int discount_percent = Integer.parseInt(request.getParameter("discount"));
        float discount = (float) (price * discount_percent * 0.01);
        float total = price - discount;

//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Product Description: " + description);
//        writer.println("<h1>price: " + price);
//        writer.println("<h1>discount_percent: " + discount_percent);
//        writer.println("<h1>discount: " + discount);
//        writer.println("<h1>total: " + total);
//        writer.println("</html>");

        request.setAttribute("description", description);
        request.setAttribute("discount", discount);
        request.setAttribute("total", total);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
