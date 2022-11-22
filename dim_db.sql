-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 10:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dim_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applied_images`
--

CREATE TABLE `applied_images` (
  `apImgID` bigint(20) UNSIGNED NOT NULL,
  `placeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqImgWidth` double UNSIGNED DEFAULT NULL,
  `reqImgHeight` double UNSIGNED DEFAULT NULL,
  `imgResUnit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surfaceDepth` double DEFAULT NULL,
  `imageScale` double DEFAULT NULL,
  `imageRotation` double DEFAULT NULL,
  `positionX` double DEFAULT NULL,
  `positionY` double DEFAULT NULL,
  `positionZ` double DEFAULT NULL,
  `rotationX` double DEFAULT NULL,
  `rotationY` double DEFAULT NULL,
  `rotationZ` double DEFAULT NULL,
  `prvID` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applied_images`
--

INSERT INTO `applied_images` (`apImgID`, `placeName`, `reqImgWidth`, `reqImgHeight`, `imgResUnit`, `surfaceDepth`, `imageScale`, `imageRotation`, `positionX`, `positionY`, `positionZ`, `rotationX`, `rotationY`, `rotationZ`, `prvID`, `created_at`, `updated_at`) VALUES
(1, 'front', 5, 7, 'in', 1.01898, 4.67532, NULL, 0, -2.2683556500291355, 0.4512704948979602, 0.00000000004654687300911084, -0.07902867126469228, 0, 1, '2022-10-09 23:27:28', '2022-10-09 23:37:53'),
(2, 'back', 5, 7, 'in', 1.01898, 3.91608, NULL, 0.12039565565656528, -2.280567290090121, -5.539194333728897, 3.1415926535432552, 0.07901314415626286, 3.141592653589793, 1, '2022-10-09 23:27:28', '2022-10-09 23:37:53'),
(3, 'front', 7, 5, 'in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(4, 'back', 7, 5, 'in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(5, 'front', 7, 5, 'in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2022-10-09 23:52:43', '2022-10-09 23:52:43'),
(6, 'back', 7, 5, 'in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2022-10-09 23:52:43', '2022-10-09 23:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `canvases`
--

CREATE TABLE `canvases` (
  `cvID` bigint(20) UNSIGNED NOT NULL,
  `width` double UNSIGNED NOT NULL,
  `height` double UNSIGNED NOT NULL,
  `canvasData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`canvasData`)),
  `thumbnail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canvas_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `canvas_sizes`
--

CREATE TABLE `canvas_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sizeName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` double UNSIGNED NOT NULL,
  `width` double UNSIGNED NOT NULL,
  `unit` enum('px','mm','cm','in') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `total_amount` bigint(20) NOT NULL,
  `itemType` enum('product','design','package','offer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prID` bigint(20) UNSIGNED DEFAULT NULL,
  `dsID` bigint(20) UNSIGNED DEFAULT NULL,
  `pkgID` bigint(20) UNSIGNED DEFAULT NULL,
  `ofrID` bigint(20) UNSIGNED DEFAULT NULL,
  `spID` bigint(20) UNSIGNED NOT NULL,
  `oID` bigint(20) UNSIGNED DEFAULT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `quantity`, `total_amount`, `itemType`, `prID`, `dsID`, `pkgID`, `ofrID`, `spID`, `oID`, `uID`, `created_at`, `updated_at`) VALUES
(1, 1, 300, 'offer', NULL, NULL, NULL, 1, 1, 1, 1, '2022-10-09 22:48:14', '2022-10-09 22:48:27'),
(2, 1, 1700, 'product', 7, NULL, NULL, NULL, 4, 2, 1, '2022-10-09 23:59:11', '2022-10-09 23:59:53'),
(3, 1, 500, 'design', NULL, 5, NULL, NULL, 1, 3, 1, '2022-10-09 23:59:29', '2022-10-09 23:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cID` bigint(20) UNSIGNED NOT NULL,
  `cName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cID`, `cName`, `cType`, `created_at`, `updated_at`) VALUES
(1, 'shirt', 'product', '2022-10-09 22:22:15', '2022-10-09 22:22:15'),
(2, 'mug', 'product', '2022-10-09 22:22:27', '2022-10-09 22:22:27'),
(3, 'bottle', 'product', '2022-10-09 22:22:41', '2022-10-09 22:22:41'),
(4, 'cap', 'product', '2022-10-09 22:22:54', '2022-10-09 22:22:54'),
(5, 'calendar', 'product', '2022-10-09 22:23:12', '2022-10-09 22:23:12'),
(6, 'pamphlet', 'product', '2022-10-09 22:23:30', '2022-10-09 22:23:30'),
(7, 'infographics', 'design', '2022-10-09 22:23:53', '2022-10-09 22:23:53'),
(8, 'art', 'design', '2022-10-09 22:24:04', '2022-10-09 22:24:04'),
(9, 'logo', 'design', '2022-10-09 22:24:14', '2022-10-09 22:24:14'),
(10, 'neon', 'design', '2022-10-09 22:24:24', '2022-10-09 22:24:24'),
(11, 'minimalist', 'design', '2022-10-09 22:24:40', '2022-10-09 22:24:40'),
(12, 'post', 'design', '2022-10-09 22:24:49', '2022-10-09 22:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_from` int(11) NOT NULL,
  `send_to` int(11) NOT NULL,
  `many_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `message`, `send_from`, `send_to`, `many_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'fvdfv', 3, 2, 1, '2022-11-15 09:05:33', '2022-11-15 09:05:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_many`
--

CREATE TABLE `chat_many` (
  `many_id` bigint(20) UNSIGNED NOT NULL,
  `send_from` int(11) NOT NULL,
  `send_to` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_many`
--

INSERT INTO `chat_many` (`many_id`, `send_from`, `send_to`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2022-11-15 09:05:21', '2022-11-15 09:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `credit_cards`
--

CREATE TABLE `credit_cards` (
  `c_id` bigint(20) UNSIGNED NOT NULL,
  `credit_card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credit_cards`
--

INSERT INTO `credit_cards` (`c_id`, `credit_card_number`, `card_title`, `exp_date`, `uID`, `created_at`, `updated_at`) VALUES
(1, '4242424242424242', 'dani', '2023', 1, '2022-10-09 22:48:59', '2022-10-09 22:48:59'),
(2, '4242424242424242', 'dani', '2023', 1, '2022-10-10 00:00:17', '2022-10-10 00:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `custom_images`
--

CREATE TABLE `custom_images` (
  `custImgID` bigint(20) UNSIGNED NOT NULL,
  `custImgName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apImgID` bigint(20) UNSIGNED NOT NULL,
  `cItemID` bigint(20) UNSIGNED NOT NULL,
  `oID` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designers`
--

CREATE TABLE `designers` (
  `dID` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `followerCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `spID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designers`
--

INSERT INTO `designers` (`dID`, `title`, `bio`, `followerCount`, `spID`, `created_at`, `updated_at`) VALUES
(1, 'Designer', 'HI, I\'m a professional Designer', 0, 1, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(2, 'Designer', 'Can design arts like you can see. Contact me for more details', 0, 3, '2022-10-09 23:45:32', '2022-10-09 23:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `designs`
--

CREATE TABLE `designs` (
  `dsID` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dStars` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double UNSIGNED NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designs`
--

INSERT INTO `designs` (`dsID`, `title`, `category`, `dStars`, `price`, `desc`, `dID`, `created_at`, `updated_at`) VALUES
(1, 'Beautiful art', 'art', NULL, 300, 'Can design arts like you can see. Contact me for more details', 1, '2022-10-09 23:04:11', '2022-10-09 23:04:33'),
(4, 'Info', 'infographics', NULL, 500, 'Can design arts like you can see. Contact me for more details', 1, '2022-10-09 23:18:49', '2022-10-09 23:18:49'),
(5, 'DIM logo', 'logo', NULL, 500, 'Can design arts like you can see. Contact me for more details', 1, '2022-10-09 23:21:34', '2022-10-09 23:21:34'),
(6, 'Post for company', 'post', NULL, 900, 'Can design post like you can see. Contact me for more details', 2, '2022-10-09 23:46:32', '2022-10-09 23:46:32'),
(7, 'Minimalist logo', 'minimalist', NULL, 500, 'Can design logo like you can see. Contact me for more details', 2, '2022-10-09 23:47:26', '2022-10-09 23:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `design_images`
--

CREATE TABLE `design_images` (
  `imageID` bigint(20) UNSIGNED NOT NULL,
  `imageName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dsID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `design_images`
--

INSERT INTO `design_images` (`imageID`, `imageName`, `dsID`, `created_at`, `updated_at`) VALUES
(1, 'design1-image724437973185.png', 1, '2022-10-09 23:04:11', '2022-10-09 23:04:11'),
(2, 'design1-image925948305956.png', 1, '2022-10-09 23:04:11', '2022-10-09 23:04:11'),
(7, 'design1-image831022388971.png', 4, '2022-10-09 23:18:49', '2022-10-09 23:18:49'),
(8, 'design1-image567893055389.png', 4, '2022-10-09 23:18:49', '2022-10-09 23:18:49'),
(9, 'design1-image694461664815.png', 5, '2022-10-09 23:21:35', '2022-10-09 23:21:35'),
(10, 'design2-image1548800788560.jfif', 6, '2022-10-09 23:46:32', '2022-10-09 23:46:32'),
(11, 'design2-image1250698271192.jfif', 6, '2022-10-09 23:46:32', '2022-10-09 23:46:32'),
(12, 'design2-image847677018214.png', 7, '2022-10-09 23:47:26', '2022-10-09 23:47:26'),
(13, 'design2-image574555149870.jpg', 7, '2022-10-09 23:47:26', '2022-10-09 23:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `design_templates`
--

CREATE TABLE `design_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `o_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earning_profits`
--

CREATE TABLE `earning_profits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profit_amount` double(8,2) NOT NULL,
  `o_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `hire_requests`
--

CREATE TABLE `hire_requests` (
  `rID` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceProvider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` double UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hire_requests`
--

INSERT INTO `hire_requests` (`rID`, `title`, `serviceProvider`, `budget`, `description`, `attachment`, `uID`, `created_at`, `updated_at`) VALUES
(1, 'Need Logo', 'designer', 500, 'I want a logo form my company', '1665373533.png', 1, '2022-10-09 22:45:33', '2022-10-09 22:45:33');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_07_054728_create_roles_table', 1),
(6, '2022_06_07_065728_create_service_providers_table', 1),
(7, '2022_06_07_070712_create_designers_table', 1),
(8, '2022_06_07_071612_create_skills_table', 1),
(9, '2022_06_08_172338_create_vendors_table', 1),
(10, '2022_06_16_150235_add_profile_pic_to_users_table', 1),
(11, '2022_06_17_140211_create_designs_table', 1),
(12, '2022_06_17_140441_create_products_table', 1),
(13, '2022_06_17_171024_create_design_images_table', 1),
(14, '2022_06_17_174859_create_product_images_table', 1),
(15, '2022_07_02_070828_create_packages_table', 1),
(16, '2022_07_17_125037_add_address_columns_to_users_table', 1),
(17, '2022_07_25_050247_create_canvases_table', 1),
(18, '2022_07_25_050619_add_canvas_name_to_canvases_table', 1),
(19, '2022_07_25_051532_create_canvas_sizes_table', 1),
(20, '2022_07_25_051800_create_design_templates_table', 1),
(21, '2022_07_27_060803_create_shipping_details_table', 1),
(22, '2022_07_27_062519_create_payments_table', 1),
(23, '2022_07_27_072035_create_orders_table', 1),
(24, '2022_08_20_063601_create_hire_requests_table', 1),
(25, '2022_08_21_203854_create_credit_cards_table', 1),
(26, '2022_08_23_032310_create_web_feedback_table', 1),
(27, '2022_08_25_092520_create_chat_many_table', 1),
(28, '2022_08_25_099059_create_chat_table', 1),
(29, '2022_08_26_092405_create_offers_table', 1),
(30, '2022_08_26_122112_create_cart_items_table', 1),
(31, '2022_08_27_094904_create_categories_table', 1),
(32, '2022_08_29_173315_create_product_previews_table', 1),
(33, '2022_09_01_162817_create_verified_vendors_table', 1),
(34, '2022_09_01_175053_create_applied_images_table', 1),
(35, '2022_09_15_043730_add_image_columns_to_chat_table', 1),
(36, '2022_09_20_191747_create_payables_table', 1),
(37, '2022_09_20_192900_create_earning_profits_table', 1),
(38, '2022_09_21_094015_create_reviews_table', 1),
(39, '2022_09_25_175707_create_track__orders_table', 1),
(40, '2022_09_25_180124_create_disputes_table', 1),
(41, '2022_10_03_170332_create_custom_images_table', 1),
(42, '2022_10_09_111100_add_spid_to_payables_table', 1),
(43, '2022_10_09_111821_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `oID` bigint(20) UNSIGNED NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rID` bigint(20) UNSIGNED NOT NULL,
  `spID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`oID`, `time`, `price`, `description`, `rID`, `spID`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11T08:46', 300, 'I can design logo like this contact me for more detail', 1, 1, '2022-10-09 22:46:34', '2022-10-09 22:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `o_id` bigint(20) UNSIGNED NOT NULL,
  `o_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` bigint(20) UNSIGNED NOT NULL,
  `total_bill` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `spID` bigint(20) UNSIGNED DEFAULT NULL,
  `shipID` bigint(20) UNSIGNED DEFAULT NULL,
  `pymID` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `o_status`, `total_items`, `total_bill`, `uID`, `spID`, `shipID`, `pymID`, `created_at`, `updated_at`) VALUES
(1, 'placed', 1, 300, 1, 1, 1, 1, '2022-10-09 22:48:27', '2022-10-09 22:48:59'),
(2, 'placed', 1, 1700, 1, 4, 2, 2, '2022-10-09 23:59:53', '2022-10-10 00:00:17'),
(3, 'placed', 1, 500, 1, 1, 2, 2, '2022-10-09 23:59:53', '2022-10-10 00:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `pId` bigint(20) UNSIGNED NOT NULL,
  `packageName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packagePrice` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`pId`, `packageName`, `packagePrice`, `description`, `dID`, `created_at`, `updated_at`) VALUES
(2, 'PREMIUM', 500, '5 Design,\r\n3 Review,\r\n1 Days delivery', 1, '2022-10-09 22:28:57', '2022-10-09 22:28:57'),
(3, 'STANDERD', 800, '10 Design,\r\n3 Review,\r\n1 Days delivery', 1, '2022-10-09 22:29:18', '2022-10-09 22:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payables`
--

CREATE TABLE `payables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `spID` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` double UNSIGNED NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `stripe_payment_id`, `payment_method`, `payment_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'tok_1LrCz5GsNGYYKjd8nlDssg59', 'stripe', 300, 'paid', '2022-10-09 22:48:59', '2022-10-09 22:48:59'),
(2, 'tok_1LrE67GsNGYYKjd82QT2KjL7', 'stripe', 2200, 'paid', '2022-10-10 00:00:17', '2022-10-10 00:00:17');

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
  `prID` bigint(20) UNSIGNED NOT NULL,
  `pName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pStars` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double UNSIGNED NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `print_type` enum('customizable','non-customizable') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_custom_des` int(10) UNSIGNED DEFAULT NULL,
  `prvID` bigint(20) UNSIGNED DEFAULT NULL,
  `vID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prID`, `pName`, `category`, `pStars`, `price`, `desc`, `print_type`, `total_custom_des`, `prvID`, `vID`, `created_at`, `updated_at`) VALUES
(2, 'Magic Mug', 'mug', NULL, 800, 'Can print mugs as you can see. Contact me for more details', 'non-customizable', 0, NULL, 1, '2022-10-09 23:25:17', '2022-10-09 23:25:17'),
(3, 'Printed bottle', 'bottle', NULL, 1200, 'Can print logo or pic on your bottle as you can see. Contact me for more details', 'customizable', 2, 1, 1, '2022-10-09 23:27:28', '2022-10-09 23:37:53'),
(4, 'Printed cap', 'cap', NULL, 400, 'Can print cap like you can see. Contact me for more details', 'non-customizable', 0, NULL, 1, '2022-10-09 23:29:49', '2022-10-09 23:29:49'),
(5, 'Branded shirt', 'shirt', NULL, 2000, 'Can print shirt like you can see. Contact me for more details', 'customizable', 2, NULL, 1, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(6, 'Year calendar', 'calendar', NULL, 700, 'Can design calendar like you can see. Contact me for more details', 'non-customizable', 0, NULL, 2, '2022-10-09 23:49:27', '2022-10-09 23:49:27'),
(7, 'Branded shirt', 'shirt', NULL, 1700, 'Can print shirt like you can see. Contact me for more details', 'customizable', 2, NULL, 2, '2022-10-09 23:52:43', '2022-10-09 23:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `imageID` bigint(20) UNSIGNED NOT NULL,
  `imageName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`imageID`, `imageName`, `prID`, `created_at`, `updated_at`) VALUES
(3, 'product2-image806041943828.jfif', 2, '2022-10-09 23:25:17', '2022-10-09 23:25:17'),
(4, 'product2-image526258831168.png', 3, '2022-10-09 23:27:28', '2022-10-09 23:27:28'),
(5, 'product2-image694461812016.png', 3, '2022-10-09 23:27:28', '2022-10-09 23:27:28'),
(6, 'product2-image1292331813248.png', 3, '2022-10-09 23:27:28', '2022-10-09 23:27:28'),
(7, 'product2-image586212418528.jfif', 4, '2022-10-09 23:29:49', '2022-10-09 23:29:49'),
(8, 'product2-image1202401608458.jfif', 4, '2022-10-09 23:29:49', '2022-10-09 23:29:49'),
(9, 'product2-image446320818652.jfif', 4, '2022-10-09 23:29:49', '2022-10-09 23:29:49'),
(10, 'product2-image546243423776.png', 5, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(11, 'product2-image1124128997100.png', 5, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(12, 'product2-image1367273935732.png', 5, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(13, 'product2-image609527722872.jpg', 5, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(14, 'product3-image1367274818307.jfif', 6, '2022-10-09 23:49:27', '2022-10-09 23:49:27'),
(15, 'product3-image504609342201.jfif', 6, '2022-10-09 23:49:27', '2022-10-09 23:49:27'),
(16, 'product3-image1134121986927.jfif', 6, '2022-10-09 23:49:27', '2022-10-09 23:49:27'),
(17, 'product3-image1625408501488.png', 7, '2022-10-09 23:52:43', '2022-10-09 23:52:43'),
(18, 'product3-image349729288230.png', 7, '2022-10-09 23:52:43', '2022-10-09 23:52:43'),
(19, 'product3-image599535922680.jpg', 7, '2022-10-09 23:52:43', '2022-10-09 23:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_previews`
--

CREATE TABLE `product_previews` (
  `prvID` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cameraX` double NOT NULL DEFAULT 0,
  `cameraY` double NOT NULL DEFAULT 0,
  `cameraZ` double NOT NULL DEFAULT 10,
  `prID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_previews`
--

INSERT INTO `product_previews` (`prvID`, `model`, `cameraX`, `cameraY`, `cameraZ`, `prID`, `created_at`, `updated_at`) VALUES
(1, 'product2-model1665376623.glb', -0.4770966063761308, 1.909951168524812, -39.89648095944874, 3, '2022-10-09 23:27:28', '2022-10-09 23:37:53'),
(2, NULL, 0, 0, 10, 5, '2022-10-09 23:31:32', '2022-10-09 23:31:32'),
(3, NULL, 0, 0, 10, 7, '2022-10-09 23:52:43', '2022-10-09 23:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `revId` bigint(20) UNSIGNED NOT NULL,
  `stars` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prId` bigint(20) UNSIGNED DEFAULT NULL,
  `dsID` bigint(20) UNSIGNED DEFAULT NULL,
  `o_id` bigint(20) UNSIGNED DEFAULT NULL,
  `uID` bigint(20) UNSIGNED DEFAULT NULL,
  `spID` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `role`, `uID`, `created_at`, `updated_at`) VALUES
(1, 'customer', 1, '2022-10-09 22:19:31', '2022-10-09 22:19:31'),
(2, 'admin', 1, '2022-10-10 03:20:01', '2022-10-10 03:20:01'),
(3, 'customer', 2, '2022-10-09 22:25:43', '2022-10-09 22:25:43'),
(4, 'designer', 2, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(5, 'vendor', 2, '2022-10-09 23:22:44', '2022-10-09 23:22:44'),
(6, 'customer', 3, '2022-10-09 23:44:29', '2022-10-09 23:44:29'),
(7, 'designer', 3, '2022-10-09 23:45:32', '2022-10-09 23:45:32'),
(8, 'vendor', 3, '2022-10-09 23:48:22', '2022-10-09 23:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `spID` bigint(20) UNSIGNED NOT NULL,
  `spName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLogo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spRating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `roleID` bigint(20) UNSIGNED NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`spID`, `spName`, `businessLogo`, `spRating`, `roleID`, `uID`, `created_at`, `updated_at`) VALUES
(1, 'dani_graphics', NULL, 0, 4, 2, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(2, 'dani_printer', NULL, 0, 5, 2, '2022-10-09 23:22:44', '2022-10-09 23:22:44'),
(3, 'Taimoor Graaphiczs', NULL, 0, 7, 3, '2022-10-09 23:45:32', '2022-10-09 23:45:32'),
(4, 'Taimoor_printer', NULL, 0, 8, 3, '2022-10-09 23:48:22', '2022-10-09 23:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_details`
--

CREATE TABLE `shipping_details` (
  `shID` bigint(20) UNSIGNED NOT NULL,
  `sh_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sh_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_details`
--

INSERT INTO `shipping_details` (`shID`, `sh_address`, `sh_zipcode`, `sh_city`, `sh_country`, `sh_phone`, `created_at`, `updated_at`) VALUES
(1, 'Qilla Didar Singh', '52330', 'Gujranwala', 'Pakistan', '03484970343', '2022-10-09 22:48:27', '2022-10-09 22:48:27'),
(2, 'Qilla Didar Singh', '52330', 'Gujranwala', 'Pakistan', '03484970343', '2022-10-09 23:59:53', '2022-10-09 23:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `sID` bigint(20) UNSIGNED NOT NULL,
  `skillTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`sID`, `skillTitle`, `dID`, `created_at`, `updated_at`) VALUES
(1, 'logo designing', 1, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(2, 'minimalst', 1, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(3, 'neon', 1, '2022-10-09 22:27:06', '2022-10-09 22:27:06'),
(4, 'Photoshop', 2, '2022-10-09 23:45:32', '2022-10-09 23:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `track__orders`
--

CREATE TABLE `track__orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_days` int(11) NOT NULL,
  `o_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `currentBalance` double NOT NULL,
  `bankName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spID` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uID` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('M','F','O') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uID`, `first_name`, `last_name`, `gender`, `email`, `phone`, `country`, `address`, `password`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `profile_pic`, `zipcode`, `city`) VALUES
(1, 'arslan', 'ahmad', 'M', 'arslan@gmail.com', NULL, 'Azerbaijan', NULL, '$2y$10$SOqk7g90w/LX8qw989WNeeJC./aJIiW8cKLaJ/rLzuaqpAPpD9ys.', 'running', NULL, NULL, '2022-10-09 22:19:31', '2022-10-09 22:19:31', NULL, NULL, NULL),
(2, 'Danial', 'Asif', 'M', '181400044@gift.edu.pk', NULL, NULL, NULL, '$2y$10$9tvfMRhsdy5jdCNZU98dg.c/MjXOxQ36cf/boWytD3QVoUInMpYFq', 'running', NULL, NULL, '2022-10-09 22:25:43', '2022-10-09 22:25:43', NULL, NULL, NULL),
(3, 'Taimoor', 'Hamza', 'M', '181400106@gift.edu.pk', NULL, NULL, NULL, '$2y$10$7xOoYVGdhO996JMCZM6CrOKesO2LmtvVS4DOFSrJTz0UapfUl89vu', 'running', NULL, NULL, '2022-10-09 23:44:29', '2022-10-09 23:44:29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vID` bigint(20) UNSIGNED NOT NULL,
  `cnicNo` bigint(20) NOT NULL,
  `cnicFront` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnicBack` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vID`, `cnicNo`, `cnicFront`, `cnicBack`, `spID`, `created_at`, `updated_at`) VALUES
(1, 3410159404516, 'cnicF-u2-dim1665375764.jpg', 'cnicB-u2-dim1665375764.jpg', 2, '2022-10-09 23:22:44', '2022-10-09 23:22:44'),
(2, 3410159404516, 'cnicF-u3-dim1665377302.jpg', 'cnicB-u3-dim1665377302.jpg', 4, '2022-10-09 23:48:22', '2022-10-09 23:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `verified_vendors`
--

CREATE TABLE `verified_vendors` (
  `vvID` bigint(20) UNSIGNED NOT NULL,
  `cnicFront` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnicBack` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_feedback`
--

CREATE TABLE `web_feedback` (
  `fID` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applied_images`
--
ALTER TABLE `applied_images`
  ADD PRIMARY KEY (`apImgID`),
  ADD KEY `applied_images_prvid_foreign` (`prvID`);

--
-- Indexes for table `canvases`
--
ALTER TABLE `canvases`
  ADD PRIMARY KEY (`cvID`),
  ADD KEY `canvases_uid_foreign` (`uID`);

--
-- Indexes for table `canvas_sizes`
--
ALTER TABLE `canvas_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_items_prid_foreign` (`prID`),
  ADD KEY `cart_items_dsid_foreign` (`dsID`),
  ADD KEY `cart_items_oid_foreign` (`oID`),
  ADD KEY `cart_items_uid_foreign` (`uID`),
  ADD KEY `cart_items_pkgid_foreign` (`pkgID`),
  ADD KEY `cart_items_ofrid_foreign` (`ofrID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_many_id_foreign` (`many_id`);

--
-- Indexes for table `chat_many`
--
ALTER TABLE `chat_many`
  ADD PRIMARY KEY (`many_id`);

--
-- Indexes for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `credit_cards_uid_foreign` (`uID`);

--
-- Indexes for table `custom_images`
--
ALTER TABLE `custom_images`
  ADD PRIMARY KEY (`custImgID`),
  ADD KEY `custom_images_oid_foreign` (`oID`),
  ADD KEY `custom_images_apimgid_foreign` (`apImgID`),
  ADD KEY `custom_images_citemid_foreign` (`cItemID`);

--
-- Indexes for table `designers`
--
ALTER TABLE `designers`
  ADD PRIMARY KEY (`dID`),
  ADD KEY `designers_spid_foreign` (`spID`);

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`dsID`),
  ADD KEY `designs_did_foreign` (`dID`);

--
-- Indexes for table `design_images`
--
ALTER TABLE `design_images`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `design_images_dsid_foreign` (`dsID`);

--
-- Indexes for table `design_templates`
--
ALTER TABLE `design_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `design_templates_cvid_foreign` (`cvID`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disputes_o_id_foreign` (`o_id`);

--
-- Indexes for table `earning_profits`
--
ALTER TABLE `earning_profits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earning_profits_o_id_foreign` (`o_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hire_requests`
--
ALTER TABLE `hire_requests`
  ADD PRIMARY KEY (`rID`),
  ADD KEY `hire_requests_uid_foreign` (`uID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`oID`),
  ADD KEY `offers_rid_foreign` (`rID`),
  ADD KEY `offers_spid_foreign` (`spID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `orders_uid_foreign` (`uID`),
  ADD KEY `orders_spid_foreign` (`spID`),
  ADD KEY `orders_shipid_foreign` (`shipID`),
  ADD KEY `orders_pymid_foreign` (`pymID`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `packages_did_foreign` (`dID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payables`
--
ALTER TABLE `payables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payables_spid_foreign` (`spID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

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
  ADD PRIMARY KEY (`prID`),
  ADD KEY `products_vid_foreign` (`vID`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `product_images_prid_foreign` (`prID`);

--
-- Indexes for table `product_previews`
--
ALTER TABLE `product_previews`
  ADD PRIMARY KEY (`prvID`),
  ADD KEY `product_previews_prid_foreign` (`prID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`revId`),
  ADD KEY `reviews_prid_foreign` (`prId`),
  ADD KEY `reviews_dsid_foreign` (`dsID`),
  ADD KEY `reviews_o_id_foreign` (`o_id`),
  ADD KEY `reviews_uid_foreign` (`uID`),
  ADD KEY `reviews_spid_foreign` (`spID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`),
  ADD KEY `roles_uid_foreign` (`uID`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`spID`),
  ADD UNIQUE KEY `service_providers_spname_unique` (`spName`),
  ADD KEY `service_providers_roleid_foreign` (`roleID`),
  ADD KEY `service_providers_uid_foreign` (`uID`);

--
-- Indexes for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD PRIMARY KEY (`shID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`sID`),
  ADD KEY `skills_did_foreign` (`dID`);

--
-- Indexes for table `track__orders`
--
ALTER TABLE `track__orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track__orders_o_id_foreign` (`o_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_spid_foreign` (`spID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uID`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vID`),
  ADD KEY `vendors_spid_foreign` (`spID`);

--
-- Indexes for table `verified_vendors`
--
ALTER TABLE `verified_vendors`
  ADD PRIMARY KEY (`vvID`),
  ADD KEY `verified_vendors_vid_foreign` (`vID`);

--
-- Indexes for table `web_feedback`
--
ALTER TABLE `web_feedback`
  ADD PRIMARY KEY (`fID`),
  ADD KEY `web_feedback_uid_foreign` (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applied_images`
--
ALTER TABLE `applied_images`
  MODIFY `apImgID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `canvases`
--
ALTER TABLE `canvases`
  MODIFY `cvID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `canvas_sizes`
--
ALTER TABLE `canvas_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_many`
--
ALTER TABLE `chat_many`
  MODIFY `many_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `c_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_images`
--
ALTER TABLE `custom_images`
  MODIFY `custImgID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designers`
--
ALTER TABLE `designers`
  MODIFY `dID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `dsID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `design_images`
--
ALTER TABLE `design_images`
  MODIFY `imageID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `design_templates`
--
ALTER TABLE `design_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earning_profits`
--
ALTER TABLE `earning_profits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hire_requests`
--
ALTER TABLE `hire_requests`
  MODIFY `rID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `oID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `o_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `pId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payables`
--
ALTER TABLE `payables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `imageID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_previews`
--
ALTER TABLE `product_previews`
  MODIFY `prvID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `revId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `spID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipping_details`
--
ALTER TABLE `shipping_details`
  MODIFY `shID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `sID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track__orders`
--
ALTER TABLE `track__orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verified_vendors`
--
ALTER TABLE `verified_vendors`
  MODIFY `vvID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_feedback`
--
ALTER TABLE `web_feedback`
  MODIFY `fID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applied_images`
--
ALTER TABLE `applied_images`
  ADD CONSTRAINT `applied_images_prvid_foreign` FOREIGN KEY (`prvID`) REFERENCES `product_previews` (`prvID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `canvases`
--
ALTER TABLE `canvases`
  ADD CONSTRAINT `canvases_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_dsid_foreign` FOREIGN KEY (`dsID`) REFERENCES `designs` (`dsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_ofrid_foreign` FOREIGN KEY (`ofrID`) REFERENCES `offers` (`oID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_oid_foreign` FOREIGN KEY (`oID`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_pkgid_foreign` FOREIGN KEY (`pkgID`) REFERENCES `packages` (`pId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_prid_foreign` FOREIGN KEY (`prID`) REFERENCES `products` (`prID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_items_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_many_id_foreign` FOREIGN KEY (`many_id`) REFERENCES `chat_many` (`many_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD CONSTRAINT `credit_cards_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_images`
--
ALTER TABLE `custom_images`
  ADD CONSTRAINT `custom_images_apimgid_foreign` FOREIGN KEY (`apImgID`) REFERENCES `applied_images` (`apImgID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `custom_images_citemid_foreign` FOREIGN KEY (`cItemID`) REFERENCES `cart_items` (`cart_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `custom_images_oid_foreign` FOREIGN KEY (`oID`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designers`
--
ALTER TABLE `designers`
  ADD CONSTRAINT `designers_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designs`
--
ALTER TABLE `designs`
  ADD CONSTRAINT `designs_did_foreign` FOREIGN KEY (`dID`) REFERENCES `designers` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_images`
--
ALTER TABLE `design_images`
  ADD CONSTRAINT `design_images_dsid_foreign` FOREIGN KEY (`dsID`) REFERENCES `designs` (`dsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_templates`
--
ALTER TABLE `design_templates`
  ADD CONSTRAINT `design_templates_cvid_foreign` FOREIGN KEY (`cvID`) REFERENCES `canvases` (`cvID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_o_id_foreign` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earning_profits`
--
ALTER TABLE `earning_profits`
  ADD CONSTRAINT `earning_profits_o_id_foreign` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hire_requests`
--
ALTER TABLE `hire_requests`
  ADD CONSTRAINT `hire_requests_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_rid_foreign` FOREIGN KEY (`rID`) REFERENCES `hire_requests` (`rID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offers_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_pymid_foreign` FOREIGN KEY (`pymID`) REFERENCES `payments` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_shipid_foreign` FOREIGN KEY (`shipID`) REFERENCES `shipping_details` (`shID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_did_foreign` FOREIGN KEY (`dID`) REFERENCES `designers` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payables`
--
ALTER TABLE `payables`
  ADD CONSTRAINT `payables_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_vid_foreign` FOREIGN KEY (`vID`) REFERENCES `vendors` (`vID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_prid_foreign` FOREIGN KEY (`prID`) REFERENCES `products` (`prID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_previews`
--
ALTER TABLE `product_previews`
  ADD CONSTRAINT `product_previews_prid_foreign` FOREIGN KEY (`prID`) REFERENCES `products` (`prID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_dsid_foreign` FOREIGN KEY (`dsID`) REFERENCES `designs` (`dsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_o_id_foreign` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_prid_foreign` FOREIGN KEY (`prId`) REFERENCES `products` (`prID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD CONSTRAINT `service_providers_roleid_foreign` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_providers_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_did_foreign` FOREIGN KEY (`dID`) REFERENCES `designers` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `track__orders`
--
ALTER TABLE `track__orders`
  ADD CONSTRAINT `track__orders_o_id_foreign` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_spid_foreign` FOREIGN KEY (`spID`) REFERENCES `service_providers` (`spID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verified_vendors`
--
ALTER TABLE `verified_vendors`
  ADD CONSTRAINT `verified_vendors_vid_foreign` FOREIGN KEY (`vID`) REFERENCES `vendors` (`vID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `web_feedback`
--
ALTER TABLE `web_feedback`
  ADD CONSTRAINT `web_feedback_uid_foreign` FOREIGN KEY (`uID`) REFERENCES `users` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
