package repository;

import model.Employee;

import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository{
    private static List<Employee> employeeList = new ArrayList<>();

    static {
        employeeList.add(new Employee(1, "Nguyen Van A", "1"));
        employeeList.add(new Employee(2, "Nguyen Van B", "0"));
        employeeList.add(new Employee(3, "Nguyen Van C", "1"));
    }

    @Override
    public List<Employee> findAll() {
        return employeeList;
    }

    @Override
    public Employee findById(int id) {
        return employeeList.get(id - 1);
    }

    @Override
    public void create(Employee employee) {
        employeeList.add(employee);
    }

    @Override
    public void update(int id, Employee employee) {
        employeeList.set(id - 1, employee);
    }

    @Override
    public void delete(int id) {
        employeeList.remove(id - 1);
    }

    @Override
    public List<Employee> search(String name) {
        List<Employee> searchList = new ArrayList<>();
        for (Employee item: employeeList) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }
}
