-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 12:45 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pasti_bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_product` int NOT NULL,
  `id_customer` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doorsmeers`
--

CREATE TABLE `doorsmeers` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `tipe_kendaraan` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doorsmeers`
--

INSERT INTO `doorsmeers` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama_lengkap`, `nomor_telepon`, `tipe_kendaraan`, `jenis`, `tanggal`, `waktu`, `status`) VALUES
(1, '2023-06-04 16:02:35', '2023-06-04 16:02:35', '2023-06-04 16:03:39', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(2, '2023-06-04 21:10:25', '2023-06-04 21:10:25', '2023-06-04 21:13:14', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(3, '2023-06-05 08:52:02', '2023-06-05 08:52:02', '2023-06-05 09:11:16', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(4, '2023-06-05 09:12:39', '2023-06-05 09:12:39', '2023-06-05 09:12:49', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(5, '2023-06-05 09:13:25', '2023-06-05 09:13:25', '2023-06-05 09:13:52', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(6, '2023-06-05 10:27:23', '2023-06-05 10:27:23', '2023-06-05 13:36:23', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(7, '2023-06-05 12:02:03', '2023-06-05 12:02:03', '2023-06-05 12:02:15', 'Krisna Saragih', '082167183919', 'Mobil', 'cuci mobil biasa', '2023-06-09', '12.00 - 14.00', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_28_163632_create_permission_tables', 1),
(6, '2023_04_11_171910_create_shop_table', 1),
(7, '2023_04_14_031511_create_rentals_table', 1),
(8, '2023_04_22_075102_create_services_table', 1),
(9, '2023_04_22_092111_create_doorsmeers_table', 1),
(10, '2023_04_23_093540_create_sarans_table', 1),
(11, '2023_05_13_111638_create_orders_table', 1),
(12, '2023_05_13_111647_create_order_ps_table', 1),
(13, '2023_05_13_113351_create_carts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama_customer` varchar(255) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama_customer`, `telepon`, `alamat`, `catatan`, `payment_method`, `status`, `gambar`) VALUES
(1, '2023-06-04 19:37:03', '2023-06-04 19:37:03', NULL, '', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(2, '2023-06-04 19:37:42', '2023-06-04 19:37:42', NULL, '', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(3, '2023-06-04 19:39:16', '2023-06-04 19:39:16', NULL, '', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(4, '2023-06-04 19:40:36', '2023-06-04 19:40:36', NULL, 'Krisna Saragih', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(5, '2023-06-04 21:16:31', '2023-06-04 21:16:31', NULL, 'Krisna Saragih', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(6, '2023-06-05 11:50:20', '2023-06-05 11:50:20', NULL, 'Krisna Saragih', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(7, '2023-06-05 13:18:51', '2023-06-05 13:18:51', NULL, 'Krisna Saragih', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg'),
(8, '2023-06-05 13:34:33', '2023-06-05 13:34:33', NULL, 'Krisna Saragih', '082167183919', 'Sawit Seberang', 'bisa cod?', 'Dana', 'Disetujui', 'oke.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_ps`
--

CREATE TABLE `order_ps` (
  `id` bigint UNSIGNED NOT NULL,
  `id_product` int NOT NULL,
  `id_order` bigint NOT NULL,
  `quantity` int NOT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `tanggal_rental` varchar(255) DEFAULT NULL,
  `tanggal_pengembalian` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama_lengkap`, `alamat`, `nomor_telepon`, `tanggal_rental`, `tanggal_pengembalian`, `type`, `status`) VALUES
(1, '2023-06-04 13:49:22', '2023-06-04 13:49:22', '2023-06-04 13:56:36', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(2, '2023-06-04 13:57:09', '2023-06-04 13:57:09', '2023-06-04 13:57:23', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(3, '2023-06-04 21:20:17', '2023-06-04 21:20:17', '2023-06-04 21:31:59', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(4, '2023-06-05 09:15:35', '2023-06-05 09:15:35', '2023-06-05 09:26:58', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(5, '2023-06-05 13:24:33', '2023-06-05 13:24:33', '2023-06-05 13:25:34', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(6, '2023-06-05 13:27:13', '2023-06-05 13:27:13', '2023-06-05 13:28:01', 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda'),
(7, '2023-06-05 13:39:37', '2023-06-05 13:39:37', NULL, 'Krisna Saragih', 'Sawit Seberang', '082167183919', '2023-06-08', '2023-06-12', 'Avanza Lama', 'Dtunda');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-05-25 23:39:30', '2023-05-25 23:39:30'),
(2, 'customer', 'web', '2023-05-25 23:39:30', '2023-05-25 23:39:30'),
(3, 'staff', 'web', '2023-05-25 23:39:30', '2023-05-25 23:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sarans`
--

CREATE TABLE `sarans` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `saran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sarans`
--

INSERT INTO `sarans` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama`, `nomor_telepon`, `saran`) VALUES
(1, '2023-06-04 11:49:35', '2023-06-04 11:49:35', NULL, 'pandy', '08123456789', 'bagus'),
(2, '2023-06-04 11:51:57', '2023-06-04 11:51:57', NULL, 'krisna', '082167183919', 'baik'),
(3, '2023-06-04 13:34:22', '2023-06-04 13:34:22', NULL, 'saragih', '082167183919', 'baik'),
(5, '2023-06-04 21:35:18', '2023-06-04 21:35:18', NULL, 'saragih', '082167183919', 'baik'),
(6, '2023-06-05 09:47:19', '2023-06-05 09:47:19', NULL, 'saragih', '082167183919', 'baik');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `layanan` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `tipe_mobil` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama_lengkap`, `layanan`, `nomor_telepon`, `tipe_mobil`, `tanggal`, `waktu`, `status`) VALUES
(1, '2023-06-04 16:26:04', '2023-06-04 16:26:04', '2023-06-05 13:18:17', 'Krisna Saragih', 'servis ac', '082167183919', 'Mobil avanza', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(2, '2023-06-04 21:44:49', '2023-06-04 21:44:49', '2023-06-04 21:56:52', 'Krisna Saragih', 'servis ac', '082167183919', 'Mobil avanza', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(3, '2023-06-05 09:28:57', '2023-06-05 09:28:57', '2023-06-05 09:40:08', 'Krisna Saragih', 'servis ac', '082167183919', 'Mobil avanza', '2023-06-09', '12.00 - 14.00', 'Diterima'),
(4, '2023-06-05 09:38:05', '2023-06-05 09:38:05', '2023-06-05 09:39:46', 'Krisna Saragih', 'servis ac', '082167183919', 'Mobil avanza', '2023-06-09', '12.00 - 14.00', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `stok` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `created_at`, `updated_at`, `deleted_at`, `nama`, `gambar`, `harga`, `stok`) VALUES
(1, '2023-06-04 17:15:14', '2023-06-04 17:46:33', '2023-06-04 18:00:34', 'Krisna saragih ', 'baik', 'baik', '4'),
(2, '2023-06-04 19:36:22', '2023-06-04 19:36:22', NULL, '', 'oke.jpg', '', ''),
(3, '2023-06-04 22:00:57', '2023-06-04 22:00:57', '2023-06-04 22:15:41', 'Krisna ', 'oke', '10000', '4'),
(4, '2023-06-05 13:19:32', '2023-06-05 13:19:32', NULL, 'Krisna ', 'oke', '10000', '4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$wwJGFvoHMjWSulmgwnqev.QOUl419Bpf2hZQ3.w/NZ8So/wX13Y5O', NULL, '2023-05-25 23:39:30', '2023-05-25 23:39:30', NULL),
(2, 'staff', 'staff', 'staff@gmail.com', NULL, '$2y$10$OT9vcAQcrW5wdFi63mXKSu6voNmQazN0ZWTsZOf0RdO/QbPktx/ky', NULL, '2023-05-25 23:39:30', '2023-05-25 23:39:30', '2023-06-04 22:20:51'),
(3, 'yosafat', 'Yosafat Tambun', 'yosafat@gmail.com', NULL, '$2y$10$xzTTOErgJRAcxo4dnsTBUu6hyUt4LcKSWZRswKLwgBiITRQZ6Ie3K', NULL, '2023-05-25 23:39:30', '2023-05-25 23:39:30', NULL),
(4, '', '', '', NULL, '', NULL, '2023-06-04 13:26:45', '2023-06-04 13:26:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doorsmeers`
--
ALTER TABLE `doorsmeers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doorsmeers_deleted_at` (`deleted_at`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_orders_deleted_at` (`deleted_at`);

--
-- Indexes for table `order_ps`
--
ALTER TABLE `order_ps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rentals_deleted_at` (`deleted_at`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sarans`
--
ALTER TABLE `sarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sarans_deleted_at` (`deleted_at`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_services_deleted_at` (`deleted_at`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_shops_deleted_at` (`deleted_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doorsmeers`
--
ALTER TABLE `doorsmeers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_ps`
--
ALTER TABLE `order_ps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sarans`
--
ALTER TABLE `sarans`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
