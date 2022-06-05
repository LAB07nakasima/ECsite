-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022 年 6 月 05 日 20:33
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gs_db07`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `ec_table`
--

CREATE TABLE `ec_table` (
  `id` int(12) NOT NULL,
  `item` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` int(6) NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `fname` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `ec_table`
--

INSERT INTO `ec_table` (`id`, `item`, `value`, `description`, `fname`, `indate`) VALUES
(1, 'test', 0, 'bbbbbb', 'B00C88A6-4555-4570-BC71-8AA07F08F7DE.jpeg', '2022-06-05 13:01:04'),
(2, '花火', 30000, 'tesuto', 'B1E74BCE-8F49-4637-97D9-25B4005F3BB3.jpeg', '2022-06-05 15:24:56'),
(3, 'お肉', 100000, '焼肉', 'B1D05B65-CCF3-4405-9951-32F3D73729F3.jpeg', '2022-06-05 15:31:04'),
(4, '牛タン', 3000, '商品紹介文を入力', 'B8A6DB75-DDBD-42BD-9A56-7037D7742C99.jpeg', '2022-06-05 15:31:53');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `ec_table`
--
ALTER TABLE `ec_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `ec_table`
--
ALTER TABLE `ec_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
