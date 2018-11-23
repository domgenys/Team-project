-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 23, 2018 at 03:38 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biomarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `phone` text NOT NULL,
  `house_no` text NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `postcode` text NOT NULL,
  `level` enum('admin','member') NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `dob`, `phone`, `house_no`, `street`, `city`, `postcode`, `level`, `join_date`) VALUES
(1, 'admin@biomarket.co.uk', '$2y$10$nm9heArrNVNrm4QTPKBfFeqoHmi.8zaxCeRsF/6PnXSON4fDMpGz.', 'Admin', 'BioMarket', '2018-10-06', '20 8231 2468', 'University of West London', 'St. Mary Road, Eailing', 'London', 'W5 5RF', 'admin', '2018-11-23 14:18:56'),
(2, 'edit.egri@yahoo.co.uk', '$2y$10$NeUoE2ta0ivz6oQacS2touhlsF/T3qImYddEuaiS5D0uKoS8CI3Jq', 'Edit', 'Egri', '2018-11-03', '123456789', '44', 'Staines Road', 'London', 'W5 5RF', 'member', '2018-11-23 14:21:22'),
(3, 'eyler@freemail.hu', '$2y$10$dfYIBMNUJRNPNzOdWia2muXfHt9uyZ3ktfLzd1lk5y.xHSTpmMEWi', 'James', 'Brown', '2018-11-05', '20 8231 2468', '111', 'High', 'London', 'Uhdf5 6hf', 'member', '2018-11-23 14:24:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
