-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 06:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banking`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_number` varchar(100) NOT NULL,
  `Customer_id` varchar(100) NOT NULL,
  `Branch_code` varchar(100) NOT NULL,
  `Balance` int(100) NOT NULL,
  `Opening_date` date NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Account_number`, `Customer_id`, `Branch_code`, `Balance`, `Opening_date`, `Status`) VALUES
('ac1055', '10035', 'b3', 16003, '2018-12-31', 'Active'),
('ac1103', '10020', 'b2', 18124, '2015-08-02', 'Active'),
('ac1114', '10061', 'b2', 12978, '2020-10-06', 'Inactive'),
('ac1118', '10012', 'b2', 15225, '2015-06-11', 'Active'),
('ac1135', '10045', 'b1', 8411, '2019-06-02', 'Active'),
('ac1157', '10003', 'b1', 18693, '2016-09-21', 'Inactive'),
('ac1163', '10019', 'b1', 18154, '2020-02-23', 'Active'),
('ac1183', '10068', 'b2', 14868, '2016-01-29', 'Inactive'),
('ac1194', '10039', 'b4', 11820, '2019-03-22', 'Active'),
('ac1224', '10032', 'b1', 9801, '2018-10-19', 'Active'),
('ac1230', '10013', 'b3', 17477, '2017-09-25', 'Inactive'),
('ac1234', '10027', 'b1', 13656, '2018-03-07', 'Inactive'),
('ac1238', '10045', 'b1', 11398, '2017-01-14', 'Inactive'),
('ac1259', '10013', 'b3', 18387, '2019-10-18', 'Active'),
('ac1267', '10022', 'b1', 17374, '2015-11-24', 'Active'),
('ac1327', '10009', 'b4', 10839, '2019-10-27', 'Active'),
('ac1452', '10035', 'b3', 19748, '2017-11-04', 'Inactive'),
('ac1458', '10039', 'b4', 11479, '2017-02-21', 'Active'),
('ac1470', '10005', 'b2', 11207, '2015-03-26', 'Active'),
('ac1471', '10027', 'b1', 9117, '2018-03-05', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `City` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `Branch_code` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Manager` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Name`, `City`, `Branch_code`, `Address`, `Manager`) VALUES
('Gjøvik Branch', 'Gjøvik', 'b1', 'Storgata 55', 'Alexander Dahl'),
('Trondheim Branch', 'Trondheim', 'b2', 'Strindvegen 7', 'Martina Jensen '),
('Oslo Branch', 'Oslo', 'b3', 'Bromstadvegen 31', 'Tom Westin'),
('Lillehammer Branch', 'Lillehammer', 'b4', 'Anders Tvereggens veg 12', 'John Smith'),
('Hamar Branch', 'Hamar', 'b5', 'Lille Strandgate 2', 'Otto Roseth'),
('Arendal Branch', 'Arendal', 'b6', 'Strandgata 71', 'Sofie Hovde');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(100) NOT NULL,
  `Customer_id` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Birth_date` date NOT NULL,
  `City` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `Postal_code` varchar(100) NOT NULL,
  `Home_Phone` varchar(100) NOT NULL,
  `Mobile_phone` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `Customer_id`, `Gender`, `Birth_date`, `City`, `Address`, `Postal_code`, `Home_Phone`, `Mobile_phone`, `Email`) VALUES
('Hildegunn Eggen', '10003', 'F', '2000-04-28', 'Gjøvik', 'Moholt alle  4', '2816', '59575468', '39305691', 'hildegunn@realmail.no'),
('Sofie Veierod', '10005', 'F', '1996-03-21', 'Trondheim', 'Frode Rinnans veg  27', '7036', '35904273', '30254098', 'sofie@yahoo.com'),
('Christoffer Sande', '10009', 'M ', '1972-02-26', 'Lillehammer', 'Hans Baucks veg  48', '2611', '50742474', '71218150', 'christoffer@yahoo.com'),
('Erna Kaasa', '10012', 'F', '1978-05-20', 'Trondheim', 'Valentinlystvegen  43', '7034', '70536071', '83358256', 'erna@yahoo.com'),
('Benjamin Kringen', '10013', 'M ', '1965-12-15', 'Oslo', 'Lidarende  33', '0151', '43828201', '67896305', 'benjamin@realmail.no'),
('Vivi Sando', '10019', 'F', '1958-07-29', 'Gjøvik', 'Astri Aasens veg  12', '2821', '35745929', '78088625', 'vivi@realmail.no'),
('Audun Owe', '10020', 'M ', '1964-06-22', 'Trondheim', 'Frydenbergvegen  41', '7026', '84561135', '25715331', 'audun@rocketmail.no'),
('Markus Stenseth', '10022', 'M ', '1950-04-26', 'Gjøvik', 'Kasper Andresens veg  45', '2816', '25200362', '59268004', 'markus@realmail.no'),
('Silje Henjum', '10027', 'F', '1983-06-03', 'Gjøvik', 'Sigurd Jorsalfars veg   28', '2818', '30420382', '77112631', 'silje@realmail.no'),
('Agnar Nielsen', '10032', 'M ', '1980-05-19', 'Gjøvik', 'Herman Krags veg   21', '2817', '39585170', '57974878', 'agnar@rocketmail.no'),
('Monika Narum', '10035', 'F', '1958-07-29', 'Oslo', 'Jonsvannsveien  5', '0259', '87867556', '23033394', 'monika@yahoo.com'),
('Ina Huseby', '10039', 'F', '1984-01-09', 'Lillehammer', 'Nordre Eberg gate  55', '2614', '57612202', '33548835', 'ina@rocketmail.no'),
('Lillian Eriksen', '10045', 'F', '1997-09-15', 'Gjøvik', 'Kong Øysteins veg  8', '2819', '89078833', '81098988', 'lillian@rocketmail.no'),
('Ulrik Bergland', '10061', 'M ', '1990-03-11', 'Trondheim', 'Jonsvannsveien  13', '7028', '50099414', '26901503', 'ulrik@gmail.com'),
('Audun Strand', '10068', 'M ', '1999-02-28', 'Trondheim', 'Svalevegen  23', '7017', '46456081', '81924867', 'audun@realmail.no');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `Transaction_id` varchar(100) NOT NULL,
  `Customer_id` varchar(100) NOT NULL,
  `Account_number` varchar(100) NOT NULL,
  `Amount` varchar(100) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`Transaction_id`, `Customer_id`, `Account_number`, `Amount`, `Date`) VALUES
