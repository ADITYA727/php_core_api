-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 16, 2020 at 10:51 AM
-- Server version: 5.7.29
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
-- Database: `eighteen_KVTDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `kvt_adminpermission`
--

CREATE TABLE `kvt_adminpermission` (
  `permissionID` int(11) NOT NULL,
  `permissionValue` varchar(100) NOT NULL,
  `viewOrder` int(11) NOT NULL,
  `viewInvoice` int(11) NOT NULL,
  `viewShipment` int(11) NOT NULL,
  `manageProduct` int(11) NOT NULL,
  `manageCategory` int(11) NOT NULL,
  `manageAttribute` int(11) NOT NULL,
  `manageCustomer` int(11) NOT NULL,
  `managePromotion` int(11) NOT NULL,
  `manageCMSPages` int(11) NOT NULL,
  `manageTestimonials` int(11) NOT NULL,
  `manageUsers` int(11) NOT NULL,
  `managePermission` int(11) NOT NULL,
  `manageBanner` int(11) NOT NULL DEFAULT '0',
  `manageReport` int(11) NOT NULL DEFAULT '0',
  `bulkImport` int(11) NOT NULL DEFAULT '0',
  `manageJobPost` int(11) NOT NULL DEFAULT '0',
  `updatedBy` varchar(255) NOT NULL,
  `updatedOn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_admins`
--

CREATE TABLE `kvt_admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `loginType` varchar(50) NOT NULL,
  `lastLogin` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kvt_admins`
--

INSERT INTO `kvt_admins` (`id`, `email`, `password`, `firstname`, `lastname`, `phone`, `address`, `city`, `state`, `zip`, `country`, `status`, `loginType`, `lastLogin`) VALUES
(1, 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Admin', 'admin', '+910000000000', '18Pixels India PVT LTD', 'Lucknow', 'Uttar Pradesh', '226001', 'India', 'Y', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kvt_bookings`
--

