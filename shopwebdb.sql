-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 25, 2022 lúc 07:49 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopwebdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `password`, `username`, `role_id`) VALUES
(1, 'Nguyen', 'Truong', '$2a$10$OU4s6jsA9fDmYYeFQoia..0axn.kb6ksHki/iw1jllNahJJv25/J6', 'nickadmin', 1),
(2, 'Nguyen', 'Van B', '$2a$10$V2GoT6GuFxIt7n0BnO7GAuvLQhJN6e2ZLBjeKJrO23GrX4d7OYuii', 'nickstaff', 2),
(4, 'Michael', 'Jonas', '$2a$10$DdVN4PZaryS0suSTwtYZB.TJfMJ3ysEaRkHC3Mj5eDBBiA4NjNLNG', 'nickstaff2', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Phone'),
(2, 'Laptop'),
(3, 'Clock');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `discount_id` bigint(20) NOT NULL,
  `discount_name` varchar(255) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item_cart_detail`
--

CREATE TABLE `item_cart_detail` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `item_cart_detail`
--

INSERT INTO `item_cart_detail` (`id`, `quantity`, `productid`, `userid`) VALUES
(20, 4, 1, 3),
(22, 10, 4, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `confirm_time` datetime DEFAULT NULL,
  `reject_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `check_out_time`, `user_id`, `confirm_time`, `reject_time`, `status`, `approve_time`) VALUES
(3, '2022-04-15 22:52:52', 1, '2022-04-17 22:24:19', NULL, 'Approved', '2022-04-24 20:50:29'),
(5, '2022-04-15 23:01:57', 3, NULL, NULL, 'Approved', '2022-04-20 08:05:12'),
(6, '2022-04-16 08:40:59', 4, NULL, NULL, 'Rejected', '2022-04-20 10:31:06'),
(7, '2022-04-16 17:40:09', 4, NULL, '2022-04-17 01:16:52', 'Rejected', NULL),
(8, '2022-04-17 01:40:15', 1, NULL, NULL, 'Approved', '2022-04-24 22:52:14'),
(9, '2022-04-18 13:11:06', 6, '2022-04-18 13:11:29', NULL, 'Confirmed', NULL),
(10, '2022-04-20 12:36:15', 4, '2022-04-20 12:38:55', NULL, 'Confirmed', '2022-04-20 12:38:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `quantity`, `order_id`, `product_id`) VALUES
(5, 5, 3, 2),
(6, 4, 3, 1),
(7, 8, 5, 1),
(8, 3, 5, 3),
(9, 3, 5, 2),
(10, 3, 6, 2),
(11, 3, 6, 5),
(12, 3, 6, 3),
(13, 3, 7, 3),
(14, 3, 7, 1),
(15, 1, 7, 2),
(16, 1, 7, 4),
(17, 2, 8, 4),
(18, 5, 8, 2),
(19, 4, 8, 1),
(20, 10, 9, 1),
(21, 10, 9, 4),
(22, 10, 10, 1),
(23, 26, 10, 4),
(24, 5, 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `discount_price` double NOT NULL,
  `discount_discount_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `description`, `image_name`, `name`, `price`, `quantity`, `category_id`, `discount_price`, `discount_discount_id`) VALUES
(1, '', '', 'S3 Plus', 6, 60, 1, 0, NULL),
(2, '', '', 'Dell MLPQ', 8, 74, 2, 0, NULL),
(3, 'jfuiQAHFHWQIOFOIWAEJG', '', 'Asus', 7, 94, 2, 0, NULL),
(4, '', '', 'Samsung 11', 3, -35, 1, 0, NULL),
(5, '', '', 'Iphone 12XX', 4, 4, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_STAFF');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `token`
--

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `token`
--

INSERT INTO `token` (`id`, `expiry_date`, `token`, `user_id`) VALUES
(2, NULL, '07524dd9-4120-47bc-9943-1fb6fc815912', 3),
(3, NULL, '161a6e65-0a86-464f-a2b6-a2d008bccbbb', 4),
(5, NULL, '32e03c71-fb21-413d-937d-9afb09fbfdc1', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `forgot_password_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `address`, `created`, `email`, `enabled`, `first_name`, `last_name`, `password`, `phone_no`, `username`, `forgot_password_token`) VALUES
(1, 'Son Tay Ha Noi', '2022-04-15 09:41:29', 'client@gmail.com', b'1', 'Nguyen', 'Van B', '$2a$10$ynzaAPav1N69Xq9nSYRV9uTwjKUuljHre5QYP/a9GT8.dVBaGk.T2', '0976223223', 'client', NULL),
(3, NULL, '2022-04-15 17:50:15', '1901040234@s.hanu.edu.vn', b'1', 'Nguyen', 'Michael', '$2a$10$75vNS0aYRcqMmY.1Po7JiuXg4CEFqx4akyeUN0.MLhG8QLq36wsOq', NULL, 'newclient', NULL),
(4, 'Thanh Hoa', '2022-04-16 08:33:57', 'hoangthai.solem2801@gmail.com', b'1', 'Hoang', 'Thai', '$2a$10$Mfzpi2qpKzLGi7eXPtfgUekhaz6AIYivODkv6vRabtGAybr5V6iJC', '0911223333', 'thai', NULL),
(6, 'Ba Vi, Hanoi', '2022-04-17 16:25:25', 'namtruongcun2001@gmail.com', b'1', 'Nam', 'Truong', '$2a$10$vdByJPtCB9RrzbDgWv79feZu6aoHYvo7qMbmvipN3NVBICoiFAGgG', '0981144223', 'truong23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK5i301uf8wo1mfse12fi8y9jn3` (`username`),
  ADD KEY `FKmmec8jdufi0j1lrhu3hpn4ugj` (`role_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Chỉ mục cho bảng `item_cart_detail`
--
ALTER TABLE `item_cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK25ne8ty609xx2xla6ruijl56g` (`productid`),
  ADD KEY `FKtia866voqrrwo0vlsstum159y` (`userid`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5ds52cnxjw9c99ovccne0axk0` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkkl8lqaxofq5cr97y5q9n6b0i` (`order_id`),
  ADD KEY `FK388dofyjqbdm1utcwpbrerccb` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK5drd4x1gskipdc846gum9yc5j` (`category_id`),
  ADD KEY `FK6gies03aknxg9jnmp256eud3q` (`discount_discount_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn1okjowqyw7r2nl4hci3kahm6` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK8u3xwjr9513mbwc9mqtx80ef8` (`username`,`email`,`phone_no`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `item_cart_detail`
--
ALTER TABLE `item_cart_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `token`
--
ALTER TABLE `token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FKmmec8jdufi0j1lrhu3hpn4ugj` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `item_cart_detail`
--
ALTER TABLE `item_cart_detail`
  ADD CONSTRAINT `FK25ne8ty609xx2xla6ruijl56g` FOREIGN KEY (`productid`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKtia866voqrrwo0vlsstum159y` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK5ds52cnxjw9c99ovccne0axk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK388dofyjqbdm1utcwpbrerccb` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FKkkl8lqaxofq5cr97y5q9n6b0i` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK5drd4x1gskipdc846gum9yc5j` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK6gies03aknxg9jnmp256eud3q` FOREIGN KEY (`discount_discount_id`) REFERENCES `discount` (`discount_id`);

--
-- Các ràng buộc cho bảng `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FKn1okjowqyw7r2nl4hci3kahm6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
