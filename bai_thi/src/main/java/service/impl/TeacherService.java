package service.impl;

import common.CheckRegex;
import dto.TeacherDto;
import model.Teacher;
import repository.ITeacherRepository;
import repository.impl.TeacherRepository;
import service.ITeacherService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TeacherService implements ITeacherService {
    private static ITeacherRepository teacherRepository = new TeacherRepository();

    @Override
    public List<TeacherDto> findAll() {
        return teacherRepository.findAll();
    }

    @Override
    public Teacher findId(int id) {
        return teacherRepository.findId(id);
    }

    @Override
    public Map<String, String> create(Teacher teacher) {
        Map<String, String> errors = validate(teacher);

        if (errors.isEmpty()) {
            teacherRepository.create(teacher);
        }
        return errors;
    }

    private Map<String, String> validate(Teacher teacher) {
        Map<String, String> errors = new HashMap<>();
        if (teacher.getTeacherName().equals("")) {
            errors.put("errName", "Tên không được để rỗng!");
        } else if (!CheckRegex.checkName(teacher.getTeacherName())) {
            errors.put("errName", "Tên phải có chữ cái đầu viết hoa!");
        }

        if (teacher.getTeacherIdCard().equals("")) {
            errors.put("errIdCard", "Id Card không được để rỗng!");
        } else if (!CheckRegex.checkIdCard(teacher.getTeacherIdCard())) {
            errors.put("errIdCard", "Id Card phải có 9 số !");
        }

        return errors;
    }

    @Override
    public void update(int id, Teacher teacher) {
        teacherRepository.update(id, teacher);
    }

    @Override
    public void delete(int id) {
        teacherRepository.delete(id);
    }

    @Override
    public List<TeacherDto> search(String name) {
        return teacherRepository.search(name);
    }
}
