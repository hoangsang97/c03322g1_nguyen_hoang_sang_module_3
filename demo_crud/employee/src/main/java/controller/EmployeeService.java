package controller;

import model.Employee;
import service.EmployeeServiceImpl;
import service.IEmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee", "/"})
public class EmployeeService extends HttpServlet {
    static List<Employee> employeeList = new ArrayList<>();
    private IEmployeeService employeeService = new EmployeeServiceImpl();
    private EmployeeServiceImpl employeeCountId = new EmployeeServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateEmployee(request, response);
                break;
            case "edit" :
                showEditEmployee(request, response);
                break;
            case "delete":
                showDeleteEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit" :
                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        employeeList = employeeService.findAll();

        request.setAttribute("employee", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String level = request.getParameter("level");
        int id = employeeCountId.count() + 1;

        Employee employee = new Employee(id, name, gender, level);
        employeeService.create(employee);
        response.sendRedirect("/employee");
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("employee/edit.jsp").forward(request, response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String id_level = request.getParameter("id_level");
        System.out.println(id_level);
        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = employeeService.findById(id);
        employee.setName(name);
        employee.setGender(gender);
        employee.setLevel(id_level);

        employeeService.update(id, employee);

        response.sendRedirect("/employee");
    }

    private void showDeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("employee/delete.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);

        employeeList = employeeService.findAll();
        request.setAttribute("employee", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameSearch");
        employeeList = employeeService.search(name);

        request.setAttribute("employee", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }
}
