-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 26, 2018 at 06:53 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tex`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'acer', '2018-08-30 13:31:15', '2018-08-30 13:31:15'),
(2, 'Xiaomi Mi', '2018-08-30 13:31:37', '2018-08-30 13:31:37'),
(3, 'lenova', '2018-08-30 13:31:44', '2018-08-30 13:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(2, NULL, 1, 'Category 2', 'category-2', '2018-08-14 04:20:42', '2018-08-14 04:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '', 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '', 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '', 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '', 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '', 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '', 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, '', 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '', 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '', 12),
(57, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(59, 7, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(67, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(68, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(69, 9, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(70, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(71, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(72, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(73, 10, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(74, 10, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(75, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(76, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(77, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(78, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(79, 11, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(80, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(81, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(82, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(83, 12, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(84, 12, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(85, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(86, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(87, 13, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(88, 13, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(89, 13, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(90, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(91, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(92, 14, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(93, 14, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(94, 14, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(95, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(96, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(97, 15, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(98, 15, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(99, 15, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(100, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(101, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(102, 16, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(103, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(104, 16, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(105, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(106, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(107, 17, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(108, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(109, 17, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, NULL, 3),
(110, 17, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 4),
(111, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(112, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(114, 17, 'processor_belongstomany_ram_relationship', 'relationship', 'rams', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Ram\",\"table\":\"rams\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"processor_ram\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8),
(115, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(116, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(117, 18, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(118, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(119, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(121, 17, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 8),
(122, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(123, 20, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(124, 20, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 3),
(125, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(126, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(127, 17, 'processor_belongsto_motherboard_relationship', 'relationship', 'motherboard', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Motherboard\",\"table\":\"motherboards\",\"type\":\"belongsTo\",\"column\":\"motherboard_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(128, 17, 'motherboard_id', 'hidden', 'Motherboard Id', 0, 1, 1, 1, 1, 1, NULL, 9),
(129, 17, 'full_description', 'rich_text_box', 'Full Description', 0, 0, 1, 1, 1, 1, NULL, 10),
(130, 17, 'Processor_parameters', 'text', 'Processor Parameters', 0, 0, 1, 1, 1, 1, NULL, 11),
(131, 17, 'Socket', 'text', 'Socket', 0, 0, 1, 1, 1, 1, NULL, 12),
(132, 17, 'Number_of_Cores', 'text', 'Number Of Cores', 0, 0, 1, 1, 1, 1, NULL, 13),
(133, 17, 'Number_of_threads', 'text', 'Number Of Threads', 0, 0, 1, 1, 1, 1, NULL, 14),
(134, 17, 'Cache_processor', 'text', 'Cache Processor', 0, 0, 1, 1, 1, 1, NULL, 15),
(135, 17, 'Chipset', 'text', 'Chipset', 0, 0, 1, 1, 1, 1, NULL, 16),
(136, 17, 'Ethernet', 'text', 'Ethernet', 0, 0, 1, 1, 1, 1, NULL, 17),
(137, 17, 'USB_2_interface', 'text', 'USB 2.0 Interface', 0, 0, 1, 1, 1, 1, NULL, 18),
(138, 17, 'USB_3_interface', 'text', 'USB 3.0 Interface', 0, 0, 1, 1, 1, 1, NULL, 19),
(139, 17, 'Expansion_Slots', 'text', 'Expansion Slots', 0, 0, 1, 1, 1, 1, NULL, 20),
(140, 17, 'Number_of_memory_slots', 'text', 'Number Of Memory Slots', 0, 0, 1, 1, 1, 1, NULL, 21),
(141, 17, 'Maximum_amount_of_memory', 'text', 'Maximum Amount Of Memory', 0, 0, 1, 1, 1, 1, NULL, 22),
(142, 17, 'Number_of_SATA_connectors', 'text', 'Number Of SATA Connectors', 0, 0, 1, 1, 1, 1, NULL, 23),
(143, 17, 'Output_device_connectors', 'text', 'Output Device Connectors', 0, 0, 1, 1, 1, 1, NULL, 24),
(144, 17, 'System_unit', 'text', 'System Unit', 0, 0, 1, 1, 1, 1, NULL, 25),
(145, 22, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(146, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(147, 22, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, NULL, 3),
(148, 22, 'full_description', 'rich_text_box', 'Full Description', 0, 0, 1, 1, 1, 1, NULL, 4),
(149, 22, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 5),
(150, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(151, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(152, 22, 'old_price', 'text', 'Old Price', 0, 1, 1, 1, 1, 1, NULL, 8),
(153, 22, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 8),
(154, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(155, 23, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(156, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(157, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(158, 22, 'notebook_belongsto_brand_relationship', 'relationship', 'brands', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(159, 22, 'brand_id', 'hidden', 'Brand Id', 0, 1, 1, 1, 1, 1, NULL, 10),
(160, 24, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(161, 24, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(162, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(163, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(164, 22, 'notebook_belongsto_notebook_processsor_relationship', 'relationship', 'notebook_processsors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\NotebookProcesssor\",\"table\":\"notebook_processsors\",\"type\":\"belongsTo\",\"column\":\"processor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(165, 22, 'processor_id', 'text', 'Processor Id', 0, 1, 1, 1, 1, 1, NULL, 11),
(166, 22, 'Processor_parameters', 'text', 'Processor Parameters', 0, 0, 1, 1, 1, 1, NULL, 12),
(167, 22, 'Number_of_Cores', 'text', 'Number Of Cores', 0, 0, 1, 1, 1, 1, NULL, 13),
(168, 22, 'Number_of_threads', 'text', 'Number Of Threads', 0, 0, 1, 1, 1, 1, NULL, 14),
(169, 22, 'Cache_processor', 'text', 'Cache Processor', 0, 0, 1, 1, 1, 1, NULL, 15),
(170, 22, 'Video_card', 'text', 'Video Card', 0, 0, 1, 1, 1, 1, NULL, 16),
(171, 22, 'Video_card_options', 'text', 'Video Card Options', 0, 0, 1, 1, 1, 1, NULL, 17),
(172, 22, 'RAM', 'text', 'RAM', 0, 0, 1, 1, 1, 1, NULL, 18),
(173, 22, 'Type_of_RAM', 'text', 'Type Of RAM', 0, 0, 1, 1, 1, 1, NULL, 19),
(174, 22, 'HDD', 'text', 'HDD', 0, 0, 1, 1, 1, 1, NULL, 20),
(175, 22, 'Ethernet', 'text', 'Ethernet', 0, 0, 1, 1, 1, 1, NULL, 21),
(176, 22, 'USB_2_interface', 'text', 'USB 2 Interface', 0, 0, 1, 1, 1, 1, NULL, 22),
(177, 22, 'USB_3_interface', 'text', 'USB 3 Interface', 0, 0, 1, 1, 1, 1, NULL, 23),
(178, 22, 'Output_device_connectors', 'text', 'Output Device Connectors', 0, 0, 1, 1, 1, 1, NULL, 24),
(179, 22, 'DVD_RW', 'text', 'DVD RW', 0, 0, 1, 1, 1, 1, NULL, 25),
(180, 22, 'Web_Cams', 'text', 'Web Cams', 0, 0, 1, 1, 1, 1, NULL, 26),
(181, 22, 'CardReader', 'text', 'CardReader', 0, 0, 1, 1, 1, 1, NULL, 27),
(182, 22, 'Bluetooth', 'text', 'Bluetooth', 0, 0, 1, 1, 1, 1, NULL, 28),
(183, 22, 'Wi_Fi', 'text', 'Wi Fi', 0, 0, 1, 1, 1, 1, NULL, 29),
(184, 22, 'Built_in_microphone', 'text', 'Built In Microphone', 0, 0, 1, 1, 1, 1, NULL, 30),
(185, 22, 'Speakers', 'text', 'Speakers', 0, 0, 1, 1, 1, 1, NULL, 31),
(186, 22, 'operating_system', 'text', 'Operating System', 0, 0, 1, 1, 1, 1, NULL, 32),
(187, 22, 'size', 'text', 'Size', 0, 0, 1, 1, 1, 1, NULL, 33),
(188, 22, 'Screen_Type', 'text', 'Screen Type', 0, 0, 1, 1, 1, 1, NULL, 34),
(189, 22, 'Screen_resolution', 'text', 'Screen Resolution', 0, 0, 1, 1, 1, 1, NULL, 35),
(190, 22, 'Battery_Type', 'text', 'Battery Type', 0, 0, 1, 1, 1, 1, NULL, 36),
(191, 22, 'Colour', 'text', 'Colour', 0, 0, 1, 1, 1, 1, NULL, 37),
(192, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(193, 25, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(194, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(195, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(196, 26, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(197, 26, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(198, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(199, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(200, 26, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, NULL, 5),
(201, 26, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, NULL, 6),
(202, 26, 'old_price', 'text', 'Old Price', 0, 1, 1, 1, 1, 1, NULL, 7),
(203, 26, 'full_description', 'rich_text_box', 'Full Description', 0, 0, 1, 1, 1, 1, NULL, 8),
(204, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(205, 28, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(206, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(207, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(208, 26, 'smartphone_belongsto_phoneproccessor_relationship', 'relationship', 'phoneproccessors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Phoneproccessor\",\"table\":\"phoneproccessors\",\"type\":\"belongsTo\",\"column\":\"phoneproccessor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(209, 26, 'phoneproccessor_id', 'text', 'Phoneproccessor Id', 0, 1, 1, 1, 1, 1, NULL, 9),
(210, 26, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 10),
(211, 29, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(212, 29, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, NULL, 2),
(213, 29, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(214, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(215, 26, 'smartphone_belongsto_phonebrand_relationship', 'relationship', 'phonebrands', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Phonebrand\",\"table\":\"phonebrands\",\"type\":\"belongsTo\",\"column\":\"phonebrand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(216, 26, 'phonebrand_id', 'text', 'Phonebrand Id', 0, 1, 1, 1, 1, 1, NULL, 11),
(217, 26, 'Model', 'text', 'Model', 0, 0, 1, 1, 1, 1, NULL, 12),
(218, 26, 'Video_Accelerator', 'text', 'Video Accelerator', 0, 0, 1, 1, 1, 1, NULL, 13),
(219, 26, 'RAM', 'text', 'RAM', 0, 0, 1, 1, 1, 1, NULL, 14),
(220, 26, 'Inner_memory', 'text', 'Inner Memory', 0, 0, 1, 1, 1, 1, NULL, 15),
(221, 26, 'SD_Memory', 'text', 'SD Memory', 0, 0, 1, 1, 1, 1, NULL, 16),
(222, 26, 'Display', 'text', 'Display', 0, 0, 1, 1, 1, 1, NULL, 17),
(223, 26, 'Main_camera', 'text', 'Main Camera', 0, 0, 1, 1, 1, 1, NULL, 18),
(224, 26, 'Front_camera', 'text', 'Front Camera', 0, 0, 1, 1, 1, 1, NULL, 19),
(225, 26, 'Battery', 'text', 'Battery', 0, 0, 1, 1, 1, 1, NULL, 20),
(226, 26, 'Network_Support', 'text', 'Network Support', 0, 0, 1, 1, 1, 1, NULL, 21),
(227, 26, 'SIM_card_type', 'text', 'SIM Card Type', 0, 0, 1, 1, 1, 1, NULL, 22),
(228, 26, 'OS_Android_version', 'text', 'OS Android Version', 0, 0, 1, 1, 1, 1, NULL, 23),
(229, 26, 'Dimensions_and_weight', 'text', 'Dimensions And Weight', 0, 0, 1, 1, 1, 1, NULL, 24),
(230, 26, 'Bluetooth', 'text', 'Bluetooth', 0, 0, 1, 1, 1, 1, NULL, 25),
(231, 26, 'Wi_Fi', 'text', 'Wi Fi', 0, 0, 1, 1, 1, 1, NULL, 26),
(232, 26, 'Fingerprint_reader', 'text', 'Fingerprint Reader', 0, 0, 1, 1, 1, 1, NULL, 27),
(233, 26, 'USB_standard', 'text', 'USB Standard', 0, 0, 1, 1, 1, 1, NULL, 28),
(234, 26, 'Support_USB_OTG', 'text', 'Support USB OTG', 0, 0, 1, 1, 1, 1, NULL, 29),
(235, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(236, 30, 'computer_id', 'hidden', 'Computer Id', 0, 0, 1, 1, 1, 1, NULL, 3),
(237, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(238, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(239, 30, 'new_computer_belongsto_processor_relationship', 'relationship', 'processors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Processor\",\"table\":\"processors\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(240, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(241, 31, 'notebook_id', 'hidden', 'Notebook Id', 0, 0, 1, 1, 1, 1, NULL, 2),
(242, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(243, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(244, 31, 'new_notebook_belongsto_notebook_relationship', 'relationship', 'notebooks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Notebook\",\"table\":\"notebooks\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(245, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(246, 32, 'smartphone_id', 'hidden', 'Smartphone Id', 0, 0, 1, 1, 1, 1, NULL, 3),
(247, 32, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(248, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(249, 32, 'new_smartphone_belongsto_smartphone_relationship', 'relationship', 'smartphones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Smartphone\",\"table\":\"smartphones\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(250, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(251, 33, 'processor_id', 'hidden', 'Processor Id', 0, 0, 1, 1, 1, 1, NULL, 2),
(252, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(253, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(254, 33, 'top_computer_belongsto_processor_relationship', 'relationship', 'processors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Processor\",\"table\":\"processors\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(255, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(256, 34, 'notebook_id', 'hidden', 'Notebook Id', 0, 0, 1, 1, 1, 1, NULL, 2),
(257, 34, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(258, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(259, 34, 'top_notebook_belongsto_notebook_relationship', 'relationship', 'notebooks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Notebook\",\"table\":\"notebooks\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(260, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(261, 35, 'smartphone_id', 'hidden', 'Smartphone Id', 0, 0, 1, 1, 1, 1, NULL, 2),
(262, 35, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(263, 35, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(264, 35, 'top_smartphone_belongsto_smartphone_relationship', 'relationship', 'smartphones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Smartphone\",\"table\":\"smartphones\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(289, 39, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(290, 39, 'fname', 'text', 'Fname', 0, 1, 1, 1, 1, 1, NULL, 2),
(291, 39, 'lname', 'text', 'Lname', 0, 1, 1, 1, 1, 1, NULL, 3),
(292, 39, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, NULL, 4),
(293, 39, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, NULL, 5),
(294, 39, 'message', 'text', 'Message', 0, 1, 1, 1, 1, 1, NULL, 6),
(295, 39, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 7),
(296, 39, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-08-14 04:20:40', '2018-08-14 04:20:40'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-08-14 04:20:40', '2018-08-14 04:20:40'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-08-14 04:20:40', '2018-08-14 04:20:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(7, 'dvd_rws', 'dvd-rws', 'DVD-RW', 'DVD-RWs', 'fas fa-compact-disc', 'App\\DVD_RW', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 07:04:37', '2018-08-19 07:16:10'),
(9, 'hdds', 'hdds', 'Жёсткий диск', 'Жёсткий диск', 'fa fa-hdd', 'App\\Hdd', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 07:50:51', '2018-08-19 07:51:47'),
(10, 'keyboard_mouses', 'keyboard-mouses', 'Keyboard Mouse', 'Keyboard Mice', 'fas fa-keyboard', 'App\\KeyboardMouse', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 08:02:06', '2018-08-19 08:06:44'),
(11, 'video_cards', 'video-cards', 'Video Card', 'Video Cards', 'fas fa-video', 'App\\VideoCard', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(12, 'enclosure_and_power_supplis', 'enclosure-and-power-supplis', 'Enclosure And Power Supply', 'Enclosure And Power Supplis', 'fas fa-plug', 'App\\EnclosureAndPowerSuppli', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(13, 'monitors', 'monitors', 'Monitor', 'Monitors', 'fa fa-desktop', 'App\\Monitor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 11:07:12', '2018-08-19 11:07:50'),
(14, 'network_filters', 'network-filters', 'Network Filter', 'Network Filters', 'fas fa-filter', 'App\\NetworkFilter', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(15, 'headphones', 'headphones', 'Headphone', 'Headphones', 'fas fa-headphones', 'App\\Headphone', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(16, 'speakers', 'speakers', 'Speaker', 'Speakers', 'fas fa-volume-up', 'App\\Speaker', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(17, 'processors', 'processors', 'Processor', 'Processors', 'fas fa-microchip', 'App\\Processor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(18, 'rams', 'rams', 'Ram', 'Rams', 'fa fa-memory', 'App\\Ram', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-20 04:00:14', '2018-08-20 04:03:24'),
(20, 'motherboard', 'motherboard', 'Motherboard', 'Motherboards', NULL, 'App\\Motherboard', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(22, 'notebooks', 'notebooks', 'Notebook', 'Notebooks', NULL, 'App\\Notebook', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(23, 'brands', 'brands', 'Brand', 'Brands', NULL, 'App\\Brand', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(24, 'notebook_processsors', 'notebook-processsors', 'Notebook Processsor', 'Notebook Processsors', NULL, 'App\\NotebookProcesssor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(25, 'phoneproccesssors', 'phoneproccesssors', 'Phoneproccesssor', 'Phoneproccesssors', NULL, 'App\\Phoneproccesssor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(26, 'smartphones', 'smartphones', 'Smartphone', 'Smartphones', NULL, 'App\\Smartphone', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(28, 'phoneproccessors', 'phoneproccessors', 'Phoneproccessor', 'Phoneproccessors', NULL, 'App\\Phoneproccessor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(29, 'phonebrands', 'phonebrands', 'Phonebrand', 'Phonebrands', NULL, 'App\\Phonebrand', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(30, 'new_computers', 'new-computers', 'New Computer', 'New Computers', NULL, 'App\\NewComputer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(31, 'new_notebooks', 'new-notebooks', 'New Notebook', 'New Notebooks', NULL, 'App\\NewNotebook', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(32, 'new_smartphones', 'new-smartphones', 'New Smartphone', 'New Smartphones', NULL, 'App\\NewSmartphone', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(33, 'top_computers', 'top-computers', 'Top Computer', 'Top Computers', NULL, 'App\\TopComputer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(34, 'top_notebooks', 'top-notebooks', 'Top Notebook', 'Top Notebooks', NULL, 'App\\TopNotebook', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(35, 'top_smartphones', 'top-smartphones', 'Top Smartphone', 'Top Smartphones', NULL, 'App\\TopSmartphone', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(39, 'notification', 'notification', 'Notification', 'Notifications', 'voyager-mail', 'App\\Notification', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-09-24 05:57:48', '2018-09-24 06:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `dvd_rws`
--

DROP TABLE IF EXISTS `dvd_rws`;
CREATE TABLE IF NOT EXISTS `dvd_rws` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvd_rws`
--

