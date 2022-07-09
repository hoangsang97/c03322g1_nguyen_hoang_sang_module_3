package service;

import dto.EmployeeDto;
import model.employee.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<EmployeeDto> findAll();

    Employee findById(int id);

    Map<String,String> create(Employee employee);

    void delete(int id);

    void update(int id, Employee employee);

    List<EmployeeDto> search(String name);
}
