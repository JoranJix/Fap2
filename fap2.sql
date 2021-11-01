-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 01. Nov 2021 um 19:21
-- Server-Version: 10.5.12-MariaDB-0ubuntu0.21.04.1
-- PHP-Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `fap2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) NOT NULL,
  `uuid` text NOT NULL,
  `name` text NOT NULL,
  `points` int(11) NOT NULL,
  `fromu` text NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pdbanned`
--

CREATE TABLE `pdbanned` (
  `id` int(11) NOT NULL,
  `uuid` text NOT NULL,
  `name` text NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `picture` text NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `picture`, `text`) VALUES
(1, 'Eat pussy', 'images/smile/eatpussy.png', 'loved eating your pussy'),
(2, 'Eat ass', 'images/smile/eatass.png', 'loved eating your ass'),
(3, 'Gave BJ', 'images/smile/bj2.png', 'loved sucking your cock'),
(4, 'Received BJ', 'images/smile/bj.png', 'you blowing that cock so nice'),
(5, 'Ride', 'images/smile/ride2.png', 'loved that ride so much'),
(6, 'Fuck', 'images/smile/fuck.png', 'fucked you so good'),
(7, 'Received Anal', 'images/smile/doggy.png', 'you felt so good in my ass'),
(8, 'Gave Anal', 'images/smile/anal.png', 'your ass was so tight'),
(9, 'Dominated', 'images/smile/dom.jpg', 'Get down and kneel for me'),
(10, 'Submitted', 'images/smile/sub.jpg', 'loved to submit to you'),
(11, '3Some', 'images/smile/3some.png', 'nothing is like a threesome'),
(12, 'SixtyNine', 'images/smile/69.png', 'NomNomNom!'),
(13, 'Doggy', 'images/smile/doggy.png', 'loved to doggy with style');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `specrewards`
--

CREATE TABLE `specrewards` (
  `id` int(11) NOT NULL,
  `uuidby` text NOT NULL,
  `name` text NOT NULL,
  `picture` text NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `specrewards`
--

INSERT INTO `specrewards` (`id`, `uuidby`, `name`, `picture`, `text`) VALUES
(1, 'a6e77bf0-63af-47f2-a784-bc58f1876dcf', 'Developement', 'images/Developed.png', 'Test');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users2`
--

CREATE TABLE `users2` (
  `id` int(11) NOT NULL,
  `uuid` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `displayname` text NOT NULL,
  `gender` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `boobs` text DEFAULT NULL,
  `bits` text DEFAULT NULL,
  `orientation` text DEFAULT NULL,
  `rpstyle` text DEFAULT NULL,
  `longtime` text DEFAULT NULL,
  `financial` int(11) DEFAULT NULL,
  `race` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `discord` text DEFAULT NULL,
  `flickr` text DEFAULT NULL,
  `kinks` text DEFAULT NULL,
  `taboo` text DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `rape` int(11) DEFAULT NULL,
  `search` int(11) DEFAULT NULL,
  `banned` int(11) DEFAULT NULL,
  `isadmin` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `picture` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pdbanned`
--
ALTER TABLE `pdbanned`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indizes für die Tabelle `specrewards`
--
ALTER TABLE `specrewards`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users2`
--
ALTER TABLE `users2`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT für Tabelle `pdbanned`
--
ALTER TABLE `pdbanned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `specrewards`
--
ALTER TABLE `specrewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `users2`
--
ALTER TABLE `users2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
