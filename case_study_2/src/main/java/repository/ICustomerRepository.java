package repository;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    Customer findById(int id);

    void create(Customer customer);

    void delete(int id);

    void update(int id, Customer customer);

    List<Customer> search(String name);
}
