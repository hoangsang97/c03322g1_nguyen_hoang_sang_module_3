package repository;

import dto.CustomerDto;
import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<CustomerDto> findAll();

    Customer findById(int id);

    void create(Customer customer);

    void delete(int id);

    void update(int id, Customer customer);

    List<CustomerDto> search(String name, String id, String email);
}
