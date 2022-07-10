package service.impl;

import common.CheckRegex;
import dto.StudentDto;
import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService implements IStudentService {
    private static IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<StudentDto> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Student findId(int id) {
        return studentRepository.findId(id);
    }

    @Override
    public Map<String, String> create(Student student) {
        Map<String, String> errors = validate(student);

        if (errors.isEmpty()) {
            studentRepository.create(student);
        }
        return errors;
    }

    private Map<String, String> validate(Student student) {
        Map<String, String> errors = new HashMap<>();
        if (student.getStudentName().equals("")) {
            errors.put("errName", "Tên không được để rỗng!");
        } else if (!CheckRegex.checkName(student.getStudentName())) {
            errors.put("errName", "Tên phải có chữ cái đầu viết hoa!");
        }

        if (student.getStudentBirthday().equals("")) {
            errors.put("errBirthday", "Ngày sinh không được để rỗng!");
        } else if (!CheckRegex.checkBirthday(student.getStudentBirthday())) {
            errors.put("errBirthday", "Ngày sinh phải có kiểu yyyy/mm/dd!");
        }

        return errors;
    }

    @Override
    public Map<String, String> update(int id, Student student) {
        Map<String, String> errors = validate(student);

        if (errors.isEmpty()) {
            studentRepository.update(id, student);
        }

        return errors;
    }

    @Override
    public void delete(int id) {
        studentRepository.delete(id);
    }

    @Override
    public List<StudentDto> search(String name) {
        return studentRepository.search(name);
    }
}
