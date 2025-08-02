-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 01:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_parts_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_makes`
--

CREATE TABLE `car_makes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_makes`
--

INSERT INTO `car_makes` (`id`, `name`, `logo_url`, `created_at`) VALUES
(1, 'Toyota', 'https://logos-world.net/wp-content/uploads/2020/04/Toyota-Logo.png', '2025-06-01 19:43:43'),
(2, 'Nissan', 'https://logos-world.net/wp-content/uploads/2020/04/Nissan-Logo.png', '2025-06-01 19:43:43'),
(3, 'Honda', 'https://logos-world.net/wp-content/uploads/2020/04/Honda-Logo.png', '2025-06-01 19:43:43'),
(4, 'Mazda', 'https://logos-world.net/wp-content/uploads/2020/04/Mazda-Logo.png', '2025-06-01 19:43:43'),
(5, 'Mitsubishi', 'https://logos-world.net/wp-content/uploads/2020/04/Mitsubishi-Logo.png', '2025-06-01 19:43:43'),
(6, 'Subaru', 'https://logos-world.net/wp-content/uploads/2020/04/Subaru-Logo.png', '2025-06-01 19:43:43'),
(7, 'Isuzu', 'https://logos-world.net/wp-content/uploads/2020/04/Isuzu-Logo.png', '2025-06-01 19:43:43'),
(8, 'Suzuki', 'https://logos-world.net/wp-content/uploads/2020/04/Suzuki-Logo.png', '2025-06-01 19:43:43'),
(9, 'Hyundai', 'https://logos-world.net/wp-content/uploads/2020/04/Hyundai-Logo.png', '2025-06-01 19:43:43'),
(10, 'Volkswagen', 'https://logos-world.net/wp-content/uploads/2020/04/Volkswagen-Logo.png', '2025-06-01 19:43:43'),
(11, 'BMW', 'https://logos-world.net/wp-content/uploads/2020/04/BMW-Logo.png', '2025-06-14 22:06:40'),
(12, 'Mercedes-Benz', 'https://logos-world.net/wp-content/uploads/2020/04/Mercedes-Logo.png', '2025-06-14 22:06:40'),
(13, 'Audi', 'https://logos-world.net/wp-content/uploads/2020/04/Audi-Logo.png', '2025-06-14 22:06:40'),
(14, 'Ford', 'https://logos-world.net/wp-content/uploads/2020/04/Ford-Logo.png', '2025-06-14 22:06:40'),
(15, 'Chevrolet', 'https://logos-world.net/wp-content/uploads/2020/04/Chevrolet-Logo.png', '2025-06-14 22:06:40'),
(16, 'Peugeot', 'https://logos-world.net/wp-content/uploads/2020/04/Peugeot-Logo.png', '2025-06-14 22:06:40'),
(17, 'Renault', 'https://logos-world.net/wp-content/uploads/2020/04/Renault-Logo.png', '2025-06-14 22:06:40'),
(18, 'Kia', 'https://logos-world.net/wp-content/uploads/2020/04/Kia-Logo.png', '2025-06-14 22:06:40'),
(19, 'Lexus', 'https://logos-world.net/wp-content/uploads/2020/04/Lexus-Logo.png', '2025-06-14 22:06:40'),
(20, 'Infiniti', 'https://logos-world.net/wp-content/uploads/2020/04/Infiniti-Logo.png', '2025-06-14 22:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `id` int(11) NOT NULL,
  `make_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`id`, `make_id`, `name`, `year_from`, `year_to`, `created_at`) VALUES
