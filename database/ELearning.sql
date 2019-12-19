-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Dec 19, 2019 at 06:59 AM
-- Server version: 10.3.18-MariaDB-1:10.3.18+maria~bionic
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apps_docker`
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
('Lecture', 11, 1576638581),
('Member', 39, 1576737101),
('Sysadmin', 1, 1572675180);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1572617269, 1572617269),
('/course/*', 2, NULL, NULL, NULL, 1576505149, 1576505149),
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
('Member', 1, NULL, NULL, NULL, 1572674892, 1572675631),
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
('Member', '/course/*'),
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
  `data` blob DEFAULT NULL,
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
  `about` text DEFAULT NULL,
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
(1, 'Natural Language Processing', 'Natural Language Processing', 2, 1, 1, 11, 11, 1576643162, 1576643640);

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
(1, 1, 'Intruduction NLP', 'Intruduction NLP', 'Download Disini', NULL, NULL, 1, NULL, 1576674633),
(3, 1, 'Materi 2', 'TEst Materi 2', '', NULL, 1, 1, 1576662508, 1576662508),
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

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
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
(3, 'Universitas Dianuswantoro', 'universitas-dianuswantoro', 'UDINUS', 2, 2, 1576639128, 1576639128);

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
(8, 3, 11, 2, 2, 1576639145, 1576639145);

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
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `response` text DEFAULT NULL,
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
  `status` smallint(6) NOT NULL DEFAULT 1
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
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, 'Computer Science', 'computer-science', 1573373683, 1573373759);

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
(11, 'waZRE6a2xJrBguICHcgQlQC5DbQ6fzbg', 1574373473, 0);

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
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'admin', 'edyagusc@gmail.com', '$2y$10$INAPuvkeYguFyiGrAhzVIuJ7FgTWwsQu4q.Ki8kYy7rXTfwuH/Zg.', 'Zex96X-pU8T4v6HnvKWkF5Ktp3gvD1VN', 1572096547, NULL, NULL, '172.22.0.1', 1572096302, 1576587814, 0, 1576723904),
(2, 'agusedyc', 'agusedyc@gmail.com', '$2y$10$OirirT0c1ibjaya8dMJq4u41LBGmxkbp32k7mx.YRxgACwRRlWuSG', '06SyqFrKG6S15TWzmiT1hO1VbdPrkJpE', 1572674864, NULL, NULL, '172.19.0.1', 1572674717, 1572674717, 0, 1576641888),
(10, 'institusi', 'adi@gmail.com', '$2y$10$faatugwcvM7BBQQnZOr1xuvUFNYbNloKWQrg.WD1P.U.taE0ZEdTm', 'bIRw9m5ByS5sJpbtGC0qz-RWRzebZMi4', 1572680106, NULL, NULL, '172.19.0.1', 1572680095, 1576503964, 0, 1576592864),
(11, 'tono', 'tono@gm.cc', '$2y$10$8AM02BYK6gmTD0GZutBn1.3qT7AA/LKy6i0WPY12dYV83fhtSaAGC', 'hb6dAsTn_4r9AmTAp0Hq4OK2sbDcKpdg', 1576592965, NULL, NULL, '172.18.0.1', 1574373473, 1576592993, 0, 1576678803),
(39, 'adibudi', 'adibudi@gmail.com', '$2y$10$w.FD6siYBE.PhNTYMuVxyeYRbH6rxtQSvGErTl7yNgHVfdwwBnDbW', 'qrtYP_oN729_G4Xq6hnMRD2OI5_08igN', 1576737084, NULL, NULL, '172.18.0.1', 1576737084, 1576737095, 0, 1576737117);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_lecture`
--
ALTER TABLE `course_lecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enroled_course`
--
ALTER TABLE `enroled_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `institution_instructor`
--
ALTER TABLE `institution_instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
