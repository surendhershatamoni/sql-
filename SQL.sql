-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 21, 2023 at 10:44 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agent_code` char(50) NOT NULL,
  `agent_name` char(50) DEFAULT NULL,
  `working_area` char(50) DEFAULT NULL,
  `comission` varchar(11) DEFAULT NULL,
  `phone_number` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agent_code`, `agent_name`, `working_area`, `comission`, `phone_number`) VALUES
('A01', 'Andrew', 'London', '2%', '07635971237'),
('A02', 'Helena', 'Manchester', '3%', '07436432564'),
('A03', 'Rickey', 'York', '2.5%', '07436437644'),
('A04', 'Melvin', 'Birmingham', '0.5%', '07871432564'),
('A05', 'Kris', 'Wales', '3%', '07436432564');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_code` int(11) NOT NULL,
  `cust_name` varchar(40) NOT NULL,
  `cust_city` char(35) DEFAULT NULL,
  `working_area` varchar(55) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `opening_amount` float NOT NULL,
  `receive_amount` float NOT NULL,
  `payment_amount` float NOT NULL,
  `outstanding_amount` float NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `agent_code` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_code`, `cust_name`, `cust_city`, `working_area`, `grade`, `opening_amount`, `receive_amount`, `payment_amount`, `outstanding_amount`, `phone_number`, `agent_code`) VALUES
(1, 'Pedro', 'York', 'York', 2, 2000, 1000, 3000, 2000, '07425686433', 'A04'),
(2, 'Curt', 'Wales', 'Wales', 1, 3000, 4000, 1000, 2000, '0742556467641', 'A02'),
(3, 'Angelo', 'Leeds', 'Leeds', 4, 2000, 3000, 1000, 5000, '075345323675', 'A05'),
(4, 'Werner', 'Glasgow', 'Glasgow', 2, 3000, 1000, 2000, 4000, '07135646752', 'A01'),
(5, 'Claire', 'Leeds', 'Leeds', 5, 1000, 3000, 2000, 4000, '071356467525', 'A05');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id1` int(1) NOT NULL,
  `agent_name` char(50) DEFAULT NULL,
  `comisson` varchar(11) DEFAULT NULL,
  `phone_number` char(50) DEFAULT NULL,
  `working_area` char(50) DEFAULT NULL,
  `cust_city` char(35) DEFAULT NULL,
  `cust_name` varchar(40) NOT NULL,
  `c_working_area` varchar(55) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `opening_amount` float NOT NULL,
  `outstanding_amount` float NOT NULL,
  `payment_amount` float NOT NULL,
  `c_phone_number` varchar(11) NOT NULL,
  `receive_amount` float NOT NULL,
  `advance_amount` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_description` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`id1`, `agent_name`, `comisson`, `phone_number`, `working_area`, `cust_city`, `cust_name`, `c_working_area`, `grade`, `opening_amount`, `outstanding_amount`, `payment_amount`, `c_phone_number`, `receive_amount`, `advance_amount`, `order_amount`, `order_date`, `order_description`) VALUES
(1, 'Andrew', '2%', '07635971237', 'London', 'York', 'Pedro', 'York', 2, 2000, 2000, 3000, '07425686433', 1000, 500, 1000, '2021-10-04', 'shoe'),
(2, 'Helena', '3%', '07436432564', 'Manchester', 'Wales', 'Curt', 'Wales', 1, 3000, 2000, 1000, '07425564676', 4000, 2000, 3000, '2021-08-10', 'clothes'),
(3, 'Rickey', '2.5%', '07436437644', 'York', 'Leads', 'Angelo', 'Leads', 4, 2000, 5000, 1000, '07534532367', 3000, 1000, 2000, '2022-11-03', 'clothes'),
(4, 'Melvin', '0.5%', '07871432564', 'Birmingham', 'Glasgow', 'Werner', 'Glasgow', 2, 3000, 4000, 2000, '07135646725', 1000, 3000, 5000, '2022-07-13', 'shoe'),
(5, 'Kris', '3%', '07436432564', 'Wales', 'Leeds', 'Claire', 'Leeds', 5, 1000, 4000, 2000, '07135646752', 3000, 1200, 2000, '2022-07-13', 'clothes');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_num` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `advance_amount` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `cust_code` int(30) NOT NULL,
  `agent_code` varchar(40) NOT NULL,
  `order_description` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_num`, `order_amount`, `advance_amount`, `order_date`, `cust_code`, `agent_code`, `order_description`) VALUES
(20010, 1000, 500, '2021-10-04', 1, 'A04', 'shoe'),
(20011, 3000, 2000, '2021-08-10', 2, 'A02', 'clothes'),
(20012, 2000, 1000, '2022-11-03', 3, 'A05', 'clothes'),
(20013, 5000, 3000, '2022-07-13', 4, 'A01', 'shoe'),
(20014, 2000, 1200, '2022-07-13', 5, 'A05', 'clothes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agent_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_code`),
  ADD KEY `agent_code` (`agent_code`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id1`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_num`),
  ADD KEY `agent_code` (`agent_code`),
  ADD KEY `cust_code` (`cust_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id1` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`agent_code`) REFERENCES `agents` (`agent_code`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`agent_code`) REFERENCES `agents` (`agent_code`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cust_code`) REFERENCES `customer` (`cust_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
