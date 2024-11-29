-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2024 lúc 04:54 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `giuaki_cnjava`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `code` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `code`, `name`, `price`, `quantity`, `img`) VALUES
(26, 2, 'Bánh kem Sữa tươi 001', 199000, 3, 'banh-kem/sua-tuoi-1.jpg'),
(27, 3, 'Bánh kem Socola 001', 199000, 1, 'banh-kem/socola-1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `hide` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `datebegin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `meta`, `hide`, `order`, `datebegin`) VALUES
(1, 'Bánh sinh nhật', 'banh-sinh-nhat', 1, 1, NULL),
(2, 'Bánh cưới', 'banh-cuoi', 1, 2, NULL),
(3, 'Bánh kem', 'banh-kem', 1, 3, NULL),
(4, 'Tiramisu', 'tiramisu', 1, 4, NULL),
(5, 'Bánh custom', 'banh-custom', 1, 5, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `status`, `total_price`) VALUES
(1, 1, '2024-11-29 03:00:00', 'pending', 799000),
(2, 2, '2024-11-29 04:00:00', 'pending', 789000),
(3, 3, '2024-11-29 05:00:00', 'pending', 988000),
(4, 4, '2024-11-29 06:00:00', 'pending', 1200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 199000),
(2, 1, 3, 1, 199000),
(3, 1, 4, 1, 99000),
(4, 2, 6, 1, 199000),
(5, 2, 8, 1, 199000),
(6, 2, 9, 1, 199000),
(7, 3, 10, 1, 199000),
(8, 3, 11, 1, 199000),
(9, 3, 13, 1, 99000),
(10, 3, 16, 1, 199000),
(11, 4, 25, 1, 1250000),
(12, 4, 36, 1, 259000),
(13, 4, 37, 1, 259000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `price`, `brand`, `color`) VALUES
(1, 'Laptop A', 'Electronics', 1500, 'BrandA', 'Black'),
(2, 'Laptop B', 'Electronics', 1300, 'BrandB', 'Silver'),
(3, 'Phone X', 'Electronics', 900, 'BrandX', 'White'),
(4, 'Phone Y', 'Electronics', 850, 'BrandY', 'Black'),
(5, 'Tablet Z', 'Electronics', 700, 'BrandZ', 'Gray'),
(6, 'T-Shirt M', 'Clothing', 20, 'BrandM', 'Blue'),
(7, 'T-Shirt N', 'Clothing', 25, 'BrandN', 'Red'),
(8, 'Shoes S', 'Footwear', 80, 'BrandS', 'Black'),
(9, 'Shoes T', 'Footwear', 75, 'BrandT', 'White'),
(10, 'Hat H', 'Accessories', 15, 'BrandH', 'Yellow');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `hide` tinyint(1) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `datebegin` datetime DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `categoryid`, `name`, `price`, `img`, `description`, `size`, `meta`, `hide`, `order`, `datebegin`, `brand`, `category`, `color`) VALUES
(2, 3, 'Bánh kem Sữa tươi 001', 199000, 'banh-kem/sua-tuoi-1.jpg', 'Bánh được làm từ sữa tươi với hương vị vani truyền thống, thơm đậm mùi sữa và xốp phồng không bị khô', 'S', 'banh-kem-sua-tuoi-001', 1, 1, NULL, NULL, NULL, NULL),
(3, 3, 'Bánh kem Socola 001', 199000, 'banh-kem/socola-1.jpg', 'Bánh socola 001', 'M', 'banh-kem-socola-001', 1, 1, NULL, NULL, NULL, NULL),
(4, 5, 'Bánh Bông lan trứng muối 001', 99000, 'custom/bong-lan-trung-muoi-1.jpg', 'Bánh Bông lan trứng muối 001', 'L', 'banh-bong-lan-trung-muoi-001', 1, 2, NULL, NULL, NULL, NULL),
(6, 4, 'Bánh Tiramisu 001', 199000, 'tiramisu/1.jpg', 'Bánh Tiramisu 001', 'XXL', 'banh-tiramisu-001', 1, 1, NULL, NULL, NULL, NULL),
(8, 4, 'Bánh Tiramisu 002', 199000, 'tiramisu/2.jpg', 'Bánh Tiramisu 002', 'X', 'banh-tiramisu-002', 1, 2, NULL, NULL, NULL, NULL),
(9, 3, 'Bánh Kem bắp hình tròn', 199000, 'banh-kem/bap-1.jpg', '<p>Bánh Kem bắp hình tròn</p>', 'aow', 'banhkembaphinhtron', NULL, 2, NULL, NULL, NULL, NULL),
(10, 3, 'Bánh kem Sữa tươi 002', 199000, 'banh-kem/sua-tuoi-2.jpg', 'Bánh kem Sữa tươi 002', NULL, 'banh-kem-sua-tuoi-002', 1, 1, NULL, NULL, NULL, NULL),
(11, 3, 'Bánh kem Socola 002', 199000, 'banh-kem/socola-2.jpg', 'Bánh kem Socola 002', NULL, 'banh-kem-socola-002', 1, 1, NULL, NULL, NULL, NULL),
(12, 5, 'Bánh Bông lan trứng muối 002', 99000, 'custom/bong-lan-trung-muoi-2.jpg', '<p>Bánh Bông lan trứng muối 002</p>', NULL, 'banhbonglantrungmuoi002', NULL, 2, NULL, NULL, NULL, NULL),
(13, 5, 'Bánh Bông lan trứng muối 003', 99000, 'custom/bong-lan-trung-muoi-3.jpg', 'Bánh Bông lan trứng muối 003', NULL, 'banh-bong-lan-trung-muoi-003', 1, 1, NULL, NULL, NULL, NULL),
(14, 3, 'Bánh kem Socola 003', 199000, 'banh-kem/socola-3.jpg', 'Bánh kem Socola 003', NULL, 'banh-kem-socola-003', 1, 1, NULL, NULL, NULL, NULL),
(16, 3, 'Bánh kem Bắp 002', 199000, 'banh-kem/bap-2.jpg', 'Bánh kem Bắp 002', NULL, 'banh-kem-bap-002', 1, 1, NULL, NULL, NULL, NULL),
(25, 2, 'Bánh cưới 001', 1250000, 'banh-cuoi/1.jpg', '<p>Bánh cưới 001</p>', 'N', 'banhcuoi001', NULL, 2, NULL, NULL, NULL, NULL),
(31, 2, 'Bánh cưới 002', 1250000, 'banh-cuoi/2.jpg', 'Bánh cưới 002', NULL, 'banh-cuoi-002', 1, 1, NULL, NULL, NULL, NULL),
(33, 2, 'Bánh cưới 003', 1250000, 'banh-cuoi/3.jpg', 'Bánh cưới 003', NULL, 'banh-cuoi-003', 1, 1, NULL, NULL, NULL, NULL),
(34, 2, 'Bánh cưới 004', 1250000, 'banh-cuoi/4.jpg', 'Bánh cưới 004', NULL, 'banh-cuoi-004', 1, 1, NULL, NULL, NULL, NULL),
(35, 2, 'Bánh cưới 005', 1250000, 'banh-cuoi/5.jpg', 'Bánh cưới 005', NULL, 'banh-cuoi-005', 1, 1, NULL, NULL, NULL, NULL),
(36, 1, 'Bánh sinh nhật 001', 259000, 'banh-sinh-nhat/1.jpg', 'Bánh sinh nhật 001', NULL, 'banh-sinh-nhat-001', 1, 1, NULL, NULL, NULL, NULL),
(37, 1, 'Bánh sinh nhật 002', 259000, 'banh-sinh-nhat/2.jpg', 'Bánh sinh nhật 002', NULL, 'banh-sinh-nhat-002', 1, 1, NULL, NULL, NULL, NULL),
(38, 1, 'Bánh sinh nhật 003', 259000, 'banh-sinh-nhat/3.jpg', 'Bánh sinh nhật 003', NULL, 'banh-sinh-nhat-003', 1, 1, NULL, NULL, NULL, NULL),
(39, 1, 'Bánh sinh nhật 004', 259000, 'banh-sinh-nhat/4.jpg', 'Bánh sinh nhật 004', NULL, 'banh-sinh-nhat-004', 1, 1, NULL, NULL, NULL, NULL),
(40, 1, 'Bánh sinh nhật 005', 259000, 'banh-sinh-nhat/5.jpg', 'Bánh sinh nhật 005', NULL, 'banh-sinh-nhat-005', 1, 1, NULL, NULL, NULL, NULL),
(41, 1, 'Bánh sinh nhật 006', 259000, 'banh-sinh-nhat/6.jpg', 'Bánh sinh nhật 006', NULL, 'banh-sinh-nhat-006', 1, 1, NULL, NULL, NULL, NULL),
(45, 3, 'Bánh kem Socola 004', 199000, 'banh-kem/socola-4.jpg', 'Bánh kem Socola 004', NULL, 'banh-kem-socola-004', 1, 1, NULL, NULL, NULL, NULL),
(48, 1, '11', 11, 'logo.png', '<p>1</p>', '1', '1', NULL, 6, '2024-04-16 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'giahao222', 'giahao123!@gmail.com', '$2a$10$ao/Umm.4nL.Lo7TdGIRFSe9yrd0FxSqrmaj67.9Y2Vv5/8StL9ES.', 'USER'),
(2, 'admin', 'admin1@gmail.com', '$2a$10$QJhstoWy0DUg1XtBbkNuWOfCHXEBNvRP7GC9d66w63f2j6LeFu6w6', 'USER'),
(3, 'admin2', 'admin2@gmail.com', '$2a$10$jY2ZVczz5T5IR7w1o/BIQu2Ie1ygdxjLOB8FlkG0cxYouJE6AT9zW', 'USER'),
(4, 'giahao123', 'giahao222@gmail.com', '$2a$10$44ktib3d6E9GykSTGCOHges/8T8lg6Y36Pxr7WLaJRc0qwKy1V9Oe', 'USER'),
(5, 'giahao2221', 'giahao2221@gmail.com', 'Giahao222', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
