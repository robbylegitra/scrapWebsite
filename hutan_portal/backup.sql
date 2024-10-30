/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: portal_pln
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add article',7,'add_article'),
(26,'Can change article',7,'change_article'),
(27,'Can delete article',7,'delete_article'),
(28,'Can view article',7,'view_article'),
(29,'Can add Lelang',8,'add_lelang'),
(30,'Can change Lelang',8,'change_lelang'),
(31,'Can delete Lelang',8,'delete_lelang'),
(32,'Can view Lelang',8,'view_lelang');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'scrapper','article'),
(8,'scrapper','lelang'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2024-10-24 06:28:55.212018'),
(2,'auth','0001_initial','2024-10-24 06:28:55.524493'),
(3,'admin','0001_initial','2024-10-24 06:28:55.602633'),
(4,'admin','0002_logentry_remove_auto_add','2024-10-24 06:28:55.602633'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-10-24 06:28:55.618269'),
(6,'contenttypes','0002_remove_content_type_name','2024-10-24 06:28:55.665130'),
(7,'auth','0002_alter_permission_name_max_length','2024-10-24 06:28:55.680749'),
(8,'auth','0003_alter_user_email_max_length','2024-10-24 06:28:55.696372'),
(9,'auth','0004_alter_user_username_opts','2024-10-24 06:28:55.712005'),
(10,'auth','0005_alter_user_last_login_null','2024-10-24 06:28:55.743259'),
(11,'auth','0006_require_contenttypes_0002','2024-10-24 06:28:55.743259'),
(12,'auth','0007_alter_validators_add_error_messages','2024-10-24 06:28:55.758927'),
(13,'auth','0008_alter_user_username_max_length','2024-10-24 06:28:55.774493'),
(14,'auth','0009_alter_user_last_name_max_length','2024-10-24 06:28:55.790133'),
(15,'auth','0010_alter_group_name_max_length','2024-10-24 06:28:55.805751'),
(16,'auth','0011_update_proxy_permissions','2024-10-24 06:28:55.821370'),
(17,'auth','0012_alter_user_first_name_max_length','2024-10-24 06:28:55.837039'),
(18,'scrapper','0001_initial','2024-10-24 06:28:55.852655'),
(19,'scrapper','0002_alter_article_title','2024-10-24 06:28:55.868253'),
(20,'sessions','0001_initial','2024-10-24 06:28:55.883880'),
(21,'scrapper','0003_article_post_date_alter_article_link','2024-10-24 06:42:32.350612'),
(22,'scrapper','0004_alter_article_link','2024-10-24 06:44:26.153260'),
(23,'scrapper','0005_lelang','2024-10-24 07:39:46.890983'),
(24,'scrapper','0006_alter_lelang_hps_alter_lelang_instansi_and_more','2024-10-24 07:44:21.090679');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrapper_article`
--

DROP TABLE IF EXISTS `scrapper_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrapper_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2233 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrapper_article`
--

LOCK TABLES `scrapper_article` WRITE;
/*!40000 ALTER TABLE `scrapper_article` DISABLE KEYS */;
INSERT INTO `scrapper_article` VALUES
(1978,'4501 – Pengadaan Material dan Jasa Borongan Sistem Monitoring Realtime Line Transmisi','http://plniconplus.co.id/eproc/4501-pengadaan-material-dan-jasa-borongan-sistem-monitoring-realtime-line-transmisi/','','2024-10-24 10:43:50.614464','24-Oktober-2024'),
(1979,'Lelang Terbuka _ 4438 _ Penugasan PLN Pengadaan Server DC – DRC ERP SAP APP dan DB','http://plniconplus.co.id/eproc/lelang-terbuka-_-4438-_-penugasan-pln-pengadaan-server-dc-drc-erp-sap-app-dan-db/','','2024-10-24 10:43:50.617287','22-Oktober-2024'),
(1980,'Pengumuman Tender Terbuka Pascakualifikasi No :  4414/PUM/08/PST/ 2024','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-no-4414-pum-08-pst-2024/','','2024-10-24 10:43:50.620960','15-Oktober-2024'),
(1981,'Pengumuman Tender Terbuka Pascakualifikasi No : 4201','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-no-4201/','','2024-10-24 10:43:50.623973','15-Oktober-2024'),
(1982,'Pengumuman Lelang Terbuka No : 4460 _ Pekerjaan Renovasi Gedung untuk Contact Center PLN 123 Site Palembang','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-no-4460-_-pekerjaan-renovasi-gedung-untuk-contact-center-pln-123-site-palembang/','','2024-10-24 10:43:50.626976','15-Oktober-2024'),
(1983,'4322 Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Kalender 2025','http://plniconplus.co.id/eproc/4322-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-kalender-2025/','','2024-10-24 10:43:50.934271','14-Oktober-2024'),
(1984,'{4465} _ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Penugasan PLN Pengadaan Storage NAS ArcGis','http://plniconplus.co.id/eproc/4465-_-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-penugasan-pln-pengadaan-storage-nas-arcgis/','','2024-10-24 10:43:50.935345','09-Oktober-2024'),
(1985,'Tender Terbuka – 4043 Pembelian IPv4 Subnet 19','http://plniconplus.co.id/eproc/tender-terbuka-4043-pembelian-ipv4-subnet-19/','','2024-10-24 10:43:50.935345','09-Oktober-2024'),
(1986,'[4338] Pengumuman Tender Terbuka Pascakualifikasi_Pengadaan Penambahan Sistem Proteksi Kebakaran Data Center Gandul 2','http://plniconplus.co.id/eproc/4338-pengumuman-tender-terbuka-pascakualifikasi_pengadaan-penambahan-sistem-proteksi-kebakaran-data-center-gandul-2/','','2024-10-24 10:43:50.940504','30-September-2024'),
(1987,'Pengumuman Tender Terbuka Pascakualifikasi Penyediaan Annual Technical Support (ATS) Backup Services Data Center','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-penyediaan-annual-technical-support-ats-backup-services-data-center/','','2024-10-24 10:43:50.940504','30-September-2024'),
(1988,'Pengadaan Infrastruktur Database Pelayanan Aplikasi','http://plniconplus.co.id/eproc/pengadaan-infrastruktur-database-pelayanan-aplikasi/','','2024-10-24 10:43:51.274481','26-September-2024'),
(1989,'Pengadaan Infrastruktur Object Storage Aplikasi','http://plniconplus.co.id/eproc/pengadaan-infrastruktur-object-storage-aplikasi/','','2024-10-24 10:43:51.277545','26-September-2024'),
(1990,'Tender Terbuka – 4004 Jasa Penyedia Pengadaan Link Pontianak – Pangkalan Bun 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-4004-jasa-penyedia-pengadaan-link-pontianak-pangkalan-bun-10-gbps-2/','','2024-10-24 10:43:51.280545','25-September-2024'),
(1991,'3591 – Peremajaan Perangkat SDH Obsolete Pada Layanan PLN di Jaringan 150 kV','http://plniconplus.co.id/eproc/3591-peremajaan-perangkat-sdh-obsolete-pada-layanan-pln-di-jaringan-150-kv/','','2024-10-24 10:43:51.283136','18-September-2024'),
(1992,'Tender Terbuka – 4071 KHS SFP untuk Kebutuhan Penyambungan Baru Pelanggan','http://plniconplus.co.id/eproc/tender-terbuka-4071-khs-sfp-untuk-kebutuhan-penyambungan-baru-pelanggan/','','2024-10-24 10:43:51.285247','12-September-2024'),
(1993,'Tender Terbuka – 3672 Pengadaan IPv4 Aktivasi Publik','http://plniconplus.co.id/eproc/tender-terbuka-3672-pengadaan-ipv4-aktivasi-publik-2/','','2024-10-24 10:43:51.613968','06-September-2024'),
(1994,'{3444} _ Pengumuman Tender Terbuka Pascakualifikasi Pegadaan Peremajaan Perangkat Obsolete Jaringan Lab NAP dan MPLS Backbone','http://plniconplus.co.id/eproc/3444-_-pengumuman-tender-terbuka-pascakualifikasi-pegadaan-peremajaan-perangkat-obsolete-jaringan-lab-nap-dan-mpls-backbone/','','2024-10-24 10:43:51.616968','05-September-2024'),
(1995,'3117 Pengadaan Jasa dan Material Pemeliharaan Keamanan Fisik Data Center','http://plniconplus.co.id/eproc/3117-pengadaan-jasa-dan-material-pemeliharaan-keamanan-fisik-data-center/','','2024-10-24 10:43:51.619616','05-September-2024'),
(1996,'3681.3795 – KHS CPE L2 Kapasitas 1G, 10G dan 100G','http://plniconplus.co.id/eproc/3681-3795-khs-cpe-l2-kapasitas-1g-10g-dan-100g/','','2024-10-24 10:43:51.622159','04-September-2024'),
(1997,'3622 – Jasa Penyedia Pengadaan Link Denpasar – Timika 50 Mbps','http://plniconplus.co.id/eproc/3622-jasa-penyedia-pengadaan-link-denpasar-timika-50-mbps-2/','','2024-10-24 10:43:51.625141','29-Agustus-2024'),
(1998,'Tender Terbuka –  4004 Jasa Penyedia Pengadaan Link Pontianak – Pangkalan Bun 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-4004-jasa-penyedia-pengadaan-link-pontianak-pangkalan-bun-10-gbps/','','2024-10-24 10:43:51.953814','29-Agustus-2024'),
(1999,'Pengumuman Tender Terbuka Pascakualifikasi Penambahan Lisensi dan Kapasitas Backup Data Center (3900)','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-penambahan-lisensi-dan-kapasitas-backup-data-center-3900/','','2024-10-24 10:43:51.957871','23-Agustus-2024'),
(2000,'Tender Terbuka – 2842 Pengadaan IPLC Bali-Singapore','http://plniconplus.co.id/eproc/tender-terbuka-2842-pengadaan-iplc-bali-singapore-2/','','2024-10-24 10:43:51.960960','22-Agustus-2024'),
(2001,'{3765} Pengumuman Tender Terbuka Pascakualifikasi Pengdaan Jasa Borongan Service Point Radio Trunking','http://plniconplus.co.id/eproc/3765-pengumuman-tender-terbuka-pascakualifikasi-pengdaan-jasa-borongan-service-point-radio-trunking/','','2024-10-24 10:43:51.963789','21-Agustus-2024'),
(2002,'3278 – Jasa Penyedia Pengadaan Link Pekanbaru – Tanjung Pinang 10 Gbps','http://plniconplus.co.id/eproc/3278-jasa-penyedia-pengadaan-link-pekanbaru-tanjung-pinang-10-gbps/','','2024-10-24 10:43:51.966789','20-Agustus-2024'),
(2003,'Tender Terbuka – 2743 Jasa Penyedia Pengadaan Link Surabaya – Makassar 100G (2)','http://plniconplus.co.id/eproc/tender-terbuka-2743-jasa-penyedia-pengadaan-link-surabaya-makassar-100g-2/','','2024-10-24 10:43:52.291577','20-Agustus-2024'),
(2004,'3901-Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Wilayah Perbatasan Aceh Sumut','http://plniconplus.co.id/eproc/3901-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-wilayah-perbatasan-aceh-sumut/','','2024-10-24 10:43:52.294000','16-Agustus-2024'),
(2005,'Peremajaan Perangkat CPE Layanan SCADA REDUNDANT PLN','http://plniconplus.co.id/eproc/peremajaan-perangkat-cpe-layanan-scada-redundant-pln/','','2024-10-24 10:43:52.296393','16-Agustus-2024'),
(2006,'1709-Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Wilayah Tapanuli Mandailing','http://plniconplus.co.id/eproc/1709-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-wilayah-tapanuli-mandailing/','','2024-10-24 10:43:52.299411','16-Agustus-2024'),
(2007,'1708-Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Wilayah Sumatera Utara Pantai Timur','http://plniconplus.co.id/eproc/1708-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-wilayah-sumatera-utara-pantai-timur/','','2024-10-24 10:43:52.301403','16-Agustus-2024'),
(2008,'1707-Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Kota Medan','http://plniconplus.co.id/eproc/1707-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-kota-medan/','','2024-10-24 10:43:52.659095','16-Agustus-2024'),
(2009,'3625 – Jasa Penyedia Pengadaan Link Samarinda – Berau 1 Gbps','http://plniconplus.co.id/eproc/3625-jasa-penyedia-pengadaan-link-samarinda-berau-1-gbps-3/','','2024-10-24 10:43:52.662105','15-Agustus-2024'),
(2010,'3629 – Jasa Penyedia Pengadaan Link Samarinda – Tarakan 100 Mbps','http://plniconplus.co.id/eproc/3629-jasa-penyedia-pengadaan-link-samarinda-tarakan-100-mbps-2/','','2024-10-24 10:43:52.665121','15-Agustus-2024'),
(2011,'3248 – Pengadaan Modul Router 100G Nasional 2024','http://plniconplus.co.id/eproc/3248-pengadaan-modul-router-100g-nasional-2024/','','2024-10-24 10:43:52.668112','15-Agustus-2024'),
(2012,'3284 – Pengadaan Perangkat L2 Switch 10G 2024','http://plniconplus.co.id/eproc/3284-pengadaan-perangkat-l2-switch-10g-2024/','','2024-10-24 10:43:52.670380','14-Agustus-2024'),
(2013,'[3779] Pengumuman Tender Terbuka_Pengadaan Redundansi Sistem Kelistrikan Data Center Gandul 2','http://plniconplus.co.id/eproc/3779-pengumuman-tender-terbuka_pengadaan-redundansi-sistem-kelistrikan-data-center-gandul-2/','','2024-10-24 10:43:53.010334','14-Agustus-2024'),
(2014,'[Perpanjangan] 3625 – Jasa Penyedia Pengadaan Link Samarinda – Berau 1 Gbps','http://plniconplus.co.id/eproc/perpanjangan-3625-jasa-penyedia-pengadaan-link-samarinda-berau-1-gbps/','','2024-10-24 10:43:53.013314','09-Agustus-2024'),
(2015,'Tender Terbuka – 2553 Jasa Penyedia Pengadaan Link Jakarta IDC (3) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2553-jasa-penyedia-pengadaan-link-jakarta-idc-3-singapore-100-gbps-3/','','2024-10-24 10:43:53.018306','09-Agustus-2024'),
(2016,'Tender Terbuka – 3275 Jasa Penyedia Pengadaan Link Denpasar – Sumbawa 500 Mbps','http://plniconplus.co.id/eproc/tender-terbuka-3275-jasa-penyedia-pengadaan-link-denpasar-sumbawa-500-mbps-2/','','2024-10-24 10:43:53.021305','09-Agustus-2024'),
(2017,'Pengumuman Seleksi Umum Jasa Konsultan Kajian Pengembangan Model Proyeksi Finansial 2.0','http://plniconplus.co.id/eproc/pengumuman-seleksi-umum-jasa-konsultan-kajian-pengembangan-model-proyeksi-finansial-2-0/','','2024-10-24 10:43:53.025355','08-Agustus-2024'),
(2018,'3625 – Jasa Penyedia Pengadaan Link Samarinda – Berau 1 Gbps','http://plniconplus.co.id/eproc/3625-jasa-penyedia-pengadaan-link-samarinda-berau-1-gbps-2/','','2024-10-24 10:43:53.480798','07-Agustus-2024'),
(2019,'Tender Terbuka – 3620 Jasa Penyedia Pengadaan Link Denpasar – Kupang 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-3620-jasa-penyedia-pengadaan-link-denpasar-kupang-10-gbps/','','2024-10-24 10:43:53.483650','06-Agustus-2024'),
(2020,'[3753] TENDER TERBUKA PASCAKUALIFIKASI PENGADAAN JASA SERVICE POINT RETAIL SBU REGIONAL SUMATERA BAGIAN TENGAH AREA SUMATERA BARAT','http://plniconplus.co.id/eproc/3753-tender-terbuka-pascakualifikasi-pengadaan-jasa-service-point-retail-sbu-regional-sumatera-bagian-tengah-area-sumatera-barat/','','2024-10-24 10:43:53.485803','06-Agustus-2024'),
(2021,'Tender Terbuka – 3672 Pengadaan IPv4 Aktivasi Publik','http://plniconplus.co.id/eproc/tender-terbuka-3672-pengadaan-ipv4-aktivasi-publik/','','2024-10-24 10:43:53.490387','05-Agustus-2024'),
(2022,'Penyediaan Perangkat SAN Switch Data Center','http://plniconplus.co.id/eproc/penyediaan-perangkat-san-switch-data-center/','','2024-10-24 10:43:53.490387','02-Agustus-2024'),
(2023,'{3754} Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Jasa Service Point Retail SBU Regional Sumatera Bagian Tengah Area Riau dan Kepulauan Riau','http://plniconplus.co.id/eproc/3754-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-jasa-service-point-retail-sbu-regional-sumatera-bagian-tengah-area-riau-dan-kepulauan-riau/','','2024-10-24 10:43:53.840265','02-Agustus-2024'),
(2024,'[2722] Pengumuman Tender Terbuka Pascakualifikasi_Penyediaan Tenaga Kerja Operasional Managed Service SDWAN','http://plniconplus.co.id/eproc/2722-pengumuman-tender-terbuka-pascakualifikasi_penyediaan-tenaga-kerja-operasional-managed-service-sdwan/','','2024-10-24 10:43:53.849585','01-Agustus-2024'),
(2025,'3009 – PENGADAAN JASA PENYEDIAAN LINK SURABAYA – MAKASAR','http://plniconplus.co.id/eproc/3009-pengadaan-jasa-penyediaan-link-surabaya-makasar/','','2024-10-24 10:43:53.852586','31-Juli-2024'),
(2026,'Tender Terbuka – 3989 Pembangunan Sistem PTT Over Celluler (POC) untuk Layanan PLN','http://plniconplus.co.id/eproc/tenter-terbuka-3989-pembangunan-sistem-ptt-over-celluler-poc-untuk-layanan-pln/','','2024-10-24 10:43:53.855571','31-Juli-2024'),
(2027,'3622 – Jasa Penyedia Pengadaan Link Denpasar – Timika 50 Mbps','http://plniconplus.co.id/eproc/3622-jasa-penyedia-pengadaan-link-denpasar-timika-50-mbps/','','2024-10-24 10:43:53.858797','30-Juli-2024'),
(2028,'Tender Terbuka – 3278 Jasa Penyedia Pengadaan Link Pekanbaru – Tanjung Pinang 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-3278-jasa-penyedia-pengadaan-link-pekanbaru-tanjung-pinang-10-gbps/','','2024-10-24 10:43:54.254158','30-Juli-2024'),
(2029,'(1711)- Pengumuman Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Wilayah Aceh Pantai Barat','http://plniconplus.co.id/eproc/1711-pengumuman-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-wilayah-aceh-pantai-barat/','','2024-10-24 10:43:54.256909','30-Juli-2024'),
(2030,'(1710)-Tender Terbuka Pengadaan Jasa Borongan Service Point SBU Regional SUMBAGUT Wilayah Aceh Pantai Timur','http://plniconplus.co.id/eproc/1710-tender-terbuka-pengadaan-jasa-borongan-service-point-sbu-regional-sumbagut-wilayah-aceh-pantai-timur/','','2024-10-24 10:43:54.260139','30-Juli-2024'),
(2031,'[2807] Tender Terbuka Pascakualifikasi Pengadaan KHS Ekspedisi','http://plniconplus.co.id/eproc/2807-tender-terbuka-pascakualifikasi-pengadaan-khs-ekspedisi/','','2024-10-24 10:43:54.262191','30-Juli-2024'),
(2032,'Tender Terbuka – 3601 Jasa Penyedia Pengadaan Link Balikpapan – Banjarmasin 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-3601-jasa-penyedia-pengadaan-link-balikpapan-banjarmasin-10-gbps/','','2024-10-24 10:43:54.265196','25-Juli-2024'),
(2033,'[Perpanjangan] 3629 – Jasa Penyedia Pengadaan Link Samarinda – Tarakan 100 Mbps','http://plniconplus.co.id/eproc/perpanjangan-3629-jasa-penyedia-pengadaan-link-samarinda-tarakan-100-mbps/','','2024-10-24 10:43:54.674574','24-Juli-2024'),
(2034,'Tender Terbuka – 3442 Pengadaan Router BNG 128K Subs','http://plniconplus.co.id/eproc/tender-terbuka-3442-pengadaan-router-bng-128k-subs/','','2024-10-24 10:43:54.677330','23-Juli-2024'),
(2035,'3623 – Pengadaan SFP XFP dan QSFP untuk Sparepart Gangguan','http://plniconplus.co.id/eproc/3623-pengadaan-sfp-xfp-dan-qsfp-untuk-sparepart-gangguan/','','2024-10-24 10:43:54.680331','22-Juli-2024'),
(2036,'3629 – Jasa Penyedia Pengadaan Link Samarinda – Tarakan 100 Mbps','http://plniconplus.co.id/eproc/3629-jasa-penyedia-pengadaan-link-samarinda-tarakan-100-mbps/','','2024-10-24 10:43:54.682543','22-Juli-2024'),
(2037,'3625 – Jasa Penyedia Pengadaan Link Samarinda – Berau 1 Gbps','http://plniconplus.co.id/eproc/3625-jasa-penyedia-pengadaan-link-samarinda-berau-1-gbps/','','2024-10-24 10:43:54.685649','22-Juli-2024'),
(2038,'2640 – Jasa Penyedia Pengadaan Link Jakarta – Lampung 100G (1)','http://plniconplus.co.id/eproc/2640-jasa-penyedia-pengadaan-link-jakarta-lampung-100g-1/','','2024-10-24 10:43:55.062476','18-Juli-2024'),
(2039,'2551 – Jasa Penyedia Pengadaan Link Jambi (2) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/2551-jasa-penyedia-pengadaan-link-jambi-2-singapore-100-gbps-2/','','2024-10-24 10:43:55.065427','16-Juli-2024'),
(2040,'Tender Terbuka – 3275 Jasa Penyedia Pengadaan Link Denpasar – Sumbawa 500 Mbps','http://plniconplus.co.id/eproc/tender-terbuka-3275-jasa-penyedia-pengadaan-link-denpasar-sumbawa-500-mbps/','','2024-10-24 10:43:55.068396','12-Juli-2024'),
(2041,'Tender Terbuka – 2553 Jasa Penyedia Pengadaan Link Jakarta IDC (3) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2553-jasa-penyedia-pengadaan-link-jakarta-idc-3-singapore-100-gbps-2/','','2024-10-24 10:43:55.071491','12-Juli-2024'),
(2042,'3611 – Pengumuman Tender Terbuka “Penugasan PLN Penambahan Kapasitas NAS STI”','http://plniconplus.co.id/eproc/3611-pengumuman-tender-terbuka-penugasan-pln-penambahan-kapasitas-nas-sti/','','2024-10-24 10:43:55.082401','12-Juli-2024'),
(2043,'2741 – Jasa Penyedia Pengadaan Link Jakarta – Pekanbaru 100G (2)','http://plniconplus.co.id/eproc/2741-jasa-penyedia-pengadaan-link-jakarta-pekanbaru-100g-2/','','2024-10-24 10:43:55.463533','11-Juli-2024'),
(2044,'Pengumuman Tender Terbuka Pascakualifikasi No :  3562/PUM/08/PST/2024','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-no-3562-pum-08-pst-2024/','','2024-10-24 10:43:55.466372','10-Juli-2024'),
(2045,'{3448} _ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Pengembangan Layanan Digital SAAS tahun 2024-2025','http://plniconplus.co.id/eproc/3448-_-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-pengembangan-layanan-digital-saas-tahun-2024-2025/','','2024-10-24 10:43:55.468890','05-Juli-2024'),
(2046,'[3437] Pengumuman Tender Terbuka_Pembangunan Gedung Kerja Baru Kantor PLN Icon Plus Gandul','http://plniconplus.co.id/eproc/3437-pengumuman-tender-terbuka_pembangunan-gedung-kerja-baru-kantor-pln-icon-plus-gandul/','','2024-10-24 10:43:55.471838','04-Juli-2024'),
(2047,'[3610] Pengumuman Tender Terbuka Penugasan PLN Pengadaan Support Perangkat Infrastruktur Jaringan PLN Pusat Eksisting','http://plniconplus.co.id/eproc/3610-pengumuman-tender-terbuka-penugasan-pln-pengadaan-support-perangkat-infrastruktur-jaringan-pln-pusat-eksisting/','','2024-10-24 10:43:55.475883','04-Juli-2024'),
(2048,'[3425] Pengumuman Tender Terbuka_Pembangunan Co Working Space Kantor PLN Icon Plus Gandul','http://plniconplus.co.id/eproc/3425-pengumuman-tender-terbuka_pembangunan-co-working-space-kantor-pln-icon-plus-gandul/','','2024-10-24 10:43:55.837665','03-Juli-2024'),
(2049,'Tender Terbuka – 2702 Jasa Penyedia Pengadaan Link Surabaya – Banjarmasin 100G (1)','http://plniconplus.co.id/eproc/tender-terbuka-2702-jasa-penyedia-pengadaan-link-surabaya-banjarmasin-100g-1-2/','','2024-10-24 10:43:55.840680','03-Juli-2024'),
(2050,'Penyediaan Tenaga Ahli Daya (TAD) Pemeliharaan Aplikasi Layanan Publik','http://plniconplus.co.id/eproc/penyediaan-tenaga-ahli-daya-tad-pemeliharaan-aplikasi-layanan-publik/','','2024-10-24 10:43:55.843686','02-Juli-2024'),
(2051,'(2976)-Lelang Terbuka Pengadaan dan Pemasangan Video Wall','http://plniconplus.co.id/eproc/2976-lelang-terbuka-pengadaan-dan-pemasangan-video-wall/','','2024-10-24 10:43:55.846681','02-Juli-2024'),
(2052,'(3481)- Lelang terbuka Pengadaan Pekerjaan Jasa Service Point Ritel SBU Sumbagsel Wilayah 2','http://plniconplus.co.id/eproc/3481-lelang-terbuka-pengadaan-pekerjaan-jasa-service-point-ritel-sbu-sumbagsel-wilayah-2/','','2024-10-24 10:43:55.848681','02-Juli-2024'),
(2053,'Pengembangan Baru dan Peningkatan Keandalan Layanan Radio','http://plniconplus.co.id/eproc/3270-pengembangan-baru-dan-peningkatan-keandalan-layanan-radio/','','2024-10-24 10:43:56.428931','02-Juli-2024'),
(2054,'Annual Technical Support (ATS) DC-DRC AP2T PLN','http://plniconplus.co.id/eproc/annual-technical-support-ats-dc-drc-ap2t-pln/','','2024-10-24 10:43:56.431635','26-Juni-2024'),
(2055,'PENGUMUMAN LELANG TERBUKA : Jasa Borongan Service Point Retail SBU Regional Sumatera Bagian Utara  (Paket-1, Paket-2 & Paket-3)','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-jasa-borongan-service-point-retail-sbu-regional-sumatera-bagian-utara-paket-1-paket-2-paket-3/','','2024-10-24 10:43:56.434886','26-Juni-2024'),
(2056,'Pengumuman Tender Terbuka Pengadaan Perangkat L2 Switch 10G 2024','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pengadaan-perangkat-l2-switch-10g-2024/','','2024-10-24 10:43:56.437200','25-Juni-2024'),
(2057,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Material KHS CCTV PTZ (3525)','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-material-khs-cctv-ptz-3525/','','2024-10-24 10:43:56.440206','24-Juni-2024'),
(2058,'2551 – Jasa Penyedia Pengadaan Link Jambi (2) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/2551-jasa-penyedia-pengadaan-link-jambi-2-singapore-100-gbps/','','2024-10-24 10:43:56.844582','10-Juni-2024'),
(2059,'Pengadaan Tender Terbuka “Jasa Penyedia Pengadaan Link Jakarta – Tanjung Pandan 10 Gbps”','http://plniconplus.co.id/eproc/pengadaan-tender-terbuka-jasa-penyedia-pengadaan-link-jakarta-tanjung-pandan-10-gbps/','','2024-10-24 10:43:56.849283','05-Juni-2024'),
(2060,'Tender Terbuka – Pengadaan Material QSFP 100G untuk Router Backbone Sumatera, Backbone Jawa dan Distribusi','http://plniconplus.co.id/eproc/tender-terbuka-pengadaan-material-qsfp-100g-untuk-router-backbone-sumatera-backbone-jawa-dan-distribusi/','','2024-10-24 10:43:56.852093','05-Juni-2024'),
(2061,'2983 – Jasa Penyedia Pengadaan Tools Monitoring Network Solarwind','http://plniconplus.co.id/eproc/2983-jasa-penyedia-pengadaan-tools-monitoring-network-solarwind-2/','','2024-10-24 10:43:56.855082','04-Juni-2024'),
(2062,'2895 – Jasa Pengadaan TAC Sandvine','http://plniconplus.co.id/eproc/2895-jasa-pengadaan-tac-sandvine/','','2024-10-24 10:43:56.858277','31-Mei-2024'),
(2063,'PENUGASAN PLN PENGADAAN SOLUSI INFRASTRUKTUR TERINTEGRASI SISTEM DATABASE PLN MOBILE','http://plniconplus.co.id/eproc/penugasan-pln-pengadaan-solusi-infrastruktur-terintegrasi-sistem-database-pln-mobile/','','2024-10-24 10:43:57.262223','31-Mei-2024'),
(2064,'Jasa Pengadaan TAC SkyCare Gilat','http://plniconplus.co.id/eproc/jasa-pengadaan-tac-skycare-gilat/','','2024-10-24 10:43:57.264240','31-Mei-2024'),
(2065,'Tender Terbuka – 2553 Jasa Penyedia Pengadaan Link Jakarta IDC (3) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2553-jasa-penyedia-pengadaan-link-jakarta-idc-3-singapore-100-gbps/','','2024-10-24 10:43:57.267240','30-Mei-2024'),
(2066,'Pengadaan KKHS Kabel Optik ADSS Kapasitas 6 Core','http://plniconplus.co.id/eproc/pengadaan-kkhs-kabel-optik-adss-kapasitas-6-core/','','2024-10-24 10:43:57.270278','29-Mei-2024'),
(2067,'KHS Pengadaan IPLC Surabaya-Singapore','http://plniconplus.co.id/eproc/khs-pengadaan-iplc-surabaya-singapore-2/','','2024-10-24 10:43:57.272762','28-Mei-2024'),
(2068,'Pengumuman Tender Terbuka “Pengadaan Switch 400G”','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pengadaan-switch-400g/','','2024-10-24 10:43:57.660365','27-Mei-2024'),
(2069,'Tender Terbuka –  2639 Jasa Penyedia Pengadaan Link Jakarta – Medan 100G (1)','http://plniconplus.co.id/eproc/tender-terbuka-2639-jasa-penyedia-pengadaan-link-jakarta-medan-100g-1/','','2024-10-24 10:43:57.660365','27-Mei-2024'),
(2070,'Tender Terbuka – 2555 Jasa Penyedia Pengadaan Link Pekanbaru (2) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2555-jasa-penyedia-pengadaan-link-pekanbaru-2-singapore-100-gbps/','','2024-10-24 10:43:57.660365','27-Mei-2024'),
(2071,'KHS Pengadaan IPLC Pekanbaru-Singapore','http://plniconplus.co.id/eproc/khs-pengadaan-iplc-pekanbaru-singapore-2/','','2024-10-24 10:43:57.670487','27-Mei-2024'),
(2072,'Tender Terbuka – 2702 Jasa Penyedia Pengadaan Link Surabaya – Banjarmasin 100G (1)','http://plniconplus.co.id/eproc/tender-terbuka-2702-jasa-penyedia-pengadaan-link-surabaya-banjarmasin-100g-1/','','2024-10-24 10:43:57.673968','21-Mei-2024'),
(2073,'Tender Terbuka – 3009 PENGADAAN JASA PENYEDIAAN LINK SURABAYA – MAKASAR','http://plniconplus.co.id/eproc/tender-terbuka-3009-pengadaan-jasa-penyediaan-link-surabaya-makasar/','','2024-10-24 10:43:58.078860','21-Mei-2024'),
(2074,'Jasa Penyedia Pengadaan Link Medan (3) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/jasa-penyedia-pengadaan-link-medan-3-singapore-100-gbps/','','2024-10-24 10:43:58.082315','21-Mei-2024'),
(2075,'PENGUMUMAN TENDER TERBUKA (3027 : Pengadaan Pekerjaan Jasa Service Point Ritel SBU Sumbagsel Wilayah 1','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-3027-pengadaan-pekerjaan-jasa-service-point-ritel-sbu-sumbagsel-wilayah-1/','','2024-10-24 10:43:58.085790','17-Mei-2024'),
(2076,'2983 – Jasa Penyedia Pengadaan Tools Monitoring Network Solarwind','http://plniconplus.co.id/eproc/2983-jasa-penyedia-pengadaan-tools-monitoring-network-solarwind/','','2024-10-24 10:43:58.085882','16-Mei-2024'),
(2077,'Lelang : Pengadaan Mic Conference Ruang Rapat Gedung Utama PLN Pusat','http://plniconplus.co.id/eproc/lelang-pengadaan-mic-conference-ruang-rapat-gedung-utama-pln-pusat/','','2024-10-24 10:43:58.090482','16-Mei-2024'),
(2078,'Tender Terbuka Pascakualifikasi- 2981-Pengadaan Akses Poin Outdoor Project Bakti','http://plniconplus.co.id/eproc/tender-terbuka-pascakualifikasi-2981-pengadaan-akses-poin-outdoor-project-bakti/','','2024-10-24 10:43:58.472551','15-Mei-2024'),
(2079,'Tender Terbuka – 2842 Pengadaan IPLC Bali-Singapore','http://plniconplus.co.id/eproc/tender-terbuka-2842-pengadaan-iplc-bali-singapore/','','2024-10-24 10:43:58.475493','15-Mei-2024'),
(2080,'Pengumuman Tender Terbuka Pascakualifikasi : 2976-Pengadaan dan Pemasangan Video Wall','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-2976-pengadaan-dan-pemasangan-video-wall/','','2024-10-24 10:43:58.478495','15-Mei-2024'),
(2081,'[2807] Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Ekspedisi','http://plniconplus.co.id/eproc/2807-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-ekspedisi/','','2024-10-24 10:43:58.481771','14-Mei-2024'),
(2082,'[2929] Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Material KHS Layanan Managed Service Router Bronze','http://plniconplus.co.id/eproc/2929-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-material-khs-layanan-managed-service-router-bronze/','','2024-10-24 10:43:58.485414','14-Mei-2024'),
(2083,'Tender Terbuka – 2825 Jasa Penyedia Pengadaan IP Transit Manado 20 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2825-jasa-penyedia-pengadaan-ip-transit-manado-20-gbps/','','2024-10-24 10:43:58.835075','14-Mei-2024'),
(2084,'Jasa Penyedia Pengadaan Link IPLC Batam (Graha Pena) – Singapore 20 Gbps (3)','http://plniconplus.co.id/eproc/jasa-penyedia-pengadaan-link-iplc-batam-graha-pena-singapore-20-gbps-3/','','2024-10-24 10:43:58.838867','14-Mei-2024'),
(2085,'Jasa Penyedia Pengadaan Link Jakarta – Pekanbaru 100G (2)','http://plniconplus.co.id/eproc/jasa-penyedia-pengadaan-link-jakarta-pekanbaru-100g-2/','','2024-10-24 10:43:58.842234','14-Mei-2024'),
(2086,'Tender Terbuka – 2990 JASA SUPPORT LAYANAN EOS PELANGGAN PUBLIK PUSAT – 4','http://plniconplus.co.id/eproc/tender-terbuka-2990-jasa-support-layanan-eos-pelanggan-publik-pusat-4/','','2024-10-24 10:43:58.845236','07-Mei-2024'),
(2087,'Pengadaan Jasa Konsultan Pelindungan Data Pribadi','http://plniconplus.co.id/eproc/pengadaan-jasa-konsultan-pelindungan-data-pribadi/','','2024-10-24 10:43:58.848235','07-Mei-2024'),
(2088,'Jasa Penyedia Pengadaan Link Jakarta – Pontianak 100 Gbps (1)','http://plniconplus.co.id/eproc/jasa-penyedia-pengadaan-link-jakarta-pontianak-100-gbps-1/','','2024-10-24 10:43:59.185222','06-Mei-2024'),
(2089,'[3110] Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Penambahan Akses VMS Lt. 14 dan Lt. 15 Direktorat Mega Proyek PLN Kantor Pusat','http://plniconplus.co.id/eproc/3110-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-penambahan-akses-vms-lt-14-dan-lt-15-direktorat-mega-proyek-pln-kantor-pusat/','','2024-10-24 10:43:59.192668','03-Mei-2024'),
(2090,'Pengumuman Tender Terbuka “Jasa Penyedia Pengadaan Link Jakarta – Lampung 100G (1)”','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-jasa-penyedia-pengadaan-link-jakarta-lampung-100g-1/','','2024-10-24 10:43:59.195655','03-Mei-2024'),
(2091,'Perpanjangan Pengumuman Lelang Terbuka – Jasa Penyedia Pengadaan License Allot Bandwidth Management','http://plniconplus.co.id/eproc/perpanjangan-pengumuman-lelang-terbuka-jasa-penyedia-pengadaan-license-allot-bandwidth-management/','','2024-10-24 10:43:59.198646','30-April-2024'),
(2092,'2937_Pengadaan Tender Terbuka Pascakualifikasi Penyediaan Annual Technical Support (ATS) Perangkat Cisco Data Center','http://plniconplus.co.id/eproc/2937_pengadaan-tender-terbuka-pascakualifikasi-penyediaan-annual-technical-support-ats-perangkat-cisco-data-center/','','2024-10-24 10:43:59.201694','29-April-2024'),
(2093,'Pengumuman Lelang Terbuka – Jasa Penyedia Pengadaan License Allot Bandwidth Management','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-jasa-penyedia-pengadaan-license-allot-bandwidth-management/','','2024-10-24 10:43:59.573359','26-April-2024'),
(2094,'Jasa Pengadaan TAC Sandvine','http://plniconplus.co.id/eproc/jasa-pengadaan-tac-sandvine/','','2024-10-24 10:43:59.575369','25-April-2024'),
(2095,'Lelang Terbuka “Penugasan PLN Pengadaan Distribution Switch Gedung 1 PLN Pusat”','http://plniconplus.co.id/eproc/lelang-terbuka-penugasan-pln-pengadaan-distribution-switch-gedung-1-pln-pusat/','','2024-10-24 10:43:59.578357','25-April-2024'),
(2096,'KHS Pengadaan IPLC Surabaya-Singapore','http://plniconplus.co.id/eproc/khs-pengadaan-iplc-surabaya-singapore/','','2024-10-24 10:43:59.580358','24-April-2024'),
(2097,'KHS Pengadaan IPLC Jakarta-Singapore','http://plniconplus.co.id/eproc/khs-pengadaan-iplc-jakarta-singapore/','','2024-10-24 10:43:59.583511','23-April-2024'),
(2098,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Akses Poin Indoor Layanan I-win dan WiFin','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-akses-poin-indoor-layanan-i-win-dan-wifin/','','2024-10-24 10:43:59.939903','23-April-2024'),
(2099,'KHS Pengadaan IPLC Pekanbaru-Singapore','http://plniconplus.co.id/eproc/khs-pengadaan-iplc-pekanbaru-singapore/','','2024-10-24 10:43:59.943230','22-April-2024'),
(2100,'Tender Terbuka – 2781 JASA SUPPORT LAYANAN EOS PELANGGAN PUBLIK PUSAT – 3','http://plniconplus.co.id/eproc/tender-terbuka-2781-jasa-support-layanan-eos-pelanggan-publik-pusat-3/','','2024-10-24 10:43:59.944716','22-April-2024'),
(2101,'{2692} _ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Perkuatan Infrastruktur Komunikasi untuk mendukung kehandalan operasi sistem Aceh','http://plniconplus.co.id/eproc/2692-_-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-perkuatan-infrastruktur-komunikasi-untuk-mendukung-kehandalan-operasi-sistem-aceh/','','2024-10-24 10:43:59.948607','19-April-2024'),
(2102,'2954_Pengadaan Tender Terbuka Pascakualifikasi Pengadaan Mobile Monitoring Pelanggan Kementerian Energi dan Sumber Data Mineral','http://plniconplus.co.id/eproc/2954_pengadaan-tender-terbuka-pascakualifikasi-pengadaan-mobile-monitoring-pelanggan-kementerian-energi-dan-sumber-data-mineral/','','2024-10-24 10:43:59.952620','19-April-2024'),
(2103,'2999_Pegumuman Tender Terbuka Pascakualifikasi Pengadaan Perangkat Command Center, Pembangunan Interior dan Public Announcement di PT Pertamina Lubricants','http://plniconplus.co.id/eproc/2999_pegumuman-tender-terbuka-pascakualifikasi-pengadaan-perangkat-command-center-pembangunan-interior-dan-public-announcement-di-pt-pertamina-lubricants/','','2024-10-24 10:44:00.374513','19-April-2024'),
(2104,'Pengumuman Tender Terbuka Pascakualifikasi “PENGADAAN JASA PENYEDIAAN LINK SURABAYA – MAKASAR”','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-jasa-penyediaan-link-surabaya-makasar/','','2024-10-24 10:44:00.376522','18-April-2024'),
(2105,'Pengumuman Tender Terbuka Pascakualifikasi Pekerjaan Perbaikan Dak Beton Kantor PLN Icon Plus Gandul','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pekerjaan-perbaikan-dak-beton-kantor-pln-icon-plus-gandul/','','2024-10-24 10:44:00.379519','04-April-2024'),
(2106,'2664_Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Pakaian Seragam Contact Center 123','http://plniconplus.co.id/eproc/2664_pengumuman-tender-terbuka-pascakualifikasi-pengadaan-pakaian-seragam-contact-center-123/','','2024-10-24 10:44:00.382735','02-April-2024'),
(2107,'2747_ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan FOC ADSS untuk Pembangunan Jaringan ICT di Kawasan Industri Terpadu Batang','http://plniconplus.co.id/eproc/2747_-pengumuman-tendeer-terbuka-pascakualifikasi-pengadaan-foc-adss-untuk-pembangunan-jaringan-ict-di-kawasan-industri-terpadu-batang/','','2024-10-24 10:44:00.384845','01-April-2024'),
(2108,'Tender Terbuka – 2805 Jasa Penyedia Pengadaan Link Denpasar – Kupang 10 Gbps','http://plniconplus.co.id/eproc/lelang-terbuka-2805-jasa-penyedia-pengadaan-link-denpasar-kupang-10-gbps/','','2024-10-24 10:44:00.736688','27-Maret-2024'),
(2109,'Tender Terbuka – Sewa link to Singapore','http://plniconplus.co.id/eproc/tender-terbuka-sewa-link-to-singapore/','','2024-10-24 10:44:00.740688','27-Maret-2024'),
(2110,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Jakarta – Toboali 10 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-jakarta-toboali-10-gbps/','','2024-10-24 10:44:00.743692','25-Maret-2024'),
(2111,'Pengumuman Tender Terbuka Pascakualifikasi  Jasa Penyedia Pengadaan Link Denpasar-Labuan Bajo 200 Mbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-denpasar-labuan-bajo-200-mbps/','','2024-10-24 10:44:00.746677','25-Maret-2024'),
(2112,'Lelang “Telekomunikasi Outbound Contact Center ICONNET”','http://plniconplus.co.id/eproc/lelang-telekomunikasi-outbound-contact-center-iconnet/','','2024-10-24 10:44:00.752058','20-Maret-2024'),
(2113,'Tender Terbuka – 2710 Pengadaan Switch 400G','http://plniconplus.co.id/eproc/tendrer-terbuka-2710-pengadaan-switch-400g/','','2024-10-24 10:44:01.087545','19-Maret-2024'),
(2114,'2324 _ Pengumuman Tender Terbuka Pengadaan Jasa Pemeliharaan PAC Data Center','http://plniconplus.co.id/eproc/2324-_-pengumuman-lelang-terbuka-pengadaan-jasa-pemeliharaan-pac-data-center/','','2024-10-24 10:44:01.090626','08-Maret-2024'),
(2115,'Tender Terbuka – 2256 Pengadaan KHS Eksternal Alarm TSM untuk Sparepart Gangguan','http://plniconplus.co.id/eproc/tender-terbuka-2256-pengadaan-khs-eksternal-alarm-tsm-untuk-sparepart-gangguan/','','2024-10-24 10:44:01.093627','06-Maret-2024'),
(2116,'Pengumuman Tender Terbuka Pascakualifikasi Harmonisasi CoA PT Aviasi Pariwisata Indonesia (InJourney)','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-harmonisasi-coa-pt-aviasi-pariwisata-indonesia-injourney/','','2024-10-24 10:44:01.095626','22-Februari-2024'),
(2117,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Pengembangan Aplikasi Human Capital Information System (HCIS) PT Pelayaran Bahtera Adhiguna (Pengadaan Ulang)','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-pengembangan-aplikasi-human-capital-information-system-hcis-pt-pelayaran-bahtera-adhiguna-pengadaan-langsung/','','2024-10-24 10:44:01.098625','20-Februari-2024'),
(2118,'Pengumuman Tender Terbuka Jasa Penyedia Pengadaan Link Makassar – Manado 20 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-jasa-penyedia-pengadaan-link-makassar-manado-20-gbps/','','2024-10-24 10:44:01.539589','13-Februari-2024'),
(2119,'Tender Terbuka – 2094 Jasa Penyedia Pengadaan Link Backbone Medan – Aceh 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-2094-jasa-penyedia-pengadaan-link-backbone-medan-aceh-10-gbps/','','2024-10-24 10:44:01.542586','13-Februari-2024'),
(2120,'Tender Terbuka – 1932 Jasa Penyedia Pengadaan Link Denpasar – Kupang 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-1932-jasa-penyedia-pengadaan-link-denpasar-kupang-10-gbps-2/','','2024-10-24 10:44:01.545590','13-Februari-2024'),
(2121,'Pengumuman Tender Terbuka Jasa Penyedia Pengadaan Link Denpasar – Mataram 10 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-jasa-penyedia-pengadaan-link-denpasar-mataram-10-gbps/','','2024-10-24 10:44:01.549589','05-Februari-2024'),
(2122,'Pengumuman Tender Terbuka Pascakualifikasi Pemeliharaan Sistem Mail Blasting dan Marketing','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemeliharaan-sistem-mail-blasting-dan-marketing-2/','','2024-10-24 10:44:01.552587','05-Februari-2024'),
(2123,'(2019) : Pengumuman Tender Terbuka Pascakualifikasi Jasa Serpo Ritel Iconnet Jawa bagian Tengah','http://plniconplus.co.id/eproc/2019-pengumuman-tender-terbuka-pascakualifikasi-jasa-serpo-ritel-iconnet-jawa-bagian-tengah/','','2024-10-24 10:44:01.929009','01-Februari-2024'),
(2124,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Pengembangan Aplikasi Human Capital Information System (HCIS) PT Pelayaran Bahtera Adhiguna','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-pengembangan-aplikasi-human-capital-information-system-hcis-pt-pelayaran-bahtera-adhiguna/','','2024-10-24 10:44:01.934206','25-Januari-2024'),
(2125,'Terder Terbuka – 2094 Jasa Penyedia Pengadaan Link Backbone Medan – Aceh 10 Gbps','http://plniconplus.co.id/eproc/terder-terbuka-2094-jasa-penyedia-pengadaan-link-backbone-medan-aceh-10-gbps/','','2024-10-24 10:44:01.934206','16-Januari-2024'),
(2126,'Tender Terbuka – 1932 Jasa Penyedia Pengadaan Link Denpasar – Kupang 10 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-1932-jasa-penyedia-pengadaan-link-denpasar-kupang-10-gbps/','','2024-10-24 10:44:01.940980','16-Januari-2024'),
(2127,'(2386) : Pengumuman Lelang Terbuka Pengadaan Material Aktivasi ISEE PT Pupuk Indonesia','http://plniconplus.co.id/eproc/2386-pengumuman-lelang-terbuka-pengadaan-material-aktivasi-isee-pt-pupuk-indonesia/','','2024-10-24 10:44:01.945003','15-Januari-2024'),
(2128,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan QSFP+ 100G untuk Sparepart Gangguan','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-qsfp-100g-untuk-sparepart-gangguan/','','2024-10-24 10:44:02.314544','09-Januari-2024'),
(2129,'Pengumuman Tender Terbuka Pascakualifikasi  Pemeliharaan Sistem Mail Blasting dan Marketing','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemeliharaan-sistem-mail-blasting-dan-marketing/','','2024-10-24 10:44:02.319712','09-Januari-2024'),
(2130,'Pengumuman Tender Terbuka Pascakualifikasi SAP COMPETENCY DEVELOPMENT PROGRAM','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-sap-competency-development-program/','','2024-10-24 10:44:02.321712','09-Januari-2024'),
(2131,'607 _ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Perangkat Management Video Survilance dan Recording','http://plniconplus.co.id/eproc/607-_-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-perangkat-management-video-survilance-dan-recording/','','2024-10-24 10:44:02.324712','09-Januari-2024'),
(2132,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Makassar – Manado 20 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-makassar-manado-20-gbps-3/','','2024-10-24 10:44:02.326712','09-Januari-2024'),
(2133,'Pengumuman Tender Terbuka Pekerjaan Furnishing Gedung Kantor Mampang Lantai 2 untuk Ruang Contact Center Iconnet','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pekerjaan-furnishing-gedung-kantor-mampang-lantai-2-untuk-ruang-contact-center-iconnet/','','2024-10-24 10:44:02.817942','08-Januari-2024'),
(2134,'Lelang Terbuka Telekomunikasi Outbound Contact Center ICONNET','http://plniconplus.co.id/eproc/lelang-terbuka-telekomunikasi-outbound-contact-center-iconnet/','','2024-10-24 10:44:02.821902','08-Januari-2024'),
(2135,'Pengadaan Jasa Serpo Ritel Area Bandung Cimahi, Cianjur – KBB, Kumayu, Cirebon, Garut, Purwasuka, Malamis, Panganjar, Sukabumi, Sumedang','http://plniconplus.co.id/eproc/pengadaan-jasa-serpo-ritel-area-bandung-cimahi-cianjur-kbb-kumayu-cirebon-garut-purwasuka-malamis-panganjar-sukabumi-sumedang/','','2024-10-24 10:44:02.825202','04-Januari-2024'),
(2136,'Pengumuman Tender Terbuka Pascakualifikasi KHS CPE L3 10G','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-khs-cpe-l3-10g/','','2024-10-24 10:44:02.829177','28-Desember-2023'),
(2137,'Penyediaan pemeliharaan dan Annual Technical Support (ATS) Sistem Contact Center PLN 123','http://plniconplus.co.id/eproc/penyediaan-pemeliharaan-dan-annual-technical-support-ats-sistem-contact-center-pln-123/','','2024-10-24 10:44:02.831383','21-Desember-2023'),
(2138,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Kamera Group','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-kamera-group-2/','','2024-10-24 10:44:03.207634','20-Desember-2023'),
(2139,'KHS SFP untuk Kebutuhan Penyambungan Baru Pelanggan','http://plniconplus.co.id/eproc/khs-sfp-untuk-kebutuhan-penyambungan-baru-pelanggan/','','2024-10-24 10:44:03.211444','19-Desember-2023'),
(2140,'Pengumuman Tender Terbuka Pascakualifikasi PEMUTAKHIRAN LISENSI ENDPOINT DAN SERVER ANTI-VIRUS SOPHOS','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemutakhiran-lisensi-endpoint-dan-server-anti-virus-sophos/','','2024-10-24 10:44:03.215413','12-Desember-2023'),
(2141,'KHS AKTIVASI MULTIVENDOR TAHAP 3 UNTUK PELANGGAN RETAIL ICONNET','http://plniconplus.co.id/eproc/khs-aktivasi-multivendor-tahap-3-untuk-pelanggan-retail-iconnet/','','2024-10-24 10:44:03.219507','08-Desember-2023'),
(2142,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Jasa Pemborongan Pekerjaan Operasional Bidang Pelayanan IT PLN 2024','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-jasa-pemborongan-pekerjaan-operasional-bidang-pelayanan-it-pln-2024/','','2024-10-24 10:44:03.223064','01-Desember-2023'),
(2143,'Pengumuman Tender Terbuka Pascakualifikasi Project Jasa Pengamanan (Satpam)','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-project-jasa-pengamanan-satpam/','','2024-10-24 10:44:03.606732','30-November-2023'),
(2144,'Lelang Terbuka : Pengadaan IP Publik Corporate Subnet 20','http://plniconplus.co.id/eproc/lelang-terbuka-pengadaan-ip-publik-corporate-subnet-20/','','2024-10-24 10:44:03.610134','29-November-2023'),
(2145,'Lelang Terbuka – Pengadaan Kebutuhan IPv4 Premium','http://plniconplus.co.id/eproc/lelang-terbuka-pengadaan-kebutuhan-ipv4-premium/','','2024-10-24 10:44:03.613661','29-November-2023'),
(2146,'1793 _ Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Router untuk Project Aktivasi SBU SBT','http://plniconplus.co.id/eproc/1793-_-pengumuman-tender-terbuka-pascakualifikasi-pengadaan-router-untuk-project-aktivasi-sbu-sbt/','','2024-10-24 10:44:03.616893','29-November-2023'),
(2147,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Makassar – Manado 20 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-makassar-manado-20-gbps-2/','','2024-10-24 10:44:03.619948','24-November-2023'),
(2148,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Surabaya – Banjarmasin 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-surabaya-banjarmasin-100-gbps/','','2024-10-24 10:44:04.018419','16-November-2023'),
(2149,'Tender Terbuka – 1498 Jasa Penyedia Pengadaan Link Jakarta – Belitung 5 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-1498-jasa-penyedia-pengadaan-link-jakarta-belitung-5-gbps/','','2024-10-24 10:44:04.024418','16-November-2023'),
(2150,'(1699) : Pengumuman Lelang Terbuka Pengadaan Perangkat Firewall Untuk Pemenuhan Aktivasi Pelanggan PTPN IV','http://plniconplus.co.id/eproc/1699-pengumuman-lelang-terbuka-pengadaan-perangkat-firewall-untuk-pemenuhan-aktivasi-pelanggan-ptpn-iv/','','2024-10-24 10:44:04.027420','10-November-2023'),
(2151,'Pengumuman Lelang Terbuka Telekomunikasi Outbound Contact Center ICONNET','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-telekomunikasi-outbound-contact-center-iconnet/','','2024-10-24 10:44:04.031419','09-November-2023'),
(2152,'Pengumuman Lelang Terbuka Pengadaan Jasa Tenaga Kerja Contact Center PLN 123','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-tenaga-kerja-contact-center-pln-123/','','2024-10-24 10:44:04.033705','09-November-2023'),
(2153,'Tender Terbuka 1219 Jasa Penyedia Pengadaan Link Surabaya – Makassar 100 Gbps','http://plniconplus.co.id/eproc/tender-terbuka-1219-jasa-penyedia-pengadaan-link-surabaya-makassar-100-gbps/','','2024-10-24 10:44:04.410620','09-November-2023'),
(2154,'Pengumuman Tender Terbuka Pascakualifikasi Pekerjaan Renovasi Gedung Kantor Mampang Lantai 2 untuk Ruang Contact Center Iconnet','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-administrasi-dan-umum/','','2024-10-24 10:44:04.414640','08-November-2023'),
(2155,'Pengumuman Tender Terbuka 1577 Jasa Penyedia Pengadaan Link Denpasar – Mataram 50 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-1577-jasa-penyedia-pengadaan-link-denpasar-mataram-50-gbps/','','2024-10-24 10:44:04.417859','03-November-2023'),
(2156,'Pengadaan KHS Material Flash Activation Key CCTV','http://plniconplus.co.id/eproc/34475-2/','','2024-10-24 10:44:04.420858','03-November-2023'),
(2157,'126 _ Pengumuman Tender Terbuka Pascakualifikasi  Pengadaan Office 2021 Contact Center PLN 123','http://plniconplus.co.id/eproc/126-_-pengumuman-tender-terbuka-pascaprakualifikasii-pembangunan-office-2021-contact-center-pln-123/','','2024-10-24 10:44:04.423914','31-Oktober-2023'),
(2158,'Pengadaan Windows 11 Pro untuk Contact Center PLN 123','http://plniconplus.co.id/eproc/pengadaan-windows-11-pro-untuk-contact-center-pln-123/','','2024-10-24 10:44:04.759835','26-Oktober-2023'),
(2159,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Kamera Group','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-kamera-group/','','2024-10-24 10:44:04.762170','26-Oktober-2023'),
(2160,'Tender Terbuka – 1371 Jasa Borongan Penyediaan Tenaga Kerja Operasional Monitoring Surveillance Pelanggan Enterprise dan VVIP','http://plniconplus.co.id/eproc/tender-terbuka-1371-jasa-borongan-penyediaan-tenaga-kerja-operasional-monitoring-surveillance-pelanggan-enterprise-dan-vvip/','','2024-10-24 10:44:04.766172','26-Oktober-2023'),
(2161,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Makassar – Manado 20 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-makassar-manado-20-gbps/','','2024-10-24 10:44:04.769178','26-Oktober-2023'),
(2162,'Pengumuman Lelang Terbuka – 1081 Pengadaan KHS CPE L2 10G DC untuk Sparepart Gangguan','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-1081-pengadaan-khs-cpe-l2-10g-dc-untuk-sparepart-gangguan/','','2024-10-24 10:44:04.772754','24-Oktober-2023'),
(2163,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link IPLC Jambi – Singapore 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-iplc-jambi-singapore-100-gbps/','','2024-10-24 10:44:05.163531','24-Oktober-2023'),
(2164,'Pengumuman Lelang Terbuka 1498 Jasa Penyedia Pengadaan Link Jakarta – Belitung 5 Gbps','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-1498-jasa-penyedia-pengadaan-link-jakarta-belitung-5-gbps/','','2024-10-24 10:44:05.167771','24-Oktober-2023'),
(2165,'Pengumuman Lelang Terbuka Pengadaan Jasa Penarikan Kabel Tower ADSS GI Air Raja – GI Kijang','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-penarikan-kabel-tower-adss-gi-air-raja-gi-kijang/','','2024-10-24 10:44:05.170810','20-Oktober-2023'),
(2166,'Pengadaan Penghargaan Cindera Mata Koin Emas Masa Kerja 8 (Delapan) Dan 16 (Enam Belas) Tahun','http://plniconplus.co.id/eproc/pengadaan-penghargaan-cindera-mata-koin-emas-masa-kerja-8-delapan-dan-16-enam-belas-tahun-2/','','2024-10-24 10:44:05.174758','19-Oktober-2023'),
(2167,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaaan KHS Akses Poin Outdoor','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaaan-khs-akses-poin-outdoor/','','2024-10-24 10:44:05.177757','19-Oktober-2023'),
(2168,'{1315 }Pendaftaran Tender Terbuka Pascakualifikasi Penyediaan Jasa Pendukung Pemeliharaan Aplikasi','http://plniconplus.co.id/eproc/1315-pendaftaran-tender-terbuka-pascakualifikasi-penyediaan-jasa-pendukung-pemeliharaan-aplikasi/','','2024-10-24 10:44:05.549877','17-Oktober-2023'),
(2169,'Pengumuman Lelang Terbuka 1533 Penyediaan Redudansi Link Kabel Laut Jawa Bali','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-1533-penyediaan-redudansi-link-kabel-laut-jawa-bali/','','2024-10-24 10:44:05.553877','13-Oktober-2023'),
(2170,'Pengadaan KHS Material Flash Activation Key CCTV','http://plniconplus.co.id/eproc/pengadaan-khs-material-flash-activation-key-cctv/','','2024-10-24 10:44:05.557051','12-Oktober-2023'),
(2171,'Pengadaan KHS SWITCH POE 24 PORT','http://plniconplus.co.id/eproc/pengadaan-khs-switch-poe-24-port/','','2024-10-24 10:44:05.559101','11-Oktober-2023'),
(2172,'Pengumuman Tender Terbuka Pascakualifikasi Jasa Penyedia Pengadaan Link Surabaya – Makassar 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-jasa-penyedia-pengadaan-link-surabaya-makassar-100-gbps/','','2024-10-24 10:44:05.562310','11-Oktober-2023'),
(2173,'Pengumuman Tender Terbuka Pascakualifikasi PEMBORONGAN PEKERJAAN PRODUKSI LANGSUNG BIDANG APLIKASI PLN KORPORAT – KORPORAT 2 DAN PROSES BISNIS OUTSOURCING','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-produksi-langsung-bidang-aplikasi-pln-korporat-korporat-2-dan-proses-bisnis-outsourcing/','','2024-10-24 10:44:05.978739','04-Oktober-2023'),
(2174,'Pengumuman Tender Terbuka Pascakualifikasi KHS PROJECT TEAM LEADER (PTL) AKTIVASI RETAIL','http://plniconplus.co.id/eproc/34365-2/','','2024-10-24 10:44:05.982477','04-Oktober-2023'),
(2175,'Pengadaan Penghargaan Cindera Mata Koin Emas Masa Kerja 8 (Delapan) Dan 16 (Enam Belas) Tahun','http://plniconplus.co.id/eproc/pengadaan-penghargaan-cindera-mata-koin-emas-masa-kerja-8-delapan-dan-16-enam-belas-tahun/','','2024-10-24 10:44:05.985587','03-Oktober-2023'),
(2176,'Pengumuman Lelang Terbuka – 1104 Pengadaan IPLC Jawa dan Sumatera','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-1104-pengadaan-iplc-jawa-dan-sumatera/','','2024-10-24 10:44:05.985587','02-Oktober-2023'),
(2177,'Pengumuman Tender Terbuka Pascakualifikasi Pengembangan Layanan Digital Saas Tahap II','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengembangan-layanan-digital-saas-tahap-ii/','','2024-10-24 10:44:05.990437','27-September-2023'),
(2178,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan KHS Perangkat Management dan Recording Video Survilance','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-khs-perangkat-management-dan-recording-video-survilance/','','2024-10-24 10:44:06.384869','27-September-2023'),
(2179,'Pengumuman Lelalng Terbuka – 472 Pengadaan IPLC Semarang – Singapore','http://plniconplus.co.id/eproc/pengumuman-lelalng-terbuka-472-pengadaan-iplc-semarang-singapore/','','2024-10-24 10:44:06.388083','27-September-2023'),
(2180,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Jasa Penyediaan Link Surabaya – Banjarmasin 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-jasa-penyediaan-link-surabaya-banjarmasin-100-gbps/','','2024-10-24 10:44:06.390098','26-September-2023'),
(2181,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Perangkat Interactive Display Smart Board','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-perangkat-interactive-display-smart-board/','','2024-10-24 10:44:06.392787','26-September-2023'),
(2182,'Pengumuman Tender Terbuka Pascakualifikasi – 907 – Jasa Penyedia Pengadaan Link Jakarta – Pontianak 50 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-907-jasa-penyedia-pengadaan-link-jakarta-pontianak-50-gbps/','','2024-10-24 10:44:06.396445','26-September-2023'),
(2183,'Pengumuman Tender Terbuka Pascakualifikasi PEMBORONGAN PEKERJAAN PRODUKSI LANGSUNG SUB BIDANG APLIKASI PLN – PELAYANAN PELANGGAN DAN PROSES BISNIS OUTSOURCING PT PLN ICON PLUS','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-produksi-langsung-sub-bidang-aplikasi-pln-pelayanan-pelanggan-dan-proses-bisnis-outsourcing-pt-pln-icon-plus/','','2024-10-24 10:44:06.779881','25-September-2023'),
(2184,'Pengumuman Tender Terbuka Pascakualifikasi Pemborongan Pekerjaan Produksi Langsung Sub Bidang Aplikasi PLN Korporat 1 Dan Proses Bisnis Outsourcing','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-produksi-langsung-sub-bidang-aplikasi-pln-korporat-1-dan-proses-bisnis-outsourcing/','','2024-10-24 10:44:06.784073','25-September-2023'),
(2185,'Pengumuman Tender Terbuka Jasa Penyedia Pengadaan Link Jakarta (CDC) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-jasa-penyedia-pengadaan-link-jakarta-cdc-singapore-100-gbps/','','2024-10-24 10:44:06.785395','25-September-2023'),
(2186,'Pengumuman Tender Terbuka Pascakualifikasi Penugasan PLN Pengadaan Server Database PLN Mobile','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-penugasan-pln-pengadaan-server-database-pln-mobile/','','2024-10-24 10:44:06.792730','22-September-2023'),
(2187,'Pengumuman Lelang Terbuka Penugasan Pengadaan Server Aplikasi Baremetal PLN Mobile','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-penugasan-pengadaan-server-aplikasi-baremetal-pln-mobile/','','2024-10-24 10:44:06.797619','21-September-2023'),
(2188,'Pengumuman Tender Terbuka – 932 KHS Switch CPE L2 10G','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-932-khs-switch-cpe-l2-10g/','','2024-10-24 10:44:07.211998','21-September-2023'),
(2189,'Pengumuman Lelang Terbuka – 956 – Jasa Penyedia Pengadaan Link IPLC Surabaya – Singapore 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-956-jasa-penyedia-pengadaan-link-iplc-surabaya-singapore-100-gbps/','','2024-10-24 10:44:07.214588','19-September-2023'),
(2190,'Pengumuman Tender Terbuka Pascakualifikasi – 955 – Jasa Penyedia Pengadaan Link IPLC Jambi – Singapore 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-955-jasa-penyedia-pengadaan-link-iplc-jambi-singapore-100-gbps/','','2024-10-24 10:44:07.217638','19-September-2023'),
(2191,'Pengumuman Tender Terbuka Pascakualifikasi – 954 – Jasa Penyedia Pengadaan Link IPLC Jakarta (IDC) – Singapore 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-954-jasa-penyedia-pengadaan-link-iplc-jakarta-idc-singapore-100-gbps/','','2024-10-24 10:44:07.220638','19-September-2023'),
(2192,'Lelang Terbuka 1081 Pengadaan KHS CPE L2 10G DC untuk Sparepart Gangguan','http://plniconplus.co.id/eproc/lelang-terbuka-1081-pengadaan-khs-cpe-l2-10g-dc-untuk-sparepart-gangguan/','','2024-10-24 10:44:07.224996','18-September-2023'),
(2193,'PLN Icon Plus Perkuat Sinergi dengan PTPN 7','http://plniconplus.co.id/eproc/pln-icon-plus-perkuat-sinergi-dengan-ptpn-7/','','2024-10-24 10:44:07.615155','06-September-2023'),
(2194,'Pengumuman Tender Terbuka Pascakualifikasi Pemborongan Pekerjaan Layanan Support Korporat','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-layanan-support-korporat/','','2024-10-24 10:44:07.618446','06-September-2023'),
(2195,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan Material KHS Layanan Manage Service Router Silver','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-material-khs-layanan-manage-service-router-silver/','','2024-10-24 10:44:07.621392','30-Agustus-2023'),
(2196,'Pengumuman Tender Terbuka Pascakualifikasi Pengadaan SIP Trunk Outbound Call Back Center PLN 123','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pengadaan-sip-trunk-outbound-call-back-center-pln-123/','','2024-10-24 10:44:07.625460','30-Agustus-2023'),
(2197,'Pengumuman Lelang Terbuka 910 KHS CPE L3 1G untuk Aktivasi','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-910-khs-cpe-l3-1g-untuk-aktivasi/','','2024-10-24 10:44:07.627441','25-Agustus-2023'),
(2198,'PENGUMUMAN TENDER TERBUKA PASCAKUALIFIKASI KHS Pengadaan IPv4 Publik Subnet 24','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-khs-pengadaan-ipv4-publik-subnet-24/','','2024-10-24 10:44:08.011928','25-Agustus-2023'),
(2199,'Pengumuman Tender Terbuka Pascakualifikasi Pemborongan Pekerjaan Jasa Keamanan Dan Kebersihan SBU Regional','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pascakualifikasi-pemborongan-pekerjaan-jasa-keamanan-dan-kebersihan-sbu-regional/','','2024-10-24 10:44:08.014405','25-Agustus-2023'),
(2200,'Pengumuman Tender Terbuka Jasa Penyedia Pengadaan Link Jakarta – Medan 100 Gbps','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-jasa-penyedia-pengadaan-link-jakarta-medan-100-gbps/','','2024-10-24 10:44:08.017742','22-Agustus-2023'),
(2201,'Pengumuman Lelang Terbuka Pengadaan Pekerjaan Jasa Borongan Unit Reaksi Cepat (URC) Wilayah KALIMANTAN 2023 – 2025 (Kalimantan Barat, Kalimantan Tengah & Kalimantan Timur)','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-pekerjaan-jasa-borongan-unit-reaksi-cepat-urc-wilayah-kalimantan-2023-2025-kalimantan-barat-kalimantan-tengah-kalimantan-timur/','','2024-10-24 10:44:08.020743','08-Agustus-2023'),
(2202,'Pengumuman Lelang Terbuka Pengadaan Pekerjaan Jasa Borongan Service Point (Serpo) Wilayah Kalimantan 2023 – 2025','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-pekerjaan-jasa-borongan-service-point-serpo-wilayah-kalimantan-2023-2025/','','2024-10-24 10:44:08.023172','04-Agustus-2023'),
(2203,'Pengumuman Lelang JASA INSTALASI AKTIVASI BATCH 2 TAHUN 2023','http://plniconplus.co.id/eproc/pengumuman-lelang-jasa-instalasi-aktivasi-batch-2-tahun-2023/','','2024-10-24 10:44:08.449333','27-Juli-2023'),
(2204,'(149)-LELANG TERBUKA : Pengadaan Pekerjaan Jasa Borongan Unit Reaksi Cepat (URC) Wilayah KALIMANTAN SELATAN 2023 – 2025','http://plniconplus.co.id/eproc/149-lelang-terbuka-pengadaan-pekerjaan-jasa-borongan-unit-reaksi-cepat-urc-wilayah-kalimantan-selatan-2023-2025/','','2024-10-24 10:44:08.452259','13-Juli-2023'),
(2205,'PENGUMUMAN TENDER TERBUKA PASCA KUALIFIKASI KKHS DROP WIRE ICONNET 2023','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pasca-kualifikasi-kkhs-drop-wire-iconnet-2023/','','2024-10-24 10:44:08.455637','23-Juni-2023'),
(2206,'Pengumuman Tender Terbuka Pengadaan Jasa Instalasi dan Material Aksesoris FOC ADSS Segmen GI Nguntoronadi to GI Pacitan','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pengadaan-jasa-instalasi-dan-material-aksesoris-foc-adss-segmen-gi-nguntoronadi-to-gi-pacitan/','','2024-10-24 10:44:08.459452','22-Juni-2023'),
(2207,'Pengumuman Tender Terbuka Pengadaan Infrastruktur Meter Data Management System Tahap 2','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pengadaan-infrastruktur-meter-data-management-system-tahap-2/','','2024-10-24 10:44:08.462196','09-Juni-2023'),
(2208,'Pengumuman Tender Terbuka Pengadaan Jasa Borongan Unit Reaksi Cepat Tahun (URC) PLN 2023 SBU Regional Jawa Bagian Tengah','http://plniconplus.co.id/eproc/pengumuman-tender-terbuka-pengadaan-jasa-borongan-unit-reaksi-cepat-tahun-urc-pln-2023-sbu-regional-jawa-bagian-tengah/','','2024-10-24 10:44:08.918954','26-Mei-2023'),
(2209,'Redaksi Pengumuman Lelang Pascakualifikasi Penugasan PLN Penambahan Node HCI pada Virtualisasi PLN Pusat','http://plniconplus.co.id/eproc/redaksi-pengumuman-lelang-pascakualifikasi-penugasan-pln-penambahan-node-hci-pada-virtualisasi-pln-pusat/','','2024-10-24 10:44:08.921942','22-Mei-2023'),
(2210,'Pengumuman Lelang Pascakualifikasi Pengadaan Barang & Jasa Firewall IPS (Intrusion Prevention System) untuk Pelanggan Badan Riset dan Inovasi Nasional (BRIN)','http://plniconplus.co.id/eproc/pengumuman-lelang-pascakualifikasi-pengadaan-barang-jasa-firewall-ips-intrusion-prevention-system-untuk-pelanggan-badan-riset-dan-inovasi-nasional-brin/','','2024-10-24 10:44:08.924943','10-Mei-2023'),
(2211,'Pengumuman Lelang Terbuka Pascakualifikasi Pengadaaan KHS Akses Poin Indoor Layanan i-WIN dan WIFiN Tahun 2023','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pascakualifikasi-pengadaaan-khs-akses-poin-indoor-layanan-i-win-dan-wifin-tahun-2023/','','2024-10-24 10:44:08.927954','20-Maret-2023'),
(2212,'PENGUMUMAN LELANG TERBUKA  PENGADAAN OLT INDOOR GPON CUSTOMER BASED TAHAP-4','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-olt-indoor-gpon-customer-based-tahap-4-2/','','2024-10-24 10:44:08.929955','17-Maret-2023'),
(2213,'Pengumuman Lelang Terbuka Pascakualifikasi Pengadaan KHS Mini PC Tahun 2023','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pascakualifikasi-pengadaan-khs-mini-pc-tahun-2023/','','2024-10-24 10:44:09.280494','17-Maret-2023'),
(2214,'Pengumuman Lelang Terbuka Pengadaan Jasa KHS Aktivasi 2023 SBU Sumbagsel','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-khs-aktivasi-2023-sbu-sumbagsel/','','2024-10-24 10:44:09.283681','15-Maret-2023'),
(2215,'Pengumuman Lelang Terbuka Pengadaan Jasa Borongan Service Point Paket 1 sd Paket 4 SBU Regional Jawa Bagian Tengah 2023','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-borongan-service-point-paket-1-sd-paket-4-sbu-regional-jawa-bagian-tengah-2023/','','2024-10-24 10:44:09.284796','27-Januari-2023'),
(2216,'Pengumuman Lelang Terbuka PENGADAAN JASA SERVICE POINT RETAIL SBU REGIONAL SUMATERA BAGIAN TENGAH AREA RIAU DAN KEPULAUAN','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-service-point-retail-sbu-regional-sumatera-bagian-tengah-area-riau-dan-kepulauan/','','2024-10-24 10:44:09.284796','26-Januari-2023'),
(2217,'Pengumuman Lelang Terbuka Pengadaan Pekerjaan Jasa Service Point Paket 1 sd Paket 9 SBU Jawa Bagian Timur 2023 – 2026','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-pekerjaan-jasa-service-point-paket-1-sd-paket-9-sbu-jawa-bagian-timur-2023-2026/','','2024-10-24 10:44:09.291287','18-Januari-2023'),
(2218,'JASA BORONGAN SERVICE POINT FEEDER DAN LASTMILE  SBU JAKARTA  WILAYAH BEKASI JABABEKA','http://plniconplus.co.id/eproc/jasa-borongan-service-point-feeder-dan-lastmile-sbu-jakarta-wilayah-bekasi-jababeka/','','2024-10-24 10:44:09.701355','06-Januari-2023'),
(2219,'Pengumuman Lelang Jasa Borongan Service Point SBU Regional Sumatera Bagian Utara Area Kerja Lhoksumawe dan Area Kerja Aceh','http://plniconplus.co.id/eproc/pengumuman-lelang-jasa-borongan-service-point-sbu-regional-sumatera-bagian-utara-area-kerja-lhoksumawe-dan-area-kerja-aceh/','','2024-10-24 10:44:09.704559','05-Januari-2023'),
(2220,'Pekerjaan Jasa Service Point Retail SBU Sumbagsel Tahap 2','http://plniconplus.co.id/eproc/pekerjaan-jasa-service-point-retail-sbu-sumbagsel-tahap-2/','','2024-10-24 10:44:09.705986','27-Desember-2022'),
(2221,'Jasa Service Point Retail SBU Regional Sumatera Bagian Tengah Area Sumatera Barat','http://plniconplus.co.id/eproc/jasa-service-point-retail-sbu-regional-sumatera-bagian-tengah-area-sumatera-barat/','','2024-10-24 10:44:09.710069','27-Desember-2022'),
(2222,'Pengumuman Lelang KHS Jasa Instalasi Aktivasi  SBU REGIONAL JAKARTA dan BANTEN Tahun 2022','http://plniconplus.co.id/eproc/pengumuman-lelang-khs-jasa-instalasi-aktivasi-sbu-regional-jakarta-dan-banten-tahun-2022/','','2024-10-24 10:44:09.713328','19-Desember-2022'),
(2223,'Pengumuman Lelang Jasa Borongan Service Point SBU Regional Sumatera Bagian Utara Area Kerja Medan dan Area Kerja Padang Sidempuan','http://plniconplus.co.id/eproc/pengumuman-lelang-jasa-borongan-service-point-sbu-regional-sumatera-bagian-utara-area-kerja-medan-dan-area-kerja-padang-sidempuan/','','2024-10-24 10:44:10.135425','16-Desember-2022'),
(2224,'Pengumuman Seleksi Umum : Pengadaan Jasa Konsultansi Konstruksi Dan Perencanaan Pembangunan Data  Center 3 Gandul','http://plniconplus.co.id/eproc/pengumuman-seleksi-umum-pengadaan-jasa-konsultansi-konstruksi-dan-perencanaan-pembangunan-data-center-3-gandul/','','2024-10-24 10:44:10.140621','14-Desember-2022'),
(2225,'Pengumuman Lelang Terbuka Pengadaan Jasa Borongan Unit Reaksi Cepat Bali','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-jasa-borongan-unit-reaksi-cepat-bali/','','2024-10-24 10:44:10.143773','09-Desember-2022'),
(2226,'Pengumuman Lelang Pengadaan Jasa Instalasi Aktivasi SBU RJBT Tahap 2 2022','http://plniconplus.co.id/eproc/pengumuman-lelang-pengadaan-jasa-instalasi-aktivasi-sbu-rjbt-tahap-2-2022/','','2024-10-24 10:44:10.146860','03-Desember-2022'),
(2227,'Pengumuman Lelang Terbuka : KHS Material VSAT (Pengadaan Ulang)','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-khs-material-vsat-pengadaan-ulang/','','2024-10-24 10:44:10.149870','30-November-2022'),
(2228,'Pengumuman Lelang Pengadaan Pembangunan Jaringan Radio Link (Microwave) untuk system Repeater Radio Trunking Icon Jawa Bali','http://plniconplus.co.id/eproc/pengumuman-lelang-pengadaan-pembangunan-jaringan-radio-link-microwave-untuk-system-repeater-radio-trunking-icon-jawa-bali/','','2024-10-24 10:44:10.591232','30-November-2022'),
(2229,'Pengumuman Lelang Pengadaan Jasa Borongan Serpo Unit Reaksi Cepat SBU Jawa Barat 2022-2023','http://plniconplus.co.id/eproc/pengumuman-lelang-pengadaan-jasa-borongan-serpo-unit-reaksi-cepat-sbu-jawa-barat-2022-2023/','','2024-10-24 10:44:10.595044','29-November-2022'),
(2230,'Pengumuman Lelang Terbuka KHS Kabel Drop Wire Retail 2022','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-khs-kabel-drop-wire-retail-2022/','','2024-10-24 10:44:10.599045','23-November-2022'),
(2231,'Pengumuman Lelang Terbuka Pengadaan Router NPE Jakarta dan Jabagtim 2022','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-pengadaan-router-npe-jakarta-dan-jabagtim-2022/','','2024-10-24 10:44:10.603044','23-November-2022'),
(2232,'Pengumuman Lelang Terbuka Jasa Borongan Service Point SBU Jakarta  Area JAKUTIM Tahun 2022 – 2025','http://plniconplus.co.id/eproc/pengumuman-lelang-terbuka-jasa-borongan-service-point-sbu-jakarta-area-jakutim-tahun-2022-2025/','','2024-10-24 10:44:10.606048','23-November-2022');
/*!40000 ALTER TABLE `scrapper_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrapper_lelang`
--

DROP TABLE IF EXISTS `scrapper_lelang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrapper_lelang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_lelang` varchar(500) NOT NULL,
  `nama_paket` varchar(500) NOT NULL,
  `link` varchar(500) NOT NULL,
  `instansi` varchar(500) NOT NULL,
  `tahapan` varchar(500) NOT NULL,
  `hps` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrapper_lelang`
--

LOCK TABLES `scrapper_lelang` WRITE;
/*!40000 ALTER TABLE `scrapper_lelang` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrapper_lelang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-10-24 19:31:23
