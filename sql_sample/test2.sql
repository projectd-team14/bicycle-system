-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2022 年 10 月 20 日 13:22
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
(8, 2, 'カメラA', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'None', 100, '2022-10-20 13:20:33', '2022-07-17 12:21:43'),
(9, 2, 'カメラB', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'None', 26, '2022-10-14 17:26:23', '2022-07-17 12:21:51'),
(10, 2, 'カメラC', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'None', 90, '2022-10-14 17:26:28', '2022-07-17 12:21:55'),
(11, 5, 'カメラA', 'aaaaaaa', 'None', 54, '2022-10-14 17:26:32', '2022-08-21 17:30:08'),
(12, 5, 'カメラB', 'bbbbb', 'None', 48, '2022-10-14 17:26:36', '2022-08-21 17:30:08'),
(13, 6, 'cccc', 'dddd', 'None', 0, '2022-10-14 17:26:40', '2022-08-29 00:53:29');

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
(1, 8, '[{\"label_mark\":\"A\",\"label_point1X\":0,\"label_point1Y\":350,\"label_point2X\":0,\"label_point2Y\":600,\"label_point3X\":625,\"label_point3Y\":675,\"label_point4X\":700,\"label_point4Y\":600},{\"label_mark\":\"B\",\"label_point1X\":1280,\"label_point1Y\":700,\"label_point2X\":1280,\"label_point2Y\":0,\"label_point3X\":800,\"label_point3Y\":0,\"label_point4X\":800,\"label_point4Y\":700}]', '2022-08-26 01:52:28', '2022-07-17 10:41:57'),
(2, 9, '[{\"label_mark\":\"A\",\"label_point1X\":0,\"label_point1Y\":350,\"label_point2X\":0,\"label_point2Y\":600,\"label_point3X\":625,\"label_point3Y\":675,\"label_point4X\":700,\"label_point4Y\":600},{\"label_mark\":\"B\",\"label_point1X\":1280,\"label_point1Y\":700,\"label_point2X\":1280,\"label_point2Y\":0,\"label_point3X\":800,\"label_point3Y\":0,\"label_point4X\":800,\"label_point4Y\":700}]', '2022-08-26 01:52:28', '2022-07-17 10:41:57');

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
(4, 'App\\Models\\User', 1, 'login:user1', '550e1b072c3334d33aeb07149dc3c2472dd2338f75d9275e2c2db68d577b5d30', '[\"*\"]', NULL, '2022-10-09 19:34:58', '2022-10-09 19:34:58');

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
(2, 1, '文教大学駐輪場A', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '216,216,216,216,216,216,216,216,216,216,216,216', '216.0,216.0,216.0,216.0,216.0,216.0,216.0', '216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0', '143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,143.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0,216.0', 60, 0, '画像のパスが入ります', '2022-10-20 13:20:54', '2022-07-17 12:14:24'),
(5, 1, '文教大学駐輪場B', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '102,102,102,102,102,102,102,102,102,102', '102.0,102.0,102.0,102.0,102.0,102.0,102.0', '102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0', '102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0,102.0', 60, 0, '画像のパスが入ります', '2022-10-20 13:20:54', '2022-07-17 12:21:01'),
(6, 1, 'aaaaa', '0', '0', 'bbbbb', 'None', '0,0,0,0,0,0,0,0', '0.0,0.0,0.0,0.0,0.0,0.0,0.0', '0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0', '0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0', 60, 100, '', '2022-10-20 13:20:54', '2022-08-28 23:52:53');

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
(1, '1234', '1234@bunkyo.ac.jp', NULL, '$2y$10$zQQaD5rZuYMvnQPifwaYBuPUGk7JPShs8euDFr/8dLprV3NvmjBmm', NULL, '2022-07-17 10:41:08', '2022-07-17 10:41:08');

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
-- テーブルのデータのダンプ `violations`
--

INSERT INTO `violations` (`violations_id`, `spots_id`, `cameras_id`, `bicycles_id`, `labels_name`, `violations_x_coordinate`, `violations_y_coordinate`, `violations_img`, `updated_at`, `created_at`) VALUES
(534, 2, 8, 646, 'A', '588', '623', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(535, 2, 8, 647, 'A', '114', '550', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(536, 2, 8, 648, 'A', '188', '557', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(537, 2, 8, 649, 'A', '393', '586', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(538, 2, 8, 650, 'A', '303', '572', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(539, 2, 8, 651, 'A', '29', '523', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(540, 2, 8, 652, 'A', '521', '606', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(541, 2, 8, 653, 'A', '464', '596', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(542, 2, 8, 656, 'B', '862', '606', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(543, 2, 8, 657, 'B', '902', '628', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(544, 2, 8, 658, 'B', '1001', '671', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:19', '2022-08-26 23:57:19'),
(545, 2, 8, 659, 'A', '630', '621', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:21', '2022-08-26 23:57:21'),
(546, 2, 8, 660, 'B', '924', '629', 'bicycle_imgs/8/watch_v_9plqYTT-3w8.jpg', '2022-08-26 23:57:23', '2022-08-26 23:57:23');

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
  MODIFY `bicycles_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=949;

--
-- テーブルの AUTO_INCREMENT `cameras`
--
ALTER TABLE `cameras`
  MODIFY `cameras_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `spots`
--
ALTER TABLE `spots`
  MODIFY `spots_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `violations`
--
ALTER TABLE `violations`
  MODIFY `violations_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
