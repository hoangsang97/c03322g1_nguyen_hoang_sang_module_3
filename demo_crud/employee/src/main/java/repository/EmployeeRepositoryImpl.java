package repository;

import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository{
    private static List<Employee> employeeList = new ArrayList<>();
    private static final String FIND_ALL = " SELECT e.id, e.name, e.gender, lv.level FROM employee e join `level` lv on e.id_level = lv.id_level ORDER BY e.id ";
    private static final String INSERT = " INSERT INTO employee(name, gender, id_level) values ( ?, ?, ?) ";
    private static final String FIND_BY_NAME = " SELECT * FROM employee where name like ? ";
    private static final String UPDATE = " UPDATE employee SET name = ?, gender = ?, id_level = ? WHERE id = ? ";
    private static final String DELETE = " DELETE FROM employee WHERE id = ? ";
    private static final String FIND_BY_ID = " SELECT * FROM employee WHERE id = ? ";

    @Override
    public List<Employee> findAll() {
        employeeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String level = resultSet.getString("level");

                employee = new Employee(id, name, gender, level);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> findAllProcedure() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            CallableStatement callableStatement = new BaseRepository().getConnection().prepareCall("CALL display_information()");
            ResultSet resultSet = callableStatement.executeQuery();

            Employee employee = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String level = resultSet.getString("level");

                employee = new Employee(id, name, gender, level);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public void procedureUpdate(int id, Employee employee) {
        try {
            CallableStatement callableStatement = new BaseRepository().getConnection().prepareCall("CALL update_infomation(?, ?, ?, ?)");
            callableStatement.setString(1, employee.getName());
            callableStatement.setString(2, employee.getGender());
            callableStatement.setString(3, employee.getLevel());
            callableStatement.setInt(4, employee.getId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void procedureDelete(int id) {
        try {
            CallableStatement callableStatement = new BaseRepository().getConnection().prepareCall("CALL delete_infomation( ?)");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public String callTransaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = new BaseRepository().getConnection();

        try {
            connection.setAutoCommit(false);

            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, "sang");
            preparedStatement.setString(2, "0");
            preparedStatement.setString(3, "1");

            int rowAffect = preparedStatement.executeUpdate();

            PreparedStatement preparedStatementS = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, "dan");
            preparedStatement.setString(2, "1");
            preparedStatement.setString(3, "1");

            rowAffect += preparedStatementS.executeUpdate();

            if (rowAffect == 2) {
                PreparedStatement preparedStatementSs = connection.prepareStatement(INSERT);
                preparedStatement.setString(1, "nguyễn");
                preparedStatement.setString(2, "0");
                preparedStatement.setString(3, "1");

                rowAffect += preparedStatementSs.executeUpdate();
            }

            if (rowAffect == 3) {
                connection.commit();
            } else {
                msg = "Rollback try";
                connection.rollback();
            }
        } catch (SQLException e) {
            try {
                msg = "Rollback catch";
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
        return msg;
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
                int ids = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String id_level = resultSet.getString("id_level");

                employee = new Employee(ids, name, gender, id_level);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public void create(Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getGender());
            preparedStatement.setString(3, employee.getLevel());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Employee employee) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getGender());
            preparedStatement.setString(3, employee.getLevel());
            preparedStatement.setInt(4, employee.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Employee> search(String nameS) {
        employeeList.clear();
        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1, "%" + nameS + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String gender = resultSet.getString("gender");
                String level = resultSet.getString("id_level");

                employee = new Employee(id, name, gender, level);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
