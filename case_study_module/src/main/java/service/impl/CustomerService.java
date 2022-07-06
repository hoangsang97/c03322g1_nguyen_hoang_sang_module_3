package service.impl;

import common.CheckRegex;
import dto.CustomerDto;
import model.customer.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private static ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<CustomerDto> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public Map<String, String> create(Customer customer) {
        Map<String, String> errors = new HashMap<>();
        if (customer.getCustomerName().equals("")) {
            errors.put("errName", "Ten khong duoc de trong");
        } else if (!CheckRegex.checkName(customer.getCustomerName())) {
            errors.put("errName", "Ten khong duoc chua ky tu dac biet");
        }

        if (errors.isEmpty()) {
            customerRepository.create(customer);
        }
        return errors;
    }

    @Override
    public void delete(int id) {
        customerRepository.delete(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerRepository.update(id, customer);
    }

    @Override
    public List<CustomerDto> search(String name) {
        return customerRepository.search(name);
    }
}
