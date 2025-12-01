-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 03:55 PM
-- Server version: 8.4.6
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `_1`
--
CREATE DATABASE IF NOT EXISTS `_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `_1`;

-- --------------------------------------------------------

--
-- Table structure for table `alliances`
--

CREATE TABLE `alliances` (
  `alliance_id` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `motto` text,
  `symbol_id` int NOT NULL DEFAULT '1',
  `leader` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `fort_x` int DEFAULT NULL,
  `fort_y` int DEFAULT NULL,
  `tower1_x` int DEFAULT NULL,
  `tower1_y` int DEFAULT NULL,
  `tower2_x` int DEFAULT NULL,
  `tower2_y` int DEFAULT NULL,
  `tower3_x` int DEFAULT NULL,
  `tower3_y` int DEFAULT NULL,
  `tower4_x` int DEFAULT NULL,
  `tower4_y` int DEFAULT NULL,
  `spells_x` int DEFAULT NULL,
  `spells_y` int DEFAULT NULL,
  `spell_donations` int NOT NULL DEFAULT '0',
  `spell_daily_donations` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alliances`
--

INSERT INTO `alliances` (`alliance_id`, `name`, `motto`, `symbol_id`, `leader`, `level`, `fort_x`, `fort_y`, `tower1_x`, `tower1_y`, `tower2_x`, `tower2_y`, `tower3_x`, `tower3_y`, `tower4_x`, `tower4_y`, `spells_x`, `spells_y`, `spell_donations`, `spell_daily_donations`) VALUES
('---', 'Kingdom chat', NULL, 1, -1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barbs`
--

CREATE TABLE `barbs` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL DEFAULT '3',
  `disappear_eta` bigint NOT NULL,
  `slain_1` tinyint(1) NOT NULL DEFAULT '0',
  `slain_2` tinyint(1) NOT NULL DEFAULT '0',
  `slain_3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barbs`
--

INSERT INTO `barbs` (`x`, `y`, `level`, `disappear_eta`, `slain_1`, `slain_2`, `slain_3`) VALUES
(8, 676, 3, 1764642246, 0, 0, 0),
(22, 14, 3, 1764642246, 0, 0, 0),
(25, 417, 6, 1764642246, 0, 0, 0),
(99, 754, 6, 1764642246, 0, 0, 0),
(238, 1374, 3, 1764642246, 0, 0, 0),
(239, 896, 21, 1764642246, 0, 0, 0),
(257, 85, 6, 1764642246, 0, 0, 0),
(258, 308, 15, 1764642246, 0, 0, 0),
(456, 1101, 9, 1764642246, 0, 0, 0),
(457, 601, 18, 1764642246, 0, 0, 0),
(503, 1418, 9, 1764642246, 0, 0, 0),
(545, 777, 3, 1764642246, 0, 0, 0),
(583, 912, 15, 1764642246, 0, 0, 0),
(687, 1018, 12, 1764642246, 0, 0, 0),
(714, 359, 3, 1764642246, 0, 0, 0),
(803, 665, 9, 1764642246, 0, 0, 0),
(829, 1315, 15, 1764642246, 0, 0, 0),
(873, 1000, 18, 1764642246, 0, 0, 0),
(980, 1234, 21, 1764642246, 0, 0, 0),
(993, 762, 6, 1764642246, 0, 0, 0),
(1001, 811, 3, 1764642246, 0, 0, 0),
(1038, 185, 12, 1764642246, 0, 0, 0),
(1040, 317, 12, 1764642246, 0, 0, 0),
(1185, 1031, 15, 1764642246, 0, 0, 0),
(1328, 1066, 15, 1764642246, 0, 0, 0),
(1409, 1138, 18, 1764642246, 0, 0, 0),
(1443, 313, 6, 1764642246, 0, 0, 0),
(1472, 1218, 15, 1764642246, 0, 0, 0),
(1484, 37, 15, 1764642246, 0, 0, 0),
(1486, 381, 12, 1764642246, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `msg_num` int NOT NULL,
  `place` char(3) NOT NULL,
  `sender` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvk`
--

CREATE TABLE `kvk` (
  `alliance` char(3) NOT NULL,
  `seconds_held` int NOT NULL DEFAULT '0',
  `seconds_in_row` int NOT NULL DEFAULT '0',
  `start_hold` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvktowers`
--

CREATE TABLE `kvktowers` (
  `next_kvk_start` bigint NOT NULL,
  `next_kvk_end` bigint NOT NULL,
  `throne_lead_m` int DEFAULT NULL,
  `throne_j1_m` int DEFAULT NULL,
  `throne_j2_m` int DEFAULT NULL,
  `throne_j3_m` int DEFAULT NULL,
  `throne_j4_m` int DEFAULT NULL,
  `throne_j5_m` int DEFAULT NULL,
  `towerW_lead_m` int DEFAULT NULL,
  `towerW_j1_m` int DEFAULT NULL,
  `towerW_j2_m` int DEFAULT NULL,
  `towerW_j3_m` int DEFAULT NULL,
  `towerW_j4_m` int DEFAULT NULL,
  `towerW_j5_m` int DEFAULT NULL,
  `towerN_lead_m` int DEFAULT NULL,
  `towerN_j1_m` int DEFAULT NULL,
  `towerN_j2_m` int DEFAULT NULL,
  `towerN_j3_m` int DEFAULT NULL,
  `towerN_j4_m` int DEFAULT NULL,
  `towerN_j5_m` int DEFAULT NULL,
  `towerE_lead_m` int DEFAULT NULL,
  `towerE_j1_m` int DEFAULT NULL,
  `towerE_j2_m` int DEFAULT NULL,
  `towerE_j3_m` int DEFAULT NULL,
  `towerE_j4_m` int DEFAULT NULL,
  `towerE_j5_m` int DEFAULT NULL,
  `towerS_lead_m` int DEFAULT NULL,
  `towerS_j1_m` int DEFAULT NULL,
  `towerS_j2_m` int DEFAULT NULL,
  `towerS_j3_m` int DEFAULT NULL,
  `towerS_j4_m` int DEFAULT NULL,
  `towerS_j5_m` int DEFAULT NULL,
  `kvk_winner` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kvktowers`
--

INSERT INTO `kvktowers` (`next_kvk_start`, `next_kvk_end`, `throne_lead_m`, `throne_j1_m`, `throne_j2_m`, `throne_j3_m`, `throne_j4_m`, `throne_j5_m`, `towerW_lead_m`, `towerW_j1_m`, `towerW_j2_m`, `towerW_j3_m`, `towerW_j4_m`, `towerW_j5_m`, `towerN_lead_m`, `towerN_j1_m`, `towerN_j2_m`, `towerN_j3_m`, `towerN_j4_m`, `towerN_j5_m`, `towerE_lead_m`, `towerE_j1_m`, `towerE_j2_m`, `towerE_j3_m`, `towerE_j4_m`, `towerE_j5_m`, `towerS_lead_m`, `towerS_j1_m`, `towerS_j2_m`, `towerS_j3_m`, `towerS_j4_m`, `towerS_j5_m`, `kvk_winner`) VALUES
(1765015200, 1765101600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marches`
--

CREATE TABLE `marches` (
  `march_id` int NOT NULL,
  `player` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `marchtype` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `eta` bigint NOT NULL,
  `t1i` int NOT NULL DEFAULT '0',
  `t1c` int NOT NULL DEFAULT '0',
  `t1b` int NOT NULL DEFAULT '0',
  `t2i` int NOT NULL DEFAULT '0',
  `t2c` int NOT NULL DEFAULT '0',
  `t2b` int NOT NULL DEFAULT '0',
  `t3i` int NOT NULL DEFAULT '0',
  `t3c` int NOT NULL DEFAULT '0',
  `t3b` int NOT NULL DEFAULT '0',
  `t4i` int NOT NULL DEFAULT '0',
  `t4c` int NOT NULL DEFAULT '0',
  `t4b` int NOT NULL DEFAULT '0',
  `t5i` int NOT NULL DEFAULT '0',
  `t5c` int NOT NULL DEFAULT '0',
  `t5b` int NOT NULL DEFAULT '0',
  `dragon` tinyint(1) NOT NULL DEFAULT '0',
  `hero1` int DEFAULT NULL,
  `hero2` int DEFAULT NULL,
  `marchtime` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL,
  `disappear_eta` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`x`, `y`, `level`, `disappear_eta`) VALUES
(10, 917, 19, 1764642247),
(111, 57, 12, 1764642247),
(156, 951, 14, 1764642246),
(184, 142, 11, 1764642247),
(333, 1149, 14, 1764642247),
(346, 1415, 6, 1764642247),
(350, 171, 5, 1764642247),
(411, 1370, 7, 1764642247),
(415, 306, 7, 1764642247),
(609, 705, 4, 1764642246),
(700, 1468, 3, 1764642247),
(703, 181, 20, 1764642247),
(740, 600, 14, 1764642247),
(748, 829, 7, 1764642247),
(768, 1458, 7, 1764642246),
(800, 739, 1, 1764642247),
(950, 205, 20, 1764642247),
(956, 486, 11, 1764642247),
(964, 896, 4, 1764642247),
(974, 1474, 17, 1764642247),
(1105, 25, 13, 1764642246),
(1136, 916, 5, 1764642247),
(1139, 363, 12, 1764642247),
(1163, 1302, 14, 1764642247),
(1166, 19, 2, 1764642247),
(1208, 1215, 18, 1764642247),
(1323, 1118, 18, 1764642247),
(1408, 20, 13, 1764642247),
(1473, 149, 6, 1764642247),
(1480, 1412, 14, 1764642247);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `x` int NOT NULL DEFAULT '5',
  `y` int NOT NULL DEFAULT '5',
  `alliance` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '---'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rallies`
--

CREATE TABLE `rallies` (
  `id` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `starter_march` int NOT NULL,
  `joiner1_march` int DEFAULT NULL,
  `joiner2_march` int DEFAULT NULL,
  `joiner3_march` int DEFAULT NULL,
  `joiner4_march` int DEFAULT NULL,
  `joiner5_march` int DEFAULT NULL,
  `length` int NOT NULL,
  `barb_level` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverinfo`
--

CREATE TABLE `serverinfo` (
  `num` int NOT NULL,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT 'Княжество',
  `leader` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `serverinfo`
--

INSERT INTO `serverinfo` (`num`, `current`, `name`, `leader`) VALUES
(1, 0, 'Княжество', -1);

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `spell_id` int NOT NULL,
  `alliance` char(3) NOT NULL,
  `type` int NOT NULL,
  `eta` bigint NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `player_id` int DEFAULT NULL,
  `alliance_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `type` char(1) NOT NULL,
  `amount` int NOT NULL,
  `level` int NOT NULL,
  `owner` int DEFAULT NULL,
  `gathereta` bigint DEFAULT NULL,
  `disappear_eta` bigint NOT NULL,
  `gathered_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tiles`
--

INSERT INTO `tiles` (`x`, `y`, `type`, `amount`, `level`, `owner`, `gathereta`, `disappear_eta`, `gathered_amount`) VALUES
(18, 515, 'w', 20000, 1, NULL, NULL, 1764642247, NULL),
(78, 201, 'w', 40000, 2, NULL, NULL, 1764642247, NULL),
(96, 1041, 'i', 12000, 3, NULL, NULL, 1764642247, NULL),
(107, 528, 's', 1000, 1, NULL, NULL, 1764642247, NULL),
(107, 1484, 's', 5000, 5, NULL, NULL, 1764642247, NULL),
(116, 50, 'w', 80000, 4, NULL, NULL, 1764642247, NULL),
(123, 716, 'i', 8000, 2, NULL, NULL, 1764642247, NULL),
(160, 416, 'i', 20000, 5, NULL, NULL, 1764642247, NULL),
(226, 327, 'i', 20000, 5, NULL, NULL, 1764642247, NULL),
(369, 1072, 'w', 80000, 4, NULL, NULL, 1764642247, NULL),
(682, 1239, 'i', 4000, 1, NULL, NULL, 1764642247, NULL),
(691, 1366, 'f', 60000, 3, NULL, NULL, 1764642247, NULL),
(707, 1492, 'f', 100000, 5, NULL, NULL, 1764642247, NULL),
(713, 732, 'f', 60000, 3, NULL, NULL, 1764642247, NULL),
(721, 1012, 'i', 12000, 3, NULL, NULL, 1764642247, NULL),
(734, 864, 'f', 40000, 2, NULL, NULL, 1764642247, NULL),
(798, 858, 'i', 4000, 1, NULL, NULL, 1764642247, NULL),
(813, 310, 's', 4000, 4, NULL, NULL, 1764642247, NULL),
(860, 1301, 'f', 80000, 4, NULL, NULL, 1764642247, NULL),
(911, 216, 's', 2000, 2, NULL, NULL, 1764642247, NULL),
(919, 819, 'f', 40000, 2, NULL, NULL, 1764642247, NULL),
(923, 1395, 'w', 80000, 4, NULL, NULL, 1764642247, NULL),
(1036, 516, 'i', 16000, 4, NULL, NULL, 1764642247, NULL),
(1077, 868, 'f', 100000, 5, NULL, NULL, 1764642247, NULL),
(1133, 328, 'w', 80000, 4, NULL, NULL, 1764642247, NULL),
(1198, 86, 'f', 40000, 2, NULL, NULL, 1764642247, NULL),
(1279, 1483, 'w', 40000, 2, NULL, NULL, 1764642247, NULL),
(1348, 226, 'f', 100000, 5, NULL, NULL, 1764642247, NULL),
(1349, 460, 'f', 80000, 4, NULL, NULL, 1764642247, NULL),
(1369, 392, 'i', 12000, 3, NULL, NULL, 1764642247, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alliances`
--
ALTER TABLE `alliances`
  ADD PRIMARY KEY (`alliance_id`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `barbs`
--
ALTER TABLE `barbs`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msg_num`),
  ADD KEY `place` (`place`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `kvk`
--
ALTER TABLE `kvk`
  ADD PRIMARY KEY (`alliance`);

--
-- Indexes for table `marches`
--
ALTER TABLE `marches`
  ADD PRIMARY KEY (`march_id`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `rallies`
--
ALTER TABLE `rallies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD PRIMARY KEY (`num`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`spell_id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`x`,`y`),
  ADD KEY `owner` (`owner`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alliances`
--
ALTER TABLE `alliances`
  ADD CONSTRAINT `alliances_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`place`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kvk`
--
ALTER TABLE `kvk`
  ADD CONSTRAINT `kvk_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marches`
--
ALTER TABLE `marches`
  ADD CONSTRAINT `marches_ibfk_1` FOREIGN KEY (`player`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`id`) REFERENCES `_cities`.`logins` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD CONSTRAINT `serverinfo_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `_cities`.`logins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Database: `_2`
--
CREATE DATABASE IF NOT EXISTS `_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `_2`;

-- --------------------------------------------------------

--
-- Table structure for table `alliances`
--

CREATE TABLE `alliances` (
  `alliance_id` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `motto` text,
  `symbol_id` int NOT NULL DEFAULT '1',
  `leader` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `fort_x` int DEFAULT NULL,
  `fort_y` int DEFAULT NULL,
  `tower1_x` int DEFAULT NULL,
  `tower1_y` int DEFAULT NULL,
  `tower2_x` int DEFAULT NULL,
  `tower2_y` int DEFAULT NULL,
  `tower3_x` int DEFAULT NULL,
  `tower3_y` int DEFAULT NULL,
  `tower4_x` int DEFAULT NULL,
  `tower4_y` int DEFAULT NULL,
  `spells_x` int DEFAULT NULL,
  `spells_y` int DEFAULT NULL,
  `spell_donations` int NOT NULL DEFAULT '0',
  `spell_daily_donations` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alliances`
--

INSERT INTO `alliances` (`alliance_id`, `name`, `motto`, `symbol_id`, `leader`, `level`, `fort_x`, `fort_y`, `tower1_x`, `tower1_y`, `tower2_x`, `tower2_y`, `tower3_x`, `tower3_y`, `tower4_x`, `tower4_y`, `spells_x`, `spells_y`, `spell_donations`, `spell_daily_donations`) VALUES
('---', 'Kingdom chat', NULL, 1, -1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barbs`
--

CREATE TABLE `barbs` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL DEFAULT '3',
  `disappear_eta` bigint NOT NULL,
  `slain_1` tinyint(1) NOT NULL DEFAULT '0',
  `slain_2` tinyint(1) NOT NULL DEFAULT '0',
  `slain_3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barbs`
--

INSERT INTO `barbs` (`x`, `y`, `level`, `disappear_eta`, `slain_1`, `slain_2`, `slain_3`) VALUES
(57, 1378, 12, 1764642546, 0, 0, 0),
(111, 806, 15, 1764642546, 0, 0, 0),
(151, 145, 9, 1764642546, 0, 0, 0),
(164, 455, 15, 1764642546, 0, 0, 0),
(167, 76, 21, 1764642546, 0, 0, 0),
(197, 1329, 3, 1764642546, 0, 0, 0),
(237, 685, 18, 1764642546, 0, 0, 0),
(270, 965, 12, 1764642546, 0, 0, 0),
(274, 542, 6, 1764642546, 0, 0, 0),
(289, 491, 3, 1764642546, 0, 0, 0),
(383, 1468, 18, 1764642546, 0, 0, 0),
(467, 518, 21, 1764642546, 0, 0, 0),
(541, 1484, 18, 1764642546, 0, 0, 0),
(839, 124, 21, 1764642546, 0, 0, 0),
(881, 392, 15, 1764642546, 0, 0, 0),
(922, 1436, 18, 1764642546, 0, 0, 0),
(1109, 1455, 18, 1764642546, 0, 0, 0),
(1136, 164, 9, 1764642546, 0, 0, 0),
(1173, 28, 6, 1764642546, 0, 0, 0),
(1180, 1224, 3, 1764642546, 0, 0, 0),
(1220, 1169, 21, 1764642546, 0, 0, 0),
(1227, 172, 12, 1764642546, 0, 0, 0),
(1248, 1064, 3, 1764642546, 0, 0, 0),
(1255, 1170, 15, 1764642546, 0, 0, 0),
(1389, 62, 21, 1764642546, 0, 0, 0),
(1415, 322, 15, 1764642546, 0, 0, 0),
(1443, 87, 15, 1764642546, 0, 0, 0),
(1453, 86, 21, 1764642546, 0, 0, 0),
(1461, 847, 6, 1764642546, 0, 0, 0),
(1482, 290, 9, 1764642546, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `msg_num` int NOT NULL,
  `place` char(3) NOT NULL,
  `sender` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvk`
--

CREATE TABLE `kvk` (
  `alliance` char(3) NOT NULL,
  `seconds_held` int NOT NULL DEFAULT '0',
  `seconds_in_row` int NOT NULL DEFAULT '0',
  `start_hold` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvktowers`
--

CREATE TABLE `kvktowers` (
  `next_kvk_start` bigint NOT NULL,
  `next_kvk_end` bigint NOT NULL,
  `throne_lead_m` int DEFAULT NULL,
  `throne_j1_m` int DEFAULT NULL,
  `throne_j2_m` int DEFAULT NULL,
  `throne_j3_m` int DEFAULT NULL,
  `throne_j4_m` int DEFAULT NULL,
  `throne_j5_m` int DEFAULT NULL,
  `towerW_lead_m` int DEFAULT NULL,
  `towerW_j1_m` int DEFAULT NULL,
  `towerW_j2_m` int DEFAULT NULL,
  `towerW_j3_m` int DEFAULT NULL,
  `towerW_j4_m` int DEFAULT NULL,
  `towerW_j5_m` int DEFAULT NULL,
  `towerN_lead_m` int DEFAULT NULL,
  `towerN_j1_m` int DEFAULT NULL,
  `towerN_j2_m` int DEFAULT NULL,
  `towerN_j3_m` int DEFAULT NULL,
  `towerN_j4_m` int DEFAULT NULL,
  `towerN_j5_m` int DEFAULT NULL,
  `towerE_lead_m` int DEFAULT NULL,
  `towerE_j1_m` int DEFAULT NULL,
  `towerE_j2_m` int DEFAULT NULL,
  `towerE_j3_m` int DEFAULT NULL,
  `towerE_j4_m` int DEFAULT NULL,
  `towerE_j5_m` int DEFAULT NULL,
  `towerS_lead_m` int DEFAULT NULL,
  `towerS_j1_m` int DEFAULT NULL,
  `towerS_j2_m` int DEFAULT NULL,
  `towerS_j3_m` int DEFAULT NULL,
  `towerS_j4_m` int DEFAULT NULL,
  `towerS_j5_m` int DEFAULT NULL,
  `kvk_winner` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kvktowers`
--

INSERT INTO `kvktowers` (`next_kvk_start`, `next_kvk_end`, `throne_lead_m`, `throne_j1_m`, `throne_j2_m`, `throne_j3_m`, `throne_j4_m`, `throne_j5_m`, `towerW_lead_m`, `towerW_j1_m`, `towerW_j2_m`, `towerW_j3_m`, `towerW_j4_m`, `towerW_j5_m`, `towerN_lead_m`, `towerN_j1_m`, `towerN_j2_m`, `towerN_j3_m`, `towerN_j4_m`, `towerN_j5_m`, `towerE_lead_m`, `towerE_j1_m`, `towerE_j2_m`, `towerE_j3_m`, `towerE_j4_m`, `towerE_j5_m`, `towerS_lead_m`, `towerS_j1_m`, `towerS_j2_m`, `towerS_j3_m`, `towerS_j4_m`, `towerS_j5_m`, `kvk_winner`) VALUES
(1765015200, 1765101600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marches`
--

CREATE TABLE `marches` (
  `march_id` int NOT NULL,
  `player` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `marchtype` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `eta` bigint NOT NULL,
  `t1i` int NOT NULL DEFAULT '0',
  `t1c` int NOT NULL DEFAULT '0',
  `t1b` int NOT NULL DEFAULT '0',
  `t2i` int NOT NULL DEFAULT '0',
  `t2c` int NOT NULL DEFAULT '0',
  `t2b` int NOT NULL DEFAULT '0',
  `t3i` int NOT NULL DEFAULT '0',
  `t3c` int NOT NULL DEFAULT '0',
  `t3b` int NOT NULL DEFAULT '0',
  `t4i` int NOT NULL DEFAULT '0',
  `t4c` int NOT NULL DEFAULT '0',
  `t4b` int NOT NULL DEFAULT '0',
  `t5i` int NOT NULL DEFAULT '0',
  `t5c` int NOT NULL DEFAULT '0',
  `t5b` int NOT NULL DEFAULT '0',
  `dragon` tinyint(1) NOT NULL DEFAULT '0',
  `hero1` int DEFAULT NULL,
  `hero2` int DEFAULT NULL,
  `marchtime` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL,
  `disappear_eta` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`x`, `y`, `level`, `disappear_eta`) VALUES
(18, 483, 17, 1764642546),
(76, 366, 5, 1764642547),
(121, 150, 11, 1764642546),
(133, 81, 13, 1764642546),
(133, 1107, 18, 1764642547),
(155, 959, 2, 1764642546),
(165, 1380, 1, 1764642546),
(323, 1168, 19, 1764642547),
(349, 84, 18, 1764642546),
(351, 209, 18, 1764642546),
(415, 386, 9, 1764642546),
(437, 31, 20, 1764642546),
(559, 100, 12, 1764642546),
(629, 1101, 9, 1764642546),
(632, 753, 10, 1764642547),
(764, 1104, 15, 1764642546),
(842, 1050, 11, 1764642546),
(854, 620, 6, 1764642546),
(857, 425, 6, 1764642547),
(920, 862, 9, 1764642546),
(981, 1099, 12, 1764642547),
(1001, 1360, 10, 1764642546),
(1142, 1299, 5, 1764642546),
(1187, 680, 15, 1764642546),
(1200, 1210, 7, 1764642546),
(1227, 798, 1, 1764642546),
(1341, 836, 9, 1764642546),
(1342, 1095, 9, 1764642546),
(1350, 1417, 4, 1764642547),
(1437, 225, 4, 1764642546);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `x` int NOT NULL DEFAULT '5',
  `y` int NOT NULL DEFAULT '5',
  `alliance` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '---'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rallies`
--

CREATE TABLE `rallies` (
  `id` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `starter_march` int NOT NULL,
  `joiner1_march` int DEFAULT NULL,
  `joiner2_march` int DEFAULT NULL,
  `joiner3_march` int DEFAULT NULL,
  `joiner4_march` int DEFAULT NULL,
  `joiner5_march` int DEFAULT NULL,
  `length` int NOT NULL,
  `barb_level` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverinfo`
--

CREATE TABLE `serverinfo` (
  `num` int NOT NULL,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT 'Княжество',
  `leader` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `serverinfo`
--

INSERT INTO `serverinfo` (`num`, `current`, `name`, `leader`) VALUES
(1, 0, 'Княжество', -1),
(2, 0, 'Княжество', -1);

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `spell_id` int NOT NULL,
  `alliance` char(3) NOT NULL,
  `type` int NOT NULL,
  `eta` bigint NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `player_id` int DEFAULT NULL,
  `alliance_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `type` char(1) NOT NULL,
  `amount` int NOT NULL,
  `level` int NOT NULL,
  `owner` int DEFAULT NULL,
  `gathereta` bigint DEFAULT NULL,
  `disappear_eta` bigint NOT NULL,
  `gathered_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tiles`
--

INSERT INTO `tiles` (`x`, `y`, `type`, `amount`, `level`, `owner`, `gathereta`, `disappear_eta`, `gathered_amount`) VALUES
(5, 627, 's', 1000, 1, NULL, NULL, 1764642547, NULL),
(172, 1218, 'w', 20000, 1, NULL, NULL, 1764642547, NULL),
(198, 377, 'f', 80000, 4, NULL, NULL, 1764642547, NULL),
(259, 420, 'f', 40000, 2, NULL, NULL, 1764642547, NULL),
(330, 407, 'i', 20000, 5, NULL, NULL, 1764642547, NULL),
(401, 117, 'w', 60000, 3, NULL, NULL, 1764642547, NULL),
(403, 1458, 'f', 20000, 1, NULL, NULL, 1764642547, NULL),
(451, 1456, 'i', 8000, 2, NULL, NULL, 1764642547, NULL),
(463, 693, 'f', 80000, 4, NULL, NULL, 1764642547, NULL),
(518, 1158, 'f', 20000, 1, NULL, NULL, 1764642547, NULL),
(525, 341, 's', 4000, 4, NULL, NULL, 1764642547, NULL),
(526, 81, 'f', 40000, 2, NULL, NULL, 1764642547, NULL),
(535, 1165, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(573, 1075, 'i', 16000, 4, NULL, NULL, 1764642547, NULL),
(600, 141, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(770, 660, 'w', 100000, 5, NULL, NULL, 1764642547, NULL),
(880, 1476, 'w', 60000, 3, NULL, NULL, 1764642547, NULL),
(1010, 144, 'i', 12000, 3, NULL, NULL, 1764642547, NULL),
(1034, 191, 'f', 60000, 3, NULL, NULL, 1764642547, NULL),
(1063, 1335, 'w', 40000, 2, NULL, NULL, 1764642547, NULL),
(1111, 1349, 's', 3000, 3, NULL, NULL, 1764642547, NULL),
(1116, 1313, 'w', 80000, 4, NULL, NULL, 1764642547, NULL),
(1126, 568, 'w', 40000, 2, NULL, NULL, 1764642547, NULL),
(1303, 768, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(1322, 1, 'i', 20000, 5, NULL, NULL, 1764642547, NULL),
(1385, 588, 'i', 12000, 3, NULL, NULL, 1764642547, NULL),
(1391, 535, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(1393, 205, 'i', 16000, 4, NULL, NULL, 1764642547, NULL),
(1413, 685, 'w', 60000, 3, NULL, NULL, 1764642547, NULL),
(1437, 1055, 'w', 80000, 4, NULL, NULL, 1764642547, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alliances`
--
ALTER TABLE `alliances`
  ADD PRIMARY KEY (`alliance_id`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `barbs`
--
ALTER TABLE `barbs`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msg_num`),
  ADD KEY `place` (`place`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `kvk`
--
ALTER TABLE `kvk`
  ADD PRIMARY KEY (`alliance`);

--
-- Indexes for table `marches`
--
ALTER TABLE `marches`
  ADD PRIMARY KEY (`march_id`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `rallies`
--
ALTER TABLE `rallies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD PRIMARY KEY (`num`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`spell_id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`x`,`y`),
  ADD KEY `owner` (`owner`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alliances`
--
ALTER TABLE `alliances`
  ADD CONSTRAINT `alliances_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`place`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kvk`
--
ALTER TABLE `kvk`
  ADD CONSTRAINT `kvk_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marches`
--
ALTER TABLE `marches`
  ADD CONSTRAINT `marches_ibfk_1` FOREIGN KEY (`player`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`id`) REFERENCES `_cities`.`logins` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD CONSTRAINT `serverinfo_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `_cities`.`logins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Database: `_3`
--
CREATE DATABASE IF NOT EXISTS `_3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `_3`;

-- --------------------------------------------------------

--
-- Table structure for table `alliances`
--

CREATE TABLE `alliances` (
  `alliance_id` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `motto` text,
  `symbol_id` int NOT NULL DEFAULT '1',
  `leader` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `fort_x` int DEFAULT NULL,
  `fort_y` int DEFAULT NULL,
  `tower1_x` int DEFAULT NULL,
  `tower1_y` int DEFAULT NULL,
  `tower2_x` int DEFAULT NULL,
  `tower2_y` int DEFAULT NULL,
  `tower3_x` int DEFAULT NULL,
  `tower3_y` int DEFAULT NULL,
  `tower4_x` int DEFAULT NULL,
  `tower4_y` int DEFAULT NULL,
  `spells_x` int DEFAULT NULL,
  `spells_y` int DEFAULT NULL,
  `spell_donations` int NOT NULL DEFAULT '0',
  `spell_daily_donations` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alliances`
--

INSERT INTO `alliances` (`alliance_id`, `name`, `motto`, `symbol_id`, `leader`, `level`, `fort_x`, `fort_y`, `tower1_x`, `tower1_y`, `tower2_x`, `tower2_y`, `tower3_x`, `tower3_y`, `tower4_x`, `tower4_y`, `spells_x`, `spells_y`, `spell_donations`, `spell_daily_donations`) VALUES
('---', 'Kingdom chat', NULL, 1, -1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barbs`
--

CREATE TABLE `barbs` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL DEFAULT '3',
  `disappear_eta` bigint NOT NULL,
  `slain_1` tinyint(1) NOT NULL DEFAULT '0',
  `slain_2` tinyint(1) NOT NULL DEFAULT '0',
  `slain_3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barbs`
--

INSERT INTO `barbs` (`x`, `y`, `level`, `disappear_eta`, `slain_1`, `slain_2`, `slain_3`) VALUES
(61, 1358, 3, 1764642547, 0, 0, 0),
(65, 230, 15, 1764642547, 0, 0, 0),
(115, 82, 9, 1764642547, 0, 0, 0),
(199, 1174, 12, 1764642547, 0, 0, 0),
(255, 1149, 6, 1764642547, 0, 0, 0),
(256, 334, 18, 1764642547, 0, 0, 0),
(279, 344, 3, 1764642547, 0, 0, 0),
(315, 270, 18, 1764642547, 0, 0, 0),
(347, 585, 15, 1764642547, 0, 0, 0),
(360, 1252, 18, 1764642547, 0, 0, 0),
(470, 798, 21, 1764642547, 0, 0, 0),
(478, 1109, 12, 1764642547, 0, 0, 0),
(544, 110, 18, 1764642547, 0, 0, 0),
(591, 658, 6, 1764642547, 0, 0, 0),
(638, 1349, 12, 1764642547, 0, 0, 0),
(672, 1228, 6, 1764642547, 0, 0, 0),
(685, 213, 9, 1764642547, 0, 0, 0),
(699, 691, 3, 1764642547, 0, 0, 0),
(715, 1257, 12, 1764642547, 0, 0, 0),
(747, 798, 18, 1764642547, 0, 0, 0),
(766, 1209, 21, 1764642547, 0, 0, 0),
(813, 1211, 6, 1764642547, 0, 0, 0),
(833, 830, 9, 1764642547, 0, 0, 0),
(855, 899, 18, 1764642547, 0, 0, 0),
(910, 692, 12, 1764642547, 0, 0, 0),
(959, 1161, 15, 1764642547, 0, 0, 0),
(1047, 1190, 3, 1764642547, 0, 0, 0),
(1278, 752, 18, 1764642547, 0, 0, 0),
(1292, 1028, 21, 1764642547, 0, 0, 0),
(1405, 814, 15, 1764642547, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `msg_num` int NOT NULL,
  `place` char(3) NOT NULL,
  `sender` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvk`
--

CREATE TABLE `kvk` (
  `alliance` char(3) NOT NULL,
  `seconds_held` int NOT NULL DEFAULT '0',
  `seconds_in_row` int NOT NULL DEFAULT '0',
  `start_hold` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvktowers`
--

CREATE TABLE `kvktowers` (
  `next_kvk_start` bigint NOT NULL,
  `next_kvk_end` bigint NOT NULL,
  `throne_lead_m` int DEFAULT NULL,
  `throne_j1_m` int DEFAULT NULL,
  `throne_j2_m` int DEFAULT NULL,
  `throne_j3_m` int DEFAULT NULL,
  `throne_j4_m` int DEFAULT NULL,
  `throne_j5_m` int DEFAULT NULL,
  `towerW_lead_m` int DEFAULT NULL,
  `towerW_j1_m` int DEFAULT NULL,
  `towerW_j2_m` int DEFAULT NULL,
  `towerW_j3_m` int DEFAULT NULL,
  `towerW_j4_m` int DEFAULT NULL,
  `towerW_j5_m` int DEFAULT NULL,
  `towerN_lead_m` int DEFAULT NULL,
  `towerN_j1_m` int DEFAULT NULL,
  `towerN_j2_m` int DEFAULT NULL,
  `towerN_j3_m` int DEFAULT NULL,
  `towerN_j4_m` int DEFAULT NULL,
  `towerN_j5_m` int DEFAULT NULL,
  `towerE_lead_m` int DEFAULT NULL,
  `towerE_j1_m` int DEFAULT NULL,
  `towerE_j2_m` int DEFAULT NULL,
  `towerE_j3_m` int DEFAULT NULL,
  `towerE_j4_m` int DEFAULT NULL,
  `towerE_j5_m` int DEFAULT NULL,
  `towerS_lead_m` int DEFAULT NULL,
  `towerS_j1_m` int DEFAULT NULL,
  `towerS_j2_m` int DEFAULT NULL,
  `towerS_j3_m` int DEFAULT NULL,
  `towerS_j4_m` int DEFAULT NULL,
  `towerS_j5_m` int DEFAULT NULL,
  `kvk_winner` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kvktowers`
--

INSERT INTO `kvktowers` (`next_kvk_start`, `next_kvk_end`, `throne_lead_m`, `throne_j1_m`, `throne_j2_m`, `throne_j3_m`, `throne_j4_m`, `throne_j5_m`, `towerW_lead_m`, `towerW_j1_m`, `towerW_j2_m`, `towerW_j3_m`, `towerW_j4_m`, `towerW_j5_m`, `towerN_lead_m`, `towerN_j1_m`, `towerN_j2_m`, `towerN_j3_m`, `towerN_j4_m`, `towerN_j5_m`, `towerE_lead_m`, `towerE_j1_m`, `towerE_j2_m`, `towerE_j3_m`, `towerE_j4_m`, `towerE_j5_m`, `towerS_lead_m`, `towerS_j1_m`, `towerS_j2_m`, `towerS_j3_m`, `towerS_j4_m`, `towerS_j5_m`, `kvk_winner`) VALUES
(1765015200, 1765101600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marches`
--

CREATE TABLE `marches` (
  `march_id` int NOT NULL,
  `player` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `marchtype` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `eta` bigint NOT NULL,
  `t1i` int NOT NULL DEFAULT '0',
  `t1c` int NOT NULL DEFAULT '0',
  `t1b` int NOT NULL DEFAULT '0',
  `t2i` int NOT NULL DEFAULT '0',
  `t2c` int NOT NULL DEFAULT '0',
  `t2b` int NOT NULL DEFAULT '0',
  `t3i` int NOT NULL DEFAULT '0',
  `t3c` int NOT NULL DEFAULT '0',
  `t3b` int NOT NULL DEFAULT '0',
  `t4i` int NOT NULL DEFAULT '0',
  `t4c` int NOT NULL DEFAULT '0',
  `t4b` int NOT NULL DEFAULT '0',
  `t5i` int NOT NULL DEFAULT '0',
  `t5c` int NOT NULL DEFAULT '0',
  `t5b` int NOT NULL DEFAULT '0',
  `dragon` tinyint(1) NOT NULL DEFAULT '0',
  `hero1` int DEFAULT NULL,
  `hero2` int DEFAULT NULL,
  `marchtime` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL,
  `disappear_eta` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`x`, `y`, `level`, `disappear_eta`) VALUES
(8, 66, 10, 1764642547),
(30, 1469, 9, 1764642547),
(31, 965, 5, 1764642547),
(137, 1209, 12, 1764642547),
(139, 919, 4, 1764642547),
(174, 231, 12, 1764642547),
(312, 743, 15, 1764642547),
(435, 1242, 6, 1764642547),
(489, 140, 18, 1764642547),
(499, 334, 19, 1764642547),
(523, 753, 17, 1764642547),
(606, 496, 9, 1764642547),
(637, 1017, 2, 1764642547),
(659, 480, 18, 1764642547),
(668, 530, 1, 1764642547),
(676, 918, 2, 1764642547),
(678, 640, 4, 1764642547),
(755, 850, 3, 1764642547),
(953, 687, 14, 1764642547),
(1012, 713, 13, 1764642547),
(1020, 727, 8, 1764642547),
(1022, 111, 11, 1764642547),
(1099, 803, 11, 1764642547),
(1168, 28, 7, 1764642547),
(1218, 337, 20, 1764642547),
(1291, 639, 4, 1764642547),
(1361, 605, 7, 1764642547),
(1368, 601, 19, 1764642547),
(1382, 1332, 20, 1764642547),
(1436, 338, 1, 1764642547);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `x` int NOT NULL DEFAULT '5',
  `y` int NOT NULL DEFAULT '5',
  `alliance` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '---'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `x`, `y`, `alliance`) VALUES
(90980161, 648, 135, '---');

-- --------------------------------------------------------

--
-- Table structure for table `rallies`
--

CREATE TABLE `rallies` (
  `id` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `starter_march` int NOT NULL,
  `joiner1_march` int DEFAULT NULL,
  `joiner2_march` int DEFAULT NULL,
  `joiner3_march` int DEFAULT NULL,
  `joiner4_march` int DEFAULT NULL,
  `joiner5_march` int DEFAULT NULL,
  `length` int NOT NULL,
  `barb_level` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverinfo`
--

CREATE TABLE `serverinfo` (
  `num` int NOT NULL,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT 'Княжество',
  `leader` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `serverinfo`
--

INSERT INTO `serverinfo` (`num`, `current`, `name`, `leader`) VALUES
(1, 0, 'Княжество', -1),
(2, 0, 'Княжество', -1),
(3, 0, 'Княжество', -1),
(4, 0, 'Княжество', -1),
(5, 0, 'Княжество', -1),
(6, 0, 'Княжество', -1),
(7, 0, 'Княжество', -1),
(8, 0, 'Княжество', -1),
(9, 0, 'Княжество', -1),
(10, 0, 'Княжество', -1),
(11, 0, 'Княжество', -1),
(12, 0, 'Княжество', -1),
(13, 0, 'Княжество', -1),
(14, 0, 'Княжество', -1),
(15, 0, 'Княжество', -1),
(16, 0, 'Княжество', -1),
(17, 0, 'Княжество', -1),
(18, 0, 'Княжество', -1),
(19, 0, 'Княжество', -1),
(20, 0, 'Княжество', -1),
(21, 0, 'Княжество', -1),
(22, 0, 'Княжество', -1),
(23, 0, 'Княжество', -1),
(24, 0, 'Княжество', -1),
(25, 0, 'Княжество', -1),
(26, 0, 'Княжество', -1),
(27, 0, 'Княжество', -1),
(28, 0, 'Княжество', -1),
(29, 0, 'Княжество', -1),
(30, 0, 'Княжество', -1),
(31, 0, 'Княжество', -1),
(32, 0, 'Княжество', -1),
(33, 0, 'Княжество', -1),
(34, 0, 'Княжество', -1),
(35, 0, 'Княжество', -1),
(36, 0, 'Княжество', -1),
(37, 0, 'Княжество', -1),
(38, 0, 'Княжество', -1),
(39, 0, 'Княжество', -1),
(40, 0, 'Княжество', -1),
(41, 0, 'Княжество', -1),
(42, 0, 'Княжество', -1),
(43, 1, 'Княжество', -1);

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `spell_id` int NOT NULL,
  `alliance` char(3) NOT NULL,
  `type` int NOT NULL,
  `eta` bigint NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `player_id` int DEFAULT NULL,
  `alliance_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `type` char(1) NOT NULL,
  `amount` int NOT NULL,
  `level` int NOT NULL,
  `owner` int DEFAULT NULL,
  `gathereta` bigint DEFAULT NULL,
  `disappear_eta` bigint NOT NULL,
  `gathered_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tiles`
--

INSERT INTO `tiles` (`x`, `y`, `type`, `amount`, `level`, `owner`, `gathereta`, `disappear_eta`, `gathered_amount`) VALUES
(15, 1214, 'i', 16000, 4, NULL, NULL, 1764642547, NULL),
(42, 1118, 'w', 20000, 1, NULL, NULL, 1764642547, NULL),
(48, 6, 'f', 80000, 4, NULL, NULL, 1764642547, NULL),
(113, 347, 'w', 20000, 1, NULL, NULL, 1764642547, NULL),
(139, 255, 'w', 20000, 1, NULL, NULL, 1764642547, NULL),
(245, 887, 'i', 8000, 2, NULL, NULL, 1764642547, NULL),
(328, 1423, 'f', 40000, 2, NULL, NULL, 1764642547, NULL),
(415, 954, 'i', 20000, 5, NULL, NULL, 1764642547, NULL),
(424, 898, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(469, 38, 'w', 60000, 3, NULL, NULL, 1764642547, NULL),
(470, 1419, 'i', 20000, 5, NULL, NULL, 1764642547, NULL),
(540, 989, 's', 4000, 4, NULL, NULL, 1764642547, NULL),
(589, 1446, 'w', 100000, 5, NULL, NULL, 1764642547, NULL),
(606, 1171, 'f', 100000, 5, NULL, NULL, 1764642547, NULL),
(608, 1380, 'f', 40000, 2, NULL, NULL, 1764642547, NULL),
(687, 1107, 's', 5000, 5, NULL, NULL, 1764642547, NULL),
(697, 386, 'w', 80000, 4, NULL, NULL, 1764642547, NULL),
(704, 1450, 'i', 8000, 2, NULL, NULL, 1764642547, NULL),
(742, 219, 'i', 20000, 5, NULL, NULL, 1764642547, NULL),
(1060, 1453, 'f', 80000, 4, NULL, NULL, 1764642547, NULL),
(1075, 157, 'w', 80000, 4, NULL, NULL, 1764642547, NULL),
(1115, 1115, 's', 5000, 5, NULL, NULL, 1764642547, NULL),
(1122, 661, 'i', 4000, 1, NULL, NULL, 1764642547, NULL),
(1141, 929, 'w', 100000, 5, NULL, NULL, 1764642547, NULL),
(1148, 588, 'i', 16000, 4, NULL, NULL, 1764642547, NULL),
(1222, 604, 'w', 80000, 4, NULL, NULL, 1764642547, NULL),
(1224, 511, 'i', 16000, 4, NULL, NULL, 1764642547, NULL),
(1308, 724, 's', 5000, 5, NULL, NULL, 1764642547, NULL),
(1439, 450, 's', 2000, 2, NULL, NULL, 1764642547, NULL),
(1448, 1226, 'w', 80000, 4, NULL, NULL, 1764642547, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alliances`
--
ALTER TABLE `alliances`
  ADD PRIMARY KEY (`alliance_id`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `barbs`
--
ALTER TABLE `barbs`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msg_num`),
  ADD KEY `place` (`place`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `kvk`
--
ALTER TABLE `kvk`
  ADD PRIMARY KEY (`alliance`);

--
-- Indexes for table `marches`
--
ALTER TABLE `marches`
  ADD PRIMARY KEY (`march_id`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `rallies`
--
ALTER TABLE `rallies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD PRIMARY KEY (`num`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`spell_id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`x`,`y`),
  ADD KEY `owner` (`owner`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alliances`
--
ALTER TABLE `alliances`
  ADD CONSTRAINT `alliances_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`place`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kvk`
--
ALTER TABLE `kvk`
  ADD CONSTRAINT `kvk_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marches`
--
ALTER TABLE `marches`
  ADD CONSTRAINT `marches_ibfk_1` FOREIGN KEY (`player`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`id`) REFERENCES `_cities`.`logins` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD CONSTRAINT `serverinfo_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `_cities`.`logins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Database: `_cities`
--
CREATE DATABASE IF NOT EXISTS `_cities` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `_cities`;

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE `ad` (
  `id` int NOT NULL,
  `html` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ad`
--

INSERT INTO `ad` (`id`, `html`) VALUES
(1, 'http://localhost/your_ad.html');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` int NOT NULL,
  `lv_stronghold` int NOT NULL DEFAULT '1',
  `lv_draglair` int NOT NULL DEFAULT '1',
  `lv_infantry` int NOT NULL DEFAULT '1',
  `lv_horses` int NOT NULL DEFAULT '0',
  `lv_bow` int NOT NULL DEFAULT '0',
  `lv_traincamp` int NOT NULL DEFAULT '1',
  `lv_hospital` int NOT NULL DEFAULT '0',
  `food` int NOT NULL DEFAULT '100000',
  `wood` int NOT NULL DEFAULT '100000',
  `iron` int NOT NULL DEFAULT '0',
  `silver` int NOT NULL DEFAULT '0',
  `gold` int NOT NULL DEFAULT '0',
  `lv_storehouse` int NOT NULL DEFAULT '1',
  `lv_rally` int NOT NULL DEFAULT '0',
  `building_under_upgrade` varchar(20) DEFAULT NULL,
  `building_eta` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `lv_stronghold`, `lv_draglair`, `lv_infantry`, `lv_horses`, `lv_bow`, `lv_traincamp`, `lv_hospital`, `food`, `wood`, `iron`, `silver`, `gold`, `lv_storehouse`, `lv_rally`, `building_under_upgrade`, `building_eta`) VALUES
(90980161, 2, 2, 2, 0, 0, 1, 0, 44000, 72000, 0, 0, 42000, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `captchas`
--

CREATE TABLE `captchas` (
  `id` int NOT NULL,
  `picture` char(255) DEFAULT NULL,
  `rightanswer` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `captchas`
--

INSERT INTO `captchas` (`id`, `picture`, `rightanswer`) VALUES
(1, 'http://localhost/1.jpg', 'F8QX'),
(2, 'http://localhost/2.jpg', 'HX24'),
(3, 'http://localhost/3.jpg', '92NU');

-- --------------------------------------------------------

--
-- Table structure for table `dragon`
--

CREATE TABLE `dragon` (
  `id` int NOT NULL,
  `lvl` int NOT NULL DEFAULT '0',
  `skill1` int NOT NULL DEFAULT '0',
  `skill2` int NOT NULL DEFAULT '0',
  `skill3` int NOT NULL DEFAULT '0',
  `skill4` int NOT NULL DEFAULT '0',
  `skill5` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dragon`
--

INSERT INTO `dragon` (`id`, `lvl`, `skill1`, `skill2`, `skill3`, `skill4`, `skill5`) VALUES
(90980161, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int NOT NULL,
  `geargrade` int DEFAULT NULL,
  `geartype` char(25) DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `gearlv` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE `heroes` (
  `id` int NOT NULL,
  `hero1` int NOT NULL DEFAULT '0',
  `hero1skill1` int NOT NULL DEFAULT '0',
  `hero1skill2` int NOT NULL DEFAULT '0',
  `hero1skill3` int NOT NULL DEFAULT '0',
  `hero2` int NOT NULL DEFAULT '0',
  `hero2skill1` int NOT NULL DEFAULT '0',
  `hero2skill2` int NOT NULL DEFAULT '0',
  `hero2skill3` int NOT NULL DEFAULT '0',
  `hero3` int NOT NULL DEFAULT '0',
  `hero3skill1` int NOT NULL DEFAULT '0',
  `hero3skill2` int NOT NULL DEFAULT '0',
  `hero3skill3` int NOT NULL DEFAULT '0',
  `hero4` int NOT NULL DEFAULT '0',
  `hero4skill1` int NOT NULL DEFAULT '0',
  `hero4skill2` int NOT NULL DEFAULT '0',
  `hero4skill3` int NOT NULL DEFAULT '0',
  `is_h1_present` tinyint(1) DEFAULT NULL,
  `is_h2_present` tinyint(1) DEFAULT NULL,
  `is_h3_present` tinyint(1) DEFAULT NULL,
  `is_h4_present` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`id`, `hero1`, `hero1skill1`, `hero1skill2`, `hero1skill3`, `hero2`, `hero2skill1`, `hero2skill2`, `hero2skill3`, `hero3`, `hero3skill1`, `hero3skill2`, `hero3skill3`, `hero4`, `hero4skill1`, `hero4skill2`, `hero4skill3`, `is_h1_present`, `is_h2_present`, `is_h3_present`, `is_h4_present`) VALUES
(90980161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hosp`
--

CREATE TABLE `hosp` (
  `id` int NOT NULL,
  `t1i` int NOT NULL DEFAULT '0',
  `t1c` int NOT NULL DEFAULT '0',
  `t1b` int NOT NULL DEFAULT '0',
  `t2i` int NOT NULL DEFAULT '0',
  `t2c` int NOT NULL DEFAULT '0',
  `t2b` int NOT NULL DEFAULT '0',
  `t3i` int NOT NULL DEFAULT '0',
  `t3c` int NOT NULL DEFAULT '0',
  `t3b` int NOT NULL DEFAULT '0',
  `t4i` int NOT NULL DEFAULT '0',
  `t4c` int NOT NULL DEFAULT '0',
  `t4b` int NOT NULL DEFAULT '0',
  `t5i` int NOT NULL DEFAULT '0',
  `t5c` int NOT NULL DEFAULT '0',
  `t5b` int NOT NULL DEFAULT '0',
  `started` tinyint(1) NOT NULL DEFAULT '0',
  `eta` bigint NOT NULL DEFAULT '0',
  `t1ih` int NOT NULL DEFAULT '0',
  `t2ih` int NOT NULL DEFAULT '0',
  `t3ih` int NOT NULL DEFAULT '0',
  `t4ih` int NOT NULL DEFAULT '0',
  `t5ih` int NOT NULL DEFAULT '0',
  `t1ch` int NOT NULL DEFAULT '0',
  `t2ch` int NOT NULL DEFAULT '0',
  `t3ch` int NOT NULL DEFAULT '0',
  `t4ch` int NOT NULL DEFAULT '0',
  `t5ch` int NOT NULL DEFAULT '0',
  `t1bh` int NOT NULL DEFAULT '0',
  `t2bh` int NOT NULL DEFAULT '0',
  `t3bh` int NOT NULL DEFAULT '0',
  `t4bh` int NOT NULL DEFAULT '0',
  `t5bh` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hosp`
--

INSERT INTO `hosp` (`id`, `t1i`, `t1c`, `t1b`, `t2i`, `t2c`, `t2b`, `t3i`, `t3c`, `t3b`, `t4i`, `t4c`, `t4b`, `t5i`, `t5c`, `t5b`, `started`, `eta`, `t1ih`, `t2ih`, `t3ih`, `t4ih`, `t5ih`, `t1ch`, `t2ch`, `t3ch`, `t4ch`, `t5ch`, `t1bh`, `t2bh`, `t3bh`, `t4bh`, `t5bh`) VALUES
(90980161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int DEFAULT NULL,
  `itemtype` char(100) DEFAULT NULL,
  `itemcount` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int NOT NULL,
  `email` char(255) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `pass` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `portrait` char(255) DEFAULT NULL,
  `nickname` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `servernum` int DEFAULT NULL,
  `premium` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `email`, `phone`, `pass`, `portrait`, `nickname`, `servernum`, `premium`) VALUES
(-1, NULL, NULL, NULL, NULL, 'System', NULL, 0),
(90980161, 'example@example.com', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, 'Prince#90980161', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `id` int NOT NULL,
  `sender` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` bigint NOT NULL,
  `mailread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`id`, `sender`, `content`, `time`, `mailread`) VALUES
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1714575615, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599347, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599347, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599348, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599349, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599350, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599351, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599351, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599351, 0),
(90980161, -1, 'Congratulations! Your alliance has won the battle for the server. You have been awarded 1000 gold, and your leader has been assigned as server leader.', 1764599351, 0);

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `num` int NOT NULL,
  `db` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`num`, `db`) VALUES
(1, '_1'),
(2, '_2'),
(3, '_3');

-- --------------------------------------------------------

--
-- Table structure for table `troops`
--

CREATE TABLE `troops` (
  `id` int NOT NULL,
  `t1inf` int NOT NULL DEFAULT '100',
  `t1cav` int NOT NULL DEFAULT '100',
  `t1bow` int NOT NULL DEFAULT '100',
  `t2inf` int NOT NULL DEFAULT '0',
  `t2cav` int NOT NULL DEFAULT '0',
  `t2bow` int NOT NULL DEFAULT '0',
  `t3inf` int NOT NULL DEFAULT '0',
  `t3cav` int NOT NULL DEFAULT '0',
  `t3bow` int NOT NULL DEFAULT '0',
  `t4inf` int NOT NULL DEFAULT '0',
  `t4cav` int NOT NULL DEFAULT '0',
  `t4bow` int NOT NULL DEFAULT '0',
  `t5inf` int NOT NULL DEFAULT '0',
  `t5cav` int NOT NULL DEFAULT '0',
  `t5bow` int NOT NULL DEFAULT '0',
  `train_inf_eta` bigint DEFAULT '0',
  `tier_inf` int NOT NULL DEFAULT '0',
  `num_inf` int NOT NULL DEFAULT '0',
  `train_cav_eta` bigint DEFAULT '0',
  `tier_cav` int NOT NULL DEFAULT '0',
  `num_cav` int NOT NULL DEFAULT '0',
  `train_bow_eta` bigint NOT NULL DEFAULT '0',
  `tier_bow` int NOT NULL DEFAULT '0',
  `num_bow` int NOT NULL DEFAULT '0',
  `isdragonhome` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `troops`
--

INSERT INTO `troops` (`id`, `t1inf`, `t1cav`, `t1bow`, `t2inf`, `t2cav`, `t2bow`, `t3inf`, `t3cav`, `t3bow`, `t4inf`, `t4cav`, `t4bow`, `t5inf`, `t5cav`, `t5bow`, `train_inf_eta`, `tier_inf`, `num_inf`, `train_cav_eta`, `tier_cav`, `num_cav`, `train_bow_eta`, `tier_bow`, `num_bow`, `isdragonhome`) VALUES
(90980161, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captchas`
--
ALTER TABLE `captchas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dragon`
--
ALTER TABLE `dragon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `heroes`
--
ALTER TABLE `heroes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hosp`
--
ALTER TABLE `hosp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD KEY `id` (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD KEY `mail_ibfk_1` (`sender`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `troops`
--
ALTER TABLE `troops`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dragon`
--
ALTER TABLE `dragon`
  ADD CONSTRAINT `dragon_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `heroes`
--
ALTER TABLE `heroes`
  ADD CONSTRAINT `heroes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hosp`
--
ALTER TABLE `hosp`
  ADD CONSTRAINT `hosp_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `troops`
--
ALTER TABLE `troops`
  ADD CONSTRAINT `troops_ibfk_1` FOREIGN KEY (`id`) REFERENCES `logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `_template`
--
CREATE DATABASE IF NOT EXISTS `_template` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `_template`;

-- --------------------------------------------------------

--
-- Table structure for table `alliances`
--

CREATE TABLE `alliances` (
  `alliance_id` char(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `motto` text,
  `symbol_id` int NOT NULL DEFAULT '1',
  `leader` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `fort_x` int DEFAULT NULL,
  `fort_y` int DEFAULT NULL,
  `tower1_x` int DEFAULT NULL,
  `tower1_y` int DEFAULT NULL,
  `tower2_x` int DEFAULT NULL,
  `tower2_y` int DEFAULT NULL,
  `tower3_x` int DEFAULT NULL,
  `tower3_y` int DEFAULT NULL,
  `tower4_x` int DEFAULT NULL,
  `tower4_y` int DEFAULT NULL,
  `spells_x` int DEFAULT NULL,
  `spells_y` int DEFAULT NULL,
  `spell_donations` int NOT NULL DEFAULT '0',
  `spell_daily_donations` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alliances`
--

INSERT INTO `alliances` (`alliance_id`, `name`, `motto`, `symbol_id`, `leader`, `level`, `fort_x`, `fort_y`, `tower1_x`, `tower1_y`, `tower2_x`, `tower2_y`, `tower3_x`, `tower3_y`, `tower4_x`, `tower4_y`, `spells_x`, `spells_y`, `spell_donations`, `spell_daily_donations`) VALUES
('---', 'Kingdom chat', NULL, 1, -1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barbs`
--

CREATE TABLE `barbs` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL DEFAULT '3',
  `disappear_eta` bigint NOT NULL,
  `slain_1` tinyint(1) NOT NULL DEFAULT '0',
  `slain_2` tinyint(1) NOT NULL DEFAULT '0',
  `slain_3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `msg_num` int NOT NULL,
  `place` char(3) NOT NULL,
  `sender` int NOT NULL,
  `message` varchar(150) NOT NULL,
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvk`
--

CREATE TABLE `kvk` (
  `alliance` char(3) NOT NULL,
  `seconds_held` int NOT NULL DEFAULT '0',
  `seconds_in_row` int NOT NULL DEFAULT '0',
  `start_hold` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kvktowers`
--

CREATE TABLE `kvktowers` (
  `next_kvk_start` bigint NOT NULL,
  `next_kvk_end` bigint NOT NULL,
  `throne_lead_m` int DEFAULT NULL,
  `throne_j1_m` int DEFAULT NULL,
  `throne_j2_m` int DEFAULT NULL,
  `throne_j3_m` int DEFAULT NULL,
  `throne_j4_m` int DEFAULT NULL,
  `throne_j5_m` int DEFAULT NULL,
  `towerW_lead_m` int DEFAULT NULL,
  `towerW_j1_m` int DEFAULT NULL,
  `towerW_j2_m` int DEFAULT NULL,
  `towerW_j3_m` int DEFAULT NULL,
  `towerW_j4_m` int DEFAULT NULL,
  `towerW_j5_m` int DEFAULT NULL,
  `towerN_lead_m` int DEFAULT NULL,
  `towerN_j1_m` int DEFAULT NULL,
  `towerN_j2_m` int DEFAULT NULL,
  `towerN_j3_m` int DEFAULT NULL,
  `towerN_j4_m` int DEFAULT NULL,
  `towerN_j5_m` int DEFAULT NULL,
  `towerE_lead_m` int DEFAULT NULL,
  `towerE_j1_m` int DEFAULT NULL,
  `towerE_j2_m` int DEFAULT NULL,
  `towerE_j3_m` int DEFAULT NULL,
  `towerE_j4_m` int DEFAULT NULL,
  `towerE_j5_m` int DEFAULT NULL,
  `towerS_lead_m` int DEFAULT NULL,
  `towerS_j1_m` int DEFAULT NULL,
  `towerS_j2_m` int DEFAULT NULL,
  `towerS_j3_m` int DEFAULT NULL,
  `towerS_j4_m` int DEFAULT NULL,
  `towerS_j5_m` int DEFAULT NULL,
  `kvk_winner` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kvktowers`
--

INSERT INTO `kvktowers` (`next_kvk_start`, `next_kvk_end`, `throne_lead_m`, `throne_j1_m`, `throne_j2_m`, `throne_j3_m`, `throne_j4_m`, `throne_j5_m`, `towerW_lead_m`, `towerW_j1_m`, `towerW_j2_m`, `towerW_j3_m`, `towerW_j4_m`, `towerW_j5_m`, `towerN_lead_m`, `towerN_j1_m`, `towerN_j2_m`, `towerN_j3_m`, `towerN_j4_m`, `towerN_j5_m`, `towerE_lead_m`, `towerE_j1_m`, `towerE_j2_m`, `towerE_j3_m`, `towerE_j4_m`, `towerE_j5_m`, `towerS_lead_m`, `towerS_j1_m`, `towerS_j2_m`, `towerS_j3_m`, `towerS_j4_m`, `towerS_j5_m`, `kvk_winner`) VALUES
(1714212000, 1714298400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marches`
--

CREATE TABLE `marches` (
  `march_id` int NOT NULL,
  `player` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `marchtype` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `eta` bigint NOT NULL,
  `t1i` int NOT NULL DEFAULT '0',
  `t1c` int NOT NULL DEFAULT '0',
  `t1b` int NOT NULL DEFAULT '0',
  `t2i` int NOT NULL DEFAULT '0',
  `t2c` int NOT NULL DEFAULT '0',
  `t2b` int NOT NULL DEFAULT '0',
  `t3i` int NOT NULL DEFAULT '0',
  `t3c` int NOT NULL DEFAULT '0',
  `t3b` int NOT NULL DEFAULT '0',
  `t4i` int NOT NULL DEFAULT '0',
  `t4c` int NOT NULL DEFAULT '0',
  `t4b` int NOT NULL DEFAULT '0',
  `t5i` int NOT NULL DEFAULT '0',
  `t5c` int NOT NULL DEFAULT '0',
  `t5b` int NOT NULL DEFAULT '0',
  `dragon` tinyint(1) NOT NULL DEFAULT '0',
  `hero1` int DEFAULT NULL,
  `hero2` int DEFAULT NULL,
  `marchtime` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `level` int NOT NULL,
  `disappear_eta` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `x` int NOT NULL DEFAULT '5',
  `y` int NOT NULL DEFAULT '5',
  `alliance` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '---'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rallies`
--

CREATE TABLE `rallies` (
  `id` int NOT NULL,
  `target_x` int NOT NULL,
  `target_y` int NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `starter_march` int NOT NULL,
  `joiner1_march` int DEFAULT NULL,
  `joiner2_march` int DEFAULT NULL,
  `joiner3_march` int DEFAULT NULL,
  `joiner4_march` int DEFAULT NULL,
  `joiner5_march` int DEFAULT NULL,
  `length` int NOT NULL,
  `barb_level` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverinfo`
--

CREATE TABLE `serverinfo` (
  `num` int NOT NULL,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT 'Княжество',
  `leader` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `serverinfo`
--

INSERT INTO `serverinfo` (`num`, `current`, `name`, `leader`) VALUES
(1, 1, 'Княжество', -1);

-- --------------------------------------------------------

--
-- Table structure for table `spells`
--

CREATE TABLE `spells` (
  `spell_id` int NOT NULL,
  `alliance` char(3) NOT NULL,
  `type` int NOT NULL,
  `eta` bigint NOT NULL,
  `target_type` varchar(10) NOT NULL,
  `player_id` int DEFAULT NULL,
  `alliance_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `x` int NOT NULL,
  `y` int NOT NULL,
  `type` char(1) NOT NULL,
  `amount` int NOT NULL,
  `level` int NOT NULL,
  `owner` int DEFAULT NULL,
  `gathereta` bigint DEFAULT NULL,
  `disappear_eta` bigint NOT NULL,
  `gathered_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alliances`
--
ALTER TABLE `alliances`
  ADD PRIMARY KEY (`alliance_id`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `barbs`
--
ALTER TABLE `barbs`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msg_num`),
  ADD KEY `place` (`place`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `kvk`
--
ALTER TABLE `kvk`
  ADD PRIMARY KEY (`alliance`);

--
-- Indexes for table `marches`
--
ALTER TABLE `marches`
  ADD PRIMARY KEY (`march_id`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `rallies`
--
ALTER TABLE `rallies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD PRIMARY KEY (`num`),
  ADD KEY `leader` (`leader`);

--
-- Indexes for table `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`spell_id`),
  ADD KEY `alliance` (`alliance`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`x`,`y`),
  ADD KEY `owner` (`owner`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alliances`
--
ALTER TABLE `alliances`
  ADD CONSTRAINT `alliances_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`place`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kvk`
--
ALTER TABLE `kvk`
  ADD CONSTRAINT `kvk_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marches`
--
ALTER TABLE `marches`
  ADD CONSTRAINT `marches_ibfk_1` FOREIGN KEY (`player`) REFERENCES `_cities`.`logins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`id`) REFERENCES `_cities`.`logins` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `serverinfo`
--
ALTER TABLE `serverinfo`
  ADD CONSTRAINT `serverinfo_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `_cities`.`logins` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `spells`
--
ALTER TABLE `spells`
  ADD CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`alliance`) REFERENCES `alliances` (`alliance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `_cities`.`logins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
