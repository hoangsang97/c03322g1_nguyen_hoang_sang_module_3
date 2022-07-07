package controller;

import model.user.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static List<User> userList = new ArrayList<>();

    static {
        userList.add(new User(1, "sang", "123", "ADMIN"));
        userList.add(new User(1, "test", "123", "MIN"));
        userList.add(new User(1, "test2", "123", "MIN"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //duyệt cookie client để lấy cookie ra
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
        // lấy dữ liệu ng dùng nhập vào
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String checkbox = request.getParameter("checkbox");

        User user = null;
        for (User us : userList) {
            if (username.equals(us.getName()) && password.equals(us.getPassword())) {
                user = us;
                break;
            }
        }

        if (user != null) {
            request.setAttribute("message", "Đặng nhập thành công!");
            request.getSession().setAttribute("userNameSession", user);

            if (checkbox != null) {
                Cookie cookieUserName = new Cookie("userNameCookie", user.getName());
                cookieUserName.setMaxAge(600 * 10000);

                Cookie cookiePassword = new Cookie("passwordCookie", user.getPassword());
                cookiePassword.setMaxAge(600 * 10000);

                response.addCookie(cookieUserName);
                response.addCookie(cookiePassword);
            }
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Đăng nhập thất bại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
