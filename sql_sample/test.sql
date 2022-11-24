-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2022 年 11 月 24 日 00:20
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
  `cameras_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cameras_count` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `cameras`
--

INSERT INTO `cameras` (`cameras_id`, `spots_id`, `cameras_name`, `cameras_url`, `cameras_status`, `cameras_count`, `updated_at`, `created_at`) VALUES
(100, 100, 'テスト用カメラA', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 27, '2022-11-23 17:24:51', '2022-10-27 21:13:42'),
(101, 100, 'テスト用カメラB', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Run', 22, '2022-11-23 05:43:40', '2022-10-30 07:42:46'),
(104, 101, 'テスト3', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 100, '2022-11-04 11:47:48', '2022-11-04 11:47:48'),
(105, 101, 'テスト4', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 53, '2022-11-04 11:47:48', '2022-11-04 11:47:48'),
(106, 102, 'テスト3', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 50, '2022-11-04 11:48:34', '2022-11-04 11:47:49'),
(107, 102, 'テスト4', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 30, '2022-11-04 11:48:37', '2022-11-04 11:47:49');

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
(45, 100, '[{\"label_mark\":0,\"label_point1X\":9.5,\"label_point1Y\":320,\"label_point2X\":686.5,\"label_point2Y\":537,\"label_point3X\":611.5,\"label_point3Y\":599,\"label_point4X\":4.5,\"label_point4Y\":515}]', '2022-11-23 17:23:53', '2022-11-23 17:23:53');

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
(34, 'App\\Models\\User', 102, 'login:user102', 'e78765464b91f10850804185ed7392bbb471e5b398c5f0058e5971b44ad2156a', '[\"*\"]', NULL, '2022-11-05 13:37:16', '2022-11-05 13:37:16'),
(233, 'App\\Models\\User', 100, 'login:user100', 'fb46f48f457a7323a50b3555e67c44f2fef4e3cbdfaa75a412a92bb81df7a5f4', '[\"*\"]', NULL, '2022-11-23 17:23:07', '2022-11-23 17:23:07');

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
  `spots_violations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spots_over_time` int NOT NULL,
  `spots_max` int NOT NULL,
  `spots_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `spots`
--

INSERT INTO `spots` (`spots_id`, `users_id`, `spots_name`, `spots_latitude`, `spots_longitude`, `spots_address`, `spots_status`, `spots_count_day1`, `spots_count_week1`, `spots_count_month1`, `spots_count_month3`, `spots_violations`, `spots_over_time`, `spots_max`, `spots_url`, `updated_at`, `created_at`) VALUES
(100, 100, 'テスト用駐輪場A', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '49', '0,0,0,0,0,0,14.291666666667', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14.291666666667', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14.291666666667', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2', 5, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 19:31:09', '2022-10-27 21:12:30'),
(101, 100, 'テスト用駐輪場B', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '153', '0,0,0,0,0,0,44.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,44.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 3600, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 19:31:09', '2022-10-31 12:08:48'),
(102, 100, 'テスト用駐輪場C', '0', '0', 'テスト', 'None', '80', '0,0,0,0,0,0,23.333333333333', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23.333333333333', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23.333333333333', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 3600, 100, '', '2022-11-21 19:31:09', '2022-11-04 11:15:57'),
(103, 100, 'テスト用駐輪場D', '0', '0', 'テスト', 'None', '0,0,0,0,0,0,0,0,0', 'None', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', ',0', 3600, 100, '', '2022-11-21 19:31:09', '2022-11-04 11:15:58'),
(108, 100, 'テスト用駐輪場E', '', '', '茅ヶ崎市', 'None', '0,0,0,0,0,0,0,0', 'None', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 18000, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 19:31:09', '2022-11-20 21:07:41'),
(109, 100, 'テスト用駐輪場F', '35.333822', '139.40369', '茅ヶ崎市', 'None', '0,0,0,0,0,0,0,0', 'None', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 198000, 100, 'https://www.youtube.com/embed/9plqYTT-3w8', '2022-11-21 19:31:09', '2022-11-21 17:29:53');

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
(100, '0000', '0000@bunkyo.ac.jp', NULL, '$2y$10$GDRVWjkxs0tN.8.c8fV8dej43OyqCZi1Haur/1wp5FWFmMhjY1J4S', NULL, '2022-11-01 06:05:19', '2022-11-01 06:05:19'),
(102, 'TestUser', 'test@bunkyo.ac.jp', NULL, '$2y$10$0oOoRJLcapMR2LfBc9qVxOpkKGhI5jipZdKs28pEGUQC3xHEKTMTm', NULL, '2022-10-28 06:10:28', '2022-10-28 06:10:28'),
(103, '1111', '1111@bunkyo.ac.jp', NULL, '$2y$10$rLvjnyZw2JHjZcv3w1hfeuQ1WtM0HMlw1/aqxHO8hGDSE4NCYRu.2', NULL, '2022-11-01 13:46:46', '2022-11-01 13:46:46');

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
  MODIFY `bicycles_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3686;

--
-- テーブルの AUTO_INCREMENT `cameras`
--
ALTER TABLE `cameras`
  MODIFY `cameras_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `labels`
--
ALTER TABLE `labels`
  MODIFY `labels_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- テーブルの AUTO_INCREMENT `spots`
--
ALTER TABLE `spots`
  MODIFY `spots_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- テーブルの AUTO_INCREMENT `violations`
--
ALTER TABLE `violations`
  MODIFY `violations_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
