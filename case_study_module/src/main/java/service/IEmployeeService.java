package service;

import dto.EmployeeDto;
import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<EmployeeDto> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void delete(int id);

    void update(int id, Employee employee);

    List<EmployeeDto> search(String name);
}
