package com.example.SpringCommerce.service;

import com.example.SpringCommerce.model.Cart;
import com.example.SpringCommerce.model.Product;
import com.example.SpringCommerce.repository.CartRepository;
import com.example.SpringCommerce.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImpl implements CartService{

    @Autowired
    private CartRepository cartRepository;

    @Override
    public Cart addToCart(Long productId, Integer quantity, String productName, Double price, String productImg) {
        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
        Optional<Cart> existingCartItem = cartRepository.findByCode(productId);  // Giả sử 'code' là ID sản phẩm

        if (existingCartItem.isPresent()) {
            // Nếu có rồi, tăng số lượng của sản phẩm đó lên
            Cart cartItem = existingCartItem.get();
            cartItem.setQuantity(cartItem.getQuantity() + quantity);  // Tăng số lượng
            return cartRepository.save(cartItem);  // Cập nhật giỏ hàng
        } else {
            // Nếu chưa có, thêm mới sản phẩm vào giỏ
            Cart cart = new Cart();
            cart.setCode(productId);  // ID sản phẩm
            cart.setName(productName); // Tên sản phẩm
            cart.setPrice(price);      // Giá sản phẩm
            cart.setQuantity(quantity); // Số lượng sản phẩm trong giỏ
            cart.setImg(productImg);   // Hình ảnh sản phẩm
            return cartRepository.save(cart);  // Lưu vào database
        }
    }

    @Override
    public List<Cart> getAllCarts() {
        return cartRepository.findAll();
    }

    @Override
    public void clearCart() {
        cartRepository.deleteAll();
    }
    @Override
    public Optional<Cart> getCartById(Long productId) {
        return cartRepository.findById(productId);
    }
    @Override
    public void removeProductFromCart(Long productId) {
        //print out the product id
        System.out.println("Product ID: " + productId);
        cartRepository.deleteById(productId);
    }
}