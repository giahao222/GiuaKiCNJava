package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.Category;
import com.example.SpringCommerce.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/categories")
    public String getCategories(Model model) {
        List<Category> categories = categoryService.getAllCategories();
        System.out.println("Categories from controller: " + categories);  // Kiểm tra dữ liệu
        model.addAttribute("categories", categories);
        return "category-list";
    }
}
