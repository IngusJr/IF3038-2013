-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2013 at 10:52 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `progin_405_13510099`
--

-- --------------------------------------------------------

--
-- Table structure for table `asignee_tugas1`
--

CREATE TABLE IF NOT EXISTS `asignee_tugas1` (
  `ID_tugas` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asignee_tugas1`
--

INSERT INTO `asignee_tugas1` (`ID_tugas`, `username`) VALUES
('tugas2', 'username2'),
('tugas1', 'username2'),
('1', 'admin'),
('2', 'admin'),
('1', 'rebet'),
('2', 'rebet'),
('3', 'admin'),
('3', 'rebet');

-- --------------------------------------------------------

--
-- Table structure for table `attachment_tugas1`
--

CREATE TABLE IF NOT EXISTS `attachment_tugas1` (
  `ID_tugas` varchar(50) NOT NULL,
  `nama_attachment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_tugas1`
--

CREATE TABLE IF NOT EXISTS `kategori_tugas1` (
  `username` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `user_berhak` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_tugas1`
--

INSERT INTO `kategori_tugas1` (`username`, `kategori`, `user_berhak`) VALUES
('username2', 'kategorian', 'username1'),
('username1', 'kaka', 'username2'),
('username1', 'dd', 'username2');

-- --------------------------------------------------------

--
-- Table structure for table `komentar_tugas1`
--

CREATE TABLE IF NOT EXISTS `komentar_tugas1` (
  `ID_tugas` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `waktu_komentar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar_tugas1`
--

INSERT INTO `komentar_tugas1` (`ID_tugas`, `username`, `komentar`, `waktu_komentar`) VALUES
('tugas1', '', 'fdff', '2013-04-13 14:32:18'),
('1', 'username1', 'hjkhjkhjkhjk', '2013-04-05 11:29:45'),
('2', 'username1', 'adsffdsf', '2013-04-05 14:39:28'),
('1', 'username1', 'gggggggggggg', '2013-04-05 14:39:34'),
('1', 'username1', 'gggggggggggg', '2013-04-05 14:39:36'),
('1', 'username1', 'ggggfffffff', '2013-04-05 14:39:45'),
('2', 'username1', 'ggggfffffff', '2013-04-05 14:39:46'),
('4', 'admin', 'keren', '2013-04-11 17:36:57'),
('6', 'admin', 'werwer', '2013-04-11 18:39:39'),
('17', 'admin', 'tugasnya sulit', '2013-04-12 15:53:24'),
('17', 'admin', 'tugasnya sulit', '2013-04-12 15:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `tag_tugas1`
--

CREATE TABLE IF NOT EXISTS `tag_tugas1` (
  `ID_tugas` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag_tugas1`
--

INSERT INTO `tag_tugas1` (`ID_tugas`, `tag`) VALUES
('null', 'wow'),
('null', 'wow'),
('tugas1', 'wow'),
('tugas1', 'p'),
('1', 'css'),
('1', 'htnl'),
('2', 'sister'),
('1', 'kurang'),
('3', 'tag'),
('17', '[Ljava.lang.String;@c4dd83'),
('17', 'tag'),
('17', 'tig');

-- --------------------------------------------------------

--
-- Table structure for table `tugas1`
--

CREATE TABLE IF NOT EXISTS `tugas1` (
  `ID_tugas` varchar(50) NOT NULL,
  `nama_tugas` varchar(50) NOT NULL,
  `deadline` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `pembuat_tugas` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tugas1`
--

INSERT INTO `tugas1` (`ID_tugas`, `nama_tugas`, `deadline`, `status`, `pembuat_tugas`, `kategori`) VALUES
('tugas1', 'nama1', '2013-03-06', 'belum', 'username1', 'kategori1'),
('tugas2', 'nama2', '2013-04-08', 'sudah', 'username1', 'kategori2'),
('1', 'Tugas1', '2013-03-06', 'belum', 'username1', 'penting'),
('2', 'Tugas2', '2013-04-23', 'belum', 'username1', 'kurang penting'),
('3', 'sister', '2013-03-14', 'belum', 'username1', 'kuliah'),
('4', 'progin', '2013-04-20', 'sudah', 'admin', 'kuliah'),
('5', 'progin', '2013-04-30', 'belum', 'username1', 'kuliah'),
('6', 'Tugas3', '2013-03-06', 'belum', 'admin', 'kuliah'),
('7', 'Tugas 4', '2013-04-30', 'belum', 'username1', 'kurang penting'),
('8', 'TugasA', '2013-03-06', 'sudah', 'rebet', 'yes'),
('9', 'TugasB', '2013-04-30', 'belum', 'username1', 'yes'),
('10', 'nodong', '2013-04-20', 'sudah', 'rebet', 'no'),
('11', 'TugasP', '2013-04-01', 'belum', 'username1', 'yes'),
('12', 'www', '2013-04-27', 'belum', 'rebet', 'kuliah'),
('13', 'lalala', '2013-03-06', 'belum', 'admin', 'kuliah'),
('14', 'aku', '2013-03-14', 'belum', 'admin', 'baru'),
('15', 'ref', '2013-04-11', 'belum', 'username1', 'uncategorized'),
('16', 'asdf', '2013-04-12', 'belum', 'null', 'uncategorized'),
('17', 'asdf', '2013-05-09', 'belum', 'admin', 'uncategorized'),
('18', 'asdf', '2013-05-09', 'belum', 'admin', 'uncategorized'),
('19', 'asdf', '2013-05-09', 'belum', 'admin', 'uncategorized');

-- --------------------------------------------------------

--
-- Table structure for table `user1`
--

CREATE TABLE IF NOT EXISTS `user1` (
  `username` varchar(50) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user1`
--

INSERT INTO `user1` (`username`, `avatar`, `email`, `tanggal_lahir`, `nama_lengkap`, `password`) VALUES
('username1', '', '', '0000-00-00', 'da', ''),
('username2', 'avatar2', 'jigjiji@a.com', '2013-04-09', 'ddddd ddd', '12345678'),
('13510019', 'ayam.jpg', 'ra2.xzytech@gmail.com', '2013-04-08', 'asdf asdf ', 'asdfasdf'),
('admin', '8-Dark-Anime-Angel-86145.jpg', 'aa@aa.aa', '2013-12-31', 'admin ganteng', 'adminadmin'),
('rebet', 'xxx.jpg', 'www@ga.com', '1995-04-11', 'rere bete loh', 'asdfasdf'),
('username1', 'xxx.jpg', 'n@n.n', '1996-04-11', 'roti bakar', 'rererere');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
