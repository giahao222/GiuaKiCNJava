package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
    }

    public List<Product> listProducts() {
        return productRepository.findAll(); // Lấy toàn bộ sản phẩm từ database
    }
}