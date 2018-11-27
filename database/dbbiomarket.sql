-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 25, 2018 at 08:29 PM
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
-- Database: `dbbiomarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_tmp`
--

DROP TABLE IF EXISTS `cart_tmp`;
CREATE TABLE IF NOT EXISTS `cart_tmp` (
  `crt_id` int(11) NOT NULL,
  `crt_ln` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `ord_qty` int(8) NOT NULL,
  PRIMARY KEY (`crt_ln`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `ord_num` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `ord_dte` date NOT NULL,
  `sts` enum('ORDERED','SHIPPED','DELIVERED') NOT NULL,
  PRIMARY KEY (`ord_num`),
  KEY `usr_id` (`usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_line`
--

DROP TABLE IF EXISTS `customer_order_line`;
CREATE TABLE IF NOT EXISTS `customer_order_line` (
  `ord_num` int(11) NOT NULL,
  `ord_ln` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `ord_qty` int(8) NOT NULL,
  PRIMARY KEY (`ord_ln`),
  KEY `ord_num` (`ord_num`),
  KEY `prod_id` (`prod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(50) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `prod_dsc` varchar(255) NOT NULL,
  `prod_img` text NOT NULL,
  `cat_id` enum('BAKERY','DRINKS','VEGETABLES','DAIRY') NOT NULL,
  `sto_qty` int(8) NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `sup_id` (`sup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `price`, `sup_id`, `prod_dsc`, `prod_img`, `cat_id`, `sto_qty`) VALUES
(11, 'Bread with raisins', '1.00', 1, 'Really nice product description forBread with raisins', 'img/uploads/5bf88b559ea667.48662713.jpg', 'BAKERY', 100),
(12, 'Broccoli Pie', '1.50', 2, 'Really nice product description forBroccoli Pie', 'img/uploads/5bf88b6ec3dd81.15207689.jpg', 'DAIRY', 20),
(13, 'Flapjack', '1.60', 3, 'Really nice product description forFlapjack', 'img/uploads/5bf88b84777d67.93455203.jpg', 'VEGETABLES', 50),
(14, 'Coconut Bars', '2.00', 4, 'Really nice product description forCoconut Bars', 'img/uploads/5bf88b966bfa55.36369987.jpg', 'DRINKS', 150),
(15, 'French Baguette', '2.50', 1, 'Really nice product description forFrench Baguette', 'img/uploads/5bf88ba6cde6d8.78539693.jpg', 'BAKERY', 60),
(16, 'Raspberry Pie', '2.77', 2, 'Really nice product description forRaspberry Pie', 'img/uploads/5bf88c25f08606.35067482.jpg', 'DAIRY', 60),
(17, 'apple', '3.12', 3, 'Really nice product description forapple', 'img/uploads/5bf9150b86c0d9.05054900.jpg', 'VEGETABLES', 55),
(18, 'Veggie Pastrie', '3.47', 4, 'Really nice product description forVeggie Pastrie', 'img/uploads/5bf9296478c889.76572749.jpg', 'DRINKS', 32),
(19, 'Organic Cola', '3.82', 1, 'Really nice product description forOrganic Cola', 'img/uploads/5bf97a7095cdd2.86662407.jpg', 'BAKERY', 12);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_email` varchar(80) NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `sup_email`) VALUES
(1, 'Real Bakery', 'Rbakery@bake.com'),
(2, 'Organic Drink Corp', 'Odrink@drinkcorp.com'),
(3, 'Fresh Veggie', 'Fveggie@veggie.com'),
(4, 'Happy Cows Dairy', 'happycow@dairy.com');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ord`
--

DROP TABLE IF EXISTS `supplier_ord`;
CREATE TABLE IF NOT EXISTS `supplier_ord` (
  `sup_ord_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `sts` enum('SUBMITED','CLOSED') NOT NULL,
  `ord_dte` date NOT NULL,
  PRIMARY KEY (`sup_ord_id`),
  KEY `sup_id` (`sup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ord_ln`
--

DROP TABLE IF EXISTS `supplier_ord_ln`;
CREATE TABLE IF NOT EXISTS `supplier_ord_ln` (
  `sup_ord_ln` int(11) NOT NULL,
  `sup_ord_id` int(11) NOT NULL,
  `ord_qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`sup_ord_ln`),
  KEY `sup_ord_id` (`sup_ord_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sup_ord_tmp`
--

DROP TABLE IF EXISTS `sup_ord_tmp`;
CREATE TABLE IF NOT EXISTS `sup_ord_tmp` (
  `sup_ord_id` int(11) NOT NULL,
  `ord_ln` int(11) NOT NULL AUTO_INCREMENT,
  `ord_qty` int(8) NOT NULL,
  `prod_id` int(11) NOT NULL,
  PRIMARY KEY (`ord_ln`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `e_mail` varchar(80) NOT NULL,
  `phn_num` varchar(11) NOT NULL,
  `dob` date NOT NULL,
  `adr_ln_1` varchar(60) NOT NULL,
  `adr_ln_2` varchar(60) DEFAULT NULL,
  `pstcod` varchar(10) NOT NULL,
  `lvl` enum('MEMBER','ADMIN') NOT NULL DEFAULT 'MEMBER',
  `pswrd` varchar(255) NOT NULL,
  `acc_crt_dte` datetime NOT NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `e_mail` (`e_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
