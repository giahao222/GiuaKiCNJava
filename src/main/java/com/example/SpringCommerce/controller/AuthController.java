package com.example.SpringCommerce.controller;

import com.example.SpringCommerce.model.User;
import com.example.SpringCommerce.repository.UserRepository;
import com.example.SpringCommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepo;
    @Autowired
    private ProductService productService;

    @GetMapping("/login")
    public String login() {
        return "login.html"; // Trả về view login.html
    }

    @GetMapping("/")
    public String homepage(Model model) {
        model.addAttribute("products", productService.listProducts());
        return "index"; // Trả về view homepage.html
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());

        return "register.html"; // Trả về view register.html
    }

    @PostMapping("/process_register")
    public String processRegister(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        userRepo.save(user);

        return "register_success";
    }
}