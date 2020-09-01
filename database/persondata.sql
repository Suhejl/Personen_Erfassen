-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Sep 2020 um 10:48
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.2

SET SQL_MODE
= "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT
= 0;
START TRANSACTION;
SET time_zone
= "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `persondata`
--
CREATE DATABASE
IF NOT EXISTS `persondata` DEFAULT CHARACTER
SET utf8mb4
COLLATE utf8mb4_general_ci;
USE `persondata`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `companydata`
--

CREATE TABLE `companydata`
(
  `ID_Companydata` int
(11) NOT NULL,
  `Companyname` varchar
(50) NOT NULL,
  `Departement` varchar
(50) NOT NULL,
  `Jobtitle` varchar
(50) NOT NULL,
  `Jobdescription` varchar
(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personaldata`
--

CREATE TABLE `personaldata`
(
  `ID_Personaldata` int
(11) NOT NULL,
  `Firstname` varchar
(50) NOT NULL,
  `Lastname` varchar
(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Email` varchar
(50) DEFAULT NULL,
  `AHV` varchar
(16) NOT NULL,
  `Personalnumber` varchar
(16) NOT NULL,
  `Phonenumber` int
(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `companydata`
--
ALTER TABLE `companydata`
ADD PRIMARY KEY
(`ID_Companydata`),
ADD UNIQUE KEY `Departement`
(`Departement`);

--
-- Indizes für die Tabelle `personaldata`
--
ALTER TABLE `personaldata`
ADD PRIMARY KEY
(`ID_Personaldata`),
ADD UNIQUE KEY `Personalnumber`
(`Personalnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
