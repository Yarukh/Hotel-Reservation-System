-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 11:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menu`
--

-- --------------------------------------------------------

--
-- Table structure for table `billmaster`
--

CREATE TABLE `billmaster` (
  `BillID` int(11) NOT NULL,
  `BillCode` varchar(255) DEFAULT NULL,
  `BillDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billmaster`
--

INSERT INTO `billmaster` (`BillID`, `BillCode`, `BillDescription`) VALUES
(1, 'BTC', 'Build To Company'),
(2, 'DPG', 'Direct Payment by Guest'),
(3, 'GRT+FFC', 'Guest Room Terif + Food From Company'),
(4, 'CRT+FBS', 'Company Room Terif + Food By Self');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `guestTitle` varchar(255) DEFAULT NULL,
  `guestName` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `idProof` varchar(50) DEFAULT NULL,
  `adharcardNumber` varchar(20) DEFAULT NULL,
  `pancardNumber` varchar(20) DEFAULT NULL,
  `drivinglicenseNumber` varchar(20) DEFAULT NULL,
  `passportNumber` varchar(20) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `raNumber` varchar(20) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `checkInDate` date DEFAULT NULL,
  `arrivalTime` time DEFAULT NULL,
  `checkOutDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  `adults` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `roomType` varchar(50) DEFAULT NULL,
  `roomNumber` varchar(20) DEFAULT NULL,
  `plan` varchar(50) DEFAULT NULL,
  `guestStatus` varchar(20) DEFAULT NULL,
  `billingInstruction` text DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `advance` decimal(10,2) DEFAULT NULL,
  `roomCharge` decimal(10,2) DEFAULT NULL,
  `foodCharge` decimal(10,2) DEFAULT NULL,
  `cgstPercentage` decimal(5,2) DEFAULT NULL,
  `sgstPercentage` decimal(5,2) DEFAULT NULL,
  `discountAmount` decimal(10,2) DEFAULT NULL,
  `cgstAmount` decimal(10,2) DEFAULT NULL,
  `sgstAmount` decimal(10,2) DEFAULT NULL,
  `extraCharge` decimal(10,2) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `paymentMode` varchar(50) DEFAULT NULL,
  `debitCardNumber` varchar(20) DEFAULT NULL,
  `debitCardHolder` varchar(255) DEFAULT NULL,
  `debitCardExpiry` varchar(10) DEFAULT NULL,
  `debitCardCVV` varchar(10) DEFAULT NULL,
  `creditCardType` varchar(50) DEFAULT NULL,
  `creditCardNumber` varchar(20) DEFAULT NULL,
  `creditCardHolder` varchar(255) DEFAULT NULL,
  `creditCardExpiry` varchar(10) DEFAULT NULL,
  `creditCardCVV` varchar(10) DEFAULT NULL,
  `Upiid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companymaster`
--

CREATE TABLE `companymaster` (
  `CompanyID` int(11) DEFAULT NULL,
  `CompanyCode` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companymaster`
--

INSERT INTO `companymaster` (`CompanyID`, `CompanyCode`, `CompanyName`, `City`) VALUES
(1, 'AG', 'AGoda', 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `countrymaster`
--

CREATE TABLE `countrymaster` (
  `CountryID` int(11) DEFAULT NULL,
  `CountryCode` varchar(100) DEFAULT NULL,
  `CountryName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countrymaster`
--

INSERT INTO `countrymaster` (`CountryID`, `CountryCode`, `CountryName`) VALUES
(1, 'IND', 'INDIA'),
(2, 'RUSS', 'Russia');

-- --------------------------------------------------------

--
-- Table structure for table `creditmaster`
--

CREATE TABLE `creditmaster` (
  `CreditID` int(11) DEFAULT NULL,
  `CreditCode` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CardLimit` int(11) DEFAULT NULL,
  `Commission` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencymaster`
--

CREATE TABLE `currencymaster` (
  `CurrencyID` int(11) DEFAULT NULL,
  `CountryName` varchar(255) DEFAULT NULL,
  `CurrencyOfCountry` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currencymaster`
--

INSERT INTO `currencymaster` (`CurrencyID`, `CountryName`, `CurrencyOfCountry`) VALUES
(1, 'Indian', 'Rupees');

-- --------------------------------------------------------

--
-- Table structure for table `occupancy`
--

CREATE TABLE `occupancy` (
  `RoomNumber` int(11) DEFAULT NULL,
  `RoomDescription` varchar(255) DEFAULT NULL,
  `RoomStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planmaster`
--

CREATE TABLE `planmaster` (
  `PlanID` int(11) DEFAULT NULL,
  `PlanCode` varchar(100) DEFAULT NULL,
  `Plandescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planmaster`
--

INSERT INTO `planmaster` (`PlanID`, `PlanCode`, `Plandescription`) VALUES
(1, 'EP', 'European Plan'),
(2, 'MAP', 'Modified American Plan'),
(3, 'AP', 'American Plan'),
(4, 'FB', 'Full Board'),
(5, 'RO', 'Room Only');

-- --------------------------------------------------------

--
-- Table structure for table `roommaster`
--

CREATE TABLE `roommaster` (
  `RoomID` int(11) NOT NULL,
  `RoomCode` varchar(255) NOT NULL,
  `RoomDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roommaster`
--

INSERT INTO `roommaster` (`RoomID`, `RoomCode`, `RoomDescription`) VALUES
(1, 'SRN', 'Single Room Non-AC'),
(2, 'DRN', 'Double Room Non-AC'),
(3, 'SRAC', 'Single Room AC'),
(4, 'DRAC', 'Double Room AC'),
(5, 'DR', 'Deluxe Room'),
(6, 'ES', 'Executive Suite'),
(7, 'PR', 'Presidential Suite');

-- --------------------------------------------------------

--
-- Table structure for table `roomtypemaster`
--

CREATE TABLE `roomtypemaster` (
  `RoomCode` varchar(10) NOT NULL,
  `RoomDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtypemaster`
--

INSERT INTO `roomtypemaster` (`RoomCode`, `RoomDescription`) VALUES
('PR', 'Presidential Suite'),
('aaaaaaaaa', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billmaster`
--
ALTER TABLE `billmaster`
  ADD PRIMARY KEY (`BillID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roommaster`
--
ALTER TABLE `roommaster`
  ADD PRIMARY KEY (`RoomID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
