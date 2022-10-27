-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2022 年 10 月 27 日 21:27
-- サーバのバージョン： 8.0.30
-- PHP のバージョン: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel_project`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bicycles`
--

CREATE TABLE `bicycles` (
  `bicycles_id` bigint UNSIGNED NOT NULL,
  `spots_id` int NOT NULL,
  `cameras_id` int NOT NULL,
  `labels_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `get_id` int NOT NULL,
  `bicycles_x_coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bicycles_y_coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bicycles_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bicycles_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `bicycles`
--

INSERT INTO `bicycles` (`bicycles_id`, `spots_id`, `cameras_id`, `labels_name`, `get_id`, `bicycles_x_coordinate`, `bicycles_y_coordinate`, `bicycles_status`, `bicycles_img`, `updated_at`, `created_at`) VALUES
(1760, 100, 100, 'A', 1, '541', '612', 'None', 'bicycle_imgs/100/1.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1762, 100, 100, 'A', 3, '251', '563', 'None', 'bicycle_imgs/100/3.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1763, 100, 100, 'A', 5, '57', '541', 'None', 'bicycle_imgs/100/5.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1764, 100, 100, 'A', 6, '134', '546', 'None', 'bicycle_imgs/100/6.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1765, 100, 100, 'A', 7, '344', '574', 'None', 'bicycle_imgs/100/7.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1767, 100, 100, 'A', 10, '474', '594', 'None', 'bicycle_imgs/100/10.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1768, 100, 100, 'A', 13, '417', '589', 'None', 'bicycle_imgs/100/13.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:40'),
(1770, 100, 100, 'A', 2, '596', '616', 'None', 'bicycle_imgs/100/2.jpg', '2022-10-27 21:25:29', '2022-10-27 21:24:51'),
(1772, 100, 100, 'A', 8, '1', '511', 'None', 'bicycle_imgs/100/8.jpg', '2022-10-27 21:25:29', '2022-10-27 21:25:23');

-- --------------------------------------------------------

--
-- テーブルの構造 `cameras`
--

CREATE TABLE `cameras` (
  `cameras_id` bigint UNSIGNED NOT NULL,
  `spots_id` int NOT NULL,
  `cameras_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cameras_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cameras_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cameras_count` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `cameras`
--

INSERT INTO `cameras` (`cameras_id`, `spots_id`, `cameras_name`, `cameras_url`, `cameras_status`, `cameras_count`, `updated_at`, `created_at`) VALUES
(100, 100, 'テスト用カメラA', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Run', 26, '2022-10-27 21:25:28', '2022-10-27 21:13:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
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
-- テーブルの構造 `labels`
--

CREATE TABLE `labels` (
  `labels_id` bigint UNSIGNED NOT NULL,
  `cameras_id` int NOT NULL,
  `labels_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `labels`
--

INSERT INTO `labels` (`labels_id`, `cameras_id`, `labels_json`, `updated_at`, `created_at`) VALUES
(1, 100, '[{\"label_mark\":\"A\",\"label_point1X\":0,\"label_point1Y\":350,\"label_point2X\":0,\"label_point2Y\":600,\"label_point3X\":625,\"label_point3Y\":675,\"label_point4X\":700,\"label_point4Y\":600}]', '2022-10-27 21:24:06', '2022-07-17 10:41:57');

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_11_170907_create_spots_table', 1),
(6, '2022_06_23_114913_create_labels_table', 1),
(7, '2022_06_23_115733_create_bicycles_table', 1),
(8, '2022_07_16_230953_create_violations_table', 1),
(9, '2022_07_17_185503_create_cameras_table', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(19, 'App\\Models\\User', 1, 'login:user1', '62288381ab0215f5b533f5f87f28e85bedb28e1d23062365a96ba3903869ee4a', '[\"*\"]', NULL, '2022-10-27 06:37:34', '2022-10-27 06:37:34'),
(22, 'App\\Models\\User', 2, 'login:user2', '1f40c2cabc61db4f50a34927de80f7c4b298d9126cf9f9cd412c5f907cd48e3f', '[\"*\"]', NULL, '2022-10-28 06:14:28', '2022-10-28 06:14:28'),
(23, 'App\\Models\\User', 100, 'login:user100', 'c009a5b026285d8817357034d2385c9746c29b011aa88d6a80d3a7a08a3ecf53', '[\"*\"]', NULL, '2022-10-28 06:16:31', '2022-10-28 06:16:31');

-- --------------------------------------------------------

--
-- テーブルの構造 `spots`
--

CREATE TABLE `spots` (
  `spots_id` bigint UNSIGNED NOT NULL,
  `users_id` int NOT NULL,
  `spots_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_count_day1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_count_week1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_count_month1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_count_month3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_over_time` int NOT NULL,
  `spots_max` int NOT NULL,
  `spots_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `spots`
--

INSERT INTO `spots` (`spots_id`, `users_id`, `spots_name`, `spots_latitude`, `spots_longitude`, `spots_address`, `spots_status`, `spots_count_day1`, `spots_count_week1`, `spots_count_month1`, `spots_count_month3`, `spots_over_time`, `spots_max`, `spots_img`, `updated_at`, `created_at`) VALUES
(100, 100, 'テスト用駐輪場A', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', 'None', 'None', 'None', 'None', 3600, 100, '画像のパスが入ります', '2022-10-27 21:15:30', '2022-10-27 21:12:30');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(100, 'TestUser', 'test@bunkyo.ac.jp', NULL, '$2y$10$0oOoRJLcapMR2LfBc9qVxOpkKGhI5jipZdKs28pEGUQC3xHEKTMTm', NULL, '2022-10-28 06:10:28', '2022-10-28 06:10:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `violations`
--

CREATE TABLE `violations` (
  `violations_id` bigint UNSIGNED NOT NULL,
  `spots_id` int NOT NULL,
  `cameras_id` int NOT NULL,
  `bicycles_id` int NOT NULL,
  `labels_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `violations_x_coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `violations_y_coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `violations_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `bicycles`
--
ALTER TABLE `bicycles`
  ADD PRIMARY KEY (`bicycles_id`);

--
-- テーブルのインデックス `cameras`
--
ALTER TABLE `cameras`
  ADD PRIMARY KEY (`cameras_id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`labels_id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- テーブルのインデックス `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- テーブルのインデックス `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`spots_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- テーブルのインデックス `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`violations_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `bicycles`
--
ALTER TABLE `bicycles`
  MODIFY `bicycles_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1774;

--
-- テーブルの AUTO_INCREMENT `cameras`
--
ALTER TABLE `cameras`
  MODIFY `cameras_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `labels`
--
ALTER TABLE `labels`
  MODIFY `labels_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルの AUTO_INCREMENT `spots`
--
ALTER TABLE `spots`
  MODIFY `spots_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- テーブルの AUTO_INCREMENT `violations`
--
ALTER TABLE `violations`
  MODIFY `violations_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
