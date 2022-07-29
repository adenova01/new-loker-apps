-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.8-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table new_loker_apps.applicant_notes
DROP TABLE IF EXISTS `applicant_notes`;
CREATE TABLE IF NOT EXISTS `applicant_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `job_application_id` int(10) unsigned NOT NULL,
  `note_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applicant_notes_user_id_foreign` (`user_id`),
  KEY `applicant_notes_job_application_id_foreign` (`job_application_id`),
  CONSTRAINT `applicant_notes_job_application_id_foreign` FOREIGN KEY (`job_application_id`) REFERENCES `job_applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applicant_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.applicant_notes: ~0 rows (approximately)
/*!40000 ALTER TABLE `applicant_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicant_notes` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.application_settings
DROP TABLE IF EXISTS `application_settings`;
CREATE TABLE IF NOT EXISTS `application_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `legal_term` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_setting` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.application_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `application_settings` DISABLE KEYS */;
INSERT INTO `application_settings` (`id`, `legal_term`, `mail_setting`, `created_at`, `updated_at`) VALUES
	(1, 'If any provision of these Terms and Conditions is held to be invalid or unenforceable, the provision shall be removed (or interpreted, if possible, in a manner as to be enforceable), and the remaining provisions shall be enforced. Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section. Our failure to act with respect to a breach by you or others does not waive our right to act with respect to subsequent or similar breaches. These Terms and Conditions set forth the entire understanding and agreement between us with respect to the subject matter contained herein and supersede any other agreement, proposals and communications, written or oral, between our representatives and you with respect to the subject matter hereof, including any terms and conditions on any of customer\'s documents or purchase orders.<br>No Joint Venture, No Derogation of Rights. You agree that no joint venture, partnership, employment, or agency relationship exists between you and us as a result of these Terms and Conditions or your use of the Site. Our performance of these Terms and Conditions is subject to existing laws and legal process, and nothing contained herein is in derogation of our right to comply with governmental, court and law enforcement requests or requirements relating to your use of the Site or information provided to or gathered by us with respect to such use.', '{"1":{"name":"applied","status":true},"2":{"name":"phone screen","status":true},"3":{"name":"interview","status":true},"4":{"name":"hired","status":true},"5":{"name":"rejected","status":true}}', '2022-07-29 16:58:47', '2022-07-29 16:58:47');
/*!40000 ALTER TABLE `application_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.application_status
DROP TABLE IF EXISTS `application_status`;
CREATE TABLE IF NOT EXISTS `application_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  `color` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.application_status: ~5 rows (approximately)
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
INSERT INTO `application_status` (`id`, `status`, `position`, `color`, `created_at`, `updated_at`) VALUES
	(1, 'applied', 1, '#2b2b2b', NULL, '2022-07-29 16:58:47'),
	(2, 'phone screen', 2, '#f1e52e', NULL, '2022-07-29 16:58:47'),
	(3, 'interview', 3, '#3d8ee8', NULL, '2022-07-29 16:58:47'),
	(4, 'hired', 4, '#32ac16', NULL, '2022-07-29 16:58:47'),
	(5, 'rejected', 5, '#ee1127', NULL, '2022-07-29 16:58:47');
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.companies
DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `show_in_frontend` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `linkedin` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.companies: ~0 rows (approximately)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `address`, `website`, `status`, `show_in_frontend`, `created_at`, `updated_at`, `linkedin`) VALUES
	(1, 'Froiden Technologies Pvt Ltd', 'company@example.com', '1234512345', NULL, 'Jaipur, India', 'http://www.xyz.com', 'active', 'true', '2022-07-29 16:58:41', '2022-07-29 16:58:41', 'disable');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.company_settings
DROP TABLE IF EXISTS `company_settings`;
CREATE TABLE IF NOT EXISTS `company_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `show_review_modal` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.company_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_settings` DISABLE KEYS */;
INSERT INTO `company_settings` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `address`, `website`, `timezone`, `locale`, `latitude`, `longitude`, `created_at`, `updated_at`, `purchase_code`, `supported_until`, `system_update`, `show_review_modal`) VALUES
	(1, 'loker-apps', 'dummy@gmail.com', '08956125431', NULL, 'Surabaya indonesia', 'http://localhost/loker-apps-new', 'Asia/Jakarta', 'en', 26.91243360, 75.78727090, NULL, '2022-07-29 17:12:04', NULL, NULL, 0, 1);
