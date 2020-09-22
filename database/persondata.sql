-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Sep 2020 um 14:42
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

CREATE TABLE `companydatatest` (
  `Companydata_ID` int(11) NOT NULL,
  `Companyname` varchar(50) NOT NULL,
  `Departement` varchar(50) NOT NULL,
  `Jobtitle` varchar(50) NOT NULL,
  `Jobdescription` varchar(255) DEFAULT NULL,
  UNIQUE KEY(`Companyname`, `Departement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `companydata`
--

INSERT INTO `companydata` (`Companydata_ID`, `Companyname`, `Departement`, `Jobtitle`, `Jobdescription`) VALUES
(1, 'SIX Group', 'IT Apprentice', 'IT Applicationdeveloper', NULL),
(5, 'Noser Engineering', 'IT Tester', 'IT Applicationdeveloper', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personaldata`
--

CREATE TABLE `personaldata` (
  `Personaldata_ID` int(11) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AHV` varchar(50) NOT NULL,
  `Personalnumber` int(11) NOT NULL,
  `Phonenumber` varchar(50) DEFAULT NULL,
  `ID_Companydata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `personaldata`
--

INSERT INTO `personaldata` (`Personaldata_ID`, `Firstname`, `Lastname`, `Birthday`, `Email`, `AHV`, `Personalnumber`, `Phonenumber`, `ID_Companydata`) VALUES
(1, 'Samuel', 'Sättler', '2003-01-21', 'samuel.saettler@six-group.com', '123.4567.7891.12', '653454', 797542031, 1),
(2, 'Suhejl', 'Asani', '2003-04-22', NULL, '123.6543.9678.54', '5745634', NULL, 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `companydata`
--
ALTER TABLE `companydata`
  ADD PRIMARY KEY (`Companydata_ID`),
  ADD UNIQUE KEY `Departement` (`Departement`);

--
-- Indizes für die Tabelle `personaldata`
--
ALTER TABLE `personaldata`
  ADD PRIMARY KEY (`Personaldata_ID`),
  ADD UNIQUE KEY `Personalnumber` (`Personalnumber`),
  ADD KEY `ID_Companydata` (`ID_Companydata`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `companydata`
--
ALTER TABLE `companydata`
  MODIFY `Companydata_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `personaldata`
--
ALTER TABLE `personaldata`
  MODIFY `Personaldata_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `personaldata`
--
ALTER TABLE `personaldata`
  ADD CONSTRAINT `personaldata_ibfk_1` FOREIGN KEY (`ID_Companydata`) REFERENCES `companydata` (`Companydata_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
