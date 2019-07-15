-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 05:47 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastlearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `kode_mk` char(5) NOT NULL,
  `nama_mk` char(30) NOT NULL,
  `biaya` int(10) NOT NULL,
  `prasyarat` char(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `kode_mk` char(5) NOT NULL,
  `kd_fakultas` char(5) NOT NULL,
  `nama_fakultas` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_query` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `tanggal_feedback` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `id_query` int(10) NOT NULL,
  `Pertanyaan` varchar(500) NOT NULL,
  `tanggal_pertanyaan` varchar(30) NOT NULL,
  `tgl_respon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_student` int(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` int(15) NOT NULL,
  `id_center` varchar(5) NOT NULL,
  `kd_fakultas` char(5) NOT NULL,
  `id_query` int(10) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `study_center`
--

CREATE TABLE `study_center` (
  `id_center` varchar(5) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `lokasi` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`kd_fakultas`),
  ADD KEY `kode_mk` (`kode_mk`),
  ADD KEY `id_query` (`id_query`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id_query`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`),
  ADD KEY `id_center` (`id_center`),
  ADD KEY `kd_fakultas` (`kd_fakultas`),
  ADD KEY `id_query` (`id_query`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `study_center`
--
ALTER TABLE `study_center`
  ADD PRIMARY KEY (`id_center`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `course` (`kode_mk`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_center`) REFERENCES `study_center` (`id_center`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`kd_fakultas`) REFERENCES `faculty` (`kd_fakultas`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`id_query`) REFERENCES `query` (`id_query`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`id`) REFERENCES `feedback` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
