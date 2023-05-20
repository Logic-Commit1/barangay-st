-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 12:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `thumbnail`, `created_at`, `updated_at`, `deleted_at`) VALUES
(43, 'BIKE SAFETY', ' Be aware of your surrounding. Get a headlight and a small flashing rear red light. Even for daytime riding, a bright white light that has a flashing mode can make you more visible to motorists who might otherwise bump you. Don\'t ride against traffic. Ride with traffic, in the same direction. Don\'t stop in the blind spot of a vehicle.\'', '20230104013514167283571463b57282e9826.', '2023-01-04 12:35:14', NULL, NULL),
(44, 'ACCOUNTS OF RESIDENTS OF BARANGAY STO TOMAS', 'Ang lahat ng residente ng Barangay Sto. Tomas ay mayroong sariling account ng Opisyal na Website ng Barangay Sto. Tomas. \r\n\r\nAng username na gagamitin ay ang kombinasyon ng unang pangalan at initial ng middle name at initial ng apelyido at ang taon ng kapanganakan (huling dalawang numero ng petsa ng kapanganakan, hal. 1968). Ang password naman ay ang pangalan ng ating Barangay.\r\n\r\nHalimbawa: \r\nJuan D. Cruz January 1, 2000\r\nUsername: juandc2000\r\nPassword: stotomas\r\n\r\nMaaari na lamang na baguhin agad ang inyong mga password pagkabukas ng account. Ang sinumang hindi maka-access sa kanilang Account ay maaaring tumawag sa aming barangay o mag-message sa aming email.\r\n', '20230109014913167326855363bc0d49e5c56.png', '2023-01-04 12:43:19', '2023-01-09 12:49:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `name`, `url`) VALUES
(1, 'Barangay Certificate', 'generate_brgy_cert.php'),
(3, '4ps Certification', 'generate_fpscert.php'),
(4, 'Certificate of Indigency', 'generate_indi_cert.php'),
(5, 'Business Clearance', 'generate_business_permit.php'),
(6, 'Cutting Permit', 'generate_cuttingpermit.php');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `certificate_id` int(10) UNSIGNED NOT NULL,
  `status` enum('resolved','rejected','pending') NOT NULL DEFAULT 'pending',
  `memo` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `url` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate_requests`
--

INSERT INTO `certificate_requests` (`id`, `resident_id`, `payment_id`, `certificate_id`, `status`, `memo`, `data`, `url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 21, 21, 1, 'resolved', 'Barangay Clearance Payment', NULL, NULL, '2023-01-09 14:03:41', NULL, NULL),
(25, 17, NULL, 1, 'pending', 'for employment', '{}', 'generate_brgy_cert.php?id=17&request_id=25', '2023-02-17 05:37:29', '2023-02-17 05:37:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `mode` enum('online','cash') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `resident_id`, `details`, `amount`, `mode`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 11, 1, 'Barangay Clearance Payment', '200.00', 'online', '2022-05-22 09:35:30', NULL, NULL),
(7, 11, 1, 'Certificate of Indigency Payment', '200.00', 'online', '2022-05-22 09:52:50', NULL, NULL),
(8, 11, 1, 'Certificate of Indigency Payment', '2.00', 'online', '2022-05-22 09:53:39', NULL, NULL),
(9, 11, 6, 'Business Permit Payment', '2.00', 'online', '2022-05-22 10:23:47', NULL, NULL),
(10, 11, 2, '4PS Certification Payment', '21.00', 'online', '2022-05-22 10:34:12', NULL, NULL),
(11, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:10', NULL, NULL),
(12, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:26', NULL, NULL),
(13, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:36', NULL, NULL),
(14, 11, 1, 'Cutting Permit Payment', '123.00', 'online', '2022-05-22 13:04:13', NULL, NULL),
(15, 11, 9, 'Barangay Clearance Payment', '222.00', 'online', '2022-05-24 15:38:50', NULL, NULL),
(16, 11, 9, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-24 15:40:10', NULL, NULL),
(17, 11, 9, 'Business Permit Payment', '12312.00', 'online', '2022-06-03 15:31:50', NULL, NULL),
(18, 11, 17, 'Barangay Clearance Payment', '250.00', 'cash', '2022-12-14 06:33:37', NULL, NULL),
(19, 11, 17, 'Barangay Clearance Payment', '250.00', 'cash', '2023-01-09 13:04:26', NULL, NULL),
(20, 11, 17, 'Barangay Clearance Payment', '150.00', 'cash', '2023-01-09 13:27:28', NULL, NULL),
(21, 11, 21, 'Barangay Clearance Payment', '250.00', 'cash', '2023-01-09 14:03:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purok`
--

CREATE TABLE `purok` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purok`
--

INSERT INTO `purok` (`id`, `name`, `details`) VALUES
(1, 'Purok 1', ''),
(2, 'Purok 2', ''),
(3, 'Purok 3', ''),
(4, 'Purok 4', ''),
(5, 'Purok 5', ''),
(6, 'Purok 6', ''),
(7, 'Purok 7', ''),
(8, 'Purok 8', '');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(10) UNSIGNED NOT NULL,
  `national_id` varchar(100) DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alias` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthplace` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civilstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `purok_id` int(10) UNSIGNED NOT NULL,
  `voterstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `identified_as` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resident_type` int(11) DEFAULT 1,
  `is_4ps` tinyint(1) DEFAULT 0,
  `is_pwd` tinyint(1) DEFAULT 0,
  `is_senior` tinyint(1) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `national_id`, `account_id`, `citizenship`, `picture`, `firstname`, `middlename`, `lastname`, `alias`, `birthplace`, `birthdate`, `age`, `civilstatus`, `gender`, `purok_id`, `voterstatus`, `identified_as`, `phone`, `email`, `occupation`, `address`, `resident_type`, `is_4ps`, `is_pwd`, `is_senior`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, '091228376271', 107, 'filipino', NULL, 'janine', 'mendoza', 'satuito', 'bea', 'marulas ', '2001-01-01', 22, 'Single', 'Female', 2, 'Yes', 'Unidentified', '09271281533', 'jbsatuito@gmail.com', 'tambay', ' Sto Tomas Binan ', 1, 1, 0, 0, NULL, '2022-12-13 09:09:30', '2023-01-09 11:30:05', NULL),
(20, '019982739102', 111, 'Filipino', NULL, 'Rafael', 'O', 'Bustamante', 'kiko', 'Binan, Laguna', '1968-05-07', 53, 'Married', 'Male', 3, 'Yes', 'Unidentified', '09063183458', 'xxx@gmail.com', 'Accountant', ' 164 Barangay Sto Tomas, Binan Laguna ', 1, 0, 0, 0, NULL, '2023-01-03 11:54:15', '2023-01-09 11:25:23', NULL),
(21, '201922817231', 112, 'Filipino', NULL, 'Alessa ', 'L', 'Crisostomo', 'Aly', 'Manila', '2001-02-03', 21, 'Single', 'Female', 3, 'Yes', NULL, '09501832517', 'alcrisostomo2020@plm.edu.ph', 'Student', '1518 Makiling St. Barangay Sto Tomas', 1, 0, 0, 0, NULL, '2023-01-09 10:21:39', NULL, NULL),
(22, '293884928375', 113, 'Filipino', NULL, 'Adrian Noel', 'T', 'Zaguirre', 'Adrian', 'Manila', '2001-03-04', 21, 'Single', 'Male', 1, 'Yes', NULL, '09063014450', 'antzaguirre2020@plm.edu.ph', 'Student', '1511 Makiling St. Barangay Sto Tomas', 1, 0, 0, 0, NULL, '2023-01-09 10:25:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblblotter`
--

CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL,
  `complainant` varchar(100) DEFAULT NULL,
  `respondent` varchar(100) DEFAULT NULL,
  `victim` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblblotter`
--

INSERT INTO `tblblotter` (`id`, `complainant`, `respondent`, `victim`, `type`, `location`, `date`, `time`, `details`, `status`) VALUES
(28, 'Francis', 'Janine Satuito', 'Francis', 'Incident', 'Sto tomas', '2023-01-09', '12:50:00', ' ', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrgy_info`
--

CREATE TABLE `tblbrgy_info` (
  `id` int(11) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `brgy_name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `city_logo` varchar(100) DEFAULT NULL,
  `brgy_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbrgy_info`
--

INSERT INTO `tblbrgy_info` (`id`, `province`, `town`, `brgy_name`, `number`, `text`, `image`, `city_logo`, `brgy_logo`) VALUES
(1, 'Laguna', 'Binan', 'Sto Tomas', '09271281533', '-', '28122022044731290101348_338607935123663_5392727458222515239_n.jpg', '28122022044731images-removebg-preview.png', '28122022044731243323880_164117952572663_3028781046043129023_n.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblchairmanship`
--

CREATE TABLE `tblchairmanship` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblchairmanship`
--

INSERT INTO `tblchairmanship` (`id`, `title`) VALUES
(2, 'Presiding Officer'),
(3, 'Committee on Appropriation'),
(4, 'Committee on Peace & Order'),
(5, 'Committee on Health'),
(6, 'Committee on Education'),
(7, 'Committee on Rules'),
(8, 'Committee on Infrastructure '),
(9, 'Committee on Solid Waste'),
(10, 'Committee on Sports'),
(11, 'No Chairmanship');

-- --------------------------------------------------------

--
-- Table structure for table `tbldocuments`
--

CREATE TABLE `tbldocuments` (
  `no` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `requested_documents` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblfpscert`
--

CREATE TABLE `tblfpscert` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblfpscert`
--

INSERT INTO `tblfpscert` (`id`, `name`, `current_location`, `applied`) VALUES
(1, 'RENATO R. ALMO', 'Metro Manila', '2022-04-15'),
(2, 'Annie May Barrera', 'Manila', '2022-04-18'),
(3, 'trytr', '5454', '2022-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `tblofficials`
--

CREATE TABLE `tblofficials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `chairmanship` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `termstart` date DEFAULT NULL,
  `termend` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblofficials`
--

INSERT INTO `tblofficials` (`id`, `name`, `chairmanship`, `position`, `termstart`, `termend`, `status`) VALUES
(1, 'Vanesa Zaballa Zapata', '2', '4', '2018-05-14', '2022-12-31', 'Active'),
(4, 'Jesus Dejan Romantigue', '3', '7', '2018-05-14', '2022-12-31', 'Active'),
(5, 'Dionisio Vista Basmayor Jr.', '4', '8', '2018-05-14', '2022-12-31', 'Active'),
(6, 'Restituto Del Rosario Manarin', '5', '9', '2018-05-14', '2022-12-31', 'Active'),
(7, 'Neil De Mesa Bautista', '6', '10', '2018-05-14', '2022-12-31', 'Active'),
(10, 'Eduardo Dimaranan Salazar', '9', '13', '2018-05-14', '2022-12-31', 'Active'),
(11, 'Kimhea Nicole Bermejo Guzman', '10', '14', '2018-05-14', '2022-12-31', 'Active'),
(12, 'Rodel Cunaco Gonzales', '11', '15', '2018-05-14', '2022-12-31', 'Active'),
(14, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(15, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(16, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(17, 'Amanda Magdaraog Dimaranan', '5', '10', '2018-05-14', '2022-12-31', 'Active'),
(20, ' Elizabeth Recana Aquino', '11', '7', '2018-05-14', '2022-12-31', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblpermit`
--

CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `owner1` varchar(200) DEFAULT NULL,
  `owner2` varchar(80) DEFAULT NULL,
  `nature` varchar(220) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

CREATE TABLE `tblposition` (
  `id` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`id`, `position`, `order`) VALUES
(4, 'Barangay Captain', 1),
(7, 'Barangay Kagawad', 2),
(8, 'Barangay Kagawad', 3),
(9, 'Barangay Kagawad', 4),
(10, 'Barangay Kagawad', 5),
(11, 'Barangay Kagawad', 6),
(12, 'Barangay Kagawad', 7),
(13, 'Barangay Kagawad', 8),
(14, 'SK Chairman', 9),
(15, 'Secretary', 10),
(16, 'Treasurer', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tblprecinct`
--

CREATE TABLE `tblprecinct` (
  `id` int(11) NOT NULL,
  `precinct` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblprecinct`
--

INSERT INTO `tblprecinct` (`id`, `precinct`, `details`) VALUES
(2, '09271281533', 'IT '),
(3, '09260746091', 'Vanessa Vallar (Administrative Assistant)');

-- --------------------------------------------------------

--
-- Table structure for table `tblrequest`
--

CREATE TABLE `tblrequest` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support`
--

CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_support`
--

INSERT INTO `tbl_support` (`id`, `name`, `email`, `number`, `subject`, `message`, `date`) VALUES
(10, 'janine', 'jbsatuito@gmail.com', '', 'Feedback', 'The request page is very helpful', '2023-01-09 13:25:01'),
(11, 'janine', 'jbsatuito@gmail.com', '', 'Feedback', 'Account is very helpful', '2023-01-09 13:46:31'),
(12, 'janine', 'jbsatuito@gmail.com', '', 'Feedback', 'Requesting of certificates is really helpful', '2023-01-09 14:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('administrator','staff','user') NOT NULL,
  `avatar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_type`, `avatar`, `created_at`) VALUES
(11, 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'administrator', 'data:image/jpeg;base64,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', '2021-05-03 02:33:03'),
(107, 'janine05', '3989257524822655a948eee028c472ef071c9f31', 'user', '', '2022-12-13 09:09:30'),
(111, 'rafaeljoshuaob1968', 'a283b3c40d7eaa60e3b1cea4b045db5248e9e00e', 'user', '', '2023-01-03 11:54:15'),
(112, 'alessalc2001', '379157d41f51ddef5f956f795910b2fac0fe2cdc', 'user', NULL, '2023-01-09 10:21:39'),
(113, 'adriannoeltz2001', '4cfc3856943d743ba6ee3775f97974c7316ba4e1', 'user', NULL, '2023-01-09 10:25:36'),
(116, 'staff1', '2ae16ac60131902604cd1053c3005e22a93d6115', 'staff', NULL, '2023-01-09 13:51:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `certificate_id` (`certificate_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `purok`
--
ALTER TABLE `purok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `purok_id` (`purok_id`);

--
-- Indexes for table `tblblotter`
--
ALTER TABLE `tblblotter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `tblfpscert`
--
ALTER TABLE `tblfpscert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblofficials`
--
ALTER TABLE `tblofficials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpermit`
--
ALTER TABLE `tblpermit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposition`
--
ALTER TABLE `tblposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrequest`
--
ALTER TABLE `tblrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_support`
--
ALTER TABLE `tbl_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `purok`
--
ALTER TABLE `purok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblblotter`
--
ALTER TABLE `tblblotter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblfpscert`
--
ALTER TABLE `tblfpscert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblofficials`
--
ALTER TABLE `tblofficials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblpermit`
--
ALTER TABLE `tblpermit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblposition`
--
ALTER TABLE `tblposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblrequest`
--
ALTER TABLE `tblrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_support`
--
ALTER TABLE `tbl_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`),
  ADD CONSTRAINT `certificate_requests_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `certificate_requests_ibfk_3` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`);

--
-- Constraints for table `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `residents_ibfk_2` FOREIGN KEY (`purok_id`) REFERENCES `purok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
