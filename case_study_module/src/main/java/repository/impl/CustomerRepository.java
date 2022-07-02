package repository.impl;

import dto.CustomerDto;
import model.customer.Customer;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    public static List<CustomerDto> customerDtoList = new ArrayList<>();
    private static final String FIND_ALL = " select c.customer_id, ct.customer_type_name, c.customer_name, c.customer_birthday, c.customer_gender, c.customer_id_card, c.customer_phone, c.customer_email, c.customer_address " +
            " from customer c " +
            " join customer_type ct on c.customer_type_id = ct.customer_type_id order by c.customer_id ";
    private static final String FIND_BY_ID = " select * from customer where customer_id = ? ";
    private static final String SELECT = " insert into customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) " +
            " values (?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String UPDATE = " update customer set customer_type_id = ?, customer_name = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? " +
            " where customer_id = ? ";

    @Override
    public List<CustomerDto> findAll() {
        customerDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerDto customerDto = null;
            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String customerTypeName = resultSet.getString("customer_type_name");
                String customerName = resultSet.getString("customer_name");
                String customerBirthday = resultSet.getString("customer_birthday");
                int customerGender = resultSet.getInt("customer_gender");
                String customerIdCard = resultSet.getString("customer_id_card");
                String customerPhone = resultSet.getString("customer_phone");
                String customerEmail = resultSet.getString("customer_email");
                String customerAddress = resultSet.getString("customer_address");
                customerDto = new CustomerDto(customerId, customerTypeName, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);
                customerDtoList.add(customerDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerDtoList;
    }

    @Override
    public Customer findById(int id) {
        Connection connection = new BaseRepository().getConnection();
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String customerName = resultSet.getString("customer_name");
                String customerBirthday = resultSet.getString("customer_birthday");
                int customerGender = resultSet.getInt("customer_gender");
                String customerIdCard = resultSet.getString("customer_id_card");
                String customerPhone = resultSet.getString("customer_phone");
                String customerEmail = resultSet.getString("customer_email");
                int customerTypeId = Integer.parseInt(resultSet.getString("customer_type_id"));
                String customerAddress = resultSet.getString("customer_address");
                customer = new Customer(customerId, customerName, customerBirthday, customerGender, customerIdCard, customerPhone, customerEmail, customerTypeId, customerAddress);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public void create(Customer customer) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Customer customer) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> search(String name) {
        return null;
    }
}
