package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService{
    static Map<Integer, Customer> customerMap = new HashMap<>();

    static {
        customerMap.put(1, new Customer(1, "Dan", "18", "DN"));
        customerMap.put(2, new Customer(2, "Dan1", "19", "Qn"));
        customerMap.put(3, new Customer(3, "Dan2", "20", "BD"));
        customerMap.put(4, new Customer(4, "Dan3", "21", "HN"));
        customerMap.put(5, new Customer(5, "Dan4", "22", "SG"));
    }

    @Override
    public List<Customer> fillAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public Customer fillById(int id) {
        return customerMap.get(id);
    }

    @Override
    public void add(Customer customer) {
        customerMap.put(customer.getId(), customer);
    }

    @Override
    public void delete(int id) {
        customerMap.remove(id);
    }

    @Override
    public void edit(int id, Customer customer) {

    }

    @Override
    public void search(String name) {

    }

    public int countId() {
        return customerMap.size();
    }
}
