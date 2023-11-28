-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cee_db
CREATE DATABASE IF NOT EXISTS `cee_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cee_db`;

-- Dumping structure for table cee_db.admin_acc
CREATE TABLE IF NOT EXISTS `admin_acc` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(1000) NOT NULL,
  `admin_pass` varchar(1000) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.admin_acc: ~0 rows (approximately)
INSERT INTO `admin_acc` (`admin_id`, `admin_user`, `admin_pass`) VALUES
	(1, 'admin@username', '123');

-- Dumping structure for table cee_db.course_tbl
CREATE TABLE IF NOT EXISTS `course_tbl` (
  `cou_id` int(11) NOT NULL AUTO_INCREMENT,
  `cou_name` varchar(1000) NOT NULL,
  `cou_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.course_tbl: ~4 rows (approximately)
INSERT INTO `course_tbl` (`cou_id`, `cou_name`, `cou_created`) VALUES
	(66, 'DBMS', '2021-09-02 16:55:27'),
	(67, 'JAVA', '2021-09-04 11:21:53');

-- Dumping structure for table cee_db.examinee_tbl
CREATE TABLE IF NOT EXISTS `examinee_tbl` (
  `exmne_id` int(11) NOT NULL AUTO_INCREMENT,
  `exmne_fullname` varchar(1000) NOT NULL,
  `exmne_course` varchar(1000) NOT NULL,
  `exmne_gender` varchar(1000) NOT NULL,
  `exmne_birthdate` varchar(1000) NOT NULL,
  `exmne_year_level` varchar(1000) NOT NULL,
  `exmne_email` varchar(1000) NOT NULL,
  `exmne_password` varchar(1000) NOT NULL,
  `exmne_status` varchar(1000) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`exmne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.examinee_tbl: ~7 rows (approximately)
INSERT INTO `examinee_tbl` (`exmne_id`, `exmne_fullname`, `exmne_course`, `exmne_gender`, `exmne_birthdate`, `exmne_year_level`, `exmne_email`, `exmne_password`, `exmne_status`) VALUES
	(11, 'A', '67', 'male', '2021-09-03', 'first year', 'a@gmail.com', '123', 'active');

-- Dumping structure for table cee_db.exam_answers
CREATE TABLE IF NOT EXISTS `exam_answers` (
  `exans_id` int(11) NOT NULL AUTO_INCREMENT,
  `axmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `exans_answer` varchar(1000) NOT NULL,
  `exans_status` varchar(1000) NOT NULL DEFAULT 'new',
  `exans_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`exans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.exam_answers: ~37 rows (approximately)
INSERT INTO `exam_answers` (`exans_id`, `axmne_id`, `exam_id`, `quest_id`, `exans_answer`, `exans_status`, `exans_created`) VALUES
	(21, 11, 29, 43, 'abcd', 'new', '2022-08-22 11:19:31');

-- Dumping structure for table cee_db.exam_attempt
CREATE TABLE IF NOT EXISTS `exam_attempt` (
  `examat_id` int(11) NOT NULL AUTO_INCREMENT,
  `exmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `examat_status` varchar(1000) NOT NULL DEFAULT 'used',
  `video` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`examat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.exam_attempt: ~9 rows (approximately)
INSERT INTO `exam_attempt` (`examat_id`, `exmne_id`, `exam_id`, `examat_status`, `video`) VALUES
	(51, 11, 29, 'used', NULL);

-- Dumping structure for table cee_db.exam_question_tbl
CREATE TABLE IF NOT EXISTS `exam_question_tbl` (
  `eqt_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `exam_question` varchar(1000) NOT NULL,
  `exam_ch1` varchar(1000) NOT NULL,
  `exam_ch2` varchar(1000) NOT NULL,
  `exam_ch3` varchar(1000) NOT NULL,
  `exam_ch4` varchar(1000) NOT NULL,
  `exam_answer` varchar(1000) NOT NULL,
  `exam_status` varchar(1000) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`eqt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.exam_question_tbl: ~30 rows (approximately)
INSERT INTO `exam_question_tbl` (`eqt_id`, `exam_id`, `exam_question`, `exam_ch1`, `exam_ch2`, `exam_ch3`, `exam_ch4`, `exam_answer`, `exam_status`) VALUES
	(31, 28, 'what is java', 'it is lanagauge', 'high level language', 'low level language', 'its just name', 'high level language', 'active');

-- Dumping structure for table cee_db.exam_tbl
CREATE TABLE IF NOT EXISTS `exam_tbl` (
  `ex_id` int(11) NOT NULL AUTO_INCREMENT,
  `cou_id` int(11) NOT NULL,
  `ex_title` varchar(1000) NOT NULL,
  `ex_time_limit` varchar(1000) NOT NULL,
  `ex_questlimit_display` int(11) NOT NULL,
  `ex_description` varchar(1000) NOT NULL,
  `dt` varchar(1000) NOT NULL,
  `ex_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.exam_tbl: ~13 rows (approximately)
INSERT INTO `exam_tbl` (`ex_id`, `cou_id`, `ex_title`, `ex_time_limit`, `ex_questlimit_display`, `ex_description`, `dt`, `ex_created`) VALUES
	(11, 67, 'Java Basic exam', '10', 3, 'this is java basic exam', '2022-08-26T20:02', '2022-08-26 14:31:12'),
	(12, 67, 'JAVA Script', '10', 10, 'This is JAVA Examination', '2022-08-26T19:29', '2022-08-26 14:19:19');

-- Dumping structure for table cee_db.feedbacks_tbl
CREATE TABLE IF NOT EXISTS `feedbacks_tbl` (
  `fb_id` int(11) NOT NULL AUTO_INCREMENT,
  `exmne_id` int(11) NOT NULL,
  `fb_exmne_as` varchar(1000) NOT NULL,
  `fb_feedbacks` varchar(1000) NOT NULL,
  `fb_date` varchar(1000) NOT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table cee_db.feedbacks_tbl: ~10 rows (approximately)
INSERT INTO `feedbacks_tbl` (`fb_id`, `exmne_id`, `fb_exmne_as`, `fb_feedbacks`, `fb_date`) VALUES
	(11, 10, 'Annappa', 'dfgsdgsdg', 'September 30, 2021');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
