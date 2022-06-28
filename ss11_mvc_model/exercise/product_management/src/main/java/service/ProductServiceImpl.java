package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1, "iphone 5", 100, "china", "normal"));
        productMap.put(2, new Product(2, "iphone 6", 200, "america", "normal"));
        productMap.put(3, new Product(3, "iphone 7", 300, "vn", "normal"));
        productMap.put(4, new Product(4, "iphone 8", 400, "pari", "pro"));
        productMap.put(5, new Product(5, "iphone 9", 500, "china", "normal"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.get(id);
    }

    @Override
    public void search(String name) {
        productMap.get(name);
    }

    public int countId() {
        return productMap.size();
    }
}
