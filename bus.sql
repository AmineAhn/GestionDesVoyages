-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2017 at 09:25 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `IdBus` int(11) NOT NULL,
  `type` varchar(256) NOT NULL,
  `NumBus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`IdBus`, `type`, `NumBus`) VALUES
(15, 'Bus', 100),
(16, 'Bus', 33),
(17, 'Bus', 44);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `Client` varchar(256) NOT NULL,
  `Designation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `Client`, `Designation`) VALUES
(1, 'client1', 'NOM: CLIENT1'),
(2, 'client2', '');

-- --------------------------------------------------------

--
-- Table structure for table `conducteur`
--

CREATE TABLE `conducteur` (
  `Ide` int(11) NOT NULL,
  `Nom` varchar(256) NOT NULL,
  `Prenom` varchar(256) NOT NULL,
  `numBus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conducteur`
--

INSERT INTO `conducteur` (`Ide`, `Nom`, `Prenom`, `numBus`) VALUES
(1, 'COND1', 'COND1', 33),
(2, 'COND2', 'COND2', 44);

-- --------------------------------------------------------

--
-- Table structure for table `itineraire`
--

CREATE TABLE `itineraire` (
  `idItin` int(11) NOT NULL,
  `codeTrajet` varchar(255) NOT NULL,
  `stops` varchar(256) NOT NULL,
  `km` float NOT NULL,
  `duree` int(11) NOT NULL,
  `tarif` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itineraire`
--

INSERT INTO `itineraire` (`idItin`, `codeTrajet`, `stops`, `km`, `duree`, `tarif`) VALUES
(13, '12', 'aaa-bbb', 12, 60, 200),
(14, '55', 'ccc-ddd', 40, 60, 100),
(15, '122', '1-1-1', 112, 20, 1220);

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

CREATE TABLE `stop` (
  `Ide` int(11) NOT NULL,
  `Nom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`Ide`, `Nom`) VALUES
(1, '1'),
(2, '1'),
(3, '1'),
(6, '1'),
(9, '1');

-- --------------------------------------------------------

--
-- Table structure for table `trajet`
--

CREATE TABLE `trajet` (
  `idTrajet` int(11) NOT NULL,
  `codeTrajet` varchar(11) NOT NULL,
  `origine` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `destination` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trajet`
--

INSERT INTO `trajet` (`idTrajet`, `codeTrajet`, `origine`, `destination`) VALUES
(1, '12', 'Tetouan', 'Tanger'),
(2, '11', 'AAA', 'BBB'),
(3, '10', 'CCC', 'DDD'),
(4, '122', 'a', 'b'),
(5, '12B', 'Tetouan', 'Tanger');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(256) NOT NULL,
  `pwd` varchar(256) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Agent',
  `seSouvenir` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `pwd`, `type`, `seSouvenir`) VALUES
(1, 'SuperAdmin', 'Admin@2017', 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `voyage`
--

CREATE TABLE `voyage` (
  `Ide` int(11) NOT NULL,
  `origine` varchar(256) NOT NULL,
  `destination` varchar(256) NOT NULL,
  `IdItin` int(11) NOT NULL,
  `Type` varchar(256) NOT NULL,
  `idclient` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `heureAller` time NOT NULL,
  `heureRetour` time NOT NULL,
  `NumBus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voyage`
--

INSERT INTO `voyage` (`Ide`, `origine`, `destination`, `IdItin`, `Type`, `idclient`, `Date`, `heureAller`, `heureRetour`, `NumBus`) VALUES
(22, 'Tetouan', 'Tanger', 13, 'Aller', 2, '2017-10-11', '21:58:42', '22:00:04', 33);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`IdBus`),
  ADD UNIQUE KEY `NumBus` (`NumBus`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Client` (`Client`);

--
-- Indexes for table `conducteur`
--
ALTER TABLE `conducteur`
  ADD PRIMARY KEY (`Ide`),
  ADD UNIQUE KEY `idBus` (`numBus`);

--
-- Indexes for table `itineraire`
--
ALTER TABLE `itineraire`
  ADD PRIMARY KEY (`idItin`);

--
-- Indexes for table `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`Ide`);

--
-- Indexes for table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`idTrajet`),
  ADD UNIQUE KEY `codeTrajet` (`codeTrajet`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voyage`
--
ALTER TABLE `voyage`
  ADD PRIMARY KEY (`Ide`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `IdBus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `conducteur`
--
ALTER TABLE `conducteur`
  MODIFY `Ide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `itineraire`
--
ALTER TABLE `itineraire`
  MODIFY `idItin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `stop`
--
ALTER TABLE `stop`
  MODIFY `Ide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `idTrajet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `voyage`
--
ALTER TABLE `voyage`
  MODIFY `Ide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
