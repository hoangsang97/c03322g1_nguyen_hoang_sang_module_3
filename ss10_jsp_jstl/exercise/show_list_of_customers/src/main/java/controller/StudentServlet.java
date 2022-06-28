package controller;

import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student", "/"})
public class StudentServlet extends HttpServlet {
    static List<Student>  studentList = new ArrayList<>();
    static {
        studentList.add(new Student("Mai Van Hoan", "1983-08-20", "Ha Noi", "https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
        studentList.add(new Student("Nguyen Van Nam", "1983-08-21", "Bac Giang", "https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg     width: 50px;\n" +
                "    height: 50px;"));
        studentList.add(new Student("Nguyen Thai Hoa", "1983-08-22", "Nam Dinh", "https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
        studentList.add(new Student("Nguyen Van Khoa", "1983-08-23", "Ha Tay", "https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
        studentList.add(new Student("nguyen Dinh Thi", "1983-08-24", "Ha Noi", "https://photocross.net/wp-content/uploads/2020/03/anh-chan-dung.jpg"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }
}
