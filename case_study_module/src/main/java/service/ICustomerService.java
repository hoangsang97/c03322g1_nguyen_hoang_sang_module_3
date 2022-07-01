package service;

import dto.CustomerDto;
import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<CustomerDto> findAll();

    Customer findById(int id);

    void create(Customer customer);

    void delete(int id);

    void update(int id, Customer customer);

    List<Customer> search(String name);
}
