-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2016 at 04:27 PM
-- Server version: 5.7.11
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matcha`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `block_by` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `blocked` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`block_by`, `blocked`, `id`) VALUES
('vico', 'corentine', 1),
('kiefer', 'corentine', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dictionary`
--

CREATE TABLE `dictionary` (
  `id` int(5) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `score` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `dictionary`
--

INSERT INTO `dictionary` (`id`, `value`, `score`) VALUES
(1, 'yo', 1),
(2, 'QLF', 1),
(3, '42', 1),
(4, 'aaaaa', 1),
(5, 'aaab', 1),
(6, 'bbbb', 1),
(7, 'bbb', 1),
(8, 'ccc', 1),
(9, 'ccd', 1),
(10, 'dddde', 1),
(11, 'eeeeeff', 1),
(12, 'ffffg', 1),
(13, 'gggg', 1),
(14, 'gggh', 1),
(15, 'hhhh', 1),
(16, 'hhhhi', 1),
(17, 'iiiijj', 1),
(18, 'jjjjjk', 1),
(19, 'kkkk', 1),
(20, 'kkkkllll', 1),
(21, 'lllll', 1),
(22, 'llllmmm', 1),
(23, 'mmn', 1),
(24, 'nn', 1),
(25, 'nno', 1),
(26, 'ooo', 1),
(27, 'oooop', 1),
(28, 'pppp', 1),
(29, 'pppq', 1),
(30, 'qqqqq', 1),
(31, 'qqqqrr', 1),
(32, 'rrrr', 1),
(33, 'rrs', 1),
(34, 'sss', 1),
(35, 'sst', 1),
(36, 'tt', 1),
(37, 'tttu', 1),
(38, 'uuu', 1),
(39, 'uuuv', 1),
(40, 'vvv', 1),
(41, 'vvvw', 1),
(42, 'www', 1),
(43, 'wwx', 1),
(44, 'xxx', 1),
(45, 'xxy', 1),
(46, 'yy', 1),
(47, 'yyz', 1),
(48, 'zzz', 1),
(49, 'zzzq', 1),
(50, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 0),
(51, '☺️', 1),
(52, 'ntmlapute', 0);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `visitor` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `visited` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`visitor`, `visited`, `id`) VALUES
('vico', 'kiefer', 1),
('kiefer', 'jacques', 2),
('vico', 'jacques', 3),
('vico', 'corentine', 4),
('vico', 'jb', 5),
('kiefer', 'vico', 6),
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('corentine', 'vico', 9),
('vico', 'wess', 10),
('jacques', 'vico', 11),
('jacques', 'jb', 12),
('jb', 'laura', 13),
('vico', 'laura', 14),
('corentine', 'jacques', 15),
('jacques', 'corentine', 16),
('laura', 'corentine', 17),
('corentine', 'laura', 18),
('jacques', 'kiefer', 19),
('kiefer', 'corentine', 20),
('corentine', 'kiefer', 21);

-- --------------------------------------------------------

--
-- Table structure for table `liking`
--

