package service.impl;

import dto.StudentDto;
import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

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
    public void create(Student student) {
        studentRepository.create(student);
    }

    @Override
    public void update(int id, Student student) {
        studentRepository.update(id, student);
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
