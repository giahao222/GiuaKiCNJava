package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Order;
import com.example.SpringCommerce.model.OrderItem;

import java.util.List;

public interface OrderService {
    public Order createOrder(Order order, List<OrderItem> orderItems);

    public List<Order> getAllOrders();
}
