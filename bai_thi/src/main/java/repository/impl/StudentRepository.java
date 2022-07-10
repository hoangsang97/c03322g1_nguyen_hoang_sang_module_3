package repository.impl;

import dto.StudentDto;
import model.Student;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<StudentDto> studentDtoList = new ArrayList<>();
    private static final String FIND_ALL = " select s.student_id, s.student_name, s.student_birthday, c.class_name, l.level_name from student s " +
            " join class c on s.class_id = c.class_id " +
            " join `level` l on s.level_id = l.level_id " +
            " where s.status = 0 " +
            " order by s.student_id ";
    private static final String FIND_ID = " select student_id, student_name, student_birthday, class_id, level_id from student " +
            " where student_id = ? ";
    private static final String INSERT = " insert into student(student_name, student_birthday, class_id, level_id) " +
            " values (?, ?, ?, ?) ";
    private static final String DELETE = " update student set status = 1 where student_id = ? ";
    private static final String UPDATE = " update student set student_name = ?, student_birthday = ?, class_id = ?, level_id = ? where student_id = ? ";
    private static final String SEARCH = " select s.student_id, s.student_name, s.student_birthday, c.class_name, l.level_name from student s " +
            " join class c on s.class_id = c.class_id " +
            " join `level` l on s.level_id = l.level_id " +
            " where s.status = 0 and s.student_name like ? " +
            " order by s.student_id ";

    @Override
    public List<StudentDto> findAll() {
        studentDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            StudentDto studentDto;
            while (resultSet.next()) {
                int id = resultSet.getInt("student_id");
                String name = resultSet.getString("student_name");
                String birthday = resultSet.getString("student_birthday");
                String className = resultSet.getString("class_name");
                String levelName = resultSet.getString("level_name");
                studentDto = new StudentDto(id, name, birthday, className, levelName);
                studentDtoList.add(studentDto);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentDtoList;
    }

    @Override
    public Student findId(int id) {
        Connection connection = new BaseRepository().getConnection();
        Student student = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int idS = resultSet.getInt("student_id");
                String name = resultSet.getString("student_name");
                String birthday = resultSet.getString("student_birthday");
                int classId = resultSet.getInt("class_id");
                int levelId = resultSet.getInt("level_id");
                student = new Student(idS, name, birthday, classId, levelId);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return student;
    }

    @Override
    public void create(Student student) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getStudentBirthday());
            preparedStatement.setInt(3, student.getClassId());
            preparedStatement.setInt(4, student.getLevelId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(int id, Student student) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getStudentBirthday());
            preparedStatement.setInt(3, student.getClassId());
            preparedStatement.setInt(4, student.getLevelId());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<StudentDto> search(String name) {
        studentDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            StudentDto studentDto;
            while (resultSet.next()) {
                int id = resultSet.getInt("student_id");
                String nameS = resultSet.getString("student_name");
                String birthday = resultSet.getString("student_birthday");
                String className = resultSet.getString("class_name");
                String levelName = resultSet.getString("level_name");
                studentDto = new StudentDto(id, nameS, birthday, className, levelName);
                studentDtoList.add(studentDto);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return studentDtoList;
    }
}
