package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void update(int id, Employee employee);

    void delete(int id);

    List<Employee> search(String name);
}
