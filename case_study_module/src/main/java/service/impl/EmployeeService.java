package service.impl;

import common.CheckRegex;
import dto.EmployeeDto;
import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    private static IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<EmployeeDto> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public Map<String, String> create(Employee employee) {
        Map<String, String> errors = new HashMap<>();

        if (employee.getEmployeeName().equals("")) {
            errors.put("errName", "Name không được để rỗng!");
        } else if (!CheckRegex.checkName(employee.getEmployeeName())) {
            errors.put("errName", "Chữ cái đầu tiên mỗi từ phải viết hoa!");
        }

        if (employee.getEmployeeEmail().equals("")) {
            errors.put("errEmail", "Email không được để rỗng!");
        } else if (!CheckRegex.checkEmail(employee.getEmployeeEmail())) {
            errors.put("errEmail", "Email không đúng định dạng!");
        }

        if (employee.getEmployeePhone().equals("")) {
            errors.put("errPhone", "Sđt Không được để rỗng");
        } else if (!CheckRegex.checkPhone(employee.getEmployeePhone())) {
            errors.put("errPhone", "đầu số phải là 090 | 080");
        }

        if (employee.getEmployeeBirthday().equals("")) {
            errors.put("errBirthday", "ngày sinh không đươc rỗng");
        } else if (!CheckRegex.checkBirthday(employee.getEmployeeBirthday())) {
            errors.put("errBirthday", "nhập không đúng định dạng YYYY/MM/DD");
        }

        if (employee.getEmployeeSalary() < 0) {
            errors.put("errSalary", "Lương phải là số dương!");
        }

        if (errors.isEmpty()) {
            employeeRepository.create(employee);
        }

        return errors;
    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

    @Override
    public void update(int id, Employee employee) {
        employeeRepository.update(id, employee);
    }

    @Override
    public List<EmployeeDto> search(String name) {
        return employeeRepository.search(name);
    }
}
