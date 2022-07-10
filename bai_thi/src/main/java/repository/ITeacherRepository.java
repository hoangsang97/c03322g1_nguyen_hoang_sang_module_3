package repository;

import dto.TeacherDto;
import model.Teacher;

import java.util.List;

public interface ITeacherRepository {
    List<TeacherDto> findAll();

    Teacher findId(int id);

    void create(Teacher teacher);

    void update(int id, Teacher teacher);

    void delete(int id);

    List<TeacherDto> search(String name);
}