/*!40000 ALTER TABLE `company_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.countries: ~245 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AL', 'Albania'),
	(3, 'DZ', 'Algeria'),
	(4, 'DS', 'American Samoa'),
	(5, 'AD', 'Andorra'),
	(6, 'AO', 'Angola'),
	(7, 'AI', 'Anguilla'),
	(8, 'AQ', 'Antarctica'),
	(9, 'AG', 'Antigua and Barbuda'),
	(10, 'AR', 'Argentina'),
	(11, 'AM', 'Armenia'),
	(12, 'AW', 'Aruba'),
	(13, 'AU', 'Australia'),
	(14, 'AT', 'Austria'),
	(15, 'AZ', 'Azerbaijan'),
	(16, 'BS', 'Bahamas'),
	(17, 'BH', 'Bahrain'),
	(18, 'BD', 'Bangladesh'),
	(19, 'BB', 'Barbados'),
	(20, 'BY', 'Belarus'),
	(21, 'BE', 'Belgium'),
	(22, 'BZ', 'Belize'),
	(23, 'BJ', 'Benin'),
	(24, 'BM', 'Bermuda'),
	(25, 'BT', 'Bhutan'),
	(26, 'BO', 'Bolivia'),
	(27, 'BA', 'Bosnia and Herzegovina'),
	(28, 'BW', 'Botswana'),
	(29, 'BV', 'Bouvet Island'),
	(30, 'BR', 'Brazil'),
	(31, 'IO', 'British Indian Ocean Territory'),
	(32, 'BN', 'Brunei Darussalam'),
	(33, 'BG', 'Bulgaria'),
	(34, 'BF', 'Burkina Faso'),
	(35, 'BI', 'Burundi'),
	(36, 'KH', 'Cambodia'),
	(37, 'CM', 'Cameroon'),
	(38, 'CA', 'Canada'),
	(39, 'CV', 'Cape Verde'),
	(40, 'KY', 'Cayman Islands'),
	(41, 'CF', 'Central African Republic'),
	(42, 'TD', 'Chad'),
	(43, 'CL', 'Chile'),
	(44, 'CN', 'China'),
	(45, 'CX', 'Christmas Island'),
	(46, 'CC', 'Cocos (Keeling) Islands'),
	(47, 'CO', 'Colombia'),
	(48, 'KM', 'Comoros'),
	(49, 'CG', 'Congo'),
	(50, 'CK', 'Cook Islands'),
	(51, 'CR', 'Costa Rica'),
	(52, 'HR', 'Croatia (Hrvatska)'),
	(53, 'CU', 'Cuba'),
	(54, 'CY', 'Cyprus'),
	(55, 'CZ', 'Czech Republic'),
	(56, 'DK', 'Denmark'),
	(57, 'DJ', 'Djibouti'),
	(58, 'DM', 'Dominica'),
	(59, 'DO', 'Dominican Republic'),
	(60, 'TP', 'East Timor'),
	(61, 'EC', 'Ecuador'),
	(62, 'EG', 'Egypt'),
	(63, 'SV', 'El Salvador'),
	(64, 'GQ', 'Equatorial Guinea'),
	(65, 'ER', 'Eritrea'),
	(66, 'EE', 'Estonia'),
	(67, 'ET', 'Ethiopia'),
	(68, 'FK', 'Falkland Islands (Malvinas)'),
	(69, 'FO', 'Faroe Islands'),
	(70, 'FJ', 'Fiji'),
	(71, 'FI', 'Finland'),
	(72, 'FR', 'France'),
	(73, 'FX', 'France, Metropolitan'),
	(74, 'GF', 'French Guiana'),
	(75, 'PF', 'French Polynesia'),
	(76, 'TF', 'French Southern Territories'),
	(77, 'GA', 'Gabon'),
	(78, 'GM', 'Gambia'),
	(79, 'GE', 'Georgia'),
	(80, 'DE', 'Germany'),
	(81, 'GH', 'Ghana'),
	(82, 'GI', 'Gibraltar'),
	(83, 'GK', 'Guernsey'),
	(84, 'GR', 'Greece'),
	(85, 'GL', 'Greenland'),
	(86, 'GD', 'Grenada'),
	(87, 'GP', 'Guadeloupe'),
	(88, 'GU', 'Guam'),
	(89, 'GT', 'Guatemala'),
	(90, 'GN', 'Guinea'),
	(91, 'GW', 'Guinea-Bissau'),
	(92, 'GY', 'Guyana'),
	(93, 'HT', 'Haiti'),
	(94, 'HM', 'Heard and Mc Donald Islands'),
	(95, 'HN', 'Honduras'),
	(96, 'HK', 'Hong Kong'),
	(97, 'HU', 'Hungary'),
	(98, 'IS', 'Iceland'),
	(99, 'IN', 'India'),
	(100, 'IM', 'Isle of Man'),
	(101, 'ID', 'Indonesia'),
	(102, 'IR', 'Iran (Islamic Republic of)'),
	(103, 'IQ', 'Iraq'),
	(104, 'IE', 'Ireland'),
	(105, 'IL', 'Israel'),
	(106, 'IT', 'Italy'),
	(107, 'CI', 'Ivory Coast'),
	(108, 'JE', 'Jersey'),
	(109, 'JM', 'Jamaica'),
	(110, 'JP', 'Japan'),
	(111, 'JO', 'Jordan'),
	(112, 'KZ', 'Kazakhstan'),
	(113, 'KE', 'Kenya'),
	(114, 'KI', 'Kiribati'),
	(115, 'KP', 'Korea, Democratic People\'s Republic of'),
	(116, 'KR', 'Korea, Republic of'),
	(117, 'XK', 'Kosovo'),
	(118, 'KW', 'Kuwait'),
	(119, 'KG', 'Kyrgyzstan'),
	(120, 'LA', 'Lao People\'s Democratic Republic'),
	(121, 'LV', 'Latvia'),
	(122, 'LB', 'Lebanon'),
	(123, 'LS', 'Lesotho'),
	(124, 'LR', 'Liberia'),
	(125, 'LY', 'Libyan Arab Jamahiriya'),
	(126, 'LI', 'Liechtenstein'),
	(127, 'LT', 'Lithuania'),
	(128, 'LU', 'Luxembourg'),
	(129, 'MO', 'Macau'),
	(130, 'MK', 'Macedonia'),
	(131, 'MG', 'Madagascar'),
	(132, 'MW', 'Malawi'),
	(133, 'MY', 'Malaysia'),
	(134, 'MV', 'Maldives'),
	(135, 'ML', 'Mali'),
	(136, 'MT', 'Malta'),
	(137, 'MH', 'Marshall Islands'),
	(138, 'MQ', 'Martinique'),
	(139, 'MR', 'Mauritania'),
	(140, 'MU', 'Mauritius'),
	(141, 'TY', 'Mayotte'),
	(142, 'MX', 'Mexico'),
	(143, 'FM', 'Micronesia, Federated States of'),
	(144, 'MD', 'Moldova, Republic of'),
	(145, 'MC', 'Monaco'),
	(146, 'MN', 'Mongolia'),
	(147, 'ME', 'Montenegro'),
	(148, 'MS', 'Montserrat'),
	(149, 'MA', 'Morocco'),
	(150, 'MZ', 'Mozambique'),
	(151, 'MM', 'Myanmar'),
	(152, 'NA', 'Namibia'),
	(153, 'NR', 'Nauru'),
	(154, 'NP', 'Nepal'),
	(155, 'NL', 'Netherlands'),
	(156, 'AN', 'Netherlands Antilles'),
	(157, 'NC', 'New Caledonia'),
	(158, 'NZ', 'New Zealand'),
	(159, 'NI', 'Nicaragua'),
	(160, 'NE', 'Niger'),
	(161, 'NG', 'Nigeria'),
	(162, 'NU', 'Niue'),
	(163, 'NF', 'Norfolk Island'),
	(164, 'MP', 'Northern Mariana Islands'),
	(165, 'NO', 'Norway'),
	(166, 'OM', 'Oman'),
	(167, 'PK', 'Pakistan'),
	(168, 'PW', 'Palau'),
	(169, 'PS', 'Palestine'),
	(170, 'PA', 'Panama'),
	(171, 'PG', 'Papua New Guinea'),
	(172, 'PY', 'Paraguay'),
	(173, 'PE', 'Peru'),
	(174, 'PH', 'Philippines'),
	(175, 'PN', 'Pitcairn'),
	(176, 'PL', 'Poland'),
	(177, 'PT', 'Portugal'),
	(178, 'PR', 'Puerto Rico'),
	(179, 'QA', 'Qatar'),
	(180, 'RE', 'Reunion'),
	(181, 'RO', 'Romania'),
	(182, 'RU', 'Russian Federation'),
	(183, 'RW', 'Rwanda'),
	(184, 'KN', 'Saint Kitts and Nevis'),
	(185, 'LC', 'Saint Lucia'),
	(186, 'VC', 'Saint Vincent and the Grenadines'),
	(187, 'WS', 'Samoa'),
	(188, 'SM', 'San Marino'),
	(189, 'ST', 'Sao Tome and Principe'),
	(190, 'SA', 'Saudi Arabia'),
	(191, 'SN', 'Senegal'),
	(192, 'RS', 'Serbia'),
	(193, 'SC', 'Seychelles'),
	(194, 'SL', 'Sierra Leone'),
	(195, 'SG', 'Singapore'),
	(196, 'SK', 'Slovakia'),
	(197, 'SI', 'Slovenia'),
	(198, 'SB', 'Solomon Islands'),
	(199, 'SO', 'Somalia'),
	(200, 'ZA', 'South Africa'),
	(201, 'GS', 'South Georgia South Sandwich Islands'),
	(202, 'ES', 'Spain'),
	(203, 'LK', 'Sri Lanka'),
	(204, 'SH', 'St. Helena'),
	(205, 'PM', 'St. Pierre and Miquelon'),
	(206, 'SD', 'Sudan'),
	(207, 'SR', 'Suriname'),
	(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
	(209, 'SZ', 'Swaziland'),
	(210, 'SE', 'Sweden'),
	(211, 'CH', 'Switzerland'),
	(212, 'SY', 'Syrian Arab Republic'),
	(213, 'TW', 'Taiwan'),
	(214, 'TJ', 'Tajikistan'),
	(215, 'TZ', 'Tanzania, United Republic of'),
	(216, 'TH', 'Thailand'),
	(217, 'TG', 'Togo'),
	(218, 'TK', 'Tokelau'),
	(219, 'TO', 'Tonga'),
	(220, 'TT', 'Trinidad and Tobago'),
	(221, 'TN', 'Tunisia'),
	(222, 'TR', 'Turkey'),
	(223, 'TM', 'Turkmenistan'),
	(224, 'TC', 'Turks and Caicos Islands'),
	(225, 'TV', 'Tuvalu'),
	(226, 'UG', 'Uganda'),
	(227, 'UA', 'Ukraine'),
	(228, 'AE', 'United Arab Emirates'),
	(229, 'GB', 'United Kingdom'),
	(230, 'US', 'United States'),
	(231, 'UM', 'United States minor outlying islands'),
	(232, 'UY', 'Uruguay'),
	(233, 'UZ', 'Uzbekistan'),
	(234, 'VU', 'Vanuatu'),
	(235, 'VA', 'Vatican City State'),
	(236, 'VE', 'Venezuela'),
	(237, 'VN', 'Vietnam'),
	(238, 'VG', 'Virgin Islands (British)'),
	(239, 'VI', 'Virgin Islands (U.S.)'),
	(240, 'WF', 'Wallis and Futuna Islands'),
	(241, 'EH', 'Western Sahara'),
	(242, 'YE', 'Yemen'),
	(243, 'ZR', 'Zaire'),
	(244, 'ZM', 'Zambia'),
	(245, 'ZW', 'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.departments
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.departments: ~0 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.designations
DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.designations: ~0 rows (approximately)
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.documents
DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `documentable_id` int(11) NOT NULL,
  `documentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_documentable_id_documentable_type_name_unique` (`documentable_id`,`documentable_type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.documents: ~0 rows (approximately)
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.footer_settings
DROP TABLE IF EXISTS `footer_settings`;
CREATE TABLE IF NOT EXISTS `footer_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.footer_settings: ~2 rows (approximately)
/*!40000 ALTER TABLE `footer_settings` DISABLE KEYS */;
INSERT INTO `footer_settings` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'About', 'about', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'active', '2022-07-29 16:58:47', '2022-07-29 16:58:47'),
	(2, 'Help', 'help', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'active', '2022-07-29 16:58:47', '2022-07-29 16:58:47');
