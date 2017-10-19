-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Host: 10.6.186.92
-- Generation Time: Feb 23, 2009 at 05:34 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `esrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `buil_id` tinyint(2) unsigned NOT NULL auto_increment,
  `camp_id` tinyint(1) unsigned NOT NULL,
  `building` varchar(60) collate latin1_german2_ci NOT NULL,
  `disable_b` bit(1) NOT NULL default '\0',
  `default_b` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`buil_id`),
  UNIQUE KEY `buildings_ui` (`camp_id`,`building`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` VALUES(12, 1, 'ATLAS', '\0', '\0');
INSERT INTO `buildings` VALUES(13, 1, 'Benson', '\0', '.');
INSERT INTO `buildings` VALUES(14, 1, 'Engineering', '\0', '\0');
INSERT INTO `buildings` VALUES(15, 1, 'Discovery', '\0', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `campuses`
--

CREATE TABLE IF NOT EXISTS `campuses` (
  `camp_id` tinyint(1) unsigned NOT NULL auto_increment,
  `campus` varchar(60) collate latin1_german2_ci NOT NULL,
  `email_alias` varchar(40) collate latin1_german2_ci NOT NULL,
  `email_domain` varchar(40) collate latin1_german2_ci NOT NULL,
  `default_c` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`camp_id`),
  UNIQUE KEY `campuses_ui` (`campus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `campuses`
--

INSERT INTO `campuses` VALUES(1, 'CU - Boulder', 'am_admin', 'colorado.edu', '.');
INSERT INTO `campuses` VALUES(2, 'CU - Denver', '', '', '\0');
INSERT INTO `campuses` VALUES(3, 'CU - Colorado Springs', 'am_admin', 'cusprings.edu', '\0');
INSERT INTO `campuses` VALUES(4, 'FRCC - Front Range Community College', '', '', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `crse_id` smallint(4) unsigned NOT NULL auto_increment,
  `dept_id` tinyint(2) unsigned NOT NULL,
  `crse_number` varchar(10) collate latin1_german2_ci NOT NULL,
  `course` varchar(60) collate latin1_german2_ci NOT NULL,
  `creator_c` mediumint(7) unsigned NOT NULL default '0',
  `created_c` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_c` bit(1) NOT NULL default '\0',
  `default_c` bit(1) default '\0',
  PRIMARY KEY  (`crse_id`),
  UNIQUE KEY `courses_ui` (`crse_number`),
  KEY `courses_fk` (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='list of courses related to their departments' AUTO_INCREMENT=1243 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` VALUES(1234, 12, 'APPM 1345', 'Calculus 1B with Algebra', 0, '2009-01-26 03:35:59', '\0', '\0');
INSERT INTO `courses` VALUES(1235, 12, 'APPM 1350', 'Calculus 1 for Engineers', 0, '2009-01-26 03:35:59', '\0', '\0');
INSERT INTO `courses` VALUES(1236, 12, 'APPM 1360', 'Calculus 2 for Engineers', 0, '2009-01-26 03:35:59', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` tinyint(2) unsigned NOT NULL auto_increment,
  `camp_id` tinyint(1) unsigned NOT NULL default '0',
  `dept_number` varchar(10) collate latin1_german2_ci NOT NULL,
  `department` varchar(60) collate latin1_german2_ci NOT NULL,
  `disable_d` bit(1) NOT NULL default '\0',
  `default_d` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`dept_id`),
  UNIQUE KEY `departments_ui` (`dept_number`),
  KEY `departments_fk` (`camp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` VALUES(12, 1, '10159', 'Applied Mathematics', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` bigint(10) unsigned NOT NULL,
  `crse_id` smallint(4) unsigned NOT NULL,
  `term_id` mediumint(6) unsigned NOT NULL,
  `facilitator_start` date NOT NULL,
  `facilitator_stop` date NOT NULL,
  `student_start` date NOT NULL,
  `student_stop` date NOT NULL,
  `creator_e` mediumint(7) unsigned NOT NULL default '0',
  `created_e` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_e` bit(1) NOT NULL default '\0',
  `exam_type` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`exam_id`),
  UNIQUE KEY `exams_ui1` (`crse_id`,`term_id`,`exam_type`),
  UNIQUE KEY `exams_ui2` (`crse_id`,`facilitator_start`),
  UNIQUE KEY `exams_ui3` (`crse_id`,`facilitator_stop`),
  UNIQUE KEY `exams_ui4` (`crse_id`,`student_start`),
  UNIQUE KEY `exams_ui5` (`crse_id`,`student_stop`),
  KEY `exams_fk2` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display';

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` VALUES(2009311234, 1234, 200931, '2009-02-02', '2009-02-17', '2009-02-09', '2009-02-17', 0, '2009-01-26 05:26:01', '\0', '\0');
INSERT INTO `exams` VALUES(2009311235, 1235, 200931, '2009-01-26', '2009-02-10', '2009-02-02', '2009-02-10', 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `exams` VALUES(2009311236, 1236, 200931, '2009-01-26', '2009-02-10', '2009-02-02', '2009-02-10', 0, '2009-01-26 05:33:50', '\0', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE IF NOT EXISTS `periods` (
  `peri_id` tinyint(1) unsigned NOT NULL,
  `period` varchar(20) collate latin1_german2_ci NOT NULL,
  PRIMARY KEY  (`peri_id`),
  UNIQUE KEY `periods_ui` (`period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='list of available semesters for this institution (eg. fall, ';

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` VALUES(1, 'Fall');
INSERT INTO `periods` VALUES(3, 'Spring');
INSERT INTO `periods` VALUES(4, 'Summer');
INSERT INTO `periods` VALUES(2, 'Winter');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` smallint(3) unsigned NOT NULL auto_increment,
  `buil_id` tinyint(2) unsigned NOT NULL,
  `room_name` varchar(40) collate latin1_german2_ci NOT NULL,
  `room_number` varchar(10) collate latin1_german2_ci NOT NULL,
  `disable_r` bit(1) NOT NULL default '\0',
  `default_r` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`room_id`),
  UNIQUE KEY `buildings_ui` (`buil_id`,`room_name`,`room_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display' AUTO_INCREMENT=132 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` VALUES(123, 12, '', '104', '\0', '.');
INSERT INTO `rooms` VALUES(124, 13, '', '240D', '\0', '.');
INSERT INTO `rooms` VALUES(125, 13, '', '440D', '\0', '\0');
INSERT INTO `rooms` VALUES(126, 14, 'MEP-WIEP Conference Room', 'ECCE 116', '\0', '\0');
INSERT INTO `rooms` VALUES(127, 14, '', 'ECCE 287', '\0', '\0');
INSERT INTO `rooms` VALUES(128, 14, '', 'ECEE 1B28', '\0', '.');
INSERT INTO `rooms` VALUES(129, 15, '', 'DLC 207', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `sect_id` tinyint(1) unsigned NOT NULL,
  `section` varchar(20) collate latin1_german2_ci NOT NULL,
  PRIMARY KEY  (`sect_id`),
  UNIQUE KEY `sections_ui` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='list of available terms in a semester for this institution (';

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` VALUES(1, 'Midterm 1');
INSERT INTO `sections` VALUES(2, 'Midterm 2');
INSERT INTO `sections` VALUES(3, 'Midterm 3');
INSERT INTO `sections` VALUES(4, 'Midterm 4');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `sesn_id` bigint(10) unsigned NOT NULL auto_increment,
  `exam_id` bigint(10) unsigned NOT NULL,
  `room_id` smallint(3) unsigned NOT NULL,
  `faculty` mediumint(7) unsigned NOT NULL default '0',
  `capacity` tinyint(3) unsigned NOT NULL default '0',
  `registered` tinyint(3) unsigned NOT NULL default '0',
  `session_start` datetime NOT NULL,
  `session_stop` datetime NOT NULL,
  `creator_s` mediumint(7) unsigned NOT NULL default '0',
  `created_s` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_s` bit(1) NOT NULL default '\0',
  `hidden` bit(1) NOT NULL default '\0',
  `notice` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`sesn_id`),
  UNIQUE KEY `sessions_ui1` (`exam_id`,`room_id`,`session_start`),
  UNIQUE KEY `sessions_ui2` (`exam_id`,`room_id`,`session_stop`),
  KEY `sessions_fk2` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display' AUTO_INCREMENT=1234568043 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` VALUES(1234567890, 2009311234, 123, 0, 5, 0, '2009-02-16 17:00:00', '2009-02-16 18:00:00', 0, '2009-01-26 05:43:17', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567891, 2009311234, 123, 0, 5, 0, '2009-02-16 18:00:00', '2009-02-16 19:00:00', 0, '2009-01-26 05:43:31', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567892, 2009311234, 123, 0, 5, 0, '2009-02-16 19:00:00', '2009-02-16 20:00:00', 0, '2009-01-26 05:43:39', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567893, 2009311234, 124, 0, 5, 0, '2009-02-16 08:00:00', '2009-02-16 09:00:00', 0, '2009-01-26 05:44:39', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567894, 2009311234, 124, 0, 5, 0, '2009-02-16 09:00:00', '2009-02-16 10:00:00', 0, '2009-01-26 05:44:44', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567895, 2009311234, 124, 0, 5, 0, '2009-02-16 10:00:00', '2009-02-16 11:00:00', 0, '2009-01-26 05:44:50', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567896, 2009311234, 124, 0, 5, 0, '2009-02-16 11:00:00', '2009-02-16 12:00:00', 0, '2009-01-26 05:44:57', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567897, 2009311234, 124, 1237824, 5, 1, '2009-02-16 12:00:00', '2009-02-16 13:00:00', 0, '2009-01-26 05:45:24', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567898, 2009311234, 124, 0, 5, 0, '2009-02-16 13:00:00', '2009-02-16 14:00:00', 0, '2009-01-26 05:45:40', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567899, 2009311234, 124, 0, 5, 0, '2009-02-16 14:00:00', '2009-02-16 15:00:00', 0, '2009-01-26 05:45:45', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567900, 2009311234, 124, 0, 5, 0, '2009-02-16 15:00:00', '2009-02-16 16:00:00', 0, '2009-01-26 05:45:55', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567901, 2009311234, 124, 0, 5, 0, '2009-02-16 16:00:00', '2009-02-16 17:00:00', 0, '2009-01-26 05:46:00', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567902, 2009311234, 124, 0, 5, 0, '2009-02-16 17:00:00', '2009-02-16 18:00:00', 0, '2009-01-26 05:46:06', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567903, 2009311234, 124, 0, 5, 0, '2009-02-16 18:00:00', '2009-02-16 19:00:00', 0, '2009-01-26 05:46:13', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567904, 2009311234, 124, 0, 5, 0, '2009-02-16 19:00:00', '2009-02-16 20:00:00', 0, '2009-01-26 05:46:19', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567905, 2009311234, 126, 0, 5, 0, '2009-02-16 08:00:00', '2009-02-16 09:00:00', 0, '2009-01-26 05:47:20', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567906, 2009311234, 126, 1237824, 5, 1, '2009-02-16 09:00:00', '2009-02-16 10:00:00', 0, '2009-01-26 05:47:26', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567907, 2009311234, 126, 0, 5, 0, '2009-02-16 10:00:00', '2009-02-16 11:00:00', 0, '2009-01-26 05:47:30', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567908, 2009311234, 126, 1237774, 5, 2, '2009-02-16 11:00:00', '2009-02-16 12:00:00', 0, '2009-01-26 05:47:36', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567909, 2009311234, 126, 1237774, 5, 0, '2009-02-16 12:00:00', '2009-02-16 13:00:00', 0, '2009-01-26 05:47:42', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567910, 2009311234, 126, 0, 5, 0, '2009-02-16 13:00:00', '2009-02-16 14:00:00', 0, '2009-01-26 05:47:51', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567911, 2009311234, 126, 0, 5, 0, '2009-02-16 14:00:00', '2009-02-16 15:00:00', 0, '2009-01-26 05:47:59', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567912, 2009311234, 126, 0, 5, 0, '2009-02-16 15:00:00', '2009-02-16 16:00:00', 0, '2009-01-26 05:48:06', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567913, 2009311234, 126, 1237784, 5, 5, '2009-02-16 16:00:00', '2009-02-16 17:00:00', 0, '2009-01-26 05:48:15', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567914, 2009311234, 126, 1237784, 5, 5, '2009-02-16 17:00:00', '2009-02-16 18:00:00', 0, '2009-01-26 05:48:21', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567915, 2009311234, 126, 0, 5, 0, '2009-02-16 18:00:00', '2009-02-16 19:00:00', 0, '2009-01-26 05:48:26', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567916, 2009311234, 126, 0, 5, 0, '2009-02-16 19:00:00', '2009-02-16 20:00:00', 0, '2009-01-26 05:48:33', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567917, 2009311234, 123, 0, 5, 0, '2009-02-17 17:00:00', '2009-02-17 18:00:00', 0, '2009-01-26 05:58:30', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567918, 2009311234, 123, 0, 5, 0, '2009-02-17 18:00:00', '2009-02-17 19:00:00', 0, '2009-01-26 05:58:37', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567919, 2009311234, 123, 0, 5, 0, '2009-02-17 19:00:00', '2009-02-17 20:00:00', 0, '2009-01-26 05:58:42', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567920, 2009311234, 125, 0, 5, 0, '2009-02-17 08:00:00', '2009-02-17 09:00:00', 0, '2009-01-26 05:59:21', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567921, 2009311234, 125, 0, 5, 0, '2009-02-17 09:00:00', '2009-02-17 10:00:00', 0, '2009-01-26 05:59:25', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567922, 2009311234, 125, 0, 5, 0, '2009-02-17 10:00:00', '2009-02-17 11:00:00', 0, '2009-01-26 05:59:29', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567923, 2009311234, 125, 0, 5, 0, '2009-02-17 11:00:00', '2009-02-17 12:00:00', 0, '2009-01-26 05:59:33', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567924, 2009311234, 125, 0, 5, 0, '2009-02-17 12:00:00', '2009-02-17 13:00:00', 0, '2009-01-26 05:59:45', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567925, 2009311234, 125, 0, 5, 0, '2009-02-17 13:00:00', '2009-02-17 14:00:00', 0, '2009-01-26 05:59:50', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567926, 2009311234, 125, 0, 5, 0, '2009-02-17 14:00:00', '2009-02-17 15:00:00', 0, '2009-01-26 05:59:57', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567927, 2009311234, 125, 0, 5, 0, '2009-02-17 15:00:00', '2009-02-17 16:00:00', 0, '2009-01-26 06:00:01', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567928, 2009311234, 125, 0, 5, 0, '2009-02-17 16:00:00', '2009-02-17 17:00:00', 0, '2009-01-26 06:00:07', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567929, 2009311234, 125, 0, 5, 0, '2009-02-17 17:00:00', '2009-02-17 18:00:00', 0, '2009-01-26 06:00:12', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567930, 2009311234, 125, 0, 5, 0, '2009-02-17 18:00:00', '2009-02-17 19:00:00', 0, '2009-01-26 06:00:18', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567931, 2009311234, 125, 0, 5, 0, '2009-02-17 19:00:00', '2009-02-17 20:00:00', 0, '2009-01-26 06:00:24', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567932, 2009311234, 126, 1237784, 5, 0, '2009-02-17 08:00:00', '2009-02-17 09:00:00', 0, '2009-01-26 06:01:01', '\0', '.', '\0');
INSERT INTO `sessions` VALUES(1234567933, 2009311234, 126, 1237784, 5, 0, '2009-02-17 09:00:00', '2009-02-17 10:00:00', 0, '2009-01-26 06:01:06', '\0', '.', '\0');
INSERT INTO `sessions` VALUES(1234567934, 2009311234, 126, 0, 5, 0, '2009-02-17 10:00:00', '2009-02-17 11:00:00', 0, '2009-01-26 06:01:11', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567935, 2009311234, 126, 1237774, 5, 5, '2009-02-17 11:00:00', '2009-02-17 12:00:00', 0, '2009-01-26 06:01:14', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567936, 2009311234, 126, 1237774, 5, 5, '2009-02-17 12:00:00', '2009-02-17 13:00:00', 0, '2009-01-26 06:01:19', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567937, 2009311234, 126, 1237784, 5, 5, '2009-02-17 13:00:00', '2009-02-17 14:00:00', 0, '2009-01-26 06:01:26', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567938, 2009311234, 126, 1237784, 5, 5, '2009-02-17 14:00:00', '2009-02-17 15:00:00', 0, '2009-01-26 06:01:31', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567939, 2009311234, 126, 0, 5, 0, '2009-02-17 15:00:00', '2009-02-17 16:00:00', 0, '2009-01-26 06:01:37', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567940, 2009311234, 126, 0, 5, 0, '2009-02-17 16:00:00', '2009-02-17 17:00:00', 0, '2009-01-26 06:01:42', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567941, 2009311234, 126, 0, 5, 0, '2009-02-17 17:00:00', '2009-02-17 18:00:00', 0, '2009-01-26 06:01:49', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567942, 2009311234, 126, 0, 5, 0, '2009-02-17 18:00:00', '2009-02-17 19:00:00', 0, '2009-01-26 06:01:56', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567943, 2009311234, 126, 0, 5, 0, '2009-02-17 19:00:00', '2009-02-17 20:00:00', 0, '2009-01-26 06:02:02', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567944, 2009311235, 129, 1234824, 5, 3, '2009-02-09 08:00:00', '2009-02-09 09:00:00', 0, '2009-01-26 06:09:51', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567945, 2009311236, 129, 0, 5, 0, '2009-02-09 09:00:00', '2009-02-09 10:00:00', 0, '2009-01-26 06:10:04', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567946, 2009311236, 129, 0, 5, 0, '2009-02-09 10:00:00', '2009-02-09 11:00:00', 0, '2009-01-26 06:10:09', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567947, 2009311235, 129, 1234824, 5, 5, '2009-02-09 11:00:00', '2009-02-09 12:00:00', 0, '2009-01-26 06:10:13', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567948, 2009311236, 129, 0, 5, 0, '2009-02-09 12:00:00', '2009-02-09 13:00:00', 0, '2009-01-26 06:10:18', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567949, 2009311236, 129, 0, 5, 0, '2009-02-09 13:00:00', '2009-02-09 14:00:00', 0, '2009-01-26 06:10:23', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567950, 2009311236, 129, 1237084, 5, 5, '2009-02-09 14:00:00', '2009-02-09 15:00:00', 0, '2009-01-26 06:10:27', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567951, 2009311235, 129, 1234794, 5, 5, '2009-02-09 15:00:00', '2009-02-09 16:00:00', 0, '2009-01-26 06:10:32', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567952, 2009311235, 129, 1234794, 5, 5, '2009-02-09 16:00:00', '2009-02-09 17:00:00', 0, '2009-01-26 06:10:38', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567953, 2009311235, 129, 1234794, 5, 5, '2009-02-09 17:00:00', '2009-02-09 18:00:00', 0, '2009-01-26 06:10:43', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567954, 2009311236, 129, 1237044, 5, 5, '2009-02-09 18:00:00', '2009-02-09 19:00:00', 0, '2009-01-26 06:10:48', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567955, 2009311236, 129, 0, 5, 0, '2009-02-09 19:00:00', '2009-02-09 20:00:00', 0, '2009-01-26 06:10:53', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567956, 2009311235, 126, 1234814, 5, 5, '2009-02-09 08:00:00', '2009-02-09 09:00:00', 0, '2009-01-26 06:12:01', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567957, 2009311235, 126, 1234824, 5, 3, '2009-02-09 09:00:00', '2009-02-09 10:00:00', 0, '2009-01-26 06:12:07', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567958, 2009311235, 126, 0, 5, 0, '2009-02-09 10:00:00', '2009-02-09 11:00:00', 0, '2009-01-26 06:12:12', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567959, 2009311235, 126, 1234814, 5, 0, '2009-02-09 11:00:00', '2009-02-09 12:00:00', 0, '2009-01-26 06:12:21', '\0', '.', '\0');
INSERT INTO `sessions` VALUES(1234567960, 2009311235, 126, 0, 5, 0, '2009-02-09 12:00:00', '2009-02-09 13:00:00', 0, '2009-01-26 06:12:26', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567961, 2009311235, 126, 0, 5, 0, '2009-02-09 13:00:00', '2009-02-09 14:00:00', 0, '2009-01-26 06:12:30', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567962, 2009311235, 126, 0, 5, 0, '2009-02-09 14:00:00', '2009-02-09 15:00:00', 0, '2009-01-26 06:12:35', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567963, 2009311235, 126, 1234824, 5, 5, '2009-02-09 15:00:00', '2009-02-09 16:00:00', 0, '2009-01-26 06:12:41', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567964, 2009311235, 126, 0, 5, 0, '2009-02-09 16:00:00', '2009-02-09 17:00:00', 0, '2009-01-26 06:12:46', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567965, 2009311235, 126, 0, 5, 0, '2009-02-09 17:00:00', '2009-02-09 18:00:00', 0, '2009-01-26 06:12:53', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567966, 2009311235, 126, 0, 5, 0, '2009-02-09 18:00:00', '2009-02-09 19:00:00', 0, '2009-01-26 06:13:00', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567967, 2009311235, 127, 0, 5, 0, '2009-02-09 14:00:00', '2009-02-09 15:00:00', 0, '2009-01-26 06:13:22', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567968, 2009311235, 127, 0, 5, 0, '2009-02-09 15:00:00', '2009-02-09 16:00:00', 0, '2009-01-26 06:13:28', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567969, 2009311235, 127, 0, 5, 0, '2009-02-09 16:00:00', '2009-02-09 17:00:00', 0, '2009-01-26 06:13:36', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567970, 2009311236, 129, 0, 5, 0, '2009-02-10 08:00:00', '2009-02-10 09:00:00', 0, '2009-01-26 06:13:58', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567971, 2009311235, 129, 1234804, 5, 5, '2009-02-10 09:00:00', '2009-02-10 10:00:00', 0, '2009-01-26 06:14:02', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567973, 2009311236, 129, 1237044, 5, 5, '2009-02-10 11:00:00', '2009-02-10 12:00:00', 0, '2009-01-26 06:14:12', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567975, 2009311236, 129, 1237044, 5, 5, '2009-02-10 10:00:00', '2009-02-10 11:00:00', 0, '2009-01-26 06:19:45', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567976, 2009311236, 129, 1237084, 5, 5, '2009-02-10 12:00:00', '2009-02-10 13:00:00', 0, '2009-01-26 06:19:53', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567977, 2009311236, 129, 1237084, 5, 5, '2009-02-10 13:00:00', '2009-02-10 14:00:00', 0, '2009-01-26 06:20:01', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567978, 2009311236, 129, 0, 5, 0, '2009-02-10 14:00:00', '2009-02-10 15:00:00', 0, '2009-01-26 06:20:06', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567979, 2009311236, 129, 1234854, 5, 3, '2009-02-10 15:00:00', '2009-02-10 16:00:00', 0, '2009-01-26 06:20:11', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567980, 2009311236, 129, 0, 5, 0, '2009-02-10 16:00:00', '2009-02-10 17:00:00', 0, '2009-01-26 06:20:18', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567981, 2009311236, 129, 0, 5, 0, '2009-02-10 17:00:00', '2009-02-10 18:00:00', 0, '2009-01-26 06:20:24', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567982, 2009311236, 129, 0, 5, 0, '2009-02-10 18:00:00', '2009-02-10 19:00:00', 0, '2009-01-26 06:20:30', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567983, 2009311236, 129, 1234854, 5, 4, '2009-02-10 19:00:00', '2009-02-10 20:00:00', 0, '2009-01-26 06:20:36', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567984, 2009311235, 126, 1234814, 5, 5, '2009-02-10 08:00:00', '2009-02-10 09:00:00', 0, '2009-01-26 06:22:44', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567985, 2009311235, 126, 0, 5, 0, '2009-02-10 09:00:00', '2009-02-10 10:00:00', 0, '2009-01-26 06:22:49', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567986, 2009311235, 126, 0, 5, 0, '2009-02-10 10:00:00', '2009-02-10 11:00:00', 0, '2009-01-26 06:22:53', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567987, 2009311235, 126, 0, 5, 0, '2009-02-10 11:00:00', '2009-02-10 12:00:00', 0, '2009-01-26 06:22:58', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567988, 2009311235, 126, 0, 5, 0, '2009-02-10 12:00:00', '2009-02-10 13:00:00', 0, '2009-01-26 06:23:03', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567989, 2009311235, 126, 1234804, 5, 5, '2009-02-10 13:00:00', '2009-02-10 14:00:00', 0, '2009-01-26 06:23:07', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567990, 2009311235, 126, 0, 5, 0, '2009-02-10 14:00:00', '2009-02-10 15:00:00', 0, '2009-01-26 06:23:13', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567991, 2009311235, 126, 0, 5, 0, '2009-02-10 15:00:00', '2009-02-10 16:00:00', 0, '2009-01-26 06:23:19', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567992, 2009311235, 126, 0, 5, 0, '2009-02-10 16:00:00', '2009-02-10 17:00:00', 0, '2009-01-26 06:23:25', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567993, 2009311235, 126, 0, 5, 0, '2009-02-10 17:00:00', '2009-02-10 18:00:00', 0, '2009-01-26 06:23:32', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567994, 2009311235, 126, 0, 5, 0, '2009-02-10 18:00:00', '2009-02-10 19:00:00', 0, '2009-01-26 06:23:38', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567995, 2009311235, 126, 1234824, 5, 5, '2009-02-10 19:00:00', '2009-02-10 20:00:00', 0, '2009-01-26 06:23:44', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567996, 2009311236, 123, 0, 5, 0, '2009-02-09 17:00:00', '2009-02-09 18:00:00', 0, '2009-01-26 06:25:19', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567997, 2009311236, 123, 0, 5, 0, '2009-02-09 18:00:00', '2009-02-09 19:00:00', 0, '2009-01-26 06:25:24', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234567998, 2009311236, 123, 1234874, 5, 5, '2009-02-09 19:00:00', '2009-02-09 20:00:00', 0, '2009-01-26 06:25:31', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234567999, 2009311236, 124, 0, 5, 0, '2009-02-09 08:00:00', '2009-02-09 09:00:00', 0, '2009-01-26 06:26:18', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568000, 2009311236, 124, 1234844, 5, 5, '2009-02-09 09:00:00', '2009-02-09 10:00:00', 0, '2009-01-26 06:26:23', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568001, 2009311236, 124, 1234844, 5, 5, '2009-02-09 10:00:00', '2009-02-09 11:00:00', 0, '2009-01-26 06:26:27', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568002, 2009311236, 124, 1234844, 5, 0, '2009-02-09 11:00:00', '2009-02-09 12:00:00', 0, '2009-01-26 06:26:31', '\0', '.', '\0');
INSERT INTO `sessions` VALUES(1234568003, 2009311236, 124, 1234854, 5, 5, '2009-02-09 12:00:00', '2009-02-09 13:00:00', 0, '2009-01-26 06:26:35', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568004, 2009311236, 124, 1234904, 5, 6, '2009-02-09 13:00:00', '2009-02-09 14:00:00', 0, '2009-01-26 06:26:41', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568005, 2009311236, 124, 1234904, 5, 5, '2009-02-09 14:00:00', '2009-02-09 15:00:00', 0, '2009-01-26 06:26:46', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568006, 2009311236, 124, 1234904, 5, 5, '2009-02-09 15:00:00', '2009-02-09 16:00:00', 0, '2009-01-26 06:26:51', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568007, 2009311236, 124, 1234864, 5, 5, '2009-02-09 16:00:00', '2009-02-09 17:00:00', 0, '2009-01-26 06:26:56', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568008, 2009311236, 124, 1234864, 5, 5, '2009-02-09 17:00:00', '2009-02-09 18:00:00', 0, '2009-01-26 06:27:03', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568009, 2009311236, 124, 0, 5, 0, '2009-02-09 18:00:00', '2009-02-09 19:00:00', 0, '2009-01-26 06:27:13', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568010, 2009311236, 124, 0, 5, 0, '2009-02-09 19:00:00', '2009-02-09 20:00:00', 0, '2009-01-26 06:27:20', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568011, 2009311236, 125, 1234874, 5, 5, '2009-02-09 08:00:00', '2009-02-09 09:00:00', 0, '2009-01-26 06:27:35', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568012, 2009311236, 125, 1237034, 5, 3, '2009-02-09 09:00:00', '2009-02-09 10:00:00', 0, '2009-01-26 06:27:42', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568013, 2009311236, 125, 1237034, 5, 5, '2009-02-09 10:00:00', '2009-02-09 11:00:00', 0, '2009-01-26 06:27:50', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568014, 2009311236, 125, 0, 5, 0, '2009-02-09 11:00:00', '2009-02-09 12:00:00', 0, '2009-01-26 06:27:55', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568015, 2009311236, 125, 1234884, 5, 5, '2009-02-09 12:00:00', '2009-02-09 13:00:00', 0, '2009-01-26 06:28:00', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568016, 2009311236, 125, 1234884, 5, 5, '2009-02-09 13:00:00', '2009-02-09 14:00:00', 0, '2009-01-26 06:28:06', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568017, 2009311236, 125, 1234884, 5, 5, '2009-02-09 14:00:00', '2009-02-09 15:00:00', 0, '2009-01-26 06:28:13', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568018, 2009311236, 125, 1234844, 5, 5, '2009-02-09 15:00:00', '2009-02-09 16:00:00', 0, '2009-01-26 06:28:18', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568019, 2009311236, 125, 1234894, 5, 5, '2009-02-09 16:00:00', '2009-02-09 17:00:00', 0, '2009-01-26 06:28:23', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568020, 2009311236, 125, 1237094, 5, 5, '2009-02-09 17:00:00', '2009-02-09 18:00:00', 0, '2009-01-26 06:28:29', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568021, 2009311236, 125, 1237094, 5, 5, '2009-02-09 18:00:00', '2009-02-09 19:00:00', 0, '2009-01-26 06:28:34', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568022, 2009311236, 125, 0, 5, 0, '2009-02-09 19:00:00', '2009-02-09 20:00:00', 0, '2009-01-26 06:28:40', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568023, 2009311236, 128, 1237034, 5, 0, '2009-02-09 08:00:00', '2009-02-09 09:00:00', 0, '2009-01-26 06:29:03', '\0', '.', '\0');
INSERT INTO `sessions` VALUES(1234568024, 2009311236, 123, 0, 5, 0, '2009-02-10 17:00:00', '2009-02-10 18:00:00', 0, '2009-01-26 06:29:48', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568025, 2009311236, 123, 0, 5, 0, '2009-02-10 18:00:00', '2009-02-10 19:00:00', 0, '2009-01-26 06:29:53', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568026, 2009311236, 123, 1234874, 5, 5, '2009-02-10 19:00:00', '2009-02-10 20:00:00', 0, '2009-01-26 06:29:59', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568027, 2009311236, 125, 1234914, 5, 5, '2009-02-10 08:00:00', '2009-02-10 09:00:00', 0, '2009-01-26 06:30:41', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568028, 2009311236, 125, 1234914, 5, 5, '2009-02-10 09:00:00', '2009-02-10 10:00:00', 0, '2009-01-26 06:30:45', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568029, 2009311236, 125, 1234914, 5, 5, '2009-02-10 10:00:00', '2009-02-10 11:00:00', 0, '2009-01-26 06:30:50', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568030, 2009311236, 125, 1234834, 5, 5, '2009-02-10 11:00:00', '2009-02-10 12:00:00', 0, '2009-01-26 06:30:53', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568031, 2009311236, 125, 1234834, 5, 5, '2009-02-10 12:00:00', '2009-02-10 13:00:00', 0, '2009-01-26 06:30:58', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568032, 2009311236, 125, 1234834, 5, 5, '2009-02-10 13:00:00', '2009-02-10 14:00:00', 0, '2009-01-26 06:31:04', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568033, 2009311236, 125, 0, 5, 0, '2009-02-10 14:00:00', '2009-02-10 15:00:00', 0, '2009-01-26 06:31:10', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568034, 2009311236, 125, 1234864, 5, 5, '2009-02-10 15:00:00', '2009-02-10 16:00:00', 0, '2009-01-26 06:31:17', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568035, 2009311236, 125, 0, 5, 0, '2009-02-10 16:00:00', '2009-02-10 17:00:00', 0, '2009-01-26 06:31:22', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568036, 2009311236, 125, 0, 5, 0, '2009-02-10 17:00:00', '2009-02-10 18:00:00', 0, '2009-01-26 06:31:27', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568037, 2009311236, 125, 0, 5, 0, '2009-02-10 18:00:00', '2009-02-10 19:00:00', 0, '2009-01-26 06:31:31', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568038, 2009311236, 125, 0, 5, 0, '2009-02-10 19:00:00', '2009-02-10 20:00:00', 0, '2009-01-26 06:31:37', '\0', '\0', '\0');
INSERT INTO `sessions` VALUES(1234568039, 2009311236, 128, 1234854, 5, 5, '2009-02-10 12:00:00', '2009-02-10 13:00:00', 0, '2009-01-26 06:32:16', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568040, 2009311236, 128, 1234854, 5, 5, '2009-02-10 13:00:00', '2009-02-10 14:00:00', 0, '2009-01-26 06:32:21', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568041, 2009311236, 128, 1234894, 5, 5, '2009-02-10 15:00:00', '2009-02-10 16:00:00', 0, '2009-01-26 06:32:27', '\0', '\0', '.');
INSERT INTO `sessions` VALUES(1234568042, 2009311236, 128, 1234894, 5, 5, '2009-02-10 16:00:00', '2009-02-10 17:00:00', 0, '2009-01-26 06:32:31', '\0', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
  `conf_id` smallint(4) unsigned NOT NULL auto_increment,
  `tool_id` smallint(3) unsigned default NULL,
  `param` varchar(40) collate latin1_german2_ci NOT NULL default '',
  `value` varchar(40) collate latin1_german2_ci NOT NULL default '',
  PRIMARY KEY  (`conf_id`),
  UNIQUE KEY `sys_config_ui` (`tool_id`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='stores system produced errors' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sys_config`
--


-- --------------------------------------------------------

--
-- Table structure for table `sys_emails`
--

CREATE TABLE IF NOT EXISTS `sys_emails` (
  `mail_id` tinyint(3) unsigned NOT NULL auto_increment,
  `mail_from` varchar(60) collate latin1_german2_ci NOT NULL default '',
  `mail_to` varchar(60) collate latin1_german2_ci default NULL,
  `mail_title` varchar(100) collate latin1_german2_ci NOT NULL default '',
  `mail_body` text collate latin1_german2_ci NOT NULL,
  PRIMARY KEY  (`mail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system emails sent to students and admins' AUTO_INCREMENT=129 ;

--
-- Dumping data for table `sys_emails`
--

INSERT INTO `sys_emails` VALUES(123, 'madmin@<email_domain>', '<email_address>', 'ESRS: Student Registration', '\n<first_name> <last_name>,\n\nYou have successfully registered as a ''Student'' to use the Exam Scheduling and Registration System.\n\nPlease click the link below to verify you have received your login information:\nhttp://<host_url>/?<email_query>\n\nYour login is:\n\nUsername: <username>\nPassword: <password>\n\nFollow this link to log into the ESRS, and select the exam sessions you would like to attend:\nhttp://<host_url>/index.php\n\nIf you have any questions, or are having trouble accessing the system, please contact the Master Administrator at marcia.flynt@<email_domain>, and thank you for your participation.\n');
INSERT INTO `sys_emails` VALUES(124, 'madmin@<email_domain>', '<email_address>', 'ESRS: <role> Registration', '\n<first_name> <last_name>,\n\nYou have been successfully registered as a ''<role>'' to use the Exam Scheduling and Registration System.\n\nPlease click the link below to verify you have received your login information:\nhttp://<host_url>/?<email_query>\n\nYour login is:\n\nUsername: <username>\nPassword: <password>\n\nFollow this link to log into the ESRS:\nhttp://<host_url>/index.php\n\nIf you have any questions, or are having trouble accessing the system, please contact the Master Administrator at marcia.flynt@<email_domain>, and thank you for your participation.\n');
INSERT INTO `sys_emails` VALUES(125, 'madmin@<email_domain>', '<email_address>', 'ESRS: Verify Your Registration', '\n<first_name> <last_name>,\n\nDid you receive your confirmation email when you registered to use the ESRS? Did you receive your ''Username'' and ''Password''??\n\nOur records indicate that your registration has NOT been verified. In your confirmation email should have been enclosed an address validation link. Below is a duplicate validation link, please click it to prevent receiving additional notices:\nhttp://<host_url>/?<email_query>\n\nAlso, here is a password reminder, in case you did not receive the original confirmation email when registering for the system:\n\nUsername: <username>\nPassword: <password>\n\nFollow this link to log into the ESRS:\nhttp://<host_url>/index.php\n\nIf you have any questions, or are having trouble accessing the system, please contact the Master Administrator at marcia.flynt@<email_domain>, and thank you for your participation.\n');
INSERT INTO `sys_emails` VALUES(126, 'madmin@<email_domain>', '<email_address>', 'ESRS: Session Reminder - <crse_number> / <session_start>', '\n<student_first_name> <student_last_name>,\n\nYOU HAVE A SESSION STARTING SOON!! This is your one and only reminder:\n\nOn: <session_start><session_stop>\n\nLocated at: <location>\n\n<crse_number>: <section>, <period> <term_year>\n\nFacilitator: <faculty_first_name> <faculty_last_name>\n\nIf you have any questions, or need to cancel your attendance for any reason, please contact the session facilitator at <faculty_email>, and thank you for your participation.\n');
INSERT INTO `sys_emails` VALUES(127, 'madmin@<email_domain>', '<email_address>', 'ESRS: Session Reminder - <crse_number> / <session_start>', '\n<faculty_first_name> <faculty_last_name>,\n\nYOU HAVE A SESSION STARTING SOON!! This is your one and only reminder:\n\nOn: <session_start><session_stop>\n\nLocated at: <location>\n\n<crse_number>: <section>, <period> <term_year>\n\nRegistrants: <registered>\n\nIf you have any questions, or need to cancel your attendance for any reason, please contact the Master Administrator at madmin@<email_domain>, and thank you for your participation.\n');
INSERT INTO `sys_emails` VALUES(128, 'madmin@<email_domain>', '<email_address>', 'ESRS: Exam Assignment - <crse_number> / <section>, <period> <term_year>', '\n<first_name> <last_name>,\n\nYou have been assigned to facilitate one or more sessions in the following exam cycle:\n\n<crse_number>: <period>, <section> <term_year> - <course>\n\nFacilitator Signup Period: <facilitator_start><facilitator_stop>\n\nStudent Signup Period: <student_start><student_stop>\n\nThe next time you log into the ESRS system, please refer to this exam cycle in your ''Sessions'' management utility, and select the sessions you will be able to facilitate.\n\nFollow this link to log into the ESRS:\nhttp://<host_url>/index.php\n\nIf you have any questions, or are having trouble accessing the system, please contact the Master Administrator at madmin@<email_domain>, and thank you for your participation.\n');

-- --------------------------------------------------------

--
-- Table structure for table `sys_messages`
--

CREATE TABLE IF NOT EXISTS `sys_messages` (
  `mess_id` smallint(4) unsigned NOT NULL auto_increment,
  `tool_id` smallint(3) unsigned NOT NULL,
  `context` varchar(10) collate latin1_german2_ci NOT NULL,
  `message` varchar(250) collate latin1_german2_ci NOT NULL,
  PRIMARY KEY  (`mess_id`),
  UNIQUE KEY `sys_messages_ui` (`tool_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system error and success messages' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sys_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `sys_roles`
--

CREATE TABLE IF NOT EXISTS `sys_roles` (
  `role_id` tinyint(1) unsigned NOT NULL,
  `role` varchar(40) collate latin1_german2_ci NOT NULL,
  PRIMARY KEY  (`role_id`),
  UNIQUE KEY `sys_roles_ui` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines a user role type';

--
-- Dumping data for table `sys_roles`
--

INSERT INTO `sys_roles` VALUES(3, 'Course Administrator');
INSERT INTO `sys_roles` VALUES(2, 'Department Administrator');
INSERT INTO `sys_roles` VALUES(4, 'Exam Facilitator');
INSERT INTO `sys_roles` VALUES(1, 'Master Administrator');
INSERT INTO `sys_roles` VALUES(5, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `sys_tools`
--

CREATE TABLE IF NOT EXISTS `sys_tools` (
  `tool_id` smallint(3) unsigned NOT NULL auto_increment,
  `suffix` varchar(20) collate latin1_german2_ci NOT NULL,
  `tool` varchar(60) collate latin1_german2_ci NOT NULL,
  `description` text collate latin1_german2_ci NOT NULL,
  `disable_t` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`tool_id`),
  UNIQUE KEY `sys_tools_ui` (`tool`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='a list of process links on the system' AUTO_INCREMENT=232 ;

--
-- Dumping data for table `sys_tools`
--

INSERT INTO `sys_tools` VALUES(123, 'user', 'Manage Users', '', '\0');
INSERT INTO `sys_tools` VALUES(124, 'department', 'Manage Departments', '', '\0');
INSERT INTO `sys_tools` VALUES(125, 'course', 'Manage Courses', '', '\0');
INSERT INTO `sys_tools` VALUES(126, 'exam', 'Manage Exams', '', '\0');
INSERT INTO `sys_tools` VALUES(127, 'session', 'Manage Sessions', '', '\0');
INSERT INTO `sys_tools` VALUES(128, 'term', 'Manage Terms', '', '\0');
INSERT INTO `sys_tools` VALUES(129, 'room', 'Manage Rooms', '', '\0');
INSERT INTO `sys_tools` VALUES(130, 'building', 'Manage Buildings', '', '\0');
INSERT INTO `sys_tools` VALUES(131, 'campus', 'Manage Campuses', '', '\0');
INSERT INTO `sys_tools` VALUES(223, 'user', 'Add a User', '', '\0');
INSERT INTO `sys_tools` VALUES(224, 'department', 'Add a Department', '', '\0');
INSERT INTO `sys_tools` VALUES(225, 'course', 'Add a Course', '', '\0');
INSERT INTO `sys_tools` VALUES(226, 'exam', 'Add an Exam', '', '\0');
INSERT INTO `sys_tools` VALUES(227, 'session', 'Add a Session', '', '\0');
INSERT INTO `sys_tools` VALUES(228, 'term', 'Add a Term', '', '\0');
INSERT INTO `sys_tools` VALUES(229, 'room', 'Add a Room', '', '\0');
INSERT INTO `sys_tools` VALUES(230, 'building', 'Add a Building', '', '\0');
INSERT INTO `sys_tools` VALUES(231, 'campus', 'Add a Campus', '', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` mediumint(6) unsigned NOT NULL,
  `peri_id` tinyint(1) unsigned NOT NULL,
  `sect_id` tinyint(1) unsigned NOT NULL,
  `term_year` year(4) NOT NULL,
  `disable_t` bit(1) NOT NULL default '\0',
  `default_t` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`term_id`),
  KEY `terms_fk1` (`peri_id`),
  KEY `terms_fk2` (`sect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='creates a relationship among semesters (periods table), term';

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` VALUES(200911, 1, 1, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200912, 1, 2, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200913, 1, 3, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200914, 1, 4, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200921, 2, 1, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200922, 2, 2, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200923, 2, 3, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200924, 2, 4, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200931, 3, 1, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200932, 3, 2, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200933, 3, 3, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200934, 3, 4, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200941, 4, 1, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200942, 4, 2, 2009, '\0', '\0');
INSERT INTO `terms` VALUES(200943, 4, 3, 2009, '\0', '.');
INSERT INTO `terms` VALUES(200944, 4, 4, 2009, '\0', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` mediumint(6) unsigned NOT NULL auto_increment,
  `campus_id` varchar(10) collate latin1_german2_ci NOT NULL,
  `first_name` varchar(20) collate latin1_german2_ci NOT NULL,
  `last_name` varchar(20) collate latin1_german2_ci NOT NULL,
  `email_address` varchar(60) collate latin1_german2_ci NOT NULL,
  `username` varchar(40) collate latin1_german2_ci NOT NULL,
  `password` varchar(40) collate latin1_german2_ci NOT NULL,
  `encoding` varchar(100) collate latin1_german2_ci NOT NULL,
  `creator_u` mediumint(7) unsigned NOT NULL default '0',
  `created_u` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `lastlog_u` timestamp NOT NULL default '0000-00-00 00:00:00',
  `disable_u` bit(1) NOT NULL default '\0',
  `verified` bit(1) NOT NULL default '\0',
  `mxbounce` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `users_ui1` (`campus_id`),
  UNIQUE KEY `users_ui2` (`email_address`),
  UNIQUE KEY `users_ui3` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='administrators, facilitators, and student users table' AUTO_INCREMENT=123817 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(123456, '1234567890', 'Marat', 'Glazer', 'marat.glazer@colorado.edu', 'marat.glazer', 'uoNn1.YiuHbhA', 'JTJBJTJDMyUyOFMtJTIzNFYtUyU0MFklMkMlNjAlNjAlNjAlMEElNjAlMEE=', 0, '2009-01-26 03:35:53', '2009-02-23 00:44:05', '\0', '.', '\0');
INSERT INTO `users` VALUES(123457, '169964', 'Marcia', 'Flynt', 'marcia.flynt@colorado.edu', 'marcia.flynt', 'uoBLkFbaqVzgs', 'JTI2JTJDMzhZLjM4VCUwQSU2MCUwQQ==', 0, '2009-01-26 03:35:59', '2009-02-23 15:35:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123479, '181940', 'Anca', 'Radulescu', 'anca.radulescu@colorado.edu', 'anca.radulescu', 'uoIp0Jb0H4xS6', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMyU0MFEuMzBQ', 0, '2009-01-26 10:50:16', '2009-02-08 19:48:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123480, '185695', 'Alex', 'Fout', 'alex.fout@colorado.edu', 'alex.fout', 'uoqFnDZlY65rc', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMyU0MFUtQ0RV', 0, '2009-01-26 10:50:47', '2009-02-09 07:51:21', '\0', '.', '\0');
INSERT INTO `users` VALUES(123481, '159232', 'Erin', 'Byrne', 'erin.byrne@colorado.edu', 'erin.byrne', 'uoDuI7JQENDHQ', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMzRZJTJDQyUy', 0, '2009-01-26 10:51:21', '2009-02-13 11:10:13', '\0', '.', '\0');
INSERT INTO `users` VALUES(123482, '174781', 'Theodore', 'Miyasaki', 'theodore.miyasaki@colorado.edu', 'theodore.miyasaki', 'uo5PtE0KMlvnM', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMyUzQ1QtUyU0', 0, '2009-01-26 10:51:50', '2009-02-09 13:24:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123483, '159219', 'Michael', 'Levy', 'levym@colorado.edu', 'levym', 'uoUsN1cswg9E2', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMzRZJTJDQyUy', 0, '2009-01-26 11:00:29', '2009-02-10 10:49:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123484, '203394', 'Sujeet', 'Bhat', 'sujeet.bhat@colorado.edu', 'sujeet.bhat', 'uoB2ToQsqWtb6', 'JTI2JTJDQyU2MFMlMkNTRFQlMEElNjAlMEE=', 0, '2009-01-26 11:00:49', '2009-01-26 11:00:49', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123485, '106371', 'Mary', 'Nelson', 'mary.nelson@colorado.edu', 'mary.nelson', 'uoQdCypAFff2E', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDMyU2MFYlMkNT', 0, '2009-01-26 11:01:08', '2009-02-09 14:25:10', '\0', '.', '\0');
INSERT INTO `users` VALUES(123486, '193700', 'Theodore', 'Galanthay', 'theodore.galanthay@colorado.edu', 'theodore.galanthay', 'uojQAhHuPwFkk', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDM0RTLVMlNjBX', 0, '2009-01-26 11:01:34', '2009-02-06 08:48:55', '\0', '.', '\0');
INSERT INTO `users` VALUES(123487, '193707', 'Anthony', 'Rasca', 'anthony.rasca@colorado.edu', 'anthony.rasca', 'uojQAhHuPwFkk', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDM0RTLVMlNjBX', 0, '2009-01-26 11:03:07', '2009-02-10 19:29:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123488, '193703', 'Beth', 'Hegland', 'beth.hegland@colorado.edu', 'beth.hegland', 'uoUCyVS5ttgR6', 'JTI2JTJDM0RTLVMlNjBTJTBBJTYwJTBB', 0, '2009-01-26 11:03:40', '2009-01-26 11:03:40', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123489, '203714', 'Hawk', 'Berry', 'hawk.berry@colorado.edu', 'hawk.berry', 'uoJ0cDHD7Wk/6', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDQyU2MFMtUyUy', 0, '2009-01-26 11:04:16', '2009-02-09 15:55:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123490, '203701', 'Sebastian', 'Skardal', 'sebastian.skardal@colorado.edu', 'sebastian.skardal', 'uoynD1GM1bwRQ', 'JTI2JTJDQyU2MFMtUyU2MFElMEElNjAlMEE=', 0, '2009-01-26 11:04:40', '2009-01-26 11:04:40', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123491, '193697', 'Yuanting', 'Chen', 'yuanting.chen@colorado.edu', 'yuanting.chen', 'uoSut2LYSWhpE', 'QSUyQyUyMyUyQ1I5UzBQLSUyNzRWJTNDVllPLUZFRCUyQyUyMyUyMUklM0QlMjY5SiUzQ0clMjVUOEMlM0NGJTJDM0RTLUNEVyUw', 0, '2009-01-26 11:05:02', '2009-02-09 13:15:49', '\0', '.', '\0');
INSERT INTO `users` VALUES(123496, '810889288', 'Nikolas', 'Diamantopoulos', 'nikolas.diamantopoulos@colorado.edu', 'nikolas.diamantopoulos', 'uody8HntIym9.', 'JTI5LiUyMyUyNFAuJTIzJTQwWSUyQ0MlNDBYJTBBJTYwJTBB', 0, '2009-02-02 11:26:15', '2009-02-02 11:26:43', '\0', '.', '\0');
INSERT INTO `users` VALUES(123497, '810851150', 'Kevin', 'Staley', 'kevin.staley@colorado.edu', 'kevin.staley', 'uoUlvMzZuM3KU', 'JTI5LiUyMyUyNFAuJTIzNFElMkMzNFAlMEElNjAlMEE=', 0, '2009-02-02 11:28:35', '2009-02-08 14:54:16', '\0', '.', '\0');
INSERT INTO `users` VALUES(123498, '810863348', 'Jacob', 'Alexander', 'jacob.alexander@colorado.edu', 'jacob.alexander', 'uoVD/5RQeF1AE', 'JTI5LiUyMyUyNFAuJTIzOFMlMkNTMFglMEElNjAlMEE=', 0, '2009-02-02 11:30:10', '2009-02-02 19:37:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123499, 'KUOJ', 'Jason', 'Kuo', 'jason.kuo@colorado.edu', 'jason.kuo', 'uoWp2oxLcpEOM', 'JTI0JTNBVzVPJTNBJTQwJTYwJTYwJTBBJTYwJTBB', 0, '2009-02-02 11:34:59', '2009-02-03 13:04:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123500, '810816947', 'Luke', 'Evans', 'luke.evans@colorado.edu', 'luke.evans', 'uoGpCv2ITz/s6', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi4zMFclMEElNjAlMEE=', 0, '2009-02-02 11:48:45', '2009-02-08 11:40:21', '\0', '.', '\0');
INSERT INTO `users` VALUES(123501, '810836735', 'Chase', 'Cazedessus', 'chase.cazedessus@colorado.edu', 'chase.cazedessus', 'uon24u8YcbdhA', 'JTI5LiUyMyUyNFAuJTIzJTJDVi1TJTJDVSUwQSU2MCUwQQ==', 0, '2009-02-02 12:09:24', '2009-02-02 12:12:55', '\0', '.', '\0');
INSERT INTO `users` VALUES(123502, '810332024', 'Mary jean', 'Ohair', 'mary.vonschrader@colorado.edu', 'mary.vonschrader', 'uovlkQSEC2f4M', 'JTI5LiUyMyUyNFAlMkNTJTJDUiUyQyUyMyUyOFQlMEElNjAlMEE=', 0, '2009-02-02 12:21:59', '2009-02-08 21:12:36', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123503, '810856961', 'Kyle', 'Scharf', 'kyle.scharf@colorado.edu', 'kyle.scharf', 'uok13oaCWv7MQ', 'JTI5LiUyMyUyNFAuJTIzNFYuMzhRJTBBJTYwJTBB', 0, '2009-02-02 12:23:53', '2009-02-02 12:24:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123504, '810816398', 'Katlin', 'Dickinson', 'katlin.dickinson@colorado.edu', 'katlin.dickinson', 'uoPVBuxJ18t3c', 'JTI5LiUyMyUyNFAuJTIzJTI0ViUyQ1NEWCUwQSU2MCUwQQ==', 0, '2009-02-02 12:28:31', '2009-02-02 12:28:52', '\0', '.', '\0');
INSERT INTO `users` VALUES(123505, '995054340', 'Paula', 'Brewerpe', 'paula.brewer@colorado.edu', 'paula.brewer', 'uoPy.g1fVu56g', 'JTI5LjNEVSUyQyUyMzRUJTJDUzBQJTBBJTYwJTBB', 0, '2009-02-02 12:31:01', '2009-02-09 15:58:21', '\0', '.', '\0');
INSERT INTO `users` VALUES(123506, '810823060', 'Erika', 'Petrak', 'erika.petrak@colorado.edu', 'erika.petrak', 'uoTNYOlSSNBUk', 'JTI5LiUyMyUyNFAuJTIzJTI4UyUyQyUyMzhQJTBBJTYwJTBB', 0, '2009-02-02 12:32:51', '2009-02-09 12:21:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123507, '810825844', 'Cameron ', 'Trussell', 'cameron.trussell@colorado.edu', 'cameron.trussell', 'uolzFzzrjdwew', 'JTI5LiUyMyUyNFAuJTIzJTI4VS4lMjMwVCUwQSU2MCUwQQ==', 0, '2009-02-02 12:34:44', '2009-02-02 12:35:10', '\0', '.', '\0');
INSERT INTO `users` VALUES(123508, '995219558', 'Genevieve', 'Schutzius', 'genevieve.schutzius@colorado.edu', 'genevieve.schutzius', 'uo4Uuq/uzfAvM', 'JTI5LjNEVSUyQ0MlMjRZLTM0WCUwQSU2MCUwQQ==', 0, '2009-02-02 12:39:49', '2009-02-10 15:23:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123509, '810567897', 'Thomas', 'Hazy', 'thazy@colorado.edu', 'thazy', 'uownTjjWuXRkw', 'JTI5LiUyMyUyNFAtMzhXLiUyM0RXJTBBJTYwJTBB', 0, '2009-02-02 12:42:07', '2009-02-08 10:22:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123510, '810885856', 'Kiaya', 'Caraway', 'kiaya.caraway@colorado.edu', 'kiaya.caraway', 'uoeVvhyCw7arY', 'JTI5LiUyMyUyNFAuJTIzJTQwVS4lMjM0ViUwQSU2MCUwQQ==', 0, '2009-02-02 12:44:10', '2009-02-08 12:39:02', '\0', '.', '\0');
INSERT INTO `users` VALUES(123511, '810879025', 'Jon', 'Matula', 'jonathan.matula@colorado.edu', 'jonathan.matula', 'uoAyNgmw4WypE', 'JTI5LiUyMyUyNFAuJTIzJTNDWSUyQyUyMyUyOFUlMEElNjAlMEE=', 0, '2009-02-02 12:47:08', '2009-02-02 12:47:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123512, '810881870', 'Brett', 'Peters', 'brett.a.peters@colorado.edu', 'brett.a.peters', 'uoexVQODJu1qo', 'JTI5LiUyMyUyNFAuJTIzJTQwUS4lMjMlM0NQJTBBJTYwJTBB', 0, '2009-02-02 12:47:58', '2009-02-08 15:49:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123513, '810893520', 'Braydon', 'Hancock', 'braydon.hancock@colorado.edu', 'braydon.hancock', 'uoZqI/G5T97zE', 'JTI5LiUyMyUyNFAuJTIzRFMtMyUyOFAlMEElNjAlMEE=', 0, '2009-02-02 12:49:42', '2009-02-02 12:50:13', '\0', '.', '\0');
INSERT INTO `users` VALUES(123514, '810815775', 'David', 'Compton', 'david.m.compton@colorado.edu', 'david.m.compton', 'uonCxXvG04Jiw', 'JTI5LiUyMyUyNFAuJTIzJTI0VS1TJTNDVSUwQSU2MCUwQQ==', 0, '2009-02-02 12:50:25', '2009-02-08 14:10:28', '\0', '.', '\0');
INSERT INTO `users` VALUES(123515, '810805399', 'Kelsey', 'Ross', 'kelsey.ross@colorado.edu', 'kelsey.ross', 'uoetKCDDWyeS.', 'JTI5LiUyMyUyNFAuJTIzJTYwVSUyQ1NEWSUwQSU2MCUwQQ==', 0, '2009-02-02 12:53:19', '2009-02-02 12:55:48', '\0', '.', '\0');
INSERT INTO `users` VALUES(123516, 'SERAFINS', 'Scott', 'Serafin', 'scott.serafin@colorado.edu', 'scott.serafin', 'uo36CMzYxeuUs', 'JTI4JTNDVjVSODY5SSUzQkclMkMlNjAlMEElNjAlMEE=', 0, '2009-02-02 12:54:34', '2009-02-02 12:55:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123517, '810818828', 'Morgan ', 'Hill', 'morgan.l.hill@colorado.edu', 'morgan.l.hill', 'uopNUmW/jJwf.', 'JTI5LiUyMyUyNFAuJTIzJTI0WC4lMjMlMjhYJTBBJTYwJTBB', 0, '2009-02-02 12:55:23', '2009-02-08 11:07:16', '\0', '.', '\0');
INSERT INTO `users` VALUES(123518, '810806102', 'Grady', 'Snell', 'grady.snell@colorado.edu', 'grady.snell', 'uoAUJqQC8kLqQ', 'JTI5LiUyMyUyNFAuJTIzJTYwViUyQzMlNjBSJTBBJTYwJTBB', 0, '2009-02-02 13:01:56', '2009-02-10 14:20:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123519, '810705404', 'Ethan', 'Vance', 'ethan.vance@colorado.edu', 'ethan.vance', 'uogEW34QEPxV6', 'JTI5LiUyMyUyNFAtUyU2MFUtJTIzJTYwVCUwQSU2MCUwQQ==', 0, '2009-02-02 13:11:44', '2009-02-02 13:12:31', '\0', '.', '\0');
INSERT INTO `users` VALUES(123520, '810879090', 'John', 'Wojcicki', 'john.wojcicki@colorado.edu', 'john.wojcicki', 'uoEPjPkiJwecY', 'JTI5LiUyMyUyNFAuJTIzJTNDWSUyQyUyM0RQJTBBJTYwJTBB', 0, '2009-02-02 13:12:26', '2009-02-08 14:36:20', '\0', '.', '\0');
INSERT INTO `users` VALUES(123521, '810825454', 'Mark', 'Swihart', 'mark.swihart@colorado.edu', 'mark.swihart', 'uofvW8br4xwHI', 'JTI5LiUyMyUyNFAuJTIzJTI4VS0lMjM0VCUwQSU2MCUwQQ==', 0, '2009-02-02 13:15:34', '2009-02-02 17:11:07', '\0', '.', '\0');
INSERT INTO `users` VALUES(123522, 'CHIANESE', 'Maurice', 'Chianese', 'maurice.chianese@colorado.edu', 'maurice.chianese', 'uoZ6xR/7NnrA2', 'JTI4OFZBSTg2WUUlM0NWNCU2MCUwQSU2MCUwQQ==', 0, '2009-02-02 13:20:09', '2009-02-03 17:59:03', '\0', '.', '\0');
INSERT INTO `users` VALUES(123523, '810879786', 'Ben', 'Switzer', 'ben.switzer@colorado.edu', 'ben.switzer', 'uo6LejLtqbIfI', 'JTI5LiUyMyUyNFAuJTIzJTNDWS1TJTQwViUwQSU2MCUwQQ==', 0, '2009-02-02 13:35:58', '2009-02-08 19:15:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123524, '810869193', 'Steven', 'Baxley', 'steven.baxley@colorado.edu', 'steven.baxley', 'uoidJ6vmeqKq2', 'JTI5LiUyMyUyNFAuJTIzOFklMkMzRFMlMEElNjAlMEE=', 0, '2009-02-02 13:35:59', '2009-02-08 15:49:57', '\0', '.', '\0');
INSERT INTO `users` VALUES(123525, '995239955', 'Scotty', 'Hamilton', 'scotty.hamilton@colorado.edu', 'scotty.hamilton', 'uost3d7c9cVSk', 'JTI5LjNEVSUyQ0MlMkNZLjM0VSUwQSU2MCUwQQ==', 0, '2009-02-02 13:43:27', '2009-02-02 19:44:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123526, '810822937', 'Bo', 'Pearce', 'bo.pearce@colorado.edu', 'bo.pearce', 'uooYnX.pkHx0c', 'JTI5LiUyMyUyNFAuJTIzJTI4Ui4zJTJDVyUwQSU2MCUwQQ==', 0, '2009-02-02 13:48:21', '2009-02-02 13:48:37', '\0', '.', '\0');
INSERT INTO `users` VALUES(123527, '810798762', 'Charles', 'Pollard', 'charles.pollard@colorado.edu', 'charles.pollard', 'uo5t/l3amOIzk', 'JTI5LiUyMyUyNFAtU0RYLVM4UiUwQSU2MCUwQQ==', 0, '2009-02-02 13:52:15', '2009-02-02 13:53:10', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123528, '810878937', 'David', 'Breitling', 'david.breitling@colorado.edu', 'david.breitling', 'uoibcoSKpdiE6', 'JTI5LiUyMyUyNFAuJTIzJTNDWC4zJTJDVyUwQSU2MCUwQQ==', 0, '2009-02-02 13:59:06', '2009-02-02 14:00:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123529, '810880309', 'Elizabeth', 'Pavone', 'elizabeth.pavone@colorado.edu', 'elizabeth.pavone', 'uotGv2gSSfVD.', 'JTI5LiUyMyUyNFAuJTIzJTQwUCUyQ1MlNjBZJTBBJTYwJTBB', 0, '2009-02-02 13:59:51', '2009-02-02 14:00:37', '\0', '.', '\0');
INSERT INTO `users` VALUES(123530, '810883381', 'Shane', 'Marandi', 'shane.marandi@colorado.edu', 'shane.marandi', 'uoixGckVCfLYs', 'JTI5LiUyMyUyNFAuJTIzJTQwUyUyQ1MlNDBRJTBBJTYwJTBB', 0, '2009-02-02 14:01:50', '2009-02-09 10:47:48', '\0', '.', '\0');
INSERT INTO `users` VALUES(123531, '810898505', 'Hana', 'Fancher', 'hana.fancher@colorado.edu', 'hana.fancher', 'uoyv7BrWHKGRA', 'JTI5LiUyMyUyNFAuJTIzRFgtMyU2MFUlMEElNjAlMEE=', 0, '2009-02-02 14:17:13', '2009-02-03 00:51:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123532, '810845074', 'Scott', 'Scharff', 'scott.scharff@colorado.edu', 'scott.scharff', 'uo.8uvTacKapc', 'JTI5LiUyMyUyNFAuJTIzMFUlMkMlMjMlM0NUJTBBJTYwJTBB', 0, '2009-02-02 14:23:47', '2009-02-02 14:24:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123533, '810824473', 'Douglas', 'Schuster', 'douglas.schuster@colorado.edu', 'douglas.schuster', 'uoXEI4b1R3SME', 'JTI5LiUyMyUyNFAuJTIzJTI4VC0lMjMlM0NTJTBBJTYwJTBB', 0, '2009-02-02 14:28:37', '2009-02-09 08:13:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123534, '810925344', 'Gregory ', 'Hopkins', 'gregory.hopkins@colorado.edu', 'gregory.hopkins', 'uoYOcug3Tg15c', 'JTI5LiUyMyUyNFAuMyUyOFUlMkNTMFQlMEElNjAlMEE=', 0, '2009-02-02 14:41:02', '2009-02-03 20:50:54', '\0', '.', '\0');
INSERT INTO `users` VALUES(123535, '810738055', 'Christopher', 'Locke', 'christopher.locke@colorado.edu', 'christopher.locke', 'uoeWUHKGHd3sw', 'JTI5LiUyMyUyNFAtUyUyQ1glMkMlMjM0VSUwQSU2MCUwQQ==', 0, '2009-02-02 14:44:51', '2009-02-08 19:54:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123536, '810866709', 'Maxwell', 'Musgrave', 'maxwell.musgrave@colorado.edu', 'maxwell.musgrave', 'uodarBbqqv.Lk', 'JTI5LiUyMyUyNFAuJTIzOFYtUyU2MFklMEElNjAlMEE=', 0, '2009-02-02 14:47:15', '2009-02-04 18:12:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123537, '810897903', 'Diego', 'Sanchez', 'dsanchez@colorado.edu', 'dsanchez', 'uoC8jWolz8sFA', 'JTI5LiUyMyUyNFAuJTIzRFcuMyU2MFMlMEElNjAlMEE=', 0, '2009-02-02 14:54:20', '2009-02-02 20:37:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123538, '810866884', 'Shane', 'Vogt', 'shane.vogt@colorado.edu', 'shane.vogt', 'uoI4glzXDLTE.', 'JTI5LiUyMyUyNFAuJTIzOFYuJTIzJTQwVCUwQSU2MCUwQQ==', 0, '2009-02-02 14:58:00', '2009-02-02 14:58:17', '\0', '.', '\0');
INSERT INTO `users` VALUES(123539, '810856707', 'Stephen', 'Rowell', 'rowells@colorado.edu', 'rowells', 'uosPVmoLlSeVk', 'JTI5LiUyMyUyNFAuJTIzNFYtUyU2MFclMEElNjAlMEE=', 0, '2009-02-02 14:59:46', '2009-02-02 15:00:15', '\0', '.', '\0');
INSERT INTO `users` VALUES(123540, 'ASHTONGV', 'Gunnar', 'Ashton', 'gunnar.ashton@colorado.edu', 'gunnar.ashton', 'uooIsPi85b5WI', 'JTI4ODctSCUzRCUyNiU1RE45VzglNjAlMEElNjAlMEE=', 0, '2009-02-02 15:06:26', '2009-02-08 11:26:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123541, '810854252', 'Alex', 'Robershotte', 'alexander.robershotte@colorado.edu', 'alexander.robershotte', 'uo4HLEnhM0aSM', 'JTI5LiUyMyUyNFAuJTIzNFQlMkNDNFIlMEElNjAlMEE=', 0, '2009-02-02 15:21:32', '2009-02-05 01:52:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123542, '810814356', 'Phillip', 'Baros', 'phillip.baros@colorado.edu', 'phillip.baros', 'uokXP9IG7oCqA', 'JTI5LiUyMyUyNFAuJTIzJTI0VCUyQ1M0ViUwQSU2MCUwQQ==', 0, '2009-02-02 15:22:07', '2009-02-02 20:03:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123544, '810927908', 'Lewis', 'Mirelez', 'lewis.mirelez@colorado.edu', 'lewis.mirelez', 'uokHpAgMJn8vg', 'JTI5LiUyMyUyNFAuMyUyOFcuMyU2MFglMEElNjAlMEE=', 0, '2009-02-02 15:23:37', '2009-02-06 10:20:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123545, '810836495', 'David', 'Ling', 'david.ling@colorado.edu', 'david.ling', 'uoTsVCzir61aI', 'JTI5LiUyMyUyNFAuJTIzJTJDVi0lMjNEVSUwQSU2MCUwQQ==', 0, '2009-02-02 15:27:51', '2009-02-02 15:28:19', '\0', '.', '\0');
INSERT INTO `users` VALUES(123546, '810885594', 'Alex', 'Kim', 'alexander.s.kim@colorado.edu', 'alexander.s.kim', 'uotKoLCGL2MLA', 'JTI5LiUyMyUyNFAuJTIzJTQwVS0zRFQlMEElNjAlMEE=', 0, '2009-02-02 15:27:54', '2009-02-02 15:28:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123547, '810853370', 'Cameron', 'Macrae', 'cameron.macrae@colorado.edu', 'cameron.macrae', 'uopKCAmbZXhk6', 'JTI5LiUyMyUyNFAuJTIzNFMlMkNTJTNDUCUwQSU2MCUwQQ==', 0, '2009-02-02 15:30:32', '2009-02-02 15:32:29', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123548, '810863751', 'Max', 'Clark-rabinowitz', 'max.clark-rabinowitz@colorado.edu', 'max.clark-rabinowitz', 'uoDawgPXAJMwE', 'JTI5LiUyMyUyNFAuJTIzOFMtUzRRJTBBJTYwJTBB', 0, '2009-02-02 15:34:53', '2009-02-02 15:36:04', '\0', '.', '\0');
INSERT INTO `users` VALUES(123549, 'OSBORNAM', 'Andrew', 'Osborne', 'andrew.m.osborne@colorado.edu', 'andrew.m.osborne', 'uoEBviGmiVDOI', 'JTI4JTNCVy1CJTNCVyUyOU44NlQlNjAlMEElNjAlMEE=', 0, '2009-02-02 15:36:28', '2009-02-02 15:37:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123550, '810900793', 'Joseph', 'Leeds', 'leedsjb@colorado.edu', 'leedsjb', 'uozX.RLV58PqA', 'JTI5LiUyMyUyNFAuMyU2MFAtU0RTJTBBJTYwJTBB', 0, '2009-02-02 15:36:47', '2009-02-09 13:59:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123551, '810824144', 'Claire', 'Sakamoto', 'sakamotc@colorado.edu', 'sakamotc', 'uoEH4Qk8MxuwE', 'JTI5LiUyMyUyNFAuJTIzJTI4VCUyQzMwVCUwQSU2MCUwQQ==', 0, '2009-02-02 15:40:54', '2009-02-03 08:55:03', '\0', '.', '\0');
INSERT INTO `users` VALUES(123552, '810821776', 'Alex', 'Morrow', 'alex.morrow@colorado.edu', 'alex.morrow', 'uouy7GIhgGo9w', 'JTI5LiUyMyUyNFAuJTIzJTI4US1TJTNDViUwQSU2MCUwQQ==', 0, '2009-02-02 15:45:44', '2009-02-02 15:46:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123553, '810883322', 'Jimena', 'Zamora', 'jimena.zamora@colorado.edu', 'jimena.zamora', 'uo5Q.sHOuHok6', 'JTI5LiUyMyUyNFAuJTIzJTQwUyUyQ1MlMjhSJTBBJTYwJTBB', 0, '2009-02-02 15:46:50', '2009-02-08 19:34:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123554, '123456789', 'Anne', 'Dougherty', 'anne.dougherty@colorado.edu', 'anne.dougherty', 'uoNn1.YiuHbhA', 'JTI5JTJDMyUyOFMtJTIzNFYtUyU0MFklMEElNjAlMEE=', 0, '2009-02-02 15:49:02', '2009-02-02 16:07:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123555, '810866491', 'Riley', 'Gelatt', 'riley.gelatt@colorado.edu', 'riley.gelatt', 'uoX/sCtbCWs5g', 'JTI5LiUyMyUyNFAuJTIzOFYtJTIzRFElMEElNjAlMEE=', 0, '2009-02-02 15:54:38', '2009-02-02 15:55:44', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123556, '810813642', 'Madeline', 'Leary', 'madeline.leary@colorado.edu', 'madeline.leary', 'uog2Wba2gopBQ', 'JTI5LiUyMyUyNFAuJTIzJTI0Uy1DMFIlMEElNjAlMEE=', 0, '2009-02-02 16:00:23', '2009-02-02 16:07:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123557, '810866544', 'Janice', 'Heil', 'janice.heil@colorado.edu', 'janice.heil', 'uociCDpMHdtVo', 'JTI5LiUyMyUyNFAuJTIzOFYtMzBUJTBBJTYwJTBB', 0, '2009-02-02 16:00:23', '2009-02-02 16:01:08', '\0', '.', '\0');
INSERT INTO `users` VALUES(123558, '810818216', 'Carson', 'Grogg', 'carson.grogg@colorado.edu', 'carson.grogg', 'uoNltHeFAwbsw', 'JTI5LiUyMyUyNFAuJTIzJTI0WCUyQ0MlMjRWJTBBJTYwJTBB', 0, '2009-02-02 16:03:25', '2009-02-02 16:07:04', '\0', '.', '\0');
INSERT INTO `users` VALUES(123559, '810850377', 'Dustin', 'Putfark', 'dustin.putfark@colorado.edu', 'dustin.putfark', 'uodNFxsu2glss', 'JTI5LiUyMyUyNFAuJTIzNFAlMkNTJTNDVyUwQSU2MCUwQQ==', 0, '2009-02-02 16:04:28', '2009-02-02 16:04:56', '\0', '.', '\0');
INSERT INTO `users` VALUES(123560, '810863039', 'Steven', 'Vogel', 'steven.vogel@colorado.edu', 'steven.vogel', 'uozoxekqGevG6', 'JTI5LiUyMyUyNFAuJTIzOFMlMkMlMjMlMkNZJTBBJTYwJTBB', 0, '2009-02-02 16:04:59', '2009-02-06 10:25:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123561, '810700212', 'Sabre', 'Brill', 'sabre.brill@colorado.edu', 'sabre.brill', 'uoMTO9HmMnBhw', 'JTI5LiUyMyUyNFAtUyU2MFAlMkNDJTI0UiUwQSU2MCUwQQ==', 0, '2009-02-02 16:12:24', '2009-02-02 16:13:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123562, '830313883', 'Andrew', 'Winthrop', 'andrew.winthrop@colorado.edu', 'andrew.winthrop', 'uoxXdqUGVwXIk', 'JTI5LiUyMyUyQ1AlMkNTJTI0Uy4lMjMlNDBTJTBBJTYwJTBB', 0, '2009-02-02 16:14:31', '2009-02-02 16:15:34', '\0', '.', '\0');
INSERT INTO `users` VALUES(123563, '810818071', 'Eduard', 'Gossanyi', 'eduard.gossanyi@colorado.edu', 'eduard.gossanyi', 'uoWRZddSmF5l6', 'JTI5LiUyMyUyNFAuJTIzJTI0WCUyQyUyMyUzQ1ElMEElNjAlMEE=', 0, '2009-02-02 16:17:25', '2009-02-02 16:17:25', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123564, '810849936', 'Alex', 'Sullivan', 'alex.sullivan@colorado.edu', 'alex.sullivan', 'uoMLZg6UckRYc', 'JTI5LiUyMyUyNFAuJTIzMFkuMyUyQ1YlMEElNjAlMEE=', 0, '2009-02-02 16:20:05', '2009-02-08 10:59:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123565, 'TDNGUYEN', 'Thien', 'Nguyen', 'tdnguyen@colorado.edu', 'tdnguyen', 'uomj/CTKVTHdc', 'JTI4JTNEJTI2MU45VzVZOTZYJTYwJTBBJTYwJTBB', 0, '2009-02-02 16:20:57', '2009-02-03 16:09:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123566, '810877828', 'Dillon', 'Thorse', 'dillon.thorse@colorado.edu', 'dillon.thorse', 'uoqhwEeT/Dw.2', 'JTI5LiUyMyUyNFAuJTIzJTNDVy4lMjMlMjhYJTBBJTYwJTBB', 0, '2009-02-02 16:23:38', '2009-02-09 21:59:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123567, '810817411', 'Natalie', 'Funkhouser', 'natalie.funkhouser@colorado.edu', 'natalie.funkhouser', 'uoCuXVk2ZRX22', 'JTI5LiUyMyUyNFAuJTIzJTI0Vy0lMjMlMjRRJTBBJTYwJTBB', 0, '2009-02-02 16:27:09', '2009-02-02 16:27:43', '\0', '.', '\0');
INSERT INTO `users` VALUES(123568, '810804019', 'Alex', 'Milewski', 'alexander.milewski@colorado.edu', 'alexander.milewski', 'uofzLHQtMwvYU', 'JTI5LiUyMyUyNFAuJTIzJTYwVCUyQyUyMyUyNFklMEElNjAlMEE=', 0, '2009-02-02 16:28:08', '2009-02-04 16:45:48', '\0', '.', '\0');
INSERT INTO `users` VALUES(123569, '810891252', 'Devin', 'Younge', 'devin.younge@colorado.edu', 'devin.younge', 'uoBkQFPiABOxM', 'JTI5LiUyMyUyNFAuJTIzRFElMkNDNFIlMEElNjAlMEE=', 0, '2009-02-02 16:28:40', '2009-02-05 16:49:37', '\0', '.', '\0');
INSERT INTO `users` VALUES(123570, '810899272', 'Jarrett', 'Brown', 'jarrett.brown@colorado.edu', 'jarrett.brown', 'uoGX.rcbVvlFM', 'JTI5LiUyMyUyNFAuJTIzRFklMkNDJTNDUiUwQSU2MCUwQQ==', 0, '2009-02-02 16:30:05', '2009-02-02 16:34:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123571, '810816969', 'Catherine', 'Ezo', 'catherine.ezo@colorado.edu', 'catherine.ezo', 'uovdwLzJ0JIp.', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi4zOFklMEElNjAlMEE=', 0, '2009-02-02 16:35:38', '2009-02-02 16:36:19', '\0', '.', '\0');
INSERT INTO `users` VALUES(123572, '810824959', 'Elizabeth', 'Snatchko', 'elizabeth.snatchko@colorado.edu', 'elizabeth.snatchko', 'uo6QhdNET5NiQ', 'JTI5LiUyMyUyNFAuJTIzJTI4VC4zNFklMEElNjAlMEE=', 0, '2009-02-02 16:44:57', '2009-02-09 21:04:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123573, '995246253', 'Ashley', 'Sonleitner', 'ashley.sonleitner@colorado.edu', 'ashley.sonleitner', 'uoe3ADEajqnD2', 'JTI5LjNEVSUyQ0MwViUyQ0M0UyUwQSU2MCUwQQ==', 0, '2009-02-02 16:52:56', '2009-02-02 16:53:24', '\0', '.', '\0');
INSERT INTO `users` VALUES(123574, '810889139', 'Michael', 'Peters', 'michael.peters@colorado.edu', 'michael.peters', 'uotAzb4O9sUYU', 'JTI5LiUyMyUyNFAuJTIzJTQwWSUyQzMlMkNZJTBBJTYwJTBB', 0, '2009-02-02 16:53:39', '2009-02-04 18:02:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123575, '810819545', 'Chris', 'Kalmbach', 'christopher.kalmbach@colorado.edu', 'christopher.kalmbach', 'uolILUK92ruwo', 'JTI5LiUyMyUyNFAuJTIzJTI0WS0zMFUlMEElNjAlMEE=', 0, '2009-02-02 16:53:41', '2009-02-08 13:32:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123576, '830250293', 'Trevor', 'Doner', 'trevor.doner@colorado.edu', 'trevor.doner', 'uo8A2mKsb2Fhg', 'JTI5LiUyMyUyQ1AlMkNDNFAlMkNDRFMlMEElNjAlMEE=', 0, '2009-02-02 16:56:23', '2009-02-02 16:56:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123577, '810890805', 'Erica', 'Jorgensen', 'erica.l.jorgensen@colorado.edu', 'erica.l.jorgensen', 'uo0sDhBeL2oyk', 'JTI5LiUyMyUyNFAuJTIzRFAuJTIzJTYwVSUwQSU2MCUwQQ==', 0, '2009-02-02 16:57:13', '2009-02-03 00:20:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123578, '810829500', 'Taylor', 'Curtis', 'taylor.curtis@colorado.edu', 'taylor.curtis', 'uomnEM3wszFfo', 'JTI5LiUyMyUyNFAuJTIzJTI4WS0zJTYwUCUwQSU2MCUwQQ==', 0, '2009-02-02 17:13:45', '2009-02-02 17:14:16', '\0', '.', '\0');
INSERT INTO `users` VALUES(123579, '810859846', 'Cameron', 'Fraker', 'fraker@colorado.edu', 'fraker', 'uoNTjZh7d24l6', 'JTI5LiUyMyUyNFAuJTIzNFkuJTIzMFYlMEElNjAlMEE=', 0, '2009-02-02 17:18:48', '2009-02-08 15:58:49', '\0', '.', '\0');
INSERT INTO `users` VALUES(123580, '830276626', 'Patrick', 'Murphy', 'patrick.j.murphy@colorado.edu', 'patrick.j.murphy', 'uoyS4dIXp1rEw', 'JTI5LiUyMyUyQ1AlMkNDJTNDVi1DJTI4ViUwQSU2MCUwQQ==', 0, '2009-02-02 17:56:00', '2009-02-09 13:13:46', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123581, '830313125', 'Louis', 'Tuey', 'louis.tuey@colorado.edu', 'louis.tuey', 'uo1YF7qiKlPGs', 'JTI5LiUyMyUyQ1AlMkNTJTI0UyUyQzMlMjhVJTBBJTYwJTBB', 0, '2009-02-02 18:01:43', '2009-02-08 10:28:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123582, '810817938', 'Tyler', 'Gleditsch', 'tyler.gleditsch@colorado.edu', 'tyler.gleditsch', 'uoHptqM5pTxZs', 'JTI5LiUyMyUyNFAuJTIzJTI0Vy4zJTJDWCUwQSU2MCUwQQ==', 0, '2009-02-02 18:07:46', '2009-02-02 19:08:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123583, '810816886', 'Max', 'Erickson', 'maxwell.erickson@colorado.edu', 'maxwell.erickson', 'uoqMV22Sf4go6', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi4lMjMlNDBWJTBBJTYwJTBB', 0, '2009-02-02 18:14:08', '2009-02-02 18:14:43', '\0', '.', '\0');
INSERT INTO `users` VALUES(123584, '8108100296', 'Melissa', 'Lemar', 'melissa.lemar@colorado.edu', 'melissa.lemar', 'uorYzpA38zvlI', 'JTJBLiUyMyUyNFAuJTIzJTI0UCUyQyUyMyUyOFktJTQwJTYwJTYwJTBBJTYwJTBB', 0, '2009-02-02 18:44:58', '2009-02-02 19:34:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123585, '810874613', 'Chioma', 'Nwankwo', 'chioma.nwankwo@colorado.edu', 'chioma.nwankwo', 'uopG3IQyypS7g', 'JTI5LiUyMyUyNFAuJTIzJTNDVC1DJTI0UyUwQSU2MCUwQQ==', 0, '2009-02-02 18:59:45', '2009-02-02 20:12:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123586, '810888789', 'Paul', 'Whitty', 'paul.whitty@colorado.edu', 'paul.whitty', 'uodQJ7m/39NUc', 'JTI5LiUyMyUyNFAuJTIzJTQwWC1TJTQwWSUwQSU2MCUwQQ==', 0, '2009-02-02 19:16:13', '2009-02-02 19:41:44', '\0', '.', '\0');
INSERT INTO `users` VALUES(123587, '810823328', 'Taylor', 'Preusch', 'taylor.preusch@colorado.edu', 'taylor.preusch', 'uo1xAq7qPmRgo', 'JTI5LiUyMyUyNFAuJTIzJTI4UyUyQ1MlMjhYJTBBJTYwJTBB', 0, '2009-02-02 19:32:48', '2009-02-02 19:38:46', '\0', '.', '\0');
INSERT INTO `users` VALUES(123588, '810816691', 'Bradley', 'Eades', 'bradley.eades@colorado.edu', 'bradley.eades', 'uogV/SYqHaYY6', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi1DRFElMEElNjAlMEE=', 0, '2009-02-02 19:59:52', '2009-02-07 13:54:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123589, '810864808', 'Chris', 'Marriott', 'christopher.marriott@colorado.edu', 'christopher.marriott', 'uoHqU81VZknBY', 'JTI5LiUyMyUyNFAuJTIzOFQuJTIzJTYwWCUwQSU2MCUwQQ==', 0, '2009-02-02 20:00:25', '2009-02-02 20:01:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123590, '810680322', 'Ian', 'Smith', 'smithir@colorado.edu', 'smithir', 'uon6TKoD2..SA', 'JTI5LiUyMyUyNFAtQyU0MFAlMkNTJTI4UiUwQSU2MCUwQQ==', 0, '2009-02-02 20:27:05', '2009-02-02 20:27:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123591, '810292612', 'Casey', 'Johnson', 'cdj@colorado.edu', 'cdj', 'uoMP5TuYQycxI', 'JTI5LiUyMyUyNFAlMkNDRFItQyUyNFIlMEElNjAlMEE=', 0, '2009-02-02 20:30:03', '2009-02-02 20:30:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123592, '810883286', 'Brett', 'Wible', 'brett.wible@colorado.edu', 'brett.wible', 'uoGmvf0DGpZVM', 'JTI5LiUyMyUyNFAuJTIzJTQwUyUyQ0MlNDBWJTBBJTYwJTBB', 0, '2009-02-02 20:52:01', '2009-02-02 20:52:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123593, 'GNIERODE', 'Gregory', 'Nierode', 'gregory.nierode@colorado.edu', 'gregory.nierode', 'uot6ON6ImxgYw', 'JTI4OVZZSTk3JTI5TzklMjY0JTYwJTBBJTYwJTBB', 0, '2009-02-02 21:04:15', '2009-02-04 21:32:57', '\0', '.', '\0');
INSERT INTO `users` VALUES(123594, '810840457', 'Nadia', 'Florez', 'nadia.florez@colorado.edu', 'nadia.florez', 'uoNpYsMNlO4Bw', 'JTI5LiUyMyUyNFAuJTIzMFAtJTIzNFclMEElNjAlMEE=', 0, '2009-02-02 21:18:08', '2009-02-03 14:07:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123595, '810881674', 'Eliza', 'Roberts', 'eliza.roberts@colorado.edu', 'eliza.roberts', 'uoUlj1pHNz6uo', 'JTI5LiUyMyUyNFAuJTIzJTQwUS1DJTNDVCUwQSU2MCUwQQ==', 0, '2009-02-02 21:24:20', '2009-02-02 21:25:52', '\0', '.', '\0');
INSERT INTO `users` VALUES(123596, '810874195', 'Oliver', 'Simpson', 'oliver.simpson@colorado.edu', 'oliver.simpson', 'uoyHfzs0VNEPQ', 'JTI5LiUyMyUyNFAuJTIzJTNDVCUyQzNEVSUwQSU2MCUwQQ==', 0, '2009-02-02 21:49:31', '2009-02-02 21:50:01', '\0', '.', '\0');
INSERT INTO `users` VALUES(123597, '810820501', 'Brionna', 'Lopez', 'brionna.lopez@colorado.edu', 'brionna.lopez', 'uo2/oSTr5ZegE', 'JTI5LiUyMyUyNFAuJTIzJTI4UC0zJTYwUSUwQSU2MCUwQQ==', 0, '2009-02-02 22:00:29', '2009-02-09 12:44:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123598, '810882454', 'Alex', 'Demarais', 'alex.demarais@colorado.edu', 'alex.demarais', 'uo2iFpThJZ6XA', 'JTI5LiUyMyUyNFAuJTIzJTQwUi0lMjM0VCUwQSU2MCUwQQ==', 0, '2009-02-02 22:20:26', '2009-02-02 22:21:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123599, 'SCHLATTN', 'Nicholas', 'Schlatter', 'nicholas.schlatter@colorado.edu', 'nicholas.schlatter', 'uoPFRt1bmuHBQ', 'JTI4JTNDVi1IJTNCJTI2JTI1VCUzRCUyNlglNjAlMEElNjAlMEE=', 0, '2009-02-02 22:55:21', '2009-02-08 12:44:31', '\0', '.', '\0');
INSERT INTO `users` VALUES(123600, '810808675', 'Hiwot ', 'Shiferaw', 'shiferaw@colorado.edu', 'shiferaw', 'uoI5uyShp/ynE', 'JTI5LiUyMyUyNFAuJTIzJTYwWC1DJTNDVSUwQSU2MCUwQQ==', 0, '2009-02-02 23:01:45', '2009-02-02 23:02:34', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123601, '810851686', 'William', 'Vague', 'william.vague@colorado.edu', 'william.vague', 'uoz8NJfpzUdyU', 'JTI5LiUyMyUyNFAuJTIzNFEtQyU0MFYlMEElNjAlMEE=', 0, '2009-02-02 23:22:16', '2009-02-02 23:22:56', '\0', '.', '\0');
INSERT INTO `users` VALUES(123602, '810888656', 'Justin', 'Buscema', 'justin.buscema@colorado.edu', 'justin.buscema', 'uo0HybLfpPghM', 'JTI5LiUyMyUyNFAuJTIzJTQwWC1DNFYlMEElNjAlMEE=', 0, '2009-02-02 23:42:39', '2009-02-22 14:47:23', '\0', '.', '\0');
INSERT INTO `users` VALUES(123603, '810881914', 'Stephanie', 'Eheart', 'stephanie.eheart@colorado.edu', 'stephanie.eheart', 'uoHvw/i14Rcfs', 'JTI5LiUyMyUyNFAuJTIzJTQwUS4zJTI0VCUwQSU2MCUwQQ==', 0, '2009-02-03 00:08:36', '2009-02-03 17:35:46', '\0', '.', '\0');
INSERT INTO `users` VALUES(123604, '810900707', 'Corey', 'Godwin', 'corey.godwin@colorado.edu', 'corey.godwin', 'uooK4DPW4yG9I', 'JTI5LiUyMyUyNFAuMyU2MFAtUyU2MFclMEElNjAlMEE=', 0, '2009-02-03 00:28:29', '2009-02-08 15:17:23', '\0', '.', '\0');
INSERT INTO `users` VALUES(123605, '830277069', 'Zachary', 'Beightol', 'zachary.beightol@colorado.edu', 'zachary.beightol', 'uoeSxRf.PVDLk', 'JTI5LiUyMyUyQ1AlMkNDJTNDVyUyQyUyMzhZJTBBJTYwJTBB', 0, '2009-02-03 00:41:33', '2009-02-03 00:42:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123606, '810899962', 'Sara', 'Sullivan', 'sara.sullivan@colorado.edu', 'sara.sullivan', 'uoEa9CRb6O83c', 'JTI5LiUyMyUyNFAuJTIzRFkuMzhSJTBBJTYwJTBB', 0, '2009-02-03 08:44:10', '2009-02-03 08:44:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123607, '810700213', 'Andrew', 'Brink', 'andrew.brink@colorado.edu', 'andrew.brink', 'uoMTO9HmMnBhw', 'JTI5LiUyMyUyNFAtUyU2MFAlMkNDJTI0UyUwQSU2MCUwQQ==', 0, '2009-02-03 08:52:47', '2009-02-03 08:53:26', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123608, '810868320', 'John', 'Benjamin', 'john.t.benjamin@colorado.edu', 'john.t.benjamin', 'uoAa1gU7PQ5oE', 'JTI5LiUyMyUyNFAuJTIzOFglMkNTJTI4UCUwQSU2MCUwQQ==', 0, '2009-02-03 08:53:04', '2009-02-03 08:54:14', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123609, '810825766', 'John', 'Tovado', 'john.tovado@colorado.edu', 'john.tovado', 'uoYUYlNOLw3i2', 'JTI5LiUyMyUyNFAuJTIzJTI4VS1TOFYlMEElNjAlMEE=', 0, '2009-02-03 09:00:17', '2009-02-05 12:02:52', '\0', '.', '\0');
INSERT INTO `users` VALUES(123610, '810816465', 'Kristina', 'Dixon', 'kristina.dixon@colorado.edu', 'kristina.dixon', 'uoE08W1Q4KypM', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi0lMjM4VSUwQSU2MCUwQQ==', 0, '2009-02-03 09:03:27', '2009-02-03 09:03:40', '\0', '.', '\0');
INSERT INTO `users` VALUES(123611, '810865717', 'Tony', 'Teoh', 'tony.teoh@colorado.edu', 'tony.teoh', 'uorl/98nOCFM2', 'JTI5LiUyMyUyNFAuJTIzOFUtUyUyNFclMEElNjAlMEE=', 0, '2009-02-03 09:09:30', '2009-02-08 19:19:05', '\0', '.', '\0');
INSERT INTO `users` VALUES(123612, '810737775', 'Brian', 'Carpenter', 'carpentb@colorado.edu', 'carpentb', 'uot4UYmZd6Ejg', 'JTI5LiUyMyUyNFAtUyUyQ1ctUyUzQ1UlMEElNjAlMEE=', 0, '2009-02-03 09:10:09', '2009-02-03 09:10:40', '\0', '.', '\0');
INSERT INTO `users` VALUES(123613, '810851555', 'Brendon', 'Morin', 'brendon.morin@colorado.edu', 'brendon.morin', 'uoWu6JYMxqK06', 'JTI5LiUyMyUyNFAuJTIzNFEtMzRVJTBBJTYwJTBB', 0, '2009-02-03 09:13:50', '2009-02-03 09:14:24', '\0', '.', '\0');
INSERT INTO `users` VALUES(123614, '810820888', 'Alexander', 'Martinez', 'alexander.martinez@colorado.edu', 'alexander.martinez', 'uoW9E2v8a/tZ6', 'JTI5LiUyMyUyNFAuJTIzJTI4UC4lMjMlNDBYJTBBJTYwJTBB', 0, '2009-02-03 09:14:11', '2009-02-09 08:39:13', '\0', '.', '\0');
INSERT INTO `users` VALUES(123615, '810826554', 'Hope', 'Willett', 'hope.willett@colorado.edu', 'hope.willett', 'uoZBNmpLU3itM', 'JTI5LiUyMyUyNFAuJTIzJTI4Vi0zNFQlMEElNjAlMEE=', 0, '2009-02-03 09:18:37', '2009-02-03 09:19:05', '\0', '.', '\0');
INSERT INTO `users` VALUES(123616, 'BONNICIM', 'Michael', 'Bonnici', 'michael.bonnici@colorado.edu', 'michael.bonnici', 'uoXoZ5Jy2EH2A', 'JTI4OEYlNUROJTNCRkVDJTNBNlQlNjAlMEElNjAlMEE=', 0, '2009-02-03 09:19:48', '2009-02-03 09:20:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123617, '810813500', 'Nathan', 'Amack', 'amack@colorado.edu', 'amack', 'uoKxIGYYEa4Ig', 'JTI5LiUyMyUyNFAuJTIzJTI0Uy0zJTYwUCUwQSU2MCUwQQ==', 0, '2009-02-03 09:23:45', '2009-02-08 15:03:20', '\0', '.', '\0');
INSERT INTO `users` VALUES(123618, '810855134', 'Shannon', 'Mcnallan', 'shannon.mcnallan@colorado.edu', 'shannon.mcnallan', 'uoPa.dBBI1tao', 'JTI5LiUyMyUyNFAuJTIzNFUlMkMzJTJDVCUwQSU2MCUwQQ==', 0, '2009-02-03 09:24:38', '2009-02-08 23:21:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123619, 'PRENGERM', 'Mark', 'Prenger', 'mark.prenger@colorado.edu', 'mark.prenger', 'uo/zKZUPH4ms2', 'JTI4JTNDJTI3JTI5RSUzQkYlM0RFJTNDRlQlNjAlMEElNjAlMEE=', 0, '2009-02-03 09:27:54', '2009-02-03 09:28:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123620, '810696214', 'Selina', 'Garcia', 'selina.garcia@colorado.edu', 'selina.garcia', 'uoVmTQmY2yI9I', 'JTI5LiUyMyUyNFAtQ0RWJTJDQyUyNFQlMEElNjAlMEE=', 0, '2009-02-03 09:30:21', '2009-02-03 13:39:14', '\0', '.', '\0');
INSERT INTO `users` VALUES(123621, '810882731', 'Kass', 'Kaiser', 'kass.kaiser@colorado.edu', 'kass.kaiser', 'uo2JbNhR4GwiA', 'JTI5LiUyMyUyNFAuJTIzJTQwUi1TJTJDUSUwQSU2MCUwQQ==', 0, '2009-02-03 09:31:31', '2009-02-03 09:31:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123622, '810825738', 'Jake', 'Tonnessen', 'jacob.tonnessen@colorado.edu', 'jacob.tonnessen', 'uoB0ZfMreQGH6', 'JTI5LiUyMyUyNFAuJTIzJTI4VS1TJTJDWCUwQSU2MCUwQQ==', 0, '2009-02-03 09:33:43', '2009-02-03 09:35:20', '\0', '.', '\0');
INSERT INTO `users` VALUES(123623, '810748550', 'Courtney', 'Adamo', 'courtney.adamo@colorado.edu', 'courtney.adamo', 'uouPnSMFTxu46', 'JTI5LiUyMyUyNFAtUzBYLTM0UCUwQSU2MCUwQQ==', 0, '2009-02-03 09:34:59', '2009-02-03 09:37:04', '\0', '.', '\0');
INSERT INTO `users` VALUES(123624, '810878468', 'Dane', 'Larsen', 'larsendt@colorado.edu', 'larsendt', 'uoHQLaxGoiBBM', 'JTI5LiUyMyUyNFAuJTIzJTNDWC0lMjM4WCUwQSU2MCUwQQ==', 0, '2009-02-03 09:44:46', '2009-02-08 04:40:16', '\0', '.', '\0');
INSERT INTO `users` VALUES(123625, '810882871', 'Emily', 'Merchant', 'emily.merchant@colorado.edu', 'emily.merchant', 'uoSEieTCN0EYg', 'JTI5LiUyMyUyNFAuJTIzJTQwUi4lMjMlM0NRJTBBJTYwJTBB', 0, '2009-02-03 09:45:11', '2009-02-03 09:46:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123626, '810874356', 'Leshaun', 'Jones', 'leshaun.jones@colorado.edu', 'leshaun.jones', 'uoPIkQ.p8taD2', 'JTI5LiUyMyUyNFAuJTIzJTNDVCUyQ1M0ViUwQSU2MCUwQQ==', 0, '2009-02-03 09:52:56', '2009-02-03 09:53:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123627, '810883858', 'Emily', 'Spangler', 'emily.spangler@colorado.edu', 'emily.spangler', 'uoADMtq0UGKdo', 'JTI5LiUyMyUyNFAuJTIzJTQwUy4lMjM0WCUwQSU2MCUwQQ==', 0, '2009-02-03 09:54:29', '2009-02-15 17:22:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123628, '810900783', 'Donna', 'Kuntzler', 'donna.kuntzler@colorado.edu', 'donna.kuntzler', 'uo.jVKymAN8Lc', 'JTI5LiUyMyUyNFAuMyU2MFAtUyU0MFMlMEElNjAlMEE=', 0, '2009-02-03 09:56:35', '2009-02-03 09:58:56', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123629, '810907259', 'Jared', 'Wampler', 'jared.wampler@colorado.edu', 'jared.wampler', 'uo9SM.id7aqcg', 'JTI5LiUyMyUyNFAuMyU2MFclMkNDNFklMEElNjAlMEE=', 0, '2009-02-03 10:01:32', '2009-02-08 16:39:59', '\0', '.', '\0');
INSERT INTO `users` VALUES(123630, '830303556', 'Jacob', 'Varhus', 'varhus@colorado.edu', 'varhus', 'uo6JdNKxqRB42', 'JTI5LiUyMyUyQ1AlMkNTJTYwUy0zNFYlMEElNjAlMEE=', 0, '2009-02-03 10:04:39', '2009-02-09 17:59:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123631, '810824587', 'Jon', 'Severns', 'severnsj@colorado.edu', 'severnsj', 'uofRvrkbxufW.', 'JTI5LiUyMyUyNFAuJTIzJTI4VC0zJTQwVyUwQSU2MCUwQQ==', 0, '2009-02-03 10:05:19', '2009-02-06 09:43:54', '\0', '.', '\0');
INSERT INTO `users` VALUES(123632, '830306638', 'Alexander', 'Vonallmen', 'alexander.vonallmen@colorado.edu', 'alexander.vonallmen', 'uolWMRydF6gd6', 'JTI5LiUyMyUyQ1AlMkNTJTYwVi1DJTJDWCUwQSU2MCUwQQ==', 0, '2009-02-03 10:18:16', '2009-02-03 10:18:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123633, '810829148', 'Elizabeth ', 'Mcnicholas', 'elizabeth.mcnicholas@colorado.edu', 'elizabeth.mcnicholas', 'uoZY28x4MGzB2', 'JTI5LiUyMyUyNFAuJTIzJTI4WSUyQzMwWCUwQSU2MCUwQQ==', 0, '2009-02-03 10:18:55', '2009-02-03 10:19:33', '\0', '.', '\0');
INSERT INTO `users` VALUES(123634, '810868220', 'Trevor', 'Mcdonald', 'trevor.mcdonald@colorado.edu', 'trevor.mcdonald', 'uoyLY8rhUUnvc', 'JTI5LiUyMyUyNFAuJTIzOFglMkNDJTI4UCUwQSU2MCUwQQ==', 0, '2009-02-03 10:21:41', '2009-02-03 10:23:16', '\0', '.', '\0');
INSERT INTO `users` VALUES(123635, '810822786', 'Michael', 'Paff', 'michael.paff@colorado.edu', 'michael.paff', 'uosuJr9WH1MvE', 'JTI5LiUyMyUyNFAuJTIzJTI4Ui1TJTQwViUwQSU2MCUwQQ==', 0, '2009-02-03 10:26:30', '2009-02-03 10:26:56', '\0', '.', '\0');
INSERT INTO `users` VALUES(123636, '810826581', 'Kyle', 'Williams', 'kyle.williams@colorado.edu', 'kyle.williams', 'uo1hnxHl/dCxI', 'JTI5LiUyMyUyNFAuJTIzJTI4Vi0zJTQwUSUwQSU2MCUwQQ==', 0, '2009-02-03 10:30:24', '2009-02-06 10:23:34', '\0', '.', '\0');
INSERT INTO `users` VALUES(123637, '810873197', 'Cary', 'Wilton', 'cary.wilton@colorado.edu', 'cary.wilton', 'uo67kNCDveDm2', 'JTI5LiUyMyUyNFAuJTIzJTNDUyUyQzNEVyUwQSU2MCUwQQ==', 0, '2009-02-03 10:30:45', '2009-02-03 10:31:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123638, '830276104', 'Andrea', 'Haselmaier', 'andrea.haselmaier@colorado.edu', 'andrea.haselmaier', 'uoZDWowlxdpXw', 'JTI5LiUyMyUyQ1AlMkNDJTNDViUyQzMlNjBUJTBBJTYwJTBB', 0, '2009-02-03 10:31:58', '2009-02-08 12:03:41', '\0', '.', '\0');
INSERT INTO `users` VALUES(123639, '810864174', 'Jordan', 'Gomez', 'jordan.gomez@colorado.edu', 'jordan.gomez', 'uoNnPwuT7DXeU', 'JTI5LiUyMyUyNFAuJTIzOFQlMkMzJTNDVCUwQSU2MCUwQQ==', 0, '2009-02-03 10:33:38', '2009-02-03 10:34:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123640, '810893418', 'Jonathan', 'Mandel', 'jonathan.mandel@colorado.edu', 'jonathan.mandel', 'uonYf1GxoF0ig', 'JTI5LiUyMyUyNFAuJTIzRFMtJTIzJTI0WCUwQSU2MCUwQQ==', 0, '2009-02-03 10:37:14', '2009-02-03 10:37:41', '\0', '.', '\0');
INSERT INTO `users` VALUES(123641, '810816815', 'Daniel', 'Ellis', 'ellisdb@colorado.edu', 'ellisdb', 'uo.qhYpfAtfd.', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi4lMjMlMjRVJTBBJTYwJTBB', 0, '2009-02-03 10:39:28', '2009-02-03 10:39:59', '\0', '.', '\0');
INSERT INTO `users` VALUES(123642, '810823856', 'Christina', 'Rockwell', 'christina.rockwell@colorado.edu', 'christina.rockwell', 'uogWhE9N9axEQ', 'JTI5LiUyMyUyNFAuJTIzJTI4Uy4lMjM0ViUwQSU2MCUwQQ==', 0, '2009-02-03 10:42:27', '2009-02-03 10:42:44', '\0', '.', '\0');
INSERT INTO `users` VALUES(123643, '810905272', 'Joshua', 'Wanderscheid', 'joshua.wanderscheid@colorado.edu', 'joshua.wanderscheid', 'uo7xrA/a9YrBY', 'JTI5LiUyMyUyNFAuMyU2MFUlMkNDJTNDUiUwQSU2MCUwQQ==', 0, '2009-02-03 10:42:42', '2009-02-03 10:48:56', '\0', '.', '\0');
INSERT INTO `users` VALUES(123644, '810879314', 'Geoff', 'Leewaye', 'geoff.leewaye@colorado.edu', 'geoff.leewaye', 'uoPLMOuSGZFQI', 'JTI5LiUyMyUyNFAuJTIzJTNDWSUyQ1MlMjRUJTBBJTYwJTBB', 0, '2009-02-03 10:43:49', '2009-02-08 13:47:31', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123645, '810885510', 'Jayne', 'Aiken', 'jayne.aiken@colorado.edu', 'jayne.aiken', 'uo8y2AV61IRR.', 'JTI5LiUyMyUyNFAuJTIzJTQwVS0zJTI0UCUwQSU2MCUwQQ==', 0, '2009-02-03 10:44:17', '2009-02-10 09:55:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123646, '810887003', 'Joseph', 'Goode', 'joseph.goode@colorado.edu', 'joseph.goode', 'uoPxf1g/e0Exk', 'JTI5LiUyMyUyNFAuJTIzJTQwVyUyQyUyMyU2MFMlMEElNjAlMEE=', 0, '2009-02-03 10:52:17', '2009-02-08 14:07:50', '\0', '.', '\0');
INSERT INTO `users` VALUES(123647, '810821894', 'Michael', 'Murry', 'michael.murry@colorado.edu', 'michael.murry', 'uolS00s877zuE', 'JTI5LiUyMyUyNFAuJTIzJTI4US4lMjNEVCUwQSU2MCUwQQ==', 0, '2009-02-03 10:56:10', '2009-02-03 10:57:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123648, '810811294', 'Hailey', 'Tharp', 'hailey.tharp@colorado.edu', 'hailey.tharp', 'uovMhwolXdcgA', 'JTI5LiUyMyUyNFAuJTIzJTI0USUyQ0NEVCUwQSU2MCUwQQ==', 0, '2009-02-03 11:03:30', '2009-02-09 13:00:44', '\0', '.', '\0');
INSERT INTO `users` VALUES(123649, '8108177473', 'Nathan', 'Galluzzo', 'nathan.galluzzo@colorado.edu', 'nathan.galluzzo', 'uohl.ppXuK3gA', 'JTJBLiUyMyUyNFAuJTIzJTI0Vy1TMFclMkNQJTYwJTYwJTBBJTYwJTBB', 0, '2009-02-03 11:14:49', '2009-02-08 12:36:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123650, '810878931', 'Peyton', 'Baughn', 'peyton.baughn@colorado.edu', 'peyton.baughn', 'uoibcoSKpdiE6', 'JTI5LiUyMyUyNFAuJTIzJTNDWC4zJTJDUSUwQSU2MCUwQQ==', 0, '2009-02-03 11:15:30', '2009-02-04 12:26:11', '\0', '.', '\0');
INSERT INTO `users` VALUES(123651, '810875013', 'Lauren', 'Gardenswartz', 'lauren.gardenswartz@colorado.edu', 'lauren.gardenswartz', 'uoRzo2k1hwPWM', 'JTI5LiUyMyUyNFAuJTIzJTNDVSUyQyUyMyUyNFMlMEElNjAlMEE=', 0, '2009-02-03 11:15:55', '2009-02-06 12:37:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123652, '810884850', 'Christopher', 'Mar', 'christopher.mar@colorado.edu', 'christopher.mar', 'uo6qbUrYHaq9Y', 'JTI5LiUyMyUyNFAuJTIzJTQwVC4lMjM0UCUwQSU2MCUwQQ==', 0, '2009-02-03 11:28:14', '2009-02-09 16:54:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123653, '810903309', 'Brent', 'Kocis', 'brent.kocis@colorado.edu', 'brent.kocis', 'uoHcJfCyupvKo', 'JTI5LiUyMyUyNFAuMyU2MFMlMkNTJTYwWSUwQSU2MCUwQQ==', 0, '2009-02-03 11:34:03', '2009-02-03 11:34:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123654, '810854602', 'Kevin', 'Berman', 'kevin.berman@colorado.edu', 'kevin.berman', 'uoltKf6pLXGWU', 'JTI5LiUyMyUyNFAuJTIzNFQtQyU2MFIlMEElNjAlMEE=', 0, '2009-02-03 11:42:32', '2009-02-06 09:55:43', '\0', '.', '\0');
INSERT INTO `users` VALUES(123655, '810750339', 'Conrad', 'Schmidt', 'conrad.schmidt@colorado.edu', 'conrad.schmidt', 'uoMtVOzul5vDs', 'JTI5LiUyMyUyNFAtUzRQJTJDUyUyQ1klMEElNjAlMEE=', 0, '2009-02-03 11:54:52', '2009-02-09 01:06:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123656, '810832853', 'Stevi ', 'Edmunds', 'stevi.edmunds@colorado.edu', 'stevi.edmunds', 'uoO53B5PDkTKk', 'JTI5LiUyMyUyNFAuJTIzJTJDUi4lMjM0UyUwQSU2MCUwQQ==', 0, '2009-02-03 11:58:35', '2009-02-03 11:59:18', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123657, '810891472', 'Eleni', 'Weisnicht', 'eleni.weisnicht@colorado.edu', 'eleni.weisnicht', 'uop7yBVpncEeY', 'JTI5LiUyMyUyNFAuJTIzRFEtJTIzJTNDUiUwQSU2MCUwQQ==', 0, '2009-02-03 12:03:23', '2009-02-08 15:41:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123658, 'WAFURMAN', 'Wallis', 'Furman', 'wallis.furman@colorado.edu', 'wallis.furman', 'uoHAoPtfdg50I', 'JTI4JTNEViUyNUYlM0Q3JTI5TTg2WCU2MCUwQSU2MCUwQQ==', 0, '2009-02-03 12:03:35', '2009-02-03 12:03:52', '\0', '.', '\0');
INSERT INTO `users` VALUES(123659, 'SORENSCL', 'Carrie', 'Sorensen', 'carrie.sorensen@colorado.edu', 'carrie.sorensen', 'uo.pOG4kPpVIg', 'JTI4JTNDViU1RFI5NllTOFZQJTYwJTBBJTYwJTBB', 0, '2009-02-03 12:09:11', '2009-02-03 12:09:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123660, '830256935', 'Michael', 'Ton', 'tonm@colorado.edu', 'tonm', 'uoWtdFzDp/iTw', 'JTI5LiUyMyUyQ1AlMkNDNFYuMyUyQ1UlMEElNjAlMEE=', 0, '2009-02-03 12:09:42', '2009-02-08 10:58:21', '\0', '.', '\0');
INSERT INTO `users` VALUES(123661, 'SIMMONSD', 'David', 'Simmons', 'david.simmons@colorado.edu', 'david.simmons', 'uoQXRnYnVTaoY', 'JTI4JTNDVkVNJTNCNiU1RE4lM0NWMCU2MCUwQSU2MCUwQQ==', 0, '2009-02-03 12:13:47', '2009-02-08 20:52:14', '\0', '.', '\0');
INSERT INTO `users` VALUES(123662, '810694502', 'Benjamin', 'Thompson', 'benjamin.thompson@colorado.edu', 'benjamin.thompson', 'uoQHeZj3qdf0M', 'JTI5LiUyMyUyNFAtQ0RULTMlNjBSJTBBJTYwJTBB', 0, '2009-02-03 12:14:12', '2009-02-03 12:14:52', '\0', '.', '\0');
INSERT INTO `users` VALUES(123663, '810867423', 'Cody ', 'Law', 'cody.law@colorado.edu', 'cody.law', 'uoSrLIkCYjtss', 'JTI5LiUyMyUyNFAuJTIzOFctJTIzJTI4UyUwQSU2MCUwQQ==', 0, '2009-02-03 12:25:30', '2009-02-04 12:12:36', '\0', '.', '\0');
INSERT INTO `users` VALUES(123664, '810849830', 'Mark', 'Palmer', 'mark.d.palmer@colorado.edu', 'mark.d.palmer', 'uo8iYRDTJzJDg', 'JTI5LiUyMyUyNFAuJTIzMFkuJTIzJTJDUCUwQSU2MCUwQQ==', 0, '2009-02-03 12:28:29', '2009-02-03 12:29:42', '\0', '.', '\0');
INSERT INTO `users` VALUES(123665, '810801690', 'Michael', 'Tsuji', 'michael.tsuji@colorado.edu', 'michael.tsuji', 'uoSZchXc5Fkkw', 'JTI5LiUyMyUyNFAuJTIzJTYwUS1DRFAlMEElNjAlMEE=', 0, '2009-02-03 12:32:20', '2009-02-03 12:33:27', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123666, '810867574', 'Trevor', 'Ranney', 'trevor.ranney@colorado.edu', 'trevor.ranney', 'uo4zgbhuVXGJU', 'JTI5LiUyMyUyNFAuJTIzOFctMyUzQ1QlMEElNjAlMEE=', 0, '2009-02-03 12:32:47', '2009-02-03 12:46:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123667, '810890758', 'Grant', 'Duffy', 'grant.duffy@colorado.edu', 'grant.duffy', 'uoFaERHmffZWw', 'JTI5LiUyMyUyNFAuJTIzRFAtUzRYJTBBJTYwJTBB', 0, '2009-02-03 12:44:56', '2009-02-08 23:17:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123668, '810884177', 'Shelby', 'Buescher', 'shelby.buescher@colorado.edu', 'shelby.buescher', 'uolvqujuLxS0c', 'JTI5LiUyMyUyNFAuJTIzJTQwVCUyQzMlM0NXJTBBJTYwJTBB', 0, '2009-02-03 13:25:48', '2009-02-05 14:06:06', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123669, '810907207', 'Zach', 'Harmon', 'zachary.harmon@colorado.edu', 'zachary.harmon', 'uooUKK1qzc1tE', 'JTI5LiUyMyUyNFAuMyU2MFclMkNDJTYwVyUwQSU2MCUwQQ==', 0, '2009-02-03 13:29:43', '2009-02-06 12:28:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123670, '810855599', 'Clayton', 'Haskins', 'clayton.haskins@colorado.edu', 'clayton.haskins', 'uofEDRa6Ph6D2', 'JTI5LiUyMyUyNFAuJTIzNFUtM0RZJTBBJTYwJTBB', 0, '2009-02-03 14:19:47', '2009-02-03 14:20:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123671, '810897097', 'Caleb', 'Gradert', 'caleb.gradert@colorado.edu', 'caleb.gradert', 'uoELL5nJKCyMc', 'JTI5LiUyMyUyNFAuJTIzRFclMkMlMjNEVyUwQSU2MCUwQQ==', 0, '2009-02-03 14:31:30', '2009-02-06 10:20:59', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123672, '810858785', 'Caleb', 'Rapp', 'caleb.rapp@colorado.edu', 'caleb.rapp', 'uo7PFn.cMv4fE', 'JTI5LiUyMyUyNFAuJTIzNFgtUyU0MFUlMEElNjAlMEE=', 0, '2009-02-03 14:32:01', '2009-02-09 19:11:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123673, '810817727', 'Dustin', 'Collins', 'dustin.collins@colorado.edu', 'dustin.collins', 'uoy3bDpt1kAno', 'JTI5LiUyMyUyNFAuJTIzJTI0Vy1TJTI4VyUwQSU2MCUwQQ==', 0, '2009-02-03 14:45:15', '2009-02-03 14:46:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123674, '185693', 'Annie', 'Venturo', 'annie.venturo@colorado.edu', 'annie.venturo', 'uol3qgct/yLmY', 'JTI2JTJDMyU0MFUtQ0RTJTBBJTYwJTBB', 0, '2009-02-03 15:27:35', '2009-02-06 08:51:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123675, '810889287', 'Dushyant', 'Dhundara', 'dushyant.dhundara@colorado.edu', 'dushyant.dhundara', 'uody8HntIym9.', 'JTI5LiUyMyUyNFAuJTIzJTQwWSUyQ0MlNDBXJTBBJTYwJTBB', 0, '2009-02-03 15:40:58', '2009-02-03 15:41:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123676, '810650228', 'Jeffrey', 'Taggart', 'jeffrey.taggart@colorado.edu', 'jeffrey.taggart', 'uoypBWdMxH5x6', 'JTI5LiUyMyUyNFAtQzRQJTJDQyUyOFglMEElNjAlMEE=', 0, '2009-02-03 15:51:50', '2009-02-10 14:24:20', '\0', '.', '\0');
INSERT INTO `users` VALUES(123677, 'HARRINMJ', 'Micah', 'Harrington', 'micah.harrington@colorado.edu', 'micah.harrington', 'uoWEp4jGlnxAo', 'JTI4JTNBJTI2JTI1UiUzQ0ZFTiUzQjZIJTYwJTBBJTYwJTBB', 0, '2009-02-03 16:01:00', '2009-02-03 16:03:27', '\0', '.', '\0');
INSERT INTO `users` VALUES(123678, '810820738', 'Jeff', 'Karr mains', 'jeffrey.karrmains@colorado.edu', 'jeffrey.karrmains', 'uohKUCrhZ/Vy6', 'JTI5LiUyMyUyNFAuJTIzJTI4UC1TJTJDWCUwQSU2MCUwQQ==', 0, '2009-02-03 16:31:07', '2009-02-03 16:35:30', '\0', '.', '\0');
INSERT INTO `users` VALUES(123679, '810901184', 'William', 'Firth', 'firthw@colorado.edu', 'firthw', 'uoK31aeQOrHBg', 'JTI5LiUyMyUyNFAuMyU2MFElMkMzJTQwVCUwQSU2MCUwQQ==', 0, '2009-02-03 17:01:55', '2009-02-05 21:28:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123680, '810884612', 'Anna', 'Baer', 'baera@colorado.edu', 'baera', 'uooxPLcmxjgCo', 'JTI5LiUyMyUyNFAuJTIzJTQwVC1DJTI0UiUwQSU2MCUwQQ==', 0, '2009-02-03 17:06:23', '2009-02-06 14:01:53', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123681, '810809909', 'Stephanie', 'Kelley', 'stephanie.kelley@colorado.edu', 'stephanie.kelley', 'uotkoJIhW8IMQ', 'JTI5LiUyMyUyNFAuJTIzJTYwWS4zJTYwWSUwQSU2MCUwQQ==', 0, '2009-02-03 17:11:17', '2009-02-03 17:12:05', '\0', '.', '\0');
INSERT INTO `users` VALUES(123682, '810901058', 'Srrah', 'Algheithy', 'srrah.algheithy@colorado.edu', 'srrah.algheithy', 'uoEqe3HsWiGU.', 'JTI5LiUyMyUyNFAuMyU2MFElMkMlMjM0WCUwQSU2MCUwQQ==', 0, '2009-02-03 17:12:49', '2009-02-05 18:43:23', '\0', '.', '\0');
INSERT INTO `users` VALUES(123683, '810900966', 'Alicia', 'Ward', 'alicia.ward@colorado.edu', 'alicia.ward', 'uo.OazjAGmZH2', 'JTI5LiUyMyUyNFAuMyU2MFAuMzhWJTBBJTYwJTBB', 0, '2009-02-03 18:52:21', '2009-02-03 18:55:28', '\0', '.', '\0');
INSERT INTO `users` VALUES(123684, '810821547', 'Austin', 'Mills', 'austin.mills@colorado.edu', 'austin.mills', 'uoPOicfXwwsQ2', 'JTI5LiUyMyUyNFAuJTIzJTI4US0zMFclMEElNjAlMEE=', 0, '2009-02-03 19:04:22', '2009-02-08 22:52:29', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123685, '810818794', 'Sam', 'Hicks', 'hickssk@colorado.edu', 'hickssk', 'uofAmcSA.w5tY', 'JTI5LiUyMyUyNFAuJTIzJTI0WC1TRFQlMEElNjAlMEE=', 0, '2009-02-03 19:17:33', '2009-02-06 11:02:30', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123686, '810895053', 'Justin', 'Chance', 'chancejc@colorado.edu', 'chancejc', 'uozYePJF41Oko', 'JTI5LiUyMyUyNFAuJTIzRFUlMkMlMjM0UyUwQSU2MCUwQQ==', 0, '2009-02-03 19:32:17', '2009-02-10 11:12:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123687, '810826486', 'Mary', 'Whitney', 'mary.whitney@colorado.edu', 'mary.whitney', 'uoaunmhEDStlM', 'JTI5LiUyMyUyNFAuJTIzJTI4Vi0lMjMlNDBWJTBBJTYwJTBB', 0, '2009-02-03 19:57:12', '2009-02-05 17:26:37', '\0', '.', '\0');
INSERT INTO `users` VALUES(123688, '810865441', 'Nicholas', 'Salen', 'nicholas.salen@colorado.edu', 'nicholas.salen', 'uo64wTbCCGpUk', 'JTI5LiUyMyUyNFAuJTIzOFUtJTIzMFElMEElNjAlMEE=', 0, '2009-02-03 20:13:46', '2009-02-03 20:14:00', '\0', '.', '\0');
INSERT INTO `users` VALUES(123689, '810894127', 'Camden', 'Mendiola', 'camden.mendiola@colorado.edu', 'camden.mendiola', 'uoi2c/yJI25GE', 'JTI5LiUyMyUyNFAuJTIzRFQlMkMzJTI4VyUwQSU2MCUwQQ==', 0, '2009-02-03 20:59:00', '2009-02-03 20:59:36', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123690, '810869455', 'Daryn', 'Hobbs', 'hobbsd@colorado.edu', 'hobbsd', 'uoxIYCEcY4t.E', 'JTI5LiUyMyUyNFAuJTIzOFktJTIzNFUlMEElNjAlMEE=', 0, '2009-02-03 21:04:00', '2009-02-06 11:47:25', '\0', '.', '\0');
INSERT INTO `users` VALUES(123691, '810668931', 'Chelsea', 'Donaldson', 'donaldsc@colorado.edu', 'donaldsc', 'uoEY8gN74drxg', 'JTI5LiUyMyUyNFAtQzhYLjMlMkNRJTBBJTYwJTBB', 0, '2009-02-03 21:44:49', '2009-02-03 21:45:55', '\0', '.', '\0');
INSERT INTO `users` VALUES(123692, '830277350', 'Anthony', 'Pacello', 'anthony.pacello@colorado.edu', 'anthony.pacello', 'uo8F5DkV8unvI', 'JTI5LiUyMyUyQ1AlMkNDJTNDVyUyQ1M0UCUwQSU2MCUwQQ==', 0, '2009-02-03 21:48:33', '2009-02-08 16:28:42', '\0', '.', '\0');
INSERT INTO `users` VALUES(123693, '810880863', 'Xuno', 'Gildelamadrid', 'xuno.gildelamadrid@colorado.edu', 'xuno.gildelamadrid', 'uoJfCP2SLc0so', 'JTI5LiUyMyUyNFAuJTIzJTQwUC4lMjM4UyUwQSU2MCUwQQ==', 0, '2009-02-03 22:03:34', '2009-02-03 22:06:26', '\0', '.', '\0');
INSERT INTO `users` VALUES(123694, '810862705', 'Grant', 'Boerhave', 'grant.boerhave@colorado.edu', 'grant.boerhave', 'uoGWCZ6yXoE5I', 'JTI5LiUyMyUyNFAuJTIzOFItUyU2MFUlMEElNjAlMEE=', 0, '2009-02-03 22:18:14', '2009-02-06 10:33:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123695, '830277276', 'Vinh', 'Le', 'vinh.le@colorado.edu', 'vinh.le', 'uovqBVkLU9lD2', 'JTI5LiUyMyUyQ1AlMkNDJTNDVyUyQ0MlM0NWJTBBJTYwJTBB', 0, '2009-02-03 22:19:37', '2009-02-08 13:51:56', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123696, '810857821', 'John', 'Yavorski', 'john.yavorski@colorado.edu', 'john.yavorski', 'uoJk73dYGjc8c', 'JTI5LiUyMyUyNFAuJTIzNFcuJTIzJTI4USUwQSU2MCUwQQ==', 0, '2009-02-03 23:04:27', '2009-02-04 14:30:01', '\0', '.', '\0');
INSERT INTO `users` VALUES(123697, 'LAUDICKR', 'Robert', 'Laudick', 'robert.laudick@colorado.edu', 'robert.laudick', 'uo4za9ZUAt0fQ', 'JTI4JTNCJTI2JTI1VTklMjZFQyUzQVclMjglNjAlMEElNjAlMEE=', 0, '2009-02-03 23:04:56', '2009-02-05 19:48:03', '\0', '.', '\0');
INSERT INTO `users` VALUES(123698, '810903963', 'Javier', 'Luna', 'javier.luna@colorado.edu', 'javier.luna', 'uo1nqc5LAZMpg', 'JTI5LiUyMyUyNFAuMyU2MFMuMzhTJTBBJTYwJTBB', 0, '2009-02-03 23:47:20', '2009-02-05 22:31:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123699, '810876438', 'Abdullah', 'Alroomi', 'alroomia@colorado.edu', 'alroomia', 'uoy0wmXhQR/J.', 'JTI5LiUyMyUyNFAuJTIzJTNDVi0lMjMlMkNYJTBBJTYwJTBB', 0, '2009-02-04 00:00:58', '2009-02-07 10:08:14', '\0', '.', '\0');
INSERT INTO `users` VALUES(123700, '810826219', 'Jay', 'Wang', 'jay.wang@colorado.edu', 'jay.wang', 'uojim0p5N0LFk', 'JTI5LiUyMyUyNFAuJTIzJTI4ViUyQ0MlMjRZJTBBJTYwJTBB', 0, '2009-02-04 00:02:21', '2009-02-09 15:24:36', '\0', '.', '\0');
INSERT INTO `users` VALUES(123701, '810932934', 'Andrew', 'Dietrich', 'andrew.dietrich@colorado.edu', 'andrew.dietrich', 'uoSn7cHdkXQj.', 'JTI5LiUyMyUyNFAuMyUyQ1IuMyUyQ1QlMEElNjAlMEE=', 0, '2009-02-04 00:08:16', '2009-02-04 00:08:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123702, 'DUNBARJM', 'James', 'Dunbar', 'james.dunbar@colorado.edu', 'james.dunbar', 'uoeV1rcwOj/Tk', 'JTI4OSUyNzVOOEYlMjVSJTNBRlQlNjAlMEElNjAlMEE=', 0, '2009-02-04 01:48:16', '2009-02-04 01:48:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123703, '810731749', 'Julia', 'Ratcliff', 'julia.ratcliff@colorado.edu', 'julia.ratcliff', 'uo8wIVw4fW8AA', 'JTI5LiUyMyUyNFAtUyUyQ1EtUzBZJTBBJTYwJTBB', 0, '2009-02-04 06:30:23', '2009-02-15 21:24:25', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123704, '192755', 'Eric', 'Benzel', 'eric.benzel@colorado.edu', 'eric.benzel', 'uooWreWfyZfbw', 'JTI2JTJDM0RSLVM0VSUwQSU2MCUwQQ==', 0, '2009-02-04 08:24:13', '2009-02-05 11:00:46', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123705, '175387', 'Bobby', 'Chan', 'ho.chan@colorado.edu', 'ho.chan', 'uoD/4AnU7cIfs', 'JTI2JTJDMyUzQ1UlMkNTJTQwVyUwQSU2MCUwQQ==', 0, '2009-02-04 08:29:21', '2009-02-10 19:09:28', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123706, '810766763', 'Zach', 'Vaughan', 'zachary.vaughan@colorado.edu', 'zachary.vaughan', 'uovDHxB8kvKOw', 'JTI5LiUyMyUyNFAtUzhWLVM4UyUwQSU2MCUwQQ==', 0, '2009-02-04 08:29:56', '2009-02-04 08:29:56', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123707, '810893458', 'Jon', 'Horneber', 'horneber@colorado.edu', 'horneber', 'uoVBsgA9kyBTk', 'JTI5LiUyMyUyNFAuJTIzRFMtJTIzNFglMEElNjAlMEE=', 0, '2009-02-04 08:45:43', '2009-02-04 08:45:54', '\0', '.', '\0');
INSERT INTO `users` VALUES(123708, '176007', 'Aaron', 'Glasenapp', 'aaron.glasenapp@colorado.edu', 'aaron.glasenapp', 'uoatep9jo2JXc', 'JTI2JTJDMyUzQ1YlMkMlMjMlNjBXJTBBJTYwJTBB', 0, '2009-02-04 10:38:26', '2009-02-05 14:54:19', '\0', '.', '\0');
INSERT INTO `users` VALUES(123709, '142299', 'Matthew', 'Reynolds', 'matthew.reynolds@colorado.edu', 'matthew.reynolds', 'uoi9GfvVvnAyE', 'JTI2JTJDMzBSJTJDQ0RZJTBBJTYwJTBB', 0, '2009-02-04 10:38:53', '2009-02-06 11:32:59', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123710, '810857627', 'Katherine', 'Novey', 'katherine.novey@colorado.edu', 'katherine.novey', 'uoifO8n/gL5mI', 'JTI5LiUyMyUyNFAuJTIzNFctQyUyOFclMEElNjAlMEE=', 0, '2009-02-04 12:07:41', '2009-02-04 12:08:42', '\0', '.', '\0');
INSERT INTO `users` VALUES(123711, '810899340', 'Iain ', 'Omeara', 'iain.omeara@colorado.edu', 'iain.omeara', 'uoPycfeIiOvwI', 'JTI5LiUyMyUyNFAuJTIzRFklMkNTMFAlMEElNjAlMEE=', 0, '2009-02-04 12:40:34', '2009-02-04 12:41:19', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123712, '810851140', 'Michael', 'Skaggs', 'michael.skaggs@colorado.edu', 'michael.skaggs', 'uoI8IP/W8ao.2', 'JTI5LiUyMyUyNFAuJTIzNFElMkMzMFAlMEElNjAlMEE=', 0, '2009-02-04 13:00:31', '2009-02-08 18:47:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123713, '810802495', 'David', 'Hach', 'david.hach@colorado.edu', 'david.hach', 'uo3QYk9EV3FxE', 'JTI5LiUyMyUyNFAuJTIzJTYwUi0lMjNEVSUwQSU2MCUwQQ==', 0, '2009-02-04 13:00:48', '2009-02-09 10:40:54', '\0', '.', '\0');
INSERT INTO `users` VALUES(123714, '810817049', 'Conor', 'Felletter', 'conor.felletter@colorado.edu', 'conor.felletter', 'uooPdCfc95XlU', 'JTI5LiUyMyUyNFAuJTIzJTI0VyUyQyUyMzBZJTBBJTYwJTBB', 0, '2009-02-04 14:04:38', '2009-02-05 18:31:21', '\0', '.', '\0');
INSERT INTO `users` VALUES(123715, '810885412', 'Sara', 'Pezeshkian', 'sara.pezeshkian@colorado.edu', 'sara.pezeshkian', 'uoVHk42vnOjGo', 'JTI5LiUyMyUyNFAuJTIzJTQwVS0lMjMlMjRSJTBBJTYwJTBB', 0, '2009-02-04 14:16:12', '2009-02-08 03:59:25', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123716, '810818859', 'Walker', 'Hinson', 'walker.hinson@colorado.edu', 'walker.hinson', 'uo/hrzZ5nHOuY', 'JTI5LiUyMyUyNFAuJTIzJTI0WC4lMjM0WSUwQSU2MCUwQQ==', 0, '2009-02-04 14:23:31', '2009-02-06 15:01:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123717, '995163503', 'Walt', 'Williams', 'williawl@colorado.edu', 'williawl', 'uoMDKcUPXHs4k', 'JTI5LjNEVSUyQzM4Uy0zJTYwUyUwQSU2MCUwQQ==', 0, '2009-02-04 15:38:49', '2009-02-04 15:39:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123718, '810927334', 'David', 'Jackson', 'jacksoda@colorado.edu', 'jacksoda', 'uo.cjEyZKYVP2', 'JTI5LiUyMyUyNFAuMyUyOFclMkNTJTJDVCUwQSU2MCUwQQ==', 0, '2009-02-04 16:13:07', '2009-02-10 07:55:59', '\0', '.', '\0');
INSERT INTO `users` VALUES(123719, '810649248', 'Torrey', 'Mcloughlin', 'torrey.mcloughlin@colorado.edu', 'torrey.mcloughlin', 'uovouZtOgglOs', 'JTI5LiUyMyUyNFAtQzBZJTJDQzBYJTBBJTYwJTBB', 0, '2009-02-04 16:37:53', '2009-02-04 16:38:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123720, '810879141', 'Carson', 'Petrash', 'carson.petrash@colorado.edu', 'carson.petrash', 'uo/VtZBo7G/7E', 'JTI5LiUyMyUyNFAuJTIzJTNDWSUyQzMwUSUwQSU2MCUwQQ==', 0, '2009-02-04 16:40:45', '2009-02-09 17:50:30', '\0', '.', '\0');
INSERT INTO `users` VALUES(123721, '810896457', 'Whitney', 'Sather', 'whitney.sather@colorado.edu', 'whitney.sather', 'uoU6plN6iaCug', 'JTI5LiUyMyUyNFAuJTIzRFYtJTIzNFclMEElNjAlMEE=', 0, '2009-02-04 16:47:04', '2009-02-04 16:48:01', '\0', '.', '\0');
INSERT INTO `users` VALUES(123722, '830033207', 'Andrew', 'Buzzetta', 'andrew.buzzetta@colorado.edu', 'a.buzzetta', 'uo3etXAhzjKyk', 'JTI5LiUyMyUyQ1AlMkMlMjMlMkNTJTJDQyU2MFclMEElNjAlMEE=', 0, '2009-02-04 17:05:19', '2009-02-06 18:59:48', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123723, '810887942', 'Neema', 'Hamadani', 'hamadani@colorado.edu', 'hamadani', 'uoPb69sUOEuwk', 'JTI5LiUyMyUyNFAuJTIzJTQwVy4zMFIlMEElNjAlMEE=', 0, '2009-02-04 17:11:27', '2009-02-04 17:11:46', '\0', '.', '\0');
INSERT INTO `users` VALUES(123724, '810907001', 'Tyler', 'Conquest', 'tyler.conquest@colorado.edu', 'tyler.conquest', 'uoH.vcUB2cVB.', 'JTI5LiUyMyUyNFAuMyU2MFclMkMlMjMlNjBRJTBBJTYwJTBB', 0, '2009-02-04 20:28:30', '2009-02-05 23:26:46', '\0', '.', '\0');
INSERT INTO `users` VALUES(123725, '810857764', 'Kyle', 'Treacy', 'kyle.treacy@colorado.edu', 'kyle.treacy', 'uo9f8IAjbtc/k', 'JTI5LiUyMyUyNFAuJTIzNFctUzhUJTBBJTYwJTBB', 0, '2009-02-04 20:28:52', '2009-02-04 20:29:40', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123726, '810873179', 'Jillian', 'Walker', 'jillian.r.walker@colorado.edu', 'jillian.r.walker', 'uoNg/K0xTe0KI', 'JTI5LiUyMyUyNFAuJTIzJTNDUyUyQzMlM0NZJTBBJTYwJTBB', 0, '2009-02-04 20:48:49', '2009-02-10 15:21:36', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123727, '810856000', 'Douglas', 'Leipprandt', 'douglas.leipprandt@colorado.edu', 'douglas.leipprandt', 'uoaAnnaeFX8Dw', 'JTI5LiUyMyUyNFAuJTIzNFYlMkMlMjMlNjBQJTBBJTYwJTBB', 0, '2009-02-04 21:05:22', '2009-02-07 13:12:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123728, '810864097', 'Lawson', 'Gackle', 'lawson.gackle@colorado.edu', 'lawson.gackle', 'uoX1SplxnZNeo', 'JTI5LiUyMyUyNFAuJTIzOFQlMkMlMjNEVyUwQSU2MCUwQQ==', 0, '2009-02-04 21:31:59', '2009-02-04 21:35:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123729, '810875736', 'Bradley', 'Stachurski', 'bradley.stachurski@colorado.edu', 'bradley.stachurski', 'uouxgvZqrxkFE', 'JTI5LiUyMyUyNFAuJTIzJTNDVS1TJTJDViUwQSU2MCUwQQ==', 0, '2009-02-04 21:32:50', '2009-02-06 12:03:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123730, '830277294', 'Amy', 'Marks', 'amy.marks@colorado.edu', 'amy.marks', 'uowaCMXeyV8GY', 'JTI5LiUyMyUyQ1AlMkNDJTNDVyUyQ0NEVCUwQSU2MCUwQQ==', 0, '2009-02-04 22:24:34', '2009-02-04 22:32:24', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123731, '810696729', 'Garrett ', 'Graston', 'garrett.graston@colorado.edu', 'garrett.graston', 'uo.ybmXmyl2.I', 'JTI5LiUyMyUyNFAtQ0RWLVMlMjhZJTBBJTYwJTBB', 0, '2009-02-04 23:05:50', '2009-02-06 11:56:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123732, 'NGUYENPK', 'Phong', 'Nguyen', 'phong.nguyen@colorado.edu', 'phong.nguyen', 'uo5eeZWZ9jMKk', 'JTI4JTNCRiUzRFUlM0U2NU4lM0MlMjZMJTYwJTBBJTYwJTBB', 0, '2009-02-04 23:50:51', '2009-02-06 00:01:54', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123733, '810824625', 'Stephen', 'Shattuck', 'stephen.shattuck@colorado.edu', 'stephen.shattuck', 'uonkcayrceSC.', 'JTI5LiUyMyUyNFAuJTIzJTI4VC1DJTI4VSUwQSU2MCUwQQ==', 0, '2009-02-05 02:27:59', '2009-02-05 02:33:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123734, '810872082', 'Andrew', 'Howell', 'andrew.howell@colorado.edu', 'andrew.howell', 'uohNRpoPFRaAc', 'JTI5LiUyMyUyNFAuJTIzJTNDUiUyQyUyMyU0MFIlMEElNjAlMEE=', 0, '2009-02-05 09:49:39', '2009-02-05 12:19:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123735, '810816519', 'Case', 'Donovan', 'case.donovan@colorado.edu', 'case.donovan', 'uo5uXimcNODqo', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi0zJTI0WSUwQSU2MCUwQQ==', 0, '2009-02-05 10:32:33', '2009-02-05 10:32:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123736, '810796362', 'Karl', 'Buck', 'karl.buck@colorado.edu', 'karl.buck', 'uopeJlSpZgdE.', 'JTI5LiUyMyUyNFAtU0RWJTJDUzhSJTBBJTYwJTBB', 0, '2009-02-05 11:13:53', '2009-02-05 11:18:15', '\0', '.', '\0');
INSERT INTO `users` VALUES(123737, '810827337', 'Christopher', 'Woods', 'cwoods@colorado.edu', 'cwoods', 'uohnH9adbjZBU', 'JTI5LiUyMyUyNFAuJTIzJTI4VyUyQ1MlMkNXJTBBJTYwJTBB', 0, '2009-02-05 13:29:25', '2009-02-05 13:29:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123738, '810894403', 'Matthew', 'Pfeiffer', 'matthew.k.pfeiffer@colorado.edu', 'matthew.k.pfeiffer', 'uoYAmxcw6UF.U', 'JTI5LiUyMyUyNFAuJTIzRFQtJTIzJTYwUyUwQSU2MCUwQQ==', 0, '2009-02-05 15:05:48', '2009-02-05 15:06:58', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123739, '810809879', 'Samuel', 'Nejedly', 'samuel.nejedly@colorado.edu', 'samuel.nejedly', 'uoMW4xJ8Bcx.o', 'JTI5LiUyMyUyNFAuJTIzJTYwWS4lMjMlM0NZJTBBJTYwJTBB', 0, '2009-02-05 15:43:34', '2009-02-05 15:44:52', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123740, '810927872', 'Oluwafunmilayo', 'Oyatogun', 'oluwafunmilayo.oyatogun@colorado.edu', 'oluwafunmilayo.oyatogun', 'uoP1vpL9eXX82', 'JTI5LiUyMyUyNFAuMyUyOFcuJTIzJTNDUiUwQSU2MCUwQQ==', 0, '2009-02-05 21:16:13', '2009-02-05 21:18:44', '\0', '.', '\0');
INSERT INTO `users` VALUES(123741, '810906869', 'Spencer', 'Brugger', 'spencer.brugger@colorado.edu', 'spencer.brugger', 'uo7WIzFkAt9CY', 'JTI5LiUyMyUyNFAuMyU2MFYuJTIzOFklMEElNjAlMEE=', 0, '2009-02-05 23:31:43', '2009-02-05 23:32:11', '\0', '.', '\0');
INSERT INTO `users` VALUES(123742, '810872296', 'Jiew', 'Wu', 'jie.wu-1@colorado.edu', 'jie.wu-1', 'uopyGsmpHs6T.', 'JTI5LiUyMyUyNFAuJTIzJTNDUiUyQ0NEViUwQSU2MCUwQQ==', 0, '2009-02-06 00:11:18', '2009-02-08 22:09:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123743, '810071052', 'Ted', 'Miyasaki', 'miyasaki@colorado.edu', 'miyasaki', 'uoriZqTtoVR/w', 'JTI5LiUyMyUyNFAlMkMlMjMlM0NRJTJDJTIzNFIlMEElNjAlMEE=', 0, '2009-02-06 08:35:23', '2009-02-09 13:24:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123744, '810863556', 'Christopher', 'Borke', 'christopher.borke@colorado.edu', 'christopher.borke', 'uoSpiPTn1Wrdw', 'JTI5LiUyMyUyNFAuJTIzOFMtMzRWJTBBJTYwJTBB', 0, '2009-02-06 09:25:19', '2009-02-06 09:26:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123745, '810845346', 'Corey', 'Teffetalor', 'corey.teffetalor@colorado.edu', 'corey.teffetalor', 'uoTTGxyz9q2tM', 'JTI5LiUyMyUyNFAuJTIzMFUlMkNTMFYlMEElNjAlMEE=', 0, '2009-02-06 09:39:22', '2009-02-06 09:40:04', '\0', '.', '\0');
INSERT INTO `users` VALUES(123746, '830276424', 'Mitchell', 'Stubbs', 'mitch.stubbs@colorado.edu', 'mitch.stubbs', 'uoL.sUxZZZvw2', 'JTI5LiUyMyUyQ1AlMkNDJTNDVi0lMjMlMjhUJTBBJTYwJTBB', 0, '2009-02-06 09:44:30', '2009-02-06 09:45:14', '\0', '.', '\0');
INSERT INTO `users` VALUES(123747, '810859708', 'Derek', 'Goff', 'derek.goff@colorado.edu', 'derek.goff', 'uof5ZE0/eQneQ', 'JTI5LiUyMyUyNFAuJTIzNFktUyU2MFglMEElNjAlMEE=', 0, '2009-02-06 09:45:39', '2009-02-06 09:46:41', '\0', '.', '\0');
INSERT INTO `users` VALUES(123748, '810885993', 'Brandon', 'Campbell', 'brandon.campbell@colorado.edu', 'brandon.campbell', 'uo2u1lWK4kf7k', 'JTI5LiUyMyUyNFAuJTIzJTQwVS4zRFMlMEElNjAlMEE=', 0, '2009-02-06 10:00:24', '2009-02-06 12:06:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123749, '810889715', 'Harrison', 'Vik', 'harrison.vik@colorado.edu', 'harrison.vik', 'uoviOQEYgP.JY', 'JTI5LiUyMyUyNFAuJTIzJTQwWS1TJTI0VSUwQSU2MCUwQQ==', 0, '2009-02-06 10:09:44', '2009-02-06 10:10:44', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123750, '810863765', 'Evan', 'Coffey', 'evan.coffey@colorado.edu', 'evan.coffey', 'uoPzI5b6ZQuXo', 'JTI5LiUyMyUyNFAuJTIzOFMtUzhVJTBBJTYwJTBB', 0, '2009-02-06 10:17:41', '2009-02-06 15:16:13', '\0', '.', '\0');
INSERT INTO `users` VALUES(123751, '810878462', 'Jeffrey', 'Kendall', 'jeffrey.kendall@colorado.edu', 'jeffrey.kendall', 'uoHQLaxGoiBBM', 'JTI5LiUyMyUyNFAuJTIzJTNDWC0lMjM4UiUwQSU2MCUwQQ==', 0, '2009-02-06 11:25:50', '2009-02-06 11:42:50', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123752, '810878402', 'Natalie', 'Tott', 'natalie.tott@colorado.edu', 'natalie.tott', 'uoQU94IkLERXk', 'JTI5LiUyMyUyNFAuJTIzJTNDWC0lMjMlNjBSJTBBJTYwJTBB', 0, '2009-02-06 11:36:52', '2009-02-06 11:42:07', '\0', '.', '\0');
INSERT INTO `users` VALUES(123753, '810872131', 'Jay', 'Maloney', 'jay.maloney@colorado.edu', 'jay.maloney', 'uoWeZ60QT/Ovo', 'JTI5LiUyMyUyNFAuJTIzJTNDUiUyQzMlMkNRJTBBJTYwJTBB', 0, '2009-02-06 12:17:17', '2009-02-06 12:18:10', '\0', '.', '\0');
INSERT INTO `users` VALUES(123754, '810927196', 'Andrew', 'Cook', 'andrew.j.cook@colorado.edu', 'andrew.j.cook', 'uopJhbQVn6BFY', 'JTI5LiUyMyUyNFAuMyUyOFclMkMzRFYlMEElNjAlMEE=', 0, '2009-02-06 12:31:32', '2009-02-10 13:15:36', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123755, '810409657', 'Eran', 'Rozewski', 'eran.rozewski@colorado.edu', 'eran.rozewski', 'uoxy23Ew7cKXQ', 'JTI5LiUyMyUyNFAtJTIzJTYwWS1DNFclMEElNjAlMEE=', 0, '2009-02-06 12:32:56', '2009-02-06 12:38:40', '\0', '.', '\0');
INSERT INTO `users` VALUES(123756, '810821535', 'Taylor', 'Miller', 'taylor.miller@colorado.edu', 'taylor.miller', 'uoUG9OsjVOgDU', 'JTI5LiUyMyUyNFAuJTIzJTI4US0zJTJDVSUwQSU2MCUwQQ==', 0, '2009-02-06 12:45:23', '2009-02-06 12:45:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123757, '810816978', 'Mahad', 'Fahieh', 'mahad.fahieh@colorado.edu', 'mahad.fahieh', 'uoYmiX4wII9zc', 'JTI5LiUyMyUyNFAuJTIzJTI0Vi4zJTNDWCUwQSU2MCUwQQ==', 0, '2009-02-06 12:46:09', '2009-02-06 12:47:02', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123758, '810731079', 'Jan', 'Laesecke', 'jan.laesecke@colorado.edu', 'jan.laesecke', 'uobiibNNwaloA', 'JTI5LiUyMyUyNFAtUyUyQ1ElMkMlMjMlM0NZJTBBJTYwJTBB', 0, '2009-02-06 14:01:45', '2009-02-09 16:27:54', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123759, '800624553', 'Eli', 'Kuhlmann', 'eli.kuhlmann@colorado.edu', 'eli.kuhlmann', 'uot3D2XHXSL.k', 'JTI5LiUyMyU2MFAtQyUyOFQtMzRTJTBBJTYwJTBB', 0, '2009-02-06 14:42:20', '2009-02-09 08:16:46', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123760, '810927122', 'Duy', 'Tran', 'duy.q.tran@colorado.edu', 'duy.q.tran', 'uoHKhH4ngW6MA', 'JTI5LiUyMyUyNFAuMyUyOFclMkMzJTI4UiUwQSU2MCUwQQ==', 0, '2009-02-06 14:47:49', '2009-02-06 14:49:04', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123761, '810822475', 'Justin', 'Lee', 'justin.y.lee@colorado.edu', 'justin.y.lee', 'uoZowzcg1ZWVs', 'JTI5LiUyMyUyNFAuJTIzJTI4Ui0lMjMlM0NVJTBBJTYwJTBB', 0, '2009-02-06 17:16:21', '2009-02-06 17:17:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123762, '995050369', 'David', 'Darling', 'david.c.darling@colorado.edu', 'david.c.darling', 'uo5YzSiihgVA2', 'JTI5LjNEVSUyQyUyMzRQJTJDUzhZJTBBJTYwJTBB', 0, '2009-02-07 15:00:43', '2009-02-09 01:18:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123763, '810815773', 'Albert', 'Como', 'albert.como@colorado.edu', 'albert.como', 'uonCxXvG04Jiw', 'JTI5LiUyMyUyNFAuJTIzJTI0VS1TJTNDUyUwQSU2MCUwQQ==', 0, '2009-02-07 19:28:39', '2009-02-07 19:31:31', '\0', '.', '\0');
INSERT INTO `users` VALUES(123764, '810125176', 'Kalee', 'Salazar', 'salazark@colorado.edu', 'salazark', 'uoHrYO0rknN6M', 'JTI5LiUyMyUyNFAlMkMzJTI4VSUyQzMlM0NWJTBBJTYwJTBB', 0, '2009-02-07 23:28:00', '2009-02-07 23:29:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123765, '810826979', 'Stetson', 'Zirkelbach', 'stetson.zirkelbach@colorado.edu', 'stetson.zirkelbach', 'uosEjtx43zQo.', 'JTI5LiUyMyUyNFAuJTIzJTI4Vi4zJTNDWSUwQSU2MCUwQQ==', 0, '2009-02-08 10:25:48', '2009-02-11 16:08:40', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123766, '810898620', 'Nicholas', 'Zager', 'nicholas.zager@colorado.edu', 'nicholas.zager', 'uonNnk8Nwlx4c', 'JTI5LiUyMyUyNFAuJTIzRFgtQyUyOFAlMEElNjAlMEE=', 0, '2009-02-08 15:35:35', '2009-02-11 13:46:24', '\0', '.', '\0');
INSERT INTO `users` VALUES(123767, '810703620', 'Nicholas', 'Altiere', 'nicholas.altiere@colorado.edu', 'nicholas.altiere', 'uo4LcN7xGY4F.', 'JTI5LiUyMyUyNFAtUyU2MFMtQyUyOFAlMEElNjAlMEE=', 0, '2009-02-08 17:15:44', '2009-02-08 17:18:35', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123768, '810813460', 'Mark', 'Allen', 'allenmg@colorado.edu', 'allenmg', 'uoOkwmYoDdot2', 'JTI5LiUyMyUyNFAuJTIzJTI0Uy0lMjM4UCUwQSU2MCUwQQ==', 0, '2009-02-08 18:00:30', '2009-02-08 18:01:28', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123769, '810829689', 'Adam', 'Smith', 'adam.m.smith@colorado.edu', 'adam.m.smith', 'uoCg7vk1aJWRA', 'JTI5LiUyMyUyNFAuJTIzJTI4WS1DJTQwWSUwQSU2MCUwQQ==', 0, '2009-02-08 18:37:18', '2009-02-12 15:54:49', '\0', '.', '\0');
INSERT INTO `users` VALUES(123770, '810888696', 'Nicholas', 'Valencia', 'nicholas.valencia@colorado.edu', 'nicholas.valencia', 'uoFfEQHInTvx.', 'JTI5LiUyMyUyNFAuJTIzJTQwWC1DRFYlMEElNjAlMEE=', 0, '2009-02-08 20:53:28', '2009-02-09 12:38:48', '\0', '.', '\0');
INSERT INTO `users` VALUES(123771, '810895608', 'Aidan', 'Rajswing', 'aidan.rajswing@colorado.edu', 'aidan.rajswing', 'uoPvwLJNH4O9s', 'JTI5LiUyMyUyNFAuJTIzRFUtQyU2MFglMEElNjAlMEE=', 0, '2009-02-08 21:45:26', '2009-02-08 21:45:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123772, '810886888', 'Collin', 'Burgess', 'collin.burgess@colorado.edu', 'collin.burgess', 'uo1i4rMcw/.tk', 'JTI5LiUyMyUyNFAuJTIzJTQwVi4lMjMlNDBYJTBBJTYwJTBB', 0, '2009-02-08 22:03:25', '2009-02-08 22:10:22', '\0', '.', '\0');
INSERT INTO `users` VALUES(123773, '995217493', 'Federico', 'Unglaub', 'federico.unglaub@colorado.edu', 'federico.unglaub', 'uoa6XfpFaeOGE', 'JTI5LjNEVSUyQ0MlMjRXLSUyM0RTJTBBJTYwJTBB', 0, '2009-02-09 00:49:05', '2009-02-09 00:56:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123774, '810826674', 'Doug', 'Winter', 'douglas.winter@colorado.edu', 'douglas.winter', 'uos6rWcnGG/qs', 'JTI5LiUyMyUyNFAuJTIzJTI4Vi1DJTNDVCUwQSU2MCUwQQ==', 0, '2009-02-09 09:11:32', '2009-02-09 09:11:54', '\0', '.', '\0');
INSERT INTO `users` VALUES(123775, '810816201', 'Jay', 'Davis', 'jay.davis@colorado.edu', 'jay.davis', 'uoQeHzaS9jbY6', 'JTI5LiUyMyUyNFAuJTIzJTI0ViUyQ0MlNjBRJTBBJTYwJTBB', 0, '2009-02-09 11:15:07', '2009-02-09 11:16:21', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123776, '810687238', 'Gordon', 'Graham', 'gordon.graham@colorado.edu', 'gordon.graham', 'uojTUoh1djGxo', 'JTI5LiUyMyUyNFAtQyU0MFclMkNDJTJDWCUwQSU2MCUwQQ==', 0, '2009-02-09 11:51:15', '2009-02-09 13:29:59', '\0', '.', '\0');
INSERT INTO `users` VALUES(123777, '198597', 'Silva', 'Chang', 'silva.chang@colorado.edu', 'silva.chang', 'uoqu8RJ2hbsjM', 'JTI2JTJDM0RYLTNEVyUwQSU2MCUwQQ==', 0, '2009-02-09 12:38:46', '2009-02-21 14:55:23', '\0', '.', '\0');
INSERT INTO `users` VALUES(123778, '198080', 'Ann', 'Scheels', 'ann.scheels@colorado.edu', 'ann.scheels', 'uo2G97h5nqGHk', 'JTI2JTJDM0RYJTJDJTIzJTQwUCUwQSU2MCUwQQ==', 0, '2009-02-09 12:39:11', '2009-02-12 20:08:06', '\0', '.', '\0');
INSERT INTO `users` VALUES(123779, '810824139', 'Charles', 'Sagaser', 'charles.sagaser@colorado.edu', 'charles.sagaser', 'uojVTm/ue49bY', 'JTI5LiUyMyUyNFAuJTIzJTI4VCUyQzMlMkNZJTBBJTYwJTBB', 0, '2009-02-09 12:40:12', '2009-02-10 19:03:51', '\0', '.', '\0');
INSERT INTO `users` VALUES(123780, '810924163', 'Austin', 'Glaser', 'austin.glaser@colorado.edu', 'austin.glaser', 'uo7k0H2UNrNSo', 'JTI5LiUyMyUyNFAuMyUyOFQlMkMzOFMlMEElNjAlMEE=', 0, '2009-02-09 15:09:12', '2009-02-10 18:53:37', '\0', '.', '\0');
INSERT INTO `users` VALUES(123781, '810693113', 'Kelsey', 'Lee', 'kelsey.lee@colorado.edu', 'kelsey.lee', 'uotcjN9EiGLTU', 'JTI5LiUyMyUyNFAtQ0RTJTJDMyUyNFMlMEElNjAlMEE=', 0, '2009-02-09 19:25:39', '2009-02-09 21:47:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123782, '810655742', 'Ryan', 'Jones', 'ryan.t.jones@colorado.edu', 'ryan.t.jones', 'uoJC1e3uRFNec', 'JTI5LiUyMyUyNFAtQzRVLVMwUiUwQSU2MCUwQQ==', 0, '2009-02-10 11:08:28', '2009-02-15 21:46:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123783, '207880', 'Emily', 'Schuck', 'emily.schuck@colorado.edu', 'emily.schuck', 'uob0o1eRrRCiE', 'JTI2JTJDQyU2MFcuJTIzJTQwUCUwQSU2MCUwQQ==', 0, '2009-02-10 11:16:32', '2009-02-15 23:16:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123784, '208571', 'Chris', 'Doudna', 'christopher.doudna@colorado.edu', 'christopher.doudna', 'uoJTDvYAv5CG.', 'JTI2JTJDQyU2MFgtMyUzQ1ElMEElNjAlMEE=', 0, '2009-02-10 11:17:17', '2009-02-10 12:36:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123785, 'TYCKSENA', 'Andrew', 'Tycksen', 'andrew.tycksen@colorado.edu', 'andrew.tycksen', 'uosQ4Fn4lOGqk', 'JTI4JTNEJTI3RUMlM0FXLUUlM0JGJTI0JTYwJTBBJTYwJTBB', 0, '2009-02-10 16:40:24', '2009-02-10 16:42:15', '\0', '.', '\0');
INSERT INTO `users` VALUES(123786, '810241985', 'Mary ann', 'Paliani', 'mary.paliani@colorado.edu', 'mary.paliani', 'uo9MXVjCgQH3U', 'JTI5LiUyMyUyNFAlMkNDMFEuMyU0MFUlMEElNjAlMEE=', 0, '2009-02-13 11:01:47', '2009-02-17 18:26:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123787, 'HARRISWL', 'William', 'Harris', 'william.l.harris@colorado.edu', 'william.l.harris', 'uoMh54o37j6eU', 'JTI4JTNBJTI2JTI1UiUzQ0ZFUyUzRFZQJTYwJTBBJTYwJTBB', 0, '2009-02-13 12:13:09', '2009-02-16 19:12:07', '\0', '.', '\0');
INSERT INTO `users` VALUES(123788, '810889073', 'Ryan', 'Coleman', 'ryan.coleman@colorado.edu', 'ryan.coleman', 'uos9rLfXLD01Q', 'JTI5LiUyMyUyNFAuJTIzJTQwWSUyQyUyMyUzQ1MlMEElNjAlMEE=', 0, '2009-02-13 13:16:52', '2009-02-13 13:19:45', '\0', '.', '\0');
INSERT INTO `users` VALUES(123789, '810902537', 'Kevin', 'Wentzel', 'kevin.wentzel@colorado.edu', 'kevin.wentzel', 'uoga/STEhwLaU', 'JTI5LiUyMyUyNFAuMyU2MFItMyUyQ1clMEElNjAlMEE=', 0, '2009-02-13 17:50:41', '2009-02-13 17:50:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123790, '810898531', 'Christopher', 'Hurst', 'christopher.hurst@colorado.edu', 'christopher.hurst', 'uo0R6Tt6vFaa6', 'JTI5LiUyMyUyNFAuJTIzRFgtMyUyQ1ElMEElNjAlMEE=', 0, '2009-02-14 00:55:50', '2009-02-14 00:56:11', '\0', '.', '\0');
INSERT INTO `users` VALUES(123791, '810865471', 'Jennifer', 'Santini', 'jennifer.santini@colorado.edu', 'jennifer.santini', 'uoW8ofXF9B9rI', 'JTI5LiUyMyUyNFAuJTIzOFUtJTIzJTNDUSUwQSU2MCUwQQ==', 0, '2009-02-14 14:30:52', '2009-02-14 14:32:04', '\0', '.', '\0');
INSERT INTO `users` VALUES(123792, '810897417', 'Kaelin', 'Ellis', 'kaelin.ellis@colorado.edu', 'kaelin.ellis', 'uoqkrbIb1W0Ps', 'JTI5LiUyMyUyNFAuJTIzRFctJTIzJTI0VyUwQSU2MCUwQQ==', 0, '2009-02-14 16:43:49', '2009-02-17 11:18:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123793, '810902664', 'David', 'Hormel', 'hormeld@colorado.edu', 'hormeld', 'uo5DPjF6kfH0.', 'JTI5LiUyMyUyNFAuMyU2MFItQzhUJTBBJTYwJTBB', 0, '2009-02-14 17:17:46', '2009-02-16 21:17:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123794, '810883182', 'Kevin', 'Strickfaden', 'kevin.strickfaden@colorado.edu', 'kevin.strickfaden', 'uoOKCPY6Aej96', 'JTI5LiUyMyUyNFAuJTIzJTQwUyUyQzMlNDBSJTBBJTYwJTBB', 0, '2009-02-14 19:41:31', '2009-02-17 00:18:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123795, '810030146', 'Mario', 'Guzman', 'mario.guzman@colorado.edu', 'mario.guzman', 'uo.rx.jjEPOw.', 'JTI5LiUyMyUyNFAlMkMlMjMlMkNQJTJDMzBWJTBBJTYwJTBB', 0, '2009-02-14 20:20:44', '2009-02-14 20:21:35', '\0', '.', '\0');
INSERT INTO `users` VALUES(123796, '810795885', 'Aaron', 'Katz', 'akatz@colorado.edu', 'akatz', 'uoQP9aHHYi3AI', 'JTI5LiUyMyUyNFAtU0RVLiUyMyU0MFUlMEElNjAlMEE=', 0, '2009-02-14 22:52:11', '2009-02-14 23:31:24', '\0', '.', '\0');
INSERT INTO `users` VALUES(123797, '810901097', 'Eric', 'Anguiano', 'eric.anguiano@colorado.edu', 'eric.anguiano', 'uoPH2Y.oUvRfQ', 'JTI5LiUyMyUyNFAuMyU2MFElMkMlMjNEVyUwQSU2MCUwQQ==', 0, '2009-02-15 00:13:20', '2009-02-15 00:13:41', '\0', '.', '\0');
INSERT INTO `users` VALUES(123798, '810750719', 'Kaylee', 'Winters', 'kaylee.winters@colorado.edu', 'kaylee.winters', 'uoF9PbDygLzbE', 'JTI5LiUyMyUyNFAtUzRQLVMlMjRZJTBBJTYwJTBB', 0, '2009-02-15 10:29:39', '2009-02-16 12:17:14', '\0', '.', '\0');
INSERT INTO `users` VALUES(123799, '810815368', 'Christine', 'Cardena', 'christine.cardenas@colorado.edu', 'christine.cardenas', 'uodWPOVtlH4R.', 'JTI5LiUyMyUyNFAuJTIzJTI0VSUyQ1M4WCUwQSU2MCUwQQ==', 0, '2009-02-15 11:13:05', '2009-02-18 14:33:09', '\0', '.', '\0');
INSERT INTO `users` VALUES(123800, '810900446', 'Rebecca', 'Davison', 'rebecca.davison@colorado.edu', 'rebecca.davison', 'uoE7PymqGZlbw', 'JTI5LiUyMyUyNFAuMyU2MFAtJTIzMFYlMEElNjAlMEE=', 0, '2009-02-15 11:51:22', '2009-02-15 12:05:18', '\0', '.', '\0');
INSERT INTO `users` VALUES(123801, '810817029', 'Zach', 'Fedor', 'zachary.fedor@colorado.edu', 'zachary.fedor', 'uoviUzU9UidPQ', 'JTI5LiUyMyUyNFAuJTIzJTI0VyUyQyUyMyUyOFklMEElNjAlMEE=', 0, '2009-02-15 12:09:33', '2009-02-16 14:25:47', '\0', '.', '\0');
INSERT INTO `users` VALUES(123802, '810888936', 'Joel', 'Jones', 'joel.jones@colorado.edu', 'joel.jones', 'uoVIx0p5/oTrA', 'JTI5LiUyMyUyNFAuJTIzJTQwWC4zJTJDViUwQSU2MCUwQQ==', 0, '2009-02-15 16:06:36', '2009-02-16 10:42:29', '\0', '.', '\0');
INSERT INTO `users` VALUES(123803, '810853602', 'Melissa', 'Collins', 'melissa.j.collins@colorado.edu', 'melissa.j.collins', 'uoqfAa88wB91A', 'JTI5LiUyMyUyNFAuJTIzNFMtQyU2MFIlMEElNjAlMEE=', 0, '2009-02-15 16:19:12', '2009-02-19 11:08:36', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123804, 'GUSTAFKR', 'Kyle', 'Gustafson', 'kyle.gustafson@colorado.edu', 'kyle.gustafson', 'uo9fTzA8LSHKU', 'JTI4OVc1UyUzRCUyNiUyNUYlM0FXJTI4JTYwJTBBJTYwJTBB', 0, '2009-02-15 16:31:35', '2009-02-15 17:40:59', '\0', '.', '\0');
INSERT INTO `users` VALUES(123805, '810586384', 'Kaylee', 'Keim', 'kaylee.keim@colorado.edu', 'kaylee.keim', 'uoIcqWJcrK9TY', 'JTI5LiUyMyUyNFAtMyU0MFYlMkNTJTQwVCUwQSU2MCUwQQ==', 0, '2009-02-15 17:04:48', '2009-02-21 07:26:32', '\0', '.', '\0');
INSERT INTO `users` VALUES(123806, '810898578', 'Griffin', 'Rockwell', 'griffin.rockwell@colorado.edu', 'griffin.rockwell', 'uoOdhVYNpu8Vo', 'JTI5LiUyMyUyNFAuJTIzRFgtMyUzQ1glMEElNjAlMEE=', 0, '2009-02-15 17:14:58', '2009-02-15 17:50:53', '\0', '.', '\0');
INSERT INTO `users` VALUES(123807, '810819034', 'Jeffrey', 'Houlton', 'jeffrey.houlton@colorado.edu', 'jeffrey.houlton', 'uoQyrfZv9sRfg', 'JTI5LiUyMyUyNFAuJTIzJTI0WSUyQyUyMyUyQ1QlMEElNjAlMEE=', 0, '2009-02-15 19:32:07', '2009-02-15 19:34:33', '\0', '.', '\0');
INSERT INTO `users` VALUES(123808, '810585835', 'Nick', 'Martinez', 'nicholas.a.martinez@colorado.edu', 'nicholas.a.martinez', 'uoEyGUMRQA3nk', 'JTI5LiUyMyUyNFAtMyU0MFUuJTIzJTJDVSUwQSU2MCUwQQ==', 0, '2009-02-15 22:05:52', '2009-02-17 11:15:34', '\0', '.', '\0');
INSERT INTO `users` VALUES(123809, '810844959', 'Colby', 'Campbell', 'colby.campbell@colorado.edu', 'colby.campbell', 'uotwMyFFbl7v6', 'JTI5LiUyMyUyNFAuJTIzMFQuMzRZJTBBJTYwJTBB', 0, '2009-02-16 00:11:00', '2009-02-16 00:11:12', '\0', '.', '\0');
INSERT INTO `users` VALUES(123810, '810853744', 'Taylor', 'Gunkel', 'taylor.gunkel@colorado.edu', 'taylor.gunkel', 'uoD6NHHlDqsws', 'JTI5LiUyMyUyNFAuJTIzNFMtUzBUJTBBJTYwJTBB', 0, '2009-02-16 13:12:47', '2009-02-16 13:13:25', '\0', '\0', '\0');
INSERT INTO `users` VALUES(123811, '810820641', 'Daniel', 'Lyons', 'daniel.d.lyons@colorado.edu', 'daniel.d.lyons', 'uo1n2rtonRkX.', 'JTI5LiUyMyUyNFAuJTIzJTI4UC1DMFElMEElNjAlMEE=', 0, '2009-02-16 14:26:31', '2009-02-16 21:33:01', '\0', '.', '\0');
INSERT INTO `users` VALUES(123812, '810823469', 'Steven', 'Ramm', 'ramm@colorado.edu', 'ramm', 'uopwoHgpdnbyM', 'JTI5LiUyMyUyNFAuJTIzJTI4Uy0lMjM4WSUwQSU2MCUwQQ==', 0, '2009-02-16 15:28:52', '2009-02-16 20:55:58', '\0', '.', '\0');
INSERT INTO `users` VALUES(123813, '810883405', 'Andrew', 'Safulko', 'safulko@colorado.edu', 'safulko', 'uo3zLGVdrUpC6', 'JTI5LiUyMyUyNFAuJTIzJTQwUy0lMjMlNjBVJTBBJTYwJTBB', 0, '2009-02-16 15:59:51', '2009-02-16 16:00:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123814, '810888615', 'Ross', 'Currier', 'ross.currier@colorado.edu', 'ross.currier', 'uo2ZVlg6bS6c2', 'JTI5LiUyMyUyNFAuJTIzJTQwWC1DJTI0VSUwQSU2MCUwQQ==', 0, '2009-02-16 17:48:44', '2009-02-17 14:34:38', '\0', '.', '\0');
INSERT INTO `users` VALUES(123815, '810828983', 'Matthew', 'Meyers', 'matthew.t.meyers@colorado.edu', 'matthew.t.meyers', 'uo1WXNMNmkQww', 'JTI5LiUyMyUyNFAuJTIzJTI4WC4zJTQwUyUwQSU2MCUwQQ==', 0, '2009-02-17 02:47:18', '2009-02-17 02:47:39', '\0', '.', '\0');
INSERT INTO `users` VALUES(123816, '810894428', 'Megan', 'Archambo', 'megan.archambo@colorado.edu', 'megan.archambo', 'uouIrxywSoX4k', 'JTI5LiUyMyUyNFAuJTIzRFQtJTIzJTI4WCUwQSU2MCUwQQ==', 0, '2009-02-17 08:53:42', '2009-02-17 09:00:28', '\0', '.', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `users2courses`
--

CREATE TABLE IF NOT EXISTS `users2courses` (
  `user2crse_id` bigint(11) unsigned NOT NULL,
  `user2role_id` mediumint(7) unsigned NOT NULL,
  `crse_id` smallint(4) unsigned NOT NULL,
  `creator_u2c` mediumint(7) unsigned NOT NULL default '0',
  `created_u2c` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_u2c` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2crse_id`),
  UNIQUE KEY `users2courses_ui` (`user2role_id`,`crse_id`),
  KEY `users2courses_fk2` (`crse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display';

--
-- Dumping data for table `users2courses`
--

INSERT INTO `users2courses` VALUES(12345631234, 1234563, 1234, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12345631235, 1234563, 1235, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12345631236, 1234563, 1236, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12345731234, 1234573, 1234, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12345731235, 1234573, 1235, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12345731236, 1234573, 1236, 0, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2courses` VALUES(12377731234, 1237773, 1234, 0, '2009-02-13 11:06:01', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `users2departments`
--

CREATE TABLE IF NOT EXISTS `users2departments` (
  `user2dept_id` bigint(9) unsigned NOT NULL,
  `user2role_id` mediumint(7) unsigned NOT NULL,
  `creator` mediumint(7) unsigned NOT NULL default '0',
  `dept_id` tinyint(2) unsigned NOT NULL,
  `created_u2d` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_u2d` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2dept_id`),
  UNIQUE KEY `users2departments_ui` (`user2role_id`,`dept_id`),
  KEY `users2departments_fk2` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display';

--
-- Dumping data for table `users2departments`
--

INSERT INTO `users2departments` VALUES(123456212, 1234562, 0, 12, '2009-01-26 03:35:59', '\0');
INSERT INTO `users2departments` VALUES(123457212, 1234572, 0, 12, '2009-02-21 01:41:35', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `users2exams`
--

CREATE TABLE IF NOT EXISTS `users2exams` (
  `user2exam_id` bigint(17) unsigned NOT NULL,
  `user2role_id` mediumint(7) unsigned NOT NULL,
  `exam_id` bigint(10) unsigned NOT NULL,
  `creator_u2e` mediumint(7) unsigned NOT NULL default '0',
  `created_u2e` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_u2e` bit(1) NOT NULL default '\0',
  `notice` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2exam_id`),
  UNIQUE KEY `users2exams_ui` (`user2role_id`,`exam_id`),
  KEY `users2exams_fk` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display';

--
-- Dumping data for table `users2exams`
--

INSERT INTO `users2exams` VALUES(12347942009311235, 1234794, 2009311235, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348042009311235, 1234804, 2009311235, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348142009311235, 1234814, 2009311235, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348242009311235, 1234824, 2009311235, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348342009311235, 1234834, 2009311236, 0, '2009-01-27 05:31:50', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348442009311236, 1234844, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348542009311236, 1234854, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348642009311236, 1234864, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348742009311236, 1234874, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348842009311236, 1234884, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12348942009311236, 1234894, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12349042009311236, 1234904, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12349142009311236, 1234914, 2009311236, 0, '2009-01-26 05:28:59', '\0', '\0');
INSERT INTO `users2exams` VALUES(12367442009311235, 1236744, 2009311235, 0, '2009-02-04 15:24:43', '\0', '\0');
INSERT INTO `users2exams` VALUES(12367442009311236, 1236744, 2009311236, 0, '2009-02-04 14:50:27', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370342009311236, 1237034, 2009311236, 0, '2009-02-04 15:21:19', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370442009311236, 1237044, 2009311236, 0, '2009-02-04 15:17:43', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370542009311236, 1237054, 2009311236, 0, '2009-02-04 15:22:26', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370642009311236, 1237064, 2009311236, 0, '2009-02-04 15:23:21', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370842009311236, 1237084, 2009311236, 0, '2009-02-04 15:28:18', '\0', '\0');
INSERT INTO `users2exams` VALUES(12370942009311236, 1237094, 2009311236, 0, '2009-02-04 15:28:55', '\0', '\0');
INSERT INTO `users2exams` VALUES(12377742009311234, 1237774, 2009311234, 0, '2009-02-11 21:51:51', '\0', '.');
INSERT INTO `users2exams` VALUES(12377842009311234, 1237784, 2009311234, 0, '2009-02-11 21:51:18', '\0', '.');
INSERT INTO `users2exams` VALUES(12378242009311234, 1237824, 2009311234, 0, '2009-02-11 21:43:30', '\0', '.');
INSERT INTO `users2exams` VALUES(12378342009311234, 1237834, 2009311234, 0, '2009-02-11 21:44:20', '\0', '.');
INSERT INTO `users2exams` VALUES(12378442009311234, 1237844, 2009311234, 0, '2009-02-11 21:44:55', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `users2roles`
--

CREATE TABLE IF NOT EXISTS `users2roles` (
  `user2role_id` mediumint(7) unsigned NOT NULL,
  `user_id` mediumint(6) unsigned NOT NULL,
  `role_id` tinyint(1) unsigned NOT NULL,
  `creator_u2r` mediumint(7) unsigned NOT NULL default '0',
  `created_u2r` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `lastlog_u2r` timestamp NOT NULL default '0000-00-00 00:00:00',
  `disable_u2r` bit(1) NOT NULL default '\0',
  `default_u2r` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2role_id`),
  UNIQUE KEY `users2roles_ui` (`user_id`,`role_id`),
  KEY `users2roles_fk2` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='creates a relationship between users and their roles';

--
-- Dumping data for table `users2roles`
--

INSERT INTO `users2roles` VALUES(1234561, 123456, 1, 0, '2009-01-26 03:35:53', '2009-02-23 00:44:07', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234562, 123456, 2, 0, '2009-01-26 03:35:53', '2009-02-22 09:05:57', '.', '\0');
INSERT INTO `users2roles` VALUES(1234563, 123456, 3, 0, '2009-01-26 03:35:53', '2009-02-22 09:01:28', '.', '\0');
INSERT INTO `users2roles` VALUES(1234564, 123456, 4, 0, '2009-01-26 03:35:53', '2009-01-26 03:35:53', '.', '\0');
INSERT INTO `users2roles` VALUES(1234565, 123456, 5, 0, '2009-01-26 03:35:53', '2009-02-22 09:08:11', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234571, 123457, 1, 0, '2009-01-26 03:35:59', '2009-02-23 15:35:42', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234572, 123457, 2, 0, '2009-01-26 03:35:59', '2009-01-26 03:35:59', '.', '\0');
INSERT INTO `users2roles` VALUES(1234573, 123457, 3, 0, '2009-01-26 03:35:59', '2009-01-26 03:35:59', '.', '\0');
INSERT INTO `users2roles` VALUES(1234574, 123457, 4, 0, '2009-01-26 03:35:59', '2009-01-26 03:35:59', '.', '\0');
INSERT INTO `users2roles` VALUES(1234575, 123457, 5, 0, '2009-01-26 03:35:59', '2009-02-13 07:04:31', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234794, 123479, 4, 0, '2009-01-26 10:50:16', '2009-02-08 19:48:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234804, 123480, 4, 0, '2009-01-26 10:50:47', '2009-02-09 07:51:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234814, 123481, 4, 0, '2009-01-26 10:51:21', '2009-02-13 11:10:13', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234824, 123482, 4, 0, '2009-01-26 10:51:50', '2009-02-09 13:24:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234825, 123482, 5, 0, '2009-02-02 21:49:36', '2009-02-04 11:08:49', '.', '\0');
INSERT INTO `users2roles` VALUES(1234834, 123483, 4, 0, '2009-01-26 11:00:29', '2009-02-10 10:49:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234844, 123484, 4, 0, '2009-01-26 11:00:49', '2009-01-26 11:00:49', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234854, 123485, 4, 0, '2009-01-26 11:01:08', '2009-02-09 14:25:10', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234864, 123486, 4, 0, '2009-01-26 11:01:34', '2009-02-06 08:48:55', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234874, 123487, 4, 0, '2009-01-26 11:03:07', '2009-02-10 19:29:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234884, 123488, 4, 0, '2009-01-26 11:03:40', '2009-01-26 11:03:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234894, 123489, 4, 0, '2009-01-26 11:04:16', '2009-02-09 15:55:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234904, 123490, 4, 0, '2009-01-26 11:04:40', '2009-01-26 11:04:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234914, 123491, 4, 0, '2009-01-26 11:05:02', '2009-02-09 13:15:49', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234965, 123496, 5, 0, '2009-02-02 11:26:16', '2009-02-02 11:26:43', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234975, 123497, 5, 0, '2009-02-02 11:28:35', '2009-02-08 14:54:16', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234985, 123498, 5, 0, '2009-02-02 11:30:10', '2009-02-02 19:37:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1234995, 123499, 5, 0, '2009-02-02 11:34:59', '2009-02-03 13:04:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235005, 123500, 5, 0, '2009-02-02 11:48:45', '2009-02-08 11:40:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235015, 123501, 5, 0, '2009-02-02 12:09:24', '2009-02-02 12:12:55', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235025, 123502, 5, 0, '2009-02-02 12:21:59', '2009-02-08 21:12:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235035, 123503, 5, 0, '2009-02-02 12:23:53', '2009-02-02 12:24:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235045, 123504, 5, 0, '2009-02-02 12:28:32', '2009-02-02 12:28:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235055, 123505, 5, 0, '2009-02-02 12:31:01', '2009-02-09 15:58:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235065, 123506, 5, 0, '2009-02-02 12:32:51', '2009-02-09 12:21:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235075, 123507, 5, 0, '2009-02-02 12:34:46', '2009-02-02 12:35:10', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235085, 123508, 5, 0, '2009-02-02 12:39:49', '2009-02-10 15:23:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235095, 123509, 5, 0, '2009-02-02 12:42:07', '2009-02-08 10:22:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235105, 123510, 5, 0, '2009-02-02 12:44:10', '2009-02-08 12:39:02', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235115, 123511, 5, 0, '2009-02-02 12:47:08', '2009-02-02 12:47:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235125, 123512, 5, 0, '2009-02-02 12:47:58', '2009-02-08 15:49:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235135, 123513, 5, 0, '2009-02-02 12:49:42', '2009-02-02 12:50:13', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235145, 123514, 5, 0, '2009-02-02 12:50:25', '2009-02-08 14:10:28', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235155, 123515, 5, 0, '2009-02-02 12:53:19', '2009-02-02 12:55:48', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235165, 123516, 5, 0, '2009-02-02 12:54:34', '2009-02-02 12:55:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235175, 123517, 5, 0, '2009-02-02 12:55:23', '2009-02-08 11:07:16', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235185, 123518, 5, 0, '2009-02-02 13:01:56', '2009-02-10 14:20:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235195, 123519, 5, 0, '2009-02-02 13:11:44', '2009-02-02 13:12:31', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235205, 123520, 5, 0, '2009-02-02 13:12:26', '2009-02-08 14:36:20', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235215, 123521, 5, 0, '2009-02-02 13:15:34', '2009-02-02 17:11:07', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235225, 123522, 5, 0, '2009-02-02 13:20:09', '2009-02-03 17:59:03', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235235, 123523, 5, 0, '2009-02-02 13:35:58', '2009-02-08 19:15:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235245, 123524, 5, 0, '2009-02-02 13:35:59', '2009-02-08 15:49:57', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235255, 123525, 5, 0, '2009-02-02 13:43:28', '2009-02-02 19:44:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235265, 123526, 5, 0, '2009-02-02 13:48:21', '2009-02-02 13:48:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235275, 123527, 5, 0, '2009-02-02 13:52:15', '2009-02-02 13:53:10', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235285, 123528, 5, 0, '2009-02-02 13:59:06', '2009-02-02 14:00:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235295, 123529, 5, 0, '2009-02-02 13:59:52', '2009-02-02 14:00:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235305, 123530, 5, 0, '2009-02-02 14:01:51', '2009-02-09 10:47:48', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235315, 123531, 5, 0, '2009-02-02 14:17:13', '2009-02-03 00:51:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235325, 123532, 5, 0, '2009-02-02 14:23:47', '2009-02-02 14:24:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235335, 123533, 5, 0, '2009-02-02 14:28:37', '2009-02-09 08:13:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235345, 123534, 5, 0, '2009-02-02 14:41:02', '2009-02-03 20:50:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235355, 123535, 5, 0, '2009-02-02 14:44:51', '2009-02-08 19:54:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235365, 123536, 5, 0, '2009-02-02 14:47:15', '2009-02-04 18:12:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235375, 123537, 5, 0, '2009-02-02 14:54:20', '2009-02-02 20:37:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235385, 123538, 5, 0, '2009-02-02 14:58:00', '2009-02-02 14:58:17', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235395, 123539, 5, 0, '2009-02-02 14:59:46', '2009-02-02 15:00:15', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235405, 123540, 5, 0, '2009-02-02 15:06:28', '2009-02-08 11:26:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235415, 123541, 5, 0, '2009-02-02 15:21:32', '2009-02-05 01:52:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235425, 123542, 5, 0, '2009-02-02 15:22:08', '2009-02-02 20:03:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235445, 123544, 5, 0, '2009-02-02 15:23:37', '2009-02-06 10:20:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235455, 123545, 5, 0, '2009-02-02 15:27:51', '2009-02-02 15:28:19', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235465, 123546, 5, 0, '2009-02-02 15:27:54', '2009-02-02 15:28:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235475, 123547, 5, 0, '2009-02-02 15:30:32', '2009-02-02 15:32:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235485, 123548, 5, 0, '2009-02-02 15:34:54', '2009-02-02 15:36:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235495, 123549, 5, 0, '2009-02-02 15:36:29', '2009-02-02 15:37:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235505, 123550, 5, 0, '2009-02-02 15:36:47', '2009-02-09 13:59:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235515, 123551, 5, 0, '2009-02-02 15:40:54', '2009-02-03 08:55:03', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235525, 123552, 5, 0, '2009-02-02 15:45:44', '2009-02-02 15:46:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235535, 123553, 5, 0, '2009-02-02 15:46:50', '2009-02-08 19:34:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235545, 123554, 5, 0, '2009-02-02 15:49:02', '2009-02-02 16:07:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235555, 123555, 5, 0, '2009-02-02 15:54:39', '2009-02-02 15:55:44', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235565, 123556, 5, 0, '2009-02-02 16:00:23', '2009-02-02 16:07:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235575, 123557, 5, 0, '2009-02-02 16:00:23', '2009-02-02 16:01:08', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235585, 123558, 5, 0, '2009-02-02 16:03:25', '2009-02-02 16:07:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235595, 123559, 5, 0, '2009-02-02 16:04:28', '2009-02-02 16:04:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235605, 123560, 5, 0, '2009-02-02 16:04:59', '2009-02-06 10:25:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235615, 123561, 5, 0, '2009-02-02 16:12:24', '2009-02-02 16:13:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235625, 123562, 5, 0, '2009-02-02 16:14:31', '2009-02-02 16:15:34', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235635, 123563, 5, 0, '2009-02-02 16:17:25', '2009-02-02 16:17:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235645, 123564, 5, 0, '2009-02-02 16:20:05', '2009-02-08 10:59:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235655, 123565, 5, 0, '2009-02-02 16:20:57', '2009-02-03 16:09:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235665, 123566, 5, 0, '2009-02-02 16:23:38', '2009-02-09 21:59:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235675, 123567, 5, 0, '2009-02-02 16:27:09', '2009-02-02 16:27:43', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235685, 123568, 5, 0, '2009-02-02 16:28:08', '2009-02-04 16:45:48', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235695, 123569, 5, 0, '2009-02-02 16:28:40', '2009-02-05 16:49:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235705, 123570, 5, 0, '2009-02-02 16:30:05', '2009-02-02 16:34:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235715, 123571, 5, 0, '2009-02-02 16:35:38', '2009-02-02 16:36:19', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235725, 123572, 5, 0, '2009-02-02 16:44:57', '2009-02-09 21:04:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235735, 123573, 5, 0, '2009-02-02 16:52:57', '2009-02-02 16:53:24', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235745, 123574, 5, 0, '2009-02-02 16:53:39', '2009-02-04 18:02:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235755, 123575, 5, 0, '2009-02-02 16:53:41', '2009-02-08 13:32:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235765, 123576, 5, 0, '2009-02-02 16:56:23', '2009-02-02 16:56:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235775, 123577, 5, 0, '2009-02-02 16:57:13', '2009-02-03 00:20:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235785, 123578, 5, 0, '2009-02-02 17:13:45', '2009-02-02 17:14:16', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235795, 123579, 5, 0, '2009-02-02 17:18:48', '2009-02-08 15:58:49', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235805, 123580, 5, 0, '2009-02-02 17:56:00', '2009-02-09 13:13:46', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235815, 123581, 5, 0, '2009-02-02 18:01:43', '2009-02-08 10:28:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235825, 123582, 5, 0, '2009-02-02 18:07:46', '2009-02-02 19:09:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235835, 123583, 5, 0, '2009-02-02 18:14:08', '2009-02-02 18:19:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235845, 123584, 5, 0, '2009-02-02 18:44:58', '2009-02-02 19:34:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235855, 123585, 5, 0, '2009-02-02 18:59:45', '2009-02-02 20:12:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235865, 123586, 5, 0, '2009-02-02 19:16:13', '2009-02-02 19:41:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235875, 123587, 5, 0, '2009-02-02 19:32:48', '2009-02-02 19:39:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235885, 123588, 5, 0, '2009-02-02 19:59:52', '2009-02-07 13:54:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235895, 123589, 5, 0, '2009-02-02 20:00:25', '2009-02-02 20:01:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235905, 123590, 5, 0, '2009-02-02 20:27:05', '2009-02-02 20:27:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235915, 123591, 5, 0, '2009-02-02 20:30:03', '2009-02-02 20:30:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235925, 123592, 5, 0, '2009-02-02 20:52:01', '2009-02-02 20:52:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235935, 123593, 5, 0, '2009-02-02 21:04:15', '2009-02-04 21:32:57', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235945, 123594, 5, 0, '2009-02-02 21:18:08', '2009-02-03 14:07:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235955, 123595, 5, 0, '2009-02-02 21:24:20', '2009-02-02 21:25:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235965, 123596, 5, 0, '2009-02-02 21:49:31', '2009-02-02 21:50:01', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235975, 123597, 5, 0, '2009-02-02 22:00:29', '2009-02-09 12:44:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235985, 123598, 5, 0, '2009-02-02 22:20:26', '2009-02-02 22:21:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1235995, 123599, 5, 0, '2009-02-02 22:55:21', '2009-02-08 12:44:31', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236005, 123600, 5, 0, '2009-02-02 23:01:45', '2009-02-02 23:02:34', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236015, 123601, 5, 0, '2009-02-02 23:22:16', '2009-02-02 23:22:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236025, 123602, 5, 0, '2009-02-02 23:42:39', '2009-02-22 14:47:23', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236035, 123603, 5, 0, '2009-02-03 00:08:36', '2009-02-03 17:36:19', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236045, 123604, 5, 0, '2009-02-03 00:28:29', '2009-02-08 15:17:23', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236055, 123605, 5, 0, '2009-02-03 00:41:33', '2009-02-03 00:42:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236065, 123606, 5, 0, '2009-02-03 08:44:10', '2009-02-03 08:44:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236075, 123607, 5, 0, '2009-02-03 08:52:47', '2009-02-03 08:53:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236085, 123608, 5, 0, '2009-02-03 08:53:04', '2009-02-03 08:54:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236095, 123609, 5, 0, '2009-02-03 09:00:17', '2009-02-05 12:02:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236105, 123610, 5, 0, '2009-02-03 09:03:27', '2009-02-03 09:03:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236115, 123611, 5, 0, '2009-02-03 09:09:30', '2009-02-08 19:19:05', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236125, 123612, 5, 0, '2009-02-03 09:10:09', '2009-02-03 09:10:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236135, 123613, 5, 0, '2009-02-03 09:13:50', '2009-02-03 09:14:24', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236145, 123614, 5, 0, '2009-02-03 09:14:11', '2009-02-09 08:39:13', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236155, 123615, 5, 0, '2009-02-03 09:18:37', '2009-02-03 09:19:05', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236165, 123616, 5, 0, '2009-02-03 09:19:48', '2009-02-03 09:20:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236175, 123617, 5, 0, '2009-02-03 09:23:45', '2009-02-08 15:03:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236185, 123618, 5, 0, '2009-02-03 09:24:39', '2009-02-08 23:21:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236195, 123619, 5, 0, '2009-02-03 09:27:54', '2009-02-03 09:28:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236205, 123620, 5, 0, '2009-02-03 09:30:21', '2009-02-03 13:39:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236215, 123621, 5, 0, '2009-02-03 09:31:31', '2009-02-03 09:31:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236225, 123622, 5, 0, '2009-02-03 09:33:43', '2009-02-03 09:35:20', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236235, 123623, 5, 0, '2009-02-03 09:34:59', '2009-02-03 09:37:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236245, 123624, 5, 0, '2009-02-03 09:44:46', '2009-02-08 04:40:16', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236255, 123625, 5, 0, '2009-02-03 09:45:11', '2009-02-03 09:46:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236265, 123626, 5, 0, '2009-02-03 09:52:56', '2009-02-03 09:53:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236275, 123627, 5, 0, '2009-02-03 09:54:29', '2009-02-15 17:22:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236285, 123628, 5, 0, '2009-02-03 09:56:36', '2009-02-03 09:58:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236295, 123629, 5, 0, '2009-02-03 10:01:32', '2009-02-08 16:39:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236305, 123630, 5, 0, '2009-02-03 10:04:39', '2009-02-09 17:59:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236315, 123631, 5, 0, '2009-02-03 10:05:19', '2009-02-06 09:43:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236325, 123632, 5, 0, '2009-02-03 10:18:16', '2009-02-03 10:18:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236335, 123633, 5, 0, '2009-02-03 10:18:55', '2009-02-03 10:19:33', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236345, 123634, 5, 0, '2009-02-03 10:21:41', '2009-02-03 10:23:16', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236355, 123635, 5, 0, '2009-02-03 10:26:30', '2009-02-03 10:26:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236365, 123636, 5, 0, '2009-02-03 10:30:24', '2009-02-06 10:23:34', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236375, 123637, 5, 0, '2009-02-03 10:30:45', '2009-02-03 10:31:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236385, 123638, 5, 0, '2009-02-03 10:31:58', '2009-02-08 12:03:41', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236395, 123639, 5, 0, '2009-02-03 10:33:38', '2009-02-03 10:34:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236405, 123640, 5, 0, '2009-02-03 10:37:15', '2009-02-03 10:37:41', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236415, 123641, 5, 0, '2009-02-03 10:39:28', '2009-02-03 10:39:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236425, 123642, 5, 0, '2009-02-03 10:42:27', '2009-02-03 10:42:44', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236435, 123643, 5, 0, '2009-02-03 10:42:42', '2009-02-03 10:48:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236445, 123644, 5, 0, '2009-02-03 10:43:49', '2009-02-08 13:47:31', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236455, 123645, 5, 0, '2009-02-03 10:44:17', '2009-02-10 09:55:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236465, 123646, 5, 0, '2009-02-03 10:52:18', '2009-02-08 14:07:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236475, 123647, 5, 0, '2009-02-03 10:56:11', '2009-02-03 10:57:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236485, 123648, 5, 0, '2009-02-03 11:03:30', '2009-02-09 13:00:44', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236495, 123649, 5, 0, '2009-02-03 11:14:49', '2009-02-08 12:36:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236505, 123650, 5, 0, '2009-02-03 11:15:30', '2009-02-04 12:26:11', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236515, 123651, 5, 0, '2009-02-03 11:15:55', '2009-02-06 12:37:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236525, 123652, 5, 0, '2009-02-03 11:28:14', '2009-02-09 16:54:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236535, 123653, 5, 0, '2009-02-03 11:34:03', '2009-02-03 11:34:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236545, 123654, 5, 0, '2009-02-03 11:42:32', '2009-02-06 09:55:43', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236555, 123655, 5, 0, '2009-02-03 11:54:52', '2009-02-09 01:06:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236565, 123656, 5, 0, '2009-02-03 11:58:35', '2009-02-03 11:59:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236575, 123657, 5, 0, '2009-02-03 12:03:23', '2009-02-08 15:41:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236585, 123658, 5, 0, '2009-02-03 12:03:35', '2009-02-03 12:04:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236595, 123659, 5, 0, '2009-02-03 12:09:11', '2009-02-03 12:09:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236605, 123660, 5, 0, '2009-02-03 12:09:43', '2009-02-08 10:58:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236615, 123661, 5, 0, '2009-02-03 12:13:48', '2009-02-08 20:52:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236625, 123662, 5, 0, '2009-02-03 12:14:12', '2009-02-03 12:14:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236635, 123663, 5, 0, '2009-02-03 12:25:30', '2009-02-04 12:12:36', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236645, 123664, 5, 0, '2009-02-03 12:28:29', '2009-02-03 12:29:42', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236655, 123665, 5, 0, '2009-02-03 12:32:20', '2009-02-03 12:33:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236665, 123666, 5, 0, '2009-02-03 12:32:47', '2009-02-03 12:46:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236675, 123667, 5, 0, '2009-02-03 12:44:56', '2009-02-08 23:17:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236685, 123668, 5, 0, '2009-02-03 13:25:48', '2009-02-05 14:06:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236695, 123669, 5, 0, '2009-02-03 13:29:43', '2009-02-06 12:28:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236705, 123670, 5, 0, '2009-02-03 14:19:48', '2009-02-03 14:20:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236715, 123671, 5, 0, '2009-02-03 14:31:30', '2009-02-06 10:20:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236725, 123672, 5, 0, '2009-02-03 14:32:01', '2009-02-09 19:11:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236735, 123673, 5, 0, '2009-02-03 14:45:15', '2009-02-03 14:46:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236744, 123674, 4, 0, '2009-02-03 15:27:35', '2009-02-06 08:51:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236755, 123675, 5, 0, '2009-02-03 15:40:58', '2009-02-03 15:43:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236765, 123676, 5, 0, '2009-02-03 15:51:50', '2009-02-10 14:24:20', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236775, 123677, 5, 0, '2009-02-03 16:01:00', '2009-02-03 16:03:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236785, 123678, 5, 0, '2009-02-03 16:31:07', '2009-02-03 16:35:30', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236795, 123679, 5, 0, '2009-02-03 17:01:55', '2009-02-05 21:28:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236805, 123680, 5, 0, '2009-02-03 17:06:23', '2009-02-06 14:01:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236815, 123681, 5, 0, '2009-02-03 17:11:17', '2009-02-03 17:12:05', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236825, 123682, 5, 0, '2009-02-03 17:12:49', '2009-02-05 18:43:23', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236835, 123683, 5, 0, '2009-02-03 18:52:21', '2009-02-03 18:55:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236845, 123684, 5, 0, '2009-02-03 19:04:23', '2009-02-08 22:52:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236855, 123685, 5, 0, '2009-02-03 19:17:33', '2009-02-06 11:02:30', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236865, 123686, 5, 0, '2009-02-03 19:32:17', '2009-02-10 11:12:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236875, 123687, 5, 0, '2009-02-03 19:57:12', '2009-02-05 17:26:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236885, 123688, 5, 0, '2009-02-03 20:13:46', '2009-02-03 20:14:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236895, 123689, 5, 0, '2009-02-03 20:59:00', '2009-02-03 20:59:36', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236905, 123690, 5, 0, '2009-02-03 21:04:00', '2009-02-06 11:47:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236915, 123691, 5, 0, '2009-02-03 21:44:49', '2009-02-03 21:45:55', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236925, 123692, 5, 0, '2009-02-03 21:48:33', '2009-02-08 16:28:42', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236935, 123693, 5, 0, '2009-02-03 22:03:34', '2009-02-03 22:06:26', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236945, 123694, 5, 0, '2009-02-03 22:18:14', '2009-02-06 10:33:41', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236955, 123695, 5, 0, '2009-02-03 22:19:37', '2009-02-08 13:51:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236965, 123696, 5, 0, '2009-02-03 23:04:27', '2009-02-04 14:30:01', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236975, 123697, 5, 0, '2009-02-03 23:04:56', '2009-02-05 19:48:03', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236985, 123698, 5, 0, '2009-02-03 23:47:20', '2009-02-05 22:31:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1236995, 123699, 5, 0, '2009-02-04 00:00:58', '2009-02-07 10:08:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237005, 123700, 5, 0, '2009-02-04 00:02:21', '2009-02-09 15:24:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237015, 123701, 5, 0, '2009-02-04 00:08:16', '2009-02-04 00:08:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237025, 123702, 5, 0, '2009-02-04 01:48:16', '2009-02-04 01:48:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237034, 123703, 4, 0, '2009-02-04 09:35:13', '2009-02-15 21:24:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237035, 123703, 5, 0, '2009-02-04 06:30:23', '2009-02-04 07:19:12', '.', '\0');
INSERT INTO `users2roles` VALUES(1237044, 123704, 4, 0, '2009-02-04 08:24:13', '2009-02-05 11:00:46', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237054, 123705, 4, 0, '2009-02-04 08:29:21', '2009-02-10 19:09:28', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237064, 123706, 4, 0, '2009-02-04 08:29:56', '2009-02-04 08:29:56', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237075, 123707, 5, 0, '2009-02-04 08:45:43', '2009-02-04 08:45:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237084, 123708, 4, 0, '2009-02-04 10:38:26', '2009-02-05 14:54:19', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237094, 123709, 4, 0, '2009-02-04 10:38:53', '2009-02-06 11:33:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237105, 123710, 5, 0, '2009-02-04 12:07:41', '2009-02-04 12:08:42', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237115, 123711, 5, 0, '2009-02-04 12:40:34', '2009-02-04 12:41:19', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237125, 123712, 5, 0, '2009-02-04 13:00:31', '2009-02-08 18:47:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237135, 123713, 5, 0, '2009-02-04 13:00:48', '2009-02-09 10:40:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237145, 123714, 5, 0, '2009-02-04 14:04:38', '2009-02-05 18:31:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237155, 123715, 5, 0, '2009-02-04 14:16:12', '2009-02-08 03:59:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237165, 123716, 5, 0, '2009-02-04 14:23:31', '2009-02-06 15:01:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237175, 123717, 5, 0, '2009-02-04 15:38:49', '2009-02-04 15:39:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237185, 123718, 5, 0, '2009-02-04 16:13:07', '2009-02-10 07:55:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237195, 123719, 5, 0, '2009-02-04 16:37:53', '2009-02-04 16:38:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237205, 123720, 5, 0, '2009-02-04 16:40:45', '2009-02-09 17:50:30', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237215, 123721, 5, 0, '2009-02-04 16:47:04', '2009-02-04 16:48:01', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237225, 123722, 5, 0, '2009-02-04 17:05:19', '2009-02-06 18:59:48', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237235, 123723, 5, 0, '2009-02-04 17:11:27', '2009-02-04 17:11:46', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237245, 123724, 5, 0, '2009-02-04 20:28:30', '2009-02-05 23:26:46', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237255, 123725, 5, 0, '2009-02-04 20:28:52', '2009-02-04 20:29:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237265, 123726, 5, 0, '2009-02-04 20:48:49', '2009-02-10 15:21:36', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237275, 123727, 5, 0, '2009-02-04 21:05:22', '2009-02-07 13:12:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237285, 123728, 5, 0, '2009-02-04 21:31:59', '2009-02-04 21:35:13', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237295, 123729, 5, 0, '2009-02-04 21:32:50', '2009-02-06 12:03:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237305, 123730, 5, 0, '2009-02-04 22:24:34', '2009-02-04 22:32:24', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237315, 123731, 5, 0, '2009-02-04 23:05:50', '2009-02-06 11:56:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237325, 123732, 5, 0, '2009-02-04 23:50:51', '2009-02-06 00:01:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237335, 123733, 5, 0, '2009-02-05 02:27:59', '2009-02-05 02:33:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237345, 123734, 5, 0, '2009-02-05 09:49:39', '2009-02-05 12:19:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237355, 123735, 5, 0, '2009-02-05 10:32:34', '2009-02-05 10:32:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237365, 123736, 5, 0, '2009-02-05 11:13:53', '2009-02-05 11:18:15', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237375, 123737, 5, 0, '2009-02-05 13:29:25', '2009-02-05 13:29:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237385, 123738, 5, 0, '2009-02-05 15:05:48', '2009-02-05 15:06:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237395, 123739, 5, 0, '2009-02-05 15:43:34', '2009-02-05 15:44:52', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237405, 123740, 5, 0, '2009-02-05 21:16:13', '2009-02-05 21:18:44', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237415, 123741, 5, 0, '2009-02-05 23:31:43', '2009-02-05 23:32:11', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237425, 123742, 5, 0, '2009-02-06 00:11:18', '2009-02-08 22:09:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237435, 123743, 5, 0, '2009-02-06 08:35:23', '2009-02-09 13:24:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237445, 123744, 5, 0, '2009-02-06 09:25:19', '2009-02-06 09:26:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237455, 123745, 5, 0, '2009-02-06 09:39:22', '2009-02-06 09:40:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237465, 123746, 5, 0, '2009-02-06 09:44:30', '2009-02-06 09:45:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237475, 123747, 5, 0, '2009-02-06 09:45:39', '2009-02-06 09:46:41', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237485, 123748, 5, 0, '2009-02-06 10:00:24', '2009-02-06 12:06:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237495, 123749, 5, 0, '2009-02-06 10:09:44', '2009-02-06 10:10:44', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237505, 123750, 5, 0, '2009-02-06 10:17:41', '2009-02-06 15:16:13', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237515, 123751, 5, 0, '2009-02-06 11:25:50', '2009-02-06 11:42:50', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237525, 123752, 5, 0, '2009-02-06 11:36:53', '2009-02-06 11:42:07', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237535, 123753, 5, 0, '2009-02-06 12:17:17', '2009-02-06 12:18:10', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237545, 123754, 5, 0, '2009-02-06 12:31:32', '2009-02-10 13:15:36', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237555, 123755, 5, 0, '2009-02-06 12:32:56', '2009-02-06 12:38:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237565, 123756, 5, 0, '2009-02-06 12:45:23', '2009-02-06 12:45:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237575, 123757, 5, 0, '2009-02-06 12:46:09', '2009-02-06 12:47:02', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237585, 123758, 5, 0, '2009-02-06 14:01:45', '2009-02-09 16:27:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237595, 123759, 5, 0, '2009-02-06 14:42:20', '2009-02-09 08:16:46', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237605, 123760, 5, 0, '2009-02-06 14:47:49', '2009-02-06 14:49:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237615, 123761, 5, 0, '2009-02-06 17:16:21', '2009-02-06 17:17:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237625, 123762, 5, 0, '2009-02-07 15:00:43', '2009-02-09 01:18:42', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237635, 123763, 5, 0, '2009-02-07 19:28:39', '2009-02-07 19:31:31', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237645, 123764, 5, 0, '2009-02-07 23:28:00', '2009-02-07 23:44:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237655, 123765, 5, 0, '2009-02-08 10:25:48', '2009-02-11 16:08:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237665, 123766, 5, 0, '2009-02-08 15:35:35', '2009-02-11 13:46:24', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237675, 123767, 5, 0, '2009-02-08 17:15:44', '2009-02-08 17:18:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237685, 123768, 5, 0, '2009-02-08 18:00:30', '2009-02-08 18:01:28', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237695, 123769, 5, 0, '2009-02-08 18:37:18', '2009-02-12 15:54:49', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237705, 123770, 5, 0, '2009-02-08 20:53:28', '2009-02-09 12:38:48', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237715, 123771, 5, 0, '2009-02-08 21:45:26', '2009-02-08 21:45:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237725, 123772, 5, 0, '2009-02-08 22:03:25', '2009-02-08 22:10:22', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237735, 123773, 5, 0, '2009-02-09 00:49:05', '2009-02-09 00:56:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237745, 123774, 5, 0, '2009-02-09 09:11:32', '2009-02-09 09:11:54', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237755, 123775, 5, 0, '2009-02-09 11:15:07', '2009-02-09 11:16:21', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237765, 123776, 5, 0, '2009-02-09 11:51:15', '2009-02-09 13:30:00', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237773, 123777, 3, 0, '2009-02-13 11:02:40', '2009-02-21 14:55:27', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237774, 123777, 4, 0, '2009-02-09 12:38:46', '2009-02-21 14:55:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237784, 123778, 4, 0, '2009-02-09 12:39:11', '2009-02-12 20:08:06', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237795, 123779, 5, 0, '2009-02-09 12:40:12', '2009-02-10 19:03:51', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237805, 123780, 5, 0, '2009-02-09 15:09:12', '2009-02-10 18:53:37', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237815, 123781, 5, 0, '2009-02-09 19:25:39', '2009-02-09 21:47:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237824, 123782, 4, 0, '2009-02-10 11:08:28', '2009-02-15 21:46:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237834, 123783, 4, 0, '2009-02-10 11:16:32', '2009-02-15 23:16:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237844, 123784, 4, 0, '2009-02-10 11:17:17', '2009-02-10 12:36:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237855, 123785, 5, 0, '2009-02-10 16:40:24', '2009-02-10 16:42:15', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237865, 123786, 5, 0, '2009-02-13 11:01:47', '2009-02-17 18:26:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237875, 123787, 5, 0, '2009-02-13 12:13:09', '2009-02-16 19:12:07', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237885, 123788, 5, 0, '2009-02-13 13:16:52', '2009-02-13 13:19:45', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237895, 123789, 5, 0, '2009-02-13 17:50:41', '2009-02-13 17:50:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237905, 123790, 5, 0, '2009-02-14 00:55:50', '2009-02-14 00:57:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237915, 123791, 5, 0, '2009-02-14 14:30:52', '2009-02-14 14:32:04', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237925, 123792, 5, 0, '2009-02-14 16:43:49', '2009-02-17 11:18:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237935, 123793, 5, 0, '2009-02-14 17:17:46', '2009-02-16 21:17:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237945, 123794, 5, 0, '2009-02-14 19:41:31', '2009-02-17 00:18:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237955, 123795, 5, 0, '2009-02-14 20:20:44', '2009-02-14 20:21:35', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237965, 123796, 5, 0, '2009-02-14 22:52:11', '2009-02-14 23:31:24', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237975, 123797, 5, 0, '2009-02-15 00:13:20', '2009-02-15 00:13:41', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237985, 123798, 5, 0, '2009-02-15 10:29:39', '2009-02-16 12:17:14', '\0', '\0');
INSERT INTO `users2roles` VALUES(1237995, 123799, 5, 0, '2009-02-15 11:13:05', '2009-02-18 14:33:09', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238005, 123800, 5, 0, '2009-02-15 11:51:22', '2009-02-15 12:05:18', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238015, 123801, 5, 0, '2009-02-15 12:09:33', '2009-02-16 14:25:47', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238025, 123802, 5, 0, '2009-02-15 16:06:36', '2009-02-16 10:42:29', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238035, 123803, 5, 0, '2009-02-15 16:19:12', '2009-02-19 11:08:36', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238045, 123804, 5, 0, '2009-02-15 16:31:35', '2009-02-15 17:40:59', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238055, 123805, 5, 0, '2009-02-15 17:04:48', '2009-02-21 07:26:32', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238065, 123806, 5, 0, '2009-02-15 17:14:58', '2009-02-15 17:50:53', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238075, 123807, 5, 0, '2009-02-15 19:32:07', '2009-02-15 19:34:33', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238085, 123808, 5, 0, '2009-02-15 22:05:52', '2009-02-17 11:15:34', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238095, 123809, 5, 0, '2009-02-16 00:11:00', '2009-02-16 00:11:12', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238105, 123810, 5, 0, '2009-02-16 13:12:47', '2009-02-16 13:13:25', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238115, 123811, 5, 0, '2009-02-16 14:26:31', '2009-02-16 21:33:01', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238125, 123812, 5, 0, '2009-02-16 15:28:52', '2009-02-16 20:55:58', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238135, 123813, 5, 0, '2009-02-16 15:59:51', '2009-02-16 16:00:40', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238145, 123814, 5, 0, '2009-02-16 17:48:44', '2009-02-17 14:34:38', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238155, 123815, 5, 0, '2009-02-17 02:47:18', '2009-02-17 02:47:39', '\0', '\0');
INSERT INTO `users2roles` VALUES(1238165, 123816, 5, 0, '2009-02-17 08:53:42', '2009-02-17 09:00:28', '\0', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `users2sessions`
--

CREATE TABLE IF NOT EXISTS `users2sessions` (
  `user2sesn_id` bigint(17) unsigned NOT NULL,
  `user2role_id` mediumint(7) unsigned NOT NULL,
  `sesn_id` bigint(10) unsigned NOT NULL,
  `creator_u2s` mediumint(7) unsigned NOT NULL default '0',
  `created_u2s` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `disable_u2s` bit(1) NOT NULL default '\0',
  `notice` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2sesn_id`),
  UNIQUE KEY `users2sessions_ui` (`user2role_id`,`sesn_id`),
  KEY `users2sessions_fk` (`sesn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='defines system tool links for display';

--
-- Dumping data for table `users2sessions`
--

INSERT INTO `users2sessions` VALUES(12349651234567947, 1234965, 1234567947, 0, '2009-02-02 11:27:35', '\0', '.');
INSERT INTO `users2sessions` VALUES(12349751234567995, 1234975, 1234567995, 0, '2009-02-02 11:30:41', '\0', '.');
INSERT INTO `users2sessions` VALUES(12349851234567956, 1234985, 1234567956, 0, '2009-02-02 11:33:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12349951234567957, 1234995, 1234567957, 0, '2009-02-02 11:41:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350051234567971, 1235005, 1234567971, 0, '2009-02-02 11:56:09', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350151234567952, 1235015, 1234567952, 0, '2009-02-02 12:12:10', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350251234567947, 1235025, 1234567947, 0, '2009-02-05 13:14:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350351234567971, 1235035, 1234567971, 0, '2009-02-02 12:30:18', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350551234567953, 1235055, 1234567953, 0, '2009-02-04 18:09:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350651234568018, 1235065, 1234568018, 0, '2009-02-02 13:06:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350751234568001, 1235075, 1234568001, 0, '2009-02-02 12:36:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350851234567983, 1235085, 1234567983, 0, '2009-02-10 15:23:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350851234568039, 1235085, 1234568039, 0, '2009-02-02 12:42:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12350951234568018, 1235095, 1234568018, 0, '2009-02-02 12:46:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351051234568032, 1235105, 1234568032, 0, '2009-02-02 12:54:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351151234568001, 1235115, 1234568001, 0, '2009-02-02 12:49:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351251234568008, 1235125, 1234568008, 0, '2009-02-02 12:51:36', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351351234568007, 1235135, 1234568007, 0, '2009-02-02 12:52:20', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351451234568018, 1235145, 1234568018, 0, '2009-02-02 12:53:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351551234568042, 1235155, 1234568042, 0, '2009-02-02 12:57:48', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351651234567951, 1235165, 1234567951, 0, '2009-02-02 12:57:17', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351751234568018, 1235175, 1234568018, 0, '2009-02-02 12:57:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351851234567951, 1235185, 1234567951, 0, '2009-02-02 13:07:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12351951234568000, 1235195, 1234568000, 0, '2009-02-02 13:15:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352051234568042, 1235205, 1234568042, 0, '2009-02-02 13:14:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352351234568018, 1235235, 1234568018, 0, '2009-02-02 13:37:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352451234568008, 1235245, 1234568008, 0, '2009-02-02 13:49:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352551234568017, 1235255, 1234568017, 0, '2009-02-02 13:45:02', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352651234568019, 1235265, 1234568019, 0, '2009-02-02 13:49:27', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352751234568003, 1235275, 1234568003, 0, '2009-02-02 13:57:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352751234568005, 1235275, 1234568005, 0, '2009-02-02 13:55:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352851234567971, 1235285, 1234567971, 0, '2009-02-02 14:04:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12352951234568039, 1235295, 1234568039, 0, '2009-02-02 14:03:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353051234568001, 1235305, 1234568001, 0, '2009-02-02 14:05:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353151234568001, 1235315, 1234568001, 0, '2009-02-02 14:19:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353151234568039, 1235315, 1234568039, 0, '2009-02-02 14:21:02', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353251234568019, 1235325, 1234568019, 0, '2009-02-02 14:27:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353351234568001, 1235335, 1234568001, 0, '2009-02-02 14:31:27', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353451234568008, 1235345, 1234568008, 0, '2009-02-02 14:48:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353651234567951, 1235365, 1234567951, 0, '2009-02-02 14:53:36', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353751234568003, 1235375, 1234568003, 0, '2009-02-02 14:56:02', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353751234568039, 1235375, 1234568039, 0, '2009-02-02 14:57:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353851234568039, 1235385, 1234568039, 0, '2009-02-02 15:01:55', '\0', '.');
INSERT INTO `users2sessions` VALUES(12353951234568031, 1235395, 1234568031, 0, '2009-02-02 15:02:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354051234568040, 1235405, 1234568040, 0, '2009-02-02 15:08:16', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354451234567947, 1235445, 1234567947, 0, '2009-02-02 15:26:40', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354451234567995, 1235445, 1234567995, 0, '2009-02-05 00:10:26', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354551234568041, 1235455, 1234568041, 0, '2009-02-02 15:29:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354651234568041, 1235465, 1234568041, 0, '2009-02-02 15:29:40', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354751234567951, 1235475, 1234567951, 0, '2009-02-02 15:34:25', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354851234568006, 1235485, 1234568006, 0, '2009-02-02 15:38:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12354951234567951, 1235495, 1234567951, 0, '2009-02-02 15:43:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355051234567953, 1235505, 1234567953, 0, '2009-02-02 15:38:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355151234568042, 1235515, 1234568042, 0, '2009-02-03 08:58:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355251234568041, 1235525, 1234568041, 0, '2009-02-02 15:48:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355351234568017, 1235535, 1234568017, 0, '2009-02-02 15:49:23', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355451234567971, 1235545, 1234567971, 0, '2009-02-02 15:50:00', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355551234568040, 1235555, 1234568040, 0, '2009-02-02 15:58:25', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355651234568007, 1235565, 1234568007, 0, '2009-02-02 16:04:31', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355651234568008, 1235565, 1234568008, 0, '2009-02-02 16:02:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355751234568040, 1235575, 1234568040, 0, '2009-02-02 16:04:26', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355851234568007, 1235585, 1234568007, 0, '2009-02-02 16:07:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12355951234567952, 1235595, 1234567952, 0, '2009-02-02 16:06:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356051234568030, 1235605, 1234568030, 0, '2009-02-02 16:08:46', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356151234568007, 1235615, 1234568007, 0, '2009-02-02 16:17:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356251234568000, 1235625, 1234568000, 0, '2009-02-02 16:16:17', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356451234568017, 1235645, 1234568017, 0, '2009-02-02 16:41:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356551234567947, 1235655, 1234567947, 0, '2009-02-03 16:11:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356651234567979, 1235665, 1234567979, 0, '2009-02-09 22:00:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356651234568015, 1235665, 1234568015, 0, '2009-02-02 16:29:52', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356751234567984, 1235675, 1234567984, 0, '2009-02-02 16:30:35', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356851234568031, 1235685, 1234568031, 0, '2009-02-02 16:30:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356951234567975, 1235695, 1234567975, 0, '2009-02-05 16:51:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12356951234568019, 1235695, 1234568019, 0, '2009-02-02 16:30:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357051234567963, 1235705, 1234567963, 0, '2009-02-02 16:36:49', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357151234568016, 1235715, 1234568016, 0, '2009-02-02 16:40:45', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357351234568000, 1235735, 1234568000, 0, '2009-02-02 16:54:48', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357451234567998, 1235745, 1234567998, 0, '2009-02-02 18:03:56', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357651234568005, 1235765, 1234568005, 0, '2009-02-02 17:09:20', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357651234568031, 1235765, 1234568031, 0, '2009-02-02 17:20:39', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357751234568017, 1235775, 1234568017, 0, '2009-02-03 00:21:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357851234568030, 1235785, 1234568030, 0, '2009-02-02 17:17:12', '\0', '.');
INSERT INTO `users2sessions` VALUES(12357951234567952, 1235795, 1234567952, 0, '2009-02-02 17:20:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358151234568030, 1235815, 1234568030, 0, '2009-02-02 18:04:56', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358251234568040, 1235825, 1234568040, 0, '2009-02-02 18:12:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358351234568005, 1235835, 1234568005, 0, '2009-02-02 18:18:27', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358451234568005, 1235845, 1234568005, 0, '2009-02-02 18:45:40', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358751234567952, 1235875, 1234567952, 0, '2009-02-02 19:34:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358851234567977, 1235885, 1234567977, 0, '2009-02-07 13:57:35', '\0', '.');
INSERT INTO `users2sessions` VALUES(12358951234567947, 1235895, 1234567947, 0, '2009-02-02 20:08:08', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359051234568015, 1235905, 1234568015, 0, '2009-02-02 20:30:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359051234568031, 1235905, 1234568031, 0, '2009-02-02 20:33:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359151234567953, 1235915, 1234567953, 0, '2009-02-02 20:31:49', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359251234568030, 1235925, 1234568030, 0, '2009-02-02 20:53:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359351234568029, 1235935, 1234568029, 0, '2009-02-02 21:06:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359451234568026, 1235945, 1234568026, 0, '2009-02-03 14:08:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359551234568003, 1235955, 1234568003, 0, '2009-02-02 21:29:26', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359651234568000, 1235965, 1234568000, 0, '2009-02-02 21:51:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359751234568003, 1235975, 1234568003, 0, '2009-02-02 22:03:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359751234568016, 1235975, 1234568016, 0, '2009-02-02 22:07:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359751234568040, 1235975, 1234568040, 0, '2009-02-02 22:02:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359851234568007, 1235985, 1234568007, 0, '2009-02-02 22:22:10', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359951234568031, 1235995, 1234568031, 0, '2009-02-02 23:00:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12359951234568041, 1235995, 1234568041, 0, '2009-02-02 22:57:27', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360051234567984, 1236005, 1234567984, 0, '2009-02-02 23:03:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360151234568019, 1236015, 1234568019, 0, '2009-02-02 23:25:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360251234568008, 1236025, 1234568008, 0, '2009-02-02 23:46:08', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360351234567963, 1236035, 1234567963, 0, '2009-02-03 00:17:06', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360451234568000, 1236045, 1234568000, 0, '2009-02-03 02:00:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360551234568019, 1236055, 1234568019, 0, '2009-02-03 00:45:09', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360651234568017, 1236065, 1234568017, 0, '2009-02-03 08:47:31', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360751234568011, 1236075, 1234568011, 0, '2009-02-03 08:55:28', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360851234567998, 1236085, 1234567998, 0, '2009-02-03 08:59:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360851234568042, 1236085, 1234568042, 0, '2009-02-03 08:56:39', '\0', '.');
INSERT INTO `users2sessions` VALUES(12360951234567975, 1236095, 1234567975, 0, '2009-02-05 12:04:01', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361051234568005, 1236105, 1234568005, 0, '2009-02-03 09:04:54', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361251234568003, 1236125, 1234568003, 0, '2009-02-03 09:15:47', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361351234567998, 1236135, 1234567998, 0, '2009-02-03 09:17:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361451234567989, 1236145, 1234567989, 0, '2009-02-06 14:03:10', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361551234567984, 1236155, 1234567984, 0, '2009-02-03 09:23:31', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361651234568041, 1236165, 1234568041, 0, '2009-02-03 09:22:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361751234568042, 1236175, 1234568042, 0, '2009-02-03 09:26:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361851234567944, 1236185, 1234567944, 0, '2009-02-08 23:21:52', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361851234567984, 1236185, 1234567984, 0, '2009-02-03 09:26:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12361951234568034, 1236195, 1234568034, 0, '2009-02-03 09:32:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362051234568027, 1236205, 1234568027, 0, '2009-02-03 13:40:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362151234567971, 1236215, 1234567971, 0, '2009-02-03 09:32:47', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362251234567998, 1236225, 1234567998, 0, '2009-02-03 09:37:54', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362351234568032, 1236235, 1234568032, 0, '2009-02-03 09:41:08', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362351234568034, 1236235, 1234568034, 0, '2009-02-03 09:44:10', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362451234568034, 1236245, 1234568034, 0, '2009-02-03 09:48:52', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362551234568034, 1236255, 1234568034, 0, '2009-02-03 09:48:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362651234568030, 1236265, 1234568030, 0, '2009-02-03 09:54:55', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362651234568032, 1236265, 1234568032, 0, '2009-02-03 09:54:17', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362751234568006, 1236275, 1234568006, 0, '2009-02-03 09:57:52', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362851234568006, 1236285, 1234568006, 0, '2009-02-03 10:00:12', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362951234567977, 1236295, 1234567977, 0, '2009-02-06 09:41:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362951234568006, 1236295, 1234568006, 0, '2009-02-03 10:06:05', '\0', '.');
INSERT INTO `users2sessions` VALUES(12362951234568029, 1236295, 1234568029, 0, '2009-02-03 10:05:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363051234568006, 1236305, 1234568006, 0, '2009-02-03 10:06:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363151234568032, 1236315, 1234568032, 0, '2009-02-03 10:08:26', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363251234568015, 1236325, 1234568015, 0, '2009-02-03 10:20:56', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363351234568032, 1236335, 1234568032, 0, '2009-02-03 10:21:13', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363451234568034, 1236345, 1234568034, 0, '2009-02-03 10:29:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363551234567998, 1236355, 1234567998, 0, '2009-02-03 10:29:42', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363651234568029, 1236365, 1234568029, 0, '2009-02-03 10:33:35', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363751234567963, 1236375, 1234567963, 0, '2009-02-03 10:32:09', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363951234568004, 1236395, 1234568004, 0, '2009-02-03 10:38:02', '\0', '.');
INSERT INTO `users2sessions` VALUES(12363951234568015, 1236395, 1234568015, 0, '2009-02-03 10:36:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364151234568015, 1236415, 1234568015, 0, '2009-02-03 10:41:18', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364251234568011, 1236425, 1234568011, 0, '2009-02-03 10:43:41', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364451234568013, 1236445, 1234568013, 0, '2009-02-08 13:49:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364551234568004, 1236455, 1234568004, 0, '2009-02-03 10:52:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364551234568011, 1236455, 1234568011, 0, '2009-02-03 10:49:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364651234568011, 1236465, 1234568011, 0, '2009-02-03 10:55:12', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364751234568029, 1236475, 1234568029, 0, '2009-02-03 10:59:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12364951234568028, 1236495, 1234568028, 0, '2009-02-03 11:18:01', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365051234568029, 1236505, 1234568029, 0, '2009-02-03 11:17:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365151234567973, 1236515, 1234567973, 0, '2009-02-06 12:38:35', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365251234568016, 1236525, 1234568016, 0, '2009-02-03 11:30:12', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365351234568016, 1236535, 1234568016, 0, '2009-02-03 11:38:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365451234567973, 1236545, 1234567973, 0, '2009-02-06 09:59:30', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365451234568011, 1236545, 1234568011, 0, '2009-02-03 11:50:03', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365551234568016, 1236555, 1234568016, 0, '2009-02-03 11:56:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365651234568028, 1236565, 1234568028, 0, '2009-02-03 12:01:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365751234568027, 1236575, 1234568027, 0, '2009-02-03 12:13:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12365951234568004, 1236595, 1234568004, 0, '2009-02-03 12:11:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366051234568020, 1236605, 1234568020, 0, '2009-02-06 02:13:13', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366151234568027, 1236615, 1234568027, 0, '2009-02-03 12:30:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366151234568028, 1236615, 1234568028, 0, '2009-02-03 12:30:16', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366251234568028, 1236625, 1234568028, 0, '2009-02-03 12:17:36', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366451234568004, 1236645, 1234568004, 0, '2009-02-03 12:30:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366551234568028, 1236655, 1234568028, 0, '2009-02-03 12:34:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366651234568004, 1236665, 1234568004, 0, '2009-02-03 12:46:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366751234568004, 1236675, 1234568004, 0, '2009-02-03 12:48:00', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366851234568013, 1236685, 1234568013, 0, '2009-02-05 14:07:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366851234568027, 1236685, 1234568027, 0, '2009-02-03 13:27:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366951234567953, 1236695, 1234567953, 0, '2009-02-03 13:31:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12366951234567995, 1236695, 1234567995, 0, '2009-02-03 13:33:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367051234568026, 1236705, 1234568026, 0, '2009-02-03 14:22:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367051234568027, 1236705, 1234568027, 0, '2009-02-03 14:21:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367151234567950, 1236715, 1234567950, 0, '2009-02-06 10:21:48', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367151234568026, 1236715, 1234568026, 0, '2009-02-03 14:33:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367251234568021, 1236725, 1234568021, 0, '2009-02-06 11:52:48', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367251234568026, 1236725, 1234568026, 0, '2009-02-03 14:33:52', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367351234567956, 1236735, 1234567956, 0, '2009-02-03 14:49:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367551234568026, 1236755, 1234568026, 0, '2009-02-03 15:43:40', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367651234567979, 1236765, 1234567979, 0, '2009-02-09 17:30:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367651234568021, 1236765, 1234568021, 0, '2009-02-06 10:23:16', '\0', '.');
INSERT INTO `users2sessions` VALUES(12367951234567976, 1236795, 1234567976, 0, '2009-02-05 21:29:18', '\0', '.');
INSERT INTO `users2sessions` VALUES(12368051234568012, 1236805, 1234568012, 0, '2009-02-06 14:02:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12368251234568020, 1236825, 1234568020, 0, '2009-02-05 18:48:04', '\0', '.');
INSERT INTO `users2sessions` VALUES(12368651234567979, 1236865, 1234567979, 0, '2009-02-10 11:13:20', '\0', '.');
INSERT INTO `users2sessions` VALUES(12368751234567954, 1236875, 1234567954, 0, '2009-02-05 17:33:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12368851234567963, 1236885, 1234567963, 0, '2009-02-03 20:15:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369051234567977, 1236905, 1234567977, 0, '2009-02-06 11:40:07', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369151234567963, 1236915, 1234567963, 0, '2009-02-03 21:50:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369251234568012, 1236925, 1234568012, 0, '2009-02-08 16:32:05', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369351234567952, 1236935, 1234567952, 0, '2009-02-03 22:09:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369451234567950, 1236945, 1234567950, 0, '2009-02-06 10:34:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369551234567977, 1236955, 1234567977, 0, '2009-02-08 13:53:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369751234568020, 1236975, 1234568020, 0, '2009-02-05 19:49:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12369951234568020, 1236995, 1234568020, 0, '2009-02-05 18:20:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12370051234568020, 1237005, 1234568020, 0, '2009-02-06 00:16:46', '\0', '.');
INSERT INTO `users2sessions` VALUES(12370151234567944, 1237015, 1234567944, 0, '2009-02-04 00:13:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12370251234567995, 1237025, 1234567995, 0, '2009-02-04 01:49:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371151234567953, 1237115, 1234567953, 0, '2009-02-04 12:42:36', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371251234568012, 1237125, 1234568012, 0, '2009-02-08 18:48:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371451234567954, 1237145, 1234567954, 0, '2009-02-05 18:36:40', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371451234568013, 1237145, 1234568013, 0, '2009-02-05 18:38:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371551234568021, 1237155, 1234568021, 0, '2009-02-05 10:59:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371851234567984, 1237185, 1234567984, 0, '2009-02-04 16:15:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12371951234567957, 1237195, 1234567957, 0, '2009-02-04 16:45:27', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372051234568021, 1237205, 1234568021, 0, '2009-02-05 23:49:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372251234568013, 1237225, 1234568013, 0, '2009-02-06 19:07:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372451234567954, 1237245, 1234567954, 0, '2009-02-05 23:32:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372651234567983, 1237265, 1234567983, 0, '2009-02-10 15:23:53', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372951234567973, 1237295, 1234567973, 0, '2009-02-06 12:04:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12372951234567976, 1237295, 1234567976, 0, '2009-02-06 12:04:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373151234567975, 1237315, 1234567975, 0, '2009-02-06 11:57:06', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373151234568013, 1237315, 1234568013, 0, '2009-02-06 11:57:49', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373251234567954, 1237325, 1234567954, 0, '2009-02-06 00:05:39', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373451234567954, 1237345, 1234567954, 0, '2009-02-05 12:20:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373551234567956, 1237355, 1234567956, 0, '2009-02-05 10:34:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373751234567973, 1237375, 1234567973, 0, '2009-02-05 13:34:18', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373851234567950, 1237385, 1234567950, 0, '2009-02-05 15:07:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12373951234567975, 1237395, 1234567975, 0, '2009-02-05 15:49:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12374251234567944, 1237425, 1234567944, 0, '2009-02-08 22:10:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12374451234567956, 1237445, 1234567956, 0, '2009-02-06 09:28:26', '\0', '.');
INSERT INTO `users2sessions` VALUES(12374651234567976, 1237465, 1234567976, 0, '2009-02-06 09:50:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12374751234567976, 1237475, 1234567976, 0, '2009-02-06 09:52:32', '\0', '.');
INSERT INTO `users2sessions` VALUES(12374951234567957, 1237495, 1234567957, 0, '2009-02-06 10:12:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375051234568021, 1237505, 1234568021, 0, '2009-02-06 10:21:15', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375151234567950, 1237515, 1234567950, 0, '2009-02-06 11:43:28', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375251234567950, 1237525, 1234567950, 0, '2009-02-06 11:41:28', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375351234567975, 1237535, 1234567975, 0, '2009-02-06 12:20:01', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375651234567973, 1237565, 1234567973, 0, '2009-02-06 12:46:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375751234567977, 1237575, 1234567977, 0, '2009-02-06 12:48:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375851234567976, 1237585, 1234567976, 0, '2009-02-06 14:12:12', '\0', '.');
INSERT INTO `users2sessions` VALUES(12375951234567956, 1237595, 1234567956, 0, '2009-02-06 14:47:37', '\0', '.');
INSERT INTO `users2sessions` VALUES(12376051234567989, 1237605, 1234567989, 0, '2009-02-06 14:49:43', '\0', '.');
INSERT INTO `users2sessions` VALUES(12376351234567989, 1237635, 1234567989, 0, '2009-02-07 19:32:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12376451234567989, 1237645, 1234567989, 0, '2009-02-07 23:42:30', '\0', '.');
INSERT INTO `users2sessions` VALUES(12376651234567995, 1237665, 1234567995, 0, '2009-02-08 15:39:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12376851234567989, 1237685, 1234567989, 0, '2009-02-08 18:03:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378051234567983, 1237805, 1234567983, 0, '2009-02-09 15:10:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378151234567983, 1237815, 1234567983, 0, '2009-02-09 21:48:51', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378651234567897, 1237865, 1234567897, 0, '2009-02-13 11:10:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378651234567908, 1237865, 1234567908, 0, '2009-02-13 11:08:08', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378651234567937, 1237865, 1234567937, 0, '2009-02-13 11:11:41', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378851234567906, 1237885, 1234567906, 0, '2009-02-13 13:23:59', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378851234567935, 1237885, 1234567935, 0, '2009-02-13 13:27:11', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378851234567938, 1237885, 1234567938, 0, '2009-02-13 13:28:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12378951234567935, 1237895, 1234567935, 0, '2009-02-13 17:52:23', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379051234567935, 1237905, 1234567935, 0, '2009-02-14 00:57:22', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379151234567914, 1237915, 1234567914, 0, '2009-02-14 14:34:47', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379251234567913, 1237925, 1234567913, 0, '2009-02-14 18:31:34', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379351234567913, 1237935, 1234567913, 0, '2009-02-14 17:19:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379451234567913, 1237945, 1234567913, 0, '2009-02-14 19:47:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379551234567908, 1237955, 1234567908, 0, '2009-02-14 20:22:09', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379651234567914, 1237965, 1234567914, 0, '2009-02-14 22:54:45', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379651234567936, 1237965, 1234567936, 0, '2009-02-14 22:53:47', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379651234567938, 1237965, 1234567938, 0, '2009-02-14 22:55:56', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379751234567936, 1237975, 1234567936, 0, '2009-02-15 00:18:03', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379751234567938, 1237975, 1234567938, 0, '2009-02-15 00:19:33', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379851234567913, 1237985, 1234567913, 0, '2009-02-15 10:31:41', '\0', '.');
INSERT INTO `users2sessions` VALUES(12379951234567914, 1237995, 1234567914, 0, '2009-02-15 11:16:17', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380051234567914, 1238005, 1234567914, 0, '2009-02-15 11:53:19', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380251234567935, 1238025, 1234567935, 0, '2009-02-16 10:44:09', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380351234567937, 1238035, 1234567937, 0, '2009-02-15 16:21:50', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380451234567935, 1238045, 1234567935, 0, '2009-02-15 17:41:29', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380551234567914, 1238055, 1234567914, 0, '2009-02-15 17:06:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380751234567938, 1238075, 1234567938, 0, '2009-02-15 19:37:17', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380851234567937, 1238085, 1234567937, 0, '2009-02-15 22:07:21', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380851234567938, 1238085, 1234567938, 0, '2009-02-15 22:07:25', '\0', '.');
INSERT INTO `users2sessions` VALUES(12380951234567913, 1238095, 1234567913, 0, '2009-02-16 00:13:38', '\0', '.');
INSERT INTO `users2sessions` VALUES(12381051234567937, 1238105, 1234567937, 0, '2009-02-16 13:14:28', '\0', '.');
INSERT INTO `users2sessions` VALUES(12381151234567936, 1238115, 1234567936, 0, '2009-02-16 14:28:13', '\0', '.');
INSERT INTO `users2sessions` VALUES(12381351234567937, 1238135, 1234567937, 0, '2009-02-16 16:01:58', '\0', '.');
INSERT INTO `users2sessions` VALUES(12381551234567936, 1238155, 1234567936, 0, '2009-02-17 02:50:08', '\0', '.');
INSERT INTO `users2sessions` VALUES(12381651234567936, 1238165, 1234567936, 0, '2009-02-17 09:01:57', '\0', '.');

-- --------------------------------------------------------

--
-- Table structure for table `users2tools`
--

CREATE TABLE IF NOT EXISTS `users2tools` (
  `user2tool_id` smallint(4) unsigned NOT NULL,
  `role_id` tinyint(1) unsigned NOT NULL,
  `tool_id` smallint(3) unsigned NOT NULL,
  `disable_u2t` bit(1) NOT NULL default '\0',
  `default_u2t` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`user2tool_id`),
  UNIQUE KEY `users2tools_ui` (`role_id`,`tool_id`),
  KEY `users2tools_fk2` (`tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci COMMENT='creates a relationship between a user role and the tools tha';

--
-- Dumping data for table `users2tools`
--

INSERT INTO `users2tools` VALUES(1123, 1, 123, '\0', '\0');
INSERT INTO `users2tools` VALUES(1124, 1, 124, '\0', '\0');
INSERT INTO `users2tools` VALUES(1125, 1, 125, '\0', '\0');
INSERT INTO `users2tools` VALUES(1126, 1, 126, '\0', '\0');
INSERT INTO `users2tools` VALUES(1127, 1, 127, '\0', '\0');
INSERT INTO `users2tools` VALUES(1128, 1, 128, '\0', '\0');
INSERT INTO `users2tools` VALUES(1129, 1, 129, '\0', '\0');
INSERT INTO `users2tools` VALUES(1130, 1, 130, '\0', '\0');
INSERT INTO `users2tools` VALUES(1131, 1, 131, '\0', '\0');
INSERT INTO `users2tools` VALUES(1223, 1, 223, '\0', '\0');
INSERT INTO `users2tools` VALUES(1224, 1, 224, '\0', '\0');
INSERT INTO `users2tools` VALUES(1225, 1, 225, '\0', '\0');
INSERT INTO `users2tools` VALUES(1226, 1, 226, '\0', '\0');
INSERT INTO `users2tools` VALUES(1227, 1, 227, '\0', '\0');
INSERT INTO `users2tools` VALUES(1228, 1, 228, '\0', '\0');
INSERT INTO `users2tools` VALUES(1229, 1, 229, '\0', '\0');
INSERT INTO `users2tools` VALUES(1230, 1, 230, '\0', '\0');
INSERT INTO `users2tools` VALUES(1231, 1, 231, '\0', '\0');
INSERT INTO `users2tools` VALUES(2123, 2, 123, '\0', '\0');
INSERT INTO `users2tools` VALUES(2124, 2, 124, '\0', '\0');
INSERT INTO `users2tools` VALUES(2125, 2, 125, '\0', '\0');
INSERT INTO `users2tools` VALUES(2126, 2, 126, '\0', '\0');
INSERT INTO `users2tools` VALUES(2127, 2, 127, '\0', '\0');
INSERT INTO `users2tools` VALUES(2128, 2, 128, '.', '\0');
INSERT INTO `users2tools` VALUES(2129, 2, 129, '.', '\0');
INSERT INTO `users2tools` VALUES(2130, 2, 130, '.', '\0');
INSERT INTO `users2tools` VALUES(2131, 2, 131, '.', '\0');
INSERT INTO `users2tools` VALUES(2223, 2, 223, '\0', '\0');
INSERT INTO `users2tools` VALUES(2224, 2, 224, '.', '\0');
INSERT INTO `users2tools` VALUES(2225, 2, 225, '\0', '\0');
INSERT INTO `users2tools` VALUES(2226, 2, 226, '\0', '\0');
INSERT INTO `users2tools` VALUES(2227, 2, 227, '\0', '\0');
INSERT INTO `users2tools` VALUES(2228, 2, 228, '.', '\0');
INSERT INTO `users2tools` VALUES(2229, 2, 229, '.', '\0');
INSERT INTO `users2tools` VALUES(2230, 2, 230, '.', '\0');
INSERT INTO `users2tools` VALUES(2231, 2, 231, '.', '\0');
INSERT INTO `users2tools` VALUES(3123, 3, 123, '\0', '\0');
INSERT INTO `users2tools` VALUES(3124, 3, 124, '.', '\0');
INSERT INTO `users2tools` VALUES(3125, 3, 125, '\0', '\0');
INSERT INTO `users2tools` VALUES(3126, 3, 126, '\0', '\0');
INSERT INTO `users2tools` VALUES(3127, 3, 127, '\0', '\0');
INSERT INTO `users2tools` VALUES(3128, 3, 128, '.', '\0');
INSERT INTO `users2tools` VALUES(3129, 3, 129, '.', '\0');
INSERT INTO `users2tools` VALUES(3130, 3, 130, '.', '\0');
INSERT INTO `users2tools` VALUES(3131, 3, 131, '.', '\0');
INSERT INTO `users2tools` VALUES(3223, 3, 223, '\0', '\0');
INSERT INTO `users2tools` VALUES(3224, 3, 224, '.', '\0');
INSERT INTO `users2tools` VALUES(3225, 3, 225, '.', '\0');
INSERT INTO `users2tools` VALUES(3226, 3, 226, '\0', '\0');
INSERT INTO `users2tools` VALUES(3227, 3, 227, '\0', '\0');
INSERT INTO `users2tools` VALUES(3228, 3, 228, '.', '\0');
INSERT INTO `users2tools` VALUES(3229, 3, 229, '.', '\0');
INSERT INTO `users2tools` VALUES(3230, 3, 230, '.', '\0');
INSERT INTO `users2tools` VALUES(3231, 3, 231, '.', '\0');
INSERT INTO `users2tools` VALUES(4123, 4, 123, '\0', '\0');
INSERT INTO `users2tools` VALUES(4124, 4, 124, '.', '\0');
INSERT INTO `users2tools` VALUES(4125, 4, 125, '.', '\0');
INSERT INTO `users2tools` VALUES(4126, 4, 126, '.', '\0');
INSERT INTO `users2tools` VALUES(4127, 4, 127, '\0', '\0');
INSERT INTO `users2tools` VALUES(4128, 4, 128, '.', '\0');
INSERT INTO `users2tools` VALUES(4129, 4, 129, '.', '\0');
INSERT INTO `users2tools` VALUES(4130, 4, 130, '.', '\0');
INSERT INTO `users2tools` VALUES(4131, 4, 131, '.', '\0');
INSERT INTO `users2tools` VALUES(4223, 4, 223, '\0', '\0');
INSERT INTO `users2tools` VALUES(4224, 4, 224, '.', '\0');
INSERT INTO `users2tools` VALUES(4225, 4, 225, '.', '\0');
INSERT INTO `users2tools` VALUES(4226, 4, 226, '.', '\0');
INSERT INTO `users2tools` VALUES(4227, 4, 227, '.', '\0');
INSERT INTO `users2tools` VALUES(4228, 4, 228, '.', '\0');
INSERT INTO `users2tools` VALUES(4229, 4, 229, '.', '\0');
INSERT INTO `users2tools` VALUES(4230, 4, 230, '.', '\0');
INSERT INTO `users2tools` VALUES(4231, 4, 231, '.', '\0');
INSERT INTO `users2tools` VALUES(5123, 5, 123, '.', '\0');
INSERT INTO `users2tools` VALUES(5124, 5, 124, '.', '\0');
INSERT INTO `users2tools` VALUES(5125, 5, 125, '.', '\0');
INSERT INTO `users2tools` VALUES(5126, 5, 126, '.', '\0');
INSERT INTO `users2tools` VALUES(5127, 5, 127, '\0', '\0');
INSERT INTO `users2tools` VALUES(5128, 5, 128, '.', '\0');
INSERT INTO `users2tools` VALUES(5129, 5, 129, '.', '\0');
INSERT INTO `users2tools` VALUES(5130, 5, 130, '.', '\0');
INSERT INTO `users2tools` VALUES(5131, 5, 131, '.', '\0');
INSERT INTO `users2tools` VALUES(5223, 5, 223, '.', '\0');
INSERT INTO `users2tools` VALUES(5224, 5, 224, '.', '\0');
INSERT INTO `users2tools` VALUES(5225, 5, 225, '.', '\0');
INSERT INTO `users2tools` VALUES(5226, 5, 226, '.', '\0');
INSERT INTO `users2tools` VALUES(5227, 5, 227, '.', '\0');
INSERT INTO `users2tools` VALUES(5228, 5, 228, '.', '\0');
INSERT INTO `users2tools` VALUES(5229, 5, 229, '.', '\0');
INSERT INTO `users2tools` VALUES(5230, 5, 230, '.', '\0');
INSERT INTO `users2tools` VALUES(5231, 5, 231, '.', '\0');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_fk` FOREIGN KEY (`camp_id`) REFERENCES `campuses` (`camp_id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_fk` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_fk` FOREIGN KEY (`camp_id`) REFERENCES `campuses` (`camp_id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_fk1` FOREIGN KEY (`crse_id`) REFERENCES `courses` (`crse_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_fk2` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_fk` FOREIGN KEY (`buil_id`) REFERENCES `buildings` (`buil_id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_fk1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sessions_fk2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `sys_config`
--
ALTER TABLE `sys_config`
  ADD CONSTRAINT `sys_config_fk1` FOREIGN KEY (`tool_id`) REFERENCES `sys_tools` (`tool_id`) ON DELETE CASCADE;

--
-- Constraints for table `sys_messages`
--
ALTER TABLE `sys_messages`
  ADD CONSTRAINT `sys_messages_fk` FOREIGN KEY (`tool_id`) REFERENCES `sys_tools` (`tool_id`) ON DELETE CASCADE;

--
-- Constraints for table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_fk1` FOREIGN KEY (`peri_id`) REFERENCES `periods` (`peri_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terms_fk2` FOREIGN KEY (`sect_id`) REFERENCES `sections` (`sect_id`) ON DELETE CASCADE;

--
-- Constraints for table `users2courses`
--
ALTER TABLE `users2courses`
  ADD CONSTRAINT `users2courses_fk1` FOREIGN KEY (`user2role_id`) REFERENCES `users2roles` (`user2role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2courses_fk2` FOREIGN KEY (`crse_id`) REFERENCES `courses` (`crse_id`) ON DELETE CASCADE;

--
-- Constraints for table `users2departments`
--
ALTER TABLE `users2departments`
  ADD CONSTRAINT `users2departments_fk1` FOREIGN KEY (`user2role_id`) REFERENCES `users2roles` (`user2role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2departments_fk2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `users2exams`
--
ALTER TABLE `users2exams`
  ADD CONSTRAINT `users2exams_fk1` FOREIGN KEY (`user2role_id`) REFERENCES `users2roles` (`user2role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2exams_fk2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE;

--
-- Constraints for table `users2roles`
--
ALTER TABLE `users2roles`
  ADD CONSTRAINT `users2roles_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2roles_fk2` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`role_id`) ON DELETE CASCADE;

--
-- Constraints for table `users2tools`
--
ALTER TABLE `users2tools`
  ADD CONSTRAINT `users2tools_fk1` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users2tools_fk2` FOREIGN KEY (`tool_id`) REFERENCES `sys_tools` (`tool_id`) ON DELETE CASCADE;
