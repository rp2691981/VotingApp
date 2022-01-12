-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2022 at 05:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a6project1`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_adminapplicationform`
--

CREATE TABLE `adminapp_adminapplicationform` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `StandPosition` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminapp_adminapplicationform`
--

INSERT INTO `adminapp_adminapplicationform` (`id`, `Name`, `phone`, `email`, `gender`, `StandPosition`) VALUES
(2, 'Ravi', '8210200731', 'rp2691981@gmail.com', 'Male', 'check2'),
(4, 'Ravi Prasad', '8210200731', 'rp2691981@gmail.com', 'Male', 'check2'),
(5, 'priya', '6200533729', 'rp2691981@gmail.com', 'Female', 'check2');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_ad_directcomplain`
--

CREATE TABLE `adminapp_ad_directcomplain` (
  `id` bigint(20) NOT NULL,
  `ComplainFrom_UserId` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `ComplainFor` varchar(200) NOT NULL,
  `Subject` varchar(300) NOT NULL,
  `Description` varchar(850) NOT NULL,
  `ComplainTime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminapp_ad_directcomplain`
--

INSERT INTO `adminapp_ad_directcomplain` (`id`, `ComplainFrom_UserId`, `UserEmail`, `ComplainFor`, `Subject`, `Description`, `ComplainTime`) VALUES
(7, '1', 'User@example.com', 'pata nhi', 'check', 'kdf', '2022-01-02 15:59:32.925598');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_electionpostion`
--

CREATE TABLE `adminapp_electionpostion` (
  `Position` varchar(150) NOT NULL,
  `PostionTimeCreated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminapp_electionpostion`
--

INSERT INTO `adminapp_electionpostion` (`Position`, `PostionTimeCreated`) VALUES
('check1', '2021-12-04 12:23:39.901558'),
('check2', '2021-12-04 12:23:50.256695');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_positionblock`
--

CREATE TABLE `adminapp_positionblock` (
  `id` bigint(20) NOT NULL,
  `CandidateUserId` varchar(100) NOT NULL,
  `position_id` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminapp_positionblock`
--

INSERT INTO `adminapp_positionblock` (`id`, `CandidateUserId`, `position_id`) VALUES
(6, 'ravi1', 'check1'),
(7, 'ravi2', 'check1'),
(8, 'riya1', 'check2'),
(9, 'riya2', 'check2');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_voting`
--

CREATE TABLE `adminapp_voting` (
  `id` bigint(20) NOT NULL,
  `CandidateUserId` varchar(100) NOT NULL,
  `StudentId` varchar(150) NOT NULL,
  `Studentvotingtime` datetime(6) NOT NULL,
  `position_id` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminapp_voting`
--

INSERT INTO `adminapp_voting` (`id`, `CandidateUserId`, `StudentId`, `Studentvotingtime`, `position_id`) VALUES
(4, 'ravi2', '1', '2021-12-04 14:53:55.001028', 'check1'),
(5, 'riya2', '1', '2021-12-04 14:56:09.674459', 'check2'),
(6, 'ravi1', '2', '2021-12-04 14:56:49.726794', 'check1'),
(7, 'riya2', '2', '2021-12-04 14:56:57.106434', 'check2'),
(8, 'ravi1', '3', '2021-12-04 14:57:21.524417', 'check1'),
(9, 'riya1', '3', '2021-12-04 14:57:29.796703', 'check2'),
(10, 'ravi1', '4', '2021-12-04 15:00:08.601719', 'check1'),
(11, 'riya2', '4', '2021-12-04 15:00:15.162383', 'check2'),
(12, 'ravi1', '5', '2021-12-04 15:01:52.944332', 'check1'),
(13, 'riya2', '5', '2021-12-04 15:01:58.547358', 'check2'),
(14, 'ravi1', '6', '2021-12-04 15:02:25.595017', 'check1'),
(15, 'riya2', '6', '2021-12-04 15:02:32.055614', 'check2'),
(16, 'ravi1', '9', '2021-12-05 06:08:57.071444', 'check1'),
(17, 'riya1', '9', '2021-12-05 06:09:06.746136', 'check2');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user login', 7, 'add_userlogin'),
(26, 'Can change user login', 7, 'change_userlogin'),
(27, 'Can delete user login', 7, 'delete_userlogin'),
(28, 'Can view user login', 7, 'view_userlogin'),
(29, 'Can add user profile', 8, 'add_userprofile'),
(30, 'Can change user profile', 8, 'change_userprofile'),
(31, 'Can delete user profile', 8, 'delete_userprofile'),
(32, 'Can view user profile', 8, 'view_userprofile'),
(33, 'Can add candidate login', 9, 'add_candidatelogin'),
(34, 'Can change candidate login', 9, 'change_candidatelogin'),
(35, 'Can delete candidate login', 9, 'delete_candidatelogin'),
(36, 'Can view candidate login', 9, 'view_candidatelogin'),
(37, 'Can add candidate profile', 10, 'add_candidateprofile'),
(38, 'Can change candidate profile', 10, 'change_candidateprofile'),
(39, 'Can delete candidate profile', 10, 'delete_candidateprofile'),
(40, 'Can view candidate profile', 10, 'view_candidateprofile'),
(41, 'Can add staff profile', 11, 'add_staffprofile'),
(42, 'Can change staff profile', 11, 'change_staffprofile'),
(43, 'Can delete staff profile', 11, 'delete_staffprofile'),
(44, 'Can view staff profile', 11, 'view_staffprofile'),
(45, 'Can add staff login', 12, 'add_stafflogin'),
(46, 'Can change staff login', 12, 'change_stafflogin'),
(47, 'Can delete staff login', 12, 'delete_stafflogin'),
(48, 'Can view staff login', 12, 'view_stafflogin'),
(49, 'Can add ad_ direct complain', 13, 'add_ad_directcomplain'),
(50, 'Can change ad_ direct complain', 13, 'change_ad_directcomplain'),
(51, 'Can delete ad_ direct complain', 13, 'delete_ad_directcomplain'),
(52, 'Can view ad_ direct complain', 13, 'view_ad_directcomplain'),
(53, 'Can add election postion', 14, 'add_electionpostion'),
(54, 'Can change election postion', 14, 'change_electionpostion'),
(55, 'Can delete election postion', 14, 'delete_electionpostion'),
(56, 'Can view election postion', 14, 'view_electionpostion'),
(57, 'Can add position block', 15, 'add_positionblock'),
(58, 'Can change position block', 15, 'change_positionblock'),
(59, 'Can delete position block', 15, 'delete_positionblock'),
(60, 'Can view position block', 15, 'view_positionblock'),
(61, 'Can add admin application form', 16, 'add_adminapplicationform'),
(62, 'Can change admin application form', 16, 'change_adminapplicationform'),
(63, 'Can delete admin application form', 16, 'delete_adminapplicationform'),
(64, 'Can view admin application form', 16, 'view_adminapplicationform'),
(65, 'Can add candidate post', 17, 'add_candidatepost'),
(66, 'Can change candidate post', 17, 'change_candidatepost'),
(67, 'Can delete candidate post', 17, 'delete_candidatepost'),
(68, 'Can view candidate post', 17, 'view_candidatepost'),
(69, 'Can add voting', 18, 'add_voting'),
(70, 'Can change voting', 18, 'change_voting'),
(71, 'Can delete voting', 18, 'delete_voting'),
(72, 'Can view voting', 18, 'view_voting');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$AY11YrzEZjSoAsB2xjuY7K$l7Pvj8cfTjMUJOpMr5y+EdjCia6R8iIiP3wyMqRsv2Y=', '2022-01-02 16:03:35.174119', 1, 'admin', '', '', 'rp2691981@gmail.com', 1, 1, '2021-11-27 15:34:50.807382'),
(2, 'pbkdf2_sha256$260000$9qhxZhmSf92yi05akBs0Mt$wRnlfDd8M+1yGMdV4HGuaQfHr2qUI+9Cw8YIxn2RZUI=', '2021-12-08 09:47:18.760529', 0, 'ravi', 'ravi', 'prasad', 'rp2691981@gmail.com', 0, 1, '2021-12-05 13:15:35.000000'),
(3, 'pbkdf2_sha256$260000$70xlOCvJZEeD9MbTNh4PUV$eD4HMZYSVYP/30fsH6+0BPU+zcjPbZ8Y5uzi9knY/cY=', '2022-01-02 16:07:03.648036', 0, 'ravi1234', '', '', '', 0, 1, '2022-01-02 16:06:39.206494');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 2, 22),
(23, 2, 23),
(24, 2, 24),
(25, 2, 25),
(26, 2, 26),
(27, 2, 27),
(28, 2, 28),
(29, 2, 29),
(30, 2, 30),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(34, 2, 34),
(35, 2, 35),
(36, 2, 36),
(37, 2, 37),
(38, 2, 38),
(39, 2, 39),
(40, 2, 40),
(41, 2, 41),
(42, 2, 42),
(43, 2, 43),
(44, 2, 44),
(45, 2, 45),
(46, 2, 46),
(47, 2, 47),
(48, 2, 48),
(49, 2, 49),
(50, 2, 50),
(51, 2, 51),
(52, 2, 52),
(53, 2, 53),
(54, 2, 54),
(55, 2, 55),
(56, 2, 56),
(57, 2, 57),
(58, 2, 58),
(59, 2, 59),
(60, 2, 60),
(61, 2, 61),
(62, 2, 62),
(63, 2, 63),
(64, 2, 64),
(65, 2, 65),
(66, 2, 66),
(67, 2, 67),
(68, 2, 68),
(69, 2, 69),
(70, 2, 70),
(71, 2, 71),
(72, 2, 72);

-- --------------------------------------------------------

--
-- Table structure for table `candidateapp_candidatelogin`
--

CREATE TABLE `candidateapp_candidatelogin` (
  `UserId` varchar(150) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `StandForPosition` varchar(200) NOT NULL,
  `AccountCreated` datetime(6) NOT NULL,
  `ProfileAdded` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidateapp_candidatelogin`
--

INSERT INTO `candidateapp_candidatelogin` (`UserId`, `Password`, `StandForPosition`, `AccountCreated`, `ProfileAdded`) VALUES
('ravi1', '1234', 'check1', '2021-12-04 12:25:07.692906', 'sonam'),
('ravi2', '1234', 'check1', '2021-12-04 12:25:28.258369', 'sonam'),
('riya1', '1234', 'check2', '2021-12-04 12:25:44.748057', 'sonam'),
('riya2', '1234', 'check2', '2021-12-04 12:26:03.632078', 'sonam');

-- --------------------------------------------------------

--
-- Table structure for table `candidateapp_candidatepost`
--

CREATE TABLE `candidateapp_candidatepost` (
  `id` bigint(20) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(900) NOT NULL,
  `Image_File` varchar(600) NOT NULL,
  `CandidateUserId_id` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidateapp_candidatepost`
--

INSERT INTO `candidateapp_candidatepost` (`id`, `Title`, `Description`, `Image_File`, `CandidateUserId_id`) VALUES
(11, 'ja i mata di', 'jai mata di', 'Post/rock.jpeg', 'ravi1'),
(12, 'prem', 'chutya', 'Post/scene1.jpeg', 'riya1'),
(13, 'ji', 'lkkh', 'Post/leaf.jpeg', 'riya2'),
(14, 'nikl', 'yha sa', 'Post/pexels-angele-j-128388.jpg', 'ravi1');

-- --------------------------------------------------------

--
-- Table structure for table `candidateapp_candidateprofile`
--

CREATE TABLE `candidateapp_candidateprofile` (
  `UserId_id` varchar(150) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `AlternateNumber` varchar(25) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidateapp_candidateprofile`
--

INSERT INTO `candidateapp_candidateprofile` (`UserId_id`, `Name`, `Phone`, `AlternateNumber`, `Email`, `Gender`) VALUES
('ravi1', 'Enter your Name', '8210200731', 'Alternate Number', 'User@example.com', 'gender!'),
('ravi2', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!'),
('riya1', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!'),
('riya2', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-11-27 15:42:48.803351', 'ravi', 'UserLogin object (ravi)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-11-27 16:18:18.820557', 'sonam', 'UserLogin object (sonam)', 3, '', 7, 1),
(3, '2021-11-27 16:46:51.992722', 'ravi', 'UserLogin object (ravi)', 3, '', 7, 1),
(4, '2021-11-27 17:15:01.160036', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2021-11-27 17:15:07.583245', 'ravi@1234', 'CandidateProfile object (ravi@1234)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2021-11-27 17:17:04.518494', 'ravi', 'UserProfile object (ravi)', 1, '[{\"added\": {}}]', 8, 1),
(7, '2021-11-27 17:17:11.065643', 'sonam', 'UserProfile object (sonam)', 1, '[{\"added\": {}}]', 8, 1),
(8, '2021-11-27 17:17:29.220386', 'priya', 'UserLogin object (priya)', 1, '[{\"added\": {}}]', 7, 1),
(9, '2021-11-27 17:17:40.954559', 'priya', 'UserProfile object (priya)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2021-11-27 17:32:32.072567', 'priya', 'CandidateProfile object (priya)', 1, '[{\"added\": {}}]', 10, 1),
(11, '2021-11-27 17:32:39.989479', 'ravi', 'CandidateProfile object (ravi)', 1, '[{\"added\": {}}]', 10, 1),
(12, '2021-11-27 17:32:47.069054', 'ritik', 'CandidateProfile object (ritik)', 1, '[{\"added\": {}}]', 10, 1),
(13, '2021-11-27 17:32:55.151197', 'riya', 'CandidateProfile object (riya)', 1, '[{\"added\": {}}]', 10, 1),
(14, '2021-11-27 17:33:02.524907', 'sonam', 'CandidateProfile object (sonam)', 1, '[{\"added\": {}}]', 10, 1),
(15, '2021-11-27 17:33:16.915267', 'riya', 'UserProfile object (riya)', 1, '[{\"added\": {}}]', 8, 1),
(16, '2021-11-27 19:40:30.697491', 'ron@1234', 'CandidateProfile object (ron@1234)', 1, '[{\"added\": {}}]', 10, 1),
(17, '2021-11-27 19:41:04.902155', 'sonam', 'CandidateLogin object (sonam)', 3, '', 9, 1),
(18, '2021-11-27 19:41:04.902155', 'ron@1234', 'CandidateLogin object (ron@1234)', 3, '', 9, 1),
(19, '2021-11-27 19:41:04.910142', 'riya', 'CandidateLogin object (riya)', 3, '', 9, 1),
(20, '2021-11-27 19:41:04.910142', 'ritik', 'CandidateLogin object (ritik)', 3, '', 9, 1),
(21, '2021-11-27 19:41:04.918140', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(22, '2021-11-27 19:41:04.918140', 'ravi', 'CandidateLogin object (ravi)', 3, '', 9, 1),
(23, '2021-11-27 19:41:04.918140', 'priya', 'CandidateLogin object (priya)', 3, '', 9, 1),
(24, '2021-11-27 19:41:15.699326', 'sonam', 'UserLogin object (sonam)', 3, '', 7, 1),
(25, '2021-11-27 19:41:15.707320', 'ron12', 'UserLogin object (ron12)', 3, '', 7, 1),
(26, '2021-11-27 19:41:15.707320', 'riya', 'UserLogin object (riya)', 3, '', 7, 1),
(27, '2021-11-27 19:41:15.715320', 'ravi1234', 'UserLogin object (ravi1234)', 3, '', 7, 1),
(28, '2021-11-27 19:41:15.715320', 'ravi', 'UserLogin object (ravi)', 3, '', 7, 1),
(29, '2021-11-27 19:41:15.723359', 'priya', 'UserLogin object (priya)', 3, '', 7, 1),
(30, '2021-11-27 19:46:58.280790', 'ravi', 'UserLogin object (ravi)', 3, '', 7, 1),
(31, '2021-11-27 20:03:15.404949', 'sonam', 'UserLogin object (sonam)', 3, '', 7, 1),
(32, '2021-11-27 20:03:15.437174', 'ron1234', 'UserLogin object (ron1234)', 3, '', 7, 1),
(33, '2021-11-27 20:03:15.437174', 'riya', 'UserLogin object (riya)', 3, '', 7, 1),
(34, '2021-11-27 20:03:15.445174', 'ravi', 'UserLogin object (ravi)', 3, '', 7, 1),
(35, '2021-11-28 07:50:41.749861', 'sonam', 'CandidateLogin object (sonam)', 3, '', 9, 1),
(36, '2021-11-28 07:50:41.753864', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(37, '2021-11-28 07:50:41.754848', 'ravi', 'CandidateLogin object (ravi)', 3, '', 9, 1),
(38, '2021-11-28 07:50:54.383137', 'sonam', 'UserLogin object (sonam)', 3, '', 7, 1),
(39, '2021-11-28 07:50:54.385131', 'ravi@1234', 'UserLogin object (ravi@1234)', 3, '', 7, 1),
(40, '2021-11-28 07:50:54.386116', 'priya', 'UserLogin object (priya)', 3, '', 7, 1),
(41, '2021-11-30 05:49:16.601759', 'Ravi', 'StaffLogin object (Ravi)', 1, '[{\"added\": {}}]', 12, 1),
(42, '2021-11-30 05:50:48.140665', 'Ravi', 'StaffProfile object (Ravi)', 1, '[{\"added\": {}}]', 11, 1),
(43, '2021-11-30 10:08:16.114777', 'sourav', 'CandidateLogin object (sourav)', 3, '', 9, 1),
(44, '2021-11-30 10:08:16.118248', 'sonam', 'CandidateLogin object (sonam)', 3, '', 9, 1),
(45, '2021-11-30 10:08:16.119246', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(46, '2021-11-30 10:08:16.120243', 'ravi', 'CandidateLogin object (ravi)', 3, '', 9, 1),
(47, '2021-11-30 10:08:16.121240', 'konkeya', 'CandidateLogin object (konkeya)', 3, '', 9, 1),
(48, '2021-11-30 10:08:16.122238', 'jyoti', 'CandidateLogin object (jyoti)', 3, '', 9, 1),
(49, '2021-11-30 10:08:16.123235', '1234', 'CandidateLogin object (1234)', 3, '', 9, 1),
(50, '2021-11-30 10:08:45.547294', 'sonam1234', 'UserLogin object (sonam1234)', 3, '', 7, 1),
(51, '2021-11-30 10:08:45.577070', 'sonam', 'UserLogin object (sonam)', 3, '', 7, 1),
(52, '2021-11-30 10:08:45.579064', 'roma', 'UserLogin object (roma)', 3, '', 7, 1),
(53, '2021-11-30 10:08:45.580061', 'riya', 'UserLogin object (riya)', 3, '', 7, 1),
(54, '2021-11-30 10:08:45.582094', 'ravi@1234', 'UserLogin object (ravi@1234)', 3, '', 7, 1),
(55, '2021-11-30 10:08:45.584089', 'ravi', 'UserLogin object (ravi)', 3, '', 7, 1),
(56, '2021-11-30 10:08:45.585052', 'priya12345', 'UserLogin object (priya12345)', 3, '', 7, 1),
(57, '2021-11-30 10:08:45.588040', '1234', 'UserLogin object (1234)', 3, '', 7, 1),
(58, '2021-11-30 10:15:58.775073', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 1, '[{\"added\": {}}]', 9, 1),
(59, '2021-11-30 10:16:10.010506', 'ravi@1234', 'CandidateProfile object (ravi@1234)', 1, '[{\"added\": {}}]', 10, 1),
(60, '2021-11-30 10:17:02.335163', 'Ravi', 'StaffLogin object (Ravi)', 3, '', 12, 1),
(61, '2021-11-30 10:17:02.341146', '1234', 'StaffLogin object (1234)', 3, '', 12, 1),
(62, '2021-11-30 10:19:03.338308', 'ravi', 'StaffLogin object (ravi)', 1, '[{\"added\": {}}]', 12, 1),
(63, '2021-11-30 10:19:17.619728', 'sonam', 'StaffLogin object (sonam)', 1, '[{\"added\": {}}]', 12, 1),
(64, '2021-11-30 10:20:16.243723', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(65, '2021-11-30 10:35:15.686373', 'ravi@1234', 'UserLogin object (ravi@1234)', 1, '[{\"added\": {}}]', 7, 1),
(66, '2021-11-30 10:35:57.494605', 'ravi@1234', 'UserProfile object (ravi@1234)', 1, '[{\"added\": {}}]', 8, 1),
(67, '2021-11-30 10:38:42.301398', 'ravi', 'StaffProfile object (ravi)', 1, '[{\"added\": {}}]', 11, 1),
(68, '2021-11-30 10:47:15.223579', 'ravi@1234', 'CandidateProfile object (ravi@1234)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Phone\", \"AlternateNumber\", \"Gender\"]}}]', 10, 1),
(69, '2021-11-30 18:33:09.298309', 'check', 'UserLogin object (check)', 3, '', 7, 1),
(70, '2021-11-30 18:50:56.389089', 'sonam', 'StaffProfile object (sonam)', 1, '[{\"added\": {}}]', 11, 1),
(71, '2021-11-30 19:00:55.044841', 'ravi@1234', 'UserLogin object (ravi@1234)', 3, '', 7, 1),
(72, '2021-11-30 19:00:55.045838', 'Ravi12', 'UserLogin object (Ravi12)', 3, '', 7, 1),
(73, '2021-11-30 19:00:55.047832', 'raj', 'UserLogin object (raj)', 3, '', 7, 1),
(74, '2021-11-30 19:01:08.372923', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(75, '2021-11-30 19:01:08.400848', 'raj', 'CandidateLogin object (raj)', 3, '', 9, 1),
(76, '2021-12-01 13:59:36.485344', 'ron01', 'UserLogin object (ron01)', 3, '', 7, 1),
(77, '2021-12-01 13:59:36.488336', 'riya05', 'UserLogin object (riya05)', 3, '', 7, 1),
(78, '2021-12-01 13:59:36.490332', 'ravi19', 'UserLogin object (ravi19)', 3, '', 7, 1),
(79, '2021-12-01 13:59:36.491329', 'raj07', 'UserLogin object (raj07)', 3, '', 7, 1),
(80, '2021-12-01 13:59:55.686447', 'riya01', 'CandidateLogin object (riya01)', 3, '', 9, 1),
(81, '2021-12-01 13:59:55.714801', 'ravi02', 'CandidateLogin object (ravi02)', 3, '', 9, 1),
(82, '2021-12-01 13:59:55.717750', 'raj06', 'CandidateLogin object (raj06)', 3, '', 9, 1),
(83, '2021-12-01 13:59:55.718749', 'raj05', 'CandidateLogin object (raj05)', 3, '', 9, 1),
(84, '2021-12-01 15:11:25.989252', 'ravi', 'StaffProfile object (ravi)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1),
(85, '2021-12-01 18:17:40.643801', 'ravi04', 'UserProfile object (ravi04)', 2, '[]', 8, 1),
(86, '2021-12-01 19:36:46.346423', 'ravi04', 'UserLogin object (ravi04)', 2, '[{\"changed\": {\"fields\": [\"ProfileAdded\"]}}]', 7, 1),
(87, '2021-12-01 19:51:21.977823', 'check', 'UserLogin object (check)', 3, '', 7, 1),
(88, '2021-12-01 19:51:22.001780', 'ravi01', 'UserLogin object (ravi01)', 3, '', 7, 1),
(89, '2021-12-01 19:51:22.009778', 'ravi02', 'UserLogin object (ravi02)', 3, '', 7, 1),
(90, '2021-12-01 19:51:22.009778', 'ravi03', 'UserLogin object (ravi03)', 3, '', 7, 1),
(91, '2021-12-01 19:51:22.009778', 'ravi04', 'UserLogin object (ravi04)', 3, '', 7, 1),
(92, '2021-12-01 19:51:22.009778', 'ravi@1234', 'UserLogin object (ravi@1234)', 3, '', 7, 1),
(93, '2021-12-02 06:08:04.952852', '1', 'Ad_DirectComplain object (1)', 1, '[{\"added\": {}}]', 13, 1),
(94, '2021-12-02 06:25:34.346654', '2', 'Ad_DirectComplain object (2)', 1, '[{\"added\": {}}]', 13, 1),
(95, '2021-12-02 11:13:13.989054', 'abc', 'ElectionPostion object (abc)', 1, '[{\"added\": {}}]', 14, 1),
(96, '2021-12-02 11:13:21.839549', '1234', 'ElectionPostion object (1234)', 1, '[{\"added\": {}}]', 14, 1),
(97, '2021-12-02 11:14:51.026497', 'dont no', 'ElectionPostion object (dont no)', 1, '[{\"added\": {}}]', 14, 1),
(98, '2021-12-02 11:39:51.620064', '1', 'PositionBlock object (1)', 1, '[{\"added\": {}}]', 15, 1),
(99, '2021-12-02 11:40:02.693085', '2', 'PositionBlock object (2)', 1, '[{\"added\": {}}]', 15, 1),
(100, '2021-12-02 11:40:15.560476', '1234', 'ElectionPostion object (1234)', 3, '', 14, 1),
(101, '2021-12-02 13:06:49.468461', 'kl milta ha', 'ElectionPostion object (kl milta ha)', 3, '', 14, 1),
(102, '2021-12-02 13:06:49.494392', 'dont no', 'ElectionPostion object (dont no)', 3, '', 14, 1),
(103, '2021-12-02 13:06:49.496387', 'bhg th sa', 'ElectionPostion object (bhg th sa)', 3, '', 14, 1),
(104, '2021-12-02 13:06:49.497385', 'abc', 'ElectionPostion object (abc)', 3, '', 14, 1),
(105, '2021-12-02 13:42:12.747275', 'abc', 'ElectionPostion object (abc)', 3, '', 14, 1),
(106, '2021-12-02 13:42:12.774212', '1234', 'ElectionPostion object (1234)', 3, '', 14, 1),
(107, '2021-12-02 14:02:39.978600', 'ravi@1234', 'CandidateLogin object (ravi@1234)', 3, '', 9, 1),
(108, '2021-12-02 14:05:05.771431', 'check1', 'ElectionPostion object (check1)', 3, '', 14, 1),
(109, '2021-12-02 15:13:05.328019', 'soname01', 'CandidateProfile object (soname01)', 2, '[]', 10, 1),
(110, '2021-12-03 16:06:10.661949', '1', 'CandidatePost object (1)', 1, '[{\"added\": {}}]', 17, 1),
(111, '2021-12-03 17:08:39.202549', '4', 'CandidatePost object (4)', 1, '[{\"added\": {}}]', 17, 1),
(112, '2021-12-03 19:15:18.482955', 'dilip01', 'CandidateLogin object (dilip01)', 3, '', 9, 1),
(113, '2021-12-03 19:15:35.858566', '4', 'CandidatePost object (4)', 3, '', 17, 1),
(114, '2021-12-04 05:10:35.484295', '7', 'CandidatePost object (7)', 3, '', 17, 1),
(115, '2021-12-04 05:10:35.492286', '6', 'CandidatePost object (6)', 3, '', 17, 1),
(116, '2021-12-04 05:12:38.283900', '8', 'CandidatePost object (8)', 1, '[{\"added\": {}}]', 17, 1),
(117, '2021-12-04 05:13:10.972437', '9', 'CandidatePost object (9)', 1, '[{\"added\": {}}]', 17, 1),
(118, '2021-12-04 10:55:04.897783', 'check1', 'ElectionPostion object (check1)', 1, '[{\"added\": {}}]', 14, 1),
(119, '2021-12-04 10:55:51.827208', '5', 'PositionBlock object (5)', 1, '[{\"added\": {}}]', 15, 1),
(120, '2021-12-04 10:56:21.110613', '1', 'Voting object (1)', 1, '[{\"added\": {}}]', 18, 1),
(121, '2021-12-04 11:11:30.878893', '1', 'Voting object (1)', 2, '[]', 18, 1),
(122, '2021-12-04 12:02:50.529762', 'riya01', 'CandidateLogin object (riya01)', 1, '[{\"added\": {}}]', 9, 1),
(123, '2021-12-04 12:03:00.352722', 'riya01', 'CandidateProfile object (riya01)', 1, '[{\"added\": {}}]', 10, 1),
(124, '2021-12-04 12:21:58.144138', 'check2', 'ElectionPostion object (check2)', 3, '', 14, 1),
(125, '2021-12-04 12:21:58.175257', 'check1', 'ElectionPostion object (check1)', 3, '', 14, 1),
(126, '2021-12-04 12:22:10.781826', 'soname01', 'CandidateLogin object (soname01)', 3, '', 9, 1),
(127, '2021-12-04 12:22:10.782823', 'riya02', 'CandidateLogin object (riya02)', 3, '', 9, 1),
(128, '2021-12-04 12:22:10.784818', 'riya01', 'CandidateLogin object (riya01)', 3, '', 9, 1),
(129, '2021-12-04 12:22:10.785815', 'lala', 'CandidateLogin object (lala)', 3, '', 9, 1),
(130, '2021-12-04 12:22:10.786812', 'chlhatt', 'CandidateLogin object (chlhatt)', 3, '', 9, 1),
(131, '2021-12-04 12:22:37.856997', 'sonam01', 'UserLogin object (sonam01)', 3, '', 7, 1),
(132, '2021-12-04 14:39:07.222960', '2', 'Voting object (2)', 1, '[{\"added\": {}}]', 18, 1),
(133, '2021-12-04 14:45:33.718543', '2', 'Voting object (2)', 3, '', 18, 1),
(134, '2021-12-04 14:47:01.079145', '3', 'Voting object (3)', 1, '[{\"added\": {}}]', 18, 1),
(135, '2021-12-04 14:47:29.251724', '3', 'Voting object (3)', 3, '', 18, 1),
(136, '2021-12-05 06:31:24.962623', '10', 'CandidatePost object (10)', 3, '', 17, 1),
(137, '2021-12-05 13:15:35.792309', '2', 'ravi', 1, '[{\"added\": {}}]', 4, 1),
(138, '2021-12-05 13:17:34.780538', '2', 'ravi', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"User permissions\"]}}]', 4, 1),
(139, '2022-01-02 16:06:39.490866', '3', 'ravi1234', 1, '[{\"added\": {}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(16, 'AdminApp', 'adminapplicationform'),
(13, 'AdminApp', 'ad_directcomplain'),
(14, 'AdminApp', 'electionpostion'),
(15, 'AdminApp', 'positionblock'),
(18, 'AdminApp', 'voting'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'CandidateApp', 'candidatelogin'),
(17, 'CandidateApp', 'candidatepost'),
(10, 'CandidateApp', 'candidateprofile'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(12, 'Staff', 'stafflogin'),
(11, 'Staff', 'staffprofile'),
(7, 'Student', 'userlogin'),
(8, 'Student', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Student', '0001_initial', '2021-11-27 15:33:52.936067'),
(2, 'contenttypes', '0001_initial', '2021-11-27 15:33:52.988171'),
(3, 'auth', '0001_initial', '2021-11-27 15:33:53.291206'),
(4, 'admin', '0001_initial', '2021-11-27 15:33:53.390939'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-11-27 15:33:53.411569'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-11-27 15:33:53.425532'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-11-27 15:33:53.469074'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-11-27 15:33:53.515036'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-11-27 15:33:53.537969'),
(10, 'auth', '0004_alter_user_username_opts', '2021-11-27 15:33:53.553925'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-11-27 15:33:53.590826'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-11-27 15:33:53.592822'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-11-27 15:33:53.597050'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-11-27 15:33:53.614134'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-11-27 15:33:53.637083'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-11-27 15:33:53.656836'),
(17, 'auth', '0011_update_proxy_permissions', '2021-11-27 15:33:53.667816'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-11-27 15:33:53.691745'),
(19, 'sessions', '0001_initial', '2021-11-27 15:33:53.723700'),
(20, 'Student', '0002_auto_20211127_2110', '2021-11-27 15:40:44.264384'),
(21, 'Student', '0003_alter_userprofile_email', '2021-11-27 15:41:38.728366'),
(22, 'CandidateApp', '0001_initial', '2021-11-27 17:14:04.001875'),
(23, 'Staff', '0001_initial', '2021-11-30 05:47:05.399109'),
(24, 'CandidateApp', '0002_candidatelogin_profileadded', '2021-11-30 10:15:03.270567'),
(25, 'Student', '0004_userlogin_profileadded', '2021-11-30 10:15:03.293475'),
(26, 'AdminApp', '0001_initial', '2021-12-02 06:04:37.530830'),
(27, 'Student', '0005_alter_userlogin_profileadded', '2021-12-02 06:04:37.542833'),
(28, 'AdminApp', '0002_electionpostion', '2021-12-02 11:10:13.791698'),
(29, 'AdminApp', '0003_positionblock', '2021-12-02 11:35:42.767161'),
(30, 'CandidateApp', '0003_remove_candidateprofile_profile', '2021-12-02 15:11:33.730386'),
(31, 'Student', '0006_remove_userprofile_profile', '2021-12-02 15:11:33.741961'),
(32, 'AdminApp', '0004_adminapplicationform', '2021-12-02 17:06:59.215034'),
(33, 'CandidateApp', '0004_candidatepost', '2021-12-03 15:29:56.959347'),
(34, 'AdminApp', '0005_voting', '2021-12-04 09:33:00.162138'),
(35, 'AdminApp', '0006_alter_voting_position', '2021-12-04 14:46:17.177623');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('heraqndrfka1ubbf6tntrlgd8qxx7oux', '.eJxVjrsOwjAQBP_FNbJiO_GDCkFFQYWoo_OdTQzIkRKHBvHvJCIFtDu7o32xFqbStdMYhjYR2zLBNr-ZB7yHvAC6Qb72HPtchuT5UuErHfmpp_DYr90_QQdjN69V4yIqi0QRZaXJeACExkjvI3ktsBKRrKmsl7V2ShNpZawztsFauWaRngvEeIBMiaCEyyw_0vfzAM-0E1LV7P0BY2RE1w:1mrE78:sJ0lgwvqfThG3N6pBnwZD-2cogAxZMdKd4JX_G0_RbE', '2021-12-12 06:56:42.296645'),
('hyvfr0gl0c7oud9icodkqz675obchl9f', '.eJyrVgouKU1JzSsJLU4t8kwpyFayyivNydFRck7MS8lMSSxJRZcILklMS8vJT8_My4SL1gIAr-kaYw:1mtnmP:UH8Il5yO9j-ZWk8lsOxwm6EgOB4TvUEPH8FDTZyfakM', '2021-12-19 09:25:57.230929'),
('w8ox4ybyd7x5xgubnrup53fefrtxmpzh', '.eJxtkUtPwzAQhP8KyrmK8michFML4sABCamCa7T22slSx44SBw6I_45tVX0grjPfjnZ2v5ODW1Ea97bI-RmnY3KfLNbAmOXJJnkEg4Tg5MU1q9YbPwRKaduToSu1g9UN3erZjtAHhYgrjYM4ShMM_ADT21RY42biaUDSk7ukLxalfjixNwEDLIOfLqtWibIRiEoUGcOaAwio6oJzhZzlIssVNnXW8GLL2pIhsrJu2rqpxLZsqxC6Rxpjh1DsaQTSPneeCtbmbZPv-qD49ca_aKw1wydFYyQTnfOZXmerSEvP3CFpmuIRI_cPIgY9gHOXpPMfDisfyd18IiL7adIkwJE17yS_PFAkP79XjJhv:1mt1S0:Ise4Pk4xBA9BLpGqV7ygz_-cj11xD3uR8fwfV9OpsRw', '2021-12-17 05:49:40.166039');

-- --------------------------------------------------------

--
-- Table structure for table `staff_stafflogin`
--

CREATE TABLE `staff_stafflogin` (
  `UserId` varchar(150) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `StaffActive` varchar(10) NOT NULL,
  `AccountCreated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_stafflogin`
--

INSERT INTO `staff_stafflogin` (`UserId`, `Password`, `StaffActive`, `AccountCreated`) VALUES
('ravi', '1234', '1', '2021-12-01 14:01:35.256755'),
('sonam', '1234', '1', '2021-11-30 10:19:17.606763');

-- --------------------------------------------------------

--
-- Table structure for table `staff_staffprofile`
--

CREATE TABLE `staff_staffprofile` (
  `UserId_id` varchar(150) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `AlternateNumber` varchar(25) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_staffprofile`
--

INSERT INTO `staff_staffprofile` (`UserId_id`, `Name`, `Phone`, `AlternateNumber`, `Email`, `Gender`) VALUES
('ravi', 'Ravi Prasad', '8210200731', '8210200732', 'rp2691981@gmail.com', 'Male'),
('sonam', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!');

-- --------------------------------------------------------

--
-- Table structure for table `student_userlogin`
--

CREATE TABLE `student_userlogin` (
  `UserId` varchar(150) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `AccountCreated` datetime(6) NOT NULL,
  `ProfileAdded` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_userlogin`
--

INSERT INTO `student_userlogin` (`UserId`, `Password`, `AccountCreated`, `ProfileAdded`) VALUES
('1', '1', '2021-12-04 12:27:14.116280', 'sonam'),
('2', '2', '2021-12-04 12:27:22.249506', 'sonam'),
('3', '3', '2021-12-04 12:27:30.121859', 'sonam'),
('4', '4', '2021-12-04 12:27:38.387680', 'sonam'),
('5', '5', '2021-12-04 12:27:47.003477', 'sonam'),
('6', '6', '2021-12-04 12:27:54.673751', 'sonam'),
('9', '9', '2021-12-05 06:05:09.912550', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `student_userprofile`
--

CREATE TABLE `student_userprofile` (
  `UserId_id` varchar(150) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `AlternateNumber` varchar(25) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(19) NOT NULL,
  `CollegeName` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_userprofile`
--

INSERT INTO `student_userprofile` (`UserId_id`, `Name`, `Phone`, `AlternateNumber`, `Email`, `Gender`, `CollegeName`) VALUES
('1', 'ravi', '8210200731', '8210200731', 'User@example.com', 'male', 'Netaji Subhas University'),
('2', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University'),
('3', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University'),
('4', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University'),
('5', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University'),
('6', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University'),
('9', 'Enter your Name', 'Add Number', 'Alternate Number', 'User@example.com', 'gender!', 'Netaji Subhas University');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminapp_adminapplicationform`
--
ALTER TABLE `adminapp_adminapplicationform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_ad_directcomplain`
--
ALTER TABLE `adminapp_ad_directcomplain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_electionpostion`
--
ALTER TABLE `adminapp_electionpostion`
  ADD PRIMARY KEY (`Position`);

--
-- Indexes for table `adminapp_positionblock`
--
ALTER TABLE `adminapp_positionblock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CandidateUserId` (`CandidateUserId`),
  ADD KEY `AdminApp_positionblo_position_id_65ac2379_fk_AdminApp_` (`position_id`);

--
-- Indexes for table `adminapp_voting`
--
ALTER TABLE `adminapp_voting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminApp_voting_position_id_40ec6418_fk_AdminApp_` (`position_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `candidateapp_candidatelogin`
--
ALTER TABLE `candidateapp_candidatelogin`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `candidateapp_candidatepost`
--
ALTER TABLE `candidateapp_candidatepost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CandidateApp_candida_CandidateUserId_id_58684dc0_fk_Candidate` (`CandidateUserId_id`);

--
-- Indexes for table `candidateapp_candidateprofile`
--
ALTER TABLE `candidateapp_candidateprofile`
  ADD PRIMARY KEY (`UserId_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `staff_stafflogin`
--
ALTER TABLE `staff_stafflogin`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `staff_staffprofile`
--
ALTER TABLE `staff_staffprofile`
  ADD PRIMARY KEY (`UserId_id`);

--
-- Indexes for table `student_userlogin`
--
ALTER TABLE `student_userlogin`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `student_userprofile`
--
ALTER TABLE `student_userprofile`
  ADD PRIMARY KEY (`UserId_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminapp_adminapplicationform`
--
ALTER TABLE `adminapp_adminapplicationform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adminapp_ad_directcomplain`
--
ALTER TABLE `adminapp_ad_directcomplain`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `adminapp_positionblock`
--
ALTER TABLE `adminapp_positionblock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `adminapp_voting`
--
ALTER TABLE `adminapp_voting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `candidateapp_candidatepost`
--
ALTER TABLE `candidateapp_candidatepost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminapp_positionblock`
--
ALTER TABLE `adminapp_positionblock`
  ADD CONSTRAINT `AdminApp_positionblo_position_id_65ac2379_fk_AdminApp_` FOREIGN KEY (`position_id`) REFERENCES `adminapp_electionpostion` (`Position`);

--
-- Constraints for table `adminapp_voting`
--
ALTER TABLE `adminapp_voting`
  ADD CONSTRAINT `AdminApp_voting_position_id_40ec6418_fk_AdminApp_` FOREIGN KEY (`position_id`) REFERENCES `adminapp_electionpostion` (`Position`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `candidateapp_candidatepost`
--
ALTER TABLE `candidateapp_candidatepost`
  ADD CONSTRAINT `CandidateApp_candida_CandidateUserId_id_58684dc0_fk_Candidate` FOREIGN KEY (`CandidateUserId_id`) REFERENCES `candidateapp_candidatelogin` (`UserId`);

--
-- Constraints for table `candidateapp_candidateprofile`
--
ALTER TABLE `candidateapp_candidateprofile`
  ADD CONSTRAINT `CandidateApp_candida_UserId_id_bce988b6_fk_Candidate` FOREIGN KEY (`UserId_id`) REFERENCES `candidateapp_candidatelogin` (`UserId`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `staff_staffprofile`
--
ALTER TABLE `staff_staffprofile`
  ADD CONSTRAINT `Staff_staffprofile_UserId_id_329898e0_fk_Staff_stafflogin_UserId` FOREIGN KEY (`UserId_id`) REFERENCES `staff_stafflogin` (`UserId`);

--
-- Constraints for table `student_userprofile`
--
ALTER TABLE `student_userprofile`
  ADD CONSTRAINT `Student_userprofile_UserId_id_01956ea6_fk_Student_u` FOREIGN KEY (`UserId_id`) REFERENCES `student_userlogin` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
