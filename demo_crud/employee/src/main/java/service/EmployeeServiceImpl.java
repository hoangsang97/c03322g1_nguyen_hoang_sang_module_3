package service;

import model.Employee;
import repository.EmployeeRepositoryImpl;
import repository.IEmployeeRepository;

import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService{
    private IEmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public void create(Employee employee) {
        employeeRepository.create(employee);
    }

    @Override
    public void update(int id, Employee employee) {
        employeeRepository.update(id, employee);
    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

    @Override
    public List<Employee> search(String name) {
        return employeeRepository.search(name);
    }

    @Override
    public List<Employee> findAllProcedure() {
        return employeeRepository.findAllProcedure();
    }

    @Override
    public void procedureUpdate(int id, Employee employee) {
        employeeRepository.procedureUpdate(id, employee);
    }

    @Override
    public void procedureDelete(int id) {
        employeeRepository.procedureDelete(id);
    }

    @Override
    public String callTransaction() {
        return employeeRepository.callTransaction();
    }

    public int count() {
       return employeeRepository.findAll().get(employeeRepository.findAll().size() -1).getId();
    }
}