CREATE TABLE `liking` (
  `liker` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `liked` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `liking`
--

INSERT INTO `liking` (`liker`, `liked`, `id`) VALUES
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('jacques', 'corentine', 22),
('vico', 'laura', 34),
('corentine', 'laura', 44),
('kiefer', 'jacques', 47),
('jacques', 'kiefer', 48),
('kiefer', 'vico', 52),
('vico', 'jb', 60);

-- --------------------------------------------------------

--
-- Table structure for table `matchs`
--

CREATE TABLE `matchs` (
  `matcher` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `matched` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `matchs`
--

INSERT INTO `matchs` (`matcher`, `matched`, `id`) VALUES
('jacques', 'kiefer', 3),
('vico', 'jb', 12);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(5) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `reciever` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` text COLLATE utf8mb4_bin,
  `room` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `reciever`, `message`, `room`) VALUES
(1, 'vico', 'jb', 'zfbdfg', 12),
(2, 'vico', 'jb', '😍', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(5) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sended` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `seen` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `sender`, `sended`, `content`, `date`, `seen`) VALUES
(193, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-12 23 : 38', 1),
(194, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-12 23 : 38', 1),
(195, 'corentine', 'vico', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 38', 1),
(196, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-12 23 : 39', 1),
(197, 'corentine', 'vico', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 39', 1),
(198, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-12 23 : 39', 1),
(199, 'corentine', 'vico', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 39', 1),
(200, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-12 23 : 39', 1),
(201, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-12 23 : 40', 1),
(202, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-12 23 : 40', 1),
(204, 'corentine', 'laura', 'corentine bidaud has visited your profil', '2016-12-12 23 : 41', 0),
(205, 'corentine', 'laura', 'corentine bidaud liked your profil', '2016-12-12 23 : 41', 0),
(206, 'corentine', 'laura', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 41', 0),
(207, 'corentine', 'laura', 'corentine bidaud liked your profil', '2016-12-12 23 : 41', 0),
(208, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 10 : 17', 1),
(213, 'kiefer', 'jacques', 'Kiefer wiessler has visited your profil', '2016-12-13 11 : 8', 1),
(214, 'kiefer', 'jacques', 'Kiefer wiessler liked your profil', '2016-12-13 11 : 8', 1),
(215, 'jacques', 'kiefer', 'Jacques Simonian has visited your profil', '2016-12-13 11 : 8', 1),
(216, 'jacques', 'kiefer', 'Jacques Simonian liked your profil', '2016-12-13 11 : 8', 1),
(217, 'jacques', 'kiefer', 'Jacques Simonian matched with you', '2016-12-13 11 : 8', 1),
(218, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-13 11 : 47', 1),
(219, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-13 11 : 47', 1),
(220, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 11 : 47', 1),
(221, 'vico', 'corentine', 'victor quesnel liked your profil', '2016-12-13 11 : 47', 1),
(222, 'vico', 'corentine', 'victor quesnel matched with you', '2016-12-13 11 : 47', 1),
(223, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 12 : 20', 1),
(224, 'kiefer', 'corentine', 'Kiefer wiessler has visited your profil', '2016-12-13 12 : 24', 1),
(225, 'kiefer', 'vico', 'Kiefer wiessler has visited your profil', '2016-12-13 12 : 24', 1),
(226, 'kiefer', 'vico', 'Kiefer wiessler don\'t like your profil anymore', '2016-12-13 12 : 24', 1),
(227, 'kiefer', 'vico', 'Kiefer wiessler liked your profil', '2016-12-13 12 : 24', 1),
(228, 'kiefer', 'vico', 'Kiefer wiessler matched with you', '2016-12-13 12 : 24', 1),
(229, 'kiefer', 'vico', 'Kiefer wiessler don\'t like your profil anymore', '2016-12-13 12 : 24', 1),
(230, 'kiefer', 'vico', 'Kiefer wiessler liked your profil', '2016-12-13 12 : 24', 1),
(231, 'kiefer', 'vico', 'Kiefer wiessler matched with you', '2016-12-13 12 : 24', 1),
(232, 'kiefer', 'vico', 'Kiefer wiessler has visited your profil', '2016-12-13 12 : 25', 1),
(233, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-13 12 : 41', 1),
(234, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 12 : 48', 1),
(235, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 1', 1),
(236, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 1', 1),
(237, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 1', 1),
(238, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 1', 1),
(239, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 2', 1),
(240, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(241, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(242, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(243, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(244, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(245, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(246, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 5', 1),
(247, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 7', 1),
(248, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 7', 1),
(249, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 7', 1),
(250, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 7', 1),
(251, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 7', 1),
(252, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 28', 1),
(253, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 28', 1),
(254, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 28', 1),
(255, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 28', 1),
(256, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 28', 1),
(257, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(258, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(259, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(260, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(261, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(262, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(263, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(264, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(265, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(266, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(267, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(268, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(269, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 13 : 30', 1),
(270, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 39', 1),
(271, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 40', 1),
(272, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 40', 1),
(273, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 40', 1),
(274, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 41', 1),
(275, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 41', 1),
(276, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 41', 1),
(277, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 41', 1),
(278, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 41', 1),
(279, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 42', 1),
(280, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 42', 1),
(281, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 42', 1),
(282, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 42', 1),
(283, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 43', 1),
(284, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 43', 1),
(285, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 43', 1),
(286, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 43', 1),
(287, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 44', 1),
(288, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 47', 1),
(289, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 47', 1),
(290, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 47', 1),
(291, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 47', 1),
(292, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 48', 1),
(293, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 49', 1),
(294, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 49', 1),
(295, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 54', 1),
(296, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 13 : 56', 1),
(297, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 56', 1),
(298, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 57', 1),
(299, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 58', 1),
(300, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 58', 1),
(301, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 58', 1),
(302, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 58', 1),
(303, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(304, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(305, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(306, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(307, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(308, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(309, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(310, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(311, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(312, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(313, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(314, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(315, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(316, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(317, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(318, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(319, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(320, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(321, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 13 : 59', 1),
(322, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 11', 1),
(323, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 22', 1),
(324, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 23', 1),
(325, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 23', 1),
(326, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 23', 1),
(327, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 24', 1),
(328, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 26', 1),
(329, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 27', 1),
(330, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 30', 1),
(331, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 30', 0),
(332, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 30', 1),
(333, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 30', 1),
(334, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 31', 1),
(335, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(336, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(337, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(338, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(339, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(340, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(341, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(342, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(343, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(344, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(345, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(346, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 38', 1),
(347, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(348, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(349, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(350, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(351, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(352, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 38', 1),
(353, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(354, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(355, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(356, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(357, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(358, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(359, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(360, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(361, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(362, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(363, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(364, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(365, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(366, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(367, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(368, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(369, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 39', 1),
(370, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 41', 1),
(371, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 41', 1),
(372, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 42', 1),
(373, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 42', 1),
(374, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 42', 1),
(375, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 43', 0),
(376, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 43', 1),
(377, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 43', 1),
(378, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 43', 1),
(379, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 43', 1),
(380, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 43', 1),
(381, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 44', 1),
(382, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 14 : 45', 1),
(383, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 48', 1),
(384, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 52', 1),
(385, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 52', 1),
(386, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 52', 1),
(387, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 14 : 52', 1),
(388, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 14 : 54', 1),
(389, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 14 : 55', 1),
(390, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(391, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(392, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(393, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(394, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(395, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 14 : 55', 1),
(396, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 14 : 57', 1),
(397, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 14 : 58', 1),
(398, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 14 : 58', 1),
(399, 'vico', 'kiefer', 'victor quesnel liked your profil', '2016-12-13 14 : 58', 1),
(400, 'vico', 'kiefer', 'victor quesnel matched with you', '2016-12-13 14 : 58', 1),
(401, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 14 : 58', 1),
(402, 'vico', 'kiefer', 'victor quesnel liked your profil', '2016-12-13 14 : 58', 1),
(403, 'vico', 'kiefer', 'victor quesnel matched with you', '2016-12-13 14 : 58', 1),
(404, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 14 : 58', 1),
(405, 'vico', 'kiefer', 'victor quesnel liked your profil', '2016-12-13 14 : 58', 1),
(406, 'vico', 'kiefer', 'victor quesnel matched with you', '2016-12-13 14 : 58', 1),
(407, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 14 : 59', 1),
(408, 'vico', 'kiefer', 'victor quesnel liked your profil', '2016-12-13 14 : 59', 1),
(409, 'vico', 'kiefer', 'victor quesnel matched with you', '2016-12-13 14 : 59', 1),
(410, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 15 : 0', 1),
(411, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 15 : 0', 1),
(412, 'vico', 'kiefer', 'victor quesnel liked your profil', '2016-12-13 15 : 0', 1),
(413, 'vico', 'kiefer', 'victor quesnel matched with you', '2016-12-13 15 : 0', 1),
(414, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 0', 1),
(415, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(416, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(417, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(418, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(419, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(420, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(421, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(422, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(423, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(424, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(425, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(426, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(427, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(428, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(429, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(430, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(431, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(432, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(433, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(434, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(435, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(436, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(437, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(438, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(439, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 2', 1),
(440, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 4', 1),
(441, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 5', 1),
(442, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 6', 1),
(443, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 8', 1),
(444, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(445, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(446, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(447, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(448, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(449, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(450, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(451, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(452, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(453, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 9', 1),
(454, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 10', 1),
(455, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 11', 1),
(456, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 11', 1),
(457, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 12', 1),
(458, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 12', 1),
(459, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 12', 1),
(460, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 12', 1),
(461, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 13', 1),
(462, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 15', 1),
(463, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 15', 1),
(464, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 15', 1),
(465, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 15', 1),
(466, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 19', 1),
(467, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 21', 1),
(468, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 21', 1),
(469, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 21', 1),
(470, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 21', 1),
(471, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(472, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(473, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(474, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(475, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(476, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(477, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(478, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(479, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(480, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 22', 1),
(481, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 23', 1),
(482, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 23', 1),
(483, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 24', 1),
(484, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 24', 1),
(485, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 24', 1),
(486, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 15 : 26', 1),
(487, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 26', 1),
(488, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 26', 1),
(489, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 26', 1),
(490, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(491, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(492, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(493, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(494, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(495, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(496, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(497, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(498, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(499, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(500, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(501, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(502, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(503, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 27', 1),
(504, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 28', 1),
(505, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 28', 1),
(506, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(507, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(508, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(509, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(510, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(511, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(512, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(513, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(514, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(515, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(516, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(517, 'kiefer', 'vico', 'Kiefer wiessler send you a new message', '2016-12-13 15 : 30', 1),
(520, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(521, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(522, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(523, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(524, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(525, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(526, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 32', 1),
(527, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(528, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(529, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(530, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(531, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(532, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(533, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(534, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(535, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(536, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(537, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(538, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(539, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(540, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(541, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(542, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(543, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(544, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(545, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(546, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(547, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(548, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 36', 1),
(549, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 37', 1),
(550, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 37', 1),
(551, 'vico', 'kiefer', 'victor quesnel send you a new message', '2016-12-13 15 : 37', 1),
(552, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 15 : 46', 1),
(553, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 15 : 46', 1),
(554, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 15 : 46', 1),
(555, 'vico', 'corentine', 'victor quesnel send you a new message', '2016-12-13 15 : 47', 1),
(556, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 47', 1),
(557, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 15 : 48', 1),
(558, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 15 : 48', 1),
(559, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 48', 1),
(560, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 49', 1),
(561, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 49', 1),
(562, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 15 : 49', 1),
(563, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 15 : 49', 1),
(564, 'corentine', 'vico', 'corentine bidaud send you a new message', '2016-12-13 15 : 49', 1),
(565, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 50', 0),
(566, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 15 : 50', 0),
(567, 'vico', 'kiefer', 'victor quesnel has visited your profil', '2016-12-13 16 : 5', 1),
(568, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore', '2016-12-13 16 : 5', 1),
(569, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 16 : 7', 0),
(570, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore', '2016-12-13 16 : 7', 0),
(571, 'vico', 'corentine', 'victor quesnel has visited your profil', '2016-12-13 16 : 8', 0),
(572, 'corentine', 'vico', 'corentine bidaud has visited your profil', '2016-12-13 16 : 8', 1),
(573, 'corentine', 'vico', 'corentine bidaud liked your profil', '2016-12-13 16 : 8', 1),
(577, 'vico', 'jb', 'victor quesnel has visited your profil', '2016-12-13 16 : 28', 0),
(578, 'vico', 'jb', 'victor quesnel liked your profil', '2016-12-13 16 : 28', 0),
(579, 'vico', 'jb', 'victor quesnel matched with you', '2016-12-13 16 : 28', 0),
(580, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(581, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(582, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(583, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(584, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(585, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(586, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(587, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(588, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(589, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 34', 0),
(590, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 35', 0),
(591, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 35', 0),
(592, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 35', 0),
(593, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 35', 0),
(594, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(595, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(596, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(597, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(598, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(599, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(600, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(601, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(602, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(603, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(604, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(605, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(606, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(607, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(608, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(609, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(610, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(611, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(612, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(613, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(614, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(615, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(616, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(617, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(618, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(619, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(620, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(621, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(622, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 39', 0),
(623, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 40', 0),
(624, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 40', 0),
(625, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 41', 0),
(626, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 44', 0),
(627, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 44', 0),
(628, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 51', 0),
(629, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 52', 0),
(630, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 52', 0),
(631, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 16 : 52', 0),
(632, 'kiefer', 'corentine', 'Kiefer wiessler has visited your profil', '2016-12-13 16 : 53', 0),
(633, 'corentine', 'kiefer', 'corentine bidaud visited your profil', '2016-12-13 17 : 4', 1),
(634, 'corentine', 'kiefer', 'corentine bidaud visited your profil', '2016-12-13 17 : 4', 1),
(635, 'corentine', 'kiefer', 'corentine bidaud liked your profil', '2016-12-13 17 : 4', 1),
(636, 'corentine', 'kiefer', 'corentine bidaud don\'t liked your profil', '2016-12-13 17 : 4', 1),
(637, 'corentine', 'kiefer', 'corentine bidaud visited your profil', '2016-12-13 17 : 5', 1),
(638, 'corentine', 'kiefer', 'corentine bidaud visited your profil', '2016-12-13 17 : 7', 1),
(639, 'kiefer', 'corentine', 'Kiefer wiessler visited your profil', '2016-12-13 17 : 7', 0),
(640, 'kiefer', 'corentine', 'Kiefer wiessler visited your profil', '2016-12-13 17 : 12', 0),
(641, 'corentine', 'kiefer', 'corentine bidaud visited your profil', '2016-12-13 17 : 12', 1),
(642, 'kiefer', 'jacques', 'Kiefer wiessler send you a new message', '2016-12-13 17 : 13', 0),
(643, 'vico', 'jb', 'victor quesnel send you a new message', '2016-12-13 17 : 25', 0),
(644, 'vico', 'jb', 'victor quesnel visited your profil', '2016-12-13 17 : 25', 0),
(645, 'vico', 'jb', 'victor quesnel send you a new message', '2016-12-13 17 : 25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(5) NOT NULL,
  `pic` longtext COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `pic`, `username`) VALUES
(5, 'upload/corentine-lqmj4j7iwd9r0tx.png', 'corentine'),
(6, 'upload/jb-lqmj4j7iwd9suo4.png', 'jb'),
(7, 'upload/jacques-lqmj4j7iwd9t4bi.png', 'jacques'),
(8, 'upload/jacques-lqmj4j7iwd9t7en.png', 'jacques'),
(9, 'upload/jacques-lqmj4j7iwd9tcvy.png', 'jacques'),
(10, 'upload/jacques-lqmj4j7iwd9tgcv.png', 'jacques'),
(11, 'upload/jacques-lqmj4j7iwd9tl14.png', 'jacques'),
(12, 'upload/kiefer-lqmj4j7iwd9utge.png', 'kiefer'),
(13, 'upload/kiefer-lqmj4j7iwd9uvwz.png', 'kiefer'),
(14, 'upload/kiefer-lqmj4j7iwd9uyq2.png', 'kiefer'),
(15, 'upload/kiefer-lqmj4j7iwd9v3qs.png', 'kiefer'),
(17, 'upload/wess-7uscusiwerckxe.png', 'wess'),
(19, 'upload/laura-7us1g4iiwga2465.png', 'laura'),
(21, 'upload/vico-6yf3gssiwjbzfjc.png', 'vico'),
(22, 'upload/vico-6yf3gssiwjbzkj7.png', 'vico'),
(23, 'upload/vico-6yf3gssiwjbzpaf.png', 'vico'),
(24, 'upload/vico-6yf3gssiwjbztcb.png', 'vico'),
(25, 'upload/vico-6yf3gssiwjc03ii.png', 'vico');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `reporter` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `reported` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`reporter`, `reported`, `id`) VALUES
('vico', 'jacques', 1),
('vico', 'corentine', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag`, `username`, `id`) VALUES
('42', 'jb', 2),
('nionio', 'jacques', 6),
('QLF', 'jacques', 7),
('zdp', 'kiefer', 8),
('42', 'vico', 12),
('42', 'jacques', 13),
('bbbb', 'vico', 16),
('bbb', 'vico', 17),
('ccc', 'vico', 18),
('ccd', 'vico', 19),
('ffffg', 'vico', 22),
('gggg', 'vico', 23),
('gggh', 'vico', 24),
('hhhh', 'vico', 25),
('hhhhi', 'vico', 26),
('iiiijj', 'vico', 27),
('jjjjjk', 'vico', 28),
('kkkk', 'vico', 29),
('kkkkllll', 'vico', 30),
('lllll', 'vico', 31),
('llllmmm', 'vico', 32),
('mmn', 'vico', 33),
('nn', 'vico', 34),
('nno', 'vico', 35),
('ooo', 'vico', 36),
('oooop', 'vico', 37),
('pppp', 'vico', 38),
('pppq', 'vico', 39),
('qqqqq', 'vico', 40),
('qqqqrr', 'vico', 41),
('sst', 'vico', 45),
('tt', 'vico', 46),
('tttu', 'vico', 47),
('uuu', 'vico', 48),
('uuuv', 'vico', 49),
('vvv', 'vico', 50),
('vvvw', 'vico', 51),
('www', 'vico', 52),
('wwx', 'vico', 53),
('xxx', 'vico', 54),
('xxy', 'vico', 55),
('yy', 'vico', 56),
('yyz', 'vico', 57),
('zzz', 'vico', 58),
('☺️', 'vico', 61),
('aaaaa', 'vico', 62);

-- --------------------------------------------------------

--
-- Table structure for table `UserComment`
--

CREATE TABLE `UserComment` (
  `UserId` int(5) NOT NULL,
  `UserName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `validation` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `profil_pic` longtext COLLATE utf8mb4_bin,
  `sexual_or` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT 'bi',
  `bio` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `currlat` decimal(11,8) DEFAULT NULL,
  `currlong` decimal(11,8) DEFAULT NULL,
  `pop` int(5) DEFAULT '0',
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sessionID` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `socket_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `birthday`, `email`, `password`, `sexe`, `token`, `validation`, `profil_pic`, `sexual_or`, `bio`, `location`, `currlat`, `currlong`, `pop`, `login`, `sessionID`, `socket_id`) VALUES
(1, 'victor', 'quesnel', 'vico', '1993-10-04', 'victor-quesnel@hotmail.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd993nm', '0', 'upload/vico-6yf3gssiwjc03ii.png', 'hetero', 'Hello World Matcha 😃', ' 75004 Paris', '48.86000000', '2.35000000', 198, 'online', 'yrPx0gs_m3WmdO1l7RNzwR3e0kY0MTIV', 'Pt4njiyZ46VrwO0cAAAB'),
(2, 'corentine', 'bidaud', 'corentine', '1993-08-09', 'co@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd99l3f', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'hetero', NULL, ' 75004 Paris', '48.86000000', '2.35000000', 21, 'online', 'IWTxIpZpuUvtnc_d2WlKGEGDk77Kk6XM', 'X2XZCe1jPiQMfIGQAAAD'),
(3, 'Jacques', 'Simonian', 'jacques', '1992-09-22', 'johny@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9a46x', '0', 'upload/jacques-lqmj4j7iwd9t4bi.png', 'bi', 'ZDP QLF 👑', ' 75003 Paris', '48.86000000', '2.35000000', 17, '2016-12-13', 'G2ulEOrhkXLFYx_hgmff1PO1giiTuT8e', 'yEW1mATuGN7cawu2AAAi'),
(4, 'Kiefer', 'wiessler', 'kiefer', '1992-12-22', 'kwiessle@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9aib6', '0', 'upload/kiefer-lqmj4j7iwd9utge.png', 'hetero', 'ZDP ', ' 75004 Paris', '48.86000000', '2.35000000', 41, 'online', '6fK6n9-BhQtQjopeAhJTtMgY5c0iKbzb', 'lp_AFVLNwAqh6RScAAAA'),
(5, 'jb', 'marsal', 'jb', '1985-10-22', 'jmarsal@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd9az6k', '0', 'upload/jb-lqmj4j7iwd9suo4.png', 'gay', 'Coucou tout le monde', ' 75017 Paris', '48.89250000', '2.34440000', 26, 'online', 'hwFgFRmac3aaHLxxmNFnIs6D5T7cZ51_', '9ixdPeyxy73tMYhgAAAC'),
(7, 'vico', 'vico', 'wess', '1993-10-04', 'wessh@gmail.com', 'c10a80bb6a49178c52c3c0ecbd40c7a0', 'male', '7uscusiwerbn6d', '0', 'upload/wess-7uscusiwerckxe.png', 'gay', NULL, ' 75017 Paris', NULL, NULL, 2, '2016-12-08', '1gh8hXBGYzHgcZzwcOTZSDXUpRMmO-t9', NULL),
(8, 'Laura', 'LOPESA', 'laura', '1990-10-10', 'laura@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', '7us1ftkiwg9fmzo', '0', 'upload/laura-7us1g4iiwga2465.png', 'bi', NULL, ' 75004 Paris', '48.86370000', '2.36150000', 21, '2016-12-12', 'f2U3bHo2fe__JCanJEHZSB0usX_tO1LY', '-yWj_FFgLEUMbzTxAAAa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liking`
--
ALTER TABLE `liking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dictionary`
--
ALTER TABLE `dictionary`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `liking`
--
ALTER TABLE `liking`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