INSERT INTO `dvd_rws` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'dwd-rw1', 120000, '2018-08-19 07:20:09', '2018-08-19 07:20:09');

-- --------------------------------------------------------

--
-- Table structure for table `enclosure_and_power_supplis`
--

DROP TABLE IF EXISTS `enclosure_and_power_supplis`;
CREATE TABLE IF NOT EXISTS `enclosure_and_power_supplis` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enclosure_and_power_supplis`
--

INSERT INTO `enclosure_and_power_supplis` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'corpus1', 98000, '2018-08-22 03:54:50', '2018-08-22 03:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `hdds`
--

DROP TABLE IF EXISTS `hdds`;
CREATE TABLE IF NOT EXISTS `hdds` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hdds`
--

INSERT INTO `hdds` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, '500 mb', 400000, '2018-08-21 12:13:44', '2018-08-21 12:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `headphones`
--

DROP TABLE IF EXISTS `headphones`;
CREATE TABLE IF NOT EXISTS `headphones` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headphones`
--

INSERT INTO `headphones` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'naushnik', 33000, '2018-08-22 03:55:55', '2018-08-22 03:55:55'),
(2, 'naushnik1', 10033000, '2018-08-22 04:04:00', '2018-08-22 04:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `keyboard_mouses`
--

DROP TABLE IF EXISTS `keyboard_mouses`;
CREATE TABLE IF NOT EXISTS `keyboard_mouses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keyboard_mouses`
--

INSERT INTO `keyboard_mouses` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'nabor', 31000, '2018-08-22 03:54:00', '2018-08-22 03:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-08-14 04:20:40', '2018-08-14 04:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#c28c3a', NULL, 1, '2018-08-14 04:20:40', '2018-09-24 06:11:22', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 1, 3, '2018-08-14 04:20:40', '2018-09-19 04:41:29', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', '#000000', 1, 2, '2018-08-14 04:20:40', '2018-09-19 05:44:37', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', 1, 1, '2018-08-14 04:20:40', '2018-09-19 05:43:55', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', '#000000', NULL, 2, '2018-08-14 04:20:40', '2018-09-19 05:45:50', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', '#000000', 5, 1, '2018-08-14 04:20:40', '2018-09-19 05:46:45', 'voyager.menus.index', 'null'),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-08-14 04:20:40', '2018-08-19 07:22:33', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-08-14 04:20:41', '2018-08-19 07:22:33', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-08-14 04:20:41', '2018-08-19 07:22:33', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', '#000000', NULL, 3, '2018-08-14 04:20:41', '2018-09-19 05:45:19', 'voyager.settings.index', 'null'),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 1, 6, '2018-08-14 04:20:42', '2018-09-19 04:41:34', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 1, 4, '2018-08-14 04:20:42', '2018-09-19 04:41:30', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 1, 5, '2018-08-14 04:20:42', '2018-09-19 04:41:33', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-08-14 04:20:42', '2018-08-19 07:22:33', 'voyager.hooks', NULL),
(15, 1, 'Computer', '', '_self', 'voyager-tv', '#000000', NULL, 4, '2018-08-19 06:33:59', '2018-09-19 05:43:10', NULL, ''),
(17, 1, 'DVD-RWs', '', '_self', 'fas fa-compact-disc', NULL, 15, 2, '2018-08-19 07:04:37', '2018-08-19 12:19:18', 'voyager.dvd-rws.index', NULL),
(19, 1, 'Жёсткий диск', '', '_self', 'far fa-hdd', NULL, 15, 4, '2018-08-19 07:50:51', '2018-08-20 04:03:39', 'voyager.hdds.index', NULL),
(20, 1, 'Keyboard Mice', '', '_self', 'fas fa-keyboard', '#000000', 15, 5, '2018-08-19 08:02:06', '2018-08-20 04:03:39', 'voyager.keyboard-mouses.index', 'null'),
(21, 1, 'Video Cards', '', '_self', 'fas fa-video', NULL, 15, 6, '2018-08-19 08:18:11', '2018-08-20 04:03:39', 'voyager.video-cards.index', NULL),
(22, 1, 'Enclosure And Power Supplis', '', '_self', 'fas fa-plug', NULL, 15, 7, '2018-08-19 08:22:53', '2018-08-20 04:03:39', 'voyager.enclosure-and-power-supplis.index', NULL),
(23, 1, 'Monitors', '', '_self', 'fa fa-desktop', '#000000', 15, 8, '2018-08-19 11:07:13', '2018-08-20 04:03:39', 'voyager.monitors.index', 'null'),
(24, 1, 'Network Filters', '', '_self', 'fas fa-filter', NULL, 15, 9, '2018-08-19 11:18:31', '2018-08-20 04:03:39', 'voyager.network-filters.index', NULL),
(25, 1, 'Headphones', '', '_self', 'fas fa-headphones', NULL, 15, 10, '2018-08-19 11:23:47', '2018-08-20 04:03:39', 'voyager.headphones.index', NULL),
(26, 1, 'Speakers', '', '_self', 'fas fa-volume-up', NULL, 15, 11, '2018-08-19 11:27:43', '2018-08-20 04:03:39', 'voyager.speakers.index', NULL),
(27, 1, 'Processors', '', '_self', 'fas fa-microchip', '#000000', 15, 1, '2018-08-19 12:18:34', '2018-08-25 02:34:45', 'voyager.processors.index', 'null'),
(28, 1, 'Rams', '', '_self', 'fa fa-memory', '#000000', 15, 3, '2018-08-20 04:00:14', '2018-08-20 04:03:39', 'voyager.rams.index', 'null'),
(29, 1, 'Motherboards', '', '_self', 'fa-motherboard', '#000000', 15, 12, '2018-08-27 09:20:59', '2018-08-27 09:23:48', 'voyager.motherboard.index', 'null'),
(30, 1, 'Notebooks', '', '_self', NULL, NULL, 32, 1, '2018-08-30 12:03:50', '2018-08-30 13:30:47', 'voyager.notebooks.index', NULL),
(31, 1, 'Brands', '', '_self', NULL, NULL, 32, 2, '2018-08-30 13:29:17', '2018-08-30 13:30:51', 'voyager.brands.index', NULL),
(32, 1, 'Notebooks', '', '_self', 'voyager-laptop', '#000000', NULL, 5, '2018-08-30 13:30:41', '2018-09-19 04:41:35', NULL, ''),
(33, 1, 'Notebook Processsors', '', '_self', NULL, NULL, 32, 3, '2018-08-31 03:44:19', '2018-09-02 02:30:11', 'voyager.notebook-processsors.index', NULL),
(34, 1, 'smartphone', '', '_self', 'voyager-phone', '#ffffff', NULL, 6, '2018-09-02 04:56:23', '2018-09-24 06:10:27', NULL, ''),
(36, 1, 'Smartphones', '', '_self', NULL, NULL, 34, 1, '2018-09-02 09:00:58', '2018-09-02 09:01:42', 'voyager.smartphones.index', NULL),
(37, 1, 'proccessors', '', '_self', NULL, '#000000', 34, 2, '2018-09-02 09:19:39', '2018-09-03 06:05:26', 'voyager.phoneproccessors.index', 'null'),
(38, 1, 'brands', '', '_self', NULL, '#000000', 34, 3, '2018-09-02 10:46:26', '2018-09-03 06:05:52', 'voyager.phonebrands.index', 'null'),
(39, 1, 'New Computers', '', '_self', NULL, NULL, 42, 1, '2018-09-08 01:18:42', '2018-09-08 01:50:24', 'voyager.new-computers.index', NULL),
(40, 1, 'New Notebooks', '', '_self', NULL, NULL, 42, 2, '2018-09-08 01:37:01', '2018-09-08 01:50:25', 'voyager.new-notebooks.index', NULL),
(41, 1, 'New Smartphones', '', '_self', NULL, NULL, 42, 3, '2018-09-08 01:47:03', '2018-09-08 01:50:26', 'voyager.new-smartphones.index', NULL),
(42, 1, 'New products', '', '_self', 'voyager-new', '#00ff00', NULL, 7, '2018-09-08 01:50:17', '2018-09-24 06:08:41', NULL, ''),
(43, 1, 'Top Computers', '', '_self', NULL, NULL, 46, 1, '2018-09-08 23:43:10', '2018-09-08 23:49:32', 'voyager.top-computers.index', NULL),
(44, 1, 'Top Notebooks', '', '_self', NULL, NULL, 46, 2, '2018-09-08 23:44:25', '2018-09-08 23:49:33', 'voyager.top-notebooks.index', NULL),
(45, 1, 'Top Smartphones', '', '_self', NULL, NULL, 46, 3, '2018-09-08 23:45:34', '2018-09-08 23:49:34', 'voyager.top-smartphones.index', NULL),
(46, 1, 'Top products', '', '_self', 'voyager-bolt', '#8000ff', NULL, 8, '2018-09-08 23:49:22', '2018-09-24 06:09:17', NULL, ''),
(50, 1, 'Notifications', '', '_self', 'voyager-mail', '#ff0000', NULL, 10, '2018-09-24 05:57:48', '2018-09-24 05:58:25', 'voyager.notification.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(27, '2018_08_15_064819_create_post_tag_table', 3),
(28, '2018_08_20_061325_create_processor_ram_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `monitors`
--

DROP TABLE IF EXISTS `monitors`;
CREATE TABLE IF NOT EXISTS `monitors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monitors`
--

INSERT INTO `monitors` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'manitor1', 43000, '2018-08-22 03:55:07', '2018-08-22 03:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `motherboards`
--

DROP TABLE IF EXISTS `motherboards`;
CREATE TABLE IF NOT EXISTS `motherboards` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `motherboards`
--

INSERT INTO `motherboards` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 'Net', 0, '2018-08-27 12:00:04', '2018-08-27 12:00:04'),
(4, 'motherboard1', 21000, '2018-08-28 14:04:42', '2018-08-28 14:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `network_filters`
--

DROP TABLE IF EXISTS `network_filters`;
CREATE TABLE IF NOT EXISTS `network_filters` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `network_filters`
--

INSERT INTO `network_filters` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'filtr1', 39000, '2018-08-22 03:55:37', '2018-08-22 03:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `new_computers`
--

DROP TABLE IF EXISTS `new_computers`;
CREATE TABLE IF NOT EXISTS `new_computers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_computers`
--

INSERT INTO `new_computers` (`id`, `computer_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 01:28:40', '2018-09-08 01:28:40'),
(2, NULL, '2018-09-08 01:29:36', '2018-09-08 01:29:36'),
(3, NULL, '2018-09-08 08:06:57', '2018-09-08 08:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `new_notebooks`
--

DROP TABLE IF EXISTS `new_notebooks`;
CREATE TABLE IF NOT EXISTS `new_notebooks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notebook_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_notebooks`
--

INSERT INTO `new_notebooks` (`id`, `notebook_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 01:39:21', '2018-09-08 01:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `new_smartphones`
--

DROP TABLE IF EXISTS `new_smartphones`;
CREATE TABLE IF NOT EXISTS `new_smartphones` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `smartphone_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_smartphones`
--

INSERT INTO `new_smartphones` (`id`, `smartphone_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 01:49:01', '2018-09-08 01:49:01'),
(2, NULL, '2018-09-08 02:21:34', '2018-09-08 02:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `notebooks`
--

DROP TABLE IF EXISTS `notebooks`;
CREATE TABLE IF NOT EXISTS `notebooks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `processor_id` int(11) DEFAULT NULL,
  `Processor_parameters` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_Cores` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_threads` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cache_processor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Video_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Video_card_options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RAM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type_of_RAM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HDD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ethernet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USB_2_interface` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USB_3_interface` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Output_device_connectors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DVD_RW` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Web_Cams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CardReader` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bluetooth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Wi_Fi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Built_in_microphone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Speakers` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operating_system` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Screen_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Screen_resolution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Battery_Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Colour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notebooks`
--

INSERT INTO `notebooks` (`id`, `name`, `description`, `full_description`, `images`, `created_at`, `updated_at`, `price`, `old_price`, `brand_id`, `processor_id`, `Processor_parameters`, `Number_of_Cores`, `Number_of_threads`, `Cache_processor`, `Video_card`, `Video_card_options`, `RAM`, `Type_of_RAM`, `HDD`, `Ethernet`, `USB_2_interface`, `USB_3_interface`, `Output_device_connectors`, `DVD_RW`, `Web_Cams`, `CardReader`, `Bluetooth`, `Wi_Fi`, `Built_in_microphone`, `Speakers`, `operating_system`, `size`, `Screen_Type`, `Screen_resolution`, `Battery_Type`, `Colour`) VALUES
(1, 'Acer Aspire ES 15 (15,6\", N3350, 2GB, 500GB, DVD-RW)', '<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 14px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Acer Aspire ES 15 (ES1-533-C5V8) 15.6\"HD LED</span>&nbsp;(1366 x 768), CPU Intel Celeron&reg; &nbsp;N3350 2Ghz, DDR3 2Gb, HDD 500Gb, baterry: 3Cell (3220 мАч), HDMI, USB 2.0-2шт, USB 3.0-1шт, Wi-Fi, Bluetooth 4.0, LAN, &nbsp;OS Linux ENG/RUS, DVD-RW, HD Graphics, Color: Midnight Black</p>\r\n<div class=\"phr\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 16px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: top; display: inline-block;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/Labels/AcerLogo400300_r_200x150.jpg\" alt=\"\" width=\"100\" height=\"75\" /></p>\r\n&nbsp;\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 16px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: top; display: inline-block;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/Intel-Celeron-Skylake.jpg\" alt=\"\" width=\"100\" height=\"100\" /></p>\r\n&nbsp;\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 16px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: top; display: inline-block;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/energy-star.png\" alt=\"\" width=\"100\" height=\"100\" /></p>\r\n</div>', '<p>&nbsp;</p>\r\n<h2 class=\"heading-m text-primary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 28px; vertical-align: baseline; color: #000000;\">Элегантный дизайн</h2>\r\n<p class=\"text-secondary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Привлекательный черный дизайн корпуса, текстурированная верхняя крышка, приятная на ощупь, и цветные вставки по краям корпуса делают этот ноутбук не похожим на других и придают ему изысканности.</p>\r\n<p class=\"text-secondary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/1111/5346456.jpg\" alt=\"\" width=\"506\" height=\"404\" /></p>\r\n<h2 class=\"heading-m text-primary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 28px; vertical-align: baseline; color: #000000;\">Более комфортный просмотр</h2>\r\n<p class=\"text-secondary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Программное обеспечение BluelightShield&trade; фильтрует синий цвет, излучаемый экраном, снижая раздражение глаз, которое возникает при длительном пользовании ноутбуком.</p>\r\n<p class=\"text-secondary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/1111/5654645.jpg\" alt=\"\" width=\"564\" height=\"400\" /></p>\r\n<div class=\"textOverBen\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #000000;\">\r\n<div class=\"container max-width-d textOverBenCont\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"row gutter text\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"col a-offset-1 a-10 b-offset-6 b-6 gutter margin-top-m margin-bottom-m\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"textOverBen\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"container max-width-d textOverBenCont\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"row gutter text\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<div class=\"col a-offset-1 a-10 b-offset-6 b-6 gutter margin-top-m margin-bottom-m\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">\r\n<h2 class=\"heading-m text-primary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 28px; vertical-align: baseline;\">Интуитивная навигация</h2>\r\n<p class=\"text-secondary-dark\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Оцените удобство сенсорной навигации с использованием Precision Touchpad. С помощью этого уникального тачпада вы сможете легко менять масштаб изображений и прокручивать страницы.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/1111/556547547.jpg\" alt=\"\" width=\"457\" height=\"393\" /></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '[\"notebooks\\\\August2018\\\\wAVGLwz12TEJSHEYozeO.jpg\",\"notebooks\\\\August2018\\\\PhxjLjhOtQWI9DCH5HGI.jpg\",\"notebooks\\\\August2018\\\\rTP80MOc1YjcWg59teaY.jpg\",\"notebooks\\\\August2018\\\\XUPyCM7lgYD9IUo2vR5g.png\",\"notebooks\\\\August2018\\\\N9YmadCbnmlr16Z4RxaF.jpg\"]', '2018-08-30 12:55:00', '2018-08-31 04:09:22', '2100000', '2300000', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Ноутбук Xiaomi Mi Notebook Air 12\"', '<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 14px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">- Процессор: Intel Core M3-7Y30 (2 ядра, до 2.6&nbsp;ГГц)<br style=\"outline: 0px; box-sizing: border-box;\" />- Объем оперативной памяти: 4Гб<br style=\"outline: 0px; box-sizing: border-box;\" />- Размер экрана: 12.5&rdquo;<br style=\"outline: 0px; box-sizing: border-box;\" />- Разрешение экрана: 1920х1080 (Full HD)<br style=\"outline: 0px; box-sizing: border-box;\" />- Видеокарта: Intel HD Graphics 615<br style=\"outline: 0px; box-sizing: border-box;\" />- Объем SSD: 128Гб<br style=\"outline: 0px; box-sizing: border-box;\" />- Интерфейсы: USB 3.0 Type-C, HDMI, вход микр./вых. на наушники Combo<br style=\"outline: 0px; box-sizing: border-box;\" />- Версия Bluetooth: 4.1</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 14px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;</p>\r\n<div class=\"phr\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 16px 0px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: top; display: inline-block;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/xiaomi-1900x700_c.jpg\" alt=\"\" width=\"200\" height=\"74\" /></p>\r\n</div>', '<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\">Металлический корпус &mdash; современный лаконичный дизайн</h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Благодаря плотному размещению компонентов, материнской платы и специальной технологии соединения деталей компания&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Xiaomi</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">смогла сделать&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;еще тоньше. Благодаря использованию батареи высокой плотности устройство потребляет минимальное количество энергии, кроме того, такая батарея занимает очень мало места. Внедрение этих новшеств позволило&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Xiaomi</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;создать линейку портативных ноутбуков, которые сочетают в себе высокую производительность и компактные размеры.&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;легко помещается практически в любой сумке или рюкзаке, его легко носить с собой даже в одной руке, и он всегда привлекает к себе внимание, благодаря своему стильному внешнему виду.</span><span id=\"copyinfo\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/%D0%9C%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D0%B5%D0%BB%D0%B5%D1%84%D0%BE%D0%BD%D1%8B/2_4.jpg\" alt=\"\" width=\"750\" height=\"406\" /></span></p>\r\n<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\">Компоненты самого высокого качества</h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Xiaomi</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;стремится достичь максимальных высот даже в мелочах. Высокопроизводительный процессор от Intel, быстрый диск SSD, графической картой nVidia GeForce 940MX &mdash; это залог успеха. Играйте в мощные современные игры, создавайте и редактируйте видео без каких &mdash; либо проблем и задержек. Вам больше не придется выбирать между портативностью и функциональностью.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/%D0%9C%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D0%B5%D0%BB%D0%B5%D1%84%D0%BE%D0%BD%D1%8B/3_4.jpg\" alt=\"\" width=\"750\" height=\"371\" /></span></p>\r\n<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Полное погружение с Full HD экраном и тонкой рамкой</span></h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Экран ноутбука&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;имеет ультратонкую рамку шириной 5.59 мм, что в сочетании с разрешением 1920 x 1080 пикселей, делает невероятный эффект, помогая вам лучше сосредоточиться на изображении. Защитное стекло изготовлено из синтетического сапфира высокой твердости &mdash; 7H по шкале Мооса, что делает дисплей устойчивым к царапинам.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></span></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Специальная технология ламинирования уменьшает толщину воздушного зазора между дисплеем и защитным стеклом в 4 раза, в результате чего уменьшается вероятность возникновения бликов, вызванная преломлением света. Насладитесь высоким качеством изображения как дома, так и на открытом воздухе, даже при ярком солнечном свете.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></span></span></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/%D0%9C%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D0%B5%D0%BB%D0%B5%D1%84%D0%BE%D0%BD%D1%8B/4_4.jpg\" alt=\"\" width=\"750\" height=\"308\" /></span></p>\r\n<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\">Батареи с высокой плотностью энергии</h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Такой маленький ноутбук с таким длительным временем автономной работы &mdash; это не волшебство, это наука. Для этого&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Xiaomi</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;использует батареи с высокой плотностью энергии 578 Вт*ч/л, что делает аккумулятор очень легким и позволяет использовать быструю зарядку через порт USB Type-C. Теперь можно заряжать ноутбук на 50% всего за полчаса.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">&nbsp;Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;удобно использовать в любое время и в любом месте &mdash; дома, на прогулке или во время путешествия.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></span></span></span></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/%D0%9C%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D0%B5%D0%BB%D0%B5%D1%84%D0%BE%D0%BD%D1%8B/5_4.jpg\" alt=\"\" width=\"750\" height=\"317\" /></span></p>\r\n<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\">Объемный звук от австрийского производителя</h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Любите слушать музыку и смотреть фильмы на ноутбуке?&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Xiaomi</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;позаботились о качестве звука в&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">. Для того, чтобы сделать звук качественным и чистым, а бас богатым&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">и мощным &mdash; устройство оснащено динамиками от австрийского производителя AKG. Технология Dolby Audio Premium делает звук более естественным и сбалансированным.</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><br style=\"outline: 0px; box-sizing: border-box;\" /></span></span></span></span></span></span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://avtech.uz/img/cms/%D0%9C%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D0%B5%D0%BB%D0%B5%D1%84%D0%BE%D0%BD%D1%8B/6_3.jpg\" alt=\"\" width=\"750\" height=\"296\" /></span></p>\r\n<h3 style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 24px; vertical-align: baseline; color: #000000;\">Богатый интерфейс</h3>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Все топ-модели ноутбуков нового поколения используют порты USB Type-C, и&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;не является исключением. Вы можете использовать его для зарядки гаджетов, передачи данных, а также для вывода видео.&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline;\">Mi Notebook Air</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">&nbsp;имеет выход HDMI, 2 порта USB 3.0 и разъем для наушников 3.5 мм. Такое разнообразие портов и выходов значительно расширяет ваши возможности &mdash; например, вы можете использовать дополнительный дисплей 4K для работы или развлечений.</span></span></span></span></span></span></span></p>', '[\"notebooks\\\\August2018\\\\nB7VywEpCCDlj7kq1Orm.jpg\",\"notebooks\\\\August2018\\\\SZDYL3VMZ5C5ARD7MqHx.jpg\",\"notebooks\\\\August2018\\\\DJrJO0cReB5bsfrCHKhQ.jpg\",\"notebooks\\\\August2018\\\\9inFYZ3OR8Dm4xOV2E8N.jpg\"]', '2018-08-30 13:01:00', '2018-09-02 02:52:59', '300000000', '33000000', 2, 3, '111', '222', '333', '444', '555', '666', '777', '888', '999', '101010', '111111', '121212', '131313', '141414', '151515', '161616', '171717', '181818', '191919', '202020', '212121', '222222', '232323', '242424', '252525', '262626');

-- --------------------------------------------------------

--
-- Table structure for table `notebook_processsors`
--

DROP TABLE IF EXISTS `notebook_processsors`;
CREATE TABLE IF NOT EXISTS `notebook_processsors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notebook_processsors`
--

INSERT INTO `notebook_processsors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'core i3', '2018-08-31 03:46:44', '2018-08-31 03:46:44'),
(2, 'celeron', '2018-08-31 03:46:52', '2018-08-31 03:46:52'),
(3, 'amd', '2018-08-31 03:46:57', '2018-08-31 03:46:57'),
(4, 'co5', '2018-08-31 03:47:06', '2018-08-31 03:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `fname`, `lname`, `phone`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Ali', 'Vali', '+998946320624', 'sardor@gmil.com', 'Something', '2018-09-18 19:00:00', '2018-09-19 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-08-14 04:20:42', '2018-08-14 04:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(2, 'browse_bread', NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(3, 'browse_database', NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(4, 'browse_media', NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(5, 'browse_compass', NULL, '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(6, 'browse_menus', 'menus', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(7, 'read_menus', 'menus', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(8, 'edit_menus', 'menus', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(9, 'add_menus', 'menus', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(10, 'delete_menus', 'menus', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(11, 'browse_roles', 'roles', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(12, 'read_roles', 'roles', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(13, 'edit_roles', 'roles', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(14, 'add_roles', 'roles', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(15, 'delete_roles', 'roles', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(16, 'browse_users', 'users', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(17, 'read_users', 'users', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(18, 'edit_users', 'users', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(19, 'add_users', 'users', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(20, 'delete_users', 'users', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(21, 'browse_settings', 'settings', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(22, 'read_settings', 'settings', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(23, 'edit_settings', 'settings', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(24, 'add_settings', 'settings', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(25, 'delete_settings', 'settings', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(26, 'browse_categories', 'categories', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(27, 'read_categories', 'categories', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(28, 'edit_categories', 'categories', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(29, 'add_categories', 'categories', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(30, 'delete_categories', 'categories', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(31, 'browse_posts', 'posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(32, 'read_posts', 'posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(33, 'edit_posts', 'posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(34, 'add_posts', 'posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(35, 'delete_posts', 'posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(36, 'browse_pages', 'pages', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(37, 'read_pages', 'pages', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(38, 'edit_pages', 'pages', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(39, 'add_pages', 'pages', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(40, 'delete_pages', 'pages', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(41, 'browse_hooks', NULL, '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(42, 'browse_dvd_rws', 'dvd_rws', '2018-08-19 07:04:37', '2018-08-19 07:04:37'),
(43, 'read_dvd_rws', 'dvd_rws', '2018-08-19 07:04:37', '2018-08-19 07:04:37'),
(44, 'edit_dvd_rws', 'dvd_rws', '2018-08-19 07:04:37', '2018-08-19 07:04:37'),
(45, 'add_dvd_rws', 'dvd_rws', '2018-08-19 07:04:37', '2018-08-19 07:04:37'),
(46, 'delete_dvd_rws', 'dvd_rws', '2018-08-19 07:04:37', '2018-08-19 07:04:37'),
(52, 'browse_hdds', 'hdds', '2018-08-19 07:50:51', '2018-08-19 07:50:51'),
(53, 'read_hdds', 'hdds', '2018-08-19 07:50:51', '2018-08-19 07:50:51'),
(54, 'edit_hdds', 'hdds', '2018-08-19 07:50:51', '2018-08-19 07:50:51'),
(55, 'add_hdds', 'hdds', '2018-08-19 07:50:51', '2018-08-19 07:50:51'),
(56, 'delete_hdds', 'hdds', '2018-08-19 07:50:51', '2018-08-19 07:50:51'),
(57, 'browse_keyboard_mouses', 'keyboard_mouses', '2018-08-19 08:02:06', '2018-08-19 08:02:06'),
(58, 'read_keyboard_mouses', 'keyboard_mouses', '2018-08-19 08:02:06', '2018-08-19 08:02:06'),
(59, 'edit_keyboard_mouses', 'keyboard_mouses', '2018-08-19 08:02:06', '2018-08-19 08:02:06'),
(60, 'add_keyboard_mouses', 'keyboard_mouses', '2018-08-19 08:02:06', '2018-08-19 08:02:06'),
(61, 'delete_keyboard_mouses', 'keyboard_mouses', '2018-08-19 08:02:06', '2018-08-19 08:02:06'),
(62, 'browse_video_cards', 'video_cards', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(63, 'read_video_cards', 'video_cards', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(64, 'edit_video_cards', 'video_cards', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(65, 'add_video_cards', 'video_cards', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(66, 'delete_video_cards', 'video_cards', '2018-08-19 08:18:11', '2018-08-19 08:18:11'),
(67, 'browse_enclosure_and_power_supplis', 'enclosure_and_power_supplis', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(68, 'read_enclosure_and_power_supplis', 'enclosure_and_power_supplis', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(69, 'edit_enclosure_and_power_supplis', 'enclosure_and_power_supplis', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(70, 'add_enclosure_and_power_supplis', 'enclosure_and_power_supplis', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(71, 'delete_enclosure_and_power_supplis', 'enclosure_and_power_supplis', '2018-08-19 08:22:53', '2018-08-19 08:22:53'),
(72, 'browse_monitors', 'monitors', '2018-08-19 11:07:13', '2018-08-19 11:07:13'),
(73, 'read_monitors', 'monitors', '2018-08-19 11:07:13', '2018-08-19 11:07:13'),
(74, 'edit_monitors', 'monitors', '2018-08-19 11:07:13', '2018-08-19 11:07:13'),
(75, 'add_monitors', 'monitors', '2018-08-19 11:07:13', '2018-08-19 11:07:13'),
(76, 'delete_monitors', 'monitors', '2018-08-19 11:07:13', '2018-08-19 11:07:13'),
(77, 'browse_network_filters', 'network_filters', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(78, 'read_network_filters', 'network_filters', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(79, 'edit_network_filters', 'network_filters', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(80, 'add_network_filters', 'network_filters', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(81, 'delete_network_filters', 'network_filters', '2018-08-19 11:18:31', '2018-08-19 11:18:31'),
(82, 'browse_headphones', 'headphones', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(83, 'read_headphones', 'headphones', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(84, 'edit_headphones', 'headphones', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(85, 'add_headphones', 'headphones', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(86, 'delete_headphones', 'headphones', '2018-08-19 11:23:47', '2018-08-19 11:23:47'),
(87, 'browse_speakers', 'speakers', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(88, 'read_speakers', 'speakers', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(89, 'edit_speakers', 'speakers', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(90, 'add_speakers', 'speakers', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(91, 'delete_speakers', 'speakers', '2018-08-19 11:27:43', '2018-08-19 11:27:43'),
(92, 'browse_processors', 'processors', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(93, 'read_processors', 'processors', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(94, 'edit_processors', 'processors', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(95, 'add_processors', 'processors', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(96, 'delete_processors', 'processors', '2018-08-19 12:18:34', '2018-08-19 12:18:34'),
(97, 'browse_rams', 'rams', '2018-08-20 04:00:14', '2018-08-20 04:00:14'),
(98, 'read_rams', 'rams', '2018-08-20 04:00:14', '2018-08-20 04:00:14'),
(99, 'edit_rams', 'rams', '2018-08-20 04:00:14', '2018-08-20 04:00:14'),
(100, 'add_rams', 'rams', '2018-08-20 04:00:14', '2018-08-20 04:00:14'),
(101, 'delete_rams', 'rams', '2018-08-20 04:00:14', '2018-08-20 04:00:14'),
(102, 'browse_motherboard', 'motherboard', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(103, 'read_motherboard', 'motherboard', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(104, 'edit_motherboard', 'motherboard', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(105, 'add_motherboard', 'motherboard', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(106, 'delete_motherboard', 'motherboard', '2018-08-27 09:20:58', '2018-08-27 09:20:58'),
(107, 'browse_notebooks', 'notebooks', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(108, 'read_notebooks', 'notebooks', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(109, 'edit_notebooks', 'notebooks', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(110, 'add_notebooks', 'notebooks', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(111, 'delete_notebooks', 'notebooks', '2018-08-30 12:03:50', '2018-08-30 12:03:50'),
(112, 'browse_brands', 'brands', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(113, 'read_brands', 'brands', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(114, 'edit_brands', 'brands', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(115, 'add_brands', 'brands', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(116, 'delete_brands', 'brands', '2018-08-30 13:29:17', '2018-08-30 13:29:17'),
(117, 'browse_notebook_processsors', 'notebook_processsors', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(118, 'read_notebook_processsors', 'notebook_processsors', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(119, 'edit_notebook_processsors', 'notebook_processsors', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(120, 'add_notebook_processsors', 'notebook_processsors', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(121, 'delete_notebook_processsors', 'notebook_processsors', '2018-08-31 03:44:19', '2018-08-31 03:44:19'),
(122, 'browse_phoneproccesssors', 'phoneproccesssors', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(123, 'read_phoneproccesssors', 'phoneproccesssors', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(124, 'edit_phoneproccesssors', 'phoneproccesssors', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(125, 'add_phoneproccesssors', 'phoneproccesssors', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(126, 'delete_phoneproccesssors', 'phoneproccesssors', '2018-09-02 08:47:09', '2018-09-02 08:47:09'),
(127, 'browse_smartphones', 'smartphones', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(128, 'read_smartphones', 'smartphones', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(129, 'edit_smartphones', 'smartphones', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(130, 'add_smartphones', 'smartphones', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(131, 'delete_smartphones', 'smartphones', '2018-09-02 09:00:58', '2018-09-02 09:00:58'),
(132, 'browse_phoneproccessors', 'phoneproccessors', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(133, 'read_phoneproccessors', 'phoneproccessors', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(134, 'edit_phoneproccessors', 'phoneproccessors', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(135, 'add_phoneproccessors', 'phoneproccessors', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(136, 'delete_phoneproccessors', 'phoneproccessors', '2018-09-02 09:19:39', '2018-09-02 09:19:39'),
(137, 'browse_phonebrands', 'phonebrands', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(138, 'read_phonebrands', 'phonebrands', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(139, 'edit_phonebrands', 'phonebrands', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(140, 'add_phonebrands', 'phonebrands', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(141, 'delete_phonebrands', 'phonebrands', '2018-09-02 10:46:26', '2018-09-02 10:46:26'),
(142, 'browse_new_computers', 'new_computers', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(143, 'read_new_computers', 'new_computers', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(144, 'edit_new_computers', 'new_computers', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(145, 'add_new_computers', 'new_computers', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(146, 'delete_new_computers', 'new_computers', '2018-09-08 01:18:42', '2018-09-08 01:18:42'),
(147, 'browse_new_notebooks', 'new_notebooks', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(148, 'read_new_notebooks', 'new_notebooks', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(149, 'edit_new_notebooks', 'new_notebooks', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(150, 'add_new_notebooks', 'new_notebooks', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(151, 'delete_new_notebooks', 'new_notebooks', '2018-09-08 01:37:01', '2018-09-08 01:37:01'),
(152, 'browse_new_smartphones', 'new_smartphones', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(153, 'read_new_smartphones', 'new_smartphones', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(154, 'edit_new_smartphones', 'new_smartphones', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(155, 'add_new_smartphones', 'new_smartphones', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(156, 'delete_new_smartphones', 'new_smartphones', '2018-09-08 01:47:03', '2018-09-08 01:47:03'),
(157, 'browse_top_computers', 'top_computers', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(158, 'read_top_computers', 'top_computers', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(159, 'edit_top_computers', 'top_computers', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(160, 'add_top_computers', 'top_computers', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(161, 'delete_top_computers', 'top_computers', '2018-09-08 23:43:10', '2018-09-08 23:43:10'),
(162, 'browse_top_notebooks', 'top_notebooks', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(163, 'read_top_notebooks', 'top_notebooks', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(164, 'edit_top_notebooks', 'top_notebooks', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(165, 'add_top_notebooks', 'top_notebooks', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(166, 'delete_top_notebooks', 'top_notebooks', '2018-09-08 23:44:25', '2018-09-08 23:44:25'),
(167, 'browse_top_smartphones', 'top_smartphones', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(168, 'read_top_smartphones', 'top_smartphones', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(169, 'edit_top_smartphones', 'top_smartphones', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(170, 'add_top_smartphones', 'top_smartphones', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(171, 'delete_top_smartphones', 'top_smartphones', '2018-09-08 23:45:34', '2018-09-08 23:45:34'),
(187, 'browse_notification', 'notification', '2018-09-24 05:57:48', '2018-09-24 05:57:48'),
(188, 'read_notification', 'notification', '2018-09-24 05:57:48', '2018-09-24 05:57:48'),
(189, 'edit_notification', 'notification', '2018-09-24 05:57:48', '2018-09-24 05:57:48'),
(190, 'add_notification', 'notification', '2018-09-24 05:57:48', '2018-09-24 05:57:48'),
(191, 'delete_notification', 'notification', '2018-09-24 05:57:48', '2018-09-24 05:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phonebrands`
--

DROP TABLE IF EXISTS `phonebrands`;
CREATE TABLE IF NOT EXISTS `phonebrands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phonebrands`
--

INSERT INTO `phonebrands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'samsung', '2018-09-02 10:51:01', '2018-09-02 10:51:01'),
(2, 'red mi', '2018-09-02 10:51:13', '2018-09-02 10:51:13'),
(3, 'xuaw', '2018-09-02 10:51:27', '2018-09-02 10:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `phoneproccessors`
--

DROP TABLE IF EXISTS `phoneproccessors`;
CREATE TABLE IF NOT EXISTS `phoneproccessors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phoneproccessors`
--

INSERT INTO `phoneproccessors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '64Bit Qualcomm Snapdragon 430 1.4 Ггц 8 ядер ARM Cortex-A53', '2018-09-02 09:02:39', '2018-09-02 09:02:39'),
(2, 'MediaTek Helio X20 (MT6797), 2100 МГц 10 ядер', '2018-09-02 09:02:52', '2018-09-02 09:02:52'),
(3, 'Qualcomm Snapdragon 625 MSM8953/ 1,4ГГц/ 8 ядерный', '2018-09-02 09:03:06', '2018-09-02 09:03:06'),
(4, 'Qualcomm Snapdragon 650 MSM8956, 1800 МГц 6 ядер', '2018-09-02 09:03:30', '2018-09-02 09:03:30'),
(5, 'Qualcomm Snapdragon 650, 1,8 ГГц 6 ядер', '2018-09-02 09:03:58', '2018-09-02 09:03:58');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Lorem Ipsum Post', '', 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-14 04:20:42', '2018-08-15 14:15:43'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(4, 1, 1, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2018-08-14 04:20:42', '2018-08-15 03:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `processors`
--

DROP TABLE IF EXISTS `processors`;
CREATE TABLE IF NOT EXISTS `processors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `motherboard_id` int(11) DEFAULT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `Processor_parameters` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Socket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_Cores` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_threads` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cache_processor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Chipset` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ethernet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USB_2_interface` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USB_3_interface` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Expansion_Slots` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_memory_slots` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Maximum_amount_of_memory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Number_of_SATA_connectors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Output_device_connectors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `System_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processors`
--

INSERT INTO `processors` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `images`, `motherboard_id`, `full_description`, `Processor_parameters`, `Socket`, `Number_of_Cores`, `Number_of_threads`, `Cache_processor`, `Chipset`, `Ethernet`, `USB_2_interface`, `USB_3_interface`, `Expansion_Slots`, `Number_of_memory_slots`, `Maximum_amount_of_memory`, `Number_of_SATA_connectors`, `Output_device_connectors`, `System_unit`) VALUES
(1, 'core i3 en', '<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>', 999000, NULL, '2018-09-09 08:15:34', '[\"processors\\\\August2018\\\\k2vGM5yMiAhTa1rPcYvF.jpg\"]', 3, '<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'core i5', '<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco<span style=\"color: #99cc00;\"> laboris nisi ut</span> aliquip ex ea <span style=\"text-decoration: underline;\">commodo</span> consequat.</span></p>', 450000, '2018-08-20 04:02:00', '2018-08-30 10:51:03', '[\"processors\\\\August2018\\\\m2j8T0hpogRzwBHUNdj8.jpg\",\"processors\\\\August2018\\\\4PeM6uJo41L6FQ7uVxcH.jpg\",\"processors\\\\August2018\\\\luaQNZcX3Q5E0y7nieWQ.jpg\",\"processors\\\\August2018\\\\ppLJfr3WtLpnmL1tGRWs.jpg\"]', 4, '<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>\r\n<p><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">Lorem ipsum&nbsp;</span><strong style=\"color: #333333; font-family: Montserrat, sans-serif;\">dolor sit amet</strong><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</span><span style=\"color: #99cc00;\">&nbsp;laboris nisi ut</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;aliquip ex ea&nbsp;</span><span style=\"text-decoration: underline;\">commodo</span><span style=\"color: #333333; font-family: Montserrat, sans-serif;\">&nbsp;consequat.</span></p>', '111', '222', '333', '444', '555', '666', '777', '888', '888', '999', '101010', '111111', '121212', '131313', '141414'),
(3, 'amd', '<p>best</p>', 374444, '2018-08-30 03:13:00', '2018-09-12 09:07:27', '[\"processors\\\\August2018\\\\wkFetHCPh3skBx00mbcu.jpg\"]', 4, '<p>zo\'r zo\'r</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `processor_ram`
--

DROP TABLE IF EXISTS `processor_ram`;
CREATE TABLE IF NOT EXISTS `processor_ram` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `processor_id` int(10) UNSIGNED NOT NULL,
  `ram_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processor_ram`
--

INSERT INTO `processor_ram` (`id`, `processor_id`, `ram_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 1, 2, NULL, NULL),
(5, 3, 2, NULL, NULL),
(6, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rams`
--

DROP TABLE IF EXISTS `rams`;
CREATE TABLE IF NOT EXISTS `rams` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rams`
--

INSERT INTO `rams` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'DDR II 2GB', 120000, '2018-08-20 04:01:24', '2018-08-20 04:01:24'),
(2, 'DDR II 4GB', 111111141545, '2018-08-20 04:01:00', '2018-09-25 02:45:54'),
(3, 'ddr4', 10000, '2018-08-26 00:36:00', '2018-09-25 02:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-08-14 04:20:41', '2018-08-14 04:20:41'),
(2, 'user', 'Normal User', '2018-08-14 04:20:41', '2018-08-14 04:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Texnoosiyo', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\August2018\\8kAvRDrTnkw8lOIUxHkj.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\August2018\\u3LhAfSuTz9ij9D4TRhr.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Texnoosiyo', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Texnoosiyo.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.phone_number', 'Phone number', '+021-95-51-84', NULL, 'text', 6, 'Site'),
(12, 'site.email', 'Email', 'email@mail.com', NULL, 'text', 7, 'Site'),
(13, 'site.address', 'Address', 'Anhorbo\'yi ko\'chasi. 40', NULL, 'text', 8, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `smartphones`
--

DROP TABLE IF EXISTS `smartphones`;
CREATE TABLE IF NOT EXISTS `smartphones` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `old_price` double DEFAULT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `phoneproccessor_id` int(11) DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `phonebrand_id` int(11) DEFAULT NULL,
  `Model` varbinary(255) DEFAULT NULL,
  `Video_Accelerator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RAM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Inner_memory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SD_Memory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Display` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Main_camera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Front_camera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Battery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Network_Support` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SIM_card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OS_Android_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dimensions_and_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bluetooth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Wi_Fi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fingerprint_reader` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USB_standard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Support_USB_OTG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smartphones`
--

INSERT INTO `smartphones` (`id`, `name`, `created_at`, `updated_at`, `description`, `price`, `old_price`, `full_description`, `phoneproccessor_id`, `images`, `phonebrand_id`, `Model`, `Video_Accelerator`, `RAM`, `Inner_memory`, `SD_Memory`, `Display`, `Main_camera`, `Front_camera`, `Battery`, `Network_Support`, `SIM_card_type`, `OS_Android_version`, `Dimensions_and_weight`, `Bluetooth`, `Wi_Fi`, `Fingerprint_reader`, `USB_standard`, `Support_USB_OTG`) VALUES
(1, 'Xiaomi Redmi 3S (2GB,16GB,Silver,Gold)', '2018-09-02 09:23:00', '2018-09-02 09:53:44', '<p><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Процессор</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">:</span><span style=\"color: #3c3c3c; font-family: LatoRegular;\">&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">64Bit Qualcomm Snapdragon 430 1.4&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Ггц</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;8&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">ядер</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">ARM Cortex-A53</span><span style=\"color: #3c3c3c; font-family: LatoRegular;\">&nbsp;/ Adreno 505 / 2Gb /&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">16Gb</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">5&rdquo; IPS 720p (HD)</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">13MP</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">5MP</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Android 5.1.1</span></p>', 1347314, 1547314, '<h2 class=\"page-title\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; font-size: 28px; vertical-align: baseline; color: #000000;\">Xiaomi Redmi 3S (2GB,16GB,Dark Grey, Silver, Gold):</h2>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Одной из особенностей данной модели является наличие второй CDMA SIM-карты. Стандарт связи CDMA позволяет подключиться к сети Интернет с отличной 3G скоростью. Вы можете в любом нужном месте бесперебойно использовать Интернет для просмотра видео, общения в социальных сетях, любых других задач.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;</p>\r\n<div style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #000000;\" align=\"center\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/images/pic/76856_CDMA_GSM.jpg\" alt=\"76856_CDMA_GSM.jpg\" width=\"480\" height=\"313\" border=\"0\" /></div>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Xiaomi Redmi 3S обладает рядом качественных улучшений, благодаря которым, смартфон способен конкурировать даже с флагманами. В первую очередь стоит отметить наличие сканера отпечатков пальцев, позволяющих лучше защитить конфиденциальную информацию хранящуюся в смартфоне и не вводить каждый раз пароль для разблокировки смартфона.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/upload/medialibrary/7e0/overall-finger-bg.jpg\" alt=\"overall-finger-bg.jpg\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">В качестве аппаратной платформы выступает восьмиядерный Qualcomm Snapdragon 430 (четыре ядра с частотой 1.4 ГГц и четыре ядра с частотой 1.1 ГГц) с графическим ускорителем Adreno 505. Модель укомплектована 2 Гб оперативной памяти и 16 Гб встроенной, при этом также доступна установка карты памяти MicroSD емкостью до 128 Гб в слот для второй SIM-карты.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/upload/medialibrary/7fd/overall-4g-3s.jpg\" alt=\"overall-4g-3s.jpg\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Xiaomi Redmi 3S оснащен гибридным лотком для SIM-карт. Всего есть два слота: для micro SIM и Nano SIM. Так как корпус у аппарата цельнометаллический, то один слот (Nano SIM) совмещен с картой памяти microSD.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/upload/medialibrary/271/redmi_40.jpg\" alt=\"redmi_40.jpg\" width=\"900\" height=\"476\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Основная камера оснащена 13 Мп модулем с апертурой f/2.0, фазовым автофокусом (PDAF) и может снимать в режиме HDR. Время фокусировки камеры &mdash; всего 0.1 секунда. Фронтальная камера получила сенсор на 5 мегапикселей и апертуру f/2.2, она может снимать видео в Full HD, как и основная камера.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/upload/medialibrary/ea5/overall-intro-bg-3s.jpg\" alt=\"overall-intro-bg-3s.jpg\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">По словам производителя, аккумулятор на 4100 мАч и ряд оптимизаций обеспечивает на 80% более длительную автономность в режиме разговора по сравнению с предшественником Redmi 2.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><br style=\"outline: 0px; box-sizing: border-box;\" /><br style=\"outline: 0px; box-sizing: border-box;\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"http://www.citrus.ua/upload/medialibrary/1eb/redmi_35.jpg\" alt=\"redmi_35.jpg\" width=\"650\" height=\"326\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Работает Xiaomi Redmi 3S под управлением&nbsp;Android 5.1.1</span></p>', 1, '[\"smartphones\\\\September2018\\\\7J61CRKHaZN6KYE1PQVK.jpg\",\"smartphones\\\\September2018\\\\ADD9PvwvDJas5B75ksKr.jpg\",\"smartphones\\\\September2018\\\\aShskDMmsnpPtvqNLVMG.jpg\",\"smartphones\\\\September2018\\\\1Y0f04I92JIN0vurg4qd.jpg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Xiaomi Redmi 3x (2GB,32GB,Gold, Silver):', '2018-09-02 09:48:00', '2018-09-03 06:33:30', '<p><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Процессор</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">:</span><span style=\"color: #3c3c3c; font-family: LatoRegular;\">&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">64Bit Qualcomm Snapdragon 430 1.4&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Ггц</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;8&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">ядер</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">ARM Cortex-A53</span><span style=\"color: #3c3c3c; font-family: LatoRegular;\">&nbsp;/ Adreno 505 / 2Gb /&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">32Gb</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">5&rdquo; IPS 720p (HD)</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">13MP</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">5MP</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">&nbsp;/&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #3c3c3c;\">Android 5.1.1</span></p>', 1373223, NULL, '<div class=\"product_description\" style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 24px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoRegular; vertical-align: baseline; color: #000000;\">\r\n<h2 class=\"page-title\" style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 28px; vertical-align: baseline;\">Xiaomi Redmi 3x (2GB,32GB,Gold, Silver):</h2>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_.jpg\" alt=\"\" /></span></p>\r\n<ul style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; list-style: none;\">\r\n<li style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Металлический корпус</li>\r\n<li style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">4100mAh емкостный аккумулятор</li>\r\n<li style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Сканер отпечатков пальцев</li>\r\n<li style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Двойной апгрейд</li>\r\n</ul>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Возвышенные технологии</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Новый уровень производительности &ndash; это новый смартфон Redmi 3X. Соедините высококачественный процессор Qualcomm Snapdragon 430, емкостную батарею 4100 mAh, сенсор распознания отпечатков пальцев, прибавьте тонкий металлический корпус с элегантными гранями и невероятным искристым дизайном &ndash; и возьмите свой смартфон Redmi 3X, почувствуйте бушующий импульс.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Металлический корпус, сияющий грани</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Смартфон удобно располагается в руке, поскольку имеет 5-дюймовый дисплей и тонкую грань 8.5 мм. Вес Redmi 3X составляет 146 г. Не только тактильные ощущения принесут вам восторг, корпус мерцает множеством искр, отражающими солнечный свет.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_1.jpg\" alt=\"\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">8-ядерный процессор Qualcomm&nbsp;</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Snapdragon</span><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">&nbsp;430</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Redmi 3X обладает высокопроизводительным процессором Qualcomm Snapdragon 430 с 8-ядерной 64-разрядной архитектурой ARM Cortex A53. Частота процессора составляет 1.4GHz. Теперь для вас открыты задачи нового уровня сложности, обработка больших объемов информации, а также возможность проводить множество операций при малом режиме мощности.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Игры быстрее на 20%</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Графический процессор Adreno 505</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Бесперебойная работа процессора позволяет реализовать быстрые гоночные игры, шутеры и красочные игры нового поколения. Поддержка OpenGL ES 3.1+ и других игровых технологий дарит богатые визуальные эффекты, позволяя полностью погружаться в игровой мир.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_2.jpg\" alt=\"\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">2 Гб оперативной памяти + 32 Гб памяти</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Поддержка дополнительного расширения 128GB</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Стандартная емкость 32 Гб уместит любимые видео, фотографии и игры, ваши воспоминания и предпочтения требуют больше места, вы можете использовать один из трех слотов: один для Micro-SD карты и два для sim-карт, которые вы также можете использовать для расширения памяти до 128 Гб.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_4.jpg\" alt=\"\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Идентификация отпечатков пальцев</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Разблокировать смартфон быстро</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Технология ARM TrustZone &ndash; это возможность разблокировать смартфон за секунду единым касанием пальца. Сверхточный сенсор надежно сохранит ваши данные от публичного доступа, ведь только ваш отпечаток может разблокировать смартфон.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_3.jpg\" alt=\"\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">4100mAh батарея</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Тонкий и легкий смартфон Redmi 3X имеет невероятно емкостную батарею высокой плотности оптимизированной конструкции, поэтому устройство весит только 146 г, но работает дольше. Благодаря технологии Quick Charge 2.0 смартфон зарядится намного быстрее.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">13-мегапиксельная HD камера</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Поддержка технологии фазовой фокусировки</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Быстрая фокусировка за 0.1 секунды высокой четкости &ndash; ключевая характеристика основной камеры Redmi 3X. Сделайте четкую, контрастную фотографию в мгновение ока. Высокая скорость обработки динамического диапазона повышает качество изображения.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_5.jpg\" alt=\"\" /></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">5MP фронтальная камера</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">Хотите сделать умопомрачительные селфи? Каждый ваш кадр друзья оценят с удовольствием. 5-мегапиксельная фронтальная камера умеет автоматически распознавать лица, поэтому раскрывает вашу истинную красоту, которой вы сможете поделиться в социальных сетях.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">5 дюймов IPS HD экран</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><span style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: LatoBold; vertical-align: baseline; display: inline-block; color: #000000;\">Загляденье!</span></p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\">HD экран смартфона Redmi 3X придаст вашим глазам дополнительный комфорт: новый уровень качества изображения имеет гладкие текстуры и мягкие тона. Вы также можете выбрать один из трех цветовых вариаций температуры экрана, чтобы глаза не уставали при длительном просмотре фотографий, чтении или игровом процессе, так что трудно будет оторваться от любимого дела.</p>\r\n<p style=\"outline: 0px; box-sizing: border-box; margin: 0px 0px 12px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #3c3c3c;\"><img style=\"outline: 0px; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\" src=\"https://www.xiaomi.ua/uploads/ck/%D0%A1%D0%BC%D0%B0%D1%80%D1%82%D1%84%D0%BE%D0%BD_Redmi_3X_6.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n</div>', 1, '[\"smartphones\\\\September2018\\\\78qzxm281F59oHIADv2p.jpg\",\"smartphones\\\\September2018\\\\OBWA6Bxv6AknaKU2Kbbm.jpg\",\"smartphones\\\\September2018\\\\IuNEr3uAoJ0jBei8FGTC.jpg\",\"smartphones\\\\September2018\\\\QlHMYNcxBPuil9iuIuJH.jpg\"]', 2, 0x726564206d69203541, '1111', '2222', '3333', '4444', '5555', '6666', '7777', '8888', '9999', '10101010', '11111111', '12121212', '13131313', '14141414', '15151515', '16161616', '17171717');

-- --------------------------------------------------------

--
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
CREATE TABLE IF NOT EXISTS `speakers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'bits', 143000, '2018-08-21 12:17:01', '2018-08-21 12:17:01'),
(2, 'bits2', 144000, '2018-08-22 04:02:57', '2018-08-22 04:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `top_computers`
--

DROP TABLE IF EXISTS `top_computers`;
CREATE TABLE IF NOT EXISTS `top_computers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `processor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `top_computers`
--

INSERT INTO `top_computers` (`id`, `processor_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 23:46:26', '2018-09-08 23:46:26'),
(2, NULL, '2018-09-09 07:28:22', '2018-09-09 07:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `top_notebooks`
--

DROP TABLE IF EXISTS `top_notebooks`;
CREATE TABLE IF NOT EXISTS `top_notebooks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notebook_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `top_notebooks`
--

INSERT INTO `top_notebooks` (`id`, `notebook_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 23:46:34', '2018-09-08 23:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `top_smartphones`
--

DROP TABLE IF EXISTS `top_smartphones`;
CREATE TABLE IF NOT EXISTS `top_smartphones` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `smartphone_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `top_smartphones`
--

INSERT INTO `top_smartphones` (`id`, `smartphone_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2018-09-08 23:46:52', '2018-09-08 23:46:52'),
(2, NULL, '2018-09-09 07:27:49', '2018-09-09 07:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-08-14 04:20:42', '2018-08-14 04:20:42'),
(31, 'posts', 'title', 1, 'ru', 'Lorem Ipsum Post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(32, 'posts', 'title', 1, 'uz', 'Lorem Ipsum Post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(33, 'posts', 'seo_title', 1, 'ru', '', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(34, 'posts', 'seo_title', 1, 'uz', '', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(35, 'posts', 'excerpt', 1, 'ru', 'This is the excerpt for the Lorem Ipsum Post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(36, 'posts', 'excerpt', 1, 'uz', 'This is the excerpt for the Lorem Ipsum Post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(37, 'posts', 'body', 1, 'ru', '<p>Это тело сообщения lorem ipsum</p>', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(38, 'posts', 'body', 1, 'uz', '<p>Bu lorem ipsum postining tanasi</p>', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(39, 'posts', 'slug', 1, 'ru', 'lorem-ipsum-post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(40, 'posts', 'slug', 1, 'uz', 'lorem-ipsum-post', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(41, 'posts', 'meta_description', 1, 'ru', 'This is the meta description', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(42, 'posts', 'meta_description', 1, 'uz', 'This is the meta description', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(43, 'posts', 'meta_keywords', 1, 'ru', 'keyword1, keyword2, keyword3', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(44, 'posts', 'meta_keywords', 1, 'uz', 'keyword1, keyword2, keyword3', '2018-08-15 14:15:43', '2018-08-15 14:15:43'),
(45, 'menu_items', 'title', 15, 'ru', 'Компьютер', '2018-08-19 06:33:59', '2018-09-19 05:43:10'),
(46, 'menu_items', 'title', 15, 'uz', 'Kompyuter', '2018-08-19 06:33:59', '2018-09-19 05:43:10'),
(49, 'data_types', 'display_name_singular', 7, 'ru', 'DVD-RW', '2018-08-19 07:07:46', '2018-08-19 07:07:46'),
(50, 'data_types', 'display_name_singular', 7, 'uz', 'DVD-RW', '2018-08-19 07:07:46', '2018-08-19 07:07:46'),
(51, 'data_types', 'display_name_plural', 7, 'ru', 'DVD-RWs', '2018-08-19 07:07:46', '2018-08-19 07:07:46'),
(52, 'data_types', 'display_name_plural', 7, 'uz', 'DVD-RWs', '2018-08-19 07:07:46', '2018-08-19 07:07:46'),
(59, 'data_types', 'display_name_singular', 9, 'ru', 'Жёсткий диск', '2018-08-19 07:51:47', '2018-08-19 07:51:47'),
(60, 'data_types', 'display_name_singular', 9, 'uz', 'Жёсткий диск', '2018-08-19 07:51:47', '2018-08-19 07:51:47'),
(61, 'data_types', 'display_name_plural', 9, 'ru', 'Жёсткий диск', '2018-08-19 07:51:47', '2018-08-19 07:51:47'),
(62, 'data_types', 'display_name_plural', 9, 'uz', 'Жёсткий диск', '2018-08-19 07:51:47', '2018-08-19 07:51:47'),
(63, 'menu_items', 'title', 20, 'ru', 'Keyboard Mice', '2018-08-19 08:04:30', '2018-08-19 08:04:30'),
(64, 'menu_items', 'title', 20, 'uz', 'Keyboard Mice', '2018-08-19 08:04:30', '2018-08-19 08:04:30'),
(65, 'data_types', 'display_name_singular', 10, 'ru', 'Keyboard Mouse', '2018-08-19 08:06:44', '2018-08-19 08:06:44'),
(66, 'data_types', 'display_name_singular', 10, 'uz', 'Keyboard Mouse', '2018-08-19 08:06:44', '2018-08-19 08:06:44'),
(67, 'data_types', 'display_name_plural', 10, 'ru', 'Keyboard Mice', '2018-08-19 08:06:44', '2018-08-19 08:06:44'),
(68, 'data_types', 'display_name_plural', 10, 'uz', 'Keyboard Mice', '2018-08-19 08:06:44', '2018-08-19 08:06:44'),
(69, 'data_types', 'display_name_singular', 13, 'ru', 'Monitor', '2018-08-19 11:07:50', '2018-08-19 11:07:50'),
(70, 'data_types', 'display_name_singular', 13, 'uz', 'Monitor', '2018-08-19 11:07:50', '2018-08-19 11:07:50'),
(71, 'data_types', 'display_name_plural', 13, 'ru', 'Monitors', '2018-08-19 11:07:50', '2018-08-19 11:07:50'),
(72, 'data_types', 'display_name_plural', 13, 'uz', 'Monitors', '2018-08-19 11:07:50', '2018-08-19 11:07:50'),
(73, 'menu_items', 'title', 23, 'ru', 'Monitors', '2018-08-19 11:08:44', '2018-08-19 11:08:44'),
(74, 'menu_items', 'title', 23, 'uz', 'Monitors', '2018-08-19 11:08:44', '2018-08-19 11:08:44'),
(75, 'data_types', 'display_name_singular', 17, 'ru', 'Processor', '2018-08-20 01:48:21', '2018-08-20 01:48:21'),
(76, 'data_types', 'display_name_singular', 17, 'uz', 'Processor', '2018-08-20 01:48:21', '2018-08-20 01:48:21'),
(77, 'data_types', 'display_name_plural', 17, 'ru', 'Processors', '2018-08-20 01:48:21', '2018-08-20 01:48:21'),
(78, 'data_types', 'display_name_plural', 17, 'uz', 'Processors', '2018-08-20 01:48:21', '2018-08-20 01:48:21'),
(79, 'menu_items', 'title', 28, 'ru', 'Rams', '2018-08-20 04:02:54', '2018-08-20 04:02:54'),
(80, 'menu_items', 'title', 28, 'uz', 'Rams', '2018-08-20 04:02:54', '2018-08-20 04:02:54'),
(81, 'data_types', 'display_name_singular', 18, 'ru', 'Ram', '2018-08-20 04:03:24', '2018-08-20 04:03:24'),
(82, 'data_types', 'display_name_singular', 18, 'uz', 'Ram', '2018-08-20 04:03:24', '2018-08-20 04:03:24'),
(83, 'data_types', 'display_name_plural', 18, 'ru', 'Rams', '2018-08-20 04:03:24', '2018-08-20 04:03:24'),
(84, 'data_types', 'display_name_plural', 18, 'uz', 'Rams', '2018-08-20 04:03:24', '2018-08-20 04:03:24'),
(85, 'menu_items', 'title', 27, 'ru', 'Processors', '2018-08-25 02:34:45', '2018-08-25 02:34:45'),
(86, 'menu_items', 'title', 27, 'uz', 'protsessor', '2018-08-25 02:34:45', '2018-08-25 02:34:45'),
(87, 'menu_items', 'title', 29, 'ru', 'Motherboards', '2018-08-27 09:23:48', '2018-08-27 09:23:48'),
(88, 'menu_items', 'title', 29, 'uz', 'Motherboards', '2018-08-27 09:23:48', '2018-08-27 09:23:48'),
(89, 'data_types', 'display_name_singular', 22, 'ru', 'Notebook', '2018-08-30 12:08:20', '2018-08-30 12:08:20'),
(90, 'data_types', 'display_name_singular', 22, 'uz', 'Notebook', '2018-08-30 12:08:20', '2018-08-30 12:08:20'),
(91, 'data_types', 'display_name_plural', 22, 'ru', 'Notebooks', '2018-08-30 12:08:20', '2018-08-30 12:08:20'),
(92, 'data_types', 'display_name_plural', 22, 'uz', 'Notebooks', '2018-08-30 12:08:20', '2018-08-30 12:08:20'),
(93, 'menu_items', 'title', 32, 'ru', '', '2018-08-30 13:30:41', '2018-08-30 13:30:41'),
(94, 'menu_items', 'title', 32, 'uz', 'Noutbuk', '2018-08-30 13:30:41', '2018-09-19 05:51:15'),
(95, 'menu_items', 'title', 34, 'ru', '', '2018-09-02 04:56:24', '2018-09-02 04:56:24'),
(96, 'menu_items', 'title', 34, 'uz', 'Smartfon', '2018-09-02 04:56:24', '2018-09-19 05:51:34'),
(97, 'data_types', 'display_name_singular', 26, 'ru', 'Smartphone', '2018-09-02 09:42:56', '2018-09-02 09:42:56'),
(98, 'data_types', 'display_name_singular', 26, 'uz', 'Smartphone', '2018-09-02 09:42:56', '2018-09-02 09:42:56'),
(99, 'data_types', 'display_name_plural', 26, 'ru', 'Smartphones', '2018-09-02 09:42:56', '2018-09-02 09:42:56'),
(100, 'data_types', 'display_name_plural', 26, 'uz', 'Smartphones', '2018-09-02 09:42:56', '2018-09-02 09:42:56'),
(101, 'menu_items', 'title', 37, 'ru', 'Phoneproccessors', '2018-09-03 06:05:26', '2018-09-03 06:05:26'),
(102, 'menu_items', 'title', 37, 'uz', 'Phoneproccessors', '2018-09-03 06:05:26', '2018-09-03 06:05:26'),
(103, 'menu_items', 'title', 38, 'ru', 'Phonebrands', '2018-09-03 06:05:52', '2018-09-03 06:05:52'),
(104, 'menu_items', 'title', 38, 'uz', 'Phonebrands', '2018-09-03 06:05:52', '2018-09-03 06:05:52'),
(105, 'data_types', 'display_name_singular', 30, 'ru', 'New Computer', '2018-09-08 01:26:50', '2018-09-08 01:26:50'),
(106, 'data_types', 'display_name_singular', 30, 'uz', 'New Computer', '2018-09-08 01:26:50', '2018-09-08 01:26:50'),
(107, 'data_types', 'display_name_plural', 30, 'ru', 'New Computers', '2018-09-08 01:26:50', '2018-09-08 01:26:50'),
(108, 'data_types', 'display_name_plural', 30, 'uz', 'New Computers', '2018-09-08 01:26:50', '2018-09-08 01:26:50'),
(109, 'data_types', 'display_name_singular', 31, 'ru', 'New Notebook', '2018-09-08 01:38:19', '2018-09-08 01:38:19'),
(110, 'data_types', 'display_name_singular', 31, 'uz', 'New Notebook', '2018-09-08 01:38:19', '2018-09-08 01:38:19'),
(111, 'data_types', 'display_name_plural', 31, 'ru', 'New Notebooks', '2018-09-08 01:38:19', '2018-09-08 01:38:19'),
(112, 'data_types', 'display_name_plural', 31, 'uz', 'New Notebooks', '2018-09-08 01:38:19', '2018-09-08 01:38:19'),
(113, 'data_types', 'display_name_singular', 32, 'ru', 'New Smartphone', '2018-09-08 01:48:49', '2018-09-08 01:48:49'),
(114, 'data_types', 'display_name_singular', 32, 'uz', 'New Smartphone', '2018-09-08 01:48:49', '2018-09-08 01:48:49'),
(115, 'data_types', 'display_name_plural', 32, 'ru', 'New Smartphones', '2018-09-08 01:48:49', '2018-09-08 01:48:49'),
(116, 'data_types', 'display_name_plural', 32, 'uz', 'New Smartphones', '2018-09-08 01:48:49', '2018-09-08 01:48:49'),
(117, 'menu_items', 'title', 42, 'ru', '', '2018-09-08 01:50:17', '2018-09-08 01:50:17'),
(118, 'menu_items', 'title', 42, 'uz', 'Yangi tovar', '2018-09-08 01:50:17', '2018-09-19 05:51:53'),
(119, 'data_types', 'display_name_singular', 33, 'ru', 'Top Computer', '2018-09-08 23:44:05', '2018-09-08 23:44:05'),
(120, 'data_types', 'display_name_singular', 33, 'uz', 'Top Computer', '2018-09-08 23:44:05', '2018-09-08 23:44:05'),
(121, 'data_types', 'display_name_plural', 33, 'ru', 'Top Computers', '2018-09-08 23:44:05', '2018-09-08 23:44:05'),
(122, 'data_types', 'display_name_plural', 33, 'uz', 'Top Computers', '2018-09-08 23:44:05', '2018-09-08 23:44:05'),
(123, 'data_types', 'display_name_singular', 34, 'ru', 'Top Notebook', '2018-09-08 23:45:06', '2018-09-08 23:45:06'),
(124, 'data_types', 'display_name_singular', 34, 'uz', 'Top Notebook', '2018-09-08 23:45:06', '2018-09-08 23:45:06'),
(125, 'data_types', 'display_name_plural', 34, 'ru', 'Top Notebooks', '2018-09-08 23:45:06', '2018-09-08 23:45:06'),
(126, 'data_types', 'display_name_plural', 34, 'uz', 'Top Notebooks', '2018-09-08 23:45:06', '2018-09-08 23:45:06'),
(127, 'data_types', 'display_name_singular', 35, 'ru', 'Top Smartphone', '2018-09-08 23:46:16', '2018-09-08 23:46:16'),
(128, 'data_types', 'display_name_singular', 35, 'uz', 'Top Smartphone', '2018-09-08 23:46:16', '2018-09-08 23:46:16'),
(129, 'data_types', 'display_name_plural', 35, 'ru', 'Top Smartphones', '2018-09-08 23:46:16', '2018-09-08 23:46:16'),
(130, 'data_types', 'display_name_plural', 35, 'uz', 'Top Smartphones', '2018-09-08 23:46:16', '2018-09-08 23:46:16'),
(131, 'menu_items', 'title', 46, 'ru', '', '2018-09-08 23:49:22', '2018-09-08 23:49:22'),
(132, 'menu_items', 'title', 46, 'uz', 'Top tovar', '2018-09-08 23:49:22', '2018-09-19 05:52:08'),
(133, 'processors', 'name', 1, 'ru', 'core i3 ru', '2018-09-09 08:15:34', '2018-09-09 08:15:34'),
(134, 'processors', 'name', 1, 'uz', 'core i3 uz', '2018-09-09 08:15:34', '2018-09-09 08:15:34'),
(135, 'processors', 'name', 3, 'ru', 'фыва', '2018-09-12 09:07:27', '2018-09-12 09:07:27'),
(136, 'processors', 'name', 3, 'uz', 'amd', '2018-09-12 09:07:27', '2018-09-12 09:07:27'),
(137, 'processors', 'description', 3, 'ru', '<p>ывап</p>', '2018-09-12 09:07:27', '2018-09-12 09:07:27'),
(138, 'processors', 'description', 3, 'uz', '<p>zo\'r</p>', '2018-09-12 09:07:27', '2018-09-12 09:07:27'),
(139, 'menu_items', 'title', 4, 'ru', 'Roles', '2018-09-19 05:43:54', '2018-09-19 05:43:54'),
(140, 'menu_items', 'title', 4, 'uz', 'Rollar', '2018-09-19 05:43:55', '2018-09-19 05:43:55'),
(141, 'menu_items', 'title', 3, 'ru', 'Users', '2018-09-19 05:44:37', '2018-09-19 05:44:37'),
(142, 'menu_items', 'title', 3, 'uz', 'Foydalanuvchilar', '2018-09-19 05:44:37', '2018-09-19 05:44:37'),
(143, 'menu_items', 'title', 10, 'ru', 'Settings', '2018-09-19 05:45:18', '2018-09-19 05:45:18'),
(144, 'menu_items', 'title', 10, 'uz', 'Sozlamalar', '2018-09-19 05:45:19', '2018-09-19 05:45:19'),
(145, 'menu_items', 'title', 5, 'ru', 'Tools', '2018-09-19 05:45:50', '2018-09-19 05:45:50'),
(146, 'menu_items', 'title', 5, 'uz', 'Uskunalar', '2018-09-19 05:45:50', '2018-09-19 05:45:50'),
(147, 'menu_items', 'title', 6, 'ru', 'Menu Builder', '2018-09-19 05:46:45', '2018-09-19 05:46:45'),
(148, 'menu_items', 'title', 6, 'uz', 'Menyu quruvchi', '2018-09-19 05:46:45', '2018-09-19 05:46:45'),
(157, 'menu_items', 'title', 50, 'ru', 'Notifications', '2018-09-24 05:58:25', '2018-09-24 05:58:25'),
(158, 'menu_items', 'title', 50, 'uz', 'Notifications', '2018-09-24 05:58:25', '2018-09-24 05:58:25'),
(159, 'data_types', 'display_name_singular', 39, 'ru', 'Notification', '2018-09-24 06:01:16', '2018-09-24 06:01:16'),
(160, 'data_types', 'display_name_singular', 39, 'uz', 'Notification', '2018-09-24 06:01:16', '2018-09-24 06:01:16'),
(161, 'data_types', 'display_name_plural', 39, 'ru', 'Notifications', '2018-09-24 06:01:16', '2018-09-24 06:01:16'),
(162, 'data_types', 'display_name_plural', 39, 'uz', 'Notifications', '2018-09-24 06:01:16', '2018-09-24 06:01:16'),
(163, 'menu_items', 'title', 1, 'ru', 'Dashboard', '2018-09-24 06:11:22', '2018-09-24 06:11:22'),
(164, 'menu_items', 'title', 1, 'uz', 'Dashboard', '2018-09-24 06:11:22', '2018-09-24 06:11:22'),
(165, 'rams', 'name', 3, 'ru', 'ddr4', '2018-09-25 02:45:37', '2018-09-25 02:45:37'),
(166, 'rams', 'name', 3, 'uz', 'ddr4', '2018-09-25 02:45:37', '2018-09-25 02:45:37'),
(167, 'rams', 'price', 3, 'ru', '1000', '2018-09-25 02:45:37', '2018-09-25 02:45:37'),
(168, 'rams', 'price', 3, 'uz', '1000', '2018-09-25 02:45:37', '2018-09-25 02:45:37'),
(169, 'rams', 'name', 2, 'ru', 'DDR II 4GB', '2018-09-25 02:45:54', '2018-09-25 02:45:54'),
(170, 'rams', 'name', 2, 'uz', 'DDR II 4GB', '2018-09-25 02:45:54', '2018-09-25 02:45:54'),
(171, 'rams', 'price', 2, 'ru', '111111', '2018-09-25 02:45:54', '2018-09-25 02:45:54'),
(172, 'rams', 'price', 2, 'uz', '111111', '2018-09-25 02:45:54', '2018-09-25 02:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$YtV2ieTLcNDgO2rQsX5afuPoT7xRDsFw7KvGX6guIjbPkbfhYsCHa', 'yohx8QIDSTMTy4vswqhwIBhgWL3owhQFl7FwoYpCG6Z1OVeaV65pRkQMmP7B', '{\"locale\":\"ru\"}', '2018-08-14 04:20:42', '2018-09-24 05:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_cards`
--

DROP TABLE IF EXISTS `video_cards`;
CREATE TABLE IF NOT EXISTS `video_cards` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_cards`
--

INSERT INTO `video_cards` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'video1', 11000, '2018-08-22 03:54:26', '2018-08-22 03:54:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