('tr1239', '10013', 'ac1259', '450', '2020-05-13'),
('tr1244', '10068', 'ac1183', '400', '2020-10-13'),
('tr1271', '10035', 'ac1452', '1000', '2020-08-04'),
('tr1290', '10013', 'ac1230', '1150', '2019-07-08'),
('tr1296', '10009', 'ac1327', '2500', '2019-08-22'),
('tr1311', '10019', 'ac1163', '200', '2020-06-14'),
('tr1317', '10009', 'ac1327', '1200', '2020-09-15'),
('tr1325', '10009', 'ac1327', '300', '2019-03-20'),
('tr1328', '10039', 'ac1194', '250', '2019-05-04'),
('tr1332', '10019', 'ac1163', '600', '2019-04-19'),
('tr1344', '10012', 'ac1118', '450', '2019-04-14'),
('tr1345', '10061', 'ac1114', '250', '2019-07-08'),
('tr1346', '10013', 'ac1259', '1000', '2019-04-04'),
('tr1352', '10013', 'ac1230', '300', '2020-12-30'),
('tr1369', '10039', 'ac1194', '400', '2020-02-01'),
('tr1398', '10005', 'ac1470', '500', '2020-05-14'),
('tr1405', '10022', 'ac1267', '1100', '2020-03-17'),
('tr1407', '10061', 'ac1114', '1200', '2020-12-15'),
('tr1418', '10020', 'ac1103', '850', '2019-03-09'),
('tr1421', '10005', 'ac1470', '1300', '2020-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `Loan_number` varchar(100) NOT NULL,
  `Customer_id` varchar(100) NOT NULL,
  `Branch_code` varchar(100) NOT NULL,
  `Loan_name` varchar(100) NOT NULL,
  `Loan_amount` int(100) DEFAULT NULL,
  `Starting_Date` date NOT NULL,
  `Loan_period` int(100) DEFAULT NULL,
  `Interest_rate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`Loan_number`, `Customer_id`, `Branch_code`, `Loan_name`, `Loan_amount`, `Starting_Date`, `Loan_period`, `Interest_rate`) VALUES
('lo1004', '10013', 'b2', 'Personal ', 50000, '2018-05-03', 3, '1.88%'),
('lo1029', '10027', 'b4', 'Car', 100000, '2020-09-27', 10, '2.49%'),
('lo1031', '10009', 'b1', 'Personal ', 50000, '2018-12-27', 3, '1.88%'),
('lo1044', '10035', 'b2', 'Home', 100000, '2018-06-08', 5, '2.13%'),
('lo1062', '10020', 'b3', 'Car', 50000, '2020-07-26', 3, '1.88%'),
('lo1065', '10039', 'b3', 'Personal ', 20000, '2018-08-29', 3, '1.88%'),
('lo1075', '10012', 'b4', 'Personal ', 30000, '2019-09-02', 3, '1.88%'),
('lo1131', '10061', 'b2', 'Home', 200000, '2019-07-30', 10, '2.49%'),
('lo1135', '10032', 'b4', 'Car', 100000, '2020-01-15', 5, '2.13%'),
('lo1141', '10027', 'b3', 'Personal ', 25000, '2020-07-05', 3, '1.88%'),
('lo1185', '10039', 'b3', 'Personal ', 50000, '2018-08-10', 3, '1.88%'),
('lo1210', '10005', 'b4', 'Home', 100000, '2020-12-30', 5, '2.13%'),
('lo1275', '10068', 'b1', 'Personal ', NULL, '2018-09-02', NULL, '1.88%'),
('lo1285', '10032', 'b2', 'Personal ', 30000, '2019-12-29', 3, '1.88%'),
('lo1286', '10020', 'b4', 'Personal ', NULL, '2018-04-09', NULL, '1.88%');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_number`),
  ADD KEY `Customer_id1_fk ` (`Customer_id`) USING BTREE,
  ADD KEY `Branch_code1_fk` (`Branch_code`) USING BTREE;

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Branch_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `depositor`
--
ALTER TABLE `depositor`
  ADD PRIMARY KEY (`Transaction_id`),
  ADD KEY `Customer_id3_fk` (`Customer_id`) USING BTREE,
  ADD KEY `Account_number_fk` (`Account_number`) USING BTREE;

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`Loan_number`),
  ADD KEY `Branch_code_fk` (`Branch_code`) USING BTREE,
  ADD KEY `Customer_id2_fk` (`Customer_id`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Branch_code1_fk` FOREIGN KEY (`Branch_code`) REFERENCES `branch` (`Branch_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_id1_fk` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `depositor`
--
ALTER TABLE `depositor`
  ADD CONSTRAINT `Account_number_fk` FOREIGN KEY (`Account_number`) REFERENCES `account` (`Account_number`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_id3_fk` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `Branch_code_fk` FOREIGN KEY (`Branch_code`) REFERENCES `branch` (`Branch_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_id2_fk` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
