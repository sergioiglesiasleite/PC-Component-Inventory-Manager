-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2026 a las 20:18:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pc_inventory_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Procesadores', NULL),
(2, 'Tarjetas Gráficas', NULL),
(3, 'Placas Base', NULL),
(4, 'Memorias RAM', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `socket_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `price`, `stock_quantity`, `category_id`, `supplier_id`, `socket_type`, `created_at`) VALUES
(1, 'Intel Core Ultra 9 385K (Arrow Lake Refresh)', 'INT-ULTRA9-385K', 689.90, 45, 1, 1, 'LGA1851', '2026-01-12 19:14:10'),
(2, 'Intel Core Ultra 7 365K', 'INT-ULTRA7-365K', 459.50, 80, 1, 1, 'LGA1851', '2026-01-12 19:14:10'),
(3, 'Intel Core Ultra 5 345F', 'INT-ULTRA5-345F', 319.00, 120, 1, 1, 'LGA1851', '2026-01-12 19:14:10'),
(4, 'AMD Ryzen 9 10950X', 'AMD-10950X', 749.99, 25, 1, 1, 'AM5+', '2026-01-12 19:14:10'),
(5, 'AMD Ryzen 7 10800X3D (Gaming King)', 'AMD-10800X3D', 529.00, 10, 1, 1, 'AM5+', '2026-01-12 19:14:10'),
(6, 'AMD Ryzen 5 10600X', 'AMD-10600X', 299.00, 200, 1, 1, 'AM5+', '2026-01-12 19:14:10'),
(7, 'Intel Core Ultra 9 390KS Special Edition', 'INT-390KS', 899.00, 5, 1, 1, 'LGA1851', '2026-01-12 19:14:10'),
(8, 'AMD Ryzen Threadripper 9990WX', 'AMD-TR-9990', 4500.00, 2, 1, 1, 'sTR5', '2026-01-12 19:14:10'),
(9, 'Intel Core Ultra 3 310 (Budget)', 'INT-ULTRA3-310', 149.00, 50, 1, 1, 'LGA1851', '2026-01-12 19:14:10'),
(10, 'AMD Ryzen 3 10100F', 'AMD-10100F', 110.00, 60, 1, 1, 'AM5+', '2026-01-12 19:14:10'),
(11, 'NVIDIA GeForce RTX 5090 32GB GDDR7', 'NVD-5090-32G', 1999.00, 3, 2, 2, NULL, '2026-01-12 19:14:10'),
(12, 'NVIDIA GeForce RTX 5080 24GB', 'NVD-5080-24G', 1199.00, 15, 2, 2, NULL, '2026-01-12 19:14:10'),
(13, 'NVIDIA GeForce RTX 5070 Ti Super', 'NVD-5070TIS', 899.00, 40, 2, 2, NULL, '2026-01-12 19:14:10'),
(14, 'NVIDIA GeForce RTX 5060 12GB', 'NVD-5060-12G', 399.00, 150, 2, 2, NULL, '2026-01-12 19:14:10'),
(15, 'AMD Radeon RX 9900 XTX 28GB', 'AMD-RX9900XTX', 1050.00, 20, 2, 2, NULL, '2026-01-12 19:14:10'),
(16, 'AMD Radeon RX 9800 XT', 'AMD-RX9800XT', 750.00, 35, 2, 2, NULL, '2026-01-12 19:14:10'),
(17, 'AMD Radeon RX 9600 Mech', 'AMD-RX9600', 320.00, 80, 2, 2, NULL, '2026-01-12 19:14:10'),
(18, 'Intel Arc Celestial C970 16GB', 'INT-ARC-C970', 450.00, 60, 2, 2, NULL, '2026-01-12 19:14:10'),
(19, 'NVIDIA RTX 5090 Ti Titan Class', 'NVD-TITAN-AI', 2999.00, 1, 2, 2, NULL, '2026-01-12 19:14:10'),
(20, 'MSI RTX 4060 Ventus (Outlet)', 'MSI-4060-OUT', 250.00, 10, 2, 2, NULL, '2026-01-12 19:14:10'),
(21, 'ASUS ROG Maximus Z990 Hero', 'ASUS-Z990-HERO', 650.00, 12, 3, 4, 'LGA1851', '2026-01-12 19:14:10'),
(22, 'MSI MPG Z990 Carbon WiFi', 'MSI-Z990-CARB', 480.00, 20, 3, 4, 'LGA1851', '2026-01-12 19:14:10'),
(23, 'Gigabyte Z990 Aorus Elite', 'GIGA-Z990-ELITE', 290.00, 40, 3, 4, 'LGA1851', '2026-01-12 19:14:10'),
(24, 'ASRock X970E Taichi', 'ASR-X970E-TAI', 550.00, 15, 3, 4, 'AM5+', '2026-01-12 19:14:10'),
(25, 'ASUS TUF Gaming B950-Plus', 'ASUS-B950-TUF', 210.00, 100, 3, 4, 'AM5+', '2026-01-12 19:14:10'),
(26, 'MSI MAG B950 Tomahawk', 'MSI-B950-TOMA', 225.00, 85, 3, 4, 'AM5+', '2026-01-12 19:14:10'),
(27, 'Gigabyte B950M DS3H (Micro-ATX)', 'GIGA-B950M', 140.00, 60, 3, 4, 'AM5+', '2026-01-12 19:14:10'),
(28, 'NZXT N9 Z990 White Edition', 'NZXT-N9-W', 380.00, 10, 3, 4, 'LGA1851', '2026-01-12 19:14:10'),
(29, 'ASUS ProArt X970 Creator', 'ASUS-PROART-X', 499.00, 8, 3, 4, 'AM5+', '2026-01-12 19:14:10'),
(30, 'Biostar Racing Z990GTA', 'BIO-Z990', 180.00, 5, 3, 4, 'LGA1851', '2026-01-12 19:14:10'),
(31, 'Kingston Fury Beast 32GB (2x16) DDR5-8000', 'KNG-DDR5-8000', 180.00, 50, 4, 3, NULL, '2026-01-12 19:14:10'),
(32, 'G.Skill Trident Z5 Royal 64GB DDR5-9000', 'GSK-ROYAL-9000', 450.00, 10, 4, 3, NULL, '2026-01-12 19:14:10'),
(33, 'Corsair Dominator Titanium 48GB DDR5-7200', 'COR-DOM-7200', 290.00, 25, 4, 3, NULL, '2026-01-12 19:14:10'),
(34, 'Crucial Pro 32GB DDR5-6000 (Standard)', 'CRU-PRO-6000', 110.00, 200, 4, 3, NULL, '2026-01-12 19:14:10'),
(35, 'TeamGroup T-Force Delta RGB 32GB 7600', 'TF-DELTA-7600', 160.00, 40, 4, 3, NULL, '2026-01-12 19:14:10'),
(36, 'Patriot Viper Venom 16GB DDR5-5600', 'PAT-VIPER-56', 65.00, 100, 4, 3, NULL, '2026-01-12 19:14:10'),
(37, 'G.Skill Ripjaws S5 32GB DDR5-6400', 'GSK-RIP-6400', 125.00, 80, 4, 3, NULL, '2026-01-12 19:14:10'),
(38, 'Corsair Vengeance 192GB (4x48) Kit Workstation', 'COR-WORK-192', 950.00, 2, 4, 3, NULL, '2026-01-12 19:14:10'),
(39, 'Kingston Fury Renegade White 32GB 7200', 'KNG-REN-W', 175.00, 30, 4, 3, NULL, '2026-01-12 19:14:10'),
(40, 'ADATA XPG Lancer Blade 32GB 6000', 'ADT-LNCR-60', 105.00, 90, 4, 3, NULL, '2026-01-12 19:14:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `contact_email`, `phone`) VALUES
(1, 'Silicon Valley Chips', NULL, NULL),
(2, 'Visual Power Store', NULL, NULL),
(3, 'MegaMemory Shop', 'ventas@megamemory.com', NULL),
(4, 'Motherboard City', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
