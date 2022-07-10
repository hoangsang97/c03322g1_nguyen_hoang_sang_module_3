package service;

import dto.TeacherDto;
import model.Teacher;

import java.util.List;
import java.util.Map;

public interface ITeacherService {
    List<TeacherDto> findAll();

    Teacher findId(int id);

    Map<String, String> create(Teacher teacher);

    void update(int id, Teacher teacher);

    void delete(int id);

    List<TeacherDto> search(String name);
}
