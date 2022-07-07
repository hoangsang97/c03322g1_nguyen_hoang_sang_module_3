package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();

        for (Cookie cookie: cookies) {
            if (cookie.getName().equals("userNameCookie")) {
                request.setAttribute("userNameCookie", cookie.getValue());
            }

            if (cookie.getName().equals("passwordCookie")) {
                request.setAttribute("passwordCookie", cookie.getValue());
            }
        }

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String checkbox = request.getParameter("checkbox");

        request.getSession().setAttribute("userNameSession", username);
        request.getSession().setAttribute("passwordSession", password);

        if (checkbox != null) {
            Cookie cookieUserName = new Cookie("userNameCookie", username);
            cookieUserName.setMaxAge(600 * 10000);

            Cookie cookiePassword = new Cookie("passwordCookie", password);
            cookiePassword.setMaxAge(600 * 10000);

            response.addCookie(cookieUserName);
            response.addCookie(cookiePassword);
        }

        response.sendRedirect("/home");
    }
}
