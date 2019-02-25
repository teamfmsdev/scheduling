-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2019 at 10:25 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ccfm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `doWhile` (IN `userDate` DATE)  BEGIN
DECLARE i DATE DEFAULT userDate; 
WHILE (MONTH(i) = MONTH(userDate)) DO
    INSERT INTO `parentRow` (`date`) values (i);
    SET i = DATE_ADD(i,INTERVAL 1 DAY);
END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bia`
--

CREATE TABLE `bia` (
  `date` date NOT NULL,
  `row` int(32) NOT NULL,
  `fmNo` text NOT NULL,
  `activities` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bia`
--

INSERT INTO `bia` (`date`, `row`, `fmNo`, `activities`, `status`) VALUES
('2019-02-18', 24, '', '', 0),
('2019-02-17', 26, '', '', 0),
('2019-01-01', 27, '13', 'FY2018 EOU MSR PATH FORWARD', 1),
('2019-01-01', 29, '14', 'Remove chairs', 1),
('2019-01-01', 30, '15', 'Cubicle replacement completion inspection at CCB', 0),
('2019-01-01', 31, '16', 'Housekeeping', 0),
('2019-01-01', 32, '17', 'Replace bunting', 0),
('2019-02-19', 33, '178', 'Hand kit spray & Bottle trap', 0),
('2019-02-19', 36, '181', 'Toilet cistern', 0),
('2019-02-19', 37, '182', 'ceiling/leaking', 0),
('2019-02-19', 39, '183', 'sink clogged ', 0),
('2019-02-19', 40, '184', 'floor trap clogged', 0),
('2019-02-19', 41, '185', 'workstations', 0),
('2019-02-19', 42, '186', 'arrangement training room 1', 0),
('2019-02-26', 54, '', '', 0),
('2019-01-02', 56, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cm`
--

CREATE TABLE `cm` (
  `row` int(11) NOT NULL,
  `date` date NOT NULL,
  `activities` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm`
--

INSERT INTO `cm` (`row`, `date`, `activities`) VALUES
(1, '2019-01-02', '');

-- --------------------------------------------------------

--
-- Table structure for table `pa`
--

CREATE TABLE `pa` (
  `row` int(11) NOT NULL,
  `date` date NOT NULL,
  `activities` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pa`
--

INSERT INTO `pa` (`row`, `date`, `activities`) VALUES
(1, '2019-01-02', '');

-- --------------------------------------------------------

--
-- Table structure for table `parentrow`
--

CREATE TABLE `parentrow` (
  `date` date NOT NULL,
  `n1` varchar(4) NOT NULL DEFAULT 'p0',
  `n2` varchar(4) NOT NULL DEFAULT 'p0',
  `n3` varchar(4) NOT NULL DEFAULT 'p0',
  `n4` varchar(4) NOT NULL DEFAULT 'p0',
  `n5` varchar(4) NOT NULL DEFAULT 'p0',
  `n6` varchar(4) NOT NULL DEFAULT 'p0',
  `n7` varchar(4) NOT NULL DEFAULT 'p0',
  `n8` varchar(4) NOT NULL DEFAULT 'p0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parentrow`
--

INSERT INTO `parentrow` (`date`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
('0000-00-00', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-01-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-02-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-03-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-04-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-05-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2019-07-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2020-03-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-01', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-02', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-03', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-04', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-05', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-06', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-07', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-08', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-09', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-10', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-11', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-12', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-13', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-14', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-15', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-16', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-17', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-18', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-19', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-20', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-21', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-22', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-23', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-24', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-25', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-26', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-27', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-28', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-29', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-30', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0'),
('2021-03-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0');

-- --------------------------------------------------------

--
-- Table structure for table `ptw`
--

CREATE TABLE `ptw` (
  `date` date NOT NULL,
  `row` int(32) NOT NULL,
  `fmNo` text NOT NULL,
  `activities` text NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT 'NR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ptw`
--

INSERT INTO `ptw` (`date`, `row`, `fmNo`, `activities`, `type`) VALUES
('2019-02-17', 1, '36216', 'manual pulling at EOG', 'NR'),
('2019-02-17', 2, '32717', 'meracun rumput at tangki bomba utility', 'NR'),
('2019-02-17', 3, '32762', 'mesin rumput at landfarm lot N', 'NR'),
('2019-02-17', 4, '40649', 'scale house renovation', 'NR'),
('2019-02-17', 5, '40650', 'landscaping admin', 'NR'),
('2019-02-18', 6, '36216', 'manual pulling at EOG', 'NR'),
('2019-02-18', 7, '32717', 'meracun rumput at tangki bomba utility', 'NR'),
('2019-02-18', 8, '32762', 'mesin rumput at landfarm lot N', 'NR'),
('2019-02-18', 9, '40649', 'scale house renovation', 'NR'),
('2019-02-18', 10, '40650', 'landscaping admin', 'NR'),
('2019-02-18', 11, '32763', 'meracun at lot N', 'NR'),
('2019-02-19', 21, '36216', 'manual pulling at EOG', 'NR'),
('2019-02-19', 22, '32717', 'meracun rumput at tepi pagar gate 2utility', 'NR'),
('2019-02-19', 23, '32762', 'mesin rumput at landfarm lot N', 'NR'),
('2019-02-19', 24, '40649', 'scale house renovation', 'NR'),
('2019-02-19', 25, '40650', 'landscaping admin', 'NR'),
('2019-02-19', 26, '32763', 'meracun at lot N', 'NR'),
('2019-02-20', 43, '36216', 'manual pulling at EOG', 'NR'),
('2019-02-20', 44, '32717', 'meracun rumput at tepi pagar gate 2utility', 'NR'),
('2019-02-20', 45, '32762', 'mesin rumput at landfarm lot N', 'NR'),
('2019-02-20', 46, '40649', 'scale house renovation', 'NR'),
('2019-02-20', 47, '40650', 'landscaping admin', 'NR'),
('2019-02-20', 48, '32763', 'meracun at lot N', 'NR'),
('2019-02-20', 49, '41207', 'Tukar Lampu Admin', 'NR'),
('2019-02-21', 50, '36216', 'manual pulling at EOG', 'NR'),
('2019-02-21', 51, '32717', 'meracun rumput at tepi pagar gate 2utility', 'NR'),
('2019-02-21', 52, '32762', 'mesin rumput at landfarm lot N', 'NR'),
('2019-02-21', 53, '40649', 'scale house renovation', 'NR'),
('2019-02-21', 54, '40650', 'landscaping admin', 'NR'),
('2019-02-21', 55, '32763', 'meracun at lot N', 'NR'),
('2019-02-21', 56, '41207', 'Tukar Lampu Admin', 'NR'),
('2019-01-01', 57, '35476', 'To rewiring power & network cable', 'NR'),
('2019-01-01', 58, '21923', 'Grass spray poisoning Lot M', 'NR'),
('2019-01-01', 59, '21924', 'Grass cutting', 'NR'),
('2019-01-01', 60, '30067', 'Grass spray poisoning Lot M', 'NR'),
('2019-01-01', 61, '61001', 'Grass Manual Pulling', 'NR'),
('2019-01-01', 62, '38371', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-01', 63, '40607', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-01', 64, '40606', 'Repair PAMC 3 at Utilities', 'NR'),
('2019-01-02', 65, '35476', 'To rewiring power & network cable', 'NR'),
('2019-01-02', 66, '21923', 'Grass spray poisoning Lot M', 'R'),
('2019-01-02', 67, '21924', 'Grass cutting', 'R'),
('2019-01-02', 68, '30067', 'Grass spray poisoning Lot M', 'R'),
('2019-01-02', 69, '61001', 'Grass Manual Pulling', 'R'),
('2019-01-02', 70, '38371', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-02', 71, '40607', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-02', 72, '40606', 'Repair PAMC 3 at Utilities', 'NR'),
('2019-01-03', 73, '35476', 'To rewiring power & network cable', 'NR'),
('2019-01-03', 74, '21923', 'Grass spray poisoning Lot M', 'R'),
('2019-01-03', 75, '21924', 'Grass cutting', 'R'),
('2019-01-03', 76, '30067', 'Grass spray poisoning Lot M', 'R'),
('2019-01-03', 77, '61001', 'Grass Manual Pulling', 'R'),
('2019-01-03', 78, '38371', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-03', 79, '40607', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-03', 80, '40606', 'Repair PAMC 3 at Utilities', 'NR'),
('2019-01-06', 81, '39523', 'Manual pulling grass at EOG', 'NR'),
('2019-01-06', 82, '39920', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-06', 83, '30485', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-06', 84, '35477', 'TCU unit at Gate 3 activity', 'NR'),
('2019-01-06', 85, '40610', 'Grass cutting at Warehouse at Lot N', 'NR'),
('2019-01-06', 86, '40611', 'Grass cutting at Admin complex', 'NR'),
('2019-01-07', 87, '39523', 'Manual pulling grass at EOG', 'NR'),
('2019-01-07', 88, '39920', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-07', 89, '30485', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-07', 90, '40610', 'Grass cutting at Warehouse at Lot N', 'NR'),
('2019-01-07', 91, '40611', 'Grass cutting at Admin complex', 'NR'),
('2019-01-07', 92, '61017', 'Grass ( poisoning spray ) at EOG', 'NR'),
('2019-01-08', 93, '39523', 'Manual pulling grass at EOG', 'NR'),
('2019-01-08', 94, '39920', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-08', 95, '30485', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-08', 96, '40610', 'Grass cutting at Warehouse at Lot N', 'NR'),
('2019-01-08', 97, '40611', 'Grass cutting at Admin complex', 'NR'),
('2019-01-08', 98, '40612', 'Repair gutter at parking Lot Admin', 'NR'),
('2019-01-09', 99, '39523', 'Manual pulling grass at EOG', 'NR'),
('2019-01-09', 100, '39920', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-09', 101, '30485', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-09', 102, '40610', 'Grass cutting at Warehouse at Lot N', 'NR'),
('2019-01-09', 103, '40611', 'Grass cutting at Admin complex', 'NR'),
('2019-01-09', 104, '37822', 'Erect scaffolding at HSE building', 'NR'),
('2019-01-09', 105, '21928', 'Grass ( poisoning spray ) at warehouse Lot N', 'NR'),
('2019-01-09', 106, '44055', 'Rectify smoke detector at Admin Building', 'NR'),
('2019-01-10', 107, '39523', 'Manual pulling grass at EOG', 'NR'),
('2019-01-10', 108, '39920', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-01-10', 109, '30485', 'Repair PAMC 5 at Utilities', 'NR'),
('2019-01-10', 110, '40610', 'Grass cutting at Warehouse at Lot N', 'NR'),
('2019-01-10', 111, '40611', 'Grass cutting at Admin complex', 'NR'),
('2019-01-10', 112, '37822', 'Erect scaffolding at HSE building', 'NR'),
('2019-01-13', 113, '40709', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-13', 114, '21933', 'Grass Cutting at Warehouse', 'NR'),
('2019-01-13', 115, '21934', 'Grass ( Poisoning spray ) at Warehouse', 'NR'),
('2019-01-13', 116, '40614', 'Grass cutting at Admin Building', 'NR'),
('2019-01-14', 117, '40709', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-14', 118, '21933', 'Grass Cutting at Warehouse', 'NR'),
('2019-01-14', 119, '21934', 'Grass ( Poisoning spray ) at Warehouse', 'NR'),
('2019-01-14', 120, '40614', 'Grass cutting at Admin Building', 'NR'),
('2019-01-15', 121, '40709', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-15', 122, '21933', 'Grass Cutting at Warehouse', 'NR'),
('2019-01-15', 123, '21934', 'Grass ( Poisoning spray ) at Warehouse', 'NR'),
('2019-01-15', 124, '40614', 'Grass cutting at Admin Building', 'NR'),
('2019-01-15', 125, '40616', 'Check and rectify CCTV at Gate 1', 'NR'),
('2019-01-15', 126, '38378', 'Erect scaffolding at chiller Admin', 'NR'),
('2019-01-15', 127, '40617', 'PPM CCTV CACS', 'NR'),
('2019-01-15', 128, '43512', 'Firmware Upgrade', 'NR'),
('2019-01-15', 129, '44065', 'PPM VESDA', 'NR'),
('2019-01-16', 130, '40709', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-16', 131, '21933', 'Grass Cutting at Warehouse', 'NR'),
('2019-01-16', 132, '21934', 'Grass ( Poisoning spray ) at Warehouse', 'NR'),
('2019-01-16', 133, '40614', 'Grass cutting at Admin Building', 'NR'),
('2019-01-16', 134, '40616', 'Check and rectify CCTV at Gate 1', 'NR'),
('2019-01-16', 135, '38378', 'Erect scaffolding at chiller Admin', 'NR'),
('2019-01-16', 136, '40617', 'PPM CCTV CACS', 'NR'),
('2019-01-16', 137, '43512', 'Firmware Upgrade', 'NR'),
('2019-01-16', 138, '44065', 'PPM VESDA', 'NR'),
('2019-01-17', 139, '40709', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-17', 140, '21933', 'Grass Cutting at Warehouse', 'NR'),
('2019-01-17', 141, '21934', 'Grass ( Poisoning spray ) at Warehouse', 'NR'),
('2019-01-17', 142, '40614', 'Grass cutting at Admin Building', 'NR'),
('2019-01-17', 143, '40616', 'Check and rectify CCTV at Gate 1', 'NR'),
('2019-01-17', 144, '38378', 'Erect scaffolding at chiller Admin', 'NR'),
('2019-01-17', 145, '40617', 'PPM CCTV CACS', 'NR'),
('2019-01-17', 146, '43512', 'Firmware Upgrade', 'NR'),
('2019-01-17', 147, '44065', 'PPM VESDA', 'NR'),
('2019-01-20', 148, '40712', 'Scale house and Gate 2 renovation', 'NR'),
('2019-01-20', 149, '32726', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-20', 150, '32727', 'Dismantle scaffolding at CR3 Olefins ', 'NR'),
('2019-01-20', 151, '40618', 'PPM CCTV at Warehouse', 'NR'),
('2019-01-20', 152, '40619', 'PPM CCTV GTR at Lot M', 'NR'),
('2019-01-20', 153, '61004', 'Manual pulling at Utilities', 'NR'),
('2019-01-20', 154, '32602', 'Grass ( poisoning Spray ) at Utilities', 'NR'),
('2019-01-20', 155, '40626', 'Repair and replace Gutter at HSE Building', 'NR'),
('2019-01-20', 156, '21933', 'Grass cutting at Lot N', 'NR'),
('2019-01-20', 157, '21938', 'Grass ( poisoning Spray ) at Lot N', 'NR'),
('2019-01-21', 158, '40712', 'Scale house and Gate 2 renovation', 'NR'),
('2019-01-21', 159, '32726', 'Repair PAMC 8 at Utilities', 'NR'),
('2019-01-21', 160, '32727', 'Dismantle scaffolding at CR3 Olefins ', 'NR'),
('2019-01-21', 161, '40618', 'PPM CCTV at Warehouse', 'NR'),
('2019-01-21', 162, '40619', 'PPM CCTV GTR at Lot M', 'NR'),
('2019-01-21', 163, '61004', 'Manual pulling at Utilities', 'NR'),
('2019-01-21', 164, '32602', 'Grass ( poisoning Spray ) at Utilities', 'NR'),
('2019-01-21', 165, '40626', 'Repair and replace Gutter at HSE Building', 'NR'),
('2019-01-21', 166, '21933', 'Grass cutting at Lot N', 'NR'),
('2019-01-21', 167, '21938', 'Grass ( poisoning Spray ) at Lot N', 'NR'),
('2019-01-22', 168, '40712', 'Scale house and Gate 2 renovation', 'NR'),
('2019-01-22', 169, '40618', 'PPM CCTV at Warehouse', 'NR'),
('2019-01-22', 170, '40619', 'PPM CCTV GTR at Lot M', 'NR'),
('2019-01-22', 171, '61004', 'Manual pulling at Utilities', 'NR'),
('2019-01-22', 172, '32602', 'Grass ( poisoning Spray ) at Utilities', 'NR'),
('2019-01-22', 173, '40626', 'Repair and replace Gutter at HSE Building', 'NR'),
('2019-01-22', 174, '21933', 'Grass cutting at Lot N', 'NR'),
('2019-01-22', 175, '21938', 'Grass ( poisoning Spray ) at Lot N', 'NR'),
('2019-01-22', 176, '36177', 'Erect scaffolding at CR3 Olefins Plant', 'NR'),
('2019-01-23', 177, '40712', 'Scale house and Gate 2 renovation', 'NR'),
('2019-01-23', 178, '40619', 'PPM CCTV GTR at Lot M', 'NR'),
('2019-01-23', 179, '61004', 'Manual pulling at Utilities', 'NR'),
('2019-01-23', 180, '32602', 'Grass ( poisoning Spray ) at Utilities', 'NR'),
('2019-01-23', 181, '40626', 'Repair and replace Gutter at HSE Building', 'NR'),
('2019-01-23', 182, '21933', 'Grass cutting at Lot N', 'NR'),
('2019-01-23', 183, '21938', 'Grass ( poisoning Spray ) at Lot N', 'NR'),
('2019-01-23', 184, '36177', 'Erect scaffolding at CR3 Olefins Plant', 'NR'),
('2019-01-23', 185, '40628', 'Grass cutting at Admin Building', 'NR'),
('2019-01-23', 186, '40629', 'Grass cutting at Perimeter PCOGD', 'NR'),
('2019-01-24', 187, '40712', 'Scale house and Gate 2 renovation', 'NR'),
('2019-01-24', 188, '40619', 'PPM CCTV GTR at Lot M', 'NR'),
('2019-01-24', 189, '61004', 'Manual pulling at Utilities', 'NR'),
('2019-01-24', 190, '32602', 'Grass ( poisoning Spray ) at Utilities', 'NR'),
('2019-01-24', 191, '40626', 'Repair and replace Gutter at HSE Building', 'NR'),
('2019-01-24', 192, '21933', 'Grass cutting at Lot N', 'NR'),
('2019-01-24', 193, '21938', 'Grass ( poisoning Spray ) at Lot N', 'NR'),
('2019-01-24', 194, '36177', 'Erect scaffolding at CR3 Olefins Plant', 'NR'),
('2019-01-24', 195, '40628', 'Grass cutting at Admin Building', 'NR'),
('2019-01-24', 196, '40629', 'Grass cutting at Perimeter PCOGD', 'NR'),
('2019-01-27', 197, '36221', 'Manual pulling grass at Olefins plant', 'NR'),
('2019-01-27', 198, '36230', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-01-27', 199, '32751', 'Grass cutting at Lot N', 'NR'),
('2019-01-27', 200, '40641', 'Grass cutting at Admin Building', 'NR'),
('2019-01-27', 201, '43730', 'Services AHU at Admin Building', 'NR'),
('2019-01-27', 202, '40636', 'Renovation at Gate 2 and scale house', 'NR'),
('2019-01-28', 203, '36221', 'Manual pulling grass at Olefins plant', 'NR'),
('2019-01-28', 204, '36230', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-01-28', 205, '32751', 'Grass cutting at Lot N', 'NR'),
('2019-01-28', 206, '40641', 'Grass cutting at Admin Building', 'NR'),
('2019-01-28', 207, '43730', 'Services AHU at Admin Building', 'NR'),
('2019-01-28', 208, '40636', 'Renovation at Gate 2 and scale house', 'NR'),
('2019-01-29', 209, '36221', 'Manual pulling grass at Olefins plant', 'NR'),
('2019-01-29', 210, '36230', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-01-29', 211, '32751', 'Grass cutting at Lot N', 'NR'),
('2019-01-29', 212, '40641', 'Grass cutting at Admin Building', 'NR'),
('2019-01-29', 213, '43730', 'Services AHU at Admin Building', 'NR'),
('2019-01-29', 214, '40636', 'Renovation at Gate 2 and scale house', 'NR'),
('2019-01-30', 215, '36221', 'Manual pulling grass at Olefins plant', 'NR'),
('2019-01-30', 216, '36230', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-01-30', 217, '32751', 'Grass cutting at Lot N', 'NR'),
('2019-01-30', 218, '40641', 'Grass cutting at Admin Building', 'NR'),
('2019-01-30', 219, '43730', 'Services AHU at Admin Building', 'NR'),
('2019-01-30', 220, '40636', 'Renovation at Gate 2 and scale house', 'NR'),
('2019-01-31', 221, '36221', 'Manual pulling grass at Olefins plant', 'NR'),
('2019-01-31', 222, '32751', 'Grass cutting at Lot N', 'NR'),
('2019-01-31', 223, '40641', 'Grass cutting at Admin Building', 'NR'),
('2019-01-31', 224, '40636', 'Renovation at Gate 2 and scale house', 'NR'),
('2019-01-31', 225, '32734', 'Dismantle scaffolding at HSE Building', 'NR'),
('2019-02-01', 226, '32731', 'Dismantle scaffolding at CR3 Olefins', 'NR'),
('2019-02-01', 227, '', 'To repair chiller at Admin', 'NR'),
('2019-02-02', 228, '', 'Pest Control at Admin Building', 'NR'),
('2019-02-03', 229, '36217', 'Manual pulling grass at Olefins', 'R'),
('2019-02-03', 230, '32732', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-03', 231, '32752', 'Grass cutting at Lot N', 'R'),
('2019-02-03', 232, '40644', 'Grass cutting at Admin Building', 'R'),
('2019-02-03', 233, '43743', 'Repair HVAC Aircond at Admin', 'NR'),
('2019-02-04', 234, '36217', 'Manual pulling grass at Olefins', 'R'),
('2019-02-04', 235, '32732', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-04', 236, '32752', 'Grass cutting at Lot N', 'NR'),
('2019-02-04', 237, '40644', 'Grass cutting at Admin Building', 'NR'),
('2019-02-08', 238, '', 'Pest control activity at CCB', 'NR'),
('2019-02-08', 239, '', 'Pest control activity at HSE', 'NR'),
('2019-02-08', 240, '', 'Pest control activity at Maintenance', 'NR'),
('2019-02-09', 241, '', 'Pest control activity at Lab', 'NR'),
('2019-02-09', 242, '', 'Services kitchen Equipment', 'NR'),
('2019-02-10', 243, '40637', 'Renovation at Gate 2 & scale House', 'NR'),
('2019-02-10', 244, '40645', 'Grass cutting at Admin', 'NR'),
('2019-02-10', 245, '32509', 'Manual Pulling at Olefins plant', 'NR'),
('2019-02-10', 246, '32755', 'Grass cutting at Lot N', 'NR'),
('2019-02-11', 247, '40637', 'Renovation at Gate 2 & scale House', 'NR'),
('2019-02-11', 248, '40645', 'Grass cutting at Admin', 'NR'),
('2019-02-11', 249, '32509', 'Manual Pulling at Olefins plant', 'NR'),
('2019-02-11', 250, '32755', 'Grass cutting at Lot N', 'NR'),
('2019-02-11', 251, '36357', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-11', 252, '32759', 'Grass ( poisoning spray ) at Lot N', 'NR'),
('2019-02-12', 253, '40637', 'Renovation at Gate 2 & scale House', 'NR'),
('2019-02-12', 254, '40645', 'Grass cutting at Admin', 'NR'),
('2019-02-12', 255, '32509', 'Manual Pulling at Olefins plant', 'NR'),
('2019-02-12', 256, '32755', 'Grass cutting at Lot N', 'NR'),
('2019-02-12', 257, '36357', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-12', 258, '32759', 'Grass ( poisoning spray ) at Lot N', 'NR'),
('2019-02-13', 259, '40637', 'Renovation at Gate 2 & scale House', 'NR'),
('2019-02-13', 260, '40645', 'Grass cutting at Admin', 'NR'),
('2019-02-13', 261, '32509', 'Manual Pulling at Olefins plant', 'NR'),
('2019-02-13', 262, '32755', 'Grass cutting at Lot N', 'NR'),
('2019-02-13', 263, '36357', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-13', 264, '32759', 'Grass ( poisoning spray ) at Lot N', 'NR'),
('2019-02-13', 265, '40969', 'Replace Bulb at Admin Building', 'NR'),
('2019-02-14', 266, '40637', 'Renovation at Gate 2 & scale House', 'NR'),
('2019-02-14', 267, '40645', 'Grass cutting at Admin', 'NR'),
('2019-02-14', 268, '32509', 'Manual Pulling at Olefins plant', 'NR'),
('2019-02-14', 269, '32755', 'Grass cutting at Lot N', 'NR'),
('2019-02-14', 270, '36357', 'Dismantle scaffolding at CR3 Olefins plant', 'NR'),
('2019-02-14', 271, '32759', 'Grass ( poisoning spray ) at Lot N', 'NR'),
('2019-02-14', 272, '40969', 'Replace Bulb at Admin Building', 'NR'),
('2019-02-22', 273, '', 'Cutting trees at perimeter parking Lot', 'NR'),
('2019-02-23', 275, '', 'Cutting trees at perimeter parking Lot', 'NR'),
('2019-02-23', 277, '', 'Repair floor trap at Maintenance toilet', 'NR'),
('2019-02-24', 278, '36365', 'Manual pulling at Utilities shelter', 'NR'),
('2019-02-24', 279, '40655', 'Grass ( poisoning spray ) at Utilities shelter', 'NR'),
('2019-02-25', 284, '40655', 'Grass ( poisoning spray ) at Utilities shelter', 'R'),
('2019-02-25', 285, '40657', 'renovation gate 2', 'NR'),
('2019-02-25', 286, '32775', 'meracun di lot N', 'R'),
('2019-02-25', 287, '32774', 'Grass cutting lot N', 'R'),
('2019-02-25', 288, '36366', 'cabut rumput di derivatives', 'R'),
('2019-02-25', 299, '40658', 'gate 1f replacement ', 'NR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bia`
--
ALTER TABLE `bia`
  ADD PRIMARY KEY (`row`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `cm`
--
ALTER TABLE `cm`
  ADD PRIMARY KEY (`row`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `pa`
--
ALTER TABLE `pa`
  ADD PRIMARY KEY (`row`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `parentrow`
--
ALTER TABLE `parentrow`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `ptw`
--
ALTER TABLE `ptw`
  ADD PRIMARY KEY (`row`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bia`
--
ALTER TABLE `bia`
  MODIFY `row` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `cm`
--
ALTER TABLE `cm`
  MODIFY `row` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pa`
--
ALTER TABLE `pa`
  MODIFY `row` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ptw`
--
ALTER TABLE `ptw`
  MODIFY `row` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bia`
--
ALTER TABLE `bia`
  ADD CONSTRAINT `bia_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`);

--
-- Constraints for table `cm`
--
ALTER TABLE `cm`
  ADD CONSTRAINT `cm_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`);

--
-- Constraints for table `pa`
--
ALTER TABLE `pa`
  ADD CONSTRAINT `pa_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`);

--
-- Constraints for table `ptw`
--
ALTER TABLE `ptw`
  ADD CONSTRAINT `ptw_ibfk_1` FOREIGN KEY (`date`) REFERENCES `parentrow` (`date`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
