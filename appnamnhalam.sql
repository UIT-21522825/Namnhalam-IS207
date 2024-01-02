-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 02, 2024 lúc 09:09 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `appnamnhalam`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 25, '2023-12-31 08:00:33', '2023-12-31 08:00:33'),
(6, 28, '2024-01-01 02:06:30', '2024-01-01 02:06:30'),
(7, 29, '2024-01-01 11:38:09', '2024-01-01 11:38:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_quantity` smallint(6) NOT NULL,
  `product_price` double NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Thực phẩm ăn liền', NULL, '2023-11-19 07:32:39', '2023-11-19 07:32:39'),
(3, 'Thực phẩm chế biến', NULL, '2023-12-27 01:17:52', '2023-12-27 01:17:52'),
(4, 'Thực phẩm đông lạnh', NULL, '2023-12-27 01:18:09', '2023-12-27 01:18:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(6, 4, 6, NULL, NULL),
(7, 4, 7, NULL, NULL),
(8, 4, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 4, 17, NULL, NULL),
(18, 4, 18, NULL, NULL),
(19, 4, 19, NULL, NULL),
(20, 3, 20, NULL, NULL),
(23, 3, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `expery_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `type`, `value`, `expery_date`, `created_at`, `updated_at`) VALUES
(1, 'noel', 'money', 10, '2024-01-03 17:00:00', '2023-11-19 07:34:34', '2024-01-01 11:26:34'),
(2, 'TET', 'money', 50000, '2024-02-09 17:00:00', '2023-12-27 06:50:01', '2024-01-01 11:26:20'),
(4, 'tt', 'money', 5, '2024-02-07 17:00:00', '2024-01-01 23:15:06', '2024-01-01 23:18:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `value` double NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon_user`
--

INSERT INTO `coupon_user` (`id`, `user_id`, `value`, `coupon_id`, `created_at`, `updated_at`) VALUES
(3, 25, 50000, 2, NULL, NULL),
(4, 25, 10, 1, NULL, NULL),
(5, 28, 50000, 2, NULL, NULL),
(6, 28, 10, 1, NULL, NULL),
(7, 29, 50000, 2, NULL, NULL),
(8, 28, 5, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `url`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(2, '1700404457.jpg', 1, 'App\\Models\\Product', '2023-11-19 07:34:17', '2023-11-19 07:34:17'),
(3, '1700404592.jpg', 2, 'App\\Models\\Product', '2023-11-19 07:36:32', '2023-11-19 07:36:32'),
(17, '1703666770.png', 3, 'App\\Models\\Product', '2023-12-27 01:46:10', '2023-12-27 01:46:10'),
(26, '1703673934.png', 4, 'App\\Models\\Product', '2023-12-27 03:54:17', '2023-12-27 03:54:17'),
(27, '1703674860.png', 5, 'App\\Models\\Product', '2023-12-27 04:01:00', '2023-12-27 04:01:00'),
(47, '1704126808.png', 25, 'App\\Models\\User', '2024-01-01 09:33:28', '2024-01-01 09:33:28'),
(48, '1704127055.png', 28, 'App\\Models\\User', '2024-01-01 09:37:36', '2024-01-01 09:37:36'),
(72, '1704132168.jpg', 20, 'App\\Models\\Product', '2024-01-01 11:03:57', '2024-01-01 11:03:57'),
(78, '1704132040.jpg', 19, 'App\\Models\\Product', '2024-01-01 11:05:12', '2024-01-01 11:05:12'),
(79, '1704131362.jpg', 13, 'App\\Models\\Product', '2024-01-01 11:05:34', '2024-01-01 11:05:34'),
(95, '1704131972.jpg', 18, 'App\\Models\\Product', '2024-01-01 11:09:51', '2024-01-01 11:09:51'),
(97, '1704131861.jpg', 17, 'App\\Models\\Product', '2024-01-01 11:10:19', '2024-01-01 11:10:19'),
(98, '1704131693.jpg', 16, 'App\\Models\\Product', '2024-01-01 11:10:38', '2024-01-01 11:10:38'),
(99, '1704131592.jpg', 15, 'App\\Models\\Product', '2024-01-01 11:10:52', '2024-01-01 11:10:52'),
(100, '1704131521.jpg', 14, 'App\\Models\\Product', '2024-01-01 11:11:12', '2024-01-01 11:11:12'),
(101, '1704131173.jpg', 12, 'App\\Models\\Product', '2024-01-01 11:11:40', '2024-01-01 11:11:40'),
(102, '1704131071.jpg', 11, 'App\\Models\\Product', '2024-01-01 11:12:04', '2024-01-01 11:12:04'),
(103, '1704130625.png', 6, 'App\\Models\\Product', '2024-01-01 11:12:27', '2024-01-01 11:12:27'),
(104, '1704130743.png', 7, 'App\\Models\\Product', '2024-01-01 11:12:44', '2024-01-01 11:12:44'),
(105, '1704130823.jpg', 8, 'App\\Models\\Product', '2024-01-01 11:12:57', '2024-01-01 11:12:57'),
(106, '1704130929.jpg', 9, 'App\\Models\\Product', '2024-01-01 11:13:12', '2024-01-01 11:13:12'),
(107, '1704130985.jpg', 10, 'App\\Models\\Product', '2024-01-01 11:13:31', '2024-01-01 11:13:31'),
(113, '1704175623.png', 22, 'App\\Models\\Product', '2024-01-01 23:07:03', '2024-01-01 23:07:03'),
(115, '1704175996.jpg', 23, 'App\\Models\\Product', '2024-01-01 23:13:44', '2024-01-01 23:13:44'),
(116, '1704132887.jpg', 21, 'App\\Models\\Product', '2024-01-01 23:19:08', '2024-01-01 23:19:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_30_171422_create_permission_tables', 1),
(7, '2023_10_31_091333_create_products_table', 1),
(8, '2023_10_31_091735_create_categories_table', 1),
(9, '2023_10_31_092809_create_product_details_table', 1),
(10, '2023_10_31_093423_create_images_table', 1),
(11, '2023_10_31_093755_create_carts_table', 1),
(12, '2023_10_31_094530_create_cart_products_table', 1),
(13, '2023_10_31_095124_create_coupons_table', 1),
(14, '2023_10_31_095508_create_orders_table', 1),
(15, '2023_10_31_100250_create_product_orders_table', 1),
(16, '2023_10_31_100739_create_coupon_user_table', 1),
(17, '2023_11_05_030246_refactor_field_parent_id_in_categories_table', 1),
(18, '2023_11_13_124613_refactor_field_in_cart_products_table', 1),
(19, '2023_11_19_125410_remove_order_id_coupon_user_table', 1),
(20, '2023_11_19_125714_add_payment_in_orders_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(27, 'App\\Models\\User', 25),
(28, 'App\\Models\\User', 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `total` double NOT NULL,
  `ship` double NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `note` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `status`, `total`, `ship`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `note`, `user_id`, `created_at`, `updated_at`, `payment`) VALUES
(11, 'Đã hủy', 69750, 20000, 'Thanh Tam', 'letam22269@gmail.com', '+84926499281', 'hcm', 'HCM', 25, '2024-01-01 01:56:10', '2024-01-01 11:28:19', 'monney'),
(12, 'Chờ đợi', 119750, 20000, 'Thanh Tam', 'letam22269@gmail.com', '+84926499281', 'hcm', 'HCM', 25, '2024-01-01 02:01:26', '2024-01-01 02:01:26', 'monney'),
(13, 'Chờ đợi', 119740, 20000, 'Thanh Tam', 'letam22269@gmail.com', '+84926499281', 'hcm', 'HCM', 25, '2024-01-01 02:03:37', '2024-01-01 02:03:37', 'monney'),
(14, 'Chờ đợi', 302500, 20000, 'Thanh Tam', 'letam22269@gmail.com', '+84926499281', 'a', 'HCM', 28, '2024-01-01 02:08:20', '2024-01-01 02:08:20', 'monney'),
(15, 'Chờ đợi', 252740, 20000, 'Thanh Tam', 'tam.le.dwitt@gmail.com', '+84926499281', '23', '1', 28, '2024-01-01 02:09:29', '2024-01-01 02:09:29', 'monney'),
(16, 'Chờ đợi', 219500, 20000, 'Thanh Tâm', '21522825@gm.uit.edu.vn', '0926499281', 'hcm', '123', 28, '2024-01-01 02:13:05', '2024-01-01 02:13:05', 'monney'),
(17, 'Chờ đợi', 119750, 20000, 'TEst', 's', '12345567', 'hcm', '1', 28, '2024-01-01 02:14:34', '2024-01-01 02:14:34', 'monney'),
(18, 'Chờ đợi', 119750, 20000, 'abc', 'abc', '12', '1', '1', 25, '2024-01-01 02:27:36', '2024-01-01 02:27:36', 'monney'),
(19, 'Chờ đợi', 96000, 20000, 'Thanh Tam', 'tam.le.dwitt@gmail.com', '+84926499281', 'hcm', 'a', 25, '2024-01-01 11:15:35', '2024-01-01 11:15:35', 'monney'),
(20, 'Chờ đợi', 53250, 20000, 'Thanh Tâm', '21522825@gm.uit.edu.vn', '0926499281', 'a', 'a', 25, '2024-01-01 11:18:20', '2024-01-01 11:18:20', 'monney'),
(21, 'Đã xác nhận', 46000, 20000, 'Tâm Lê', '21522825@gm.uit.edu.vn', '0926499281', 'hcm', 'HCM', 29, '2024-01-01 11:39:16', '2024-01-01 23:04:06', 'monney'),
(22, 'Chờ đợi', 53245, 20000, 'Thanh Tâm', '21522825@gm.uit.edu.vn', '0926499281', 'hcm', 'HCM', 28, '2024-01-01 23:18:35', '2024-01-01 23:18:35', 'monney');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('21522823@gm.uit.edu.vn', '$2y$10$A9oK.KwHorit3ktOJpmFnOZ5spLt/Lwckhw8rTE53vIlJAe5xStE6', '2023-12-28 00:34:33'),
('21522825@gm.uit.edu.vn', '$2y$10$O0vg6aRcI8Pw9rnxUxws4Ovlqp4D2yHgMWElaJClxSyLyAG9nMTAa', '2024-01-02 12:23:45'),
('letam22269@gmail.com', '$2y$10$r3jcFqmSxmHpb37/ir2AkurN2MqbHbnjpCXgNslJYPhyO966dK7t6', '2023-12-28 01:52:58'),
('ngockhaix22@gmail.com', '$2y$10$He0D1.C.jDF/ZMkS/Kexce2vS1eHrnCEAkgbSQbS54VPpfs.56OKe', '2023-12-31 06:48:46'),
('tam.le.dwitt@gmail.com', '$2y$10$t7yx.0SCvk7kbfmW513mo.S21fPOsnCYklwN0Ht2UDjSpZp1NBoJO', '2023-12-31 08:11:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `group` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `group`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create-user', 'Tạo người dùng', 'Người dùng', 'web', '2023-11-19 07:23:11', '2023-11-19 07:23:11'),
(2, 'update-user', 'Cập nhật người dùng', 'Người dùng', 'web', '2023-11-19 07:23:11', '2023-11-19 07:23:11'),
(3, 'show-user', 'Hiển thị người dùng', 'Người dùng', 'web', '2023-11-19 07:23:11', '2023-11-19 07:23:11'),
(4, 'delete-user', 'Xóa người dùng', 'Người dùng', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(5, 'create-role', 'Tạo vai trò', 'Vai trò', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(6, 'update-role', 'Cập nhật vai trò', 'Vai trò', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(7, 'show-role', 'Hiển thị vai trò', 'Vai trò', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(8, 'delete-role', 'Xóa vai trò', 'Vai trò', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(9, 'create-category', 'Tạo danh mục', 'Danh mục', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(10, 'update-category', 'Cập nhật danh mục', 'Danh mục', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(11, 'show-category', 'Hiển thị danh mục', 'Danh mục', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(12, 'delete-category', 'Xóa danh mục', 'Danh mục', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(13, 'create-product', 'Tạo sản phẩm', 'Sản phẩm', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(14, 'update-product', 'Cập nhật sản phẩm', 'Sản phẩm', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(15, 'show-product', 'Hiển thị sản phẩm', 'Sản phẩm', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(16, 'delete-product', 'Xóa sản phẩm', 'Sản phẩm', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(17, 'create-coupon', 'Tạo khuyến mãi', 'Khuyến mãi', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(18, 'update-coupon', 'Cập nhật khuyến mãi', 'Khuyến mãi', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(19, 'show-coupon', 'Hiển thị khuyến mãi', 'Khuyến mãi', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(20, 'delete-coupon', 'Xóa khuyến mãi', 'Khuyến mãi', 'web', '2023-11-19 07:23:12', '2023-11-19 07:23:12'),
(25, 'list-order', 'Hiển thị danh sách đơn hàng', 'Đơn hàng', 'web', '2023-12-03 23:06:26', '2023-12-03 23:06:26'),
(26, 'update-order-status', 'Cập nhật trạng thái đơn hàng', 'Đơn hàng', 'web', '2023-12-03 23:06:26', '2023-12-03 23:06:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sale` smallint(6) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `sale`, `price`, `created_at`, `updated_at`) VALUES
(6, 'Thịt gà chay Nấm nhà làm', '<p><strong>Thịt gà chay Nấm nhà làm</strong><br>HSD: 6 tháng<br>Hương vị đa dạng từ nấm đùi gà và tàu hủ ki tạo nên thịt gà chay đặc sắc, hoàn hảo cho việc chế biến các món xào, nước hoặc nướng.</p>', 5, 130000, '2024-01-01 10:37:05', '2024-01-01 10:47:59'),
(7, 'Thịt chay đa năng - Miếng', '<p><strong>Thịt chay đa năng - Miếng</strong><br>HSD: 2 tháng<br>Một sự kết hợp độc đáo giữa nấm kim châm, bột mì, đậu nành và các nguyên liệu khác, tạo nên loại thịt chay đa năng có thể dùng cho nhiều món ăn.</p>', 5, 110000, '2024-01-01 10:39:03', '2024-01-01 10:47:48'),
(8, 'Thịt chay đa năng - Viên', '<p><strong>Thịt chay đa năng - Viên</strong><br>HSD: 2 tháng<br>Một phiên bản khác của thịt chay, sản phẩm này mang đến sự tiện lợi và đa dạng trong việc sử dụng cho các món nước hoặc lẩu.</p>', 5, 110000, '2024-01-01 10:40:23', '2024-01-01 10:47:39'),
(9, 'Snack nấm bào ngư truyền thống', '<p><strong>Snack nấm bào ngư truyền thống</strong><br>HSD: 6 tháng<br>Hương vị đặc trưng của nấm bào ngư cùng với sự giòn ngon từ chế biến truyền thống tạo nên một trải nghiệm ẩm thực đậm đà và tiện lợi.</p>', 5, 40000, '2024-01-01 10:42:09', '2024-01-01 10:47:28'),
(10, 'Snack nấm bào ngư rong biển', '<p><strong>Snack nấm bào ngư rong biển</strong><br>HSD: 2 tháng<br>Một hành trình thưởng thức hương vị đặc trưng của nấm bào ngư kết hợp với vị ngọt dịu của rong biển sấy giòn, tạo nên một snack lành mạnh và sáng tạo cho mọi thời điểm trong ngày.</p>', 5, 45000, '2024-01-01 10:43:05', '2024-01-01 10:46:57'),
(11, 'Pate chay siêu thơm ngon', '<p><strong>Pate chay siêu thơm ngon</strong><br>HSD: 2 tháng<br>Sự kết hợp tinh tế giữa chân nấm đùi gà, tàu hủ, và đậu phộng tạo nên một loại pate chay không chỉ thơm ngon mà còn giàu dinh dưỡng, là điểm nhấn tuyệt vời cho bất kỳ món ăn nào.</p>', 2, 30000, '2024-01-01 10:44:31', '2024-01-01 10:46:42'),
(12, 'Muối tỏi nấm đông cô', '<p><strong>Muối tỏi nấm đông cô</strong><br>HSD: 12 tháng<br>Sự kết hợp giữa muối tỏi và nấm đông cô tạo ra một loại gia vị đa dạng, phù hợp cho việc tẩm ướp hoặc chấm ngoặc các món ăn đa dạng.</p>', 2, 29000, '2024-01-01 10:46:13', '2024-01-01 10:46:13'),
(13, 'Khô gà lá chanh chay', '<p><strong>Khô gà lá chanh chay</strong><br>HSD: 2 tháng<br>Sự kết hợp độc đáo giữa nấm bào ngư xám và hương vị tươi mát từ lá chanh, tạo nên một loại thực phẩm chay độc đáo và bổ dưỡng.</p>', 5, 50000, '2024-01-01 10:49:22', '2024-01-01 10:49:22'),
(14, 'Khô bò chay không cay', '<p><strong>Khô bò chay không cay</strong><br>HSD: 2 tháng<br>Đậm đà vị ngon của nấm hương được tinh chế hoàn hảo để tạo ra một món khô bò chay không cay, là sự lựa chọn lý tưởng cho những bữa tiệc nhẹ nhàng hoặc dùng làm món khai vị.</p>', 5, 54000, '2024-01-01 10:52:01', '2024-01-01 10:52:01'),
(15, 'Khô bò chay siêu cay', '<p><strong>Khô bò chay siêu cay</strong><br>HSD: 2 tháng<br>Một phiên bản cay hơn của món khô bò chay, với hương vị đặc trưng của nấm hương và vị cay nồng, là lựa chọn tuyệt vời cho những ai yêu thích hương vị đậm đà.</p>', 5, 58000, '2024-01-01 10:53:12', '2024-01-01 10:53:12'),
(16, 'Chà bông chay siêu ngon', '<p><strong>Chà bông chay siêu ngon</strong></p><p>HSD: 2&nbsp;<br>Chân nấm bào ngư được chế biến tinh tế thành một loại chà bông chay đặc sắc, hoàn hảo cho việc làm món nhấm nháp hấp dẫn và giàu dinh dưỡng.</p>', 5, 60000, '2024-01-01 10:54:53', '2024-01-01 10:54:53'),
(17, 'Chả mực lát chay Nấm nhà làm', '<p><strong>Chả mực lát chay Nấm nhà làm</strong><br>HSD: 2 tháng<br>Hòa quyện vị ngọt tự nhiên của nấm kim châm, cà rốt, nấm hương, và hành tây, sản phẩm này không chỉ là một loại chả mực chay thông thường, mà là một tác phẩm nghệ thuật ẩm thực đậm chất tự nhiên.</p>', 5, 94000, '2024-01-01 10:57:41', '2024-01-01 10:57:41'),
(18, 'Chả lụa chay truyền thống', '<p><strong>Chả lụa chay truyền thống</strong><br>HSD: 2 tháng<br>Một lựa chọn chả chay truyền thống từ nấm kim châm, giàu dinh dưỡng và thích hợp cho nhiều món ăn.</p>', 5, 70000, '2024-01-01 10:59:32', '2024-01-01 10:59:32'),
(19, 'Chả lụa hạt chia chay', '<p><strong>Chả lụa hạt chia chay</strong><br>HSD: 2 tháng<br>Hương vị đặc trưng từ nấm hương kết hợp với hạt chia tạo ra một loại chả lụa chay thơm ngon và giàu dinh dưỡng.</p>', 5, 80000, '2024-01-01 11:00:40', '2024-01-01 11:00:40'),
(20, 'Canh rong biển truyền thống - 6 gói', '<p><strong>Canh rong biển truyền thống 6 gói</strong><br>HSD: 12 tháng<br>Sự kết hợp giữa nấm rơm, rong biển sấy khô và các nguyên liệu khác tạo ra một loại canh chay đa dạng và tiện lợi.</p>', 2, 30000, '2024-01-01 11:02:48', '2024-01-01 11:02:48'),
(21, 'Canh rong biển thập cẩm - 6 gói', '<p><strong>Canh rong biển thập cẩm</strong><br>HSD: 12 tháng<br>Sự pha trộn giữa nấm rơm, nấm kim châm, rong biển và hành lá tạo nên một loại canh chay sấy khô đa dạng với nhiều hương vị đặc trưng.</p>', 5, 35000, '2024-01-01 11:14:47', '2024-01-01 23:19:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `size`, `quantity`, `product_id`, `created_at`, `updated_at`) VALUES
(37, '60g', 100, 20, NULL, NULL),
(43, '500g', 50, 19, NULL, NULL),
(44, '250g', 50, 13, NULL, NULL),
(60, '500g', 50, 18, NULL, NULL),
(62, '500g', 50, 17, NULL, NULL),
(63, '250g', 50, 16, NULL, NULL),
(64, '250g', 50, 15, NULL, NULL),
(65, '250g', 50, 14, NULL, NULL),
(66, '200g', 50, 12, NULL, NULL),
(67, '200g', 50, 11, NULL, NULL),
(68, '500g', 50, 6, NULL, NULL),
(69, '500g', 50, 7, NULL, NULL),
(70, '500g', 50, 8, NULL, NULL),
(71, '250g', 50, 9, NULL, NULL),
(72, '250g', 50, 10, NULL, NULL),
(81, '60g', 1, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_quantity` smallint(6) NOT NULL,
  `product_price` double NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `group` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `group`, `guard_name`, `created_at`, `updated_at`) VALUES
(27, 'admin', 'Quản trị viên', 'system', 'web', '2023-12-04 03:44:46', '2024-01-01 02:35:31'),
(28, 'employee', 'Nhân viên', 'system', 'web', '2023-12-04 03:44:46', '2024-01-01 02:35:55'),
(29, 'user', 'Người dùng', 'Hệ thống', 'web', '2023-12-04 03:44:46', '2023-12-04 03:44:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 27),
(2, 27),
(3, 27),
(4, 27),
(5, 27),
(6, 27),
(7, 27),
(8, 27),
(9, 27),
(9, 28),
(10, 27),
(10, 28),
(11, 27),
(11, 28),
(12, 27),
(12, 28),
(13, 27),
(13, 28),
(14, 27),
(14, 28),
(15, 27),
(15, 28),
(16, 27),
(16, 28),
(17, 27),
(18, 27),
(19, 27),
(20, 27),
(25, 27),
(25, 28),
(26, 27),
(26, 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `gender` varchar(255) NOT NULL DEFAULT 'Nam',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `address`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(25, 'Admin', '0926499281', 'admin@admin.com', 'HCM', 'Nữ', NULL, '$2y$10$P8rfcTo0LbiWk5NWS6xReuJhNoQNjlszSCBlL0cojnG1MgXm6zHoW', NULL, '2023-12-31 07:52:08', '2024-01-01 09:33:28', 27),
(28, 'Nhân viên', '0926499241', '21522825@gm.uit.edu.vn', 'HCM', 'Nữ', NULL, '$2y$10$RA2ou9fAvS3krqdPykrvkOq.zb5GHzN5k0/AaGIK0cgEcbYm8pgyO', 'INMaMZJKae1DlYG4V5gqLeuBQmWshzOMuCr4pHsFmygkF1WkBvh9xFxiU3xy', '2024-01-01 02:05:15', '2024-01-01 10:09:49', 28),
(29, 'Thanh Tam', '+84926499280', 'letam22269@gmail.com', 'HN', 'Nữ', NULL, '$2y$10$zDNSWZjUDRetVLzUvie9HumMcOtbhjqzwF/rgAOKC.KHyOI9g4TDS', NULL, '2024-01-01 11:37:58', '2024-01-01 11:37:58', 29);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_products_product_id_foreign` (`product_id`),
  ADD KEY `cart_products_cart_id_foreign` (`cart_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_name_unique` (`name`);

--
-- Chỉ mục cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_user_user_id_foreign` (`user_id`),
  ADD KEY `coupon_user_coupon_id_foreign` (`coupon_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_order_id_foreign` (`order_id`),
  ADD KEY `product_orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
