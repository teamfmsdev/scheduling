-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `ccfm`;

DELIMITER ;;

DROP PROCEDURE IF EXISTS `doWhile`;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doWhile`(IN `userDate` DATE)
BEGIN
DECLARE i DATE DEFAULT userDate; 
WHILE (MONTH(i) = MONTH(userDate)) DO
    INSERT INTO `parentRow` (`date`) values (i);
    SET i = DATE_ADD(i,INTERVAL 1 DAY);
END WHILE;
END;;

DELIMITER ;

CREATE TABLE `biaschedule` (`date` date, `row` int(32), `fmNo` text, `priority` text, `activities` text, `description` text, `status` text, `closedBy` text, `completionDate` text);


DROP TABLE IF EXISTS `biaschedule`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `biaschedule` AS select `ccfm`.`bia`.`date` AS `date`,`ccfm`.`bia`.`row` AS `row`,`ccfm`.`bia`.`fmNo` AS `fmNo`,`ms`.`main`.`Priority` AS `priority`,`ms`.`main`.`Work Title` AS `activities`,`ms`.`main`.`Description` AS `description`,`ms`.`main`.`Status` AS `status`,`ms`.`main`.`Closed By` AS `closedBy`,`ms`.`main`.`Completion Date` AS `completionDate` from (`ccfm`.`bia` join `ms`.`main` on((`ccfm`.`bia`.`fmNo` = `ms`.`main`.`row`)));

-- 2019-03-02 17:13:58
