-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2022 年 11 月 21 日 18:40
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
(100, 100, 'テスト用駐輪場A', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '53,54,54,54', '6.625,6.625,6.625,6.625,6.625,6.625,6.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,6.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,6.625', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 5, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 18:38:26', '2022-10-27 21:12:30'),
(101, 100, 'テスト用駐輪場B', '35.37007', '139.416526', '神奈川県茅ヶ崎市行谷１１００', 'None', '153,153,153', '19.125,19.125,19.125,19.125,19.125,19.125,19.125', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,19.125,19.125,19.125,19.125,19.125,19.125,19.125,19.125', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,19.125,19.125,19.125,19.125,19.125,19.125,19.125,19.125', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 3600, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 18:40:15', '2022-10-31 12:08:48'),
(102, 100, 'テスト用駐輪場C', '0', '0', 'テスト', 'None', '80,80,80', '12,10,10,10,10,10,10', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10,10,10,10,10,10', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10,10,10,10,10,10', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 3600, 100, '', '2022-11-21 18:40:17', '2022-11-04 11:15:57'),
(103, 100, 'テスト用駐輪場D', '0', '0', 'テスト', 'None', '0', '0,10,35,23,11,43,36', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 3600, 100, '', '2022-11-21 18:40:19', '2022-11-04 11:15:58'),
(108, 100, 'テスト用駐輪場E', '', '', '茅ヶ崎市', 'None', 'None', 'None', 'None', 'None', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 18000, 100, 'https://www.youtube.com/watch?v=9plqYTT-3w8', '2022-11-21 18:40:21', '2022-11-20 21:07:41'),
(109, 100, 'テスト用駐輪場F', '35.333822', '139.40369', '茅ヶ崎市', 'None', 'None', 'None', 'None', 'None', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6.625,6.625,6.625,6.625,6.625,6.625,6.625,7.624', 198000, 100, 'https://www.youtube.com/embed/9plqYTT-3w8', '2022-11-21 18:40:22', '2022-11-21 17:29:53');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`spots_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `spots`
--
ALTER TABLE `spots`
  MODIFY `spots_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
