package repository.impl;

import model.customer.Customer;
import repository.ICustomerRepository;

import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    @Override
    public List<Customer> findAll() {
        return null;
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public void create(Customer customer) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Customer customer) {

    }

    @Override
    public List<Customer> search(String name) {
        return null;
    }
}