/*!40000 ALTER TABLE `footer_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.interview_schedules
DROP TABLE IF EXISTS `interview_schedules`;
CREATE TABLE IF NOT EXISTS `interview_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_application_id` int(10) unsigned NOT NULL,
  `schedule_date` datetime NOT NULL,
  `status` enum('rejected','hired','pending','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `user_accept_status` enum('accept','refuse','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interview_schedules_job_application_id_foreign` (`job_application_id`),
  CONSTRAINT `interview_schedules_job_application_id_foreign` FOREIGN KEY (`job_application_id`) REFERENCES `job_applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.interview_schedules: ~0 rows (approximately)
/*!40000 ALTER TABLE `interview_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedules` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.interview_schedule_comments
DROP TABLE IF EXISTS `interview_schedule_comments`;
CREATE TABLE IF NOT EXISTS `interview_schedule_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `interview_schedule_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interview_schedule_comments_interview_schedule_id_foreign` (`interview_schedule_id`),
  KEY `interview_schedule_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `interview_schedule_comments_interview_schedule_id_foreign` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interview_schedule_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.interview_schedule_comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `interview_schedule_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedule_comments` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.interview_schedule_employees
DROP TABLE IF EXISTS `interview_schedule_employees`;
CREATE TABLE IF NOT EXISTS `interview_schedule_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `interview_schedule_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_accept_status` enum('accept','refuse','waiting') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interview_schedule_employees_interview_schedule_id_foreign` (`interview_schedule_id`),
  KEY `interview_schedule_employees_user_id_foreign` (`user_id`),
  CONSTRAINT `interview_schedule_employees_interview_schedule_id_foreign` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interview_schedule_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.interview_schedule_employees: ~0 rows (approximately)
/*!40000 ALTER TABLE `interview_schedule_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedule_employees` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `job_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_requirement` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_positions` int(11) NOT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `required_columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_visibility` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_location_id_foreign` (`location_id`),
  KEY `jobs_category_id_foreign` (`category_id`),
  KEY `jobs_company_id_foreign` (`company_id`),
  CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobs_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `job_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.jobs: ~1 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `title`, `slug`, `company_id`, `job_description`, `job_requirement`, `total_positions`, `location_id`, `category_id`, `start_date`, `end_date`, `status`, `required_columns`, `meta_details`, `section_visibility`, `created_at`, `updated_at`) VALUES
	(1, 'Recuirtment web developer react', 'recuirtment-web-developer-react-surabaya', 1, 'bla bla bla', 'bla bla bla', 3, 1, 1, '2022-07-29 00:00:00', '2022-08-31 00:00:00', 'active', '{"gender":false,"dob":false,"country":false}', '{"title":"Recuirtment web developer react","description":"bla bla bla"}', '{"profile_image":"yes","resume":"yes","cover_letter":"no","terms_and_conditions":"yes"}', '2022-07-29 17:26:05', '2022-07-29 17:26:05');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_applications
DROP TABLE IF EXISTS `job_applications`;
CREATE TABLE IF NOT EXISTS `job_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `column_priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_applications_job_id_foreign` (`job_id`),
  KEY `job_applications_status_id_foreign` (`status_id`),
  CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_applications_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `application_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_applications: ~0 rows (approximately)
/*!40000 ALTER TABLE `job_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_applications` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_application_answers
DROP TABLE IF EXISTS `job_application_answers`;
CREATE TABLE IF NOT EXISTS `job_application_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_application_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_application_answers_job_application_id_foreign` (`job_application_id`),
  KEY `job_application_answers_job_id_foreign` (`job_id`),
  KEY `job_application_answers_question_id_foreign` (`question_id`),
  CONSTRAINT `job_application_answers_job_application_id_foreign` FOREIGN KEY (`job_application_id`) REFERENCES `job_applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_application_answers_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_application_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_application_answers: ~0 rows (approximately)
/*!40000 ALTER TABLE `job_application_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_application_answers` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_categories
DROP TABLE IF EXISTS `job_categories`;
CREATE TABLE IF NOT EXISTS `job_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_categories: ~1 rows (approximately)
/*!40000 ALTER TABLE `job_categories` DISABLE KEYS */;
INSERT INTO `job_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Web Developer', '2022-07-29 17:24:40', '2022-07-29 17:24:40');
/*!40000 ALTER TABLE `job_categories` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_job_application
DROP TABLE IF EXISTS `job_job_application`;
CREATE TABLE IF NOT EXISTS `job_job_application` (
  `job_application_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  KEY `job_job_application_job_application_id_foreign` (`job_application_id`),
  KEY `job_job_application_job_id_foreign` (`job_id`),
  CONSTRAINT `job_job_application_job_application_id_foreign` FOREIGN KEY (`job_application_id`) REFERENCES `job_applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_job_application_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_job_application: ~0 rows (approximately)
/*!40000 ALTER TABLE `job_job_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_job_application` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_locations
DROP TABLE IF EXISTS `job_locations`;
CREATE TABLE IF NOT EXISTS `job_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_locations_country_id_foreign` (`country_id`),
  CONSTRAINT `job_locations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_locations: ~2 rows (approximately)
