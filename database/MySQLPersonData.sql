-- phpMyAdmin SQL Dump
-- version 5.0.1
--
-- Host: 127.0.0.1
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

CREATE TABLE `companydata` (
  `Companydata_ID` int(11) NOT NULL,
  `Companyname` varchar(50) NOT NULL,
  `Departement` varchar(50) NOT NULL,
  `Jobtitle` varchar(50) NOT NULL,
  `Jobdescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Companydata_ID`),
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
  `ID_Companydata` int(11) DEFAULT NULL,
  PRIMARY KEY (`Personaldata_ID`),
  UNIQUE KEY `Personalnumber` (`Personalnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* Create AUDIT Table */

CREATE TABLE `personaldata_audit` (
	  `id` INT AUTO_INCREMENT,
    `personaldata_id` INT NOT NULL,
    `changedate` DATETIME NOT NULL,
    action VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

--
-- Daten für Tabelle `personaldata`
--

INSERT INTO `personaldata` (`Personaldata_ID`, `Firstname`, `Lastname`, `Birthday`, `Email`, `AHV`, `Personalnumber`, `Phonenumber`, `ID_Companydata`) VALUES
(1, 'Samuel', 'Sättler', '2003-01-21', 'samuel.saettler@six-group.com', '123.4567.7891.12', '653454', 797542031, 1),
(2, 'Suhejl', 'Asani', '2003-04-22', NULL, '123.6543.9678.54', '5745634', NULL, 5);

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

-- Triggers

/* Create Triggers */

CREATE TRIGGER after_personaldata_insert
	AFTER INSERT ON personaldata
	FOR EACH ROW
	INSERT INTO personaldata_audit
	SET 
		action = 'insert',
		personaldata_id = NEW.Personaldata_ID,
		changedate = NOW();

CREATE TRIGGER before_personaldata_update
	BEFORE UPDATE ON personaldata
    FOR EACH ROW
    INSERT INTO personaldata_audit
    SET
		action = 'update',
        personaldata_id = OLD.Personaldata_ID,
        changedate = NOW();

CREATE TRIGGER before_personaldata_delete
	BEFORE DELETE ON personaldata
    FOR EACH ROW
    INSERT INTO personaldata_audit
    SET
		action = 'delete',
        personaldata_id = OLD.Personaldata_ID,
        changedate = NOW();

/* SELECT DATA */
SELECT * FROM personaldata;
SELECT * FROM personaldata_audit;

/* Test */
INSERT INTO personaldata(Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Phonenumber, ID_Companydata) 
VALUES('Suhejl', 'Asani', NOW(), 'suhejl.asani.17@gmail.com', 'ASDFGHJ', 123, 'fsd', 1);
UPDATE personaldata SET Firstname = "Culi" WHERE Personaldata_ID = 3;
DELETE FROM personaldata WHERE Personaldata_ID = 3;

-- Procedures

DELIMITER $$
CREATE PROCEDURE `Stored_Procedure_SELECT_INSERT_UPDATE_DELETE` (IN ID INT, IN firstname VARCHAR(50), IN lastname VARCHAR(50), IN birthday DATE, 
IN email VARCHAR(50), IN ahv VARCHAR(50), IN personalnumber INT, IN phonenumber VARCHAR(50), IN id_Companydata INT, IN Action VARCHAR(50))										
BEGIN
		IF Action = 'INSERT' THEN
				INSERT INTO personaldata  
							(Firstname,  
							 Lastname,  
							 Birthday,  
							 Email,
               AHV,
               Personalnumber,
               Phonenumber,
               ID_Companydata)
							 
				VALUES (firstname,  
							lastname,  
							birthday,  
							email,
              ahv,
              personalnumber,
              phonenumber,
              id_Companydata);

	  ELSEIF Action = 'SELECTBYID' THEN
            SELECT * FROM personaldata WHERE Personaldata_ID = ID;

      ELSEIF Action = 'SELECT' THEN
            SELECT p.Personaldata_ID as 'Personaldata_ID', p.Firstname as 'Firstname', p.Lastname as 'Lastname', p.Birthday as 'Birthday', p.Email as 'Email', p.AHV as 'AHV', p.Personalnumber as 'Personalnumber', p.Phonenumber as 'Phonenumber',
			 p.ID_Companydata as 'ID_Companydata', c.Companyname as 'Companyname', c.Departement as 'Departement', c.Jobtitle as 'Jobtitle', c.Jobdescription as 'Jobdescription' FROM personaldata p JOIN companydata c ON p.ID_Companydata = c.Companydata_ID;
            
	   ELSEIF Action = 'UPDATE' THEN
				UPDATE personaldata  
				SET    Firstname=firstname,  
					   Lastname=lastname,  
					   Birthday=birthday,  
					   Email=email,
                       AHV=ahv,
                       Personalnumber=personalnumber,
                       Phonenumber=phonenumber
				WHERE  Personaldata_ID=ID;
                
		  ELSEIF Action = 'DELETE' THEN
				DELETE FROM personaldata  
				WHERE Personaldata_ID = ID;
		END IF;
END