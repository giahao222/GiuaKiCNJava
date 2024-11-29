package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/products")
    public String listProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products); // Truyền danh sách sản phẩm vào view
        return "index"; // Tên file HTML
    }

    @GetMapping("/products/{id}")
    public String productDetail(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product); // Truyền sản phẩm vào view
        return "detail"; // Tên file HTML chi tiết sản phẩm
    }
}