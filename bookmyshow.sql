-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: bookmyshow
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add auth_user',6,'add_user'),(22,'Can change auth_user',6,'change_user'),(23,'Can delete auth_user',6,'delete_user'),(24,'Can view auth_user',6,'view_user'),(25,'Can add movie',7,'add_movie'),(26,'Can change movie',7,'change_movie'),(27,'Can delete movie',7,'delete_movie'),(28,'Can view movie',7,'view_movie'),(29,'Can add screens',8,'add_screens'),(30,'Can change screens',8,'change_screens'),(31,'Can delete screens',8,'delete_screens'),(32,'Can view screens',8,'view_screens'),(33,'Can add moviescreens',9,'add_moviescreens'),(34,'Can change moviescreens',9,'change_moviescreens'),(35,'Can delete moviescreens',9,'delete_moviescreens'),(36,'Can view moviescreens',9,'view_moviescreens'),(37,'Can add booking',10,'add_bookings'),(38,'Can change booking',10,'change_bookings'),(39,'Can delete booking',10,'delete_bookings'),(40,'Can view booking',10,'view_bookings'),(41,'Can add cinemahallmovies',11,'add_cinema_hall_movies'),(42,'Can change cinemahallmovies',11,'change_cinema_hall_movies'),(43,'Can delete cinemahallmovies',11,'delete_cinema_hall_movies'),(44,'Can view cinemahallmovies',11,'view_cinema_hall_movies'),(45,'Can add cinemahall',12,'add_cinema_halls'),(46,'Can change cinemahall',12,'change_cinema_halls'),(47,'Can delete cinemahall',12,'delete_cinema_halls'),(48,'Can view cinemahall',12,'view_cinema_halls'),(49,'Can add moviescreentime',13,'add_moviescreentime'),(50,'Can change moviescreentime',13,'change_moviescreentime'),(51,'Can delete moviescreentime',13,'delete_moviescreentime'),(52,'Can view moviescreentime',13,'view_moviescreentime'),(53,'Can add Token',14,'add_token'),(54,'Can change Token',14,'change_token'),(55,'Can delete Token',14,'delete_token'),(56,'Can view Token',14,'view_token'),(57,'Can add token',15,'add_tokenproxy'),(58,'Can change token',15,'change_tokenproxy'),(59,'Can delete token',15,'delete_tokenproxy'),(60,'Can view token',15,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES ('pbkdf2_sha256$216000$rsvj0LeglI4b$TaklWDTOWhvrUHaUfbUQloF5Brg9xbZL2qLn6zbUfyA=','2021-01-26 10:36:18.412540',1,'admin','','','admin@gmail.com',1,1,'2021-01-26 10:35:20.772639',1,''),('',NULL,0,'sharmadiksha455@gmail.com','diksha','sharma','sharmadiksha455@gmail.com',0,1,'2021-01-26 22:43:58.248214',20,'7777777779'),('',NULL,0,'EF8EDC','diksha','sharma','sharmadiksha455@gmail.com',0,1,'2021-01-26 22:50:06.235597',21,'7777777779');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookingId` char(32) NOT NULL,
  `status` int NOT NULL,
  `movie_screens_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `movie_screen_time_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_movie_screens_id_2751f984_fk_moviescreens_id` (`movie_screens_id`),
  KEY `booking_user_id_1bd7cb6e_fk_auth_user_id` (`user_id`),
  KEY `booking_movie_screen_time_id_656ca1ab_fk_moviescreentime_id` (`movie_screen_time_id`),
  CONSTRAINT `booking_movie_screen_time_id_656ca1ab_fk_moviescreentime_id` FOREIGN KEY (`movie_screen_time_id`) REFERENCES `moviescreentime` (`id`),
  CONSTRAINT `booking_movie_screens_id_2751f984_fk_moviescreens_id` FOREIGN KEY (`movie_screens_id`) REFERENCES `moviescreens` (`id`),
  CONSTRAINT `booking_user_id_1bd7cb6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,'128093ad0fbb4ca9870802fc038fcaed',1,1,20,1),(6,'8a632d35ca7a4becb5e33d7e46cfa114',1,1,21,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemahall`
--

DROP TABLE IF EXISTS `cinemahall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemahall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemahall`
--

LOCK TABLES `cinemahall` WRITE;
/*!40000 ALTER TABLE `cinemahall` DISABLE KEYS */;
INSERT INTO `cinemahall` VALUES (1,'PVR cinemas',1),(2,'INOX',1);
/*!40000 ALTER TABLE `cinemahall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemahallmovies`
--

DROP TABLE IF EXISTS `cinemahallmovies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemahallmovies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `cinema_halls_id` bigint DEFAULT NULL,
  `movie_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chinemahallmovies_movie_id_8aaf23e6_fk_movie_id` (`movie_id`),
  KEY `chinemahallmovies_cinema_halls_id_0972da8c_fk_chinemahall_id` (`cinema_halls_id`),
  CONSTRAINT `chinemahallmovies_cinema_halls_id_0972da8c_fk_chinemahall_id` FOREIGN KEY (`cinema_halls_id`) REFERENCES `cinemahall` (`id`),
  CONSTRAINT `chinemahallmovies_movie_id_8aaf23e6_fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemahallmovies`
--

LOCK TABLES `cinemahallmovies` WRITE;
/*!40000 ALTER TABLE `cinemahallmovies` DISABLE KEYS */;
INSERT INTO `cinemahallmovies` VALUES (1,1,1,1),(2,1,2,2),(3,1,1,2),(4,1,2,1);
/*!40000 ALTER TABLE `cinemahallmovies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-26 10:37:06.884239','1','Movie object (1)',1,'[{\"added\": {}}]',7,1),(2,'2021-01-26 10:37:53.646420','2','Movie object (2)',1,'[{\"added\": {}}]',7,1),(3,'2021-01-26 11:31:23.198218','1','Cinema_Halls object (1)',1,'[{\"added\": {}}]',12,1),(4,'2021-01-26 11:31:33.921503','2','Cinema_Halls object (2)',1,'[{\"added\": {}}]',12,1),(5,'2021-01-26 11:31:55.708314','1','Cinema_Hall_Movies object (1)',1,'[{\"added\": {}}]',11,1),(6,'2021-01-26 11:32:07.096157','2','Cinema_Hall_Movies object (2)',1,'[{\"added\": {}}]',11,1),(7,'2021-01-26 11:44:53.678706','3','Cinema_Hall_Movies object (3)',1,'[{\"added\": {}}]',11,1),(8,'2021-01-26 11:45:28.937724','4','Cinema_Hall_Movies object (4)',1,'[{\"added\": {}}]',11,1),(9,'2021-01-26 12:14:11.973455','1','Screens object (1)',1,'[{\"added\": {}}]',8,1),(10,'2021-01-26 12:14:19.035351','2','Screens object (2)',1,'[{\"added\": {}}]',8,1),(11,'2021-01-26 12:14:26.785902','3','Screens object (3)',1,'[{\"added\": {}}]',8,1),(12,'2021-01-26 12:14:36.811684','4','Screens object (4)',1,'[{\"added\": {}}]',8,1),(13,'2021-01-26 12:14:44.092152','5','Screens object (5)',1,'[{\"added\": {}}]',8,1),(14,'2021-01-26 12:14:51.074347','6','Screens object (6)',1,'[{\"added\": {}}]',8,1),(15,'2021-01-26 12:15:17.087265','1','MovieScreens object (1)',1,'[{\"added\": {}}]',9,1),(16,'2021-01-26 12:15:27.376224','2','MovieScreens object (2)',1,'[{\"added\": {}}]',9,1),(17,'2021-01-26 12:16:46.766868','1','MovieScreenTime object (1)',1,'[{\"added\": {}}]',13,1),(18,'2021-01-26 12:17:17.045556','2','MovieScreenTime object (2)',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(10,'apis','bookings'),(11,'apis','cinema_hall_movies'),(12,'apis','cinema_halls'),(7,'apis','movie'),(9,'apis','moviescreens'),(13,'apis','moviescreentime'),(8,'apis','screens'),(6,'apis','user'),(3,'auth','group'),(2,'auth','permission'),(14,'authtoken','token'),(15,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-26 08:01:11.755304'),(2,'contenttypes','0002_remove_content_type_name','2021-01-26 08:01:13.202770'),(3,'auth','0001_initial','2021-01-26 08:01:14.419832'),(4,'auth','0002_alter_permission_name_max_length','2021-01-26 08:01:18.296515'),(5,'auth','0003_alter_user_email_max_length','2021-01-26 08:01:18.379938'),(6,'auth','0004_alter_user_username_opts','2021-01-26 08:01:18.464668'),(7,'auth','0005_alter_user_last_login_null','2021-01-26 08:01:18.533821'),(8,'auth','0006_require_contenttypes_0002','2021-01-26 08:01:18.584269'),(9,'auth','0007_alter_validators_add_error_messages','2021-01-26 08:01:18.660089'),(10,'auth','0008_alter_user_username_max_length','2021-01-26 08:01:18.716497'),(11,'auth','0009_alter_user_last_name_max_length','2021-01-26 08:01:18.794740'),(12,'auth','0010_alter_group_name_max_length','2021-01-26 08:01:19.053348'),(13,'auth','0011_update_proxy_permissions','2021-01-26 08:01:19.120411'),(14,'auth','0012_alter_user_first_name_max_length','2021-01-26 08:01:19.176503'),(15,'apis','0001_initial','2021-01-26 08:01:23.564369'),(16,'admin','0001_initial','2021-01-26 08:01:34.567116'),(17,'admin','0002_logentry_remove_auto_add','2021-01-26 08:01:36.563440'),(18,'admin','0003_logentry_add_action_flag_choices','2021-01-26 08:01:36.639268'),(19,'apis','0002_remove_chinema_hall_movies_movie','2021-01-26 08:01:37.572019'),(20,'apis','0003_auto_20210126_0049','2021-01-26 08:01:39.386405'),(21,'apis','0004_auto_20210126_0124','2021-01-26 08:01:46.446345'),(22,'apis','0005_moviescreentime','2021-01-26 08:01:46.940374'),(23,'apis','0006_bookings_movie_screen_time','2021-01-26 08:01:49.153596'),(24,'apis','0007_auto_20210126_1000','2021-01-26 08:01:50.921412'),(25,'authtoken','0001_initial','2021-01-26 08:01:51.534958'),(26,'authtoken','0002_auto_20160226_1747','2021-01-26 08:01:53.751140'),(27,'authtoken','0003_tokenproxy','2021-01-26 08:01:53.830806'),(28,'sessions','0001_initial','2021-01-26 08:01:54.344018'),(29,'apis','0002_auto_20210126_1723','2021-01-26 17:23:17.795344'),(30,'apis','0003_auto_20210126_2124','2021-01-26 21:24:23.194023');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kfett2ghyv8thykdst0w2y7pikw20xm7','.eJxVjEEOwiAQRe_C2pACdqAu3XsGMsMMUjUlKe3KeHfbpAvd_vf-e6uI61Li2mSOI6uLMur0uxGmp0w74AdO96pTnZZ5JL0r-qBN3yrL63q4f4GCrWxvkjOGjj0nIBCDLD6bAC74gZLNGcGg6wS2IkIPgzcWqfcEjjAHa9TnCw91OLs:1l4Lhq:SBNlkqSV6eDAPIqcVhI-DICCXUSsGxz-_RIvV2Pvaqw','2021-02-09 10:36:18.470638');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'World Famous',1),(2,'AK vs AK',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviescreens`
--

DROP TABLE IF EXISTS `moviescreens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviescreens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `movie_id` bigint DEFAULT NULL,
  `screens_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `moviescreens_movie_id_ba57dd34_fk_movie_id` (`movie_id`),
  KEY `moviescreens_screens_id_2fe0b043_fk_screens_id` (`screens_id`),
  CONSTRAINT `moviescreens_movie_id_ba57dd34_fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviescreens_screens_id_2fe0b043_fk_screens_id` FOREIGN KEY (`screens_id`) REFERENCES `screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviescreens`
--

LOCK TABLES `moviescreens` WRITE;
/*!40000 ALTER TABLE `moviescreens` DISABLE KEYS */;
INSERT INTO `moviescreens` VALUES (1,1,1,1),(2,1,1,2);
/*!40000 ALTER TABLE `moviescreens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviescreentime`
--

DROP TABLE IF EXISTS `moviescreentime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviescreentime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_time` datetime(6) NOT NULL,
  `to_time` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `movie_screens_id` bigint DEFAULT NULL,
  `available_seats` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moviescreentime_movie_screens_id_4e11cfd3_fk_moviescreens_id` (`movie_screens_id`),
  CONSTRAINT `moviescreentime_movie_screens_id_4e11cfd3_fk_moviescreens_id` FOREIGN KEY (`movie_screens_id`) REFERENCES `moviescreens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviescreentime`
--

LOCK TABLES `moviescreentime` WRITE;
/*!40000 ALTER TABLE `moviescreentime` DISABLE KEYS */;
INSERT INTO `moviescreentime` VALUES (1,'2021-01-27 12:00:00.000000','2021-01-27 14:00:00.000000',1,1,19),(2,'2021-01-27 16:00:00.000000','2021-01-27 19:00:00.000000',1,2,50);
/*!40000 ALTER TABLE `moviescreentime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `seats` int NOT NULL,
  `status` int NOT NULL,
  `cinema_halls_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `screens_cinema_halls_id_52bf41fd_fk_chinemahall_id` (`cinema_halls_id`),
  CONSTRAINT `screens_cinema_halls_id_52bf41fd_fk_chinemahall_id` FOREIGN KEY (`cinema_halls_id`) REFERENCES `cinemahall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (1,1,19,1,1),(2,2,50,1,1),(3,3,50,1,1),(4,4,50,1,1),(5,1,50,1,2),(6,2,50,1,2);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-27  4:25:09
