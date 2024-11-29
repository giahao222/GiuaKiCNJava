package com.example.SpringCommerce.repository;

import com.example.SpringCommerce.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    // Có thể thêm các truy vấn tùy chỉnh nếu cần
}
