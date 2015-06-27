-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2015 at 07:49 AM
-- Server version: 5.5.41-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `getupwork_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `acquaitance`
--

CREATE TABLE IF NOT EXISTS `acquaitance` (
  `acquaitance_id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`acquaitance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `availability_timings`
--

CREATE TABLE IF NOT EXISTS `availability_timings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `billing_method`
--

CREATE TABLE IF NOT EXISTS `billing_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE IF NOT EXISTS `certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `tagline` varchar(100) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `company_contact`
--

CREATE TABLE IF NOT EXISTS `company_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `vat_id` varchar(45) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_contact_country1_idx` (`country_id`),
  KEY `fk_company_contact_company1_idx` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `iso_code_2` varchar(45) DEFAULT NULL,
  `iso_code_3` varchar(45) DEFAULT NULL,
  `postcode_required` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address_format` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=252 ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(200) DEFAULT NULL,
  `attended_from` int(11) DEFAULT NULL,
  `attended_to` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `freelancer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_education_course1_idx` (`course_id`),
  KEY `fk_education_freelancer1_idx` (`freelancer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employeer`
--

CREATE TABLE IF NOT EXISTS `employeer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `getupwork_user_id` int(11) NOT NULL,
  `verified` tinyint(4) DEFAULT '0',
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employeer_user1_idx` (`getupwork_user_id`),
  KEY `fk_employeer_company1_idx` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `employeer_funds`
--

CREATE TABLE IF NOT EXISTS `employeer_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` float DEFAULT NULL,
  `employeer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employeer_funds_employeer1_idx` (`employeer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employeer_jobs`
--

CREATE TABLE IF NOT EXISTS `employeer_jobs` (
  `employeer_id` int(11) NOT NULL,
  `Job_id` int(11) NOT NULL,
  KEY `fk_employeer_jobs_employeer1_idx` (`employeer_id`),
  KEY `fk_employeer_jobs_Job1_idx` (`Job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeer_notifications`
--

CREATE TABLE IF NOT EXISTS `employeer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notifications_id` int(11) NOT NULL,
  `employeer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employeer_notifications_notifications1_idx` (`notifications_id`),
  KEY `fk_employeer_notifications_employeer1_idx` (`employeer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employeer_notification_settings`
--

CREATE TABLE IF NOT EXISTS `employeer_notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `additional_info` varchar(45) DEFAULT NULL,
  `notification_settings_id` int(11) NOT NULL,
  `employeer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employeer_notification_settings_notification_settings1_idx` (`notification_settings_id`),
  KEY `fk_employeer_notification_settings_employeer1_idx` (`employeer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employeer_social_accounts`
--

CREATE TABLE IF NOT EXISTS `employeer_social_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeer_id` int(11) NOT NULL,
  `social_accounts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employeer_social_accounts_employeer1_idx` (`employeer_id`),
  KEY `fk_employeer_social_accounts_social_accounts1_idx` (`social_accounts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_billing_method`
--

CREATE TABLE IF NOT EXISTS `employee_billing_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeer_id` int(11) NOT NULL,
  `billing_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_billing_method_employeer1_idx` (`employeer_id`),
  KEY `fk_employee_billing_method_billing_method1_idx` (`billing_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employment`
--

CREATE TABLE IF NOT EXISTS `employment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `location_city` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `period_from_month` int(11) NOT NULL,
  `period_from_year` int(11) NOT NULL,
  `period_to_month` int(11) NOT NULL,
  `period_to_year` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `freelancer_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employment_role1_idx` (`role_id`),
  KEY `fk_employment_freelancer1_idx` (`freelancer_id`),
  KEY `fk_employment_country1_idx` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `english_profisesency_level`
--

CREATE TABLE IF NOT EXISTS `english_profisesency_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(45) NOT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `experience_level`
--

CREATE TABLE IF NOT EXISTS `experience_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(45) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer`
--

CREATE TABLE IF NOT EXISTS `freelancer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `acquaitance_acquaitance_id` int(11) NOT NULL DEFAULT '1',
  `getupwork_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freeLancer_country1_idx` (`country_id`),
  KEY `fk_freeLancer_acquaitance1_idx` (`acquaitance_acquaitance_id`),
  KEY `fk_freeLancer_user1_idx` (`getupwork_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_category`
--

CREATE TABLE IF NOT EXISTS `freelancer_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freelancer_category_freeLancer1_idx` (`freelancer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_certifications`
--

CREATE TABLE IF NOT EXISTS `freelancer_certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` int(11) NOT NULL,
  `certifications_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_freelancer1_idx` (`freelancer_id`),
  KEY `fk_freelancer_certifications_certifications1_idx` (`certifications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_funds`
--

CREATE TABLE IF NOT EXISTS `freelancer_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` float DEFAULT NULL,
  `freelancer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freelancer_funds_freelancer1_idx` (`freelancer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_profile`
--

CREATE TABLE IF NOT EXISTS `freelancer_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profissional_title` varchar(300) NOT NULL,
  `overview` varchar(2000) DEFAULT NULL,
  `freelancer_id` int(11) NOT NULL,
  `english_profisesency_level_id` int(11) NOT NULL,
  `availability_timings_id1` int(11) NOT NULL,
  `experience_level_id` int(11) NOT NULL,
  `billing_rate` int(11) DEFAULT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `membership_plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freelancer_profile_freeLancer1_idx` (`freelancer_id`),
  KEY `fk_freelancer_profile_english_profisesency_level1_idx` (`english_profisesency_level_id`),
  KEY `fk_freelancer_profile_availability_timings2_idx` (`availability_timings_id1`),
  KEY `fk_freelancer_profile_experience_level1_idx` (`experience_level_id`),
  KEY `fk_freelancer_profile_country1_idx` (`country_id`),
  KEY `fk_freelancer_profile_membership_plan1_idx` (`membership_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_skills`
--

CREATE TABLE IF NOT EXISTS `freelancer_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freelancer_skills_freelancer1_idx` (`freelancer_id`),
  KEY `fk_freelancer_skills_skill1_idx` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_social_accounts`
--

CREATE TABLE IF NOT EXISTS `freelancer_social_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freelancer_id` int(11) NOT NULL,
  `social_accounts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_freelancer_social_accounts_freeLancer1_idx` (`freelancer_id`),
  KEY `fk_freelancer_social_accounts_social_accounts1_idx` (`social_accounts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `getupwork_user`
--

CREATE TABLE IF NOT EXISTS `getupwork_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `salt` varchar(40) NOT NULL,
  `password` varchar(250) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `image` varchar(245) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_verification_link_sent` varchar(45) DEFAULT NULL,
  `verification_code` varchar(100) DEFAULT NULL,
  `last_login` datetime NOT NULL,
  `created` datetime NOT NULL,
  `time_zone_id` int(11) NOT NULL,
  `is_profile_complete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `description` varchar(6000) DEFAULT NULL,
  `payment_type_id` int(11) NOT NULL,
  `project_duration_type_id` int(11) NOT NULL,
  `employeer_id1` int(11) NOT NULL,
  `workload_type_id` int(11) NOT NULL,
  `price` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Job_payment_type1_idx` (`payment_type_id`),
  KEY `fk_Job_project_duration_type1_idx` (`project_duration_type_id`),
  KEY `fk_Job_employeer2_idx` (`employeer_id1`),
  KEY `fk_Job_workload_type1_idx` (`workload_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `job_freelancers`
--

CREATE TABLE IF NOT EXISTS `job_freelancers` (
  `Job_id` int(11) NOT NULL,
  `freelancer_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  KEY `fk_job_freelancers_Job1_idx` (`Job_id`),
  KEY `fk_job_freelancers_freelancer1_idx` (`freelancer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_skill`
--

CREATE TABLE IF NOT EXISTS `job_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_skill_Job1_idx` (`Job_id`),
  KEY `fk_job_skill_skill1_idx` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `language_freelancer`
--

CREATE TABLE IF NOT EXISTS `language_freelancer` (
  `language_freelancer_id` int(11) NOT NULL,
  `freelancer_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`language_freelancer_id`),
  KEY `fk_language_freelancer_freeLancer1_idx` (`freelancer_id`),
  KEY `fk_language_freelancer_language1_idx` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `membership_plan`
--

CREATE TABLE IF NOT EXISTS `membership_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `message_type_id` int(11) NOT NULL,
  `message_sender_type_id` int(11) NOT NULL,
  `message_receiver_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_message_type1_idx` (`message_type_id`),
  KEY `fk_messages_messege_user_type1_idx` (`message_sender_type_id`),
  KEY `fk_messages_messege_user_type2_idx` (`message_receiver_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

CREATE TABLE IF NOT EXISTS `message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_user_type`
--

CREATE TABLE IF NOT EXISTS `message_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  `notification_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notification_type_notification_group1_idx` (`notification_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_setting_group`
--

CREATE TABLE IF NOT EXISTS `notifications_setting_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_group`
--

CREATE TABLE IF NOT EXISTS `notification_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE IF NOT EXISTS `notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `play_sound` tinyint(1) DEFAULT NULL,
  `notification_setting_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notification_settings_notification_setting_type1_idx` (`notification_setting_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE IF NOT EXISTS `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permission_type`
--

CREATE TABLE IF NOT EXISTS `permission_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `permission_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_type_permission_group1_idx` (`permission_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_project_skills`
--

CREATE TABLE IF NOT EXISTS `portfolio_project_skills` (
  `portfolio_project_skills` int(11) NOT NULL,
  `portifolio_projects_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`portfolio_project_skills`),
  KEY `fk_portfolio_project_skills_portifolio_projects1_idx` (`portifolio_projects_id`),
  KEY `fk_portfolio_project_skills_skill1_idx` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portifolio_images`
--

CREATE TABLE IF NOT EXISTS `portifolio_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `portifolio_projects_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_portifolio_images_portifolio_projects1_idx` (`portifolio_projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `portifolio_projects`
--

CREATE TABLE IF NOT EXISTS `portifolio_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_title` varchar(200) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `thumbbail` varchar(100) DEFAULT NULL,
  `project_url` varchar(200) DEFAULT NULL,
  `completion_date` varchar(20) DEFAULT NULL,
  `freelancer_category_id` int(11) NOT NULL,
  `skill_category_id` int(11) NOT NULL,
  `freelancer_id1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_portifolio_projects_freelancer_category1_idx` (`freelancer_category_id`),
  KEY `fk_portifolio_projects_skill_category1_idx` (`skill_category_id`),
  KEY `fk_portifolio_projects_freelancer1_idx` (`freelancer_id1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_duration_type`
--

CREATE TABLE IF NOT EXISTS `project_duration_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(65) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `setting_type` char(1) CHARACTER SET utf8 NOT NULL,
  `value_type` char(1) CHARACTER SET utf8 NOT NULL,
  `int_value` int(12) DEFAULT NULL,
  `string_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `text_value` text CHARACTER SET utf8,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skill_category`
--

CREATE TABLE IF NOT EXISTS `skill_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `freelancer_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_skill_category_freelancer_category1_idx` (`freelancer_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skill_to_category`
--

CREATE TABLE IF NOT EXISTS `skill_to_category` (
  `skill_category_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  KEY `fk_skill_to_category_skill_category1_idx` (`skill_category_id`),
  KEY `fk_skill_to_category_skill1_idx` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE IF NOT EXISTS `social_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `employeer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_employeer1_idx` (`employeer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff_permissions`
--

CREATE TABLE IF NOT EXISTS `staff_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `permission_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_permissions_staff1_idx` (`staff_id`),
  KEY `fk_staff_permissions_permission_group1_idx` (`permission_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `time_zone`
--

CREATE TABLE IF NOT EXISTS `time_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_zone_name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(45) DEFAULT NULL,
  `employeer_id` int(11) NOT NULL,
  `Job_id` int(11) NOT NULL,
  `freelancer_funds_id` int(11) NOT NULL,
  `employeer_funds_id` int(11) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `from_user_transaction_type_id` int(11) NOT NULL,
  `to_user_transaction_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transactions_employeer1_idx` (`employeer_id`),
  KEY `fk_transactions_Job1_idx` (`Job_id`),
  KEY `fk_transactions_freelancer_funds1_idx` (`freelancer_funds_id`),
  KEY `fk_transactions_employeer_funds1_idx` (`employeer_funds_id`),
  KEY `fk_transactions_transaction_with1_idx` (`from_user_transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE IF NOT EXISTS `transaction_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` mediumtext NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `verfication_details`
--

CREATE TABLE IF NOT EXISTS `verfication_details` (
  `email` char(1) NOT NULL,
  `verification_code` varchar(45) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workload_type`
--

CREATE TABLE IF NOT EXISTS `workload_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work_type_categories`
--

CREATE TABLE IF NOT EXISTS `work_type_categories` (
  `work_type_categorie_id` int(11) NOT NULL,
  `work_type_categorie_label` varchar(45) DEFAULT NULL,
  `work_type_categorie_description` varchar(45) DEFAULT NULL,
  `work_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`work_type_categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company_contact`
--
ALTER TABLE `company_contact`
  ADD CONSTRAINT `fk_company_contact_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_company_contact_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `fk_education_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_education_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer`
--
ALTER TABLE `employeer`
  ADD CONSTRAINT `fk_employeer_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employeer_user1` FOREIGN KEY (`getupwork_user_id`) REFERENCES `getupwork_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer_funds`
--
ALTER TABLE `employeer_funds`
  ADD CONSTRAINT `fk_employeer_funds_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer_jobs`
--
ALTER TABLE `employeer_jobs`
  ADD CONSTRAINT `fk_employeer_jobs_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employeer_jobs_Job1` FOREIGN KEY (`Job_id`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer_notifications`
--
ALTER TABLE `employeer_notifications`
  ADD CONSTRAINT `fk_employeer_notifications_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employeer_notifications_notifications1` FOREIGN KEY (`notifications_id`) REFERENCES `notifications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer_notification_settings`
--
ALTER TABLE `employeer_notification_settings`
  ADD CONSTRAINT `fk_employeer_notification_settings_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employeer_notification_settings_notification_settings1` FOREIGN KEY (`notification_settings_id`) REFERENCES `notification_settings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employeer_social_accounts`
--
ALTER TABLE `employeer_social_accounts`
  ADD CONSTRAINT `fk_employeer_social_accounts_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employeer_social_accounts_social_accounts1` FOREIGN KEY (`social_accounts_id`) REFERENCES `social_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_billing_method`
--
ALTER TABLE `employee_billing_method`
  ADD CONSTRAINT `fk_employee_billing_method_billing_method1` FOREIGN KEY (`billing_method_id`) REFERENCES `billing_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employee_billing_method_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employment`
--
ALTER TABLE `employment`
  ADD CONSTRAINT `fk_employment_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employment_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employment_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer`
--
ALTER TABLE `freelancer`
  ADD CONSTRAINT `fk_freeLancer_acquaitance1` FOREIGN KEY (`acquaitance_acquaitance_id`) REFERENCES `acquaitance` (`acquaitance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freeLancer_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freeLancer_user1` FOREIGN KEY (`getupwork_user_id`) REFERENCES `getupwork_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_category`
--
ALTER TABLE `freelancer_category`
  ADD CONSTRAINT `fk_freelancer_category_freeLancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_certifications`
--
ALTER TABLE `freelancer_certifications`
  ADD CONSTRAINT `fk_freelancer_certifications_certifications1` FOREIGN KEY (`certifications_id`) REFERENCES `certifications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_funds`
--
ALTER TABLE `freelancer_funds`
  ADD CONSTRAINT `fk_freelancer_funds_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_profile`
--
ALTER TABLE `freelancer_profile`
  ADD CONSTRAINT `fk_freelancer_profile_availability_timings2` FOREIGN KEY (`availability_timings_id1`) REFERENCES `availability_timings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_profile_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_profile_english_profisesency_level1` FOREIGN KEY (`english_profisesency_level_id`) REFERENCES `english_profisesency_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_profile_experience_level1` FOREIGN KEY (`experience_level_id`) REFERENCES `experience_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_profile_freeLancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_profile_membership_plan1` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_skills`
--
ALTER TABLE `freelancer_skills`
  ADD CONSTRAINT `fk_freelancer_skills_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_skills_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `freelancer_social_accounts`
--
ALTER TABLE `freelancer_social_accounts`
  ADD CONSTRAINT `fk_freelancer_social_accounts_freeLancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_freelancer_social_accounts_social_accounts1` FOREIGN KEY (`social_accounts_id`) REFERENCES `social_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `fk_Job_employeer2` FOREIGN KEY (`employeer_id1`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Job_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Job_project_duration_type1` FOREIGN KEY (`project_duration_type_id`) REFERENCES `project_duration_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Job_workload_type1` FOREIGN KEY (`workload_type_id`) REFERENCES `workload_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_freelancers`
--
ALTER TABLE `job_freelancers`
  ADD CONSTRAINT `fk_job_freelancers_freelancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_job_freelancers_Job1` FOREIGN KEY (`Job_id`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_skill`
--
ALTER TABLE `job_skill`
  ADD CONSTRAINT `fk_job_skill_Job1` FOREIGN KEY (`Job_id`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_job_skill_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `language_freelancer`
--
ALTER TABLE `language_freelancer`
  ADD CONSTRAINT `fk_language_freelancer_freeLancer1` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_language_freelancer_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_message_type1` FOREIGN KEY (`message_type_id`) REFERENCES `message_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_messege_user_type1` FOREIGN KEY (`message_sender_type_id`) REFERENCES `message_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_messege_user_type2` FOREIGN KEY (`message_receiver_type_id`) REFERENCES `message_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notification_type_notification_group1` FOREIGN KEY (`notification_group_id`) REFERENCES `notification_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD CONSTRAINT `fk_notification_settings_notification_setting_type1` FOREIGN KEY (`notification_setting_type_id`) REFERENCES `notifications_setting_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `permission_type`
--
ALTER TABLE `permission_type`
  ADD CONSTRAINT `fk_permission_type_permission_group1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `portfolio_project_skills`
--
ALTER TABLE `portfolio_project_skills`
  ADD CONSTRAINT `fk_portfolio_project_skills_portifolio_projects1` FOREIGN KEY (`portifolio_projects_id`) REFERENCES `portifolio_projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_portfolio_project_skills_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `portifolio_images`
--
ALTER TABLE `portifolio_images`
  ADD CONSTRAINT `fk_portifolio_images_portifolio_projects1` FOREIGN KEY (`portifolio_projects_id`) REFERENCES `portifolio_projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `portifolio_projects`
--
ALTER TABLE `portifolio_projects`
  ADD CONSTRAINT `fk_portifolio_projects_freelancer1` FOREIGN KEY (`freelancer_id1`) REFERENCES `freelancer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_portifolio_projects_freelancer_category1` FOREIGN KEY (`freelancer_category_id`) REFERENCES `freelancer_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_portifolio_projects_skill_category1` FOREIGN KEY (`skill_category_id`) REFERENCES `skill_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `skill_category`
--
ALTER TABLE `skill_category`
  ADD CONSTRAINT `fk_skill_category_freelancer_category1` FOREIGN KEY (`freelancer_category_id`) REFERENCES `freelancer_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `skill_to_category`
--
ALTER TABLE `skill_to_category`
  ADD CONSTRAINT `fk_skill_to_category_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_skill_to_category_skill_category1` FOREIGN KEY (`skill_category_id`) REFERENCES `skill_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff_permissions`
--
ALTER TABLE `staff_permissions`
  ADD CONSTRAINT `fk_staff_permissions_permission_group1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_staff_permissions_staff1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_employeer1` FOREIGN KEY (`employeer_id`) REFERENCES `employeer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_employeer_funds1` FOREIGN KEY (`employeer_funds_id`) REFERENCES `employeer_funds` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_freelancer_funds1` FOREIGN KEY (`freelancer_funds_id`) REFERENCES `freelancer_funds` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_Job1` FOREIGN KEY (`Job_id`) REFERENCES `job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_transaction_with1` FOREIGN KEY (`from_user_transaction_type_id`) REFERENCES `transaction_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
