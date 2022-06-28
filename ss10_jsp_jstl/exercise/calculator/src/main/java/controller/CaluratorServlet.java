package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CaluratorServlet", value = "/CaluratorServlet")
public class CaluratorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = 0;
        double secondOperand = 0;
        try {
            firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
            secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        } catch (Exception e) {
            e.getMessage();
        }

        String operator = request.getParameter("operator");
        double result = 0;
        switch (operator) {
            case "+" :
                result = firstOperand + secondOperand;
                break;
            case "-" :
                result = firstOperand - secondOperand;
                break;
            case "*" :
                result = firstOperand * secondOperand;
                break;
            case "/" :
                if (firstOperand == 0 || secondOperand == 0) {
                    throw new RuntimeException ("Phép chia không hợp lệ");
                } else {
                    result = firstOperand / secondOperand;
                    break;
                }
        }

        request.setAttribute("result", result);
        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("operator", operator);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
