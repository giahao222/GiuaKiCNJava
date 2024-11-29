package com.example.SpringCommerce.repository;

import com.example.SpringCommerce.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Optional<Cart> findByCode(Long code);
    
}