(1, 1, 'Hilux', 2005, 2024, '2025-06-01 19:43:43'),
(2, 1, 'Corolla', 2003, 2024, '2025-06-01 19:43:43'),
(3, 1, 'Camry', 2006, 2024, '2025-06-01 19:43:43'),
(4, 2, 'X-Trail', 2007, 2024, '2025-06-01 19:43:43'),
(5, 2, 'Navara', 2005, 2024, '2025-06-01 19:43:43'),
(6, 3, 'Civic', 2006, 2024, '2025-06-01 19:43:43'),
(7, 3, 'CR-V', 2007, 2024, '2025-06-01 19:43:43'),
(8, 4, 'Demio', 2007, 2024, '2025-06-01 19:43:43'),
(9, 5, 'Pajero', 2006, 2024, '2025-06-01 19:43:43'),
(10, 6, 'Forester', 2008, 2024, '2025-06-01 19:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Engine Parts', 'Engine components and accessories', '2025-06-01 19:43:43'),
(2, 'Brake System', 'Brake pads, discs, and brake system components', '2025-06-01 19:43:43'),
(3, 'Suspension', 'Shock absorbers, springs, and suspension parts', '2025-06-01 19:43:43'),
(4, 'Electrical', 'Lights, batteries, and electrical components', '2025-06-01 19:43:43'),
(5, 'Filters', 'Air filters, oil filters, and fuel filters', '2025-06-01 19:43:43'),
(6, 'Transmission', 'Gearbox and transmission components', '2025-06-01 19:43:43'),
(7, 'Cooling System', 'Radiators, water pumps, and cooling parts', '2025-06-01 19:43:43'),
(8, 'Exhaust System', 'Exhaust pipes, mufflers, and catalytic converters', '2025-06-01 19:43:43'),
(9, 'Body Parts', 'Bumpers, mirrors, and body accessories', '2025-06-01 19:43:43'),
(10, 'Interior', 'Seats, dashboard, and interior accessories', '2025-06-01 19:43:43'),
(11, 'Performance Upgrades', 'High-performance parts for enhanced vehicle performance', '2025-06-02 06:22:27'),
(12, 'Maintenance & Service', 'Regular maintenance and service parts', '2025-06-02 06:22:27'),
(13, 'Tires & Wheels', 'Tires, rims, and wheel accessories', '2025-06-02 06:22:27'),
(14, 'Audio & Electronics', 'Car audio systems and electronic accessories', '2025-06-02 06:22:27'),
(15, 'Security & Safety', 'Security systems, alarms, and safety equipment', '2025-06-02 06:22:27'),
(16, 'Exterior Accessories', 'External styling and functional accessories', '2025-06-02 06:22:27'),
(17, 'Interior Accessories', 'Interior comfort and styling accessories', '2025-06-02 06:22:27'),
(18, 'Tools & Equipment', 'Automotive tools and diagnostic equipment', '2025-06-02 06:22:27'),
(19, 'Fluids & Chemicals', 'Engine oils, coolants, and automotive chemicals', '2025-06-02 06:22:27'),
(20, 'Gaskets & Seals', 'Engine and transmission gaskets and seals', '2025-06-02 06:22:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `shipping_address`, `phone`, `created_at`) VALUES
(1, 3, 510000.00, 'delivered', 'Mbagala', '0753775184', '2025-06-01 20:42:52'),
(2, 3, 85000.00, 'pending', 'Mbagala', '0753775184', '2025-06-01 21:22:35'),
(3, 5, 285000.00, 'processing', 'cgn', '0753775184', '2025-06-03 17:10:22'),
(4, 6, 1466000.00, 'delivered', 'Mbagala', '07865543342', '2025-06-30 11:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 25000.00),
(2, 1, 38, 1, 485000.00),
(3, 2, 12, 1, 85000.00),
(4, 3, 105, 1, 285000.00),
(5, 4, 160, 1, 23000.00),
(6, 4, 161, 1, 1128000.00),
(7, 4, 165, 1, 315000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'TZS',
  `status` enum('pending','processing','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `currency`, `status`, `payment_method`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 2, 85000.00, 'TZS', 'failed', NULL, NULL, '2025-06-01 21:26:25', '2025-06-01 21:26:26'),
(2, 2, 85000.00, 'TZS', 'failed', NULL, NULL, '2025-06-02 06:39:51', '2025-06-02 06:39:52'),
(3, 2, 85000.00, 'TZS', 'failed', NULL, NULL, '2025-06-02 06:40:47', '2025-06-02 06:40:48'),
(4, 4, 1466000.00, 'TZS', 'failed', NULL, NULL, '2025-06-30 11:01:46', '2025-06-30 11:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `part_number` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `part_number`, `name`, `description`, `category_id`, `price`, `stock_quantity`, `image_url`, `is_featured`, `created_at`) VALUES
(1, 'BP001', 'Toyota Hilux Brake Pads Front', 'High quality ceramic brake pads for Toyota Hilux front wheels', 2, 45000.00, 50, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(2, 'AF002', 'Universal Air Filter', 'High performance air filter suitable for multiple car models', 5, 25000.00, 99, 'https://images.unsplash.com/photo-1609205807107-e8ec2120f9de?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(3, 'SP003', 'Nissan X-Trail Shock Absorber', 'Premium shock absorber for Nissan X-Trail rear suspension', 3, 85000.00, 30, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 19:43:43'),
(4, 'HL004', 'Honda Civic Headlight Assembly', 'Complete headlight assembly for Honda Civic 2006-2012', 4, 120000.00, 20, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(5, 'OF005', 'Toyota Engine Oil Filter', 'Original equipment oil filter for Toyota engines', 5, 15000.00, 80, 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=500&h=400&fit=crop', 0, '2025-06-01 19:43:43'),
(6, 'WP006', 'Universal Water Pump', 'High quality water pump for cooling system', 7, 65000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(7, 'BP007', 'Mazda Demio Brake Disc', 'Ventilated brake disc for Mazda Demio front wheels', 2, 55000.00, 40, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-01 19:43:43'),
(8, 'SP008', 'Mitsubishi Pajero Spring Set', 'Complete spring set for Mitsubishi Pajero suspension', 3, 95000.00, 15, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(9, 'EX009', 'Universal Exhaust Muffler', 'Stainless steel exhaust muffler for various models', 8, 75000.00, 35, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 19:43:43'),
(10, 'BM010', 'Side Mirror Assembly', 'Electric side mirror assembly with indicator', 9, 45000.00, 60, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 1, '2025-06-01 19:43:43'),
(11, 'TY008', 'Toyota Hilux Bull Bar', 'Heavy duty steel bull bar for Toyota Hilux front protection', 9, 285000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(12, 'TY009', 'Toyota Corolla Window Regulator', 'Electric window regulator for Toyota Corolla front door', 4, 85000.00, 21, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(13, 'TY010', 'Toyota Camry Oxygen Sensor', 'Lambda oxygen sensor for Toyota Camry exhaust system', 8, 125000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(14, 'NS008', 'Nissan X-Trail Roof Rails', 'Aluminum roof rails for Nissan X-Trail cargo system', 9, 165000.00, 15, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(15, 'NS009', 'Nissan Navara Fuel Tank', 'Steel fuel tank 80L for Nissan Navara pickup', 1, 385000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(16, 'NS010', 'Nissan X-Trail Door Handle', 'Chrome exterior door handle for Nissan X-Trail', 9, 45000.00, 35, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(17, 'HD008', 'Honda Civic Seat Cover', 'Leather seat cover set for Honda Civic interior', 10, 125000.00, 20, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(18, 'HD009', 'Honda CR-V Windshield', 'Laminated windshield glass for Honda CR-V', 9, 185000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(19, 'HD010', 'Honda Civic Ignition Coil', 'High performance ignition coil for Honda Civic 1.8L', 4, 65000.00, 28, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(20, 'MZ008', 'Mazda CX-5 Sunroof Motor', 'Electric sunroof motor for Mazda CX-5 panoramic roof', 4, 225000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(21, 'MZ009', 'Mazda Demio Dashboard', 'Complete dashboard assembly for Mazda Demio interior', 10, 385000.00, 5, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(22, 'MZ010', 'Mazda CX-5 Parking Sensor', 'Ultrasonic parking sensor for Mazda CX-5 rear bumper', 4, 35000.00, 40, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(23, 'MT008', 'Mitsubishi Pajero Winch', 'Electric winch 9000lbs for Mitsubishi Pajero off-road', 9, 485000.00, 4, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(24, 'MT009', 'Mitsubishi L200 Tonneau Cover', 'Hard tonneau cover for Mitsubishi L200 pickup bed', 9, 225000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(25, 'MT010', 'Mitsubishi Pajero ABS Sensor', 'Front ABS wheel speed sensor for Mitsubishi Pajero', 2, 85000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(26, 'SB008', 'Subaru Forester Roof Box', 'Aerodynamic roof box 400L for Subaru Forester', 9, 325000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(27, 'SB009', 'Subaru Impreza Intercooler Pipe', 'Aluminum intercooler pipe kit for Subaru Impreza WRX', 1, 145000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(28, 'SB010', 'Subaru Forester Floor Mats', 'All-weather floor mats for Subaru Forester interior', 10, 65000.00, 30, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(29, 'IZ008', 'Isuzu D-Max Snorkel', 'Safari snorkel kit for Isuzu D-Max air intake', 1, 285000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(30, 'IZ009', 'Isuzu D-Max Tow Bar', 'Heavy duty tow bar 3500kg for Isuzu D-Max', 9, 195000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(31, 'IZ010', 'Isuzu D-Max Mud Flaps', 'Heavy duty mud flaps for Isuzu D-Max wheel wells', 9, 45000.00, 35, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(32, 'SZ008', 'Suzuki Vitara Side Steps', 'Aluminum side steps for Suzuki Vitara SUV', 9, 165000.00, 14, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(33, 'SZ009', 'Suzuki Swift Gear Knob', 'Leather gear knob for Suzuki Swift manual transmission', 10, 25000.00, 50, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(34, 'SZ010', 'Suzuki Vitara Spare Tire Cover', 'Canvas spare tire cover for Suzuki Vitara rear', 9, 55000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(35, 'HY008', 'Hyundai Tucson Cargo Liner', 'Waterproof cargo liner for Hyundai Tucson trunk', 10, 85000.00, 22, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(36, 'HY009', 'Hyundai Elantra Spoiler', 'ABS rear spoiler for Hyundai Elantra sedan', 9, 125000.00, 16, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(37, 'HY010', 'Hyundai Tucson Wiper Blade', 'Hybrid wiper blade set for Hyundai Tucson windshield', 4, 35000.00, 45, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(38, 'VW008', 'VW Golf Alloy Wheels', '17-inch alloy wheels set for VW Golf GTI', 9, 485000.00, 4, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-01 20:02:21'),
(39, 'VW009', 'VW Polo Steering Wheel', 'Leather steering wheel for VW Polo interior', 10, 165000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(40, 'VW010', 'VW Golf Brake Light', 'LED third brake light for VW Golf rear window', 4, 75000.00, 28, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 0, '2025-06-01 20:02:21'),
(100, 'TY011', 'Toyota Hilux Performance Exhaust System', 'Stainless steel performance exhaust for Toyota Hilux with improved flow', 11, 485000.00, 8, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(101, 'TY012', 'Toyota Corolla LED Headlight Kit', 'Full LED conversion kit for Toyota Corolla with DRL', 4, 225000.00, 15, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(102, 'TY013', 'Toyota Camry Brake Disc Set', 'Ventilated brake disc set front and rear for Toyota Camry', 2, 165000.00, 20, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(103, 'TY014', 'Toyota Hilux Snorkel Kit', 'Safari snorkel kit for Toyota Hilux deep water crossing', 1, 385000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(104, 'TY015', 'Toyota Corolla Floor Mats', 'Waterproof rubber floor mats for Toyota Corolla', 17, 45000.00, 35, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(105, 'TY016', 'Toyota Camry Timing Chain Kit', 'Complete timing chain kit for Toyota Camry 2.4L engine', 1, 285000.00, 11, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(106, 'TY017', 'Toyota Hilux Alloy Wheels 17\"', 'Set of 4 alloy wheels 17\" for Toyota Hilux', 13, 685000.00, 4, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(107, 'TY018', 'Toyota Corolla Car Alarm System', 'Advanced car alarm system with remote start for Toyota Corolla', 15, 125000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(108, 'TY019', 'Toyota Camry Engine Oil 5W-30', 'Synthetic engine oil 5W-30 for Toyota Camry 4L', 19, 35000.00, 50, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(109, 'TY020', 'Toyota Hilux Differential Lock', 'Electronic differential lock system for Toyota Hilux 4WD', 11, 565000.00, 5, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(110, 'TY021', 'Toyota Corolla Spark Plug Set', 'Iridium spark plugs set for Toyota Corolla 1.8L', 1, 85000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(111, 'TY022', 'Toyota Camry Suspension Kit', 'Complete suspension upgrade kit for Toyota Camry', 3, 485000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(112, 'TY023', 'Toyota Hilux Tonneau Cover', 'Hard folding tonneau cover for Toyota Hilux pickup bed', 16, 285000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(113, 'TY024', 'Toyota Corolla Dashboard Camera', 'Full HD dashboard camera with night vision for Toyota Corolla', 14, 165000.00, 22, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(114, 'TY025', 'Toyota Camry Coolant Radiator', 'High-performance aluminum radiator for Toyota Camry', 7, 225000.00, 14, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(115, 'TY026', 'Toyota Hilux Rock Sliders', 'Heavy duty rock sliders for Toyota Hilux off-road protection', 16, 385000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(116, 'TY027', 'Toyota Corolla Seat Covers', 'Premium leather seat covers for Toyota Corolla', 17, 125000.00, 20, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(117, 'TY028', 'Toyota Camry Turbocharger', 'Performance turbocharger upgrade for Toyota Camry 2.0L', 11, 685000.00, 3, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(118, 'TY029', 'Toyota Hilux Winch 12000lbs', 'Electric winch 12000lbs with synthetic rope for Toyota Hilux', 18, 485000.00, 5, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(119, 'TY030', 'Toyota Corolla Head Gasket Set', 'Complete head gasket set for Toyota Corolla engine rebuild', 20, 185000.00, 15, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(120, 'NS011', 'Nissan X-Trail CVT Transmission Filter', 'CVT transmission filter and fluid for Nissan X-Trail', 6, 85000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(121, 'NS012', 'Nissan Navara Performance Chip', 'ECU performance chip for Nissan Navara diesel engine', 11, 225000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(122, 'NS013', 'Nissan X-Trail Tire Set 225/60R17', 'Complete tire set for Nissan X-Trail all-season', 13, 385000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(123, 'NS014', 'Nissan Navara Bull Bar', 'Heavy duty steel bull bar for Nissan Navara front protection', 16, 485000.00, 6, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(124, 'NS015', 'Nissan X-Trail Audio System', 'Premium audio system with touchscreen for Nissan X-Trail', 14, 325000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(125, 'NS016', 'Nissan Navara Clutch Kit', 'Heavy duty clutch kit for Nissan Navara manual transmission', 6, 285000.00, 14, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(126, 'NS017', 'Nissan X-Trail Roof Rack', 'Aluminum roof rack system for Nissan X-Trail', 16, 185000.00, 16, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(127, 'NS018', 'Nissan Navara Engine Mount Set', 'Complete engine mount set for Nissan Navara', 1, 125000.00, 20, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(128, 'NS019', 'Nissan X-Trail Brake Fluid DOT4', 'High-performance brake fluid DOT4 for Nissan X-Trail', 19, 25000.00, 40, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(129, 'NS020', 'Nissan Navara Lift Kit 2\"', '2-inch suspension lift kit for Nissan Navara', 11, 565000.00, 5, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(130, 'NS021', 'Nissan X-Trail Window Tinting', 'Professional window tinting kit for Nissan X-Trail', 16, 85000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(131, 'NS022', 'Nissan Navara Fuel Injector Set', 'Complete fuel injector set for Nissan Navara diesel', 1, 385000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(132, 'NS023', 'Nissan X-Trail Side Steps', 'Aluminum side steps for Nissan X-Trail', 16, 165000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(133, 'NS024', 'Nissan Navara GPS Navigation', 'Advanced GPS navigation system for Nissan Navara', 14, 225000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(134, 'NS025', 'Nissan X-Trail Power Steering Fluid', 'Power steering fluid for Nissan X-Trail hydraulic system', 19, 35000.00, 35, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(135, 'NS026', 'Nissan Navara Mud Tires 265/70R16', 'Aggressive mud tires for Nissan Navara off-road', 13, 485000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(136, 'NS027', 'Nissan X-Trail Cabin Air Filter', 'HEPA cabin air filter for Nissan X-Trail air conditioning', 5, 45000.00, 30, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(137, 'NS028', 'Nissan Navara Exhaust Manifold', 'Stainless steel exhaust manifold for Nissan Navara', 8, 285000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(138, 'NS029', 'Nissan X-Trail Parking Sensors', 'Front and rear parking sensor kit for Nissan X-Trail', 15, 125000.00, 22, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(139, 'NS030', 'Nissan Navara Valve Cover Gasket', 'Valve cover gasket set for Nissan Navara engine', 20, 65000.00, 28, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(140, 'HD011', 'Honda Civic Type R Spoiler', 'Aerodynamic rear spoiler for Honda Civic Type R style', 16, 185000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(141, 'HD012', 'Honda CR-V All-Terrain Tires', 'All-terrain tire set 225/65R17 for Honda CR-V', 13, 425000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(142, 'HD013', 'Honda Civic Cold Air Intake', 'High-flow cold air intake system for Honda Civic', 11, 165000.00, 15, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(143, 'HD014', 'Honda CR-V Roof Box', 'Aerodynamic roof box 450L for Honda CR-V', 16, 285000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(144, 'HD015', 'Honda Civic Racing Seats', 'Bucket racing seats for Honda Civic performance', 17, 485000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(145, 'HD016', 'Honda CR-V Transmission Cooler', 'External transmission cooler for Honda CR-V CVT', 7, 125000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(146, 'HD017', 'Honda Civic Coilover Kit', 'Adjustable coilover suspension kit for Honda Civic', 11, 685000.00, 4, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(147, 'HD018', 'Honda CR-V Backup Camera', 'Wireless backup camera system for Honda CR-V', 14, 145000.00, 20, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(148, 'HD019', 'Honda Civic Engine Oil Filter', 'High-performance oil filter for Honda Civic VTEC', 5, 25000.00, 45, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(149, 'HD020', 'Honda CR-V Tow Hitch', 'Class III tow hitch for Honda CR-V 3500lbs capacity', 16, 185000.00, 14, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(150, 'HD021', 'Honda Civic Short Shifter', 'Short throw shifter kit for Honda Civic manual', 11, 125000.00, 16, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(151, 'HD022', 'Honda CR-V Floor Liners', 'All-weather floor liners for Honda CR-V', 17, 85000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(152, 'HD023', 'Honda Civic Turbo Kit', 'Complete turbo kit for Honda Civic naturally aspirated', 11, 985000.00, 2, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(153, 'HD024', 'Honda CR-V Security System', 'Advanced security system with smartphone app for Honda CR-V', 15, 185000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(154, 'HD025', 'Honda Civic Brake Upgrade Kit', 'Big brake upgrade kit for Honda Civic performance', 2, 485000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(155, 'HD026', 'Honda CR-V Wheel Spacers', 'Wheel spacers 25mm for Honda CR-V wider stance', 13, 65000.00, 30, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(156, 'HD027', 'Honda Civic Carbon Fiber Hood', 'Lightweight carbon fiber hood for Honda Civic', 16, 385000.00, 8, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-02 06:22:27'),
(157, 'HD028', 'Honda CR-V Diagnostic Tool', 'OBD2 diagnostic scanner for Honda CR-V', 18, 125000.00, 18, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(158, 'HD029', 'Honda Civic Lowering Springs', 'Progressive lowering springs for Honda Civic', 3, 185000.00, 14, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(159, 'HD030', 'Honda CR-V Timing Belt Kit', 'Complete timing belt kit for Honda CR-V 2.4L', 1, 225000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-02 06:22:27'),
(160, 'UNI-RC-023', 'Universal Radiator Cap', 'Universal radiator cap for most vehicles', 7, 23000.00, 59, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(161, 'TOY-TC-024', 'Toyota Hilux Turbocharger', 'Turbocharger for Toyota Hilux diesel engines', 1, 1128000.00, 7, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(162, 'HON-WP-025', 'Honda CR-V Water Pump', 'Water pump for Honda CR-V', 7, 215000.00, 22, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(163, 'NIS-EM-026', 'Nissan X-Trail Exhaust Manifold', 'Exhaust manifold for Nissan X-Trail', 8, 415000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(164, 'MAZ-CC-027', 'Mazda CX-5 Catalytic Converter', 'Catalytic converter for Mazda CX-5', 8, 715000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(165, 'TOY-CK-028', 'Toyota Corolla Clutch Kit', 'Complete clutch kit for Toyota Corolla manual transmission', 6, 315000.00, 14, 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(166, 'HON-CVT-029', 'Honda Civic CVT Fluid', 'CVT transmission fluid for Honda Civic', 6, 90000.00, 40, 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(167, 'NIS-TF-030', 'Nissan Altima Transmission Filter', 'Automatic transmission filter for Nissan Altima', 6, 72000.00, 25, 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(168, 'MAZ-FW-031', 'Mazda3 Flywheel', 'Flywheel for Mazda3 manual transmission', 6, 490000.00, 10, 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(169, 'TOY-FB-032', 'Toyota Camry Front Bumper', 'Front bumper for Toyota Camry 2018-2024', 9, 715000.00, 8, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(170, 'HON-SM-033', 'Honda Accord Side Mirror', 'Side mirror assembly for Honda Accord', 9, 240000.00, 18, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(171, 'NIS-TL-034', 'Nissan Sentra Tail Light', 'LED tail light for Nissan Sentra', 9, 315000.00, 14, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(172, 'MAZ-HD-035', 'Mazda CX-5 Hood', 'Hood panel for Mazda CX-5', 9, 965000.00, 5, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(173, 'UNI-SC-036', 'Universal Car Seat Covers', 'Premium leather seat covers - universal fit', 10, 215000.00, 30, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(174, 'TOY-DB-037', 'Toyota Prius Dashboard', 'Dashboard assembly for Toyota Prius', 10, 615000.00, 6, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(175, 'HON-FM-038', 'Honda Civic Floor Mats', 'All-weather floor mats for Honda Civic', 10, 115000.00, 25, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(176, 'NIS-SW-039', 'Nissan X-Trail Steering Wheel', 'Leather steering wheel for Nissan X-Trail', 10, 415000.00, 12, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(177, 'UNI-LED-040', 'Universal LED Headlight Bulbs', 'LED headlight bulb kit - H4/H7 compatible', 4, 165000.00, 35, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(178, 'TOY-WH-041', 'Toyota Land Cruiser Wiring Harness', 'Engine wiring harness for Toyota Land Cruiser', 4, 465000.00, 8, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(179, 'HON-IC-042', 'Honda Accord Ignition Coil', 'Ignition coil pack for Honda Accord', 4, 190000.00, 20, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(180, 'NIS-ECU-043', 'Nissan Altima ECU Module', 'Engine control unit for Nissan Altima', 4, 965000.00, 4, 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(181, 'UNI-SA-044', 'Universal Shock Absorber', 'Universal shock absorber - adjustable', 3, 240000.00, 28, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(182, 'TOY-LS-045', 'Toyota Hilux Leaf Springs', 'Rear leaf springs for Toyota Hilux', 3, 565000.00, 10, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(183, 'HON-BJ-046', 'Honda CR-V Ball Joint', 'Lower ball joint for Honda CR-V', 3, 115000.00, 32, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(184, 'NIS-CA-047', 'Nissan X-Trail Control Arm', 'Front control arm for Nissan X-Trail', 3, 315000.00, 16, 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(185, 'UNI-BP-048', 'Universal Brake Pads', 'Universal brake pads - ceramic compound', 2, 140000.00, 45, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 1, '2025-06-14 17:04:47'),
(186, 'TOY-BB-049', 'Toyota Camry Brake Booster', 'Brake booster for Toyota Camry', 2, 415000.00, 12, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47'),
(187, 'HON-ABS-050', 'Honda Civic ABS Sensor', 'ABS wheel speed sensor for Honda Civic', 2, 90000.00, 28, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500&h=400&fit=crop', 0, '2025-06-14 17:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_compatibility`
--

CREATE TABLE `product_compatibility` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `car_model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`, `phone`, `address`, `role`, `created_at`) VALUES
(2, 'john_doe', 'john@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John Doe', NULL, NULL, 'customer', '2025-06-01 19:43:43'),
(3, 'valence', 'valence@gmail.com', '$2y$10$hq3a2C9dyRn7AhRl9WMia.hH.5zejtcL62FhteHDn/WH3/pi4M.3S', 'Valence Mwigani', '0753775184', 'Mbagala', 'customer', '2025-06-01 20:41:52'),
(4, 'admin1', 'admin@gmail.com', '$2y$10$salToLdB7NGn6pPJtEXpE.T237oUYNcThJyNgMxjP9dSocB8NyRLC', 'System Administrator', NULL, NULL, 'admin', '2025-06-01 20:51:42'),
(5, 'admin@gmail.com', 'innocentaloycekimaro@gmail.com', '$2y$10$7vStK/peLBG.T/XAuPyVoOKVbxsxhv8nWG0AOkz6O2iWJeYPUfUPm', 'Kai', '0753775184', 'cgn', 'customer', '2025-06-03 17:08:56'),
(6, 'deo', 'deo@gmail.com', '$2y$10$VlLNysyPEp8I5rJduVIXsOBQ051CU.PAEi/l.EXc1DSLHkBAeLkbW', 'DEO', '07865543342', 'Mbagala', 'customer', '2025-06-30 11:00:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_makes`
--
ALTER TABLE `car_makes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `make_id` (`make_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payments_order_id` (`order_id`),
  ADD KEY `idx_payments_transaction_id` (`transaction_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `part_number` (`part_number`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `car_model_id` (`car_model_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_makes`
--
ALTER TABLE `car_makes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `product_compatibility`
--
ALTER TABLE `product_compatibility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`make_id`) REFERENCES `car_makes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD CONSTRAINT `product_compatibility_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_compatibility_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
