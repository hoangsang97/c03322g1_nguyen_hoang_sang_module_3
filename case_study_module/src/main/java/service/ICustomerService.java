package service;

import dto.CustomerDto;
import model.customer.Customer;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<CustomerDto> findAll();

    Customer findById(int id);

    Map<String, String> create(Customer customer);

    void delete(int id);

    void update(int id, Customer customer);

    List<CustomerDto> search(String name, String id, String email);
}
