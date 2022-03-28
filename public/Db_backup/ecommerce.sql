-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 10:54 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Puma', 'Puma', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Electronics Category', 'electronics-category', '2021-10-11 08:11:08', '2021-10-12 02:04:42'),
(2, 'Mobile', 'mobile', '2021-10-11 08:11:08', '2021-10-12 02:06:40'),
(3, 'Mens Category', 'mens-category', '2021-10-11 08:11:08', '2021-10-12 02:07:00'),
(4, 'Womens Category', 'womens-category', '2021-10-11 08:11:08', '2021-10-12 02:07:20'),
(5, 'Others Category', 'others-category', '2021-10-11 08:11:08', '2021-10-12 02:08:52'),
(6, 'Children Category ', 'children-category', '2021-10-11 08:11:08', '2021-10-17 07:32:54'),
(7, 'Sporting Goods Category', 'sporting-goods-category', '2021-10-11 08:13:27', '2021-10-12 02:10:21'),
(8, 'Baby Category', 'baby-category', '2021-10-14 08:17:07', '2021-10-14 08:17:07'),
(10, 'New Category', 'new-category', '2021-10-17 10:54:01', '2021-10-17 10:54:01'),
(11, 'Test Category', 'test-category', '2021-11-22 08:51:10', '2021-11-22 08:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Fahim', 'user@gmail.com', '01832348235', 'This site is best!', '2021-11-18 07:20:11', '2021-11-18 07:20:11'),
(2, 'Eshad', 'eshad@gmail.com', '01832348237', 'I am Eshad. I am new user this site visitor', '2021-11-18 07:42:52', '2021-11-18 07:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(4, 'OOPP2', 'fixed', '200.00', '1,000.00', '2021-10-28 11:23:12', '2021-10-28 11:23:12', '2021-11-03'),
(5, 'GHS67', 'fixed', '50.00', '500.00', '2021-10-31 09:12:29', '2021-10-31 09:12:29', '2021-11-03'),
(6, '6789', 'fixed', '60.00', '200.00', '2021-11-01 22:48:17', '2021-11-01 22:48:17', '2021-11-03'),
(7, 'ff', 'fixed', '333.00', '2,000', '2021-11-02 05:58:06', '2021-11-02 05:58:06', '2021-11-03'),
(9, 'gg12', 'percent', '6.00', '2,000', '2021-11-02 06:04:27', '2021-11-03 01:07:07', '2021-11-03'),
(10, 'FGG', 'fixed', '50.00', '1,000', '2021-11-03 00:46:58', '2021-11-03 00:46:58', '2021-11-04'),
(11, 'FGT', 'fixed', '100.00', '2,000', '2021-11-03 01:16:25', '2021-11-03 01:16:25', '2021-11-05'),
(12, 'TG', 'percent', '50.00', '2,000', '2021-11-03 01:17:33', '2021-11-03 01:17:33', '2021-11-01'),
(13, 'GF', 'fixed', '100.00', '1,000', '2021-11-03 01:20:20', '2021-11-08 23:43:47', '2021-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3,4,5,7,8', '5', '2021-10-14 12:35:44', '2021-10-16 00:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First slider title edit third', 'First slider subtitle  third', '2010', 'http://localhost:8000/shop', '1634123283.jpg', 1, '2021-10-13 02:34:28', '2021-10-13 05:08:03'),
(5, 'Second Slider', 'Second Slider titile', '300', 'http://localhost:8000/shop', '1634123462.jpg', 0, '2021-10-13 04:52:49', '2021-10-13 05:11:02'),
(7, 'Final Slider', 'Final Slider title', '350', 'http://localhost:8000/shop', '1634123440.jpg', 1, '2021-10-13 05:10:40', '2021-10-13 05:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_09_30_132455_create_sessions_table', 1),
(7, '2021_10_02_073429_create_categories_table', 1),
(8, '2021_10_02_073516_create_products_table', 1),
(9, '2021_10_13_062343_create_home_sliders_table', 2),
(10, '2021_10_13_155553_create_home_categories_table', 3),
(11, '2021_10_16_044516_create_sales_table', 4),
(12, '2021_10_27_152130_create_coupons_table', 5),
(17, '2021_11_03_043044_add_expiry_date_to_coupons_table', 6),
(18, '2021_11_03_044133_create_orders_table', 7),
(19, '2021_11_03_114137_create_order_items_table', 7),
(20, '2021_11_03_114221_create_shippings_table', 7),
(21, '2021_11_03_114253_create_transactions_table', 7),
(22, '2021_11_15_125405_add_delivered_canceled_date_to_orders_table', 8),
(23, '2021_11_16_141612_create_reviews_table', 9),
(24, '2021_11_16_143127_add_rstatus_to_order_items_table', 9),
(25, '2021_11_18_122204_create_contacts_table', 10),
(26, '2021_11_18_135656_create_settings_table', 11),
(27, '2021_11_21_135501_create_shoppingcart_table', 12),
(29, '2021_11_22_145642_create_subcategories_table', 13),
(30, '2021_11_24_131903_add_subcategory_id_to_products_table', 14),
(31, '2021_11_25_170028_create_brands_table', 15),
(32, '2021_11_27_050659_create_profiles_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(1, 1, '24.00', '0.00', '5.04', '29.04', 'Said', 'Ahmad', '01832348237', 'said@gmail.com', 'test line1', 'test line2', 'dhaka', 'Mirpur-1', 'Bangladesh', '12345', 'canceled', 1, '2021-11-07 23:27:23', '2021-11-15 08:01:55', NULL, '2021-11-15'),
(2, 1, '24.00', '0.00', '5.04', '29.04', 'Said', 'Ahmad', '01832348237', 'said@gmail.com', 'test line1', 'test line2', 'dhaka', 'Mirpur-1', 'Bangladesh', '12345', 'ordered', 1, '2021-11-07 23:28:01', '2021-11-07 23:28:01', NULL, NULL),
(3, 1, '24.00', '0.00', '5.04', '29.04', 'Said', 'Ahmad', '01832348237', 'said@gmail.com', 'test line1', 'test line2', 'dhaka', 'Mirpur-1', 'Bangladesh', '12345', 'delivered', 1, '2021-11-07 23:28:27', '2021-11-20 07:21:43', '2021-11-20', NULL),
(4, 1, '746.00', '100.00', '84.60', '830.60', 'Said', 'Ahmad', '01832348235', 'eshad@gmail.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '5676', 'delivered', 0, '2021-11-08 23:45:14', '2021-11-20 07:20:52', '2021-11-20', NULL),
(5, 1, '112.00', '100.00', '21.20', '133.20', 'Said', 'Ahmad', '01832348235', 'Fahim2@email.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '6788', 'ordered', 0, '2021-11-08 23:54:05', '2021-11-08 23:54:05', NULL, NULL),
(6, 1, '323.00', '100.00', '42.30', '365.30', 'Said', 'Ahmad', '01832348236', 'Fahim@email.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '56', 'ordered', 0, '2021-11-09 00:01:51', '2021-11-09 00:01:51', NULL, NULL),
(8, 2, '799.00', '0.00', '167.79', '966.79', 'Kashem', 'Khan', '01832348237', 'kashem@email.com', 'test line4', 'test line4', 'dhaka', 'Mirpur-2', 'Bangladesh', '453', 'delivered', 0, '2021-11-10 23:06:37', '2021-11-16 07:15:14', '2021-11-16', NULL),
(9, 2, '212.00', '0.00', '44.52', '256.52', 'Said', 'Ajmal', '01832348235', 'user@gmail.com', 'test line4', 'test line1', 'dhaka', 'Mirpur-2', 'Bangladesh', '796', 'canceled', 0, '2021-11-10 23:11:36', '2021-11-16 07:15:26', NULL, '2021-11-16'),
(10, 1, '40.00', '0.00', '8.40', '48.40', 'Said', 'Ahmad', '01832348236', 'Fahim2@email.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '12', 'delivered', 0, '2021-11-11 00:52:38', '2021-11-15 08:01:25', '2021-11-15', NULL),
(11, 1, '656.00', '0.00', '137.76', '793.76', 'Eshad', 'Khatun', '01832348236', 'eshad@gmail.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-3', 'Bangladesh', '124', 'delivered', 0, '2021-11-14 23:43:02', '2021-11-15 07:59:33', '2021-11-15', NULL),
(12, 2, '333.00', '0.00', '69.93', '402.93', 'Said', 'Khan', '01832348235', 'user@gmail.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '2424242424242424', 'canceled', 0, '2021-11-16 07:32:29', '2021-11-16 07:33:16', NULL, '2021-11-16'),
(13, 1, '161.00', '0.00', '33.81', '194.81', 'Eshad', 'Khatun', '01832348235', 'lovspori81@gmail.com', 'test line1', 'test line4', 'dhaka', 'Mirpur-2', 'Bangladesh', '12', 'delivered', 0, '2021-11-20 07:24:47', '2021-11-20 07:29:02', '2021-11-20', NULL),
(14, 4, '700.00', '0.00', '147.00', '847.00', 'Ahmad ', 'Salem', '01832348237', 'sazid23@gmail.com', 'test line:mail', 'test:mail2', 'Noakhali', 'Maijdee', 'Bangladesh', '567', 'canceled', 0, '2021-11-21 07:33:23', '2021-11-26 22:42:13', NULL, '2021-11-27'),
(15, 4, '30.00', '0.00', '6.30', '36.30', 'Ahmad ', 'abrar', '01832348236', 'Fahim@email.com', 'test line4', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 07:40:33', '2021-11-21 07:40:33', NULL, NULL),
(16, 4, '371.00', '0.00', '77.91', '448.91', 'Ahmad ', 'Khatun', '01832348236', 'admin@gmail.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-1', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 07:43:37', '2021-11-21 07:43:37', NULL, NULL),
(17, 2, '423.00', '0.00', '88.83', '511.83', 'Kashem', 'Ajmal', '01832348235', 'eshad@gmail.com', 'test line4', 'test line4', 'Noakhali', 'Mirpur-2', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 08:17:30', '2021-11-21 08:17:30', NULL, NULL),
(18, 2, '376.00', '0.00', '78.96', '454.96', 'Ahmad ', 'Khan', '01832348235', 'user@gmail.com', 'test line1', 'test line1', 'dhaka', 'Maijdee', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 08:18:38', '2021-11-21 08:18:38', NULL, NULL),
(19, 2, '376.00', '0.00', '78.96', '454.96', 'Said', 'Ahmad', '01832348235', 'eshad@gmail.com', 'test line1', 'test line1', 'dhaka', 'Mirpur-3', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 08:21:13', '2021-11-21 08:21:13', NULL, NULL),
(20, 4, '423.00', '0.00', '88.83', '511.83', 'Test', 'Khan', '01832348236', 'eshad@gmail.com', 'test line:mail', 'test line4', 'Noakhali', 'Mirpur-2', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 09:44:45', '2021-11-21 09:44:45', NULL, NULL),
(21, 5, '30.00', '0.00', '6.30', '36.30', 'Eshad', 'Khatun', '01832348236', 'eshad@gmail.com', 'test line4', 'test line4', 'dhaka', 'Mirpur-2', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 09:46:46', '2021-11-21 09:46:46', NULL, NULL),
(22, 5, '161.00', '0.00', '33.81', '194.81', 'Eshad', 'Khatun', '01832348236', 'eshad@gmail.com', 'test line:mail', 'test line:mail', 'dhaka', 'Mirpur-1', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 09:48:12', '2021-11-21 09:48:12', NULL, NULL),
(23, 4, '212.00', '0.00', '44.52', '256.52', 'Fahim', 'Hasan', '01832348236', 'Fahim@email.com', 'test line4', 'test line4', 'dhaka', 'Mirpur-1', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 09:49:55', '2021-11-21 09:49:55', NULL, NULL),
(24, 4, '423.00', '0.00', '88.83', '511.83', 'Kashem', 'Khan', '01832348235', 'Fahim@email.com', 'test line4', 'test line4', 'Noakhali', 'Mirpur-2', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 10:00:07', '2021-11-21 10:00:07', NULL, NULL),
(25, 4, '423.00', '0.00', '88.83', '511.83', 'Said', 'Ahmad', '01832348235', 'Fahim@email.com', 'test line1', 'test line1', 'Noakhali', 'Mirpur-2', 'Bangladesh', '2424242424242424', 'ordered', 0, '2021-11-21 10:25:45', '2021-11-21 10:25:45', NULL, NULL),
(26, 4, '423.00', '0.00', '88.83', '511.83', 'Ahmad ', 'Khan', '01832348236', 'lovspori81@gmail.com', 'test line4', 'test line1', 'Noakhali', 'Mirpur-1', 'Bangladesh', '12', 'ordered', 0, '2021-11-21 10:33:40', '2021-11-21 10:33:40', NULL, NULL),
(27, 6, '423.00', '0.00', '88.83', '511.83', 'Fahim', 'Sazid', '01832348237', 'sazidfahim499@gmail.com', 'test line4', 'test line4', 'Noakhali', 'Mirpur-2', 'Bangladesh', '1256', 'ordered', 0, '2021-11-24 09:45:43', '2021-11-24 09:45:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`) VALUES
(1, 10, 1, '24.00', 1, '2021-11-07 23:27:24', '2021-11-07 23:27:24', 0),
(2, 3, 4, '423.00', 2, '2021-11-08 23:45:14', '2021-11-08 23:45:14', 0),
(3, 2, 5, '212.00', 1, '2021-11-08 23:54:05', '2021-11-08 23:54:05', 0),
(4, 3, 6, '423.00', 1, '2021-11-09 00:01:51', '2021-11-09 00:01:51', 0),
(7, 3, 8, '423.00', 1, '2021-11-10 23:06:37', '2021-11-17 00:56:58', 1),
(8, 4, 8, '376.00', 1, '2021-11-10 23:06:37', '2021-11-17 01:03:04', 1),
(9, 2, 9, '212.00', 1, '2021-11-10 23:11:37', '2021-11-10 23:11:37', 0),
(11, 9, 11, '161.00', 1, '2021-11-14 23:43:02', '2021-11-14 23:43:02', 0),
(12, 12, 11, '495.00', 1, '2021-11-14 23:43:02', '2021-11-14 23:43:02', 0),
(13, 13, 12, '333.00', 1, '2021-11-16 07:32:29', '2021-11-16 07:32:29', 0),
(14, 9, 13, '161.00', 1, '2021-11-20 07:24:47', '2021-11-20 07:24:47', 0),
(15, 33, 14, '300.00', 1, '2021-11-21 07:33:23', '2021-11-21 07:33:23', 0),
(16, 10, 14, '24.00', 1, '2021-11-21 07:33:23', '2021-11-21 07:33:23', 0),
(17, 4, 14, '376.00', 1, '2021-11-21 07:33:23', '2021-11-21 07:33:23', 0),
(18, 29, 15, '30.00', 1, '2021-11-21 07:40:33', '2021-11-21 07:40:33', 0),
(19, 6, 16, '371.00', 1, '2021-11-21 07:43:37', '2021-11-21 07:43:37', 0),
(20, 3, 17, '423.00', 1, '2021-11-21 08:17:30', '2021-11-21 08:17:30', 0),
(21, 4, 18, '376.00', 1, '2021-11-21 08:18:38', '2021-11-21 08:18:38', 0),
(22, 4, 19, '376.00', 1, '2021-11-21 08:21:13', '2021-11-21 08:21:13', 0),
(23, 3, 20, '423.00', 1, '2021-11-21 09:44:45', '2021-11-21 09:44:45', 0),
(24, 29, 21, '30.00', 1, '2021-11-21 09:46:46', '2021-11-21 09:46:46', 0),
(25, 9, 22, '161.00', 1, '2021-11-21 09:48:12', '2021-11-21 09:48:12', 0),
(26, 2, 23, '212.00', 1, '2021-11-21 09:49:55', '2021-11-21 09:49:55', 0),
(27, 3, 24, '423.00', 1, '2021-11-21 10:00:07', '2021-11-21 10:00:07', 0),
(28, 3, 25, '423.00', 1, '2021-11-21 10:25:45', '2021-11-21 10:25:45', 0),
(29, 3, 26, '423.00', 1, '2021-11-21 10:33:40', '2021-11-21 10:33:40', 0),
(30, 3, 27, '423.00', 1, '2021-11-24 09:45:44', '2021-11-24 09:45:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user@gmail.com', '$2y$10$lAR9KmEbrCKKPJWAE8EClOQP.pqkx/KijXoi7bIiT7lilpC7u0Ihq', '2021-11-19 22:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(2, 'Laptop', 'laptop', 'Velit non omnis et at ut quo. Ut animi omnis aut aliquam quis cum. Incidunt id quos velit nisi qui velit in. Voluptas ut quasi eos aliquam asperiores ab ipsa voluptatum.', 'Enim ea et id officiis delectus. Est ea atque autem eum laborum quo eos nihil. Ut molestiae dolorum soluta dolores. Praesentium eum vel omnis perspiciatis eum molestiae dolorem. Laborum quis qui qui a quisquam in in. Dignissimos aut animi doloribus sit voluptatem iure. Maiores nihil aliquid possimus. Qui accusantium nostrum mollitia voluptatem aperiam voluptas fugit.', '212.00', '212.00', 'DIGI461', 'instock', 0, 106, '1634220671.jpg', NULL, 1, '2021-10-11 08:11:08', '2021-11-25 08:23:51', 1),
(3, 'Camera', 'camera', 'Voluptas rerum sed voluptas animi quam voluptas consequatur. Qui voluptas voluptatem molestias sed consequatur. Et nam tempora omnis aliquid. Accusamus nihil et facere dicta earum.', 'Cum vel ratione occaecati odit. Sit suscipit et cum rerum asperiores. Cumque est deleniti quisquam dolorem natus mollitia odit. Impedit architecto nihil quasi quas. Natus veniam hic sunt quasi nam deleniti eos. Assumenda nulla delectus et. Veniam expedita temporibus repellendus libero. Sequi autem quia ab qui nostrum. Iusto modi laborum cum autem tenetur rerum. Suscipit ut vero nihil aspernatur.', '423.00', '423.00', 'DIGI357', 'instock', 0, 143, 'digital_6.jpg', NULL, 1, '2021-10-11 08:11:08', '2021-11-25 08:32:57', 10),
(4, 'Stylish  watch', 'stylish-watch', 'Ea possimus minus quo inventore quo iste quia. Et est ipsa et. Qui saepe vitae aut cum magnam qui qui. Sapiente voluptas dolor necessitatibus omnis vel est.', 'Tempora dolores rerum magni quia rerum. Ut laudantium quos et molestias. Exercitationem dignissimos dolorem eum. Praesentium velit quia aperiam tenetur laboriosam. Distinctio voluptatum exercitationem voluptatum iusto exercitationem.', '376.00', '376.00', 'DIGI195', 'instock', 0, 190, '1634026260.jpg', ',16377712220.jpg,16377712221.jpg', 3, '2021-10-11 08:11:09', '2021-11-24 10:27:02', 9),
(6, 'Watch', 'watch', 'Reiciendis quidem maiores omnis repellendus inventore laborum sunt. Maxime et sapiente dolore corrupti. Ullam est omnis veniam dolorum minus temporibus.', 'Explicabo quidem aut ut ut. Id accusamus doloremque aut aut. Quis voluptatem aut velit eaque ducimus voluptatem qui quam. Sit velit non pariatur corrupti veritatis architecto. Ea voluptatem illo quia. Autem voluptatem labore similique sint voluptas. Reprehenderit quo eaque laboriosam quidem voluptatem voluptates.', '371.00', '371.00', 'DIGI104', 'instock', 0, 138, 'digital_11.jpg', NULL, 3, '2021-10-11 08:11:09', '2021-11-25 08:40:36', 9),
(7, 'aut quos quas numquam', 'aut-quos-quas-numquam', 'Accusamus illum voluptatem neque id et aliquid. Quo illum harum et placeat. Et et consequatur cum facilis itaque sit. Quis dignissimos nisi et consectetur.', 'Rerum enim autem explicabo ullam labore corporis. Velit id voluptas illo delectus suscipit. Dolor et et sint nostrum velit ducimus non. Eaque tempore nostrum repellat recusandae alias nostrum. Autem nostrum officiis autem quia nam. Dolorem ut vel illum enim quod. Dolor alias voluptatem ducimus qui iste velit.', '402.00', '400.00', 'DIGI411', 'instock', 0, 190, 'digital_1.jpg', NULL, 2, '2021-10-11 08:11:09', '2021-11-25 08:30:47', 3),
(8, 'fuga aperiam suscipit fugit', 'fuga-aperiam-suscipit-fugit', 'Est qui sit consectetur cumque perspiciatis consequuntur. Quibusdam quis sint dolore et libero quia enim.', 'Aut itaque et neque voluptas et eligendi delectus. Ut perspiciatis culpa necessitatibus est ipsum sed aut. Nisi in perferendis quas quia minima. Atque hic officiis optio voluptas a. Veniam sint incidunt aliquid voluptatem blanditiis esse molestias.', '479.00', NULL, 'DIGI278', 'instock', 0, 110, 'digital_13.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-10-14 08:14:35', NULL),
(9, 'Nighst Vission', 'nighst-vission', 'Provident aut ab corrupti quasi nihil. Unde quibusdam voluptatem quas nulla totam aspernatur. Qui iste adipisci delectus rerum aperiam labore magnam.', 'Illo et non recusandae qui perferendis blanditiis. Molestiae officia rerum perspiciatis illo est vel et. Vel architecto nihil eveniet unde nihil. Quidem quaerat quam optio exercitationem. Omnis ipsam rem autem repellat nam voluptatem voluptatum. Architecto minima officiis facilis.', '161.00', '161.00', 'DIGI354', 'instock', 0, 155, 'digital_12.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-10-13 00:08:32', NULL),
(10, 'Joystick', 'joystick', 'Recusandae eveniet architecto quaerat ipsa ex nemo et qui. A earum qui sint eos suscipit sapiente dolorem. Culpa aut cum exercitationem nisi dignissimos non consectetur.', 'Ea possimus facilis non rerum rem quia repudiandae. Ut incidunt quaerat a natus consequatur optio. Et in et quibusdam velit. Et aut quas eos incidunt repellat et. Itaque dolorem dicta aut iusto.', '24.00', '24.00', 'DIGI249', 'instock', 0, 188, 'digital_18.jpg', NULL, 5, '2021-10-11 08:11:09', '2021-10-13 00:09:07', NULL),
(11, 'dolores et recusandae explicabo', 'dolores-et-recusandae-explicabo', 'Deleniti dolorem et consequatur accusamus vel quos. Cumque perferendis placeat suscipit aut laborum. Eos eius eos omnis est voluptate voluptatum.', 'Aut distinctio alias ipsam non molestiae qui. Vitae quaerat aliquam praesentium. Molestiae ad illo asperiores beatae error necessitatibus. Rerum laborum ducimus sit voluptatibus qui aut. Consequuntur porro aut quo sed consectetur qui fugiat. Sunt harum sunt facere laboriosam quo enim. Sunt cumque et ut nisi et aut.', '324.00', '300.00', 'DIGI459', 'instock', 0, 190, 'digital_14.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-11-25 08:24:26', 1),
(12, 'quidem alias earum a', 'quidem-alias-earum-a', 'Eum magnam et maiores sint dolorum mollitia. Accusantium enim quam quia error enim delectus. Corporis et et corrupti id fugit exercitationem id.', 'Numquam magnam tempore repellendus minima sint. Et qui et natus et non culpa ut. Quia quasi nobis aut quaerat. Distinctio quos nisi consequuntur nesciunt et sint accusamus. Ullam accusamus autem hic consequuntur qui vero. Inventore porro sint quaerat. Beatae sint earum iure sed enim. Eos suscipit reiciendis ratione nobis vel voluptates aliquam.', '495.00', NULL, 'DIGI154', 'instock', 0, 138, 'digital_16.jpg', NULL, 5, '2021-10-11 08:11:09', '2021-10-11 08:11:09', NULL),
(13, 'ipsum eligendi et corporis', 'ipsum-eligendi-et-corporis', 'Voluptates et ut debitis dignissimos iusto maxime. Saepe rem adipisci neque sint dolore.', 'Qui ea omnis quis molestiae explicabo non est. Voluptatem non mollitia magnam officiis aut sequi cumque. Est totam rerum blanditiis quasi. Suscipit repudiandae qui eligendi dolor vero. Doloremque corporis earum vel veritatis officia. Ab qui aperiam velit ut porro enim nemo. Repellat sed iste aut ut aspernatur qui enim possimus. Magnam reiciendis perferendis labore quis laudantium temporibus.', '333.00', '330.00', 'DIGI432', 'instock', 0, 169, 'digital_17.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-11-25 08:34:54', 5),
(14, 'architecto ea rem iste', 'architecto-ea-rem-iste', 'Dolorem voluptas voluptatem odit consectetur. Atque facere vero veritatis repudiandae. Unde repudiandae quae necessitatibus omnis.', 'Velit repellendus aut consequuntur error eos molestiae. Voluptate iste aut perferendis. Enim maiores optio et nisi rerum. Ipsa sequi qui reiciendis provident consectetur amet et qui. Distinctio recusandae sint minus sunt velit recusandae. Quod aut occaecati veniam quidem. Ducimus omnis recusandae quibusdam qui. Veniam et similique velit sunt quaerat. Ducimus et qui rem rerum fuga optio.', '450.00', '420.00', 'DIGI415', 'instock', 0, 163, 'digital_4.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-11-25 08:25:12', 1),
(15, 'iusto consequatur ipsa fugit', 'iusto-consequatur-ipsa-fugit', 'Quo molestiae quia excepturi vero voluptas dolore. Eveniet consequatur earum voluptas quia ducimus adipisci in.', 'Rerum iusto illo quas aut quia sit. Consequuntur ducimus voluptatem quia quisquam. Ut architecto voluptatem cum. Accusantium ea voluptatum temporibus dolore. Molestiae cupiditate necessitatibus enim vel. Odio eligendi minima occaecati optio ipsum impedit dolor. Qui laborum ducimus qui recusandae.', '473.00', '450.00', 'DIGI329', 'instock', 0, 188, 'digital_22.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-11-25 08:34:10', 5),
(16, 'quasi saepe non nam', 'quasi-saepe-non-nam', 'Ducimus in quae numquam possimus illo. Qui nisi sit sequi vel. Minus corrupti cum temporibus exercitationem exercitationem.', 'Quibusdam eius qui at sed. Itaque nobis unde pariatur exercitationem quam. Maiores voluptatem minima blanditiis totam eveniet labore consequuntur hic. Non aut aspernatur nihil iusto. Et consequatur blanditiis excepturi ut quos error facere. Alias sint ea rerum tempore facilis sit.', '405.00', NULL, 'DIGI204', 'instock', 0, 177, 'digital_10.jpg', NULL, 3, '2021-10-11 08:11:09', '2021-10-11 08:11:09', NULL),
(17, 'consequatur possimus alias vel', 'consequatur-possimus-alias-vel', 'Iusto sunt labore suscipit autem. Est nemo est veritatis cum nobis temporibus. Ut ex illum in. Dolor voluptas sed aut consequatur quis voluptates.', 'Molestiae fugit qui quibusdam corrupti. Quos repellat recusandae aperiam in eveniet dolor voluptas. Recusandae explicabo eius aut esse laborum est. Qui asperiores nisi ducimus repellendus magnam sequi nihil.', '218.00', '200.00', 'DIGI135', 'instock', 0, 138, 'digital_9.jpg', NULL, 1, '2021-10-11 08:11:09', '2021-11-25 08:25:45', 8),
(18, 'perferendis et voluptatem odio', 'perferendis-et-voluptatem-odio', 'Molestiae optio mollitia non id. Quaerat quia est cum consequatur qui.', 'Et necessitatibus mollitia nulla quae ab aspernatur et. Assumenda accusantium similique quam maiores non libero. Repellendus perspiciatis quia quas et nesciunt. Labore nobis cumque excepturi debitis qui ducimus. Eum soluta ut sunt omnis omnis magnam nam. Ex sed quas aperiam tempore possimus harum.', '13.00', NULL, 'DIGI440', 'instock', 0, 106, 'digital_15.jpg', NULL, 3, '2021-10-11 08:11:09', '2021-10-11 08:11:09', NULL),
(19, 'blanditiis ad quis corrupti', 'blanditiis-ad-quis-corrupti', 'Odio esse occaecati excepturi repellat a iste. Odit esse quia blanditiis officiis molestiae sint perspiciatis voluptatum. Harum sed ullam voluptatibus qui suscipit eum.', 'Officiis voluptatum facere necessitatibus laboriosam error quidem. Architecto optio laborum laudantium doloribus ullam beatae quas voluptas. Dignissimos sunt consequatur saepe enim perferendis et. Aperiam laudantium sit ut suscipit.', '423.00', NULL, 'DIGI220', 'instock', 0, 182, 'digital_3.jpg', NULL, 3, '2021-10-11 08:11:09', '2021-10-11 08:11:09', NULL),
(20, 'omnis neque necessitatibus laudantium', 'omnis-neque-necessitatibus-laudantium', 'Dolorem perferendis ut accusamus adipisci temporibus maiores consectetur. Earum error laudantium est ipsam. Iste quam unde nulla debitis a fugit.', 'Consequatur provident consequatur eaque quaerat autem nostrum. Qui consequatur repellat aliquid autem ut magnam. Natus quaerat voluptatem a et vel. Laudantium placeat veritatis consequatur et. Nesciunt aspernatur molestiae omnis reprehenderit eaque dolorem. Ab dolores omnis et.', '444.00', '440.00', 'DIGI256', 'instock', 0, 111, 'digital_21.jpg', NULL, 2, '2021-10-11 08:11:09', '2021-11-25 08:35:38', 3),
(21, 'dolorem omnis laborum expedita', 'dolorem-omnis-laborum-expedita', 'Sunt adipisci aut doloremque ad minima nobis. Dolorem possimus vitae est sit ut modi. Magnam esse omnis odio incidunt dolores error aut illo. Iure rem commodi animi aut provident distinctio.', 'At exercitationem quidem rerum cum nesciunt. Et id tenetur consequuntur distinctio tempora atque eos. Quaerat quasi eos aspernatur ut quidem ipsa. Molestiae sint impedit dolores beatae atque architecto eius. Sint qui atque pariatur excepturi magni. Laborum rem molestias sed optio corrupti corrupti aliquid. Qui nihil dolorum veritatis voluptates aut ut harum.', '246.00', '200.00', 'DIGI435', 'instock', 0, 128, 'digital_2.jpg', NULL, 2, '2021-10-11 08:11:09', '2021-11-25 08:31:37', 3),
(24, 'hello  4', 'hello-4', 'djuh', 'nnbhyh', '200.00', '200.00', 'kfikjfifj', 'instock', 0, 10, '1634023903.jpg', NULL, 7, '2021-10-11 10:10:53', '2021-10-12 01:32:56', NULL),
(25, 'Mens Shoo', 'mens-shoo', 'Mens new product', 'Mens new product', '130.00', '130.00', 'B3RTC', 'instock', 0, 70, '1634106090.jpg', NULL, 3, '2021-10-13 00:21:30', '2021-10-13 00:21:30', NULL),
(26, 'Latest Product', 'latest-product', 'This is  Watch short des', 'Its very expensive design des', '340.00', '340.00', 'DH34T', 'instock', 0, 30, '1634137894.jpg', NULL, 3, '2021-10-13 09:11:34', '2021-11-25 08:22:43', 9),
(27, 'Omens Category', 'omens-category', 'Omens Category test', 'Omens Category test', '200.00', '200.00', 'DG6TH', 'instock', 0, 45, '1634220233.jpg', NULL, 4, '2021-10-14 08:03:53', '2021-11-25 08:36:40', 6),
(28, 'Childen Prodduct', 'childen-prodduct', 'This is first Childen product', 'This is first Childen product des', '220.00', '220.00', 'DGHT', 'instock', 0, 30, '1634220442.jpg', NULL, 5, '2021-10-14 08:07:22', '2021-11-25 08:39:04', 7),
(29, 'Electronics validate', 'electronics-validate', 'Electronics device', 'Electronics des', '30.00', '25.00', 'BTR6', 'instock', 0, 12, '1634479717.jpg', ',16374232250.jpg,16374232251.jpg,16374232252.jpg,16374232253.jpg,16374232254.jpg', 1, '2021-10-14 08:09:26', '2021-11-25 10:39:29', 10),
(33, 'This is new product Validate', 'this-is-new-product-validate', 'This is new product validate short des', 'This is new product validate short des', '300.00', '250.00', 'DTHS6', 'instock', 0, 10, '1634479228.jpg', ',16374225410.jpg,16374225411.jpg', 3, '2021-10-17 08:00:28', '2021-11-25 08:39:46', 4),
(34, 'Platinum-watch1', 'platinum-watch1', '<p><strong>Dial Color:</strong> White Case Shape:Round</p>\n<p><strong>Band Color:&nbsp;</strong>Gold Band material ,Metal</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<ul class=\"\" style=\"margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Helvetica Neue\', Helvetica, sans-serif; font-size: 12px; background-color: #ffffff;\">\n<li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.7750BPGLBPGLXN\"><strong>Material:</strong> Rubber</li>\n<li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i4.7750BPGLBPGLXN\"><strong>Weight:</strong> 13.6 Grams</li>\n<li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i5.7750BPGLBPGLXN\"><strong>Color: </strong>Black</li>\n<li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i6.7750BPGLBPGLXN\">I<strong>n-line Remote:</strong> Yes</li>\n<li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">&nbsp;</li>\n</ul>', '450.00', '420.00', 'DIGI56TG', 'instock', 0, 10, '1634998080.jpg', NULL, 3, '2021-10-23 08:00:57', '2021-11-25 08:23:09', 9),
(35, 'Gallery Product', 'gallery-product', '<p>this is gallery product</p>', '<p>this is gallery product dscription</p>', '570.00', '550.00', 'HGT6', 'instock', 0, 50, '1637379107.jpg', ',16374223630.jpg,16374223631.jpg', 1, '2021-11-19 21:31:47', '2021-11-25 08:26:18', 8),
(36, 'New product Eshad', 'new-product-eshad', '<p>This is sub category product</p>', '<p>This is sub category product</p>', '240.00', '200.00', 'GT65', 'instock', 0, 10, '1637767341.jpg', ',16377673410.jpg,16377673411.jpg,16377673412.jpg', 5, '2021-11-24 09:22:21', '2021-11-24 09:22:21', 7),
(37, 'New Spaker', 'new-spaker', '<p>is good</p>', '<p>is too good</p>', '230.00', '200.00', '56t', 'instock', 0, 23, '1637770453.jpg', ',16377704530.jpg,16377704531.jpg,16377704532.jpg', 1, '2021-11-24 10:14:13', '2021-11-24 10:16:20', 5),
(38, 'Juelary -1', 'juelary-1', '<p>This is best product for women</p>', '<p>This is best product for women</p>', '250.00', '230.00', 'GT67', 'instock', 0, 10, '1637851536.jpg', ',16378514150.jpg,16378514151.jpg,16378514152.webp', 4, '2021-11-25 08:43:35', '2021-11-25 08:45:36', 12);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, '01832348236', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-27 03:48:39', '2021-11-27 03:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 4, 'Nice product', 7, '2021-11-17 00:56:58', '2021-11-17 00:56:58'),
(2, 5, 'Nice product', 8, '2021-11-17 01:03:04', '2021-11-17 01:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2021-10-20 04:20:20', 1, NULL, '2021-10-16 00:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bIbsJw806cBBsKDiEtxrlU0dtApM0MKXnUUicwA0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiaUVFeWN2RW1lZHlwaFQ3MVdlTGVsaGY5RHk0N1I5aGpoR2ViM1hISSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jYXJ0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJC5ramRYdE5ycFhCMjdwV2ltdXlOVGVXbmZiZG9JU2RNOHo2T0JpTzZWWkc2TFROSFkyZ0dxIjtzOjQ6ImNhcnQiO2E6MTp7czo0OiJjYXJ0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkLmtqZFh0TnJwWEIyN3BXaW11eU5UZVduZmJkb0lTZE04ejZPQmlPNlZaRzZMVE5IWTJnR3EiO3M6ODoiY2hlY2tvdXQiO2E6NDp7czo4OiJkaXNjb3VudCI7aTowO3M6ODoic3VidG90YWwiO3M6NDoiMC4wMCI7czozOiJ0YXgiO3M6NDoiMC4wMCI7czo1OiJ0b3RhbCI7czo0OiIwLjAwIjt9fQ==', 1638006765);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twiter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twiter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'sazid@gmail.com', '01832348236', '01300045794', 'mirpur-1,Dhaka,Bangladesh', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14602.700311873408!2d90.34510367196737!3d23.794582086910268!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0e96fce29dd%3A0x6ccd9e51aba9e64d!2sMirpur-1%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1637253840493!5m2!1sen!2sbd', '#', '#', '#', '#', '#', '2021-11-18 08:53:09', '2021-11-20 07:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, 'sazid', 'fahim', '01832348236', 'sazid@gmail.com', 'test 1', 'test2', 'Noakhali', 'Noakhali', 'Bangladesh', '3456', '2021-11-07 23:27:24', '2021-11-07 23:27:24'),
(2, 2, 'sazid', 'fahim', '01832348236', 'sazid@gmail.com', 'test 1', 'test2', 'Noakhali', 'Noakhali', 'Bangladesh', '3456', '2021-11-07 23:28:01', '2021-11-07 23:28:01'),
(3, 3, 'sazid', 'fahim', '01832348236', 'sazid@gmail.com', 'test 1', 'test2', 'Noakhali', 'Noakhali', 'Bangladesh', '3456', '2021-11-07 23:28:27', '2021-11-07 23:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-25 11:38:29', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-25 11:38:30', NULL),
('eshad@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-21 09:48:16', NULL),
('lovspori81@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-26 22:43:16', NULL),
('lovspori81@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-26 22:43:12', NULL),
('sazidfahim499@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"a775bac9cff7dec2b984e023b95206aa\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"a775bac9cff7dec2b984e023b95206aa\";s:2:\"id\";i:3;s:3:\"qty\";i:1;s:4:\"name\";s:6:\"Camera\";s:5:\"price\";d:423;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-24 09:45:04', NULL),
('sazidfahim499@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-24 09:44:58', NULL),
('user@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2021-11-27 03:52:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'laptop', 1, '2021-11-22 08:58:58', '2021-11-22 23:58:35'),
(3, 'Samsung', 'samsung', 2, '2021-11-22 09:10:23', '2021-11-22 09:10:23'),
(4, 'T-Shirt', 't-shirt', 3, '2021-11-22 09:12:21', '2021-11-22 09:12:21'),
(5, 'Speaker', 'speaker', 1, '2021-11-23 00:52:32', '2021-11-23 00:52:32'),
(6, 'Borka', 'borka', 4, '2021-11-23 00:52:53', '2021-11-23 00:52:53'),
(7, 'Eshad', 'eshad', 5, '2021-11-23 08:28:14', '2021-11-23 08:28:14'),
(8, 'tv', 'tv', 1, '2021-11-24 10:04:33', '2021-11-24 10:04:33'),
(9, 'Watch', 'watch', 3, '2021-11-24 10:18:30', '2021-11-25 10:28:02'),
(10, 'Camera', 'camera', 1, '2021-11-25 08:32:35', '2021-11-25 08:32:35'),
(11, 'Jacket', 'jacket', 4, '2021-11-25 08:37:15', '2021-11-25 08:37:15'),
(12, 'Juelary', 'juelary', 4, '2021-11-25 08:37:28', '2021-11-25 08:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'cod', 'pending', '2021-11-07 23:27:24', '2021-11-07 23:27:24'),
(2, 1, 2, 'cod', 'pending', '2021-11-07 23:28:01', '2021-11-07 23:28:01'),
(3, 1, 3, 'cod', 'pending', '2021-11-07 23:28:27', '2021-11-07 23:28:27'),
(4, 1, 4, 'cod', 'pending', '2021-11-08 23:45:14', '2021-11-08 23:45:14'),
(5, 1, 5, 'cod', 'pending', '2021-11-08 23:54:05', '2021-11-08 23:54:05'),
(6, 1, 6, 'cod', 'pending', '2021-11-09 00:01:51', '2021-11-09 00:01:51'),
(7, 2, 8, 'card', 'approved', '2021-11-10 23:06:42', '2021-11-10 23:06:42'),
(8, 2, 9, 'card', 'approved', '2021-11-10 23:11:41', '2021-11-10 23:11:41'),
(9, 1, 10, 'cod', 'pending', '2021-11-11 00:52:38', '2021-11-11 00:52:38'),
(10, 1, 11, 'cod', 'pending', '2021-11-14 23:43:02', '2021-11-14 23:43:02'),
(11, 2, 12, 'cod', 'pending', '2021-11-16 07:32:29', '2021-11-16 07:32:29'),
(12, 1, 13, 'cod', 'pending', '2021-11-20 07:24:47', '2021-11-20 07:24:47'),
(13, 4, 14, 'cod', 'pending', '2021-11-21 07:33:23', '2021-11-21 07:33:23'),
(14, 4, 15, 'cod', 'pending', '2021-11-21 07:40:33', '2021-11-21 07:40:33'),
(15, 4, 16, 'cod', 'pending', '2021-11-21 07:43:37', '2021-11-21 07:43:37'),
(16, 2, 17, 'cod', 'pending', '2021-11-21 08:17:30', '2021-11-21 08:17:30'),
(17, 2, 18, 'cod', 'pending', '2021-11-21 08:18:38', '2021-11-21 08:18:38'),
(18, 2, 19, 'cod', 'pending', '2021-11-21 08:21:13', '2021-11-21 08:21:13'),
(19, 4, 20, 'cod', 'pending', '2021-11-21 09:44:45', '2021-11-21 09:44:45'),
(20, 5, 21, 'cod', 'pending', '2021-11-21 09:46:47', '2021-11-21 09:46:47'),
(21, 5, 22, 'cod', 'pending', '2021-11-21 09:48:12', '2021-11-21 09:48:12'),
(22, 4, 23, 'cod', 'pending', '2021-11-21 09:49:55', '2021-11-21 09:49:55'),
(23, 4, 24, 'cod', 'pending', '2021-11-21 10:00:07', '2021-11-21 10:00:07'),
(24, 4, 25, 'cod', 'pending', '2021-11-21 10:25:45', '2021-11-21 10:25:45'),
(25, 4, 26, 'cod', 'pending', '2021-11-21 10:33:40', '2021-11-21 10:33:40'),
(26, 6, 27, 'cod', 'pending', '2021-11-24 09:45:44', '2021-11-24 09:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for admin and USR for User or Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$vk5W9qQS6ld8YQqBd1v4weBfN7oG97XeKZNJVEnmO9XOlbibNw0LG', NULL, NULL, NULL, NULL, NULL, 'ADM', '2021-10-11 08:08:58', '2021-10-11 08:08:58'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$.kjdXtNrpXB27pWimuyNTeWnfbdoISdM8z6OBiO6VZG6LTNHY2gGq', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-10-11 08:11:54', '2021-11-18 05:57:55'),
(3, 'Admin2', 'admin2@gmail.com', NULL, '$2y$10$p8tLzj4XGACwa/eS8BW/e.DPUWiA/4wzBWoXGte76StQv0kPbq/1C', NULL, NULL, NULL, NULL, NULL, 'ADM', '2021-11-11 00:55:45', '2021-11-11 00:55:45'),
(4, 'Fahim', 'lovspori81@gmail.com', NULL, '$2y$10$HJh/ppI/Xc2zo0m4nx9UPep6uzA9agUYYU0Mm71UemLpVv6p7HARC', NULL, NULL, '15isWt1fCCbfPKFqkoBuqQ7Pk85EF1uE61L8Q0reuhvRZy02T8C5u7iOVZhD', NULL, NULL, 'USR', '2021-11-19 22:04:50', '2021-11-19 22:33:57'),
(5, 'Eshad', 'eshad@gmail.com', NULL, '$2y$10$8yM.GEZotWcp2SzRgWgf0u40Uk5NAJfW215qg2wqCko4kcRy1m.ZG', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-11-21 09:46:01', '2021-11-21 09:46:01'),
(6, 'Sazid', 'sazidfahim499@gmail.com', NULL, '$2y$10$TRYAg8lanpUlo7orIWHuUOxKqBvnThjYRX68q9mO2IYNoLYC9esla', NULL, NULL, 'AiMYDTAQcey7Zro0G82WYgJrmflRE6pOiWMVFLu0dIqQ6yo2np0dhL0doy3T', NULL, NULL, 'USR', '2021-11-24 09:42:47', '2021-11-24 09:44:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
