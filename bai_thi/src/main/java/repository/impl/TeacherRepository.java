package repository.impl;

import dto.StudentDto;
import dto.TeacherDto;
import model.Teacher;
import repository.ITeacherRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherRepository implements ITeacherRepository {
    private static List<TeacherDto> teacherDtoList = new ArrayList<>();
    private static final String FIND_ALL = " select t.teacher_id, t.teacher_name, t.teacher_id_card, c.class_name from teacher t " +
            " join class c on t.class_id = c.class_id " +
            " where t.status = 0 " +
            " order by t.teacher_id ";
    private static final String INSERT = " insert into teacher(teacher_name, teacher_id_card, class_id) " +
            " values (?, ?, ?) ";
    private static final String UPDATE = " update teacher set teacher_name = ?, teacher_id_card = ?, class_id = ? where teacher_id = ? ";
    private static final String DELETE = " update teacher set status = 1 where teacher_id = ? ";
    private static final String SEARCH = " select t.teacher_id, t.teacher_name, t.teacher_id_card, c.class_name from teacher t " +
            " join class c on t.class_id = c.class_id " +
            " where t.status = 0 and t.teacher_name like ? " +
            " order by t.teacher_id ";

    @Override
    public List<TeacherDto> findAll() {
        teacherDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            TeacherDto teacherDto;
            while (resultSet.next()) {
                int id = resultSet.getInt("teacher_id");
                String name = resultSet.getString("teacher_name");
                String idCard = resultSet.getString("teacher_id_card");
                String className = resultSet.getString("class_name");
                teacherDto = new TeacherDto(id, name, idCard, className);
                teacherDtoList.add(teacherDto);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return teacherDtoList;
    }

    @Override
    public Teacher findId(int id) {
        return null;
    }

    @Override
    public void create(Teacher teacher) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, teacher.getTeacherName());
            preparedStatement.setString(2, teacher.getTeacherIdCard());
            preparedStatement.setInt(3, teacher.getClassId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(int id, Teacher teacher) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, teacher.getTeacherName());
            preparedStatement.setString(2, teacher.getTeacherIdCard());
            preparedStatement.setInt(3, teacher.getClassId());
            preparedStatement.setInt(4, id);
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
    public List<TeacherDto> search(String name) {
        teacherDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            TeacherDto teacherDto;
            while (resultSet.next()) {
                int id = resultSet.getInt("teacher_id");
                String nameS = resultSet.getString("teacher_name");
                String idCard = resultSet.getString("teacher_id_card");
                String className = resultSet.getString("class_name");
                teacherDto = new TeacherDto(id, nameS, idCard, className);
                teacherDtoList.add(teacherDto);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return teacherDtoList;
    }
}
