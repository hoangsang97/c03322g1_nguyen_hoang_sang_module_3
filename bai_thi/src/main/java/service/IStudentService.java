package service;

import dto.StudentDto;
import model.Student;

import java.util.List;
import java.util.Map;

public interface IStudentService {
    List<StudentDto> findAll();

    Student findId(int id);

    Map<String, String> create(Student student);

    Map<String, String> update(int id, Student student);

    void delete(int id);

    List<StudentDto> search(String name);
}
