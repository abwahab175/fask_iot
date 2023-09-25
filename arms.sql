-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2023 at 09:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arms`
--

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `deviceID` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `humidity` int(11) DEFAULT NULL,
  `moisture` int(11) DEFAULT NULL,
  `light` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`deviceID`, `username`, `field_name`, `temperature`, `humidity`, `moisture`, `light`) VALUES
('ARMS12012', 'amansingh', 'Rose Garden', 45, 54, 100, 600),
('ARMS22212', 'hellboy', 'Samy Garden', 45, 54, 100, 600);

-- --------------------------------------------------------

--
-- Table structure for table `rosegarden`
--

CREATE TABLE `rosegarden` (
  `deviceID` varchar(255) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `humidity` int(11) DEFAULT NULL,
  `moisture` int(11) DEFAULT NULL,
  `light` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rosegarden`
--

INSERT INTO `rosegarden` (`deviceID`, `temperature`, `humidity`, `moisture`, `light`, `date_time`) VALUES
('ARMS12012', 45, 54, 100, 600, '2023-09-26 00:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `first_name`, `Last_name`, `email`, `phone_number`, `last_login`, `api_key`) VALUES
('amansingh', '$6$rounds=656000$gKdT0R53IpSXlCcC$a248UK/uUbgyvKfQHEhHBagdboc2kLb2vzOs.BNR27cTC0hd9j9Yh8n2Ma/nYJdg0INVUXjBIraeTqZt3KbSb/', 'Aman', 'Singh', 'singhaman11415@gmail.com', '8770262013', '2023-09-26 00:40:27', 'abhikuchnhihai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`deviceID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `rosegarden`
--
ALTER TABLE `rosegarden`
  ADD KEY `deviceID` (`deviceID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`,`api_key`),
  ADD UNIQUE KEY `username` (`username`,`api_key`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `node`
--
ALTER TABLE `node`
  ADD CONSTRAINT `node_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `rosegarden`
--
ALTER TABLE `rosegarden`
  ADD CONSTRAINT `rosegarden_ibfk_1` FOREIGN KEY (`deviceID`) REFERENCES `node` (`deviceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
