package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "FilterUTF8", value = "/*")
public class FilterUTF8 implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest)request;
        String uriLogin = req.getRequestURI();
        HttpServletResponse resp = (HttpServletResponse)response;
        if (uriLogin.equals("/login") || req.getSession().getAttribute("userNameSession") != null) {
            chain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("/login").forward(req, resp);
        }
    }
}
