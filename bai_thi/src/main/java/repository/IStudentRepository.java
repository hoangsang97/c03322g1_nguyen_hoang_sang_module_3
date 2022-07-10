package repository;

import dto.StudentDto;
import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<StudentDto> findAll();

    Student findId(int id);

    void create(Student student);

    void update(int id, Student student);

    void delete(int id);

    List<StudentDto> search(String name);
}
