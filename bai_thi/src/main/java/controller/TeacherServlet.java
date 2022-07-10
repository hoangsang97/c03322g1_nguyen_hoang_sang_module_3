package controller;

import dto.StudentDto;
import dto.TeacherDto;
import model.Student;
import model.Teacher;
import service.ITeacherService;
import service.impl.TeacherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TeacherServlet", value = "/teacher")
public class TeacherServlet extends HttpServlet {
    private static ITeacherService teacherService = new TeacherService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "search":

                break;
            default:
                showTeacherList(request, response);
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
                createTeacher(request, response);
                break;
            case "delete":

                break;
            case "update":
                updateTeacher(request, response);
                break;
        }
    }

    private void showTeacherList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TeacherDto> teacherDtoList = teacherService.findAll();
        request.setAttribute("teacher", teacherDtoList);
        request.getRequestDispatcher("/view/teacher/list.jsp").forward(request, response);
    }


    private void createTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String idCard = request.getParameter("idCard");
        int classId = Integer.parseInt(request.getParameter("classId"));

        Teacher teacher = new Teacher(name, idCard, classId);
        Map<String, String> error = teacherService.create(teacher);
        if (error.isEmpty()) {
            response.sendRedirect("/teacher");
        } else {
            request.setAttribute("error", error);
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("/view/teacher/list.jsp").forward(request, response);
        }
    }

    private void updateTeacher(HttpServletRequest request, HttpServletResponse response) {

    }
}
