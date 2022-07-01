package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    Employee findById(int id);

    void create(Employee employee);

    void update(int id, Employee employee);

    void delete(int id);

    List<Employee> search(String name);

    List<Employee> findAllProcedure();

    void procedureUpdate(int id, Employee employee);

    void procedureDelete(int id);

    String callTransaction();
}
