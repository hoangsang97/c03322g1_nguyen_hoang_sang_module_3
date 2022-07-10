package controller;

import dto.StudentDto;
import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StudentServlet", urlPatterns = "/student")
public class StudentServlet extends HttpServlet {
    private static IStudentService studentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createStudent(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
                break;
            case "update":
                updateStudent(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateStudent(request, response);
                break;
            case "update":
                showUpdateStudent(request, response);
                break;
            case "search":
                searchStudent(request, response);
                break;
            default:
                showStudentList(request, response);
                break;
        }
    }

    private void showStudentList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentDto> studentDtoList = studentService.findAll();
        request.setAttribute("student", studentDtoList);
        request.getRequestDispatcher("/view/student/list.jsp").forward(request, response);
    }

    private void showCreateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/view/student/create.jsp");
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int classId = Integer.parseInt(request.getParameter("classId"));
        int levelId = Integer.parseInt(request.getParameter("levelId"));

        Student student = new Student(name, birthday, classId, levelId);
        Map<String, String> error = studentService.create(student);
        if (error.isEmpty()) {
            response.sendRedirect("/student");
        } else {
            request.setAttribute("error", error);
            request.setAttribute("student", student);
            request.getRequestDispatcher("/view/student/create.jsp").forward(request, response);
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentService.delete(id);
        response.sendRedirect("/student");
    }

    private void showUpdateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.findId(id);
        request.setAttribute("student", student);
        request.getRequestDispatcher("/view/student/update.jsp").forward(request, response);
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int classId = Integer.parseInt(request.getParameter("classId"));
        int levelId = Integer.parseInt(request.getParameter("levelId"));

        Student student = new Student(id, name, birthday, classId, levelId);

        Map<String, String> error = studentService.update(id, student);
        if (error.isEmpty()) {
            response.sendRedirect("/student");
        } else {
            request.setAttribute("error", error);
            request.setAttribute("student", student);
            request.getRequestDispatcher("/view/student/update.jsp").forward(request, response);
        }
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<StudentDto> studentDtoList = studentService.search(name);
        request.setAttribute("student", studentDtoList);
        request.getRequestDispatcher("/view/student/list.jsp").forward(request, response);
    }
}
