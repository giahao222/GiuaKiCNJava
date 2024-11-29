package com.example.SpringCommerce.repository;

import com.example.SpringCommerce.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
    // Có thể thêm các truy vấn tùy chỉnh nếu cần
}
