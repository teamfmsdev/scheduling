-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `ccfm`;
CREATE DATABASE `ccfm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ccfm`;

DELIMITER ;;

CREATE PROCEDURE `doWhile`(IN userDate DATE)
BEGIN
DECLARE i DATE DEFAULT userDate; 
WHILE (MONTH(i) = MONTH(userDate)) DO
    INSERT INTO `parentRow` (`date`) values (i);
    SET i = DATE_ADD(i,INTERVAL 1 DAY);
END WHILE;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `bia`;
CREATE TABLE `bia` (
  `date` date NOT NULL,
  `row` int(32) NOT NULL AUTO_INCREMENT,
  `fmNo` text NOT NULL,
  `activities` text NOT NULL,
  PRIMARY KEY (`row`),
  KEY `date` (`date`),
  CONSTRAINT `bia_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `cm`;
CREATE TABLE `cm` (
  `row` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `activities` text NOT NULL,
  PRIMARY KEY (`row`),
  KEY `date` (`date`),
  CONSTRAINT `cm_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `main`;
CREATE TABLE `main` (
  `row` int(11) NOT NULL AUTO_INCREMENT,
  `Work Title` text NOT NULL,
  `Priority` text NOT NULL,
  `Type 1` text NOT NULL,
  `Type 2` text NOT NULL,
  `Description` text NOT NULL,
  `Location` text NOT NULL,
  `Status` text NOT NULL,
  `Company` text NOT NULL,
  `SAP#` text NOT NULL,
  `Request By` text NOT NULL,
  `Request Date` text NOT NULL,
  `Closed By` text NOT NULL,
  `Completion Date` text,
  PRIMARY KEY (`row`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `pa`;
CREATE TABLE `pa` (
  `row` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `activities` text NOT NULL,
  PRIMARY KEY (`row`),
  KEY `date` (`date`),
  CONSTRAINT `pa_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `parentrow`;
CREATE TABLE `parentrow` (
  `date` date NOT NULL,
  `n1` varchar(4) NOT NULL DEFAULT 'p0',
  `n2` varchar(4) NOT NULL DEFAULT 'p0',
  `n3` varchar(4) NOT NULL DEFAULT 'p0',
  `n4` varchar(4) NOT NULL DEFAULT 'p0',
  `n5` varchar(4) NOT NULL DEFAULT 'p0',
  `n6` varchar(4) NOT NULL DEFAULT 'p0',
  `n7` varchar(4) NOT NULL DEFAULT 'p0',
  `n8` varchar(4) NOT NULL DEFAULT 'p0',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `parentrow` (`date`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
('2019-01-01',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-02',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-03',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-04',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-05',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-06',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-07',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-08',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-09',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-10',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-11',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-12',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-13',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-14',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-15',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-16',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-17',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-18',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-19',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-20',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-21',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-22',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-23',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-24',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-25',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-26',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-27',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-28',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-29',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-30',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-01-31',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-01',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-02',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-03',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-04',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-05',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-06',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-07',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-08',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-09',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-10',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-11',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-12',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-13',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-14',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-15',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-16',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-17',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-18',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-19',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-20',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-21',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-22',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-23',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-24',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-25',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-26',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-27',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-28',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-29',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0'),
('2019-09-30',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0',	'p0');

DROP TABLE IF EXISTS `ptw`;
CREATE TABLE `ptw` (
  `date` date NOT NULL,
  `row` int(32) NOT NULL AUTO_INCREMENT,
  `fmNo` text NOT NULL,
  `activities` text NOT NULL,
  PRIMARY KEY (`row`),
  KEY `date` (`date`),
  CONSTRAINT `ptw_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2019-02-17 16:18:39