/*!40000 ALTER TABLE `job_locations` DISABLE KEYS */;
INSERT INTO `job_locations` (`id`, `location`, `country_id`, `created_at`, `updated_at`) VALUES
	(1, 'Surabaya', 101, '2022-07-29 17:24:17', '2022-07-29 17:24:17'),
	(2, 'Mojokerto', 101, '2022-07-29 17:24:17', '2022-07-29 17:24:17');
/*!40000 ALTER TABLE `job_locations` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_questions
DROP TABLE IF EXISTS `job_questions`;
CREATE TABLE IF NOT EXISTS `job_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_questions_question_id_foreign` (`question_id`),
  KEY `job_questions_job_id_foreign` (`job_id`),
  CONSTRAINT `job_questions_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_questions: ~0 rows (approximately)
/*!40000 ALTER TABLE `job_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_questions` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.job_skills
DROP TABLE IF EXISTS `job_skills`;
CREATE TABLE IF NOT EXISTS `job_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_skills_skill_id_foreign` (`skill_id`),
  KEY `job_skills_job_id_foreign` (`job_id`),
  CONSTRAINT `job_skills_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `job_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.job_skills: ~0 rows (approximately)
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.language_settings
DROP TABLE IF EXISTS `language_settings`;
CREATE TABLE IF NOT EXISTS `language_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.language_settings: ~18 rows (approximately)
/*!40000 ALTER TABLE `language_settings` DISABLE KEYS */;
INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'ar', 'Arabic', 'disabled', NULL, NULL),
	(2, 'de', 'German', 'disabled', NULL, NULL),
	(3, 'es', 'Spanish', 'enabled', NULL, NULL),
	(4, 'et', 'Estonian', 'disabled', NULL, NULL),
	(5, 'fa', 'Farsi', 'disabled', NULL, NULL),
	(6, 'fr', 'French', 'enabled', NULL, NULL),
	(7, 'gr', 'Greek', 'disabled', NULL, NULL),
	(8, 'it', 'Italian', 'disabled', NULL, NULL),
	(9, 'nl', 'Dutch', 'disabled', NULL, NULL),
	(10, 'pl', 'Polish', 'disabled', NULL, NULL),
	(11, 'pt', 'Portuguese', 'disabled', NULL, NULL),
	(12, 'pt-br', 'Portuguese (Brazil)', 'disabled', NULL, NULL),
	(13, 'ro', 'Romanian', 'disabled', NULL, NULL),
	(14, 'ru', 'Russian', 'enabled', NULL, NULL),
	(15, 'tr', 'Turkish', 'disabled', NULL, NULL),
	(16, 'zh-CN', 'Chinese (S)', 'disabled', NULL, NULL),
	(17, 'zh-TW', 'Chinese (T)', 'disabled', NULL, NULL),
	(18, 'en', 'English', 'enabled', '2022-07-29 16:58:47', '2022-07-29 16:58:47');
