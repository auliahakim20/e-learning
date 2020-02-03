-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 03, 2020 at 09:04 AM
-- Server version: 10.0.38-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adaptive_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Instution', 2, 1576639057),
('Instution', 10, 1576592917),
('Instution', 42, 1576803889),
('Instution', 43, 1576803891),
('Instution', 50, 1576803918),
('Instution', 51, 1576803921),
('Lecture', 11, 1576638581),
('Lecture', 44, 1576803894),
('Lecture', 45, 1576803897),
('Lecture', 52, 1576803926),
('Lecture', 53, 1576803929),
('Lecture', 104, 1580634922),
('Member', 39, 1576737101),
('Member', 46, 1576803900),
('Member', 47, 1576803903),
('Member', 54, 1576803934),
('Member', 56, 1576803938),
('Member', 58, 1576803940),
('Member', 64, 1576804138),
('Member', 66, 1576804142),
('Member', 69, 1576809070),
('Member', 70, 1576809072),
('Member', 71, 1576811137),
('Member', 73, 1576811157),
('Member', 75, 1576811166),
('Member', 76, 1576811185),
('Member', 77, 1576811193),
('Member', 79, 1576811211),
('Member', 80, 1576811221),
('Member', 82, 1576811235),
('Member', 83, 1576811262),
('Member', 84, 1576811284),
('Member', 86, 1576811294),
('Member', 89, 1576811313),
('Member', 91, 1576811322),
('Member', 93, 1576811346),
('Member', 94, 1576811355),
('Member', 95, 1576811363),
('Member', 97, 1576811374),
('Member', 98, 1576811388),
('Member', 99, 1576811399),
('Member', 100, 1576814449),
('Member', 102, 1576814457),
('Member', 103, 1580634830),
('Sysadmin', 1, 1572675180);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1572617269, 1572617269),
('/course/*', 2, NULL, NULL, NULL, 1576505149, 1576505149),
('/course/index', 2, NULL, NULL, NULL, 1580614588, 1580614588),
('/course/view', 2, NULL, NULL, NULL, 1580614591, 1580614591),
('/institution-instructor/*', 2, NULL, NULL, NULL, 1576503915, 1576503915),
('/institution/*', 2, NULL, NULL, NULL, 1576503913, 1576503913),
('/quiz-category/*', 2, NULL, NULL, NULL, 1576505131, 1576505131),
('/quiz/*', 2, NULL, NULL, NULL, 1576505132, 1576505132),
('/quiz/site/*', 2, NULL, NULL, NULL, 1576737145, 1576737145),
('/site/*', 2, NULL, NULL, NULL, 1572674933, 1572674933),
('/subject/*', 2, NULL, NULL, NULL, 1572675115, 1572675115),
('/user/admin/*', 2, NULL, NULL, NULL, 1572674899, 1572674899),
('/user/profile/*', 2, NULL, NULL, NULL, 1572674901, 1572674901),
('/user/recovery/*', 2, NULL, NULL, NULL, 1572674902, 1572674902),
('/user/registration/*', 2, NULL, NULL, NULL, 1572674903, 1572674903),
('/user/security/*', 2, NULL, NULL, NULL, 1572674903, 1572674903),
('/user/settings/*', 2, NULL, NULL, NULL, 1572674904, 1572674904),
('Instution', 1, NULL, NULL, NULL, 1576401831, 1576503934),
('Lecture', 1, NULL, NULL, NULL, 1576503827, 1576503833),
('Member', 1, NULL, NULL, NULL, 1572674892, 1580614597),
('Sysadmin', 1, NULL, NULL, NULL, 1572617267, 1572665245);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Instution', '/institution-instructor/*'),
('Instution', '/institution/*'),
('Lecture', '/course/*'),
('Lecture', '/quiz-category/*'),
('Lecture', '/quiz/*'),
('Member', '/course/index'),
('Member', '/course/view'),
('Member', '/quiz/*'),
('Member', '/quiz/site/*'),
('Member', '/site/*'),
('Member', '/user/settings/*'),
('Sysadmin', '/*');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `about` text,
  `institution_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `about`, `institution_id`, `subject_id`, `level_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Natural Language Processing', 'Hard to say, but easy to write? Solve your complicated life. Keep silent and enjoy to learn Natural Language Processing', 2, 1, 1, 11, 1, 1576643162, 1576922986),
(2, 'Business Intelligence', 'Business Intelligence Program', 3, 1, 1, 1, 1, 1576921383, 1576921383),
(3, 'Data Mining', 'Easy to do but hard to understand? Solving your problem future prediction with Data Mining way', 3, 2, 1, 1, 1, 1576921416, 1576923260),
(4, 'Computer Vision', 'Computer Vision on Math', 3, 2, 2, 1, 1, 1576921440, 1576921440),
(5, 'Network Engineering', 'Solve your complicated network connection with Network Engineering', 3, 2, 2, 1, 1, 1576921497, 1576923409),
(6, 'Artificial Intelligence', 'Artificial Intelligence to clone your mind', 3, 2, 2, 1, 1, 1576921573, 1576921581),
(7, 'PHP', 'PHP Hypertext Preprocessor.', 10, 2, 1, 1, 1, 1576922015, 1576922015),
(8, 'Git', 'Git on your code', 10, 1, 1, 1, 1, 1576922042, 1576922042),
(9, 'Analysis System Design', 'Analysis System Design for your blueprint', 9, 1, 1, 1, 1, 1576922126, 1576922126),
(10, 'Soft Computing', 'Making soft from your blow computation', 11, 2, 2, 1, 1, 1576922230, 1576924295),
(11, 'Information Retrieval', 'Maintain your complicated text structure with Information Retrieval way', 5, 1, 2, 1, 1, 1576922379, 1576923188),
(12, 'Java', 'Learn Java for professional code', 9, 2, 2, 1, 1, 1577105721, 1577105721),
(13, 'Ruby on Rails', 'Ruby on Rails on your mind', 7, 2, 2, 1, 1, 1577105772, 1577105772);

-- --------------------------------------------------------

--
-- Table structure for table `course_lecture`
--

CREATE TABLE `course_lecture` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `material_file` varchar(100) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_lecture`
--

INSERT INTO `course_lecture` (`id`, `course_id`, `title`, `description`, `material_file`, `quiz_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Intruduction NLP', 'Intruduction NLP', 'Download Disini', 4, NULL, 1, NULL, 1576674633),
(3, 1, 'Materi 2', 'TEst Materi 2', '', 5, 1, 1, 1576662508, 1576662508),
(4, 1, 'Materi 3', 'Materi 3', 'File Materi', NULL, 1, 1, 1576729731, 1576729731);

-- --------------------------------------------------------

--
-- Table structure for table `enroled_course`
--

CREATE TABLE `enroled_course` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `final_grade` varchar(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroled_course`
--

INSERT INTO `enroled_course` (`id`, `course_id`, `user_id`, `final_grade`, `created_at`, `updated_at`) VALUES
(1, 1, 11, NULL, 1576813820, 1576813820),
(2, 1, 1, NULL, 1576890176, 1576890176),
(3, 11, 1, NULL, 1576924461, 1576924461),
(4, 3, 11, NULL, 1577937202, 1577937202);

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `name`, `slug`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'UNAKI', 'unaki', 'Universitas AKI', 10, 10, 1576504528, 1576504528),
(3, 'Universitas Dianuswantoro', 'universitas-dianuswantoro', 'UDINUS', 2, 2, 1576639128, 1576639128),
(4, 'UNDIP', 'undip', 'Universitas Diponegoro', 1, 1, 1576921659, 1576921659),
(5, 'UNSRAT', 'unsrat', 'Universitas Sam Ratulangi', 1, 1, 1576921694, 1576921694),
(6, 'UPI', 'upi', 'Universitas Pendidikan Indonesia', 1, 1, 1576921721, 1576921721),
(7, 'UNIKOM', 'unikom', 'Universitas Komputer Indonesia', 1, 1, 1576921748, 1576921748),
(8, 'AMIKOM', 'amikom', 'Universitas AMIKOM Yogyakarta', 1, 1, 1576921784, 1576921784),
(9, 'OXFORD', 'oxford', 'OXFORD University', 1, 1, 1576921847, 1576921847),
(10, 'HARVARD', 'harvard', 'HARVARD University', 1, 1, 1576921864, 1576921864),
(11, 'UNBRA', 'unbra', 'Universitas Brawijaya', 1, 1, 1576921894, 1576921894);

-- --------------------------------------------------------

--
-- Table structure for table `institution_instructor`
--

CREATE TABLE `institution_instructor` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institution_instructor`
--

INSERT INTO `institution_instructor` (`id`, `institution_id`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 2, 2, 10, 10, 1576504561, 1576504561),
(6, 2, 11, 10, 10, 1576504691, 1576504691),
(8, 3, 11, 2, 2, 1576639145, 1576639145),
(9, 4, 11, 1, 1, 1576921668, 1576921668),
(10, 5, 43, 1, 1, 1576921702, 1576921702),
(11, 6, 48, 1, 1, 1576921726, 1576921726),
(12, 7, 51, 1, 1, 1576921751, 1576921751),
(13, 8, 49, 1, 1, 1576921790, 1576921790),
(14, 9, 2, 1, 1, 1576921850, 1576921850),
(15, 10, 39, 1, 1, 1576921871, 1576921871),
(16, 11, 11, 1, 1, 1576921897, 1576921897);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Introductory', 'introductory', 1573374587, 1573374587),
(2, 'Intermediate', 'intermediate', 1573374707, 1573374707);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1570628872),
('m140209_132017_init', 1572096243),
('m140403_174025_create_account_table', 1572096244),
('m140504_113157_update_tables', 1572096246),
('m140504_130429_create_token_table', 1572096247),
('m140506_102106_rbac_init', 1570628876),
('m140830_171933_fix_ip_field', 1572096247),
('m140830_172703_change_account_table_name', 1572096247),
('m141222_110026_update_ip_field', 1572096248),
('m141222_135246_alter_username_length', 1572096248),
('m150614_103145_update_social_account_table', 1572096248),
('m150623_212711_fix_username_notnull', 1572096248),
('m151024_072453_create_route_table', 1570628916),
('m151218_234654_add_timezone_to_profile', 1572096248),
('m160929_103127_add_last_login_at_to_user_table', 1572096249),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1570628876),
('m180523_151638_rbac_updates_indexes_without_prefix', 1570628876);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, 'Administrator', 'mail@e-learning.com', '', 'd41d8cd98f00b204e9800998ecf8427e', 'Semarang', 'http://e-learning.com', '', 'Asia/Jakarta'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_category`
--

CREATE TABLE `quiz_category` (
  `id` int(11) NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_category`
--

INSERT INTO `quiz_category` (`id`, `lecture_id`, `name`, `created_by`, `updated_by`) VALUES
(1, 0, 'HTML', NULL, NULL),
(2, 0, 'CSS', NULL, NULL),
(3, 0, 'test Name', 1, 1),
(4, 1, 'Quiz Introduction NLP', 1, 1),
(5, 3, 'Quiz Materi Pertama', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `key` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `answer3` varchar(255) DEFAULT NULL,
  `answer4` varchar(255) DEFAULT NULL,
  `answer5` varchar(255) DEFAULT NULL,
  `answer6` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`key`, `id`, `category_id`, `title`, `slug`, `answer`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(1, 1, 1, 'The HTML acronym means \"HyperText Markup Language\".', NULL, 'True', 'False', '', '', '', ''),
(2, 2, 1, 'You can create tables with the tag <table>.', NULL, 'True', 'False', 'Nonsense', '', '', ''),
(3, 3, 1, 'The tag <td> is a table row.', NULL, 'False', 'True', 'Completely true', 'Absolutely true', '', ''),
(4, 4, 1, 'The tag <textfield> exists.', NULL, 'False', 'True', '', '', '', ''),
(5, 5, 1, 'The tag <font> is deprecated.', NULL, 'True', 'False', '', '', '', ''),
(6, 6, 1, 'The tag <video> is deprecated.', NULL, 'False', 'True', '', '', '', ''),
(7, 7, 1, 'The tag <canvas> is deprecated.', NULL, 'Anuuu', 'This is right', 'Certainly', '', '', ''),
(8, 8, 1, 'You can draw lines and circles in a <canvas>.', NULL, 'True', 'False', '', '', '', ''),
(9, 9, 1, 'The tag <textarea> exists.', NULL, 'True', 'False', '', '', '', ''),
(10, 10, 1, 'A HTML 5 document must begin with <!DOCTYPE html>.', NULL, 'True', 'False', 'Really false', 'Super false', 'Nonsense', 'Bah'),
(11, 1, 2, 'The CSS acronym means \"Conditional Style Sheets\"', NULL, 'False', 'True', 'Certainly', '', '', ''),
(12, 2, 2, 'There are only 2 ways to place styles in a HTML document: External CSS and inline CSS.', NULL, 'False', 'True', 'This is right', '', '', ''),
(13, 3, 2, 'You can change the text size using font-size.', NULL, 'True', 'False', 'I do not believe you', '', '', ''),
(14, 4, 2, 'You can change the color of the text using font-color.', NULL, 'False', 'True', '', '', '', ''),
(15, 5, 2, 'You can change the background color using background-color or background.', NULL, 'True', 'False', '', '', '', ''),
(16, 6, 2, 'You can make columns with float:left.', NULL, 'True', 'False', '', '', '', ''),
(17, 7, 2, 'You can center a div with margin: 0 auto.', NULL, 'True', 'False', '', '', '', ''),
(18, 8, 2, 'You can change the style of a html class with #myclass{}.', NULL, 'False', 'True', '', '', '', ''),
(19, 9, 2, 'You can change the style of a html class with .myclass{}.', NULL, 'True', 'False', 'I do not believe you', 'Wrong', 'Super wrong', 'Faaaalse'),
(20, 10, 2, 'You can underline a text with text-decoration: underline;.', NULL, 'True', 'False', 'Wrong', '', '', ''),
(21, NULL, 4, 'SoaL', NULL, 'Jawaban Benar', 'Sawaban 1', 'Sawaban 2', 'Sawaban 3', 'Sawaban 4', 'Sawaban 5'),
(22, NULL, 4, 'Soal2', NULL, 'Jaban benar', 'Jawab 1', 'Jabawab2', 'jawab 3', 'jawab4', 'jawab 5'),
(23, NULL, 4, 'Sosl3', NULL, 'klasjkl', 'jkalsdjkl', 'jlkasdjl', 'jlkasjdl', 'jlajsdl', 'jlkasjd'),
(24, NULL, 5, 'soal 1', NULL, 'jabwab 1', 'jabwab 1', 'jabwab 1', 'jabwab 1', 'jabwab 1', 'jabwab 5');

-- --------------------------------------------------------

--
-- Table structure for table `response_course`
--

CREATE TABLE `response_course` (
  `id` int(11) NOT NULL,
  `course_lecture_id` int(11) DEFAULT NULL,
  `response` text,
  `grade` varchar(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`name`, `alias`, `type`, `status`) VALUES
('/*', '*', '', 1),
('/course/*', '*', 'course', 1),
('/course/create', 'create', 'course', 1),
('/course/delete', 'delete', 'course', 1),
('/course/delete-lecture', 'delete-lecture', 'course', 1),
('/course/index', 'index', 'course', 1),
('/course/lecture', 'lecture', 'course', 1),
('/course/update', 'update', 'course', 1),
('/course/view', 'view', 'course', 1),
('/debug/*', '*', 'debug', 1),
('/debug/default/*', '*', 'debug/default', 1),
('/debug/default/db-explain', 'db-explain', 'debug/default', 1),
('/debug/default/download-mail', 'download-mail', 'debug/default', 1),
('/debug/default/index', 'index', 'debug/default', 1),
('/debug/default/toolbar', 'toolbar', 'debug/default', 1),
('/debug/default/view', 'view', 'debug/default', 1),
('/debug/user/*', '*', 'debug/user', 1),
('/debug/user/reset-identity', 'reset-identity', 'debug/user', 1),
('/debug/user/set-identity', 'set-identity', 'debug/user', 1),
('/gii/*', '*', 'gii', 1),
('/gii/default/*', '*', 'gii/default', 1),
('/gii/default/action', 'action', 'gii/default', 1),
('/gii/default/diff', 'diff', 'gii/default', 1),
('/gii/default/index', 'index', 'gii/default', 1),
('/gii/default/preview', 'preview', 'gii/default', 1),
('/gii/default/view', 'view', 'gii/default', 1),
('/institution-instructor/*', '*', 'institution-instructor', 1),
('/institution-instructor/create', 'create', 'institution-instructor', 1),
('/institution-instructor/delete', 'delete', 'institution-instructor', 1),
('/institution-instructor/index', 'index', 'institution-instructor', 1),
('/institution-instructor/update', 'update', 'institution-instructor', 1),
('/institution-instructor/view', 'view', 'institution-instructor', 1),
('/institution/*', '*', 'institution', 1),
('/institution/create', 'create', 'institution', 1),
('/institution/delete', 'delete', 'institution', 1),
('/institution/index', 'index', 'institution', 1),
('/institution/instructor', 'instructor', 'institution', 1),
('/institution/update', 'update', 'institution', 1),
('/institution/view', 'view', 'institution', 1),
('/level/*', '*', 'level', 1),
('/level/create', 'create', 'level', 1),
('/level/delete', 'delete', 'level', 1),
('/level/index', 'index', 'level', 1),
('/level/update', 'update', 'level', 1),
('/level/view', 'view', 'level', 1),
('/mimin/*', '*', 'mimin', 1),
('/mimin/role/*', '*', 'mimin/role', 1),
('/mimin/role/create', 'create', 'mimin/role', 1),
('/mimin/role/delete', 'delete', 'mimin/role', 1),
('/mimin/role/index', 'index', 'mimin/role', 1),
('/mimin/role/permission', 'permission', 'mimin/role', 1),
('/mimin/role/update', 'update', 'mimin/role', 1),
('/mimin/role/view', 'view', 'mimin/role', 1),
('/mimin/route/*', '*', 'mimin/route', 1),
('/mimin/route/create', 'create', 'mimin/route', 1),
('/mimin/route/delete', 'delete', 'mimin/route', 1),
('/mimin/route/generate', 'generate', 'mimin/route', 1),
('/mimin/route/index', 'index', 'mimin/route', 1),
('/mimin/route/update', 'update', 'mimin/route', 1),
('/mimin/route/view', 'view', 'mimin/route', 1),
('/mimin/user/*', '*', 'mimin/user', 1),
('/mimin/user/create', 'create', 'mimin/user', 1),
('/mimin/user/delete', 'delete', 'mimin/user', 1),
('/mimin/user/index', 'index', 'mimin/user', 1),
('/mimin/user/update', 'update', 'mimin/user', 1),
('/mimin/user/view', 'view', 'mimin/user', 1),
('/quiz-category/*', '*', 'quiz-category', 1),
('/quiz-category/create', 'create', 'quiz-category', 1),
('/quiz-category/delete', 'delete', 'quiz-category', 1),
('/quiz-category/index', 'index', 'quiz-category', 1),
('/quiz-category/update', 'update', 'quiz-category', 1),
('/quiz-category/view', 'view', 'quiz-category', 1),
('/quiz/*', '*', 'quiz', 1),
('/quiz/site/*', '*', 'quiz/site', 1),
('/quiz/site/change', 'change', 'quiz/site', 1),
('/quiz/site/finish', 'finish', 'quiz/site', 1),
('/quiz/site/index', 'index', 'quiz/site', 1),
('/quiz/site/start', 'start', 'quiz/site', 1),
('/site/*', '*', 'site', 1),
('/site/about', 'about', 'site', 1),
('/site/captcha', 'captcha', 'site', 1),
('/site/contact', 'contact', 'site', 1),
('/site/error', 'error', 'site', 1),
('/site/index', 'index', 'site', 1),
('/subject/*', '*', 'subject', 1),
('/subject/create', 'create', 'subject', 1),
('/subject/delete', 'delete', 'subject', 1),
('/subject/index', 'index', 'subject', 1),
('/subject/update', 'update', 'subject', 1),
('/subject/view', 'view', 'subject', 1),
('/user/*', '*', 'user', 1),
('/user/admin/*', '*', 'user/admin', 1),
('/user/admin/assignments', 'assignments', 'user/admin', 1),
('/user/admin/block', 'block', 'user/admin', 1),
('/user/admin/confirm', 'confirm', 'user/admin', 1),
('/user/admin/create', 'create', 'user/admin', 1),
('/user/admin/delete', 'delete', 'user/admin', 1),
('/user/admin/index', 'index', 'user/admin', 0),
('/user/admin/info', 'info', 'user/admin', 1),
('/user/admin/resend-password', 'resend-password', 'user/admin', 1),
('/user/admin/switch', 'switch', 'user/admin', 1),
('/user/admin/update', 'update', 'user/admin', 1),
('/user/admin/update-profile', 'update-profile', 'user/admin', 1),
('/user/create', 'create', 'user', 1),
('/user/delete', 'delete', 'user', 1),
('/user/index', 'index', 'user', 1),
('/user/profile/*', '*', 'user/profile', 1),
('/user/profile/index', 'index', 'user/profile', 1),
('/user/profile/show', 'show', 'user/profile', 1),
('/user/recovery/*', '*', 'user/recovery', 1),
('/user/recovery/request', 'request', 'user/recovery', 1),
('/user/recovery/reset', 'reset', 'user/recovery', 1),
('/user/registration/*', '*', 'user/registration', 1),
('/user/registration/confirm', 'confirm', 'user/registration', 1),
('/user/registration/connect', 'connect', 'user/registration', 1),
('/user/registration/register', 'register', 'user/registration', 1),
('/user/registration/resend', 'resend', 'user/registration', 1),
('/user/security/*', '*', 'user/security', 1),
('/user/security/auth', 'auth', 'user/security', 1),
('/user/security/login', 'login', 'user/security', 1),
('/user/security/logout', 'logout', 'user/security', 1),
('/user/settings/*', '*', 'user/settings', 1),
('/user/settings/account', 'account', 'user/settings', 1),
('/user/settings/confirm', 'confirm', 'user/settings', 1),
('/user/settings/delete', 'delete', 'user/settings', 1),
('/user/settings/disconnect', 'disconnect', 'user/settings', 1),
('/user/settings/networks', 'networks', 'user/settings', 1),
('/user/settings/profile', 'profile', 'user/settings', 1),
('/user/update', 'update', 'user', 1),
('/user/view', 'view', 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Computer Science', 'computer-science', 1573373683, 1573373759),
(2, 'Computer Engineering', 'computer-engineering', 1576921153, 1576921153);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, 'cWShCR3b_RbdZtZf7g5wPAPqIC-maX1W', 1572096302, 0),
(2, 'CshFEvaw5_23GI7VomRdUydXuVw8Ezy0', 1572674717, 0),
(10, 'frI3XlVWoYsTS18VnOK9nAlc6YdLlhhW', 1572680095, 0),
(11, 'waZRE6a2xJrBguICHcgQlQC5DbQ6fzbg', 1574373473, 0),
(40, 'hXDSNf6S1iABifrAlNaVSkYcPlncdYIq', 1576803879, 0),
(41, 'DpAmkZ5bRlVhHXF2Rdn2DibX8TpjK5iy', 1576803879, 0),
(42, 'upkGMxThEswxtOlwhdm4_LozaQmlDVCA', 1576803886, 0),
(43, 'SxewZPWmiV-7Tfx04mJf7EJz18mTEZC0', 1576803886, 0),
(44, 'aR7RrcSiK6eMH50gKAMDmw0QuUKjC9Az', 1576803892, 0),
(45, 'En7PFjXFM04pO3VuYW5J5DXxr03o45x7', 1576803892, 0),
(46, 'JfUaZpfU0cbt6Vz2j2R62tGFFIAVKYRN', 1576803898, 0),
(47, 'LVN1V96IPyz9AMG0nCwjzThXFfJjfjjj', 1576803898, 0),
(48, 'E302_XmTTwK1BYPV33hDdG9tLbXfX_Py', 1576803909, 0),
(49, 'fqtBjKGxsHQc1a4FntKi5Lp812HXHjSD', 1576803909, 0),
(50, 'iCabnD14rCsvXFZv1lWbCqdZfitJ6iJS', 1576803916, 0),
(51, '3sn8DU0TX6y3jbvCvklLvgjilyGjcU1i', 1576803916, 0),
(52, 'IDzzXvtHa1sRinzmTIiGSXMyhTesoF6K', 1576803924, 0),
(53, 'jRYA65L2c0ZPwACv2hKFbTxHKBQRuthr', 1576803924, 0),
(54, 'k8v1mQ4zUeg0KVF-FghhRb0nVbqz7s-o', 1576803931, 0),
(56, 'g2tEXjbcjL8KruL6LQb2oWFEEGJcovTP', 1576803936, 0),
(58, 'pnTFvk4oxMrVgswGyiQ6fCpAzSkxW_Om', 1576803936, 0),
(60, '5TabK0Ol-iU56iObdbAFWqENmQoZZss4', 1576803986, 0),
(61, '6y_BzdMz_fRsF5Ub6qEPMTHm1R1Jas_-', 1576803991, 0),
(62, 'm3LK729FKdCVC8UxFUZvZgRshAF6CeQr', 1576803995, 0),
(63, '2KnTQPo44voR_a-ISn8W8v5rSDVfZaCG', 1576803999, 0),
(64, 'y1wjv0cZ9wokbCT1kmBAqCs0afI27GRb', 1576804136, 0),
(66, 'oU_c2qsDnWmPr03UPPL2jTb4CMiyVz1l', 1576804136, 0),
(69, 'kEncotFNtgPl6V1yl-qXv3nFD2HKaWWE', 1576809066, 0),
(70, 'SQngIVT9pKs_2htdfz773JTjM3rVMmHF', 1576809066, 0),
(71, 'rKIB-DdFveclpfRxNB5uWuBMdOdH6fSW', 1576811128, 0),
(72, 'RHZx23IbBCYgIymDrGWCO8prGGPaT4l7', 1576811128, 0),
(73, '9JEJDRxjHKDnkhGZKTl1Fbo9E_FMimtY', 1576811153, 0),
(74, 'MmYrQ-hjt9bWTh28M3fCuL6JErtWYOx9', 1576811155, 0),
(75, 'aTRYTbGJ0xpg3HzV1WHz0ac_KaFwRVWn', 1576811163, 0),
(76, 'eGsrPg99yFBEgKv3vIlhR0_EF5uVOaOX', 1576811183, 0),
(77, 'j-vGrHbyTnnewcIeD3goXXj4Az5nnprT', 1576811188, 0),
(78, 'Mb11ohe03RerpF16evT8AIqG0mnm1oCL', 1576811190, 0),
(79, 'HEStjULrhDBglXj8Qm7YLWjmVbaOpqn6', 1576811208, 0),
(80, 'fY1ATlDYzL9Q9pjXggLiJlg02VsmaWj2', 1576811219, 0),
(81, 'pIaaHKChKcoj0J9IxMcHs0Ijkwm0_GiE', 1576811225, 0),
(82, '9gQbyWHGxVDVGm_ksW8JS54DF96RYRLy', 1576811232, 0),
(83, 'c-EzMWAvFyaHZiluhj5lHnf92OMkTNXr', 1576811257, 0),
(84, 'nh7Ow7irzwDCC-LJ6LS4Uyt60TVlzubh', 1576811280, 0),
(85, '9GraHknAn0nPpxMDv7d6RT-mGEcj5So8', 1576811285, 0),
(86, 'CzCeFlA8noSj-yzRPZsXi00JuHBcCMyI', 1576811291, 0),
(87, 'aOT7ePoTS36AZZ1SiE8OFOqEPJdj9kB4', 1576811294, 0),
(88, 'DIDpStebKzqVo7eWnFc8noUjP1QeSP_c', 1576811304, 0),
(89, 'bx5PKOVWdWu1aLuffewZ1LIRwP_nmZ97', 1576811308, 0),
(90, 'NL3iRU5NKuS3fyIonNQAMNfLif7u0MOR', 1576811309, 0),
(91, '3FbCUDnteFpEJbJc-HRtk1_kHfBDcdOd', 1576811319, 0),
(92, 'tyIXQI3uSmt3xm15RfQe093wVuhfgJ25', 1576811321, 0),
(93, 'Ky-bBtml3_4-O6UwZO7AS-fJgZeKyjB4', 1576811342, 0),
(94, 'yb5QHKbJ7IFQNE89RwG54UYHh3hBV4yO', 1576811352, 0),
(95, 'Nll5OAfEhaSvdXsDEEBfoPYTSQ7NgxmS', 1576811358, 0),
(96, '_68K8n7kogCH8hHPAZx-06ShCoGeCaMO', 1576811367, 0),
(97, 'gif02c1mjz43UcGSI1Rtt5IOz9HWdG-B', 1576811367, 0),
(98, 'xbX-z9AWtXnDUR_q9MEztHFTut-OjZBo', 1576811383, 0),
(99, 'AfKKLGvvafPB5xdShRxFX3MSE3B-s2r2', 1576811395, 0),
(100, 'o_EESx8ZIAXwZQ_ZXXICfrh1hKrNQKPY', 1576814436, 0),
(101, 'NZJGaWx53b30HACkY5DdWSRakYuIRoGj', 1576814437, 0),
(102, 'OT2aDv0Nt6USKM2rrhJkifk65MTvlH7U', 1576814452, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'admin', 'edyagusc@gmail.com', '$2y$10$INAPuvkeYguFyiGrAhzVIuJ7FgTWwsQu4q.Ki8kYy7rXTfwuH/Zg.', 'Zex96X-pU8T4v6HnvKWkF5Ktp3gvD1VN', 1572096547, NULL, NULL, '172.22.0.1', 1572096302, 1576587814, 0, 1580634631),
(2, 'agusedyc', 'agusedyc@gmail.com', '$2y$10$OirirT0c1ibjaya8dMJq4u41LBGmxkbp32k7mx.YRxgACwRRlWuSG', '06SyqFrKG6S15TWzmiT1hO1VbdPrkJpE', 1572674864, NULL, NULL, '172.19.0.1', 1572674717, 1572674717, 0, 1580614520),
(10, 'institusi', 'adi@gmail.com', '$2y$10$faatugwcvM7BBQQnZOr1xuvUFNYbNloKWQrg.WD1P.U.taE0ZEdTm', 'bIRw9m5ByS5sJpbtGC0qz-RWRzebZMi4', 1572680106, NULL, NULL, '172.19.0.1', 1572680095, 1576503964, 0, 1580634689),
(11, 'tono', 'tono@gm.cc', '$2y$10$8AM02BYK6gmTD0GZutBn1.3qT7AA/LKy6i0WPY12dYV83fhtSaAGC', 'hb6dAsTn_4r9AmTAp0Hq4OK2sbDcKpdg', 1576592965, NULL, NULL, '172.18.0.1', 1574373473, 1576592993, 0, 1580614530),
(39, 'adibudi', 'adibudi@gmail.com', '$2y$10$w.FD6siYBE.PhNTYMuVxyeYRbH6rxtQSvGErTl7yNgHVfdwwBnDbW', 'qrtYP_oN729_G4Xq6hnMRD2OI5_08igN', 1576737084, NULL, NULL, '172.18.0.1', 1576737084, 1576737095, 0, 1580631661),
(40, 'vpoPcBeY', 'isdgaPTM@burpcollaborator.net', '$2y$10$sNHyIS6qe6ZIoiEj6/OB8eyl1t6zOw6x4N3pnUwuUbPoM0dgnf./S', '2Czg884QOi5b2635IZgP0Rpc7nRy5q8L', NULL, NULL, NULL, '103.107.244.18', 1576803879, 1576803879, 0, NULL),
(41, 'KbaxDbLR', 'sJTHirci@burpcollaborator.net', '$2y$10$lRNxzm8ERcqJwLWM5K7/9ud6l6SffDv2PWxX3TLLLlfy0P74GgAvm', 'BtKpE6lryFwd67I12XLH825lM6-1LkgW', NULL, NULL, NULL, '103.107.244.18', 1576803879, 1576803879, 0, NULL),
(42, 'eBHETXHO', 'IWBWCgYy@burpcollaborator.net', '$2y$10$k1VM24oiS.KT7agHNAOOgOcg.3ec56t34SNd5kYBRWo5Qq.K48SSC', 'g0REyHs78UPz-kwBYztRRfBm0Ra6ZNTj', NULL, NULL, NULL, '103.107.244.18', 1576803886, 1576803886, 0, NULL),
(43, 'zEjiiwuG', 'pUVmirml@burpcollaborator.net', '$2y$10$.H9rVv287Pb5ONDnaqnsNOoZz1kF7YJsAeScflxG9L3veBXFvds5a', '5cqq1PwyOLZEjXMIJDswSV7IqE8fYQAI', NULL, NULL, NULL, '103.107.244.18', 1576803886, 1576803886, 0, NULL),
(44, 'gojhAzyy', 'kwSErpRD@burpcollaborator.net', '$2y$10$DrviqAQ.tdZQ11rj049md.DMUjh08oBA5yYGZe/aeAxcGQZ0QNX3O', 'YdItQvUbSJI04b1uFvedF8K2CvbZn8ju', NULL, NULL, NULL, '103.107.244.18', 1576803892, 1576803892, 0, NULL),
(45, 'tCswcism', 'kDGETZEZ@burpcollaborator.net', '$2y$10$6uNa8Dp47oHSMlaZc1gw4eAw80bfPijoH80VQfMmMTJ/2WdJmgsLO', 'zx05etJs2ZMMAQbIq3cjy4dfyYA6V5Eo', NULL, NULL, NULL, '103.107.244.18', 1576803892, 1576803892, 0, NULL),
(46, 'VhNceBMm', 'FJuQuokI@burpcollaborator.net', '$2y$10$jJAgfgv.QN1CQKyKfdloOeNUKp6qy490rPYidQLM5OETFoY9cBgUK', 'rmchCVkIe1CLzCUea0RoghktbGvYuByI', NULL, NULL, NULL, '103.107.244.18', 1576803898, 1576803898, 0, NULL),
(47, 'NwNQaVGx', 'ZuXXjrks@burpcollaborator.net', '$2y$10$QuB7uqtCCmOhRcLTFWTTX.52v7FVlcr.MUWW1Cgf7chYDLAXiq0E2', 'm-AqerSOJMWCt4YVQm9xzifnVgAJVObS', NULL, NULL, NULL, '103.107.244.18', 1576803898, 1576803898, 0, NULL),
(48, 'NCEyexrA', 'WwlEHKMF@burpcollaborator.net', '$2y$10$4hLdPgGsRFxu61SnH4jgYOJv6hmXwNpHoVv8Pma3c0xJiAKAeoVs.', '3VtyJ4dQNXZkJ8AJVj5IfcmTurZptgFs', NULL, NULL, NULL, '103.107.244.18', 1576803909, 1576803909, 0, NULL),
(49, 'bzMvxeEj', 'NmzbcDuD@burpcollaborator.net', '$2y$10$.ymhFTZFo8mgVCaddKAPs.v7D3oyfNxpmq.4pbpGnFYrB6In71YFK', 'Jseof2qqOHbZdgyC2UY5LS9hiyvmyn2L', NULL, NULL, NULL, '103.107.244.18', 1576803909, 1576803909, 0, NULL),
(50, 'ncjiBzNE', 'crbxEaWQ@burpcollaborator.net', '$2y$10$joPflXbnw0aDRgoxiPsR7.wiPXb55G.Mn04U7rB4ShwmsPe8Bbxz.', '3u3tYYZ9fiuTw32Xo7oJH1y7Xh2jBhVG', NULL, NULL, NULL, '103.107.244.18', 1576803916, 1576803916, 0, NULL),
(51, 'ljMOyTLZ', 'YaiZueTJ@burpcollaborator.net', '$2y$10$nW/qPrbxG2IF2vHRr88eoO7k5thUaldtfQI/rdIDvmvXBm58oF73C', '9YU3QPvIq1x7VF0yRrD-KqKeWxS1u_VA', NULL, NULL, NULL, '103.107.244.18', 1576803916, 1576803916, 0, NULL),
(52, 'umNVotqs', 'ilUjpSWi@burpcollaborator.net', '$2y$10$pgLU.G2iYOQg2St3TLsD6uMzKhD0FzCS0vxmgaCdhqUmuEQ48KJV.', '1ZwKT08IMwgW4KTklr-cgKkIx237HFCw', NULL, NULL, NULL, '103.107.244.18', 1576803924, 1576803924, 0, NULL),
(53, 'lPgordMN', 'bKoMdUfJ@burpcollaborator.net', '$2y$10$GOTIgcCRjyS5FZc0SK4Sz.ElfCeLL95rbqI6oE7zmn1y/oVWGBqdS', 'HFST5PvL2AkBWqJ1uEfonegK8aCbjzJg', NULL, NULL, NULL, '103.107.244.18', 1576803924, 1576803924, 0, NULL),
(54, 'QOnLXpav', 'FQkIyNuX@burpcollaborator.net', '$2y$10$pKqIvqcRteWYnYDDRT2wxucm1qgbNlZZ/4ttANkgX23.q/1Uqfw5S', 'wqWPY9s_rw_zCkWnOKGI0mR5mYZnyDew', NULL, NULL, NULL, '103.107.244.18', 1576803931, 1576803931, 0, NULL),
(56, 'mGNFcuvI', 'BdXrvfOR@burpcollaborator.net', '$2y$10$ZyGf9WmXGfzNMMj0OmrTMONh8GgbgKtUJ27T8KctdY7khBMblbNl2', '1YhlC-xM-RQXH0_fJaY2gXZw5QDPXsPf', NULL, NULL, NULL, '103.107.244.18', 1576803936, 1576803936, 0, NULL),
(58, 'LHSxQeuA', 'GylvTamP@burpcollaborator.net', '$2y$10$G3ShmFLwSCieJk269JJt3OHMYiYZJ5uebR7F3hPVJfJn.mSAAzMly', 'r-R5IPKxcLETxhoFxh4R863zklTtMIOU', NULL, NULL, NULL, '103.107.244.18', 1576803936, 1576803936, 0, NULL),
(60, 'ValLNlDy', 'ValLNlDy@burpcollaborator.net', '$2y$10$yaS5XJjwNlye4ibf1/xRwOv.uFSGM82A5wi1iWIjgk8GvFi9JDSB6', 'CG6D3y_UYregTgRQM6WKO-yP32bUqp2b', NULL, NULL, NULL, '103.107.244.18', 1576803986, 1576803986, 0, NULL),
(61, 'VgwCmwBd', 'VgwCmwBd@burpcollaborator.net', '$2y$10$XosmiTzMy8Eiirub1I2ph.V6AOvHdj6pA44trHSg0/HLAvzJJ83pa', 'BQh_yzmh92ZpNvAN3G5SGOw44c4vFWXj', NULL, NULL, NULL, '103.107.244.18', 1576803991, 1576803991, 0, NULL),
(62, 'mxTneSsz', 'mxTneSsz@burpcollaborator.net', '$2y$10$35wrZrkMJuj.pxwHqKzi/.1pAIuukqsi.IiKLBpDW9YzcwIo9d4Ye', '72dt3lMa69bQM3WgdBp3Jf-F3X6_FdJw', NULL, NULL, NULL, '103.107.244.18', 1576803995, 1576803995, 0, NULL),
(63, 'HiZByLAw', 'HiZByLAw@burpcollaborator.net', '$2y$10$OknhONQrf.eRuBSvugbpMe0QRgT/j0OToNo1W72Pnjf6CkGtBh2FO', 'wRbd5aJybung3uh8NLvfaYKkznIvLhDD', NULL, NULL, NULL, '103.107.244.18', 1576803999, 1576803999, 0, NULL),
(64, 'aLEjphhQ', 'UJYixQhJ@burpcollaborator.net', '$2y$10$vI5QntT4s9ibBxKFowX/Wu.jUhIPKGwOQq5/FzMuZLBcMx32s6Diy', 'PciWKg5D7kRPclUYjei4urmtySAUyvqk', NULL, NULL, NULL, '103.107.244.18', 1576804136, 1576804136, 0, NULL),
(66, 'EJDHOgon', 'KnGdjXVK@burpcollaborator.net', '$2y$10$JZ/bB3m1zi0W1g.9c6E/.O96zzrFdB8JFxbTQ8EbEywLXOcJSlidy', 'SQKr6v_cQhzm5ekLnYrrSfG2K4ixVjl9', NULL, NULL, NULL, '103.107.244.18', 1576804136, 1576804136, 0, NULL),
(69, 'hvFfpqCY', 'qHjGFPng@burpcollaborator.net', '$2y$10$m3JhGBw92VVAQwFa1G6FUullDQg3P6.OJEYPhEVEcPGU0t9JB9ycq', 'nJyn97TWToLHCfq7NUS3eekRkbhTMXwR', NULL, NULL, NULL, '103.107.244.18', 1576809066, 1576809066, 0, NULL),
(70, 'LOhHUFHz', 'wNQEYhRl@burpcollaborator.net', '$2y$10$xbqCR68uG.56mJ7QSLWQKepDFV3AlGesd6hECz1nZ4r2tUQJgv2Du', 'h1UNPclIrPiiqgsfUxOH_S7hoLt9aEoe', NULL, NULL, NULL, '103.107.244.18', 1576809066, 1576809066, 0, NULL),
(71, 'eSExoEDa', 'ZigDapcp@burpcollaborator.net', '$2y$10$rAI0a2q0Hd1Q0AYQSFRN8e.hhDNtLIf8eMAMUlwEsFGewSBZ0osqO', 'nvGQioVZVZQ17d5C1QZhmvzsJBlCfcFO', NULL, NULL, NULL, '103.9.227.66', 1576811128, 1576811128, 0, NULL),
(72, 'hATStNGv', 'ycqElCnf@burpcollaborator.net', '$2y$10$0vK78b29MPj9JzNauKOg0e4Ed6SyNugJ1XcrrvuJ0WQT8moKDe2PO', 'It8Po29hQQOVd3QjK8VuYTOnI4xHafQE', NULL, NULL, NULL, '103.9.227.66', 1576811128, 1576811128, 0, NULL),
(73, 'TLxlwGwT', 'TTHellkM@burpcollaborator.net', '$2y$10$0LG60OMdqymoPx67MPtbD.XLMqCZ9lA/8hAFIH9pLo84DjOBTI3b.', 'OACVYDl5EZe2p_LPF0cijtcs30wNYsUq', NULL, NULL, NULL, '103.9.227.66', 1576811153, 1576811153, 0, NULL),
(74, 'FkhVQcZo', 'LhQifZZI@burpcollaborator.net', '$2y$10$od9tjsJ2uHlNZBVwhYlD7OD5KqSmYOhzGCdcdJq0SZKTWzWxg3eay', 'n8kYJfnR6gvZIF49q18Z-KmDgZLeTfGj', NULL, NULL, NULL, '103.9.227.66', 1576811155, 1576811155, 0, NULL),
(75, 'KlqoUQle', 'KInbwyiW@burpcollaborator.net', '$2y$10$H/K4digsUElkVwFl3YbIvuB7LuIeLZ.SDj8sjfpIYIYmrEL1XH9ja', 'FFgIB9SNDche1TGA6ZqcdZHYf_sSMGKZ', NULL, NULL, NULL, '103.9.227.66', 1576811163, 1576811163, 0, NULL),
(76, 'OdoVFjtI', 'dFiAvVzg@burpcollaborator.net', '$2y$10$vNRjJ/h5TYoz0ADNf/8ANeVQ7TV.bTOsmjNg86hq.KgzGn.lbWipe', 't4YGLROryfeMtCdRfuv1kx0R7f6EDSaw', NULL, NULL, NULL, '103.9.227.66', 1576811183, 1576811183, 0, NULL),
(77, 'vekhVqeT', 'JFmwKPXZ@burpcollaborator.net', '$2y$10$jDv37y9SGFA5W04eu7ojC.mEBcu4joSz4r5LAID6sBI/0WZKc/PKG', '5cF13RNNC4Uvzexc7A7RdLgagWjsOF4A', NULL, NULL, NULL, '103.9.227.66', 1576811188, 1576811188, 0, NULL),
(78, 'rHnxzOml', 'QKEUThDd@burpcollaborator.net', '$2y$10$Z8rxlgsVNvEbGMKXvwHueuTg4NMf6Hzd.HRGRLYSdr7..wK4xzKuq', 'v0mYLRr5F9008j6xKm6qdaJOnS7HKi94', NULL, NULL, NULL, '103.9.227.66', 1576811190, 1576811190, 0, NULL),
(79, 'ZEEawLqu', 'PWczALwe@burpcollaborator.net', '$2y$10$RN2UHgO7Z0HJFPlTCAkaH.KkPS9.tMcUdK8i/f/kITR6n6saKMyN6', 'wOjQ-7SZMcmnUbIlIWpfB0dIiU9apK0Q', NULL, NULL, NULL, '103.9.227.66', 1576811208, 1576811208, 0, NULL),
(80, 'JrgoihFF', 'nQztZCjB@burpcollaborator.net', '$2y$10$ezMWU7M41gAKuVn6Ip3LKe.UxR3bL8HTrpQHDe6umv.DhoOCpalRi', 'uoepW2pv1pOXeRf9p3do7C7i2TNqJGSW', NULL, NULL, NULL, '103.9.227.66', 1576811219, 1576811219, 0, NULL),
(81, 'XEOFbGmV', 'QivnoBOS@burpcollaborator.net', '$2y$10$oZA3.KBLoxXeB0lVMlIS2e2nRl9r5dd2O0btMdkSjRkKvjx7/VTcS', 'yV6Lqu5MsZc-9MSyfM7o9qGfF2U7I9nl', NULL, NULL, NULL, '103.9.227.66', 1576811225, 1576811225, 0, NULL),
(82, 'aIEDWAWp', 'qvDkjmrf@burpcollaborator.net', '$2y$10$ITEmoKQkhGtG0zh9wox4P.lyQjZXV8cisDqoA.vwgR/pO0bQH3za2', '1v-dreNYzQi-QVyDeBP-p7FxV6OXtlS8', NULL, NULL, NULL, '103.9.227.66', 1576811232, 1576811232, 0, NULL),
(83, 'BANNkNku', 'WIggwETg@burpcollaborator.net', '$2y$10$a4WS7tU68FGBvcOhwNdk7ON7sgK0uM0Z4c561ia0mM1BQUnhTf/RK', 'Ibvexjz2o9wb_4dd8AAR9AgYjZvf9q7Z', NULL, NULL, NULL, '103.9.227.66', 1576811257, 1576811257, 0, NULL),
(84, 'LiDlDtBF', 'AoiCupkI@burpcollaborator.net', '$2y$10$qYqM8rdr4/A/UoysdNWYHO6iYjoZ5uX4jq1bWfZ0rtAhvkEbc4IT2', '9_HqmxYqw8PvRm7tD58On9qeO5q707GI', NULL, NULL, NULL, '103.9.227.66', 1576811280, 1576811280, 0, NULL),
(85, 'TKivWxNa', 'EUObffUa@burpcollaborator.net', '$2y$10$.Dtqko89ItSihH1TGqvw7OfEJYL7WjxP/ihLiNnq3GsgUJOMPiA1C', 'CZ2gdEKo10Fz-8Mtoqw17itz7gKMTVCn', NULL, NULL, NULL, '103.9.227.66', 1576811285, 1576811285, 0, NULL),
(86, 'ndMnUpgy', 'iSmciNxt@burpcollaborator.net', '$2y$10$fWdeVqay2VJ/aWc7AMB19OBtOinogvStdj0UuN8brcnt4xF/0Xr0K', 'ey8AYK6dkNVfS-Qr_g63pvSwwjBFwvNU', NULL, NULL, NULL, '103.9.227.66', 1576811290, 1576811290, 0, NULL),
(87, 'SIIQuNcd', 'tYUrDUXf@burpcollaborator.net', '$2y$10$NRhNErx4h/RhHpaxhNephOL5Kww22dmI4xb4ORdBtx2nLn2uP9Pk6', 'W-cZFGjPzQsCqqLr3aBkv_gU-rDsLaYh', NULL, NULL, NULL, '103.9.227.66', 1576811294, 1576811294, 0, NULL),
(88, 'PHaWUKmQ', 'WyujZihC@burpcollaborator.net', '$2y$10$ThZ5XibrnmpwuAoZHyXdreyASUlo6SDAwFUzHA9XOB5mQZB043TKa', 'BGq3bdXUNdortAeBUAeCWcaA6MZEojFl', NULL, NULL, NULL, '103.9.227.66', 1576811304, 1576811304, 0, NULL),
(89, 'vYAkEHYx', 'wtsgXtwT@burpcollaborator.net', '$2y$10$8JcJ.HJtGZrO02x8MKf8l.J4Iyf9NG.BgjOyoiG5IuX1QEvwXkk4W', '2pJgIEgmg09QQIdwjBE7uOYFKtc8d_rl', NULL, NULL, NULL, '103.9.227.66', 1576811308, 1576811308, 0, NULL),
(90, 'bbtQMkYA', 'tvgYpblv@burpcollaborator.net', '$2y$10$quC1Esl3byk9lQ/ZyTRhEu13.LNHVK3wE1wHi6NA0RSuAW.7RLfVS', 'XyIVGy2TdvbK-mHvUMGNVRdfpS9u_SGS', NULL, NULL, NULL, '103.9.227.66', 1576811309, 1576811309, 0, NULL),
(91, 'QCSneGfD', 'PquUczEj@burpcollaborator.net', '$2y$10$/Pa9QtPYmLNvOLtrtyJo6eRebrrKOBGcRwNsGq7OrXdEKYNyOYy1q', 'DPU5rb3XJ-5EDNFYWq9S1RC28xCyUKRv', NULL, NULL, NULL, '103.9.227.66', 1576811319, 1576811319, 0, NULL),
(92, 'beImZIHC', 'FIeLaIkY@burpcollaborator.net', '$2y$10$iB997fCcos4JlmfYzCCwo.AtVOBfx14UwSf0UcTiSnbFwrsImhHfO', 'oy-AjnNRJte_9KN2kglaXfak-vBj5m0F', NULL, NULL, NULL, '103.9.227.66', 1576811321, 1576811321, 0, NULL),
(93, 'hFgkRsmk', 'dLSKJJqg@burpcollaborator.net', '$2y$10$Wau1HrMrXCsq68hNl.457.ZjK5QZF1WTtaOH98ZmcSVacTN7YuMu6', 'nf8kNxTN5AOGQzObxoMkvCx_VKEk4CC4', NULL, NULL, NULL, '103.9.227.66', 1576811342, 1576811342, 0, NULL),
(94, 'yMJDpwcd', 'WKcCtQnf@burpcollaborator.net', '$2y$10$OXgiOqfdapYxGoMxtVlwMu.QFX1TnrSV5fyDCTArrzza/IkypGAXu', 'dDM1d1IGidmQ4OFALdrb7E_Y3PZF8lOS', NULL, NULL, NULL, '103.9.227.66', 1576811352, 1576811352, 0, NULL),
(95, 'OlQfJQTS', 'rkwGaUGy@burpcollaborator.net', '$2y$10$2Em47mTRVHTxB/AKR9yjmO6BJhJRTcHg03ar94ruyBTdJly5AXTRW', 'iUB5AouM4VpilOpN64auRFMVXIdcVbAC', NULL, NULL, NULL, '103.9.227.66', 1576811358, 1576811358, 0, NULL),
(96, 'cwpgBSLx', 'FaZFnNRm@burpcollaborator.net', '$2y$10$foKlRsT1JujRgM2LlrAMfeZzJo7Qa84hhvm9luu14KiDWBNwAAHyG', 'bhSKbn_ww8pQCfqoAZZrbZAKeN3Ac8aj', NULL, NULL, NULL, '103.9.227.66', 1576811367, 1576811367, 0, NULL),
(97, 'SiiElthF', 'DVTbTbBP@burpcollaborator.net', '$2y$10$sH1Xz.Ya4EGsjLrhC2YczeeirBCHVVcVeJzZuMV1euevgflYOuNam', 'M8OBAqVKDMYOxjFNU6DJrbj5AUqf9zGO', NULL, NULL, NULL, '103.9.227.66', 1576811367, 1576811367, 0, NULL),
(98, 'mbiFkWTP', 'rPDltxAG@burpcollaborator.net', '$2y$10$XUsKhgYe86NsOyiVoiBwz.F2bEj.MFB1V.2AuSV6Bzm1hy6ywedrW', 'GyTQLKERxF63fq3WTo96E69SrwtlA9fE', NULL, NULL, NULL, '103.9.227.66', 1576811383, 1576811383, 0, NULL),
(99, 'CCbPdGIU', 'ZKrNFsWB@burpcollaborator.net', '$2y$10$/iOpNSjnFUEDaaS5bSUl1uaTyxpNjh.kRRY4TpkwCFzApbPpB51gi', 'w9fdgyPISVmXe2_3zK1JqcZqgsN_ispa', NULL, NULL, NULL, '103.9.227.66', 1576811395, 1576811395, 0, NULL),
(100, 'TNSMFSvu', 'sSLqkEkf@burpcollaborator.net', '$2y$10$o5D3wanRTS3HOFFBEoO8L.zYdAKju1GJAt9lWdC0Fq1oLVqDq9Bu.', 'Q5f0b_H8hq_mjygFM3tJgDt-Dr_J_Mcs', NULL, NULL, NULL, '103.107.244.18', 1576814436, 1576814436, 0, NULL),
(101, 'mTvHbEvZ', 'iAALPrZN@burpcollaborator.net', '$2y$10$ntOQ472N2eGKRgHuJ2jWV.j97lyxdZVq1UiRt1ufUXHDlOdL6qy7S', '8TfZQer30GIsTviwYx56BJXrtA6G2iv3', NULL, NULL, NULL, '103.107.244.18', 1576814437, 1576814437, 0, NULL),
(102, 'yiCfTEjJ', 'vPBIxLfl@burpcollaborator.net', '$2y$10$qgpgqQM.7YSAlxka9HdMRuuSo32RB4QLzBxx2p9L4vc6nkKyLOcuW', 'qvZQjad5CK2O_VryxDk4TrXxO4JiwQAb', NULL, NULL, NULL, '103.107.244.18', 1576814452, 1576814452, 0, NULL),
(103, 'member', 'member@gmail.com', '$2y$10$rg.hG8zL5vw.Mi.4nPEDGeKildAjpWHhbWwZzy5v3npEmSl7NZOSO', '5zF6i7PnbD2ZVK-ogTUXUP6qpO4d0MqO', 1580634807, NULL, NULL, '36.79.47.223', 1580634807, 1580634807, 0, 1580634870),
(104, 'lecture', 'lecture@gmail.com', '$2y$10$EdX4YU.GgcZKncmMF1NulurSQTY0zRIA0Gidk52f.6KLjp9jEqKsG', 'GBJpjXpdqmzbWSTb4EXpR28T_Jm9eIkW', 1580634904, NULL, NULL, '36.79.47.223', 1580634904, 1580634904, 0, 1580634911);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_course_institution` (`institution_id`),
  ADD KEY `FK_course_subject` (`subject_id`),
  ADD KEY `FK_course_level` (`level_id`);

--
-- Indexes for table `course_lecture`
--
ALTER TABLE `course_lecture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_course_lecture_course` (`course_id`);

--
-- Indexes for table `enroled_course`
--
ALTER TABLE `enroled_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_enroled_course_user` (`user_id`),
  ADD KEY `FK_enroled_course_course` (`course_id`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institution_instructor`
--
ALTER TABLE `institution_instructor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_institution_instructor_user` (`user_id`),
  ADD KEY `FK_institution_instructor_institution` (`institution_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `quiz_category`
--
ALTER TABLE `quiz_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`key`),
  ADD KEY `FK_quiz_question_quiz_category` (`category_id`);

--
-- Indexes for table `response_course`
--
ALTER TABLE `response_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_response_course_course_lecture` (`course_lecture_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_lecture`
--
ALTER TABLE `course_lecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enroled_course`
--
ALTER TABLE `enroled_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `institution_instructor`
--
ALTER TABLE `institution_instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_category`
--
ALTER TABLE `quiz_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `response_course`
--
ALTER TABLE `response_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `FK_auth_assignment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK_course_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_course_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_course_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `course_lecture`
--
ALTER TABLE `course_lecture`
  ADD CONSTRAINT `FK_course_lecture_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `enroled_course`
--
ALTER TABLE `enroled_course`
  ADD CONSTRAINT `FK_enroled_course_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_enroled_course_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `institution_instructor`
--
ALTER TABLE `institution_instructor`
  ADD CONSTRAINT `FK_institution_instructor_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_institution_instructor_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD CONSTRAINT `FK_quiz_question_quiz_category` FOREIGN KEY (`category_id`) REFERENCES `quiz_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `response_course`
--
ALTER TABLE `response_course`
  ADD CONSTRAINT `FK_response_course_course_lecture` FOREIGN KEY (`course_lecture_id`) REFERENCES `course_lecture` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
