-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `ccfm`;
CREATE DATABASE `ccfm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ccfm`;

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


DROP TABLE IF EXISTS `pa`;
CREATE TABLE `pa` (
  `row` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `activities` text NOT NULL,
  PRIMARY KEY (`row`),
  KEY `date` (`date`),
  CONSTRAINT `pa_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
