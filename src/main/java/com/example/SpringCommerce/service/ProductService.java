package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<Product> getAllProducts();

    public Product getProductById(Long id);

    public List<Product> listProducts();
}