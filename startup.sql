-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 11:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `startup`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `perks` text DEFAULT NULL,
  `backer_count` int(11) DEFAULT NULL,
  `goal_amount` int(11) DEFAULT NULL,
  `current_amount` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `short_description`, `description`, `perks`, `backer_count`, `goal_amount`, `current_amount`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'campaign 1', 'shot description 1', 'SUIIIIIII', 'satu,dua,tiga', 0, 100000000, 0, 'campaign-satu', '2023-05-16 08:41:38', '2023-05-16 08:41:38'),
(2, 1, 'campaign 2', 'shot description 2', 'SUIIIIIII GOOOOLL', 'one,two,three', 0, 10000000, 0, 'campaign-dua', '2023-05-16 08:41:38', '2023-05-16 08:41:38'),
(3, 2, 'campaign 3', 'shot description 3', 'FIX GOOOOLL', 'siji,loro,telu', 0, 1000000, 0, 'campaign-tiga', '2023-05-16 08:41:38', '2023-05-16 08:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_images`
--

CREATE TABLE `campaign_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaign_images`
--

INSERT INTO `campaign_images` (`id`, `campaign_id`, `file_name`, `is_primary`, `created_at`, `updated_at`) VALUES
(1, 1, 'mina2.jpg', 0, '2023-05-16 08:41:38', '2023-05-30 20:51:01'),
(2, 1, 'mina3.jpg', 0, '2023-05-16 08:41:38', '2023-05-30 20:51:01'),
(3, 1, 'mina4.jpg', 0, '2023-05-16 08:41:38', '2023-05-30 20:51:01'),
(4, 1, 'images/1-mina2.png', 0, '2023-05-30 01:04:53', '2023-05-30 20:51:01'),
(5, 1, 'images/1-mina2.png', 0, '2023-05-30 01:05:01', '2023-05-30 20:51:01'),
(6, 1, 'images/1-mina2.png', 0, '2023-05-30 01:05:03', '2023-05-30 20:51:01'),
(7, 1, 'images/1-mina2.png', 0, '2023-05-30 01:05:05', '2023-05-30 20:51:01'),
(8, 2, 'images/1-mina2.png', 1, '2023-05-30 20:20:24', '2023-05-30 20:51:01'),
(9, 1, 'images/1-mina2.png', 1, '2023-05-30 20:51:01', '2023-05-30 20:51:01'),
(10, 3, 'images/2-mina2.png', 1, '2023-05-30 20:59:25', '2023-05-30 20:59:25'),
(11, 3, 'images/2-mina2.png', 0, '2023-05-30 20:59:42', '2023-05-30 20:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `campaign_id`, `user_id`, `amount`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 500000, 'paid', NULL, '2023-05-16 08:41:38', '2023-05-16 08:41:38'),
(2, 2, 1, 1000000, 'pending', NULL, '2023-05-16 08:41:38', '2023-05-15 08:41:38'),
(3, 2, 1, 1000000, 'pending', '', '2023-06-16 00:51:39', '2023-06-16 00:51:39'),
(4, 9, 1, 1000000, 'pending', '', '2023-06-16 00:52:05', '2023-06-16 00:52:05'),
(5, 9, 1, 100000011, 'pending', '', '2023-06-16 00:52:42', '2023-06-16 00:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `occupation`, `email`, `password_hash`, `avatar_file_name`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Naswa', 'CEO', 'naswakhansa23@gmail.com', '$2a$04$cPiQ7Cvp/i60FIYfDRguxu4n.fZcIHPG20gaRdxpMoVA0qwlF5n9K', 'images/1-mina2.png', 'user', '2023-05-17 09:04:10', '2023-05-17 09:09:02'),
(2, 'Vini', 'Atlet', 'vini20@gmail.com', '$2a$04$GHOsqf9b64bpPsLobhP8.OsbpZv/Fp8emIyq3hKUWRef11wuqD.BW', 'images/2-mina3.jpeg', 'user', '2023-05-17 09:04:44', '2023-05-17 09:07:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_images`
--
ALTER TABLE `campaign_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `campaign_images`
--
ALTER TABLE `campaign_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
