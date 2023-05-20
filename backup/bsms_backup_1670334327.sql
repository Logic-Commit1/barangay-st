# ABMS : MySQL database backup
#
# Generated: Tuesday 6. December 2022
# Hostname: localhost
# Database: bsms
# --------------------------------------------------------


#
# Delete any existing table `announcements`
#

DROP TABLE IF EXISTS `announcements`;


#
# Table structure of table `announcements`
#



CREATE TABLE `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

INSERT INTO announcements VALUES("42","Paalala: Ang labis na maiingay na tambutso ay lubhang nakaka apekto sa mga kababayan nating may kara","Alinsunod sa City Ordinance no.10 s'2014
Anomang uri ng maiingay na tunog na lumalagpas sa itinakdang level ng ingay ay kailangan mapatawan ng parusa ayon sa ipinag-uutos ng Batas.

Nakikisuyo po kami sa ating mga kababayan na merong nakikitang nagpapatakbo ng maiingay na tambutso sa inyong mga Barangay, agad na ipagbigay alam po sa aming tanggapan upang aming personal na mapuntahan ang mga ito.

Paalala:
Ang labis na maiingay na tambutso ay lubhang nakaka apekto sa mga kababayan nating may karamdaman, mga senior citizens , mga sanggol at maging sa mga naka hearing aid.","202212040406251670166385638cb7713b987.jpg","2022-12-04 23:06:25","","");
INSERT INTO announcements VALUES("43","Claim of ePhillID ","Magandang araw!
Ngayong araw po ay sa Barangay Hall Extension, malapit sa La Consolacion Colleges pupuwesto ang kuhaan ng ePhilID sa kadahilanang mayroong event sa court at wala pa pong mapuwestuhan ang ating Philsys doon. Bukas po ay sa Purok 3 Covered Court na ulit.","202212060346151670294775638eacf7ec19c.jpg","2022-12-06 10:46:15","","");



#
# Delete any existing table `certificate_requests`
#

DROP TABLE IF EXISTS `certificate_requests`;


#
# Table structure of table `certificate_requests`
#



CREATE TABLE `certificate_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resident_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `certificate_id` int(10) unsigned NOT NULL,
  `status` enum('resolved','rejected','pending') NOT NULL DEFAULT 'pending',
  `memo` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `url` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resident_id` (`resident_id`),
  KEY `payment_id` (`payment_id`),
  KEY `certificate_id` (`certificate_id`),
  CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`),
  CONSTRAINT `certificate_requests_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `certificate_requests_ibfk_3` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO certificate_requests VALUES("5","9","17","5","","Quas minima vitae do","{"name": "Addison Lawrence", "nature": "Eius temporibus dese", "owner_1": "Cumque quis reiciend", "owner_2": "Earum sit in volupta"}","generate_business_permit.php?id=9&request_id=5","2022-06-03 22:34:05","2022-06-03 23:31:50","");
INSERT INTO certificate_requests VALUES("6","9","","5","pending","Quas minima vitae do","{"name": "Addison Lawrence", "nature": "Eius temporibus dese", "owner_1": "Cumque quis reiciend", "owner_2": "Earum sit in volupta"}","generate_business_permit.php?id=9&request_id=6","2022-06-03 22:34:09","2022-06-03 22:34:09","");
INSERT INTO certificate_requests VALUES("7","9","","5","pending","Quas minima vitae do","{"name": "Addison Lawrence", "nature": "Eius temporibus dese", "owner_1": "Cumque quis reiciend", "owner_2": "Earum sit in volupta"}","generate_business_permit.php?id=9&request_id=7","2022-06-03 22:34:12","2022-06-03 22:34:12","");
INSERT INTO certificate_requests VALUES("8","9","","5","pending","123","{"name": "123", "nature": "123123", "owner_1": "12312", "owner_2": "3123"}","generate_business_permit.php?id=9&request_id=8","2022-06-03 22:39:12","2022-06-03 22:39:12","");
INSERT INTO certificate_requests VALUES("11","9","","6","pending","123","{"location": "buri", "material": "123", "quantity": "123"}","generate_cuttingpermit.php?id=9&request_id=11","2022-06-03 23:29:54","2022-06-04 00:42:29","");
INSERT INTO certificate_requests VALUES("12","9","","6","pending","123","{"location": "3asdf asdf asdf asdf", "material": "fdsfwre asdf", "quantity": "12312 asdf asdf "}","generate_cuttingpermit.php?id=9&request_id=12","2022-06-04 00:48:22","2022-06-04 00:48:22","");



#
# Delete any existing table `certificates`
#

DROP TABLE IF EXISTS `certificates`;


#
# Table structure of table `certificates`
#



CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO certificates VALUES("1","Barangay Certificate","generate_brgy_cert.php");
INSERT INTO certificates VALUES("2","Cutting Permit","generate_cuttingpermit.php");
INSERT INTO certificates VALUES("3","4ps Certification","generate_fpscert.php");
INSERT INTO certificates VALUES("4","Certificate of Indigency","generate_indi_cert.php");
INSERT INTO certificates VALUES("5","Business Clearance","generate_business_permit.php");
INSERT INTO certificates VALUES("6","Cutting Permit","generate_cuttingpermit.php");



#
# Delete any existing table `payments`
#

DROP TABLE IF EXISTS `payments`;


#
# Table structure of table `payments`
#



CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `resident_id` int(10) unsigned DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `mode` enum('online','cash') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `resident_id` (`resident_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO payments VALUES("6","11","1","Barangay Clearance Payment","200.00","online","2022-05-22 17:35:30","","");
INSERT INTO payments VALUES("7","11","1","Certificate of Indigency Payment","200.00","online","2022-05-22 17:52:50","","");
INSERT INTO payments VALUES("8","11","1","Certificate of Indigency Payment","2.00","online","2022-05-22 17:53:39","","");
INSERT INTO payments VALUES("9","11","6","Business Permit Payment","2.00","online","2022-05-22 18:23:47","","");
INSERT INTO payments VALUES("10","11","2","4PS Certification Payment","21.00","online","2022-05-22 18:34:12","","");
INSERT INTO payments VALUES("11","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:10","","");
INSERT INTO payments VALUES("12","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:26","","");
INSERT INTO payments VALUES("13","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:36","","");
INSERT INTO payments VALUES("14","11","1","Cutting Permit Payment","123.00","online","2022-05-22 21:04:13","","");
INSERT INTO payments VALUES("15","11","9","Barangay Clearance Payment","222.00","online","2022-05-24 23:38:50","","");
INSERT INTO payments VALUES("16","11","9","Barangay Clearance Payment","12.00","online","2022-05-24 23:40:10","","");
INSERT INTO payments VALUES("17","11","9","Business Permit Payment","12312.00","online","2022-06-03 23:31:50","","");
INSERT INTO payments VALUES("18","11","16","Barangay Clearance Payment","200.00","cash","2022-12-06 15:19:06","","");
INSERT INTO payments VALUES("19","11","16","Barangay Clearance Payment","200.00","cash","2022-12-06 21:04:33","","");
INSERT INTO payments VALUES("20","11","16","Cutting Permit Payment","200.00","online","2022-12-06 21:08:30","","");
INSERT INTO payments VALUES("21","11","16","Barangay Clearance Payment","200.00","cash","2022-12-06 21:10:22","","");



