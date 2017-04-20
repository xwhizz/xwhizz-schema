-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2017 at 04:24 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xwhizz`
--

-- --------------------------------------------------------

--
-- Table structure for table `xw_contacts`
--

CREATE TABLE `xw_contacts` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xw_roles`
--

CREATE TABLE `xw_roles` (
  `id` bigint(20) NOT NULL,
  `rolename` varchar(200) NOT NULL,
  `createdby` bigint(20) NOT NULL,
  `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` bigint(20) NOT NULL,
  `updateddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xw_roles`
--

INSERT INTO `xw_roles` (`id`, `rolename`, `createdby`, `createddate`, `updatedby`, `updateddate`) VALUES
(1, 'superuser', 1, '2017-04-19 22:21:25', 1, '2017-04-19 22:21:25'),
(2, 'admin', 1, '2017-04-19 22:21:25', 1, '2017-04-19 22:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `xw_userroles`
--

CREATE TABLE `xw_userroles` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  `createdby` bigint(20) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `updatedby` bigint(20) NOT NULL,
  `updateddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xw_userroles`
--

INSERT INTO `xw_userroles` (`id`, `userid`, `roleid`, `createdby`, `createddate`, `updatedby`, `updateddate`) VALUES
(4, 1, 1, 1, '2017-04-19 22:23:24', 1, '2017-04-19 22:23:24'),
(5, 2, 2, 1, '2017-04-19 22:23:24', 1, '2017-04-19 22:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `xw_users`
--

CREATE TABLE `xw_users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `issuperuser` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(20) NOT NULL,
  `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` bigint(20) NOT NULL,
  `updateddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xw_users`
--

INSERT INTO `xw_users` (`id`, `username`, `password`, `isadmin`, `issuperuser`, `createdby`, `createddate`, `updatedby`, `updateddate`) VALUES
(1, 'superadmin@xwhizz.com', '$Turn@567', 1, 1, 1, '2017-03-23 22:43:32', 1, '2017-03-23 22:43:32'),
(2, 'admin@xwhizz.com', '$Turn@567', 1, 0, 1, '2017-03-23 22:44:19', 1, '2017-03-23 22:44:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xw_contacts`
--
ALTER TABLE `xw_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xw_roles`
--
ALTER TABLE `xw_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Roles_CreatedBy_Users_id` (`createdby`),
  ADD KEY `FK_Role_UpdatedBy_Users_id` (`updatedby`);

--
-- Indexes for table `xw_userroles`
--
ALTER TABLE `xw_userroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_UserRoles_UserId_Users_id` (`userid`),
  ADD KEY `FK_UserRoles_RoleId_Roles_id` (`roleid`),
  ADD KEY `FK_UserRoles_CreatedBy_Users_id` (`createdby`),
  ADD KEY `FK_UserRoles_UpdatedBy_Users_id` (`updatedby`);

--
-- Indexes for table `xw_users`
--
ALTER TABLE `xw_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Users_CreatedBy_Users_id` (`createdby`),
  ADD KEY `FK_Uses_UpdatedBy_Users_id` (`updatedby`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xw_contacts`
--
ALTER TABLE `xw_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xw_roles`
--
ALTER TABLE `xw_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `xw_userroles`
--
ALTER TABLE `xw_userroles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xw_users`
--
ALTER TABLE `xw_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `xw_roles`
--
ALTER TABLE `xw_roles`
  ADD CONSTRAINT `FK_Role_UpdatedBy_Users_id` FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`),
  ADD CONSTRAINT `FK_Roles_CreatedBy_Users_id` FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`);

--
-- Constraints for table `xw_userroles`
--
ALTER TABLE `xw_userroles`
  ADD CONSTRAINT `FK_UserRole_CreatedBy_Users_id` FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`),
  ADD CONSTRAINT `FK_UserRole_RoleId_Users_id` FOREIGN KEY (`roleid`) REFERENCES `xw_roles` (`id`),
  ADD CONSTRAINT `FK_UserRole_UpdatedBy_Users_id` FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`),
  ADD CONSTRAINT `FK_UserRole_UserId_Users_id` FOREIGN KEY (`userid`) REFERENCES `xw_users` (`id`);

--
-- Constraints for table `xw_users`
--
ALTER TABLE `xw_users`
  ADD CONSTRAINT `FK_Users_CreatedBy_Users_id` FOREIGN KEY (`createdby`) REFERENCES `xw_users` (`id`),
  ADD CONSTRAINT `FK_Uses_UpdatedBy_Users_id` FOREIGN KEY (`updatedby`) REFERENCES `xw_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
