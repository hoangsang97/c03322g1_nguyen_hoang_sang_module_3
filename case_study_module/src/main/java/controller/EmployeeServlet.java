package controller;

import dto.CustomerDto;
import dto.EmployeeDto;
import model.customer.Customer;
import model.employee.Employee;
import service.ICustomerService;
import service.IEmployeeService;
import service.impl.CustomerService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private static IEmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "edit":
                showUpdateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                showListEmployee(request, response);
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
                createEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EmployeeDto> employeeDtoList = employeeService.findAll();
        request.setAttribute("employee", employeeDtoList);
        request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));

        Employee employee = new Employee(name, birthday, idCard, salary, phone, email, address, position, educationDegree, division);
        employeeService.create(employee);
        response.sendRedirect("/employee");
    }

    private void showUpdateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id  = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/view/employee/edit.jsp").forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));

        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, position, educationDegree, division);
        employeeService.update(id, employee);
        response.sendRedirect("/employee");
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);
        response.sendRedirect("/employee");
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameSearch = request.getParameter("nameSearch");
        List<EmployeeDto> employeeDtoList = employeeService.search(nameSearch);
        request.setAttribute("employee", employeeDtoList);
        request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);
    }
}
