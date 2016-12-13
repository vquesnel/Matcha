-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2016 at 04:14 PM
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
(400, 'kiefer', 'jacques', 'sgdaf', 3),
(401, 'kiefer', 'jacques', 'sdfasd', 3),
(402, 'kiefer', 'jacques', 'f', 3),
(403, 'kiefer', 'jacques', 'f', 3),
(404, 'kiefer', 'jacques', 'f', 3),
(405, 'kiefer', 'jacques', 'f', 3),
(406, 'kiefer', 'jacques', 'f', 3),
(407, 'kiefer', 'jacques', 'f', 3),
(408, 'kiefer', 'jacques', 'f', 3),
(409, 'kiefer', 'jacques', 'sdfsadf', 3),
(410, 'kiefer', 'jacques', 'sdf', 3),
(411, 'kiefer', 'jacques', 'asdfasdf', 3),
(412, 'kiefer', 'jacques', 'sdafsadfsdafsdf', 3),
(413, 'kiefer', 'jacques', 'sdfasfd', 3),
(414, 'kiefer', 'jacques', 'ertth', 3),
(415, 'kiefer', 'jacques', 'dsfgdfg', 3),
(416, 'kiefer', 'jacques', 'g', 3),
(417, 'kiefer', 'jacques', 'g', 3),
(418, 'kiefer', 'jacques', 'g', 3),
(419, 'kiefer', 'jacques', 'g', 3),
(420, 'kiefer', 'jacques', 'g', 3),
(421, 'kiefer', 'jacques', 'g', 3),
(422, 'kiefer', 'jacques', 'g', 3),
(423, 'kiefer', 'jacques', 'g', 3),
(424, 'kiefer', 'jacques', 'g', 3),
(425, 'kiefer', 'jacques', 'g', 3),
(426, 'kiefer', 'jacques', 'g', 3),
(427, 'kiefer', 'jacques', 'g', 3),
(428, 'kiefer', 'jacques', 'g', 3),
(429, 'kiefer', 'jacques', 'g', 3),
(430, 'kiefer', 'jacques', 'g', 3),
(431, 'kiefer', 'jacques', 'g', 3),
(432, 'kiefer', 'jacques', 'g', 3),
(433, 'kiefer', 'jacques', 'g', 3),
(434, 'kiefer', 'jacques', 'g', 3),
(435, 'kiefer', 'jacques', 'g', 3),
(436, 'kiefer', 'jacques', 'g', 3),
(437, 'kiefer', 'jacques', 'g', 3),
(438, 'kiefer', 'jacques', 'g', 3),
(439, 'kiefer', 'jacques', 'g', 3),
(440, 'kiefer', 'jacques', 'g', 3),
(441, 'kiefer', 'jacques', 'g', 3),
(442, 'kiefer', 'jacques', 'g', 3),
(443, 'kiefer', 'jacques', 'sdfds', 3),
(444, 'kiefer', 'jacques', 'fsdfas', 3),
(445, 'kiefer', 'jacques', 'sdf', 3),
(446, 'kiefer', 'jacques', '😀', 3),
(447, 'kiefer', 'jacques', '😍', 3),
(448, 'kiefer', 'jacques', 'fsd', 3),
(449, 'kiefer', 'jacques', 'f', 3),
(450, 'kiefer', 'jacques', 'f', 3),
(451, 'kiefer', 'jacques', 'f', 3),
(452, 'kiefer', 'jacques', 'sdg', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
