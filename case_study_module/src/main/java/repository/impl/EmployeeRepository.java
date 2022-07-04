package repository.impl;

import dto.CustomerDto;
import dto.EmployeeDto;
import model.customer.Customer;
import model.employee.Employee;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    public static List<EmployeeDto> employeeDtoList = new ArrayList<>();
    private static final String FIND_ALL = " select e.employee_id, e.employee_name, e.employee_birthday, e.employee_id_card, e.employee_salary, e.employee_phone, e.employee_email, e.employee_address, p.position_name, ed.education_degree_name, d.division_name " +
            " from employee e " +
            " join `position` p on e.position_id = p.position_id " +
            " join education_degree ed on e.education_degree_id = ed.education_degree_id " +
            " join division d on e.division_id = d.division_id " +
            " order by e.employee_id ";
    private static final String FIND_BY_ID = " select * from employee where employee_id = ? ";
    private static final String INSERT = " insert into employee(employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id , division_id) " +
            " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String UPDATE = " update employee set employee_name = ?, employee_birthday = ?, employee_id_card = ?, employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ?, education_degree_id = ?, division_id = ? " +
            " where employee_id = ? ";
    private static final String DELETE = " delete from employee where employee_id = ? ";
    private static final String SEARCH = " select e.employee_id, e.employee_name, e.employee_birthday, e.employee_id_card, e.employee_salary, e.employee_phone, e.employee_email, e.employee_address, p.position_name, ed.education_degree_name, d.division_name " +
            " from employee e " +
            " join `position` p on e.position_id = p.position_id " +
            " join education_degree ed on e.education_degree_id = ed.education_degree_id " +
            " join division d on e.division_id = d.division_id " +
            " where e.employee_name like ? " +
            " order by e.employee_id ";

    @Override
    public List<EmployeeDto> findAll() {
        employeeDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            EmployeeDto employeeDto = null;
            while (resultSet.next()) {
                int EmployeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getDouble("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                String positionName = resultSet.getString("position_name");
                String educationDegreeName = resultSet.getString("education_degree_name");
                String divisionName = resultSet.getString("division_name");
                employeeDto = new EmployeeDto(EmployeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionName, educationDegreeName, divisionName);
                employeeDtoList.add(employeeDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeDtoList;
    }

    @Override
    public Employee findById(int id) {
        Connection connection = new BaseRepository().getConnection();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int EmployeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getDouble("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                int positionId = Integer.parseInt(resultSet.getString("position_id"));
                int educationDegreeId = Integer.parseInt(resultSet.getString("education_degree_id"));
                int divisionId = Integer.parseInt(resultSet.getString("division_id"));
                employee = new Employee(EmployeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public void create(Employee employee) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Employee employee) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getEmployeeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<EmployeeDto> search(String name) {
        Connection connection = new BaseRepository().getConnection();
        employeeDtoList.clear();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            EmployeeDto employeeDto = null;
            while (resultSet.next()) {
                int EmployeeId = resultSet.getInt("employee_id");
                String employeeName = resultSet.getString("employee_name");
                String employeeBirthday = resultSet.getString("employee_birthday");
                String employeeIdCard = resultSet.getString("employee_id_card");
                double employeeSalary = resultSet.getDouble("employee_salary");
                String employeePhone = resultSet.getString("employee_phone");
                String employeeEmail = resultSet.getString("employee_email");
                String employeeAddress = resultSet.getString("employee_address");
                String positionName = resultSet.getString("position_name");
                String educationDegreeName = resultSet.getString("education_degree_name");
                String divisionName = resultSet.getString("division_name");
                employeeDto = new EmployeeDto(EmployeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress, positionName, educationDegreeName, divisionName);
                employeeDtoList.add(employeeDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeDtoList;
    }
}