#
# Delete any existing table `purok`
#

DROP TABLE IF EXISTS `purok`;


#
# Table structure of table `purok`
#



CREATE TABLE `purok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO purok VALUES("1","Purok 1","Tikang Kanda Babon ngadto liwat kanda Babon");
INSERT INTO purok VALUES("2","Purok 2","Amon ngadto ira");
INSERT INTO purok VALUES("3","Purok 3","afawewqeqweqweqw");
INSERT INTO purok VALUES("4","Purok 4","dsfdsf");
INSERT INTO purok VALUES("5","Purok 5","rewrew");
INSERT INTO purok VALUES("6","Purok 6","rewrewr");
INSERT INTO purok VALUES("7","Purok 7","rew");
INSERT INTO purok VALUES("8","Purok 8","rew");



#
# Delete any existing table `residents`
#

DROP TABLE IF EXISTS `residents`;


#
# Table structure of table `residents`
#



CREATE TABLE `residents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `national_id` varchar(100) DEFAULT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `picture` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alias` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthplace` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civilstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `purok_id` int(10) unsigned NOT NULL,
  `voterstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `identified_as` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `resident_type` int(11) DEFAULT 1,
  `is_4ps` tinyint(1) DEFAULT 0,
  `is_pwd` tinyint(1) DEFAULT 0,
  `is_senior` tinyint(1) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `purok_id` (`purok_id`),
  CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`),
  CONSTRAINT `residents_ibfk_2` FOREIGN KEY (`purok_id`) REFERENCES `purok` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO residents VALUES("16","111111111111","106","nigerian","","Taylor","Batumbakal","Swift","bea","tondo","2000-01-01","22","Married","Female","4","Yes","Unidentified","09271281533","jbsatuito@gmail.com","tambay"," tondo nga hehe ","1","0","0","0","","2022-12-04 23:04:19","2022-12-05 21:40:17","");
