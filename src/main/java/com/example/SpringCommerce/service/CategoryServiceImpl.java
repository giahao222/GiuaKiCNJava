package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Category;
import com.example.SpringCommerce.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> getAllCategories() {
        List<Category> categories = categoryRepository.findAll();
        System.out.println("Categories: " + categories);  // In dữ liệu ra console
        return categories;
    }
}
