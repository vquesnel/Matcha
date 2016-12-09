-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2016 at 03:35 PM
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
('vico', 'laura', 8);

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
('vico', 'laura', 14);

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
('kiefer', 'vico', 6),
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('vico', 'kiefer', 13);

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
('vico', 'kiefer', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(5) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sended` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `sender`, `sended`, `content`) VALUES
(1, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(2, 'corentine', 'vico', 'corentine bidaud has visited your profil'),
(3, 'corentine', 'vico', 'corentine bidaud liked your profil'),
(4, 'corentine', 'vico', 'corentine bidaud matched with you'),
(5, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(6, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(7, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(8, 'vico', 'jacques', 'victor quesnel liked your profil'),
(9, 'jb', 'vico', 'jb marsal has visited your profil'),
(10, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(11, 'vico', 'jb', 'victor quesnel has visited your profil'),
(12, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(13, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(14, 'vico', 'corentine', 'victor quesnel liked your profil'),
(15, 'vico', 'corentine', 'victor quesnel matched with you'),
(16, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(17, 'vico', 'corentine', 'victor quesnel liked your profil'),
(18, 'vico', 'corentine', 'victor quesnel matched with you'),
(19, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(20, 'vico', 'corentine', 'victor quesnel liked your profil'),
(21, 'vico', 'corentine', 'victor quesnel matched with you'),
(22, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(23, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(24, 'vico', 'corentine', 'victor quesnel liked your profil'),
(25, 'vico', 'corentine', 'victor quesnel matched with you'),
(26, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(27, 'jb', 'vico', 'jb marsal has visited your profil'),
(28, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(29, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(30, 'vico', 'jacques', 'victor quesnel don\'t like your profil anymore'),
(31, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(32, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(33, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(34, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(35, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(36, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(37, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(38, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(39, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(40, 'vico', 'jb', 'victor quesnel has visited your profil'),
(41, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(42, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(43, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(44, 'vico', 'wess', 'victor quesnel has visited your profil'),
(45, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(46, 'vico', 'wess', 'victor quesnel has visited your profil'),
(47, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(48, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(49, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(50, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(51, 'vico', 'wess', 'victor quesnel has visited your profil'),
(52, 'vico', 'wess', 'victor quesnel has visited your profil'),
(53, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(54, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(55, 'vico', 'wess', 'victor quesnel has visited your profil'),
(56, 'jacques', 'vico', 'Jacques Simonian has visited your profil'),
(57, 'jacques', 'jb', 'Jacques Simonian has visited your profil'),
(58, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(59, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(60, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(61, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(62, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(63, 'vico', 'jb', 'victor quesnel has visited your profil'),
(64, 'vico', 'jb', 'victor quesnel has visited your profil'),
(65, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(66, 'vico', 'jb', 'victor quesnel has visited your profil'),
(67, 'vico', 'jb', 'victor quesnel has visited your profil'),
(68, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(69, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(70, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore'),
(71, 'vico', 'jb', 'victor quesnel has visited your profil'),
(72, 'vico', 'jb', 'victor quesnel don\'t like your profil anymore'),
(73, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(74, 'vico', 'corentine', 'victor quesnel don\'t like your profil anymore'),
(75, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(76, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(77, 'vico', 'jb', 'victor quesnel has visited your profil'),
(78, 'vico', 'jacques', 'victor quesnel has visited your profil'),
(79, 'jb', 'laura', 'jb marsal has visited your profil'),
(80, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(81, 'vico', 'laura', 'victor quesnel has visited your profil'),
(82, 'vico', 'laura', 'victor quesnel has visited your profil'),
(83, 'vico', 'laura', 'victor quesnel has visited your profil'),
(84, 'vico', 'laura', 'victor quesnel has visited your profil'),
(85, 'vico', 'laura', 'victor quesnel liked your profil'),
(86, 'vico', 'laura', 'victor quesnel has visited your profil'),
(87, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(88, 'vico', 'kiefer', 'victor quesnel liked your profil'),
(89, 'vico', 'kiefer', 'victor quesnel matched with you'),
(90, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore'),
(91, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore'),
(92, 'vico', 'kiefer', 'victor quesnel don\'t like your profil anymore'),
(93, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(94, 'vico', 'kiefer', 'victor quesnel has visited your profil'),
(95, 'vico', 'kiefer', 'victor quesnel liked your profil'),
(96, 'vico', 'kiefer', 'victor quesnel matched with you'),
(97, 'vico', 'laura', 'victor quesnel has visited your profil'),
(98, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore'),
(99, 'vico', 'laura', 'victor quesnel has visited your profil'),
(100, 'vico', 'laura', 'victor quesnel has visited your profil'),
(101, 'vico', 'laura', 'victor quesnel liked your profil'),
(102, 'vico', 'laura', 'victor quesnel has visited your profil'),
(103, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(104, 'vico', 'laura', 'victor quesnel has visited your profil'),
(105, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore'),
(106, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore'),
(107, 'vico', 'laura', 'victor quesnel has visited your profil'),
(108, 'vico', 'corentine', 'victor quesnel has visited your profil'),
(109, 'vico', 'laura', 'victor quesnel has visited your profil'),
(110, 'vico', 'laura', 'victor quesnel liked your profil'),
(111, 'vico', 'laura', 'victor quesnel has visited your profil'),
(112, 'vico', 'laura', 'victor quesnel liked your profil'),
(113, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore'),
(114, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore'),
(115, 'vico', 'laura', 'victor quesnel don\'t like your profil anymore');

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
(1, 'upload/vico-lqmj3mviwd9b8gt.png', 'vico'),
(2, 'upload/vico-lqmj3mviwd9bn0r.png', 'vico'),
(3, 'upload/vico-lqmj3mviwd9bq4y.png', 'vico'),
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
(18, 'upload/vico-7us133aiwf5hj49.png', 'vico'),
(19, 'upload/laura-7us1g4iiwga2465.png', 'laura');

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
('☺️', 'vico', 61);

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
(1, 'victor', 'quesnel', 'vico', '1993-10-04', 'victor-quesnel@hotmail.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd993nm', '0', 'upload/vico-lqmj3mviwd9bq4y.png', 'hetero', 'Hello World Matcha 😃', ' 75017 Paris', '48.89672670', '2.31838630', 123, 'online', '_6BfqCXQx4MUS1MZ9iD5TRr_Y6CSm9K5', '5kTV0ttnbjk4QHtsAAAI'),
(2, 'corentine', 'bidaud', 'corentine', '1993-08-09', 'co@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd99l3f', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'hetero', NULL, ' 75017 Paris', '48.89198600', '2.31928700', 0, 'online', 'Ngi_JpN04ept-ZgakluNGl8BkVmdr7tK', NULL),
(3, 'Jacques', 'Simonian', 'jacques', '1992-09-22', 'johny@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9a46x', '0', 'upload/jacques-lqmj4j7iwd9t4bi.png', 'bi', 'ZDP QLF 👑', ' 75004 Paris', '48.86000000', '2.35000000', 0, 'online', 'SOddHnPwqOUweSrSWw-nOkWsZsYQCrzN', NULL),
(4, 'Kiefer', 'wiessler', 'kiefer', '1992-12-22', 'kwiessle@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9aib6', '0', 'upload/kiefer-lqmj4j7iwd9utge.png', 'hetero', 'ZDP ', ' 75017 Paris', NULL, NULL, 17, 'online', 'jAbm7ICzXreQIS_TjrEXNg9YBvHhYJXp', NULL),
(5, 'jb', 'marsal', 'jb', '1985-10-22', 'jmarsal@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd9az6k', '0', 'upload/jb-lqmj4j7iwd9suo4.png', 'gay', 'Coucou tout le monde', ' 75017 Paris', '48.86000000', '2.35000000', 11, 'online', 'aNALvKhlF8Tnins0P8DDqYfq89QC53kg', NULL),
(7, 'vico', 'vico', 'wess', '1993-10-04', 'wessh@gmail.com', 'c10a80bb6a49178c52c3c0ecbd40c7a0', 'male', '7uscusiwerbn6d', '0', 'upload/wess-7uscusiwerckxe.png', 'gay', NULL, ' 75017 Paris', NULL, NULL, 2, '2016-12-08', '1gh8hXBGYzHgcZzwcOTZSDXUpRMmO-t9', NULL),
(8, 'Laura', 'LOPESA', 'laura', '1990-10-10', 'laura@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', '7us1ftkiwg9fmzo', '0', 'upload/laura-7us1g4iiwga2465.png', 'bi', NULL, ' 75004 Paris', '48.86000000', '2.35000000', 9, '2016-12-08', '1rRTXbeITHI4-aLLw3j9jdxUCFCuR0vD', NULL);

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dictionary`
--
ALTER TABLE `dictionary`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `liking`
--
ALTER TABLE `liking`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
