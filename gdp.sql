-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2017 at 07:23 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gdp`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ref` int(11) NOT NULL,
  `prenom` varchar(30) NOT NULL DEFAULT 'PATIENT',
  `nom` varchar(30) NOT NULL DEFAULT 'PATIENT',
  `age` int(11) NOT NULL DEFAULT '25',
  `dateAjout` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sexe` varchar(20) NOT NULL DEFAULT 'Homme',
  `gsm` int(11) NOT NULL DEFAULT '6666666',
  `mutualiste` tinyint(1) NOT NULL DEFAULT '0',
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `paye` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ref`, `prenom`, `nom`, `age`, `dateAjout`, `sexe`, `gsm`, `mutualiste`, `archive`, `paye`, `total`) VALUES
(1, 'PATIENT', 'PATIENT', 25, '2017-05-31 03:06:36', 'Homme', 6666666, 0, 0, 0, 0),
(2, 'PATIENT', 'PATIENT', 25, '2017-05-31 03:06:52', 'Homme', 6666666, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rv`
--

CREATE TABLE `rv` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `heure` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'Consultation',
  `etat` varchar(50) DEFAULT 'En Attente',
  `prix` double DEFAULT '200',
  `paye` double NOT NULL DEFAULT '0',
  `refPatient` int(11) NOT NULL,
  `plannifie` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `dateCreation` timestamp NOT NULL,
  `lastLogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `type`, `dateCreation`, `lastLogin`) VALUES
(1, 'admin2', 'admin', 'Medecin', '2017-05-31 00:51:33', '2017-05-31 00:51:33'),
(2, 'secretaire', 'secretaire', 'Secretaire', '2017-05-31 01:02:28', '2017-05-31 01:02:28'),
(3, 'admin', 'admin', 'Admin', '2017-06-04 03:50:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ref`);

--
-- Indexes for table `rv`
--
ALTER TABLE `rv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refPatient` (`refPatient`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rv`
--
ALTER TABLE `rv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rv`
--
ALTER TABLE `rv`
  ADD CONSTRAINT `rv_fk_patient` FOREIGN KEY (`refPatient`) REFERENCES `patient` (`ref`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
