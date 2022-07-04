package repository;

import dto.CustomerDto;
import dto.EmployeeDto;
import model.customer.Customer;
import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<EmployeeDto> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void delete(int id);

    void update(int id, Employee employee);

    List<EmployeeDto> search(String name);
}
