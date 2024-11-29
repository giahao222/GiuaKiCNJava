package com.example.SpringCommerce.repository;

import com.example.SpringCommerce.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
    // Thêm các phương thức tìm kiếm nếu cần
}
