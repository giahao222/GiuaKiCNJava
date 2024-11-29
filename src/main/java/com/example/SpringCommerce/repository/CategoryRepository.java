package com.example.SpringCommerce.repository;

import com.example.SpringCommerce.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    // Có thể thêm các phương thức tùy chỉnh nếu cần
}
