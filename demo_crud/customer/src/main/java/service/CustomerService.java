package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> fillAll();

    Customer fillById(int id);

    void add(Customer customer);

    void delete(int id);

    void edit(int id, Customer customer);

    void search(String name);
}
