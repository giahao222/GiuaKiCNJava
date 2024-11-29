package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.Order;
import com.example.SpringCommerce.model.OrderItem;
import com.example.SpringCommerce.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/create")
    public Order createOrder(@RequestBody OrderRequest orderRequest) {
        // Lấy đơn hàng và danh sách các sản phẩm từ request
        Order order = orderRequest.getOrder();
        List<OrderItem> orderItems = orderRequest.getOrderItems();

        return orderService.createOrder(order, orderItems);
    }

    @GetMapping("/")
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    // Các API khác như cập nhật trạng thái đơn hàng...
}
