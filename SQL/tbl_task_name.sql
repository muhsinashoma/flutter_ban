-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2024 at 12:05 PM
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
-- Database: `tile_view_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task_name`
--

CREATE TABLE `tbl_task_name` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `task_status` int(2) NOT NULL,
  `model_name` int(10) NOT NULL,
  `project_name` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `edited_at` datetime NOT NULL,
  `edited_by` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_task_name`
--

INSERT INTO `tbl_task_name` (`id`, `title`, `task_status`, `model_name`, `project_name`, `created_at`, `created_by`, `status`, `edited_at`, `edited_by`) VALUES
(1, 'data -1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(2, 'data-2', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(3, 'data-2', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(4, 'data-3', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(5, 'inproress-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(6, 'QA-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(7, 'done-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(8, 'To do -1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(9, 'In progess-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(10, 'QA-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', ''),
(11, 'Done-1', 0, 1, 1, '0000-00-00 00:00:00', '', 1, '0000-00-00 00:00:00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_task_name`
--
ALTER TABLE `tbl_task_name`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_task_name`
--
ALTER TABLE `tbl_task_name`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
