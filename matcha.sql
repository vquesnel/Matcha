-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2016 at 03:35 PM
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
('corentine', 'vico', 9);

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
('vico', 'corentine', 2),
('kiefer', 'vico', 6),
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('vico', 'jb', 9),
('corentine', 'vico', 10),
('vico', 'jacques', 11);

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
('corentine', 'vico', 4);

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
(11, 'vico', 'jb', 'victor quesnel has visited your profil');

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
(4, 'upload/vico-lqmj3mviwd9btnv.png', 'vico'),
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
(16, 'upload/zdp-lqmjvhwiwdnsyan.png', 'zdp');

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
('vico', 'jacques', 1);

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
('yo', 'vico', 1),
('42', 'jb', 2),
('boulangerie', 'jb', 3),
('produfdf', 'jb', 4),
('man', 'jb', 5),
('nionio', 'jacques', 6),
('QLF', 'jacques', 7),
('zdp', 'kiefer', 8),
('yo', 'jb', 9);

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
(1, 'victor', 'quesnel', 'vico', '1993-10-04', 'victor-quesnel@hotmail.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd993nm', '0', 'upload/vico-lqmj3mviwd9bq4y.png', 'hetero', 'Hello World Matcha 😃', ' 75017 Paris', 61, 'online', 'XF8F9eAOpyoAr7evyYU4ktuStAIgb62a'),
(2, 'corentine', 'bidaud', 'corentine', '1993-08-09', 'co@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd99l3f', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'bi', NULL, ' 75017 Paris', 17, '2016-12-06', 'mgMPhO_yMPePoyu8U831XiHv_F6pgqft'),
(3, 'Jacques', 'Simonian', 'jacques', '1992-09-22', 'johny@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9a46x', '0', 'upload/jacques-lqmj4j7iwd9t4bi.png', 'hetero', 'ZDP QLF 👑', NULL, 5, '2016-12-06', 'Pge7kVrhux7wZ40WrezAoH6ZfAbKoTrY'),
(4, 'Kiefer', 'wiessler', 'kiefer', '1992-12-22', 'kwiessle@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9aib6', '0', 'upload/kiefer-lqmj4j7iwd9utge.png', 'hetero', 'ZDP ', ' 75017 Paris', 17, '2016-12-06', 'IkKxM-BYdg9gCtrXt1rGXh48B6Om3xOY'),
(5, 'jb', 'marsal', 'jb', '1985-10-22', 'jmarsal@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9az6k', '0', 'upload/jb-lqmj4j7iwd9suo4.png', 'hetero', 'Coucou tout le monde', ' 75017 Paris', 24, 'online', '8B8af6VjIelN-Bxr4iGyFkZKMwJjZoq4'),
(6, 'zdp', 'zdp', 'zdp', '1916-10-10', 'zd@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmjvhwiwdnsgal', '0', 'upload/zdp-lqmjvhwiwdnsyan.png', 'bi', NULL, ' 75017 Paris', 0, '2016-12-06', 'qv5crexajVCH3mdNNgPcBdrwNv7FvMgj');

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `liking`
--
ALTER TABLE `liking`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