CREATE TABLE `kvt_bookings` (
  `id` int(11) NOT NULL,
  `booking_id` int(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shastri_id` int(11) NOT NULL,
  `pooja_id` int(11) NOT NULL,
  `booking_start_datetime` varchar(100) NOT NULL,
  `booking_end_datetime` varchar(100) NOT NULL,
  `poojatimeslot` varchar(100) DEFAULT NULL,
  `booking_status` enum('0','1','2','3') NOT NULL COMMENT '1 => pending, 2 => confirmed, 3 => cancel  ,4 => reschedule',
  `meeting_link` varchar(100) NOT NULL,
  `assignedBy` varchar(100) NOT NULL,
  `completedBy` varchar(100) NOT NULL,
  `reschedule_status` enum('0','1','2') NOT NULL COMMENT '0 => pending , 1 =>confirmed, 2 => cancel',
  `rescheduleBy` varchar(100) NOT NULL,
  `lastmodified` varchar(100) NOT NULL,
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_cart`
--

CREATE TABLE `kvt_cart` (
  `cartID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSKU` varchar(50) NOT NULL,
  `productName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_categories`
--

CREATE TABLE `kvt_categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_url` varchar(255) NOT NULL,
  `cat_status` varchar(10) NOT NULL,
  `cat_addedOn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kvt_categories`
--

INSERT INTO `kvt_categories` (`id`, `cat_name`, `cat_url`, `cat_status`, `cat_addedOn`) VALUES
(1, '2 Mukhi Rudraksh', '', 'Y', '1583128122'),
(2, 'Brass Idols Maa Annapurna Devi', '', 'Y', '1583128389');

-- --------------------------------------------------------

--
-- Table structure for table `kvt_countries`
--

CREATE TABLE `kvt_countries` (
  `id` int(11) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `countryStatus` int(11) NOT NULL DEFAULT '1' COMMENT '0=In-Active,1=Active',
  `setOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kvt_countries`
--

INSERT INTO `kvt_countries` (`id`, `sortname`, `name`, `phonecode`, `countryStatus`, `setOrder`) VALUES
(1, 'AF', 'Afghanistan', 93, 1, 2),
(2, 'AL', 'Albania', 355, 1, 3),
(3, 'DZ', 'Algeria', 213, 1, 4),
(4, 'AS', 'American Samoa', 1684, 1, 5),
(5, 'AD', 'Andorra', 376, 1, 6),
(6, 'AO', 'Angola', 244, 1, 7),
(7, 'AI', 'Anguilla', 1264, 1, 8),
(8, 'AQ', 'Antarctica', 0, 1, 9),
(9, 'AG', 'Antigua And Barbuda', 1268, 1, 10),
(10, 'AR', 'Argentina', 54, 1, 11),
(11, 'AM', 'Armenia', 374, 1, 12),
(12, 'AW', 'Aruba', 297, 1, 13),
(13, 'AU', 'Australia', 61, 1, 14),
(14, 'AT', 'Austria', 43, 1, 15),
(15, 'AZ', 'Azerbaijan', 994, 1, 16),
(16, 'BS', 'Bahamas The', 1242, 1, 17),
(17, 'BH', 'Bahrain', 973, 1, 18),
(18, 'BD', 'Bangladesh', 880, 1, 19),
(19, 'BB', 'Barbados', 1246, 1, 20),
(20, 'BY', 'Belarus', 375, 1, 21),
(21, 'BE', 'Belgium', 32, 1, 22),
(22, 'BZ', 'Belize', 501, 1, 23),
(23, 'BJ', 'Benin', 229, 1, 24),
(24, 'BM', 'Bermuda', 1441, 1, 25),
(25, 'BT', 'Bhutan', 975, 1, 26),
(26, 'BO', 'Bolivia', 591, 1, 27),
(27, 'BA', 'Bosnia and Herzegovina', 387, 1, 28),
(28, 'BW', 'Botswana', 267, 1, 29),
(29, 'BV', 'Bouvet Island', 0, 1, 30),
(30, 'BR', 'Brazil', 55, 1, 31),
(31, 'IO', 'British Indian Ocean Territory', 246, 1, 32),
(32, 'BN', 'Brunei', 673, 1, 33),
(33, 'BG', 'Bulgaria', 359, 1, 34),
(34, 'BF', 'Burkina Faso', 226, 1, 35),
(35, 'BI', 'Burundi', 257, 1, 36),
(36, 'KH', 'Cambodia', 855, 1, 37),
(37, 'CM', 'Cameroon', 237, 1, 38),
(38, 'CA', 'Canada', 1, 1, 39),
(39, 'CV', 'Cape Verde', 238, 1, 40),
(40, 'KY', 'Cayman Islands', 1345, 1, 41),
(41, 'CF', 'Central African Republic', 236, 1, 42),
(42, 'TD', 'Chad', 235, 1, 43),
(43, 'CL', 'Chile', 56, 1, 44),
(44, 'CN', 'China', 86, 1, 45),
(45, 'CX', 'Christmas Island', 61, 1, 46),
(46, 'CC', 'Cocos (Keeling) Islands', 672, 1, 47),
(47, 'CO', 'Colombia', 57, 1, 48),
(48, 'KM', 'Comoros', 269, 1, 49),
(49, 'CG', 'Republic Of The Congo', 242, 1, 50),
(50, 'CD', 'Democratic Republic Of The Congo', 242, 1, 51),
(51, 'CK', 'Cook Islands', 682, 1, 52),
(52, 'CR', 'Costa Rica', 506, 1, 53),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 1, 54),
(54, 'HR', 'Croatia (Hrvatska)', 385, 1, 55),
(55, 'CU', 'Cuba', 53, 1, 56),
(56, 'CY', 'Cyprus', 357, 1, 57),
(57, 'CZ', 'Czech Republic', 420, 1, 58),
(58, 'DK', 'Denmark', 45, 1, 59),
(59, 'DJ', 'Djibouti', 253, 1, 60),
(60, 'DM', 'Dominica', 1767, 1, 61),
(61, 'DO', 'Dominican Republic', 1809, 1, 62),
(62, 'TP', 'East Timor', 670, 1, 63),
(63, 'EC', 'Ecuador', 593, 1, 64),
(64, 'EG', 'Egypt', 20, 1, 65),
(65, 'SV', 'El Salvador', 503, 1, 66),
(66, 'GQ', 'Equatorial Guinea', 240, 1, 67),
(67, 'ER', 'Eritrea', 291, 1, 68),
(68, 'EE', 'Estonia', 372, 1, 69),
(69, 'ET', 'Ethiopia', 251, 1, 70),
(70, 'XA', 'External Territories of Australia', 61, 1, 71),
(71, 'FK', 'Falkland Islands', 500, 1, 72),
(72, 'FO', 'Faroe Islands', 298, 1, 73),
(73, 'FJ', 'Fiji Islands', 679, 1, 74),
(74, 'FI', 'Finland', 358, 1, 75),
(75, 'FR', 'France', 33, 1, 76),
(76, 'GF', 'French Guiana', 594, 1, 77),
(77, 'PF', 'French Polynesia', 689, 1, 78),
(78, 'TF', 'French Southern Territories', 0, 1, 79),
(79, 'GA', 'Gabon', 241, 1, 80),
(80, 'GM', 'Gambia The', 220, 1, 81),
(81, 'GE', 'Georgia', 995, 1, 82),
(82, 'DE', 'Germany', 49, 1, 83),
(83, 'GH', 'Ghana', 233, 1, 84),
(84, 'GI', 'Gibraltar', 350, 1, 85),
(85, 'GR', 'Greece', 30, 1, 86),
(86, 'GL', 'Greenland', 299, 1, 87),
(87, 'GD', 'Grenada', 1473, 1, 88),
(88, 'GP', 'Guadeloupe', 590, 1, 89),
(89, 'GU', 'Guam', 1671, 1, 90),
(90, 'GT', 'Guatemala', 502, 1, 91),
(91, 'XU', 'Guernsey and Alderney', 44, 1, 92),
(92, 'GN', 'Guinea', 224, 1, 93),
(93, 'GW', 'Guinea-Bissau', 245, 1, 94),
(94, 'GY', 'Guyana', 592, 1, 95),
(95, 'HT', 'Haiti', 509, 1, 96),
(96, 'HM', 'Heard and McDonald Islands', 0, 1, 97),
(97, 'HN', 'Honduras', 504, 1, 98),
(98, 'HK', 'Hong Kong S.A.R.', 852, 1, 99),
(99, 'HU', 'Hungary', 36, 1, 100),
(100, 'IS', 'Iceland', 354, 1, 101),
(101, 'IN', 'India', 91, 1, 1),
(102, 'ID', 'Indonesia', 62, 1, 102),
(103, 'IR', 'Iran', 98, 1, 103),
(104, 'IQ', 'Iraq', 964, 1, 104),
(105, 'IE', 'Ireland', 353, 1, 105),
(106, 'IL', 'Israel', 972, 1, 106),
(107, 'IT', 'Italy', 39, 1, 107),
(108, 'JM', 'Jamaica', 1876, 1, 108),
(109, 'JP', 'Japan', 81, 1, 109),
(110, 'XJ', 'Jersey', 44, 1, 110),
(111, 'JO', 'Jordan', 962, 1, 111),
(112, 'KZ', 'Kazakhstan', 7, 1, 112),
(113, 'KE', 'Kenya', 254, 1, 113),
(114, 'KI', 'Kiribati', 686, 1, 114),
(115, 'KP', 'Korea North', 850, 1, 115),
(116, 'KR', 'Korea South', 82, 1, 116),
(117, 'KW', 'Kuwait', 965, 1, 117),
(118, 'KG', 'Kyrgyzstan', 996, 1, 118),
(119, 'LA', 'Laos', 856, 1, 119),
(120, 'LV', 'Latvia', 371, 1, 120),
(121, 'LB', 'Lebanon', 961, 1, 121),
(122, 'LS', 'Lesotho', 266, 1, 122),
(123, 'LR', 'Liberia', 231, 1, 123),
(124, 'LY', 'Libya', 218, 1, 124),
(125, 'LI', 'Liechtenstein', 423, 1, 125),
(126, 'LT', 'Lithuania', 370, 1, 126),
(127, 'LU', 'Luxembourg', 352, 1, 127),
(128, 'MO', 'Macau S.A.R.', 853, 1, 128),
(129, 'MK', 'Macedonia', 389, 1, 129),
(130, 'MG', 'Madagascar', 261, 1, 130),
(131, 'MW', 'Malawi', 265, 1, 131),
(132, 'MY', 'Malaysia', 60, 1, 132),
(133, 'MV', 'Maldives', 960, 1, 133),
(134, 'ML', 'Mali', 223, 1, 134),
(135, 'MT', 'Malta', 356, 1, 135),
(136, 'XM', 'Man (Isle of)', 44, 1, 136),
(137, 'MH', 'Marshall Islands', 692, 1, 137),
(138, 'MQ', 'Martinique', 596, 1, 138),
(139, 'MR', 'Mauritania', 222, 1, 139),
(140, 'MU', 'Mauritius', 230, 1, 140),
(141, 'YT', 'Mayotte', 269, 1, 141),
(142, 'MX', 'Mexico', 52, 1, 142),
(143, 'FM', 'Micronesia', 691, 1, 143),
(144, 'MD', 'Moldova', 373, 1, 144),
(145, 'MC', 'Monaco', 377, 1, 145),
(146, 'MN', 'Mongolia', 976, 1, 146),
(147, 'MS', 'Montserrat', 1664, 1, 147),
(148, 'MA', 'Morocco', 212, 1, 148),
(149, 'MZ', 'Mozambique', 258, 1, 149),
(150, 'MM', 'Myanmar', 95, 1, 150),
(151, 'NA', 'Namibia', 264, 1, 151),
(152, 'NR', 'Nauru', 674, 1, 152),
(153, 'NP', 'Nepal', 977, 1, 153),
(154, 'AN', 'Netherlands Antilles', 599, 1, 154),
(155, 'NL', 'Netherlands The', 31, 1, 155),
(156, 'NC', 'New Caledonia', 687, 1, 156),
(157, 'NZ', 'New Zealand', 64, 1, 157),
(158, 'NI', 'Nicaragua', 505, 1, 158),
(159, 'NE', 'Niger', 227, 1, 159),
(160, 'NG', 'Nigeria', 234, 1, 160),
(161, 'NU', 'Niue', 683, 1, 161),
(162, 'NF', 'Norfolk Island', 672, 1, 162),
(163, 'MP', 'Northern Mariana Islands', 1670, 1, 163),
(164, 'NO', 'Norway', 47, 1, 164),
(165, 'OM', 'Oman', 968, 1, 165),
(166, 'PK', 'Pakistan', 92, 1, 166),
(167, 'PW', 'Palau', 680, 1, 167),
(168, 'PS', 'Palestinian Territory Occupied', 970, 1, 168),
(169, 'PA', 'Panama', 507, 1, 169),
(170, 'PG', 'Papua new Guinea', 675, 1, 170),
(171, 'PY', 'Paraguay', 595, 1, 171),
(172, 'PE', 'Peru', 51, 1, 172),
(173, 'PH', 'Philippines', 63, 1, 173),
(174, 'PN', 'Pitcairn Island', 0, 1, 174),
(175, 'PL', 'Poland', 48, 1, 175),
(176, 'PT', 'Portugal', 351, 1, 176),
(177, 'PR', 'Puerto Rico', 1787, 1, 177),
(178, 'QA', 'Qatar', 974, 1, 178),
(179, 'RE', 'Reunion', 262, 1, 179),
(180, 'RO', 'Romania', 40, 1, 180),
(181, 'RU', 'Russia', 70, 1, 181),
(182, 'RW', 'Rwanda', 250, 1, 182),
(183, 'SH', 'Saint Helena', 290, 1, 183),
(184, 'KN', 'Saint Kitts And Nevis', 1869, 1, 184),
(185, 'LC', 'Saint Lucia', 1758, 1, 185),
(186, 'PM', 'Saint Pierre and Miquelon', 508, 1, 186),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784, 1, 187),
(188, 'WS', 'Samoa', 684, 1, 188),
(189, 'SM', 'San Marino', 378, 1, 189),
(190, 'ST', 'Sao Tome and Principe', 239, 1, 190),
(191, 'SA', 'Saudi Arabia', 966, 1, 191),
(192, 'SN', 'Senegal', 221, 1, 192),
(193, 'RS', 'Serbia', 381, 1, 193),
(194, 'SC', 'Seychelles', 248, 1, 194),
(195, 'SL', 'Sierra Leone', 232, 1, 195),
(196, 'SG', 'Singapore', 65, 1, 196),
(197, 'SK', 'Slovakia', 421, 1, 197),
(198, 'SI', 'Slovenia', 386, 1, 198),
(199, 'XG', 'Smaller Territories of the UK', 44, 1, 199),
(200, 'SB', 'Solomon Islands', 677, 1, 200),
(201, 'SO', 'Somalia', 252, 1, 201),
(202, 'ZA', 'South Africa', 27, 1, 202),
(203, 'GS', 'South Georgia', 0, 1, 203),
(204, 'SS', 'South Sudan', 211, 1, 204),
(205, 'ES', 'Spain', 34, 1, 205),
(206, 'LK', 'Sri Lanka', 94, 1, 206),
(207, 'SD', 'Sudan', 249, 1, 207),
(208, 'SR', 'Suriname', 597, 1, 208),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 1, 209),
(210, 'SZ', 'Swaziland', 268, 1, 210),
(211, 'SE', 'Sweden', 46, 1, 211),
(212, 'CH', 'Switzerland', 41, 1, 212),
(213, 'SY', 'Syria', 963, 1, 213),
(214, 'TW', 'Taiwan', 886, 1, 214),
(215, 'TJ', 'Tajikistan', 992, 1, 215),
(216, 'TZ', 'Tanzania', 255, 1, 216),
(217, 'TH', 'Thailand', 66, 1, 217),
(218, 'TG', 'Togo', 228, 1, 218),
(219, 'TK', 'Tokelau', 690, 1, 219),
(220, 'TO', 'Tonga', 676, 1, 220),
(221, 'TT', 'Trinidad And Tobago', 1868, 1, 221),
(222, 'TN', 'Tunisia', 216, 1, 222),
(223, 'TR', 'Turkey', 90, 1, 223),
(224, 'TM', 'Turkmenistan', 7370, 1, 224),
(225, 'TC', 'Turks And Caicos Islands', 1649, 1, 225),
(226, 'TV', 'Tuvalu', 688, 1, 226),
(227, 'UG', 'Uganda', 256, 1, 227),
(228, 'UA', 'Ukraine', 380, 1, 228),
(229, 'AE', 'United Arab Emirates', 971, 1, 229),
(230, 'GB', 'United Kingdom', 44, 1, 230),
(231, 'US', 'United States', 1, 1, 231),
(232, 'UM', 'United States Minor Outlying Islands', 1, 1, 232),
(233, 'UY', 'Uruguay', 598, 1, 233),
(234, 'UZ', 'Uzbekistan', 998, 1, 234),
(235, 'VU', 'Vanuatu', 678, 1, 235),
(236, 'VA', 'Vatican City State (Holy See)', 39, 1, 236),
(237, 'VE', 'Venezuela', 58, 1, 237),
(238, 'VN', 'Vietnam', 84, 1, 238),
(239, 'VG', 'Virgin Islands (British)', 1284, 1, 239),
(240, 'VI', 'Virgin Islands (US)', 1340, 1, 240),
(241, 'WF', 'Wallis And Futuna Islands', 681, 1, 241),
(242, 'EH', 'Western Sahara', 212, 1, 242),
(243, 'YE', 'Yemen', 967, 1, 243),
(244, 'YU', 'Yugoslavia', 38, 1, 244),
(245, 'ZM', 'Zambia', 260, 1, 245),
(246, 'ZW', 'Zimbabwe', 263, 1, 246);

-- --------------------------------------------------------

--
-- Table structure for table `kvt_customers`
--

CREATE TABLE `kvt_customers` (
  `id` int(11) NOT NULL,
  `oauth_provider` varchar(255) DEFAULT NULL,
  `oauth_id` varchar(255) DEFAULT NULL,
  `title` varchar(11) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `normal_password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date_of_birth` varchar(100) DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `time_of_birth` varchar(100) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `LoginType` enum('1','2','3') NOT NULL COMMENT '1 => manually, 2 => facebook, 3 => Google',
  `emailStatus` enum('Y','N') DEFAULT NULL,
  `tokenCode` int(11) DEFAULT NULL,
  `addedBy` varchar(100) DEFAULT NULL,
  `registeredOn` varchar(100) DEFAULT NULL,
  `updatedOn` varchar(100) DEFAULT NULL,
  `isDeleted` enum('0','1') NOT NULL COMMENT '0 => active, 1 => deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kvt_customers`
--

INSERT INTO `kvt_customers` (`id`, `oauth_provider`, `oauth_id`, `title`, `firstname`, `lastname`, `email`, `password`, `normal_password`, `phone`, `gender`, `date_of_birth`, `place_of_birth`, `time_of_birth`, `marital_status`, `address`, `city`, `state`, `zip`, `country`, `message`, `image`, `LoginType`, `emailStatus`, `tokenCode`, `addedBy`, `registeredOn`, `updatedOn`, `isDeleted`) VALUES
(1, NULL, NULL, 'Mr', 'Prakhar', 'Shukla', 'prakhar.18pixels@gmail.com', 'c5eacd4383fb5aa58ae7919fd0cddadb46801b84', 'cef@12345', '9440987621', 'male', '24-03-2020', 'Lucknow', '01:05', 'unmarried', '170, Eldeco-1, Lucknow', NULL, NULL, '226002', 'Costa Rica', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', NULL, '1', 'N', 738562, NULL, '1583384169', '1583671844', '0'),
(2, NULL, NULL, 'Mr', 'PRAKHAR', 'SHUKLA', 'prakhar.shukla321@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '12345678', '09454940130', 'male', '30-03-2020', 'Lucknow', '03:02 pm', 'married', 'Ravi Khand,Eldeco1', NULL, NULL, '226002', 'Antarctica', 'Hello World', '202003091333344233.jpeg', '1', 'Y', 496446, NULL, '1583675079', '1583732678', '0'),
(3, NULL, NULL, NULL, 'Prakhar', 'Shukla', 'ayaz.18pixels@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'N', 795762, NULL, '1583675197', NULL, '0'),
(4, NULL, NULL, NULL, 'Ziqi', 'testing', 'ziqi@getnada.com', '7f136ff1a236788f9abb19865e004cdd46218340', 'cef@12345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '202003091302539252.jpg', '1', 'Y', 975421, NULL, '1583675725', NULL, '0'),
(5, 'google', '107485177725403376983', NULL, 'NIRAJ PRAKASH', 'SAXENA', 'saxena.niraj@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, '1583937070', NULL, '0'),
(6, 'google', '115494769603347067661', NULL, 'Siddhartha', 'Sharma', 'siddhartha.sharma0808@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, '1583937164', NULL, '0'),
(7, NULL, NULL, NULL, 'Raj', 'Yadav', 'raj.siet@gmail.com', 'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', '11111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'N', 275922, NULL, '1583939418', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `kvt_orders`
--

CREATE TABLE `kvt_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `booking_id` int(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `salutation` varchar(10) DEFAULT NULL,
  `shipping_firstname` varchar(50) DEFAULT NULL,
  `shipping_lastname` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_zip` varchar(50) DEFAULT NULL,
  `shipping_phone` varchar(50) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT NULL,
  `billing_firstname` varchar(100) DEFAULT NULL,
  `billing_lastname` varchar(100) DEFAULT NULL,
  `billing_phone` varchar(50) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `billing_country` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_pages`
--

CREATE TABLE `kvt_pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `perma_link` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_payments`
--

CREATE TABLE `kvt_payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `booking_id` varchar(11) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `payerName` varchar(50) DEFAULT NULL,
  `payerPhone` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `currencyCode` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_poja_type`
--

CREATE TABLE `kvt_poja_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title-slug` varchar(255) DEFAULT NULL,
  `excerpt` text,
  `description` text,
  `no_of_shastri` int(11) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `price_inr` varchar(100) DEFAULT NULL,
  `price_dollar` varchar(100) DEFAULT NULL,
  `status` enum('0','1') DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kvt_poja_type`
--

INSERT INTO `kvt_poja_type` (`id`, `title`, `title-slug`, `excerpt`, `description`, `no_of_shastri`, `duration`, `start_time`, `end_time`, `price_inr`, `price_dollar`, `status`, `created`, `updated`) VALUES
(1, 'Rudrabhishek', 'rudrabhishek', '', '', 5, '60', '08:00 AM', '06:00 PM', '1499', '20.27', '1', '2020-03-06 17:50:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kvt_product`
--

CREATE TABLE `kvt_product` (
  `productID` int(11) NOT NULL,
  `productType` varchar(50) NOT NULL,
  `productName` text NOT NULL,
  `productURL` text NOT NULL,
  `productSku` varchar(50) NOT NULL,
  `parentSku` varchar(50) NOT NULL,
  `hasChild` int(11) NOT NULL DEFAULT '0' COMMENT '0=>No,1=>Yes',
  `color` varchar(50) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `productfadbric` varchar(50) NOT NULL,
  `embellishments` varchar(50) NOT NULL,
  `shortDescription` text NOT NULL,
  `longDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productSpecialPrice` varchar(50) NOT NULL,
  `productSpecialPriceFrom` varchar(100) NOT NULL,
  `productSpecialPriceTo` varchar(100) NOT NULL,
  `imageType` varchar(100) NOT NULL,
  `stockAvailability` varchar(50) NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `productCategory` varchar(255) NOT NULL,
  `productSubCategory` varchar(255) NOT NULL,
  `stockStatus` varchar(100) NOT NULL,
  `isfeatured` varchar(50) NOT NULL,
  `istrending` varchar(50) NOT NULL,
  `TrendingPriority` int(11) NOT NULL DEFAULT '0',
  `isFestiveWear` varchar(50) NOT NULL DEFAULT 'No',
  `FestivePriority` int(11) NOT NULL DEFAULT '0',
  `metaTitle` text NOT NULL,
  `metaKeyWord` text NOT NULL,
  `metaDescription` text NOT NULL,
  `addedOn` varchar(100) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedOn` varchar(100) NOT NULL,
  `uniwareRequest` text NOT NULL,
  `updatedByCron` varchar(50) NOT NULL,
  `addedBy` varchar(255) NOT NULL,
  `deletedBy` varchar(255) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0' COMMENT '0= Not Deleted, 1=Deleted',
  `productViewCount` int(11) NOT NULL DEFAULT '0',
  `modalProductSize` varchar(10) NOT NULL,
  `modalHeight` varchar(10) NOT NULL,
  `modalBust` varchar(10) NOT NULL,
  `modalwaist` varchar(10) NOT NULL,
  `modalHip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_product_attributes`
--

CREATE TABLE `kvt_product_attributes` (
  `attributeID` int(11) NOT NULL,
  `attributeName` varchar(100) NOT NULL,
  `attributeCode` varchar(100) NOT NULL,
  `attributeType` varchar(100) NOT NULL,
  `attributeIsRequired` int(11) NOT NULL DEFAULT '1',
  `attributeIsActive` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_product_attribute_value`
--

CREATE TABLE `kvt_product_attribute_value` (
  `pattributeID` int(11) NOT NULL,
  `pattributeName` varchar(100) NOT NULL,
  `pattributeCode` varchar(100) NOT NULL,
  `phexaDecimalValue` varchar(12) NOT NULL,
  `pattributeType` varchar(100) NOT NULL,
  `pattributeStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_product_image`
--

CREATE TABLE `kvt_product_image` (
  `imageID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSKU` varchar(255) NOT NULL,
  `imageName` text NOT NULL,
  `thumbImageName` text NOT NULL,
  `imageLabel` text NOT NULL,
  `imageCount` int(11) NOT NULL,
  `imageStatus` int(11) NOT NULL,
  `regenStatus` int(11) NOT NULL DEFAULT '0',
  `renameStatus` int(11) NOT NULL DEFAULT '0',
  `compression` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_queries`
--

CREATE TABLE `kvt_queries` (
  `qid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_refund_request`
--

CREATE TABLE `kvt_refund_request` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `requested_on` datetime NOT NULL,
  `status` varchar(500) NOT NULL,
  `read_status` enum('U','R') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_shastri`
--

CREATE TABLE `kvt_shastri` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `lastLogin` varchar(150) NOT NULL,
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kvt_shastri`
--

INSERT INTO `kvt_shastri` (`id`, `email`, `password`, `firstname`, `lastname`, `phone`, `address`, `city`, `state`, `zip`, `country`, `status`, `lastLogin`, `addedOn`) VALUES
(1, 'ayaz@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Superadmin', 'A', '+910000000000', 'fsdfsf sdfgvdf dfbdc', 'Lucknow', 'Uttar Pradesh', '226001', 'India', 'Y', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kvt_shastri_calendar`
--

CREATE TABLE `kvt_shastri_calendar` (
  `schedule_id` int(11) NOT NULL,
  `shastri_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_subcategories`
--

CREATE TABLE `kvt_subcategories` (
  `subcatID` int(11) NOT NULL,
  `mainCatID` int(11) NOT NULL,
  `subCategoryName` varchar(255) NOT NULL,
  `subCategoryURL` varchar(255) NOT NULL,
  `subCategoryIsActive` varchar(5) NOT NULL,
  `subCatPriority` int(11) NOT NULL,
  `subCatAddedOn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kvt_support_ticket`
--

CREATE TABLE `kvt_support_ticket` (
  `id` int(11) NOT NULL,
  `generated_by_id` int(11) NOT NULL,
  `ticket_title` varchar(1000) NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('0','1','2') NOT NULL COMMENT '0 => pending, 1 => inprocess, 2 => resolve',
  `addedOn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_addons`
--

CREATE TABLE `rzvy_addons` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `rate` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `multiple_qty` enum('Y','N') NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_appointment_feedback`
--

CREATE TABLE `rzvy_appointment_feedback` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `review_datetime` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_block_off`
--

CREATE TABLE `rzvy_block_off` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `blockoff_type` enum('fullday','custom') NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_coupons`
--

CREATE TABLE `rzvy_coupons` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_type` enum('percentage','flat') NOT NULL,
  `coupon_value` double NOT NULL,
  `coupon_expiry` date NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_customer_orderinfo`
--

CREATE TABLE `rzvy_customer_orderinfo` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `c_firstname` varchar(255) NOT NULL,
  `c_lastname` varchar(255) NOT NULL,
  `c_email` varchar(255) NOT NULL,
  `c_phone` varchar(20) NOT NULL,
  `c_address` text NOT NULL,
  `c_city` varchar(255) NOT NULL,
  `c_state` varchar(255) NOT NULL,
  `c_country` varchar(255) NOT NULL,
  `c_zip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_customer_referrals`
--

CREATE TABLE `rzvy_customer_referrals` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ref_customer_id` int(11) NOT NULL,
  `coupon` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `used` enum('Y','N') NOT NULL,
  `completed` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_feedback`
--

CREATE TABLE `rzvy_feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `review` text NOT NULL,
  `review_datetime` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_frequently_discount`
--

CREATE TABLE `rzvy_frequently_discount` (
  `id` int(11) NOT NULL,
  `fd_key` varchar(255) NOT NULL,
  `fd_label` varchar(255) NOT NULL,
  `fd_type` enum('percentage','flat') NOT NULL,
  `fd_value` double NOT NULL,
  `fd_description` text NOT NULL,
  `fd_status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_frequently_discount`
--

INSERT INTO `rzvy_frequently_discount` (`id`, `fd_key`, `fd_label`, `fd_type`, `fd_value`, `fd_description`, `fd_status`) VALUES
(1, 'one time', 'ONE TIME', 'flat', 0, 'No Discount', 'Y'),
(2, 'weekly', 'WEEKLY', 'percentage', 10, '10% OFF', 'Y'),
(3, 'bi weekly', 'BI-WEEKLY', 'percentage', 5, '5% OFF', 'Y'),
(4, 'monthly', 'MONTHLY', 'percentage', 2, '2% OFF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_payments`
--

CREATE TABLE `rzvy_payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_date` varchar(255) NOT NULL,
  `transaction_id` varchar(500) NOT NULL,
  `sub_total` double NOT NULL,
  `discount` double NOT NULL,
  `tax` double NOT NULL,
  `net_total` double NOT NULL,
  `fd_key` varchar(255) NOT NULL,
  `fd_amount` double NOT NULL,
  `lastmodified` datetime NOT NULL,
  `refer_discount` double NOT NULL,
  `refer_discount_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_schedule`
--

CREATE TABLE `rzvy_schedule` (
  `id` int(11) NOT NULL,
  `week_id` int(11) NOT NULL,
  `weekday_id` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `offday` enum('Y','N') NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `no_of_booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_schedule`
--

INSERT INTO `rzvy_schedule` (`id`, `week_id`, `weekday_id`, `starttime`, `endtime`, `offday`, `service_id`, `no_of_booking`) VALUES
(1, 1, 1, '10:00:00', '20:00:00', 'N', 'default', 0),
(2, 1, 2, '10:00:00', '20:00:00', 'N', 'default', 0),
(3, 1, 3, '10:00:00', '20:00:00', 'N', 'default', 0),
(4, 1, 4, '10:00:00', '20:00:00', 'N', 'default', 0),
(5, 1, 5, '10:00:00', '20:00:00', 'N', 'default', 0),
(6, 1, 6, '10:00:00', '20:00:00', 'N', 'default', 0),
(7, 1, 7, '10:00:00', '20:00:00', 'Y', 'default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_services`
--

CREATE TABLE `rzvy_services` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `duration` varchar(255) NOT NULL,
  `padding_before` varchar(255) NOT NULL,
  `padding_after` varchar(255) NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_settings`
--

CREATE TABLE `rzvy_settings` (
  `id` int(11) NOT NULL,
  `option_name` text NOT NULL,
  `option_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_settings`
--

INSERT INTO `rzvy_settings` (`id`, `option_name`, `option_value`) VALUES
(1, 'rzvy_email_sender_inc', '1'),
(2, 'rzvy_email_sender', 'dotoin'),
(3, 'rzvy_version', '1.2'),
(4, 'rzvy_default_language_on_page_load', ''),
(5, 'rzvy_default_country_code', 'in'),
(6, 'rzvy_currency', 'USD'),
(7, 'rzvy_currency_symbol', '$'),
(8, 'rzvy_date_format', 'd-m-Y'),
(9, 'rzvy_timeslot_interval', '30'),
(10, 'rzvy_time_format', 'H:i'),
(11, 'rzvy_maximum_advance_booking_time', '3'),
(12, 'rzvy_company_name', 'Kashi Vishwanath Temple'),
(13, 'rzvy_company_email', 'kvt@gmail.com'),
(14, 'rzvy_company_phone', '+9170011111111'),
(15, 'rzvy_company_address', 'Banaras'),
(16, 'rzvy_company_city', 'Lucknow'),
(17, 'rzvy_company_state', 'Uttar Pradesh'),
(18, 'rzvy_company_zip', '226001'),
(19, 'rzvy_company_country', 'India'),
(20, 'rzvy_company_logo', ''),
(21, 'rzvy_thankyou_page_url', 'http://localhost/rudra/thankyou.php'),
(22, 'rzvy_auto_confirm_appointment', 'N'),
(23, 'rzvy_tax_status', 'N'),
(24, 'rzvy_tax_type', 'percentage'),
(25, 'rzvy_tax_value', ''),
(26, 'rzvy_minimum_advance_booking_time', '60'),
(27, 'rzvy_cancellation_buffer_time', '60'),
(28, 'rzvy_reschedule_buffer_time', '60'),
(29, 'rzvy_show_frontend_rightside_feedback_list', 'Y'),
(30, 'rzvy_show_frontend_rightside_feedback_form', 'Y'),
(31, 'rzvy_show_guest_user_checkout', 'N'),
(32, 'rzvy_show_existing_new_user_checkout', 'Y'),
(33, 'rzvy_hide_already_booked_slots_from_frontend_calendar', 'Y'),
(34, 'rzvy_terms_and_condition_link', 'http://localhost/rudra/'),
(35, 'rzvy_admin_email_notification_status', 'N'),
(36, 'rzvy_customer_email_notification_status', 'N'),
(37, 'rzvy_email_sender_name', 'Rudra'),
(38, 'rzvy_email_sender_email', 'sdvhsa@gmail.com'),
(39, 'rzvy_email_smtp_hostname', ''),
(40, 'rzvy_email_smtp_username', ''),
(41, 'rzvy_email_smtp_password', ''),
(42, 'rzvy_email_smtp_port', ''),
(43, 'rzvy_email_encryption_type', 'tls'),
(44, 'rzvy_email_smtp_authentication', 'true'),
(45, 'rzvy_send_email_with', 'MAIL'),
(46, 'rzvy_admin_sms_notification_status', 'N'),
(47, 'rzvy_customer_sms_notification_status', 'N'),
(48, 'rzvy_seo_ga_code', ''),
(49, 'rzvy_seo_meta_tag', ''),
(50, 'rzvy_seo_meta_description', ''),
(51, 'rzvy_seo_og_meta_tag', ''),
(52, 'rzvy_seo_og_tag_type', ''),
(53, 'rzvy_seo_og_tag_url', ''),
(54, 'rzvy_seo_og_tag_image', ''),
(55, 'rzvy_paypal_payment_status', 'N'),
(56, 'rzvy_paypal_guest_payment', 'N'),
(57, 'rzvy_paypal_api_username', ''),
(58, 'rzvy_paypal_api_password', ''),
(59, 'rzvy_paypal_signature', ''),
(60, 'rzvy_stripe_payment_status', 'N'),
(61, 'rzvy_stripe_secret_key', ''),
(62, 'rzvy_stripe_publishable_key', ''),
(63, 'rzvy_authorizenet_payment_status', 'N'),
(64, 'rzvy_authorizenet_api_login_id', ''),
(65, 'rzvy_authorizenet_transaction_key', ''),
(66, 'rzvy_twocheckout_payment_status', 'N'),
(67, 'rzvy_twocheckout_publishable_key', ''),
(68, 'rzvy_twocheckout_private_key', ''),
(69, 'rzvy_twocheckout_seller_id', ''),
(70, 'rzvy_timezone', 'Europe/Berlin'),
(71, 'rzvy_location_selector', '226001'),
(72, 'rzvy_refund_status', 'N'),
(73, 'rzvy_refund_type', 'percentage'),
(74, 'rzvy_refund_value', ''),
(75, 'rzvy_refund_request_buffer_time', '120'),
(76, 'rzvy_refund_summary', ''),
(77, 'rzvy_referral_discount_type', 'percentage'),
(78, 'rzvy_referral_discount_value', '5'),
(79, 'rzvy_reminder_buffer_time', '60'),
(80, 'rzvy_location_selector_status', 'Y'),
(81, 'rzvy_maximum_endtimeslot_limit', '60'),
(82, 'rzvy_endtimeslot_selection_status', 'N'),
(83, 'rzvy_referral_discount_status', 'Y'),
(84, 'rzvy_pay_at_venue_status', 'Y'),
(85, 'rzvy_welcome_message_status', 'N'),
(86, 'rzvy_welcome_as_more_info_status', 'N'),
(87, 'rzvy_welcome_message_container', ''),
(88, 'rzvy_bookingform_bg', 'default'),
(89, 'rzvy_bookingform_bg_type', 'color'),
(90, 'rzvy_bookingform_bg_color', '#000000'),
(91, 'rzvy_bookingform_bg_image', ''),
(92, 'rzvy_minimum_booking_amount', '10'),
(93, 'rzvy_single_category_autotrigger_status', 'N'),
(94, 'rzvy_single_service_autotrigger_status', 'N'),
(95, 'rzvy_en_ff_firstname_status', 'Y'),
(96, 'rzvy_en_ff_lastname_status', 'Y'),
(97, 'rzvy_en_ff_phone_status', 'Y'),
(98, 'rzvy_en_ff_address_status', 'Y'),
(99, 'rzvy_en_ff_city_status', 'Y'),
(100, 'rzvy_en_ff_state_status', 'Y'),
(101, 'rzvy_en_ff_country_status', 'Y'),
(102, 'rzvy_g_ff_firstname_status', 'Y'),
(103, 'rzvy_g_ff_lastname_status', 'Y'),
(104, 'rzvy_g_ff_phone_status', 'Y'),
(105, 'rzvy_g_ff_address_status', 'Y'),
(106, 'rzvy_g_ff_city_status', 'Y'),
(107, 'rzvy_g_ff_state_status', 'Y'),
(108, 'rzvy_g_ff_country_status', 'Y'),
(109, 'rzvy_en_ff_firstname_optional', 'Y'),
(110, 'rzvy_en_ff_lastname_optional', 'Y'),
(111, 'rzvy_en_ff_phone_optional', 'Y'),
(112, 'rzvy_en_ff_address_optional', 'Y'),
(113, 'rzvy_en_ff_city_optional', 'Y'),
(114, 'rzvy_en_ff_state_optional', 'Y'),
(115, 'rzvy_en_ff_country_optional', 'Y'),
(116, 'rzvy_g_ff_firstname_optional', 'Y'),
(117, 'rzvy_g_ff_lastname_optional', 'Y'),
(118, 'rzvy_g_ff_phone_optional', 'Y'),
(119, 'rzvy_g_ff_address_optional', 'Y'),
(120, 'rzvy_g_ff_city_optional', 'Y'),
(121, 'rzvy_g_ff_state_optional', 'Y'),
(122, 'rzvy_g_ff_country_optional', 'Y'),
(123, 'rzvy_rzvy_show_dropdown_languages', ''),
(124, 'rzvy_cs_admin_dash', 'default'),
(125, 'rzvy_cs_admin_dash_primary_color', ''),
(126, 'rzvy_cs_admin_dash_secondary_color', ''),
(127, 'rzvy_cs_admin_dash_background_color', ''),
(128, 'rzvy_cs_admin_dash_text_color', ''),
(129, 'rzvy_cs_bfls', 'default'),
(130, 'rzvy_cs_bfls_primary_color', ''),
(131, 'rzvy_cs_bfls_secondary_color', ''),
(132, 'rzvy_cs_bfls_background_color', ''),
(133, 'rzvy_cs_bfls_text_color', ''),
(134, 'rzvy_welcome_as_more_info_status', 'N'),
(135, 'rzvy_staff_email_notification_status', 'N'),
(136, 'rzvy_staff_sms_notification_status', 'N'),
(137, 'rzvy_frontend', 'stepview'),
(138, 'rzvy_default_language_on_page_load', ''),
(139, 'rzvy_default_country_code', 'in'),
(140, 'rzvy_version', '1.2');

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_staff`
--

CREATE TABLE `rzvy_staff` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_staff`
--

INSERT INTO `rzvy_staff` (`id`, `email`, `password`, `firstname`, `lastname`, `phone`, `address`, `city`, `state`, `zip`, `country`, `image`, `status`) VALUES
(1, 'mukesh@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Pandit Mukesh', 'Shastri', '+917572000200', 'Indra Nagar, Lucknow', 'Lucknow', 'Uttar Pradesh', '226001', 'India', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_staff_breaks`
--

CREATE TABLE `rzvy_staff_breaks` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `week_id` int(11) NOT NULL,
  `weekday_id` int(11) NOT NULL,
  `break_start` time NOT NULL,
  `break_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_staff_daysoff`
--

CREATE TABLE `rzvy_staff_daysoff` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `off_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_staff_schedule`
--

CREATE TABLE `rzvy_staff_schedule` (
  `id` int(11) NOT NULL,
  `week_id` int(11) NOT NULL,
  `weekday_id` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `offday` enum('Y','N') NOT NULL,
  `staff_id` int(11) NOT NULL,
  `no_of_booking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_staff_schedule`
--

INSERT INTO `rzvy_staff_schedule` (`id`, `week_id`, `weekday_id`, `starttime`, `endtime`, `offday`, `staff_id`, `no_of_booking`) VALUES
(1, 1, 1, '09:00:00', '18:00:00', 'N', 0, 1),
(2, 1, 2, '09:00:00', '18:00:00', 'N', 0, 1),
(3, 1, 3, '09:00:00', '18:00:00', 'N', 0, 1),
(4, 1, 4, '09:00:00', '18:00:00', 'N', 0, 1),
(5, 1, 5, '09:00:00', '18:00:00', 'N', 0, 1),
(6, 1, 6, '09:00:00', '18:00:00', 'Y', 0, 1),
(7, 1, 7, '09:00:00', '18:00:00', 'Y', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_staff_services`
--

CREATE TABLE `rzvy_staff_services` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_support_tickets`
--

CREATE TABLE `rzvy_support_tickets` (
  `id` int(11) NOT NULL,
  `generated_by_id` int(11) NOT NULL,
  `ticket_title` varchar(1000) NOT NULL,
  `description` longtext NOT NULL,
  `generated_on` datetime NOT NULL,
  `generated_by` enum('admin','customer') NOT NULL,
  `status` enum('active','completed') NOT NULL,
  `read_status` enum('U','R') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_support_ticket_discussions`
--

CREATE TABLE `rzvy_support_ticket_discussions` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `replied_by_id` int(11) NOT NULL,
  `reply` longtext NOT NULL,
  `replied_on` datetime NOT NULL,
  `replied_by` enum('admin','customer') NOT NULL,
  `read_status` enum('U','R') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_templates`
--

CREATE TABLE `rzvy_templates` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `email_content` longtext NOT NULL,
  `sms_content` longtext NOT NULL,
  `template_for` varchar(255) NOT NULL,
  `email_status` enum('Y','N') NOT NULL,
  `sms_status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rzvy_templates`
--

INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(1, 'new', 'New Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBzZXQgYSBuZXcgYXBwb2ludG1lbnQgd2l0aCB7e3tjb21wYW55X25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJCTxwIHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDExcHg7bWFyZ2luOiAxMHB4IDBweCAxNXB4OyI+W1lvdXIgYXBwb2ludG1lbnQgaXMgaW4gcGVuZGluZyBzdGF0ZSBhbmQgeW91IHdpbGwgYmUgbm90aWZpZWQgYXMgd2Ugd2lsbCBjb25maXJtIHRoaXMgYm9va2luZy5dPC9wPgoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tBbWFufX19LApZb3UndmUgc2V0IGEgbmV3IGFwcG9pbnRtZW50IHdpdGgge3t7S2FzaGkgVmlzaHdhbmF0aCBUZW1wbGUgVHJ1c3R9fX0gb24ge3t7MDItMDMtMjAyMH19fSB7e3sxMTo0MyBBTX19fSBmb3Ige3t7UHVyY2hhc2luZyBQcm9kdWN0fX19IC0ge3t7c2VydmljZX19fQ==', 'customer', 'Y', 'Y'),
(2, 'confirm', 'Confirm Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y29tcGFueV9uYW1lfX19IGhhcyBiZWVuIGNvbmZpcm1lZCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2NvbXBhbnlfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gY29uZmlybWVk', 'customer', 'Y', 'Y'),
(3, 'confirms', 'Confirm Appointment By Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y29tcGFueV9uYW1lfX19IGhhcyBiZWVuIGNvbmZpcm1lZCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2NvbXBhbnlfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gY29uZmlybWVk', 'customer', 'Y', 'Y'),
(4, 'reschedulec', 'Rescheduled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIHt7e2NvbXBhbnlfbmFtZX19fSB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApZb3UndmUgcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjb21wYW55X25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y'),
(5, 'reschedulea', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPnt7e2NvbXBhbnlfbmFtZX19fSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LAp7e3tjb21wYW55X25hbWV9fX0gcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(6, 'reschedules', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPnt7e2NvbXBhbnlfbmFtZX19fSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LAp7e3tjb21wYW55X25hbWV9fX0gcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y'),
(7, 'cancelc', 'Cancelled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBjYW5jZWxsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjb21wYW55X25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJCTxkaXYgc3R5bGU9ImZsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrO3BhZGRpbmc6IDEwcHggMHB4OyI+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPldoZW46IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkZvcjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGQtb25zIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7YWRkb25zfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QcmljZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e25ldF90b3RhbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4JCQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApZb3UndmUgY2FuY2VsbGVkIGFwcG9pbnRtZW50IHdpdGgge3t7Y29tcGFueV9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'customer', 'Y', 'Y'),
(8, 'rejecta', 'Rejected by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPnt7e2NvbXBhbnlfbmFtZX19fSByZWplY3RlZCBhcHBvaW50bWVudCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LAp7e3tjb21wYW55X25hbWV9fX0gcmVqZWN0ZWQgYXBwb2ludG1lbnQgb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y'),
(9, 'rejects', 'Rejected by Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPnt7e2NvbXBhbnlfbmFtZX19fSByZWplY3RlZCBhcHBvaW50bWVudCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LAp7e3tjb21wYW55X25hbWV9fX0gcmVqZWN0ZWQgYXBwb2ludG1lbnQgb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y'),
(10, 'complete', 'Appointment Completed', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y29tcGFueV9uYW1lfX19IGhhcyBiZWVuIGNvbXBsZXRlZCB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2NvbXBhbnlfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gY29tcGxldGVk', 'customer', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(11, 'reminder', 'Appointment Reminder', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X2FkZHJlc3N9fX08YnI+e3t7Y29tcGFueV9waG9uZX19fTxicj57e3tjb21wYW55X2VtYWlsfX19CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNDAlO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9IndpZHRoOiAxMzBweDtoZWlnaHQ6IDEwMCU7dmVydGljYWwtYWxpZ246IHRvcDttYXJnaW46IDBweCBhdXRvOyI+CgkJCQkJCQkJPGltZyBzdHlsZT0id2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7ZGlzcGxheTogaW5saW5lLWJsb2NrO2hlaWdodDogMTAwJTsiIHNyYz0ie3t7Y29tcGFueV9sb2dvfX19Ij4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJCTx0cj4KCQkJCQk8dGQ+CgkJCQkJCTxkaXYgc3R5bGU9InBhZGRpbmc6IDI1cHggMzBweDtiYWNrZ3JvdW5kOiAjZmZmO2Zsb2F0OiBsZWZ0O3dpZHRoOiA5MCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCTxkaXYgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJCQkJPGg2IHN0eWxlPSJjb2xvcjogIzYwNjA2MDtmb250LXNpemU6IDE1cHg7bWFyZ2luOiAxMHB4IDBweCAxMHB4O2ZvbnQtd2VpZ2h0OiA2MDA7Ij5EZWFyIHt7e2N1c3RvbWVyX25hbWV9fX0sPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBuZXh0IGFwcG9pbnRtZW50IHNjaGVkdWxlZCB3aXRoIHt7e2NvbXBhbnlfbmFtZX19fSB3aXRoIGZvbGxvd2luZyBkZXRhaWxzOjwvcD4KCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkJCgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlN0YWZmIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7c3RhZmZfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+TmFtZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkVtYWlsIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfZW1haWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBob25lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfcGhvbmV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlBheW1lbnQgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3twYXltZW50X21ldGhvZH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkcmVzcyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2FkZHJlc3N9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQk8L2Rpdj4KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCTwvdHI+CgkJCTwvdGJvZHk+CgkJPC90YWJsZT4KCTwvZGl2Pgo8L2Rpdj4=', 'RGVhciB7e3tjdXN0b21lcl9uYW1lfX19LApZb3UndmUgbmV4dCBhcHBvaW50bWVudCBzY2hlZHVsZWQgd2l0aCB7e3tjb21wYW55X25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19', 'customer', 'Y', 'Y'),
(12, 'new', 'New Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZWNlaXZlZCBuZXcgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkKCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+U3RhZmYgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tzdGFmZl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgcmVjZWl2ZWQgbmV3IGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'admin', 'Y', 'Y'),
(13, 'confirm', 'Confirm Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb25maXJtZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbmZpcm1lZA==', 'admin', 'Y', 'Y'),
(14, 'confirms', 'Confirm Appointment By Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb25maXJtZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbmZpcm1lZA==', 'admin', 'Y', 'Y'),
(15, 'reschedulec', 'Rescheduled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IGhhcyBiZWVuIHJlc2NoZWR1bGVkIGJ5IHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApBcHBvaW50bWVudCBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gcmVzY2hlZHVsZWQgYnkge3t7Y3VzdG9tZXJfbmFtZX19fQ==', 'admin', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(16, 'reschedulea', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'admin', 'Y', 'Y'),
(17, 'reschedules', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'admin', 'Y', 'Y'),
(18, 'cancelc', 'Cancelled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IGhhcyBiZWVuIGNhbmNlbGxlZCBieSB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkKCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+U3RhZmYgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tzdGFmZl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApBcHBvaW50bWVudCBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gY2FuY2VsbGVkIGJ5IHt7e2N1c3RvbWVyX25hbWV9fX0=', 'admin', 'Y', 'Y'),
(19, 'rejecta', 'Rejected by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBjYW5jZWxsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkKCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+U3RhZmYgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tzdGFmZl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgY2FuY2VsbGVkIGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'admin', 'Y', 'Y'),
(20, 'rejects', 'Rejected by Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBjYW5jZWxsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgkKCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+U3RhZmYgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tzdGFmZl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgY2FuY2VsbGVkIGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'admin', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(21, 'complete', 'Appointment Completed', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb21wbGV0ZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbXBsZXRlZA==', 'admin', 'Y', 'Y'),
(22, 'reminder', 'Appointment Reminder', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7YWRtaW5fbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBuZXh0IGFwcG9pbnRtZW50IHNjaGVkdWxlZCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CQoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5TdGFmZiA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3N0YWZmX25hbWV9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3thZG1pbl9uYW1lfX19LApZb3UndmUgbmV4dCBhcHBvaW50bWVudCBzY2hlZHVsZWQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'admin', 'Y', 'Y'),
(23, 'new', 'New Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZWNlaXZlZCBuZXcgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgcmVjZWl2ZWQgbmV3IGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'staff', 'Y', 'Y'),
(24, 'confirm', 'Confirm Appointment', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb25maXJtZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbmZpcm1lZA==', 'staff', 'Y', 'Y'),
(25, 'confirms', 'Confirm Appointment By Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb25maXJtZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbmZpcm1lZA==', 'staff', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(26, 'reschedulec', 'Rescheduled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IGhhcyBiZWVuIHJlc2NoZWR1bGVkIGJ5IHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApBcHBvaW50bWVudCBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gcmVzY2hlZHVsZWQgYnkge3t7Y3VzdG9tZXJfbmFtZX19fQ==', 'staff', 'Y', 'Y'),
(27, 'reschedulea', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'staff', 'Y', 'Y'),
(28, 'reschedules', 'Rescheduled by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSByZXNjaGVkdWxlZCBhcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgcmVzY2hlZHVsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'staff', 'Y', 'Y'),
(29, 'cancelc', 'Cancelled by Customer', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IGhhcyBiZWVuIGNhbmNlbGxlZCBieSB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApBcHBvaW50bWVudCBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0gaGFzIGJlZW4gY2FuY2VsbGVkIGJ5IHt7e2N1c3RvbWVyX25hbWV9fX0=', 'staff', 'Y', 'Y'),
(30, 'rejecta', 'Rejected by You', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBjYW5jZWxsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgY2FuY2VsbGVkIGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'staff', 'Y', 'Y'),
(31, 'rejects', 'Rejected by Staff', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBjYW5jZWxsZWQgYXBwb2ludG1lbnQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IHdpdGggZm9sbG93aW5nIGRldGFpbHM6PC9wPgkJCQkJCQkKCQkJCQkJCTwvZGl2PgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7cGFkZGluZzogMTBweCAwcHg7Ij4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+V2hlbjogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+Rm9yOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZC1vbnMgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3thZGRvbnN9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPlByaWNlIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7bmV0X3RvdGFsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5OYW1lIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfbmFtZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+RW1haWwgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9lbWFpbH19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGhvbmUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9waG9uZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UGF5bWVudCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e3BheW1lbnRfbWV0aG9kfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5BZGRyZXNzIDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7Y3VzdG9tZXJfYWRkcmVzc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCTwvZGl2PgoJCQkJCQk8L2Rpdj4KCQkJCQk8L3RkPgoJCQkJPC90cj4KCQkJPC90Ym9keT4KCQk8L3RhYmxlPgoJPC9kaXY+CjwvZGl2Pg==', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgY2FuY2VsbGVkIGFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBvbiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19IGZvciB7e3tjYXRlZ29yeX19fSAtIHt7e3NlcnZpY2V9fX0=', 'staff', 'Y', 'Y');
INSERT INTO `rzvy_templates` (`id`, `template`, `subject`, `email_content`, `sms_content`, `template_for`, `email_status`, `sms_status`) VALUES
(32, 'complete', 'Appointment Completed', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPkFwcG9pbnRtZW50IHdpdGgge3t7Y3VzdG9tZXJfbmFtZX19fSBoYXMgYmVlbiBjb21wbGV0ZWQgd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApBcHBvaW50bWVudCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gb24ge3t7Ym9va2luZ19kYXRlfX19IHt7e2Jvb2tpbmdfdGltZX19fSBmb3Ige3t7Y2F0ZWdvcnl9fX0gLSB7e3tzZXJ2aWNlfX19IGhhcyBiZWVuIGNvbXBsZXRlZA==', 'staff', 'Y', 'Y'),
(33, 'reminder', 'Appointment Reminder', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgoJPGRpdiBzdHlsZT0iZGlzcGxheTogYmxvY2sgIWltcG9ydGFudDttYXgtd2lkdGg6IDYwMHB4ICFpbXBvcnRhbnQ7bWFyZ2luOiAwIGF1dG8gIWltcG9ydGFudDtjbGVhcjogYm90aCAhaW1wb3J0YW50OyI+CgkJPHRhYmxlIHN0eWxlPSJib3JkZXI6IDFweCBzb2xpZCAjYzJjMmMyO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0O21hcmdpbjogMzBweCAwcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOiA1cHg7LW1vei1ib3JkZXItcmFkaXVzOiA1cHg7LW8tYm9yZGVyLXJhZGl1czogNXB4O2JvcmRlci1yYWRpdXM6IDVweDsiPgoJCQk8dGJvZHk+CgkJCQk8dHIgc3R5bGU9ImJvcmRlci1ib3R0b206IDFweCBzb2xpZCAjZTZlNmU2O2Zsb2F0OiBsZWZ0O3dpZHRoOiAxMDAlO2Rpc3BsYXk6IGJsb2NrOyI+CgkJCQkJPHRkIHN0eWxlPSJ3aWR0aDogNTklO3ZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJPGRpdiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDtwYWRkaW5nOjE1cHg7d2lkdGg6IDEwMCU7Ym94LXNpemluZzogYm9yZGVyLWJveDstd2Via2l0LWJveC1zaXppbmc6IGJvcmRlci1ib3g7Y2xlYXI6IGxlZnQ7dGV4dC1hbGlnbjogbGVmdDtmb250LWZhbWlseTogTW9udHNlcnJhdCwgc2Fucy1zZXJpZjsiPgoJCQkJCQkJe3t7Y29tcGFueV9uYW1lfX19PGJyPnt7e2NvbXBhbnlfYWRkcmVzc319fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iYm9yZGVyLWJvdHRvbTogMXB4IHNvbGlkICNlNmU2ZTY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkRlYXIge3t7c3RhZmZfbmFtZX19fSwgPC9oNj4KCQkJCQkJCQk8cCBzdHlsZT0iY29sb3I6ICM2MDYwNjA7Zm9udC1zaXplOiAxNXB4O21hcmdpbjogMTBweCAwcHggMTVweDsiPllvdSd2ZSBuZXh0IGFwcG9pbnRtZW50IHNjaGVkdWxlZCB3aXRoIHt7e2N1c3RvbWVyX25hbWV9fX0gd2l0aCBmb2xsb3dpbmcgZGV0YWlsczo8L3A+CQkJCQkJCQoJCQkJCQkJPC9kaXY+CgkJCQkJCQk8ZGl2IHN0eWxlPSJmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jaztwYWRkaW5nOiAxMHB4IDBweDsiPgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5XaGVuOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tib29raW5nX2RhdGV9fX0ge3t7Ym9va2luZ190aW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5Gb3I6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+QWRkLW9ucyA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2FkZG9uc319fTwvc3Bhbj4KCQkJCQkJCQk8L2Rpdj4KCQkJCQkJCQk8ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7d2lkdGg6IDEwMCU7ZmxvYXQ6IGxlZnQ7Ij4KCQkJCQkJCQkJPGxhYmVsIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Y29sb3I6ICM5OTk5OTk7cGFkZGluZy1yaWdodDogNXB4O21pbi13aWR0aDogOTVweDt3aGl0ZS1zcGFjZTogbm93cmFwO2Zsb2F0OiBsZWZ0O2xpbmUtaGVpZ2h0OiAyNXB4OyI+UHJpY2UgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tuZXRfdG90YWx9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPk5hbWUgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9uYW1lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5FbWFpbCA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX2VtYWlsfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QaG9uZSA6IDwvbGFiZWw+CgkJCQkJCQkJCTxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE1cHg7Zm9udC13ZWlnaHQ6IDQwMDtjb2xvcjogIzYwNjA2MDtsaW5lLWhlaWdodDogMjVweDtmbG9hdDogbGVmdDt3aWR0aDogNzYlO3dvcmQtd3JhcDogYnJlYWstd29yZDttYXgtaGVpZ2h0OiA3MHB4O292ZXJmbG93OiBhdXRvOyI+IHt7e2N1c3RvbWVyX3Bob25lfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDsiPgoJCQkJCQkJCQk8bGFiZWwgc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtjb2xvcjogIzk5OTk5OTtwYWRkaW5nLXJpZ2h0OiA1cHg7bWluLXdpZHRoOiA5NXB4O3doaXRlLXNwYWNlOiBub3dyYXA7ZmxvYXQ6IGxlZnQ7bGluZS1oZWlnaHQ6IDI1cHg7Ij5QYXltZW50IDogPC9sYWJlbD4KCQkJCQkJCQkJPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTVweDtmb250LXdlaWdodDogNDAwO2NvbG9yOiAjNjA2MDYwO2xpbmUtaGVpZ2h0OiAyNXB4O2Zsb2F0OiBsZWZ0O3dpZHRoOiA3NiU7d29yZC13cmFwOiBicmVhay13b3JkO21heC1oZWlnaHQ6IDcwcHg7b3ZlcmZsb3c6IGF1dG87Ij4ge3t7cGF5bWVudF9tZXRob2R9fX08L3NwYW4+CgkJCQkJCQkJPC9kaXY+CgkJCQkJCQkJPGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrO3dpZHRoOiAxMDAlO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCQkJCTxsYWJlbCBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2NvbG9yOiAjOTk5OTk5O3BhZGRpbmctcmlnaHQ6IDVweDttaW4td2lkdGg6IDk1cHg7d2hpdGUtc3BhY2U6IG5vd3JhcDtmbG9hdDogbGVmdDtsaW5lLWhlaWdodDogMjVweDsiPkFkZHJlc3MgOiA8L2xhYmVsPgoJCQkJCQkJCQk8c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNXB4O2ZvbnQtd2VpZ2h0OiA0MDA7Y29sb3I6ICM2MDYwNjA7bGluZS1oZWlnaHQ6IDI1cHg7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDc2JTt3b3JkLXdyYXA6IGJyZWFrLXdvcmQ7bWF4LWhlaWdodDogNzBweDtvdmVyZmxvdzogYXV0bzsiPiB7e3tjdXN0b21lcl9hZGRyZXNzfX19PC9zcGFuPgoJCQkJCQkJCTwvZGl2PgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'RGVhciB7e3tzdGFmZl9uYW1lfX19LApZb3UndmUgbmV4dCBhcHBvaW50bWVudCBzY2hlZHVsZWQgd2l0aCB7e3tjdXN0b21lcl9uYW1lfX19IG9uIHt7e2Jvb2tpbmdfZGF0ZX19fSB7e3tib29raW5nX3RpbWV9fX0gZm9yIHt7e2NhdGVnb3J5fX19IC0ge3t7c2VydmljZX19fQ==', 'staff', 'Y', 'Y'),
(34, 'forgot_password', 'Reset Password', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkhpLDwvaDY+CgkJCQkJCQkJPHAgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDE1cHg7Ij5Gb3Jnb3QgeW91ciBwYXNzd29yZCAtIDxhIGhyZWY9Int7e3Jlc2V0X3Bhc3N3b3JkX2xpbmt9fX0iPlJlc2V0IGl0IGhlcmU8L2E+PC9wPjwvZGl2PjwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'SGksCkZvcmdvdCB5b3VyIHBhc3N3b3JkIC0gUmVzZXQgaXQgaGVyZSB7e3tyZXNldF9wYXNzd29yZF9saW5rfX19', 'all', 'Y', 'Y'),
(35, 'reset_password', 'Password reset successfully!', 'PGRpdiBzdHlsZT0ibWFyZ2luOiAwO3BhZGRpbmc6IDA7Zm9udC1mYW1pbHk6IEhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7Zm9udC1zaXplOiAxMDAlO2xpbmUtaGVpZ2h0OiAxLjY7Ym94LXNpemluZzogYm9yZGVyLWJveDsiPgkKCTxkaXYgc3R5bGU9ImRpc3BsYXk6IGJsb2NrICFpbXBvcnRhbnQ7bWF4LXdpZHRoOiA2MDBweCAhaW1wb3J0YW50O21hcmdpbjogMCBhdXRvICFpbXBvcnRhbnQ7Y2xlYXI6IGJvdGggIWltcG9ydGFudDsiPgoJCTx0YWJsZSBzdHlsZT0iYm9yZGVyOiAxcHggc29saWQgI2MyYzJjMjt3aWR0aDogMTAwJTtmbG9hdDogbGVmdDttYXJnaW46IDMwcHggMHB4Oy13ZWJraXQtYm9yZGVyLXJhZGl1czogNXB4Oy1tb3otYm9yZGVyLXJhZGl1czogNXB4Oy1vLWJvcmRlci1yYWRpdXM6IDVweDtib3JkZXItcmFkaXVzOiA1cHg7Ij4KCQkJPHRib2R5PgoJCQkJPHRyIHN0eWxlPSJib3JkZXItYm90dG9tOiAxcHggc29saWQgI2U2ZTZlNjtmbG9hdDogbGVmdDt3aWR0aDogMTAwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCTx0ZCBzdHlsZT0id2lkdGg6IDU5JTt2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0OyI+CgkJCQkJCTxkaXYgc3R5bGU9InZlcnRpY2FsLWFsaWduOiB0b3A7ZmxvYXQ6IGxlZnQ7cGFkZGluZzoxNXB4O3dpZHRoOiAxMDAlO2JveC1zaXppbmc6IGJvcmRlci1ib3g7LXdlYmtpdC1ib3gtc2l6aW5nOiBib3JkZXItYm94O2NsZWFyOiBsZWZ0O3RleHQtYWxpZ246IGxlZnQ7Zm9udC1mYW1pbHk6IE1vbnRzZXJyYXQsIHNhbnMtc2VyaWY7Ij4KCQkJCQkJCXt7e2NvbXBhbnlfbmFtZX19fTxicj57e3tjb21wYW55X3Bob25lfX19PGJyPnt7e2NvbXBhbnlfZW1haWx9fX0KCQkJCQkJPC9kaXY+CgkJCQkJPC90ZD4KCQkJCQk8dGQgc3R5bGU9IndpZHRoOiA0MCU7dmVydGljYWwtYWxpZ246IHRvcDtmbG9hdDogbGVmdDsiPgoJCQkJCQk8ZGl2IHN0eWxlPSJ2ZXJ0aWNhbC1hbGlnbjogdG9wO2Zsb2F0OiBsZWZ0O3BhZGRpbmc6MTVweDt3aWR0aDogMTAwJTtib3gtc2l6aW5nOiBib3JkZXItYm94Oy13ZWJraXQtYm94LXNpemluZzogYm9yZGVyLWJveDtjbGVhcjogbGVmdDsiPgoJCQkJCQkJPGRpdiBzdHlsZT0id2lkdGg6IDEzMHB4O2hlaWdodDogMTAwJTt2ZXJ0aWNhbC1hbGlnbjogdG9wO21hcmdpbjogMHB4IGF1dG87Ij4KCQkJCQkJCQk8aW1nIHN0eWxlPSJ3aWR0aDogMTAwJTtmbG9hdDogbGVmdDtkaXNwbGF5OiBpbmxpbmUtYmxvY2s7aGVpZ2h0OiAxMDAlOyIgc3JjPSJ7e3tjb21wYW55X2xvZ299fX0iPgoJCQkJCQkJPC9kaXY+CgkJCQkJCTwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQkJPHRyPgoJCQkJCTx0ZD4KCQkJCQkJPGRpdiBzdHlsZT0icGFkZGluZzogMjVweCAzMHB4O2JhY2tncm91bmQ6ICNmZmY7ZmxvYXQ6IGxlZnQ7d2lkdGg6IDkwJTtkaXNwbGF5OiBibG9jazsiPgoJCQkJCQkJPGRpdiBzdHlsZT0iZmxvYXQ6IGxlZnQ7d2lkdGg6IDEwMCU7ZGlzcGxheTogYmxvY2s7Ij4KCQkJCQkJCQk8aDYgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDEwcHg7Zm9udC13ZWlnaHQ6IDYwMDsiPkhpLDwvaDY+CgkJCQkJCQkJPHAgc3R5bGU9ImNvbG9yOiAjNjA2MDYwO2ZvbnQtc2l6ZTogMTVweDttYXJnaW46IDEwcHggMHB4IDE1cHg7Ij5XZSdyZSBjb25maXJtaW5nIHRoYXQgeW91ciBhY2NvdW50IHBhc3N3b3JkIGlzIHVwZGF0ZWQgc3VjY2Vzc2Z1bGx5LiBJZiB5b3UgZGlkbid0IG1ha2UgdGhpcyByZXF1ZXN0LCBwbGVhc2UgY29udGFjdCB1cyB7e3tjb21wYW55X2VtYWlsfX19PC9wPjwvZGl2PjwvZGl2PgoJCQkJCTwvdGQ+CgkJCQk8L3RyPgoJCQk8L3Rib2R5PgoJCTwvdGFibGU+Cgk8L2Rpdj4KPC9kaXY+', 'SGksCldlJ3JlIGNvbmZpcm1pbmcgdGhhdCB5b3VyIGFjY291bnQgcGFzc3dvcmQgaXMgdXBkYXRlZCBzdWNjZXNzZnVsbHkuIElmIHlvdSBkaWRuJ3QgbWFrZSB0aGlzIHJlcXVlc3QsIHBsZWFzZSBjb250YWN0IHVzIHt7e2NvbXBhbnlfZW1haWx9fX0=', 'all', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `rzvy_used_coupons_by_customer`
--

CREATE TABLE `rzvy_used_coupons_by_customer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `is_expired` enum('Y','N') NOT NULL,
  `used_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kvt_adminpermission`
--
ALTER TABLE `kvt_adminpermission`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `kvt_admins`
--
ALTER TABLE `kvt_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_bookings`
--
ALTER TABLE `kvt_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_cart`
--
ALTER TABLE `kvt_cart`
  ADD PRIMARY KEY (`cartID`);

--
-- Indexes for table `kvt_categories`
--
ALTER TABLE `kvt_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_countries`
--
ALTER TABLE `kvt_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_customers`
--
ALTER TABLE `kvt_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_orders`
--
ALTER TABLE `kvt_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_pages`
--
ALTER TABLE `kvt_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `kvt_payments`
--
ALTER TABLE `kvt_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_poja_type`
--
ALTER TABLE `kvt_poja_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_product`
--
ALTER TABLE `kvt_product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `productType` (`productType`),
  ADD KEY `productURL` (`productURL`(100)),
  ADD KEY `productSku` (`productSku`),
  ADD KEY `color` (`color`),
  ADD KEY `size` (`size`),
  ADD KEY `productfadbric` (`productfadbric`),
  ADD KEY `embellishments` (`embellishments`),
  ADD KEY `stockAvailability` (`stockAvailability`),
  ADD KEY `productQuantity` (`productQuantity`),
  ADD KEY `productCategory` (`productCategory`),
  ADD KEY `productSubCategory` (`productSubCategory`),
  ADD KEY `stockStatus` (`stockStatus`),
  ADD KEY `productName` (`productName`(100)),
  ADD KEY `istrending` (`istrending`),
  ADD KEY `productID` (`productID`),
  ADD KEY `productSpecialPrice` (`productSpecialPrice`),
  ADD KEY `productSpecialPriceTo` (`productSpecialPriceTo`);

--
-- Indexes for table `kvt_product_attributes`
--
ALTER TABLE `kvt_product_attributes`
  ADD PRIMARY KEY (`attributeID`);

--
-- Indexes for table `kvt_product_attribute_value`
--
ALTER TABLE `kvt_product_attribute_value`
  ADD PRIMARY KEY (`pattributeID`);

--
-- Indexes for table `kvt_product_image`
--
ALTER TABLE `kvt_product_image`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `productSKU` (`productSKU`),
  ADD KEY `imageCount` (`imageCount`);

--
-- Indexes for table `kvt_queries`
--
ALTER TABLE `kvt_queries`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `kvt_refund_request`
--
ALTER TABLE `kvt_refund_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_shastri`
--
ALTER TABLE `kvt_shastri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvt_shastri_calendar`
--
ALTER TABLE `kvt_shastri_calendar`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `kvt_subcategories`
--
ALTER TABLE `kvt_subcategories`
  ADD PRIMARY KEY (`subcatID`);

--
-- Indexes for table `kvt_support_ticket`
--
ALTER TABLE `kvt_support_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_addons`
--
ALTER TABLE `rzvy_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_appointment_feedback`
--
ALTER TABLE `rzvy_appointment_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_block_off`
--
ALTER TABLE `rzvy_block_off`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_coupons`
--
ALTER TABLE `rzvy_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_customer_orderinfo`
--
ALTER TABLE `rzvy_customer_orderinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_customer_referrals`
--
ALTER TABLE `rzvy_customer_referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_feedback`
--
ALTER TABLE `rzvy_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_frequently_discount`
--
ALTER TABLE `rzvy_frequently_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_payments`
--
ALTER TABLE `rzvy_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_schedule`
--
ALTER TABLE `rzvy_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_services`
--
ALTER TABLE `rzvy_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_settings`
--
ALTER TABLE `rzvy_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_staff`
--
ALTER TABLE `rzvy_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_staff_breaks`
--
ALTER TABLE `rzvy_staff_breaks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_staff_daysoff`
--
ALTER TABLE `rzvy_staff_daysoff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_staff_schedule`
--
ALTER TABLE `rzvy_staff_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_staff_services`
--
ALTER TABLE `rzvy_staff_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_support_tickets`
--
ALTER TABLE `rzvy_support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_support_ticket_discussions`
--
ALTER TABLE `rzvy_support_ticket_discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_templates`
--
ALTER TABLE `rzvy_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rzvy_used_coupons_by_customer`
--
ALTER TABLE `rzvy_used_coupons_by_customer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kvt_adminpermission`
--
ALTER TABLE `kvt_adminpermission`
  MODIFY `permissionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_admins`
--
ALTER TABLE `kvt_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kvt_bookings`
--
ALTER TABLE `kvt_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_cart`
--
ALTER TABLE `kvt_cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_categories`
--
ALTER TABLE `kvt_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kvt_countries`
--
ALTER TABLE `kvt_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `kvt_customers`
--
ALTER TABLE `kvt_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kvt_orders`
--
ALTER TABLE `kvt_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_pages`
--
ALTER TABLE `kvt_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_payments`
--
ALTER TABLE `kvt_payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_poja_type`
--
ALTER TABLE `kvt_poja_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kvt_product`
--
ALTER TABLE `kvt_product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_product_attributes`
--
ALTER TABLE `kvt_product_attributes`
  MODIFY `attributeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kvt_product_attribute_value`
--
ALTER TABLE `kvt_product_attribute_value`
  MODIFY `pattributeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_product_image`
--
ALTER TABLE `kvt_product_image`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_queries`
--
ALTER TABLE `kvt_queries`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_refund_request`
--
ALTER TABLE `kvt_refund_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_shastri`
--
ALTER TABLE `kvt_shastri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kvt_shastri_calendar`
--
ALTER TABLE `kvt_shastri_calendar`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_subcategories`
--
ALTER TABLE `kvt_subcategories`
  MODIFY `subcatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvt_support_ticket`
--
ALTER TABLE `kvt_support_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_addons`
--
ALTER TABLE `rzvy_addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_appointment_feedback`
--
ALTER TABLE `rzvy_appointment_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_block_off`
--
ALTER TABLE `rzvy_block_off`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_coupons`
--
ALTER TABLE `rzvy_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_customer_orderinfo`
--
ALTER TABLE `rzvy_customer_orderinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_customer_referrals`
--
ALTER TABLE `rzvy_customer_referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_feedback`
--
ALTER TABLE `rzvy_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_frequently_discount`
--
ALTER TABLE `rzvy_frequently_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rzvy_payments`
--
ALTER TABLE `rzvy_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_schedule`
--
ALTER TABLE `rzvy_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rzvy_services`
--
ALTER TABLE `rzvy_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_settings`
--
ALTER TABLE `rzvy_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `rzvy_staff`
--
ALTER TABLE `rzvy_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rzvy_staff_breaks`
--
ALTER TABLE `rzvy_staff_breaks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_staff_daysoff`
--
ALTER TABLE `rzvy_staff_daysoff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_staff_schedule`
--
ALTER TABLE `rzvy_staff_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rzvy_staff_services`
--
ALTER TABLE `rzvy_staff_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_support_tickets`
--
ALTER TABLE `rzvy_support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_support_ticket_discussions`
--
ALTER TABLE `rzvy_support_ticket_discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rzvy_templates`
--
ALTER TABLE `rzvy_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rzvy_used_coupons_by_customer`
--
ALTER TABLE `rzvy_used_coupons_by_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
