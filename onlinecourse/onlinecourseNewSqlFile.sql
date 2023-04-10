-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 09:22 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_reg_no` varchar(255) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `courses_allocated_id` int(11) NOT NULL COMMENT 'course codes',
  `enrolment_status` tinyint(1) NOT NULL,
  `optional_core_choice_1` varchar(50) DEFAULT NULL,
  `optional_core_choice_2` int(50) DEFAULT NULL,
  `optional_core_choice_3` int(50) DEFAULT NULL,
  `password_status` tinyint(1) NOT NULL DEFAULT 0,
  `creationdate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_reg_no`, `stream_id`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `courses_allocated_id`, `enrolment_status`, `optional_core_choice_1`, `optional_core_choice_2`, `optional_core_choice_3`, `password_status`, `creationdate`, `updationDate`) VALUES
('11233', 1, NULL, 'Test@123', 'seee', '651773', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, '2023-04-02 10:12:45', NULL),
('12356', 2, NULL, '123456', 'ayushi', '181793', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, '2023-04-02 09:58:10', '02-04-2023 04:22:17 PM'),
('21mcmc12', 1, '', 'Test@123', 'Joel', '932894', NULL, NULL, NULL, '9.00', 0, 0, NULL, NULL, NULL, 1, '2023-04-03 16:32:37', '03-04-2023 10:04:48 PM'),
('21mcmc45', 1, NULL, '96325', 'Mridani', '613518', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, '2023-04-06 05:55:09', NULL),
('21mcmc56', 1, NULL, '2586', 'john', '139831', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, '2023-04-06 10:44:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_reg_no`),
  ADD KEY `stream_id` (`stream_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`stream_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
