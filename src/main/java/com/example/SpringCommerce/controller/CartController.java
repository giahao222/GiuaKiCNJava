package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.Cart;
import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.service.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/add")
    public String addToCart(@RequestParam Long productId, @RequestParam Integer quantity, @RequestParam String productName, @RequestParam Double price, @RequestParam String productImg, Model model) {
        cartService.addToCart(productId, quantity, productName, price, productImg);
        return "redirect:/";
    }

    @GetMapping("")
    public String viewCart(Model model) {
        List<Cart> cartItems = cartService.getAllCarts();
        model.addAttribute("cartItems", cartItems);
        return "cart"; // Đây là trang giỏ hàng
    }

    @GetMapping("/clear")
    public String clearCart() {
        cartService.clearCart();
        return "redirect:/";
    }

    @GetMapping("/delete/{productId}")
    public String removeFromCart(@PathVariable("productId") Long id) {
        cartService.removeProductFromCart(id); // Gọi service để xóa
        return "redirect:/cart";
    }
}