INSERT INTO residents VALUES("17","01010101100101","107","Nigerian","","Juvin","Dela ","Cruz","jabolboy","Kanal","2001-01-01","22","Single","Male","4","Yes","Unidentified","09271281533","jbsatuito@gmaiol.com","tambay","Pio. Valenzuela","1","0","0","0","","2022-12-04 23:48:34","","");



#
# Delete any existing table `tbl_support`
#

DROP TABLE IF EXISTS `tbl_support`;


#
# Table structure of table `tbl_support`
#



CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_support VALUES("10","taylor batumbakal","jbsatuito@gmail.com","","Cannot Open Announcements","I experienced a bug wherein I cannot open the announcement on the dashboard window","2022-12-06 15:32:04");



#
# Delete any existing table `tblblotter`
#

DROP TABLE IF EXISTS `tblblotter`;


#
# Table structure of table `tblblotter`
#



CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainant` varchar(100) DEFAULT NULL,
  `respondent` varchar(100) DEFAULT NULL,
  `victim` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;




#
# Delete any existing table `tblbrgy_info`
#

DROP TABLE IF EXISTS `tblbrgy_info`;


#
# Table structure of table `tblbrgy_info`
#



CREATE TABLE `tblbrgy_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `brgy_name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `city_logo` varchar(100) DEFAULT NULL,
  `brgy_logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblbrgy_info VALUES("1","Laguna","Binan","Barangay Sto. Tomas","0927-128-1533","Every Government Unit in the Philippines is within a Barangay. The municipal hall, city hall, the provincial capitol building, and even the Malacañang Palace where the president resides is within a Barangay.","22052022140518280057777_309540994678537_4506971625188184492_n.png","22052022140518280057777_309540994678537_4506971625188184492_n.jpg","04122022162010243323880_164117952572663_3028781046043129023_n-removebg-preview.jpg");



#
# Delete any existing table `tblchairmanship`
#

DROP TABLE IF EXISTS `tblchairmanship`;


#
# Table structure of table `tblchairmanship`
#



CREATE TABLE `tblchairmanship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblchairmanship VALUES("2","Presiding Officer");
INSERT INTO tblchairmanship VALUES("3","Committee on Appropriation");
INSERT INTO tblchairmanship VALUES("4","Committee on Peace & Order");
INSERT INTO tblchairmanship VALUES("5","Committee on Health");
INSERT INTO tblchairmanship VALUES("6","Committee on Education");
INSERT INTO tblchairmanship VALUES("7","Committee on Rules");
INSERT INTO tblchairmanship VALUES("8","Committee on Infrastructure ");
INSERT INTO tblchairmanship VALUES("9","Committee on Solid Waste");
INSERT INTO tblchairmanship VALUES("10","Committee on Sports");
INSERT INTO tblchairmanship VALUES("11","No Chairmanship");



#
# Delete any existing table `tbldocuments`
#

DROP TABLE IF EXISTS `tbldocuments`;


#
# Table structure of table `tbldocuments`
#



CREATE TABLE `tbldocuments` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `requested_documents` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO tbldocuments VALUES("1","amar","amar@gmail.com","910201645","certificate","school","2022-04-20 06:00:00");



#
# Delete any existing table `tblfpscert`
#

DROP TABLE IF EXISTS `tblfpscert`;


#
# Table structure of table `tblfpscert`
#



CREATE TABLE `tblfpscert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tblfpscert VALUES("1","RENATO R. ALMO","Metro Manila","2022-04-15");
INSERT INTO tblfpscert VALUES("2","Annie May Barrera","Manila","2022-04-18");
INSERT INTO tblfpscert VALUES("3","trytr","5454","2022-05-21");



