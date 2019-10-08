-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2019 at 07:44 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ID_doctor` int(11) NOT NULL,
  `name_doctor` varchar(255) NOT NULL,
  `username_doctor` varchar(150) NOT NULL,
  `password_doctor` varchar(50) NOT NULL,
  `jobtype_doctor` int(11) NOT NULL,
  `phone_doctor` varchar(100) NOT NULL,
  `email_doctor` varchar(150) NOT NULL,
  `comment_doctor` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ID_doctor`, `name_doctor`, `username_doctor`, `password_doctor`, `jobtype_doctor`, `phone_doctor`, `email_doctor`, `comment_doctor`) VALUES
(1, 'mario', 'mariouser', 'mario123', 3, '0123456', 'marioemad@yahoo.com', 'ssdd'),
(3, 'mena', 'menauser', 'mena123', 1, '0123456', 'menaatef@yahoo.com', 'sdaasdasd'),
(4, 'mohamed', 'mohameduser', 'mohamed123', 5, '0123456', 'mohamed@gmail.com', 'adad'),
(5, 'carolina', 'carolinauser', 'carolina123', 6, '0123456', 'carolin345@gmail.com', 'sdadadas'),
(6, 'zayed', 'zayeduser', 'zayed123', 6, '0123456', 'zayed@yahoo.com', 'dfs sdf ds f');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_has_patient`
--

CREATE TABLE `doctor_has_patient` (
  `ID_Doctor` int(11) NOT NULL,
  `ID_Patient` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor_has_patient`
--

INSERT INTO `doctor_has_patient` (`ID_Doctor`, `ID_Patient`, `date`, `time`) VALUES
(5, 1, '2019-10-08', 5),
(5, 1, '2019-10-08', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobtype`
--

CREATE TABLE `jobtype` (
  `ID_jobtype` int(11) NOT NULL,
  `title_jobtype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobtype`
--

INSERT INTO `jobtype` (`ID_jobtype`, `title_jobtype`) VALUES
(1, 'heart'),
(2, 'internal medicine'),
(3, 'orthopedist'),
(4, 'dermatologist'),
(5, 'ear and nose'),
(6, 'surgry');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID_patient` int(11) NOT NULL,
  `name_patient` varchar(255) NOT NULL,
  `username_patient` varchar(150) NOT NULL,
  `password_patient` varchar(50) NOT NULL,
  `birthdate_patient` date NOT NULL,
  `phone_patient` varchar(150) NOT NULL,
  `comment_patient` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID_patient`, `name_patient`, `username_patient`, `password_patient`, `birthdate_patient`, `phone_patient`, `comment_patient`) VALUES
(1, 'patient1', 'pat1user', 'pat1123', '2019-10-16', '0123456', 'sads');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID_doctor`),
  ADD KEY `fk_Doctor_JobType_idx` (`jobtype_doctor`);

--
-- Indexes for table `doctor_has_patient`
--
ALTER TABLE `doctor_has_patient`
  ADD KEY `fk_Doctor_has_Patient_Patient1_idx` (`ID_Patient`),
  ADD KEY `fk_Doctor_has_Patient_Doctor1_idx` (`ID_Doctor`);

--
-- Indexes for table `jobtype`
--
ALTER TABLE `jobtype`
  ADD PRIMARY KEY (`ID_jobtype`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID_patient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `ID_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobtype`
--
ALTER TABLE `jobtype`
  MODIFY `ID_jobtype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `ID_patient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_Doctor_JobType` FOREIGN KEY (`jobtype_doctor`) REFERENCES `jobtype` (`ID_jobtype`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor_has_patient`
--
ALTER TABLE `doctor_has_patient`
  ADD CONSTRAINT `fk_Doctor_has_Patient_Doctor1` FOREIGN KEY (`ID_Doctor`) REFERENCES `doctor` (`ID_doctor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Doctor_has_Patient_Patient1` FOREIGN KEY (`ID_Patient`) REFERENCES `patient` (`ID_patient`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
