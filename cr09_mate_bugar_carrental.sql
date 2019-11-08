-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2019 at 02:25 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_mate_bugar_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalfee`
--

CREATE TABLE `additionalfee` (
  `add_fee_id` int(8) NOT NULL,
  `special_time` varchar(55) DEFAULT NULL,
  `special_loc` varchar(55) DEFAULT NULL,
  `fuel_refill` varchar(55) DEFAULT NULL,
  `damage` varchar(255) DEFAULT NULL,
  `fk_invoice_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additionalfee`
--

INSERT INTO `additionalfee` (`add_fee_id`, `special_time`, `special_loc`, `fuel_refill`, `damage`, `fk_invoice_id`) VALUES
(1, 'No', 'No', 'No', 'Window damage', 1),
(2, 'Yes', 'No', 'No', 'No', 2),
(3, 'No', 'Yes', 'No', 'No', 3),
(4, 'No', 'No', 'Yes', 'Window damage', 4),
(5, 'No', 'Yes', 'No', 'No', 5);

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(8) NOT NULL,
  `location_city` varchar(55) DEFAULT NULL,
  `location_country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `location_city`, `location_country`) VALUES
(1, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `avail_id` int(8) NOT NULL,
  `avail_condition` varchar(25) DEFAULT NULL,
  `fk_car_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`avail_id`, `avail_condition`, `fk_car_id`) VALUES
(1, 'Available', 4),
(2, 'Available', 1),
(3, 'NOT AVAILABLE', 2),
(4, 'AVAILABLE', 3),
(5, 'AVAILABLE', 5);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(8) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `fk_customer_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_date`, `fk_customer_id`) VALUES
(1, '2019-11-06', 2),
(2, '2019-11-30', 3),
(3, '2019-11-19', 1),
(4, '2019-12-20', 5),
(5, '2019-12-23', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bookingdate`
--

CREATE TABLE `bookingdate` (
  `bookingdate_id` int(8) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fk_booking_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingdate`
--

INSERT INTO `bookingdate` (`bookingdate_id`, `pickup_date`, `return_date`, `fk_booking_id`) VALUES
(1, '2019-11-06', '2019-11-08', 5),
(2, '2019-11-16', '2019-11-20', 3),
(3, '2019-12-07', '2019-12-14', 1),
(4, '2019-12-12', '2019-12-14', 2),
(5, '2019-11-24', '2019-11-29', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bookinglocation`
--

CREATE TABLE `bookinglocation` (
  `bookingloc_id` int(8) NOT NULL,
  `pickup_location` varchar(225) DEFAULT NULL,
  `return_location` varchar(225) DEFAULT NULL,
  `fk_booking_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookinglocation`
--

INSERT INTO `bookinglocation` (`bookingloc_id`, `pickup_location`, `return_location`, `fk_booking_id`) VALUES
(1, 'Vienna', 'Vienna', 1),
(2, 'Dubai', 'Banana Republic', 4),
(3, 'NEW York', 'Boston', 2),
(4, 'Athens', 'London', 3),
(5, 'Madrid', 'Dublin', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(8) NOT NULL,
  `manufacturer` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `fk_booking_id` int(8) DEFAULT NULL,
  `fk_agency_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `manufacturer`, `model`, `color`, `fk_booking_id`, `fk_agency_id`) VALUES
(1, 'Mercedes', 'C4', 'silver', 4, 1),
(2, 'Opel', 'Astra', 'blue', 3, 1),
(3, 'BMW', 'Z4', 'green', 1, 1),
(4, 'Audi', 'A1', 'black', 4, 1),
(5, 'Trabant', 'X8', 'silver', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(8) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `driving_license_nr` int(11) DEFAULT NULL,
  `phonenumber` int(11) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `driving_license_nr`, `phonenumber`, `email`) VALUES
(1, 'Mate', 'Bugar', 456123, 660324959, 'bugar@mate.com'),
(2, 'Francisco', 'Moreno', 39998445, 5356867, 'moreno@francisco.com'),
(3, 'Laura', 'White', 4255366, 6232456, 'laura@white.com'),
(4, 'Lucas', 'WannaCar', 25597597, 6324966, 'lucas@luc.com'),
(5, 'Hector', 'Chariot', 2125656, 6888343, 'hector@char.com');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(8) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `phonenumber` int(11) DEFAULT NULL,
  `fk_agency_id` int(8) DEFAULT NULL,
  `fk_customer_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `phonenumber`, `fk_agency_id`, `fk_customer_id`) VALUES
(1, 'Drivy', 'Car', 623435, 1, 1),
(2, 'Cary', 'Wheel', 53386876, 1, 2),
(3, 'Willy', 'Wheel', 6424156, 1, 3),
(4, 'Carrie', 'Rent', 624255, 1, 4),
(5, 'Speedy', 'Donstop', 42536636, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(8) NOT NULL,
  `sum` int(4) DEFAULT NULL,
  `fk_agent_id` int(8) DEFAULT NULL,
  `fk_customer_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `sum`, `fk_agent_id`, `fk_customer_id`) VALUES
(1, 1200, 1, 1),
(2, 1600, 2, 2),
(3, 2800, 3, 3),
(4, 6400, 4, 4),
(5, 4200, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `price_id` int(8) NOT NULL,
  `amount` int(5) DEFAULT NULL,
  `currency` varchar(55) DEFAULT NULL,
  `fk_car_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`price_id`, `amount`, `currency`, `fk_car_id`) VALUES
(1, 1200, 'euro', 4),
(2, 800, 'dollar', 5),
(3, 2600, 'pound', 2),
(4, 6000, 'euro', 3),
(5, 1800, 'euro', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rentalagent`
--

CREATE TABLE `rentalagent` (
  `agent_id` int(8) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_agency_id` int(8) DEFAULT NULL,
  `fk_booking_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rentalagent`
--

INSERT INTO `rentalagent` (`agent_id`, `first_name`, `last_name`, `fk_agency_id`, `fk_booking_id`) VALUES
(1, 'James', 'Bond', 1, 2),
(2, 'Rupert', 'Everton', 1, 4),
(3, 'Francisco', 'Moreno', 1, 3),
(4, 'Mate', 'Bugar', 1, 1),
(5, 'Tom', 'Saleall', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalfee`
--
ALTER TABLE `additionalfee`
  ADD PRIMARY KEY (`add_fee_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`avail_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `bookingdate`
--
ALTER TABLE `bookingdate`
  ADD PRIMARY KEY (`bookingdate_id`),
  ADD KEY `fk_booking_id` (`fk_booking_id`);

--
-- Indexes for table `bookinglocation`
--
ALTER TABLE `bookinglocation`
  ADD PRIMARY KEY (`bookingloc_id`),
  ADD KEY `fk_booking_id` (`fk_booking_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_booking_id` (`fk_booking_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_agent_id` (`fk_agent_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `rentalagent`
--
ALTER TABLE `rentalagent`
  ADD PRIMARY KEY (`agent_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`),
  ADD KEY `fk_booking_id` (`fk_booking_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additionalfee`
--
ALTER TABLE `additionalfee`
  ADD CONSTRAINT `additionalfee_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `bookingdate`
--
ALTER TABLE `bookingdate`
  ADD CONSTRAINT `bookingdate_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `bookinglocation`
--
ALTER TABLE `bookinglocation`
  ADD CONSTRAINT `bookinglocation_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_agency_id`) REFERENCES `agency` (`agency_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_agency_id`) REFERENCES `agency` (`agency_id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_agent_id`) REFERENCES `rentalagent` (`agent_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `rentalagent`
--
ALTER TABLE `rentalagent`
  ADD CONSTRAINT `rentalagent_ibfk_1` FOREIGN KEY (`fk_agency_id`) REFERENCES `agency` (`agency_id`),
  ADD CONSTRAINT `rentalagent_ibfk_2` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