#
# Delete any existing table `tblofficials`
#

DROP TABLE IF EXISTS `tblofficials`;


#
# Table structure of table `tblofficials`
#



CREATE TABLE `tblofficials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `chairmanship` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `termstart` date DEFAULT NULL,
  `termend` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblofficials VALUES("1","Vanessa Zaballa Zapata","2","4","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("4","Jesus Dejan Romantigue","11","7","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("5","Dionisio Vista Basmayor Jr.","4","8","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("6","Restituto Del Rosario Manarin","5","9","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("7","Eduardo Dimaranan Salazar","6","10","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("11","Kimhea Nicole Bermejo Guzman","10","14","2020-07-08","2021-04-03","Active");
INSERT INTO tblofficials VALUES("12"," Rodel Cunaco Gonzales","11","15","2020-07-08","2021-04-03","Active");
INSERT INTO tblofficials VALUES("14","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("15","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("16","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("17","Elizabeth Recana Aquino","5","10","2018-05-18","2022-12-31","Active");
INSERT INTO tblofficials VALUES("18","Neil De Mesa Bautista","5","10","2018-05-14","2022-12-31","Active");
INSERT INTO tblofficials VALUES("19","Amanda Magdaraog Dimaranan","5","10","2018-05-14","2022-12-31","Active");



#
# Delete any existing table `tblpermit`
#

DROP TABLE IF EXISTS `tblpermit`;


#
# Table structure of table `tblpermit`
#



CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `owner1` varchar(200) DEFAULT NULL,
  `owner2` varchar(80) DEFAULT NULL,
  `nature` varchar(220) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;




#
# Delete any existing table `tblposition`
#

DROP TABLE IF EXISTS `tblposition`;


#
# Table structure of table `tblposition`
#



CREATE TABLE `tblposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblposition VALUES("4","Barangay Captain","1");
INSERT INTO tblposition VALUES("7","Barangay Kagawad","2");
INSERT INTO tblposition VALUES("8","Barangay Kagawad","3");
INSERT INTO tblposition VALUES("9","Barangay Kagawad","4");
INSERT INTO tblposition VALUES("10","Barangay Kagawad","5");
INSERT INTO tblposition VALUES("11","Barangay Kagawad","6");
INSERT INTO tblposition VALUES("12","Barangay Kagawad","7");
INSERT INTO tblposition VALUES("13","Barangay Kagawad","8");
INSERT INTO tblposition VALUES("14","SK Chairman","9");
INSERT INTO tblposition VALUES("15","Secretary","10");
INSERT INTO tblposition VALUES("16","Treasurer","11");



#
# Delete any existing table `tblprecinct`
#

DROP TABLE IF EXISTS `tblprecinct`;


#
# Table structure of table `tblprecinct`
#



CREATE TABLE `tblprecinct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precinct` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;




#
# Delete any existing table `tblrequest`
#

DROP TABLE IF EXISTS `tblrequest`;


#
# Table structure of table `tblrequest`
#



CREATE TABLE `tblrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;




#
# Delete any existing table `users`
#

DROP TABLE IF EXISTS `users`;


#
# Table structure of table `users`
#



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('administrator','staff','user') NOT NULL,
  `avatar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4;

INSERT INTO users VALUES("11","admin","d033e22ae348aeb5660fc2140aec35850c4da997","administrator","data:image/jpeg;base64,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","2021-05-03 10:33:03");
INSERT INTO users VALUES("106","janine05","3989257524822655a948eee028c472ef071c9f31","user","202212050240171670247617638df4c12c9fd.jpg","2022-12-04 23:04:19");
INSERT INTO users VALUES("107","jabolero","4b3bb14a4367c19031b4f60db6b221163dc164b1","user","","2022-12-04 23:48:34");

