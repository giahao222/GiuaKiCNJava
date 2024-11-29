package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.Order;
import com.example.SpringCommerce.model.OrderItem;
import java.util.List;

public class OrderRequest {
    private Order order;
    private List<OrderItem> orderItems;

    // Getters và Setters

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
