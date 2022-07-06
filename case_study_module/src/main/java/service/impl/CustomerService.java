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
            errors.put("errName", "Chữ cái đàu phải viết hoa");
        }

        if (customer.getCustomerPhone().equals("")) {
            errors.put("errPhone", "Sđt Không được để rỗng");
        } else if (!CheckRegex.checkPhone(customer.getCustomerPhone())) {
            errors.put("errPhone", "đầu số phải là 090 | 080");
        }

        if (customer.getCustomerIdCard().equals("")) {
            errors.put("errIdCard", "Không được để rỗng idCard");
        } else if (!CheckRegex.checkIdCard(customer.getCustomerIdCard())) {
            errors.put("errIdCard", "Id Card phải có 9 số");
        }

        if (customer.getCustomerBirthday().equals("")) {
            errors.put("errBirthday", "ngày sinh không đươc rỗng");
        } else if (!CheckRegex.checkBirthday(customer.getCustomerBirthday())) {
            errors.put("errBirthday", "nhập không đúng định dạng YYYY/MM/DD");
        }

        if (customer.getCustomerEmail().equals("")) {
            errors.put("errEmail", "email không đươc rỗng");
        } else if (!CheckRegex.checkEmail(customer.getCustomerEmail())) {
            errors.put("errEmail", "nhập không đúng định dạng email@xyz.com");
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
    public List<CustomerDto> search(String name , String id, String email) {
        return customerRepository.search(name, id, email);
    }
}
