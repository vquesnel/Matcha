-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3307
-- Généré le :  Lun 12 Décembre 2016 à 23:47
-- Version du serveur :  5.6.33
-- Version de PHP :  7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `matcha`
--

-- --------------------------------------------------------

--
-- Structure de la table `block`
--

CREATE TABLE `block` (
  `block_by` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `blocked` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `dictionary`
--

CREATE TABLE `dictionary` (
  `id` int(5) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `score` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `dictionary`
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
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `visitor` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `visited` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `history`
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
('corentine', 'laura', 18);

-- --------------------------------------------------------

--
-- Structure de la table `liking`
--

CREATE TABLE `liking` (
  `liker` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `liked` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `liking`
--

INSERT INTO `liking` (`liker`, `liked`, `id`) VALUES
('kiefer', 'vico', 6),
('kiefer', 'jb', 7),
('jb', 'vico', 8),
('vico', 'kiefer', 13),
('jacques', 'corentine', 22),
('vico', 'laura', 34),
('corentine', 'laura', 44);

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE `matchs` (
  `matcher` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `matched` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `matchs`
--

INSERT INTO `matchs` (`matcher`, `matched`, `id`) VALUES
('vico', 'kiefer', 2);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
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
-- Contenu de la table `notification`
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
(203, 'corentine', 'vico', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 40', 0),
(204, 'corentine', 'laura', 'corentine bidaud has visited your profil', '2016-12-12 23 : 41', 0),
(205, 'corentine', 'laura', 'corentine bidaud liked your profil', '2016-12-12 23 : 41', 0),
(206, 'corentine', 'laura', 'corentine bidaud don\'t like your profil anymore', '2016-12-12 23 : 41', 0),
(207, 'corentine', 'laura', 'corentine bidaud liked your profil', '2016-12-12 23 : 41', 0);

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(5) NOT NULL,
  `pic` longtext COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `pictures`
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
-- Structure de la table `reports`
--

CREATE TABLE `reports` (
  `reporter` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `reported` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `reports`
--

INSERT INTO `reports` (`reporter`, `reported`, `id`) VALUES
('vico', 'jacques', 1),
('vico', 'corentine', 2);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `tag` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `tags`
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
-- Structure de la table `UserComment`
--

CREATE TABLE `UserComment` (
  `UserId` int(5) NOT NULL,
  `UserName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `users`
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
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `birthday`, `email`, `password`, `sexe`, `token`, `validation`, `profil_pic`, `sexual_or`, `bio`, `location`, `currlat`, `currlong`, `pop`, `login`, `sessionID`, `socket_id`) VALUES
(1, 'victor', 'quesnel', 'vico', '1993-10-04', 'victor-quesnel@hotmail.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd993nm', '0', 'upload/vico-6yf3gssiwjbzkj7.png', 'hetero', 'Hello World Matcha 😃', ' 75003 Paris', '48.86102460', '2.35697890', 123, 'online', 'oaG6OI77_gVjqB9QJKl2Q014Pw9LpZcO', 'K6U2tP5vIxFPpPoyAAAh'),
(2, 'corentine', 'bidaud', 'corentine', '1993-08-09', 'co@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd99l3f', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'hetero', NULL, ' 75003 Paris', '48.86103970', '2.35696390', 19, 'online', 'zIwtSv14ZtYnxgw3DGnGIK-LdWzaTgeX', '2mU6yPQNmo0hJ6yUAAAf'),
(3, 'Jacques', 'Simonian', 'jacques', '1992-09-22', 'johny@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9a46x', '0', 'upload/corentine-lqmj4j7iwd9r0tx.png', 'bi', 'ZDP QLF 👑', ' 75003 Paris', '48.86103740', '2.35691790', 2, '2016-12-12', '3L1EALPSZIIsf2C9Bqeb3RnygwuMdtmd', 'an5Cv2hf5qob3006AAAT'),
(4, 'Kiefer', 'wiessler', 'kiefer', '1992-12-22', 'kwiessle@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'male', 'lqmj3mviwd9aib6', '0', 'upload/kiefer-lqmj4j7iwd9utge.png', 'hetero', 'ZDP ', ' 75003 Paris', '48.86370000', '2.36150000', 17, 'online', 'lR1Z9LMHBeGLvAknvLMV-izyIZcMCYyE', 'TOFmDYW-FUhkCBjdAAAB'),
(5, 'jb', 'marsal', 'jb', '1985-10-22', 'jmarsal@student.42.fr', '7d0665438e81d8eceb98c1e31fca80c1', 'female', 'lqmj3mviwd9az6k', '0', 'upload/jb-lqmj4j7iwd9suo4.png', 'gay', 'Coucou tout le monde', ' 75017 Paris', '48.89250000', '2.34440000', 11, 'online', 'hwFgFRmac3aaHLxxmNFnIs6D5T7cZ51_', '9ixdPeyxy73tMYhgAAAC'),
(7, 'vico', 'vico', 'wess', '1993-10-04', 'wessh@gmail.com', 'c10a80bb6a49178c52c3c0ecbd40c7a0', 'male', '7uscusiwerbn6d', '0', 'upload/wess-7uscusiwerckxe.png', 'gay', NULL, ' 75017 Paris', NULL, NULL, 2, '2016-12-08', '1gh8hXBGYzHgcZzwcOTZSDXUpRMmO-t9', NULL),
(8, 'Laura', 'LOPESA', 'laura', '1990-10-10', 'laura@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 'female', '7us1ftkiwg9fmzo', '0', 'upload/laura-7us1g4iiwga2465.png', 'bi', NULL, ' 75004 Paris', '48.86370000', '2.36150000', 21, '2016-12-12', 'f2U3bHo2fe__JCanJEHZSB0usX_tO1LY', '-yWj_FFgLEUMbzTxAAAa');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `liking`
--
ALTER TABLE `liking`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `block`
--
ALTER TABLE `block`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `dictionary`
--
ALTER TABLE `dictionary`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `liking`
--
ALTER TABLE `liking`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT pour la table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT pour la table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;