-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 01:03 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warzywniak_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Warzywa korzeniowe'),
(2, 'Warzywa liściaste'),
(3, 'Warzywa owocowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` enum('kg','sztuka','pęczek','opakowanie') DEFAULT 'kg',
  `country_of_origin` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `short_description` varchar(255) DEFAULT NULL,
  `calories_per_100g` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `price`, `unit`, `country_of_origin`, `stock`, `short_description`, `calories_per_100g`, `created_at`, `image_url`) VALUES
(1, 3, 'Pomidor malinowy', 7.50, 'kg', 'Polska', 100, 'Soczysty, słodki pomidor idealny do kanapek.', 18, '2025-09-29 06:46:08', 'https://www.shutterstock.com/search/image-holder-vector'),
(2, 3, 'Ogórek gruntowy', 5.20, 'kg', 'Polska', 150, 'Świeży ogórek, doskonały do sałatek.', 12, '2025-09-29 06:46:08', 'https://www.shutterstock.com/search/image-holder-vector'),
(3, 1, 'Marchew ekologiczna', 4.00, 'kg', 'Holandia', 200, 'Chrupiąca marchew z upraw ekologicznych.', 41, '2025-09-29 06:46:08', 'https://www.shutterstock.com/search/image-holder-vector'),
(4, 3, 'Papryka czerwona', 9.90, 'kg', 'Hiszpania', 80, 'Słodka papryka o intensywnym kolorze.', 31, '2025-09-29 06:46:08', 'https://www.shutterstock.com/search/image-holder-vector'),
(5, 3, 'Bakłażan', 6.50, 'kg', 'Hiszpania', 90, 'Świeży bakłażan idealny do grillowania.', 25, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(6, 3, 'Cukinia', 5.80, 'kg', 'Polska', 120, 'Młoda cukinia doskonała do sałatek.', 17, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(7, 1, 'Marchew Baby', 4.20, 'kg', 'Holandia', 200, 'Słodkie marchewki baby, gotowe do spożycia.', 35, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(8, 3, 'Rzodkiewka', 3.50, 'pęczek', 'Polska', 180, 'Ostra i chrupiąca rzodkiewka.', 16, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(9, 3, 'Sałata lodowa', 6.00, '', 'Polska', 75, 'Świeża sałata lodowa, idealna do sałatek.', 14, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(10, 1, 'Selery naciowe', 7.20, 'kg', 'Włochy', 60, 'Delikatne selery naciowe do gotowania i sałatek.', 18, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(11, 3, 'Brokuł', 8.50, 'kg', 'Polska', 90, 'Świeży brokuł, bogaty w witaminy.', 34, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(12, 3, 'Kalafior', 7.80, 'kg', 'Hiszpania', 70, 'Biały kalafior idealny do gotowania.', 25, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(13, 1, 'Pietruszka korzeniowa', 5.00, 'kg', 'Polska', 120, 'Słodka pietruszka, idealna do zup.', 36, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(14, 3, 'Papryka żółta', 9.50, 'kg', 'Holandia', 80, 'Słodka papryka w intensywnym kolorze.', 27, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(15, 3, 'Szpinak', 6.20, 'kg', 'Polska', 100, 'Świeży szpinak idealny do sałatek.', 23, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(16, 3, 'Rukola', 7.00, 'pęczek', 'Polska', 90, 'Lekko pikantna rukola.', 25, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(17, 1, 'Burak', 4.50, 'kg', 'Polska', 130, 'Słodkie buraki do gotowania i surówek.', 43, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(18, 3, 'Ogórek szklarniowy', 5.50, 'kg', 'Polska', 150, 'Świeży ogórek szklarniowy.', 12, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(19, 3, 'Czerwona cebula', 4.80, 'kg', 'Hiszpania', 100, 'Cebula czerwona, słodka i chrupiąca.', 40, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(20, 1, 'Czosnek', 25.00, 'kg', 'Chiny', 50, 'Aromatyczny czosnek do potraw.', 149, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(21, 3, 'Fasolka szparagowa', 10.00, 'kg', 'Polska', 60, 'Świeża fasolka szparagowa.', 31, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(22, 3, 'Kapusta czerwona', 6.50, 'kg', 'Polska', 70, 'Soczysta kapusta czerwona do surówek.', 31, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(23, 3, 'Kapusta pekińska', 5.80, 'kg', 'Holandia', 80, 'Świeża kapusta pekińska.', 13, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v'),
(24, 1, 'Pasternak', 6.00, 'kg', 'Polska', 60, 'Delikatny pasternak do zup i pieczenia.', 75, '2025-12-14 11:41:59', 'https://www.shutterstock.com/search/image-holder-v');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shop_info`
--

CREATE TABLE `shop_info` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `opening_hours` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mail` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `mail`, `created_at`) VALUES
(1, 'admin', 'admin', 'admin', 'pushneex@gmail.com', '0000-00-00 00:00:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `shop_info`
--
ALTER TABLE `shop_info`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `shop_info`
--
ALTER TABLE `shop_info`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
