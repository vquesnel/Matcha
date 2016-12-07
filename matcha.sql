-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2016 at 04:48 PM
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
('jacques', 'jb', 12);

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
('vico', 'kiefer', 1),
('kiefer', 'vico', 6),
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('vico', 'jb', 9),
('corentine', 'vico', 10),
('vico', 'corentine', 15);

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
('kiefer', 'vico', 1),
('vico', 'jb', 3),
('vico', 'corentine', 8);

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
(57, 'jacques', 'jb', 'Jacques Simonian has visited your profil');

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
(18, 'upload/vico-7us133aiwf5hj49.png', 'vico');

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
('yo', 'vico', 10),
('QLF', 'vico', 11),
('42', 'vico', 12),
('42', 'jacques', 13);

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
  `pop` int(5) DEFAULT '0',
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sessionID` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `birthday`, `email`, `password`, `sexe`, `token`, `validation`, `profil_pic`, `sexual_or`, `bio`, `location`, `pop`, `login`, `sessionID`) VALUES
(1, 'victor', 'quesnel', 'vico', '1993-10-04', 'victor-quesnel@hotmail.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd993nm', '0', 'upload/vico-lqmj3mviwd9bq4y.png', 'hetero', 'Hello World Matcha 😃', ' 75017 Paris', 103, '2016-12-07', 'Sv1r4WCZjV8sFKBhvihgMJoQyhu-Eqbp'),
(2, 'corentine', 'bidaud', 'corentine', '1993-08-09', 'co@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd99l3f', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'bi', NULL, ' 75017 Paris', 12, '2016-12-06', 'mgMPhO_yMPePoyu8U831XiHv_F6pgqft'),
(3, 'Jacques', 'Simonian', 'jacques', '1992-09-22', 'johny@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9a46x', '0', 'upload/jacques-lqmj4j7iwd9t4bi.png', 'hetero', 'ZDP QLF 👑', ' 75017 Paris', 0, 'online', 'RS5SlQLWihIIesKXQllPmmxozr1d0xAn'),
(4, 'Kiefer', 'wiessler', 'kiefer', '1992-12-22', 'kwiessle@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9aib6', '0', 'upload/kiefer-lqmj4j7iwd9utge.png', 'hetero', 'ZDP ', ' 75017 Paris', 17, '2016-12-06', 'IkKxM-BYdg9gCtrXt1rGXh48B6Om3xOY'),
(5, 'jb', 'marsal', 'jb', '1985-10-22', 'jmarsal@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9az6k', '0', 'upload/jb-lqmj4j7iwd9suo4.png', 'hetero', 'Coucou tout le monde', ' 75017 Paris', 26, '2016-12-07', 'gdO1_UYNTaCd_K07R3f9AUcxCtbQt0vZ'),
(7, 'vico', 'vico', 'wess', '1993-10-04', 'wessh@gmail.com', 'c10a80bb6a49178c52c3c0ecbd40c7a0', 'male', '7uscusiwerbn6d', '0', 'upload/wess-7uscusiwerckxe.png', 'bi', NULL, ' 75017 Paris', 2, 'online', 'nnxg0eQM87uxNuCHO7srZy5wn8qwRLQI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `liking`
--
ALTER TABLE `liking`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
