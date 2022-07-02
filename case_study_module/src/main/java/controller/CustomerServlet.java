package controller;

import dto.CustomerDto;
import model.customer.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer", "/"} )
public class CustomerServlet extends HttpServlet {
    private static ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateCustomer(request, response);
                break;
            case "edit":
                showUpdateCustomer(request, response);
                break;
            default:
                showListCustomer(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerDto> customerDtoList = customerService.findAll();
        request.setAttribute("customer", customerDtoList);
        request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        System.out.println("đã vào");

        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, typeId, address);
        customerService.create(customer);
        response.sendRedirect("/customer");
    }

    private void showUpdateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id  = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/view/customer/edit.jsp").forward(request, response);
        System.out.println(customer);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        int gender = Integer.parseInt(request.getParameter("gender"));

        Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, typeId, address);
        customerService.update(id, customer);
        response.sendRedirect("/customer");
    }
}
