package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Cart;
import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.repository.CartRepository;
import com.example.SpringCommerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

public interface CartService {
    public Cart addToCart(Long productId, Integer quantity, String productName, Double price, String productImg);

    public List<Cart> getAllCarts();

    public void clearCart();

    public void removeProductFromCart(Long productId);

    public Optional<Cart> getCartById(Long productId);

}