package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Order;
import com.example.SpringCommerce.model.OrderItem;
import com.example.SpringCommerce.repository.OrderRepository;
import com.example.SpringCommerce.repository.OrderItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    public Order createOrder(Order order, List<OrderItem> orderItems) {
        // Lưu đơn hàng
        Order savedOrder = orderRepository.save(order);

        // Lưu các sản phẩm trong đơn hàng
        for (OrderItem orderItem : orderItems) {
            orderItem.setOrder(savedOrder);
            orderItemRepository.save(orderItem);
        }

        return savedOrder;
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    // Các phương thức khác như tìm đơn hàng theo id, cập nhật trạng thái đơn hàng...
}
