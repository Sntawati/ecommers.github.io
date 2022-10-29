-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2022 at 03:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpenjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbarang`
--

CREATE TABLE `tbarang` (
  `idbarang` int(11) NOT NULL,
  `nmbarang` varchar(50) NOT NULL,
  `idjenis` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `iddist` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tcustomer`
--

CREATE TABLE `tcustomer` (
  `idcust` int(11) NOT NULL,
  `nmcust` varchar(35) NOT NULL,
  `jenkel` enum('P','L') NOT NULL,
  `tgllahir` date NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tdistributor`
--

CREATE TABLE `tdistributor` (
  `iddist` int(11) NOT NULL,
  `nmdist` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tjenis`
--

CREATE TABLE `tjenis` (
  `idjenis` int(11) NOT NULL,
  `jenisbarang` varchar(35) NOT NULL,
  `ket` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tjenis`
--

INSERT INTO `tjenis` (`idjenis`, `jenisbarang`, `ket`) VALUES
(1, 'fgfd', 'gff'),
(2, 'Baju Gamis', 'Oke'),
(3, 'Kerudung Rabbani', 'Oke'),
(4, 'Androk Pliscket', 'Oke'),
(5, 'Baju Kemeja', 'Oke'),
(6, 'Mukena', 'Oke'),
(7, 'Kerudung Elzatta', 'Oke');

-- --------------------------------------------------------

--
-- Table structure for table `tjual`
--

CREATE TABLE `tjual` (
  `idjual` int(11) NOT NULL,
  `tgljual` date NOT NULL,
  `idbarang` int(11) NOT NULL,
  `jmlbarang` int(11) NOT NULL,
  `idcust` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL,
  `idpetugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tpetugas`
--

CREATE TABLE `tpetugas` (
  `idpetugas` int(11) NOT NULL,
  `nmpetugas` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE `tuser` (
  `iduser` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `hakakses` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_barang`
--

CREATE TABLE `t_barang` (
  `id_brg` int(15) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `id_jenis` int(15) NOT NULL,
  `stuk` int(10) NOT NULL,
  `harga` int(50) NOT NULL,
  `id_dist` int(15) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_petugas`
--

CREATE TABLE `t_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `hak_akses` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vbarang`
-- (See below for the actual view)
--
CREATE TABLE `vbarang` (
`idbarang` int(11)
,`nmbarang` varchar(50)
,`jenisbarang` varchar(35)
,`stok` int(11)
,`harga` int(11)
,`nmdist` varchar(35)
,`status` enum('0','1')
);

-- --------------------------------------------------------

--
-- Structure for view `vbarang`
--
DROP TABLE IF EXISTS `vbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vbarang`  AS  select `tbarang`.`idbarang` AS `idbarang`,`tbarang`.`nmbarang` AS `nmbarang`,`tjenis`.`jenisbarang` AS `jenisbarang`,`tbarang`.`stok` AS `stok`,`tbarang`.`harga` AS `harga`,`tdistributor`.`nmdist` AS `nmdist`,`tbarang`.`status` AS `status` from ((`tbarang` join `tdistributor` on(`tbarang`.`iddist` = `tdistributor`.`iddist`)) join `tjenis` on(`tbarang`.`idjenis` = `tjenis`.`idjenis`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbarang`
--
ALTER TABLE `tbarang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indexes for table `tcustomer`
--
ALTER TABLE `tcustomer`
  ADD PRIMARY KEY (`idcust`);

--
-- Indexes for table `tdistributor`
--
ALTER TABLE `tdistributor`
  ADD PRIMARY KEY (`iddist`);

--
-- Indexes for table `tjenis`
--
ALTER TABLE `tjenis`
  ADD PRIMARY KEY (`idjenis`);

--
-- Indexes for table `tjual`
--
ALTER TABLE `tjual`
  ADD PRIMARY KEY (`idjual`);

--
-- Indexes for table `tpetugas`
--
ALTER TABLE `tpetugas`
  ADD PRIMARY KEY (`idpetugas`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `t_barang`
--
ALTER TABLE `t_barang`
  ADD PRIMARY KEY (`id_brg`,`id_jenis`,`id_dist`);

--
-- Indexes for table `t_petugas`
--
ALTER TABLE `t_petugas`
  ADD PRIMARY KEY (`id_petugas`,`iduser`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tdistributor`
--
ALTER TABLE `tdistributor`
  MODIFY `iddist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tjenis`
--
ALTER TABLE `tjenis`
  MODIFY `idjenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tuser`
--
ALTER TABLE `tuser`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
