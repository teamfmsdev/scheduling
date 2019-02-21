-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 07:37 AM
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
  `activities` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bia`
--

INSERT INTO `bia` (`date`, `row`, `fmNo`, `activities`) VALUES
('2019-02-18', 24, '', ''),
('2019-02-17', 26, '', ''),
('2019-01-01', 27, '13', 'FY2018 EOU MSR PATH FORWARD'),
('2019-01-01', 29, '14', 'Remove chairs'),
('2019-01-01', 30, '15', 'Cubicle replacement completion inspection at CCB'),
('2019-01-01', 31, '16', 'Housekeeping'),
('2019-01-01', 32, '17', 'Replace bunting'),
('2019-02-19', 33, '178', 'Hand kit spray & Bottle trap'),
('2019-02-19', 36, '181', 'Toilet cistern'),
('2019-02-19', 37, '182', 'ceiling/leaking'),
('2019-02-19', 39, '183', 'sink clogged '),
('2019-02-19', 40, '184', 'floor trap clogged'),
('2019-02-19', 41, '185', 'workstations'),
('2019-02-19', 42, '186', 'arrangement training room 1');

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
('2019-05-31', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0', 'p0');

-- --------------------------------------------------------

--
-- Table structure for table `ptw`
--

CREATE TABLE `ptw` (
  `date` date NOT NULL,
  `row` int(32) NOT NULL,
  `fmNo` text NOT NULL,
  `activities` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ptw`
--

INSERT INTO `ptw` (`date`, `row`, `fmNo`, `activities`) VALUES
('2019-02-17', 1, '36216', 'manual pulling at EOG'),
('2019-02-17', 2, '32717', 'meracun rumput at tangki bomba utility'),
('2019-02-17', 3, '32762', 'mesin rumput at landfarm lot N'),
('2019-02-17', 4, '40649', 'scale house renovation'),
('2019-02-17', 5, '40650', 'landscaping admin'),
('2019-02-18', 6, '36216', 'manual pulling at EOG'),
('2019-02-18', 7, '32717', 'meracun rumput at tangki bomba utility'),
('2019-02-18', 8, '32762', 'mesin rumput at landfarm lot N'),
('2019-02-18', 9, '40649', 'scale house renovation'),
('2019-02-18', 10, '40650', 'landscaping admin'),
('2019-02-18', 11, '32763', 'meracun at lot N'),
('2019-02-19', 21, '36216', 'manual pulling at EOG'),
('2019-02-19', 22, '32717', 'meracun rumput at tepi pagar gate 2utility'),
('2019-02-19', 23, '32762', 'mesin rumput at landfarm lot N'),
('2019-02-19', 24, '40649', 'scale house renovation'),
('2019-02-19', 25, '40650', 'landscaping admin'),
('2019-02-19', 26, '32763', 'meracun at lot N'),
('2019-02-20', 43, '36216', 'manual pulling at EOG'),
('2019-02-20', 44, '32717', 'meracun rumput at tepi pagar gate 2utility'),
('2019-02-20', 45, '32762', 'mesin rumput at landfarm lot N'),
('2019-02-20', 46, '40649', 'scale house renovation'),
('2019-02-20', 47, '40650', 'landscaping admin'),
('2019-02-20', 48, '32763', 'meracun at lot N'),
('2019-02-20', 49, '41207', 'Tukar Lampu Admin');

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
  MODIFY `row` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `cm`
--
ALTER TABLE `cm`
  MODIFY `row` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pa`
--
ALTER TABLE `pa`
  MODIFY `row` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ptw`
--
ALTER TABLE `ptw`
  MODIFY `row` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