/*!40000 ALTER TABLE `language_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.linked_in_settings
DROP TABLE IF EXISTS `linked_in_settings`;
CREATE TABLE IF NOT EXISTS `linked_in_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `callback_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.linked_in_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `linked_in_settings` DISABLE KEYS */;
INSERT INTO `linked_in_settings` (`id`, `client_id`, `client_secret`, `status`, `callback_url`, `created_at`, `updated_at`) VALUES
	(1, '', '', 'disable', '', '2022-07-29 16:58:47', '2022-07-29 16:58:47');
/*!40000 ALTER TABLE `linked_in_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.ltm_translations
DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE IF NOT EXISTS `ltm_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.ltm_translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.migrations: ~77 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_04_02_193005_create_translations_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2018_06_03_132522_create_job_categories_table', 1),
	(5, '2018_06_04_152857_create_skills_table', 1),
	(6, '2018_06_04_154802_create_countries_table', 1),
	(7, '2018_06_04_155025_create_job_location_table', 1),
	(8, '2018_06_04_162742_create_company_settings_table', 1),
	(9, '2018_06_04_171244_create_jobs_table', 1),
	(10, '2018_06_04_172111_create_job_skills_table', 1),
	(11, '2018_06_04_174729_create_application_status_table', 1),
	(12, '2018_06_04_174936_create_job_applications_table', 1),
	(13, '2018_06_05_165900_create_tasks_table', 1),
	(14, '2018_06_28_191256_create_language_settings_table', 1),
	(15, '2018_07_03_054511_entrust_setup_tables', 1),
	(16, '2018_07_08_103701_create_modules_table', 1),
	(17, '2018_07_09_071111_add_permissions', 1),
	(18, '2018_07_11_070438_add_skills_permissions', 1),
	(19, '2018_07_11_084527_add_locations_permissions', 1),
	(20, '2018_07_11_102717_add_jobs_permissions', 1),
	(21, '2018_07_12_190134_add_slug_column_jobs_table', 1),
	(22, '2018_07_13_190220_add_job_application_permission', 1),
	(23, '2018_07_16_120833_add_column_priority_column_job_applications', 1),
	(24, '2018_07_17_053002_add_image_column_users_table', 1),
	(25, '2018_07_17_061732_add_team_permission', 1),
	(26, '2018_07_17_113611_create_theme_settings_table', 1),
	(27, '2018_07_19_064526_create_notifications_table', 1),
	(28, '2018_09_11_195258_fix_user_roles', 1),
	(29, '2018_10_12_120216_create_smtp_settings_table', 1),
	(30, '2018_10_15_120216_create_questions_table', 1),
	(31, '2018_10_15_130216_create_job_questions_table', 1),
	(32, '2018_10_15_140216_create_job_question_answer_table', 1),
	(33, '2018_10_15_261732_add_question_permission', 1),
	(34, '2018_10_17_051239_alter_smtp_setting_table', 1),
	(35, '2018_10_29_140216_create_interview_schedule_table', 1),
	(36, '2018_10_31_061732_add_interview_schedule_permission', 1),
	(37, '2018_11_01_140216_create_schedule_employee_table', 1),
	(38, '2018_12_08_051239_alter_interview_schedule_table', 1),
	(39, '2018_12_08_840216_create_schedule_comment_table', 1),
	(40, '2018_12_13_104131_change_cover_letter_column_nullable_job_applications_table', 1),
	(41, '2018_12_14_251239_alter_job_application_table', 1),
	(42, '2018_12_21_251239_alter_job_application_rating_table', 1),
	(43, '2019_03_14_113901_create_companies_table', 1),
	(44, '2019_03_14_114823_add_company_id_column', 1),
	(45, '2019_03_14_115620_add_company_permissions', 1),
	(46, '2019_03_14_131217_add_status_column_companies_table', 1),
	(47, '2019_03_16_061717_add_show_in_frontend_column_companies_table', 1),
	(48, '2019_08_13_073129_update_settings_add_envato_key', 1),
	(49, '2019_08_13_073129_update_settings_add_support_key', 1),
	(50, '2019_08_28_081847_update_smtp_setting_verified', 1),
	(51, '2019_09_16_081847_add_image_theme_setting_table', 1),
	(52, '2019_10_03_061505_create_sticky_notes_table', 1),
	(53, '2019_11_05_061546_create_new_job_email_status_table', 1),
	(54, '2019_11_06_055738_create_sms_settings_table', 1),
	(55, '2019_11_06_055900_add_mobile_related_columns_in_users_table', 1),
	(56, '2019_11_12_044756_create_linked_in_settings_table', 1),
	(57, '2019_11_12_044955_add_linkedin_columns_to_companies_table', 1),
	(58, '2019_11_12_054145_add_system_update_column_in_company_settings_table', 1),
	(59, '2019_11_20_0974848_create_departments_table', 1),
	(60, '2019_11_20_1074848_create_designation_table', 1),
	(61, '2019_11_20_1174848_create_onboard_details_table', 1),
	(62, '2019_11_20_1274848_create_onboard_files_table', 1),
	(63, '2019_12_01_060100_create_applicant_notes_table', 1),
	(64, '2019_12_02_115133_alter_onboard_status_table', 1),
	(65, '2019_12_10_110039_create_footer_settings_table', 1),
	(66, '2019_12_23_081452_create_todo_items_table', 1),
	(67, '2020_01_07_060649_add_gender_age_country_city_columns_to_job_applications_table', 1),
	(68, '2020_01_07_060725_add_required_columns_column_in_jobs_table', 1),
	(69, '2020_01_08_044909_add_english_row_in_language_settings_table', 1),
	(70, '2020_01_09_110009_add_skills_column_in_job_applications_table', 1),
	(71, '2020_01_29_092642_create_application_settings_table', 1),
	(72, '2020_02_01_101914_update_settings_review', 1),
	(73, '2020_04_16_043747_add_mail_setting_column_in_application_settings_table', 1),
	(74, '2020_04_22_041412_add_meta_details_and_section_visibility_columns_in_jobs_table', 1),
	(75, '2020_04_22_065801_remove_profile_image_show_column_from_application_settings_table', 1),
	(76, '2020_04_24_045232_create_documents_table', 1),
	(77, '2020_05_19_083936_add_position_and_color_columns_in_application_status_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.modules
DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.modules: ~10 rows (approximately)
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `module_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'job categories', '', NULL, NULL),
	(2, 'job skills', '', NULL, NULL),
	(3, 'job applications', '', NULL, NULL),
	(4, 'job locations', '', NULL, NULL),
	(6, 'jobs', '', NULL, NULL),
	(7, 'settings', '', NULL, NULL),
	(8, 'team', '', NULL, NULL),
	(9, 'question', '', NULL, NULL),
	(10, 'schedule', '', '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(11, 'company', '', NULL, NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.notifications
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.on_board_details
DROP TABLE IF EXISTS `on_board_details`;
CREATE TABLE IF NOT EXISTS `on_board_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_application_id` int(10) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `reports_to_id` int(10) unsigned DEFAULT NULL,
  `salary_offered` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `accept_last_date` date NOT NULL,
  `offer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reject_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hired_status` enum('offered','accepted','rejected','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_status` enum('part_time','full_time','on_contract') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `on_board_details_job_application_id_foreign` (`job_application_id`),
  KEY `on_board_details_designation_id_foreign` (`designation_id`),
  KEY `on_board_details_department_id_foreign` (`department_id`),
  KEY `on_board_details_reports_to_id_foreign` (`reports_to_id`),
  CONSTRAINT `on_board_details_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `on_board_details_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `on_board_details_job_application_id_foreign` FOREIGN KEY (`job_application_id`) REFERENCES `job_applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `on_board_details_reports_to_id_foreign` FOREIGN KEY (`reports_to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.on_board_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `on_board_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_board_details` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.on_board_files
DROP TABLE IF EXISTS `on_board_files`;
CREATE TABLE IF NOT EXISTS `on_board_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `on_board_detail_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `on_board_files_on_board_detail_id_foreign` (`on_board_detail_id`),
  CONSTRAINT `on_board_files_on_board_detail_id_foreign` FOREIGN KEY (`on_board_detail_id`) REFERENCES `on_board_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.on_board_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `on_board_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_board_files` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`),
  KEY `permissions_module_id_foreign` (`module_id`),
  CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.permissions: ~37 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_id`, `created_at`, `updated_at`) VALUES
	(1, 'add_category', 'Add Category', NULL, 1, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(2, 'view_category', 'View Category', NULL, 1, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(3, 'edit_category', 'Edit Category', NULL, 1, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(4, 'delete_category', 'Delete Category', NULL, 1, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(5, 'manage_settings', 'Manage Settings', NULL, 7, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(6, 'add_skills', 'Add Skills', NULL, 2, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(7, 'view_skills', 'View Skills', NULL, 2, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(8, 'edit_skills', 'Edit Skills', NULL, 2, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(9, 'delete_skills', 'Delete Skills', NULL, 2, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(10, 'add_locations', 'Add Location', NULL, 4, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(11, 'view_locations', 'View Location', NULL, 4, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(12, 'edit_locations', 'Edit Location', NULL, 4, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(13, 'delete_locations', 'Delete Location', NULL, 4, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(14, 'add_jobs', 'Add Jobs', NULL, 6, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(15, 'view_jobs', 'View Jobs', NULL, 6, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(16, 'edit_jobs', 'Edit Jobs', NULL, 6, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(17, 'delete_jobs', 'Delete Jobs', NULL, 6, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(18, 'add_job_applications', 'Add Job Applications', NULL, 3, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(19, 'view_job_applications', 'View Job Applications', NULL, 3, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(20, 'edit_job_applications', 'Edit Job Applications', NULL, 3, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(21, 'delete_job_applications', 'Delete Job Applications', NULL, 3, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(22, 'add_team', 'Add Team', NULL, 8, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(23, 'view_team', 'View Team', NULL, 8, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(24, 'edit_team', 'Edit Team', NULL, 8, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(25, 'delete_team', 'Delete Team', NULL, 8, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(26, 'add_question', 'Add Question', NULL, 9, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(27, 'view_question', 'View Question', NULL, 9, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(28, 'edit_question', 'Edit Question', NULL, 9, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(29, 'delete_question', 'Delete Question', NULL, 9, '2022-07-29 16:58:40', '2022-07-29 16:58:40'),
	(30, 'add_schedule', 'Add Schedule', NULL, 10, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(31, 'view_schedule', 'View Schedule', NULL, 10, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(32, 'edit_schedule', 'Edit Schedule', NULL, 10, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(33, 'delete_schedule', 'Delete Schedule', NULL, 10, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(34, 'add_company', 'Add Company', NULL, 11, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(35, 'view_company', 'View Company', NULL, 11, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(36, 'edit_company', 'Edit Company', NULL, 11, '2022-07-29 16:58:41', '2022-07-29 16:58:41'),
	(37, 'delete_company', 'Delete Company', NULL, 11, '2022-07-29 16:58:41', '2022-07-29 16:58:41');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.permission_role: ~37 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `required` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.questions: ~0 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2022-07-29 16:58:40', '2022-07-29 16:58:40');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.role_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.skills
DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skills_category_id_foreign` (`category_id`),
  CONSTRAINT `skills_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.skills: ~0 rows (approximately)
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.sms_settings
DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE IF NOT EXISTS `sms_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nexmo_status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `nexmo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nexmo_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nexmo_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'NEXMO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.sms_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `sms_settings` DISABLE KEYS */;
INSERT INTO `sms_settings` (`id`, `nexmo_status`, `nexmo_key`, `nexmo_secret`, `nexmo_from`, `created_at`, `updated_at`) VALUES
	(1, 'deactive', NULL, NULL, 'NEXMO', '2022-07-29 16:58:46', '2022-07-29 16:58:46');
