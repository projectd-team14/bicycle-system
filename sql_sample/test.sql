-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2022 年 12 月 08 日 18:43
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
(4217, 101, 104, 'A', 20, '3', '212', '違反', NULL, '2022-12-05 20:33:58', '2022-12-02 20:40:37'),
(4219, 101, 105, 'A', 1, '70', '183', 'None', NULL, '2022-12-05 05:00:10', '2022-12-02 20:41:08'),
(4220, 101, 104, 'None', 2, '139', '185', 'None', NULL, '2022-12-03 14:35:50', '2022-12-02 20:41:08'),
(4221, 101, 104, 'None', 3, '432', '126', 'None', NULL, '2022-12-02 22:50:08', '2022-12-02 20:41:08'),
(4222, 101, 104, 'None', 5, '485', '119', 'None', NULL, '2022-12-02 22:50:08', '2022-12-02 20:41:08'),
(4223, 101, 104, 'None', 6, '254', '165', 'None', NULL, '2022-12-02 22:56:08', '2022-12-02 20:41:08'),
(4224, 101, 104, 'None', 7, '109', '405', 'None', NULL, '2022-12-03 20:41:08', '2022-12-02 20:41:08'),
(4225, 101, 104, 'None', 8, '361', '323', 'None', NULL, '2022-12-03 20:41:08', '2022-12-02 20:41:08'),
(4226, 101, 104, 'None', 9, '489', '258', 'None', NULL, '2022-12-03 01:41:08', '2022-12-02 20:41:08'),
(4227, 101, 104, 'None', 10, '328', '147', 'None', NULL, '2022-12-03 01:41:08', '2022-12-02 20:41:08'),
(4228, 101, 104, 'None', 12, '546', '107', 'None', NULL, '2022-12-03 01:41:08', '2022-12-02 20:41:08'),
(4229, 101, 104, 'None', 13, '231', '335', 'None', NULL, '2022-12-02 23:41:08', '2022-12-02 20:41:08'),
(4230, 101, 104, 'None', 14, '904', '70', 'None', NULL, '2022-12-02 22:41:08', '2022-12-02 20:41:08'),
(4231, 101, 104, 'None', 15, '673', '188', 'None', NULL, '2022-12-02 22:41:08', '2022-12-02 20:41:08'),
(4232, 101, 104, 'None', 17, '618', '195', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08'),
(4233, 101, 104, 'None', 18, '598', '91', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08'),
(4234, 101, 104, 'None', 19, '838', '107', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08'),
(4235, 101, 104, 'None', 21, '780', '119', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08'),
(4236, 101, 104, 'None', 27, '1152', '188', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08'),
(4237, 101, 104, 'None', 33, '3', '215', 'None', NULL, '2022-12-02 20:41:08', '2022-12-02 20:41:08');

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
(100, 100, 'テスト用カメラA', 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', 'Stop', 4, '2022-12-08 13:21:07', '2022-10-27 21:13:42'),
(101, 100, 'テスト用カメラB', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Run', 24, '2022-11-30 13:33:00', '2022-10-30 07:42:46'),
(104, 101, 'テスト3', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Run', 21, '2022-12-02 20:41:01', '2022-11-04 11:47:48'),
(105, 101, 'テスト4', 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', 'Stop', 53, '2022-12-04 21:28:32', '2022-11-04 11:47:48'),
(106, 102, 'テスト3', 'https://www.youtube.com/watch?v=9plqYTT-3w8', 'Stop', 50, '2022-11-04 11:48:34', '2022-11-04 11:47:49'),
(110, 102, 'x', 'https://www.youtube.com/embed/9plqYTT-3w8', 'Stop', 0, '2022-12-08 18:24:34', '2022-12-08 18:24:34'),
(111, 102, '0000bunkyo', 'https://www.youtube.com/embed/9plqYTT-3w8', 'Stop', 0, '2022-12-08 18:29:48', '2022-12-08 18:29:48');

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
(75, 101, '[{\"label_mark\":0,\"label_point1X\":9.627289955780164,\"label_point1Y\":464.74916387959865,\"label_point2X\":766.9740998104865,\"label_point2Y\":215.91973244147158,\"label_point3X\":703.5944409349337,\"label_point3Y\":137.25752508361205,\"label_point4X\":0.8022741629816804,\"label_point4Y\":170.16722408026754},{\"label_mark\":1,\"label_point1X\":60.17056222362603,\"label_point1Y\":581.1371237458194,\"label_point2X\":1010.8654453569172,\"label_point2Y\":126.82274247491638,\"label_point3X\":1175.3316487681618,\"label_point3Y\":160.5351170568562,\"label_point4X\":674.7125710675932,\"label_point4Y\":712.7759197324415}]', '2022-11-30 15:54:08', '2022-11-27 18:21:05'),
(85, 104, '[{\"label_mark\":0,\"label_point1X\":48.07218309859155,\"label_point1Y\":576.8944099378882,\"label_point2X\":1015.1056338028169,\"label_point2Y\":115.15527950310559,\"label_point3X\":1144.7887323943662,\"label_point3Y\":158.75776397515529,\"label_point4X\":564.568661971831,\"label_point4Y\":714.4099378881987},{\"label_mark\":1,\"label_point1X\":8.943661971830986,\"label_point1Y\":455.0310559006211,\"label_point2X\":769.1549295774648,\"label_point2Y\":199.0062111801242,\"label_point3X\":716.6109154929577,\"label_point3Y\":137.51552795031054,\"label_point4X\":2.2359154929577465,\"label_point4Y\":211.30434782608694}]', '2022-12-04 21:28:43', '2022-12-04 21:13:56'),
(86, 105, '[{\"label_mark\":0,\"label_point1X\":296.8450704225352,\"label_point1Y\":306.0421545667447,\"label_point2X\":812.1073943661971,\"label_point2Y\":584.2622950819672,\"label_point3X\":323.83098591549293,\"label_point3Y\":703.9812646370024,\"label_point4X\":10.963028169014084,\"label_point4Y\":426.60421545667447},{\"label_mark\":1,\"label_point1X\":831.5035211267605,\"label_point1Y\":484.7775175644028,\"label_point2X\":391.2957746478873,\"label_point2Y\":254.6135831381733,\"label_point3X\":461.29049295774644,\"label_point3Y\":169.46135831381733,\"label_point4X\":904.8714788732394,\"label_point4Y\":351.56908665105385},{\"label_mark\":2,\"label_point1X\":252.14964788732394,\"label_point1Y\":296.76814988290397,\"label_point2X\":401.41549295774644,\"label_point2Y\":207.40046838407494,\"label_point3X\":261.42605633802816,\"label_point3Y\":128.9929742388759,\"label_point4X\":19.39612676056338,\"label_point4Y\":314.4730679156909}]', '2022-12-05 03:39:55', '2022-12-05 03:39:55');

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
(314, 'App\\Models\\User', 102, 'login:user102', 'bded8e2df60c0fa92b80a48a394cbf664d8e89adf8b0da2a889a709696c0b8fb', '[\"*\"]', NULL, '2022-12-02 19:48:07', '2022-12-02 19:48:07'),
(321, 'App\\Models\\User', 104, 'login:user104', '87f019de73fb79268346aa135f2c90cf89a77875adb91414d5dbb4548023a1cd', '[\"*\"]', NULL, '2022-12-02 20:02:50', '2022-12-02 20:02:50'),
(326, 'App\\Models\\User', 103, 'login:user103', 'ce3956a87eecfac01d20680439a20c7c77bc8c00c8b20a2d1de6dad35761bc02', '[\"*\"]', NULL, '2022-12-02 20:12:36', '2022-12-02 20:12:36'),
(336, 'App\\Models\\User', 106, 'login:user106', 'dbf1f3717295613415d3f93a86009a21d86fdf0375b104cee6c72249cabe80a5', '[\"*\"]', NULL, '2022-12-03 22:47:19', '2022-12-03 22:47:19'),
(584, 'App\\Models\\User', 100, 'login:user100', 'f0cdedc2d8ce129c248fda2f0e4b1302f25a27e78578840f472fd9e2f8d61c94', '[\"*\"]', NULL, '2022-12-08 18:39:54', '2022-12-08 18:39:54');

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
(100, 100, 'テスト用駐輪場A', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', '3', '49,34.62,5,42,53,32,45,53,65,22,43,54.42,52,24,55,45,35,43,46,52,11,11,53', '0,0,0,0,0,0,14.291666666667', '71,52,51,73,64,52,23,32,32,42,43,60,53,64,55,66,74,93,93,80,28,26,24,41,32,24,21,21,14,33', '0,2,4,0,7,9,11,8,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2,0,2,4,0,7,9,11,12,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2,0,2,4,0,7,9,11,2,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', '0,2,4,0,7,9,11,12,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', 5, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-12-05 07:47:10', '2022-10-27 21:12:30'),
(101, 100, 'テスト用駐輪場B', '35.658', '139.7016', '神奈川県茅ヶ崎市行谷１１００', '1', '15,23,25,22,55,24,26,25,23,23,22,15,3,23,25,22,55,24,26,25,23,23,22', '0,0,0,0,0,0,44.625', '71,52,51,73,64,52,23,32,32,42,43,60,53,64,55,66,74,93,93,80,28,26,24,41,32,24,21,21,14,33', '0,2,4,0,7,9,11,8,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2,0,2,4,0,7,9,11,12,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2,0,2,4,0,7,9,11,2,1,2,0,0,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', '1,2,1,3,4,2,3,2,2,2,3,0,3,4,5,6,4,3,3,0,2,2,2,1,2,2,1,1,1,3', 3600, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-12-05 07:45:29', '2022-10-31 12:08:48'),
(102, 100, 'テスト用駐輪場C', '35.6895014', '139.6917337', 'テスト', '1', '13,33,45,22,35,24,24,25,26,27,45,33,23,25,22,35,44,26,24,25,26,33,22', '0,0,0,0,0,0,23.333333333333', '31,32,51,63,64,62,53,32,32,42,63,40,53,64,55,63,45,53,53,6,52,32,52,71,32,52,17,61,51,43', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23.333333333333', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 3600, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-12-05 08:14:31', '2022-11-04 11:15:57'),
(114, 103, 'テスト用駐輪場F', '35.339165', '139.49014', '神奈川県藤沢市', '1', '153,23,25,22,55,24,26,25,23,23', '0,0,0,0,0,0,14.291666666667', '41,42,41,53,64,72,83,42,52,52,53,70,33,46,53,64,44,53,63,66,52,62,32,31,42,25,91,71,51,43', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '1,2,1,3,4,2,3,2,2,2,3,0,3,4,5,6,4,3,3,0,2,2,2,1,2,2,1,1,1,3', 7200, 200, 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', '2022-12-02 20:28:43', '2022-12-02 20:06:43'),
(115, 103, 'テスト用駐輪場G', '35.658081', '139.751508', '東京都港区', '1', '153,23,25,22,55,24,26,25,23,23', '0,0,0,0,0,0,14.291666666667', '41,42,41,53,64,72,83,42,52,52,53,70,33,46,53,64,44,53,63,66,52,62,32,31,42,25,91,71,51,43', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '1,2,1,3,4,2,3,2,2,2,3,0,3,4,5,6,4,3,3,0,2,2,2,1,2,2,1,1,1,3', 10800, 200, 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', '2022-12-02 20:28:48', '2022-12-02 20:08:11'),
(116, 103, 'テスト用駐輪場H', '35.339165', '139.49014', '神奈川県藤沢市', '1', '153,23,25,22,55,24,26,25,23,23', '0,0,0,0,0,0,14.291666666667', '71,52,51,73,64,52,23,32,32,42,43,60,53,64,55,66,74,93,93,80,28,26,24,41,32,24,21,21,14,33', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,2,4,0,7,9,11,22,2,2,2,6,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', 10800, 300, 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', '2022-12-02 20:29:14', '2022-12-02 20:11:22'),
(117, 103, 'テスト用駐輪場I', '35.661971', '139.703795', '渋谷区', '1', '153,23,25,22,55,24,26,25,23,23', '0,0,0,0,0,0,14.291666666667', '1,2,1,3,4,2,3,2,2,2,3,0,3,4,5,6,4,3,3,0,2,2,2,1,2,2,1,1,1,3', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,2,4,0,7,9,11,22,2,2,2,6,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', 36000, 200, 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', '2022-12-02 20:29:17', '2022-12-02 20:12:28'),
(118, 103, 'テスト用駐輪場J', '35.561407', '139.716063', '東京都大田区', '1', '153,23,25,22,55,24,26,25,23,23', '0,0,0,0,0,0,14.291666666667', '71,52,51,73,64,52,23,32,32,42,43,60,53,64,55,66,74,93,93,80,28,26,24,41,32,24,21,21,14,33', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,2,4,0,7,9,11,22,2,2,2,6,5,0,6,6,2,4,7,7,8,2,3,4,5,6,7,3,2,2', 10800, 100, 'https://www.youtube.com/watch?v=JDAgqz0Qg4s', '2022-12-02 20:29:21', '2022-12-02 20:14:15'),
(121, 100, 'テスト用駐輪場D', '35.661971', '139.703795', '渋谷区', '1', 'None', 'None', 'None', 'None', 'None', 108000, 200, 'https://www.youtube.com/embed/9plqYTT-3w8', '2022-12-08 18:39:49', '2022-12-08 18:39:49');

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
(100, 'TestUser0', '0000@bunkyo.ac.jp', NULL, '$2y$10$GDRVWjkxs0tN.8.c8fV8dej43OyqCZi1Haur/1wp5FWFmMhjY1J4S', NULL, '2022-11-01 06:05:19', '2022-11-01 06:05:19'),
(102, 'TestUser2', '2222@bunkyo.ac.jp', NULL, '$2y$10$0oOoRJLcapMR2LfBc9qVxOpkKGhI5jipZdKs28pEGUQC3xHEKTMTm', NULL, '2022-10-28 06:10:28', '2022-10-28 06:10:28'),
(103, 'TestUser1', '1111@bunkyo.ac.jp', NULL, '$2y$10$rLvjnyZw2JHjZcv3w1hfeuQ1WtM0HMlw1/aqxHO8hGDSE4NCYRu.2', NULL, '2022-11-01 13:46:46', '2022-11-01 13:46:46'),
(104, 'TestUser3', '3333@bunkyo.ac.jp', NULL, '$2y$10$BNWBeCbMXrvXmPE7t8xg4ubSPe5uyqrakAv0.UKx5hFxHaBZjeF0u', NULL, '2022-12-02 19:49:17', '2022-12-02 19:49:17'),
(105, 'TestUser4', '4444@bunkyo.ac.jp', NULL, '$2y$10$y1/tnXFpg.EdtCinfMSypO9WSxX2JCJe1H5Dn4NwEriid57ATDg5m', NULL, '2022-12-03 22:44:32', '2022-12-03 22:44:32'),
(106, 'TestUser5', '5555@bunkyo.ac.jp', NULL, '$2y$10$OrnYcTPluBooYlN7b.sBd.VmXu.69O4YMwzTRW7XijKIlUWH2w2/q', NULL, '2022-12-03 22:46:50', '2022-12-03 22:46:50'),
(107, 'TestUser6', '6666@bunkyo.ac.jp', NULL, '$2y$10$OwoY2zTMOHJ3ZxyZJWvlX.BfGGGCPuQxDQnyBMEAPnauv2AaKQXxu', NULL, '2022-12-03 22:48:21', '2022-12-03 22:48:21'),
(108, 'TestUser7', '7777@bunkyo.ac.jp', NULL, '$2y$10$MbTZ5b.XPNINR.x8Zeil/OoA3RmcnY8xOwRKV2y4RKDZ4Z3BFCAqu', NULL, '2022-12-03 22:48:58', '2022-12-03 22:48:58');

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
  MODIFY `bicycles_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4238;

--
-- テーブルの AUTO_INCREMENT `cameras`
--
ALTER TABLE `cameras`
  MODIFY `cameras_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `labels`
--
ALTER TABLE `labels`
  MODIFY `labels_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=585;

--
-- テーブルの AUTO_INCREMENT `spots`
--
ALTER TABLE `spots`
  MODIFY `spots_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- テーブルの AUTO_INCREMENT `violations`
--
ALTER TABLE `violations`
  MODIFY `violations_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