/*!40000 ALTER TABLE `sms_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.smtp_settings
DROP TABLE IF EXISTS `smtp_settings`;
CREATE TABLE IF NOT EXISTS `smtp_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp',
  `mail_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'smtp.gmail.com',
  `mail_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '587',
  `mail_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'youremail@gmail.com',
  `mail_password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'your password',
  `mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Recruit',
  `mail_from_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin@example.com',
  `mail_encryption` enum('tls','ssl') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.smtp_settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `smtp_settings` DISABLE KEYS */;
INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `created_at`, `updated_at`, `verified`) VALUES
	(1, 'smtp', 'smtp.gmail.com', '465', 'dummy.smtp1927@gmail.com', 'fmohrmnydvcpzbjq', 'Recruit', 'admin@example.com', 'ssl', '2022-07-29 16:58:40', '2022-07-29 17:09:54', 1);
/*!40000 ALTER TABLE `smtp_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.sticky_notes
DROP TABLE IF EXISTS `sticky_notes`;
CREATE TABLE IF NOT EXISTS `sticky_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `note_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `colour` enum('blue','yellow','red','gray','purple','green') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sticky_notes_user_id_foreign` (`user_id`),
  CONSTRAINT `sticky_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.sticky_notes: ~0 rows (approximately)
/*!40000 ALTER TABLE `sticky_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sticky_notes` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.tasks
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.tasks: ~0 rows (approximately)
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.theme_settings
DROP TABLE IF EXISTS `theme_settings`;
CREATE TABLE IF NOT EXISTS `theme_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `primary_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_custom_css` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `front_custom_css` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_sub_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.theme_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `theme_settings` DISABLE KEYS */;
INSERT INTO `theme_settings` (`id`, `primary_color`, `admin_custom_css`, `front_custom_css`, `home_background_image`, `welcome_title`, `welcome_sub_title`, `created_at`, `updated_at`) VALUES
	(1, '#1579d0', NULL, NULL, NULL, NULL, NULL, '2022-07-29 16:58:40', '2022-07-29 16:58:40');
/*!40000 ALTER TABLE `theme_settings` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.todo_items
DROP TABLE IF EXISTS `todo_items`;
CREATE TABLE IF NOT EXISTS `todo_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todo_items_user_id_foreign` (`user_id`),
  CONSTRAINT `todo_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.todo_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `todo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo_items` ENABLE KEYS */;

-- Dumping structure for table new_loker_apps.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calling_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table new_loker_apps.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `calling_code`, `mobile`, `mobile_verified`, `password`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
	(1, 'Admin', 'admin@admin.com', '+62', '895123123132', 0, '$2y$10$hC7OuWXBLDP9cqt4qTXwcedl4F4T9GHS0ACsH/xc1Fv4CSa1BTWXK', NULL, '2022-07-29 16:58:48', '2022-07-29 17:12:56', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
