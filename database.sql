-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_values_attribute_id_entity_id_unique` (`attribute_id`,`entity_id`),
  KEY `attribute_values_entity_id_foreign` (`entity_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
INSERT INTO `attribute_values` VALUES (1,1,1,'8004012','2025-03-07 01:30:02','2025-03-07 01:30:02'),(2,2,1,'2019-09-29','2025-03-07 01:30:02','2025-03-07 01:30:02'),(3,3,1,'1983-10-03','2025-03-07 01:30:02','2025-03-07 01:30:02'),(4,1,2,'1180435','2025-03-07 01:30:02','2025-03-07 01:30:02'),(5,2,2,'1999-01-04','2025-03-07 01:30:02','2025-03-07 01:30:02'),(6,3,2,'1992-04-07','2025-03-07 01:30:02','2025-03-07 01:30:02'),(7,1,3,'1499781','2025-03-07 01:30:02','2025-03-07 01:30:02'),(8,2,3,'2004-06-20','2025-03-07 01:30:02','2025-03-07 01:30:02'),(9,3,3,'1997-05-01','2025-03-07 01:30:02','2025-03-07 01:30:02'),(10,1,4,'890','2025-03-07 01:30:03','2025-03-07 01:30:03'),(11,2,4,'1992-04-04','2025-03-07 01:30:03','2025-03-07 01:30:03'),(12,3,4,'1987-07-18','2025-03-07 01:30:03','2025-03-07 01:30:03'),(13,1,5,'7437','2025-03-07 01:30:03','2025-03-07 01:30:03'),(14,2,5,'1985-07-23','2025-03-07 01:30:03','2025-03-07 01:30:03'),(15,3,5,'2014-09-01','2025-03-07 01:30:03','2025-03-07 01:30:03'),(16,1,6,'88','2025-03-07 01:30:03','2025-03-07 01:30:03'),(17,2,6,'1980-10-14','2025-03-07 01:30:03','2025-03-07 01:30:03'),(18,3,6,'2005-08-23','2025-03-07 01:30:03','2025-03-07 01:30:03'),(22,1,8,'548980411','2025-03-07 01:30:03','2025-03-07 01:30:03'),(23,2,8,'1997-12-06','2025-03-07 01:30:04','2025-03-07 01:30:04'),(24,3,8,'2021-06-18','2025-03-07 01:30:04','2025-03-07 01:30:04'),(25,1,9,'466','2025-03-07 01:30:04','2025-03-07 01:30:04'),(26,2,9,'2017-09-21','2025-03-07 01:30:04','2025-03-07 01:30:04'),(27,3,9,'2017-07-19','2025-03-07 01:30:04','2025-03-07 01:30:04'),(28,1,10,'551816','2025-03-07 01:30:04','2025-03-07 01:30:04'),(29,2,10,'2021-08-25','2025-03-07 01:30:04','2025-03-07 01:30:04'),(30,3,10,'2016-07-07','2025-03-07 01:30:04','2025-03-07 01:30:04'),(33,20,1,'1000','2025-03-07 06:18:17','2025-03-07 06:18:17');
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','date','number','select') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'budget','number','2025-03-07 01:30:02','2025-03-07 01:30:02'),(2,'start_date','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(3,'end_date','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(4,'Kyra Kunde','text','2025-03-07 01:30:02','2025-03-07 01:30:02'),(5,'Brady Konopelski II','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(6,'Dr. Berneice Vandervort DDS','text','2025-03-07 01:30:02','2025-03-07 01:30:02'),(7,'Shanie Smitham','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(8,'Karelle Wunsch','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(9,'Thurman Pollich Sr.','date','2025-03-07 01:30:02','2025-03-07 01:30:02'),(10,'Floy Gerlach','select','2025-03-07 01:30:02','2025-03-07 01:30:02'),(11,'Mrs. Samanta Koepp I','text','2025-03-07 01:30:02','2025-03-07 01:30:02'),(12,'Sally Kilback','select','2025-03-07 01:30:02','2025-03-07 01:30:02'),(13,'Janiya Quitzon','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(14,'Ottis Lockman','date','2025-03-07 01:30:03','2025-03-07 01:30:03'),(15,'Randy Bartell','date','2025-03-07 01:30:03','2025-03-07 01:30:03'),(16,'Marshall Huels','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(17,'Cayla Erdman Jr.','date','2025-03-07 01:30:03','2025-03-07 01:30:03'),(18,'Giovani Grady','date','2025-03-07 01:30:03','2025-03-07 01:30:03'),(19,'Tracy Rice','text','2025-03-07 01:30:03','2025-03-07 01:30:03'),(20,'Jena Marquardt','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(21,'Autumn Schroeder','number','2025-03-07 01:30:03','2025-03-07 01:30:03'),(22,'Golda Littel','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(23,'Raina Brakus','number','2025-03-07 01:30:03','2025-03-07 01:30:03'),(24,'Torey Murazik','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(25,'Mr. Jed Runolfsdottir','text','2025-03-07 01:30:03','2025-03-07 01:30:03'),(26,'Miss Vita Howell','select','2025-03-07 01:30:03','2025-03-07 01:30:03'),(27,'Spencer Dare','number','2025-03-07 01:30:04','2025-03-07 01:30:04'),(28,'Raphaelle Ebert','number','2025-03-07 01:30:04','2025-03-07 01:30:04'),(29,'Kyra Heaney','number','2025-03-07 01:30:04','2025-03-07 01:30:04'),(30,'Mr. Kenton Johns','number','2025-03-07 01:30:04','2025-03-07 01:30:04'),(31,'Rene Friesen','date','2025-03-07 01:30:04','2025-03-07 01:30:04'),(32,'Kolby Jaskolski','select','2025-03-07 01:30:04','2025-03-07 01:30:04'),(33,'Hassie Hills','number','2025-03-07 01:30:04','2025-03-07 01:30:04');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_04_135821_create_oauth_auth_codes_table',1),(5,'2025_03_04_135822_create_oauth_access_tokens_table',1),(6,'2025_03_04_135823_create_oauth_refresh_tokens_table',1),(7,'2025_03_04_135824_create_oauth_clients_table',1),(8,'2025_03_04_135825_create_oauth_personal_access_clients_table',1),(9,'2025_03_04_225509_create_projects_table',1),(10,'2025_03_04_230850_create_project_user_table',1),(11,'2025_03_04_232230_create_timesheets_table',1),(12,'2025_03_07_010224_create_attributes_table',1),(13,'2025_03_07_010710_create_attribute_values_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('a876d58488f3e9992617a5c14f660c1ee96d083d75932f0118afa2f65290780ace8e47e9991f916e',1,'9e5af76b-7c02-4103-8d2c-9d65861f2f79','auth_token','[]',0,'2025-03-07 04:41:13','2025-03-07 04:41:13','2025-09-07 04:41:13');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('9e5af76b-7c02-4103-8d2c-9d65861f2f79',NULL,'Personal Access Client','$2y$12$6jenrOxNecqWUyc5T3ungu4651o6f2pVhaB83qqVN79G4zGfekDkS',NULL,'http://localhost',1,0,0,'2025-03-07 01:30:02','2025-03-07 01:30:02');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,'9e5af76b-7c02-4103-8d2c-9d65861f2f79','2025-03-07 01:30:02','2025-03-07 01:30:02');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_user_project_id_user_id_unique` (`project_id`,`user_id`),
  KEY `project_user_user_id_foreign` (`user_id`),
  CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES (1,1,7,NULL,NULL),(2,1,10,NULL,NULL),(3,1,11,NULL,NULL),(4,2,7,NULL,NULL),(5,2,8,NULL,NULL),(6,2,10,NULL,NULL),(7,3,2,NULL,NULL),(8,3,3,NULL,NULL),(9,3,5,NULL,NULL),(10,4,3,NULL,NULL),(11,4,4,NULL,NULL),(12,4,10,NULL,NULL),(13,5,4,NULL,NULL),(14,5,11,NULL,NULL),(15,5,1,NULL,NULL),(16,6,3,NULL,NULL),(17,6,9,NULL,NULL),(18,6,10,NULL,NULL),(22,8,3,NULL,NULL),(23,8,5,NULL,NULL),(24,8,9,NULL,NULL),(25,9,3,NULL,NULL),(26,9,6,NULL,NULL),(27,9,8,NULL,NULL),(28,10,7,NULL,NULL),(29,10,8,NULL,NULL),(30,10,9,NULL,NULL);
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','in_progress','completed','canceled','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'illo voluptatem aspernatur pariatur nihil','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(2,'voluptatem possimus non ut nemo','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(3,'libero consequatur sit sed nesciunt','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(4,'asperiores laborum ut rerum et','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(5,'delectus minima non fuga doloribus','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(6,'quibusdam architecto magnam maxime eius','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(8,'et in laborum quae a','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(9,'ea consequatur ut officia et','completed','2025-03-07 01:30:02','2025-03-07 01:30:02'),(10,'tempora iusto dolorum magni sint','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(11,'minima rerum reprehenderit officia sint','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(12,'quaerat cum rerum alias sint','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(13,'quo fuga voluptas dolores ipsam','completed','2025-03-07 01:30:02','2025-03-07 01:30:02'),(14,'enim impedit quae ad et','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(15,'facilis aliquam ea quos omnis','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(16,'maiores possimus enim voluptas repudiandae','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(17,'rem accusamus consequuntur qui ut','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(18,'laboriosam nihil omnis rem et','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(19,'dolor fugiat dolores magnam a','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(20,'et placeat nemo quam enim','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(21,'eum sint sequi omnis qui','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(22,'nihil quidem est hic et','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(23,'sed et rerum illo velit','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(24,'numquam illo omnis temporibus consectetur','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(25,'quos error perferendis possimus placeat','completed','2025-03-07 01:30:02','2025-03-07 01:30:02'),(26,'reiciendis ullam officiis cumque exercitationem','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(27,'totam veniam doloribus est nesciunt','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(28,'quas amet et fuga magnam','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(29,'quia quibusdam ullam est reprehenderit','completed','2025-03-07 01:30:02','2025-03-07 01:30:02'),(30,'tenetur quas repudiandae consequatur mollitia','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(31,'blanditiis pariatur maxime numquam praesentium','in_progress','2025-03-07 01:30:02','2025-03-07 01:30:02'),(32,'aut ea optio est voluptas','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(33,'voluptates culpa autem cupiditate quia','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(34,'corrupti cumque et illo molestias','completed','2025-03-07 01:30:02','2025-03-07 01:30:02'),(35,'nam quam laudantium numquam harum','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(36,'omnis consequatur quia tempore mollitia','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(37,'deserunt praesentium sed quo dignissimos','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(38,'ad omnis consectetur atque vitae','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(39,'voluptatem assumenda facilis dignissimos facere','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(40,'tenetur praesentium consequatur et voluptate','archived','2025-03-07 01:30:02','2025-03-07 01:30:02'),(41,'velit necessitatibus quisquam nihil facere','pending','2025-03-07 01:30:02','2025-03-07 01:30:02'),(42,'accusantium nam magnam consequatur ex','canceled','2025-03-07 01:30:02','2025-03-07 01:30:02'),(43,'totam hic eos provident ut','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(44,'sint nisi eligendi est perferendis','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(45,'et voluptatem fugiat voluptate sapiente','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(46,'error non harum voluptatem commodi','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(47,'sequi et dolores aut possimus','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(48,'in esse harum et est','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(49,'suscipit incidunt aut doloremque quo','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(50,'exercitationem possimus at dolorem esse','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(51,'incidunt fuga quia eaque beatae','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(52,'dolore dolores quam quisquam quis','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(53,'eligendi dolores minus impedit quam','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(54,'natus aut dolore amet blanditiis','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(55,'repellendus necessitatibus dicta ad aut','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(56,'fugiat unde amet facilis voluptatem','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(57,'quis est dolore neque et','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(58,'error sapiente ipsa doloribus itaque','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(59,'assumenda debitis omnis ut eos','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(60,'praesentium est in omnis aut','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(61,'qui voluptas est earum ex','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(62,'ullam totam est sed consequatur','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(63,'ut repudiandae illo et nihil','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(64,'quia corrupti dicta tenetur iusto','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(65,'amet cumque et eos excepturi','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(66,'animi nemo nostrum soluta cum','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(67,'commodi maiores similique qui quibusdam','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(68,'minus quo nostrum sed exercitationem','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(69,'et illum iusto reiciendis dolorem','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(70,'ipsam dolores qui dolores corporis','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(71,'dolor nemo dicta cum quia','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(72,'soluta quia et corporis qui','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(73,'distinctio ex id itaque eos','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(74,'expedita qui ut ea atque','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(75,'soluta ex repellendus omnis eligendi','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(76,'eaque sit aut quia accusamus','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(77,'fugiat expedita et minima minima','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(78,'tempora facere fuga quae repellendus','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(79,'quia nihil odit omnis corrupti','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(80,'asperiores deserunt laborum id eligendi','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(81,'soluta voluptas sed in impedit','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(82,'nesciunt saepe qui recusandae neque','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(83,'debitis qui sunt molestiae ea','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(84,'ab illo tempore tempora voluptates','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(85,'at beatae quibusdam tempore saepe','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(86,'totam placeat dolorem deserunt atque','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(87,'dolorem vitae et molestiae qui','archived','2025-03-07 01:30:03','2025-03-07 01:30:03'),(88,'quidem blanditiis adipisci amet totam','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(89,'quia iusto eos aspernatur fugiat','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(90,'hic quod architecto ipsa rerum','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(91,'quia autem temporibus impedit odit','canceled','2025-03-07 01:30:03','2025-03-07 01:30:03'),(92,'quaerat accusantium sunt totam perspiciatis','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(93,'veniam quisquam eaque sunt voluptas','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(94,'assumenda accusantium voluptatum pariatur rem','pending','2025-03-07 01:30:03','2025-03-07 01:30:03'),(95,'aut eos ut et sint','completed','2025-03-07 01:30:03','2025-03-07 01:30:03'),(96,'temporibus error alias velit ut','in_progress','2025-03-07 01:30:03','2025-03-07 01:30:03'),(97,'sit facilis nulla sunt ratione','in_progress','2025-03-07 01:30:04','2025-03-07 01:30:04'),(98,'voluptatibus vero voluptatem maxime neque','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(99,'qui totam distinctio temporibus est','pending','2025-03-07 01:30:04','2025-03-07 01:30:04'),(100,'nisi nobis dignissimos aliquid commodi','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(101,'laborum reiciendis consequatur aspernatur et','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(102,'praesentium sed praesentium repellat nobis','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(103,'aut nesciunt sunt dolor consequatur','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(104,'consequatur saepe est voluptatem impedit','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(105,'quia voluptatibus asperiores quo et','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(106,'eaque cum nihil eum aliquid','pending','2025-03-07 01:30:04','2025-03-07 01:30:04'),(107,'eos aliquid et consequatur vitae','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(108,'minus eum eligendi quia omnis','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(109,'ut consequatur soluta ut ea','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(110,'commodi reiciendis dignissimos est nemo','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(111,'accusantium et laborum dolor excepturi','completed','2025-03-07 01:30:04','2025-03-07 01:30:04'),(112,'quidem et praesentium est exercitationem','in_progress','2025-03-07 01:30:04','2025-03-07 01:30:04'),(113,'eaque voluptas impedit facere dolorem','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(114,'libero aut voluptatibus est optio','completed','2025-03-07 01:30:04','2025-03-07 01:30:04'),(115,'itaque nihil eos earum et','in_progress','2025-03-07 01:30:04','2025-03-07 01:30:04'),(116,'ea esse voluptas rerum suscipit','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(117,'aspernatur similique eveniet dolores optio','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(118,'vel nihil ea voluptate cum','completed','2025-03-07 01:30:04','2025-03-07 01:30:04'),(119,'eos quos rem eos deserunt','pending','2025-03-07 01:30:04','2025-03-07 01:30:04'),(120,'quia eum non minima qui','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(121,'ullam ipsam modi iste voluptatum','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(122,'possimus facere nam officiis nihil','pending','2025-03-07 01:30:04','2025-03-07 01:30:04'),(123,'consequatur enim non ab quasi','completed','2025-03-07 01:30:04','2025-03-07 01:30:04'),(124,'error eos laudantium rerum maiores','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(125,'qui at voluptas omnis itaque','canceled','2025-03-07 01:30:04','2025-03-07 01:30:04'),(126,'sint facere in officiis dolor','pending','2025-03-07 01:30:04','2025-03-07 01:30:04'),(127,'expedita quibusdam consectetur fuga ipsa','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(128,'vero autem quae sit consequuntur','archived','2025-03-07 01:30:04','2025-03-07 01:30:04'),(129,'corrupti ad dolores doloribus mollitia','completed','2025-03-07 01:30:04','2025-03-07 01:30:04'),(130,'officiis ut aut tempora eum','in_progress','2025-03-07 01:30:04','2025-03-07 01:30:04');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `hours` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesheets_project_id_foreign` (`project_id`),
  KEY `idx_user_project_date` (`user_id`,`project_id`,`date`),
  CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,7,1,'aut enim repellat iure aut molestiae soluta excepturi libero porro','2025-01-15',5.36,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(2,7,1,'blanditiis commodi alias aut voluptatibus veniam accusantium quaerat et illum','2025-01-07',10.88,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(3,7,1,'laboriosam vel libero necessitatibus temporibus illo et earum quo rerum','2025-01-26',6.71,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(4,10,1,'reiciendis vel voluptatem quibusdam nulla possimus iusto excepturi facere quod','2025-01-24',14.09,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(5,10,1,'placeat qui rerum nemo neque sit sed et voluptatem autem','2025-02-12',19.66,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(6,10,1,'explicabo minus doloribus est sunt vitae maxime quis iusto et','2025-01-16',6.44,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(7,11,1,'fugit eligendi eos accusamus ad explicabo et iure qui quam','2025-02-05',21.9,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(8,11,1,'et deleniti sit in non sit ea modi laudantium consequatur','2025-03-06',15.53,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(9,11,1,'eius non nihil voluptas totam porro excepturi est est aut','2025-02-26',13.97,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(10,7,2,'minus in unde vel nobis sunt pariatur repudiandae nobis ratione','2025-01-30',15.94,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(11,7,2,'nihil saepe voluptas et necessitatibus aperiam vero tenetur qui praesentium','2025-02-26',15.93,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(12,7,2,'labore distinctio sit atque voluptatem ut qui distinctio facere consequatur','2025-01-30',16.31,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(13,8,2,'omnis sunt eveniet quaerat cumque earum doloribus ducimus assumenda animi','2025-01-03',4.23,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(14,8,2,'amet excepturi ullam voluptatum alias vel maiores sed eveniet ut','2025-03-03',11.14,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(15,8,2,'quia et consequatur atque doloribus nisi ut atque dolor quo','2025-01-29',17.1,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(16,10,2,'molestiae soluta assumenda amet id suscipit voluptates minima corrupti magni','2025-01-31',16,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(17,10,2,'qui aut sed autem error amet mollitia possimus et dolorem','2025-01-09',0.86,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(18,10,2,'sit exercitationem ut est qui maxime odio sint voluptatem quo','2025-01-10',18.58,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(19,2,3,'praesentium dolor voluptas sit exercitationem harum et magnam ex quisquam','2025-02-17',21.2,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(20,2,3,'est et consectetur quisquam optio repudiandae omnis dolorem odio in','2025-02-12',12.17,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(21,2,3,'totam et molestiae et distinctio enim voluptate cupiditate sequi enim','2025-01-26',21.35,'2025-03-07 01:30:02','2025-03-07 01:30:02'),(22,3,3,'eius harum vitae modi quia ut voluptatum libero alias a','2025-03-03',23.88,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(23,3,3,'fugiat voluptatem a voluptatibus sed qui nam recusandae rem eos','2025-01-02',7.74,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(24,3,3,'voluptatibus aut est enim voluptas aliquid aut repudiandae qui commodi','2025-01-10',4.69,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(25,5,3,'voluptates illum itaque voluptatem officia tempora itaque sint quis rerum','2025-03-04',19.99,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(26,5,3,'aperiam modi iure quibusdam accusantium rem libero quas quia nostrum','2025-03-01',12.73,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(27,5,3,'ea odio sunt aut amet et dolor fugit laborum pariatur','2025-02-05',23.88,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(28,3,4,'illo ut est et cupiditate quibusdam at id voluptatum quis','2025-01-30',2.18,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(29,3,4,'rerum sed minima vitae sit quia possimus veniam quos consequatur','2025-01-07',1.88,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(30,3,4,'et quos laborum magnam delectus reprehenderit provident corrupti cumque dolorem','2025-02-08',2.98,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(31,4,4,'eos quasi fugiat quidem et doloremque tempore assumenda voluptatibus officia','2025-01-22',18.56,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(32,4,4,'excepturi placeat cum quo aut sunt nihil sit id necessitatibus','2025-02-02',1.53,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(33,4,4,'ut optio aut officiis sit minus repudiandae tempore commodi commodi','2025-02-10',8.16,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(34,10,4,'ipsam quia suscipit doloribus dolor dolores numquam dicta commodi ex','2025-02-27',11.6,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(35,10,4,'sed necessitatibus illum facilis voluptatem nesciunt perspiciatis quia consequatur ratione','2025-01-17',0.34,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(36,10,4,'adipisci molestiae incidunt consequatur sint sunt quod qui omnis quia','2025-01-14',21.16,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(37,4,5,'molestiae nesciunt velit facere repellendus molestiae saepe maxime quia nam','2025-01-12',2.65,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(38,4,5,'sapiente et sit voluptas esse distinctio asperiores qui est deserunt','2025-02-15',12.91,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(39,4,5,'numquam illo iste nisi est nobis nemo tenetur ipsa ex','2025-03-01',23.26,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(40,11,5,'rerum incidunt cupiditate quasi fugiat asperiores fuga rerum exercitationem repellat','2025-02-10',3.1,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(41,11,5,'vel aut cum ut corrupti recusandae qui nihil non eaque','2025-01-24',14.73,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(42,11,5,'odit debitis occaecati porro culpa eius voluptas maxime laudantium rerum','2025-01-20',3.68,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(43,1,5,'veritatis ut rerum eligendi commodi molestiae rerum dolorum cumque animi','2025-02-01',23.04,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(44,1,5,'possimus dolor sed exercitationem sint suscipit error eos non veniam','2025-01-28',11.8,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(45,1,5,'et dolore et recusandae maiores eaque doloremque a eligendi vitae','2025-02-06',16.74,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(46,3,6,'dicta est voluptate nam molestiae libero iure qui maxime sed','2025-02-27',2.85,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(47,3,6,'delectus aspernatur mollitia quia facilis vel repudiandae enim sequi expedita','2025-02-11',9.08,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(48,3,6,'qui eligendi dolorem in et corporis sint labore qui nobis','2025-02-14',6.12,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(49,9,6,'quas neque consectetur modi corrupti quidem delectus accusantium amet minus','2025-02-23',9.97,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(50,9,6,'repellendus ratione similique aut odit doloribus harum eaque totam quae','2025-02-04',19.08,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(51,9,6,'est velit fugit illum ut similique assumenda commodi similique maxime','2025-01-14',13.92,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(52,10,6,'animi et molestias dolores beatae laboriosam qui sed totam non','2025-01-27',8.93,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(53,10,6,'possimus sequi ipsum dolores distinctio quas aliquam eum sit sapiente','2025-01-21',7.6,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(54,10,6,'nemo voluptas ducimus fugiat iusto veritatis vero cumque eaque eum','2025-01-28',18.69,'2025-03-07 01:30:03','2025-03-07 01:30:03'),(64,3,8,'itaque non quia eveniet consectetur quisquam et consequatur unde dolore','2025-01-31',4.25,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(65,3,8,'voluptatem et non error qui perferendis vel quis similique sit','2025-02-12',11.73,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(66,3,8,'doloremque voluptatem maxime in natus et reprehenderit odit possimus magnam','2025-02-25',6.4,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(67,5,8,'doloremque dolore tempora officiis qui maxime saepe nobis et nemo','2025-01-15',0.26,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(68,5,8,'fuga dolorum expedita reprehenderit autem quam sapiente quos unde sunt','2025-01-25',16.13,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(69,5,8,'praesentium qui est aut enim nesciunt voluptas sunt dolore aliquam','2025-01-11',16.94,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(70,9,8,'placeat praesentium deleniti natus recusandae qui at assumenda quos alias','2025-02-21',11.59,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(71,9,8,'voluptatem qui fugiat voluptatem veritatis et iste reiciendis nemo aperiam','2025-02-02',14.54,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(72,9,8,'eius quia suscipit eos sunt pariatur harum qui ad fugiat','2025-02-15',3.52,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(73,3,9,'eum consequuntur voluptatem officia adipisci et alias possimus labore aut','2025-01-22',12.55,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(74,3,9,'id et deleniti delectus asperiores sit reprehenderit quia sit voluptatibus','2025-01-16',15.48,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(75,3,9,'atque distinctio delectus debitis quam delectus enim illo est qui','2025-01-27',6.03,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(76,6,9,'nisi ullam dignissimos et velit quia voluptatem eum at nisi','2025-01-25',3.16,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(77,6,9,'ut officia incidunt quasi nesciunt ipsum soluta aut sint sit','2025-02-02',12.68,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(78,6,9,'molestias aut molestias et quia dolorum dignissimos explicabo assumenda voluptatem','2025-02-05',1.49,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(79,8,9,'id cupiditate beatae aut quis tempore tempore quia asperiores sed','2025-02-08',10.88,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(80,8,9,'nesciunt quia eveniet pariatur culpa ut error et numquam autem','2025-01-03',8.91,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(81,8,9,'eveniet recusandae sunt quia modi et doloremque nulla voluptas aut','2025-02-16',14.05,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(82,7,10,'dolores aliquid provident illum velit quis dolor odio maiores et','2025-03-06',20.56,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(83,7,10,'doloribus expedita omnis velit qui est et cupiditate cupiditate labore','2025-02-26',15.89,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(84,7,10,'error a perspiciatis quos occaecati nesciunt labore consectetur voluptatem dolor','2025-03-05',14.59,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(85,8,10,'consequatur doloremque eos consequatur quaerat sapiente nam sapiente quasi dignissimos','2025-02-03',0.07,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(86,8,10,'rem repudiandae inventore ut quasi nihil deleniti placeat libero cupiditate','2025-01-18',6.98,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(87,8,10,'ab inventore eum dolorem fuga maxime eligendi praesentium voluptate nisi','2025-01-29',0.79,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(88,9,10,'eligendi qui nihil blanditiis consequatur velit hic harum voluptas quia','2025-01-11',1.61,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(89,9,10,'iste incidunt et tempora eum commodi sapiente blanditiis nisi consequatur','2025-01-16',4.43,'2025-03-07 01:30:04','2025-03-07 01:30:04'),(90,9,10,'ea debitis sunt pariatur ullam sed quia perferendis tempore repellendus','2025-02-19',2.97,'2025-03-07 01:30:04','2025-03-07 01:30:04');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super','Admin','admin@user.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','31k7TVm4wV','2025-03-07 01:30:02','2025-03-07 01:30:02'),(2,'Immanuel','Zboncak','ebeer@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','fSJQBn6lVv','2025-03-07 01:30:02','2025-03-07 01:30:02'),(3,'Ellen','Bechtelar','watson18@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','8SyylgE6K5','2025-03-07 01:30:02','2025-03-07 01:30:02'),(4,'Alvah','Kris','theron05@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','bvAGzFUAbQ','2025-03-07 01:30:02','2025-03-07 01:30:02'),(5,'Kaya','Jacobi','sammie38@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','a8wPFB34Dh','2025-03-07 01:30:02','2025-03-07 01:30:02'),(6,'Christ','Stracke','kuhn.rosella@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','5RswFE3TsX','2025-03-07 01:30:02','2025-03-07 01:30:02'),(7,'Bennett','Weissnat','gunner.daugherty@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','4EhonufZvj','2025-03-07 01:30:02','2025-03-07 01:30:02'),(8,'Jacinthe','Armstrong','erenner@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','yc5dQ2vDoE','2025-03-07 01:30:02','2025-03-07 01:30:02'),(9,'Lourdes','Morar','legros.vince@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ErWLLaWPKs','2025-03-07 01:30:02','2025-03-07 01:30:02'),(10,'Cameron','Reichel','qtreutel@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','6Jnkm6Qt9k','2025-03-07 01:30:02','2025-03-07 01:30:02'),(11,'Jean','Heller','vtromp@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','jtMjDpD3sl','2025-03-07 01:30:02','2025-03-07 01:30:02'),(12,'Bell','Kassulke','ora49@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','lwelKT002P','2025-03-07 01:30:02','2025-03-07 01:30:02'),(13,'Ressie','Torp','wstehr@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','WNpxKIL1Zj','2025-03-07 01:30:02','2025-03-07 01:30:02'),(14,'Maggie','Nolan','vhudson@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ucoZ7a4DdT','2025-03-07 01:30:02','2025-03-07 01:30:02'),(15,'Gia','Buckridge','jeffery30@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','aTcG3aVgPr','2025-03-07 01:30:02','2025-03-07 01:30:02'),(16,'Aida','Waelchi','ysmitham@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','4qQvWqGZik','2025-03-07 01:30:02','2025-03-07 01:30:02'),(17,'Kyra','Rohan','elisa03@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ATKDHQFONV','2025-03-07 01:30:02','2025-03-07 01:30:02'),(18,'Timothy','McCullough','jsimonis@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','PWJZZXsd6d','2025-03-07 01:30:02','2025-03-07 01:30:02'),(19,'Reggie','Dicki','ybauch@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','3Q1Zr9M9uA','2025-03-07 01:30:02','2025-03-07 01:30:02'),(20,'Jacynthe','Hintz','carley.hayes@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','mrFKdNBcrI','2025-03-07 01:30:02','2025-03-07 01:30:02'),(21,'Dovie','Hill','kyra47@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','GqtYcIlr4K','2025-03-07 01:30:02','2025-03-07 01:30:02'),(22,'Jordane','Larson','lauretta48@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','FY9sf9zNFJ','2025-03-07 01:30:02','2025-03-07 01:30:02'),(23,'Amiya','Walter','vosinski@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','8fYsVT4DCD','2025-03-07 01:30:02','2025-03-07 01:30:02'),(24,'Aiden','Nolan','heidenreich.estevan@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','YpCajTCIWF','2025-03-07 01:30:02','2025-03-07 01:30:02'),(25,'Samanta','Dickens','jordan92@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','JZ5w3N1uRD','2025-03-07 01:30:02','2025-03-07 01:30:02'),(26,'Elfrieda','Cronin','clifford48@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ksqLoB1vAt','2025-03-07 01:30:02','2025-03-07 01:30:02'),(27,'Daphney','Heathcote','cory89@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','Zz97SlLd4w','2025-03-07 01:30:02','2025-03-07 01:30:02'),(28,'Odell','Dicki','smertz@example.com','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','iI199Cvn5i','2025-03-07 01:30:02','2025-03-07 01:30:02'),(29,'Janice','Crona','ryann62@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','1uCZ5vGFdt','2025-03-07 01:30:02','2025-03-07 01:30:02'),(30,'Dorothy','Lowe','dillan.barton@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ieaHdvBEQ4','2025-03-07 01:30:02','2025-03-07 01:30:02'),(31,'Kianna','Emmerich','bkreiger@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','BG0oaob48X','2025-03-07 01:30:02','2025-03-07 01:30:02'),(32,'Clair','Reilly','mosciski.jade@example.org','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','zLCVuctVhN','2025-03-07 01:30:02','2025-03-07 01:30:02'),(33,'Roy','Medhurst','khalil.hegmann@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','14shK5kvdB','2025-03-07 01:30:02','2025-03-07 01:30:02'),(34,'Fredy','Ebert','ecassin@example.net','2025-03-07 01:30:02','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','9klvQqbIUz','2025-03-07 01:30:02','2025-03-07 01:30:02'),(35,'Isobel','Steuber','sheaney@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','TWmD0Txini','2025-03-07 01:30:03','2025-03-07 01:30:03'),(36,'Ebony','Weimann','hbeatty@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','g8UUcHJRSL','2025-03-07 01:30:03','2025-03-07 01:30:03'),(37,'Victor','Hahn','qhand@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','tVHV5bHtTt','2025-03-07 01:30:03','2025-03-07 01:30:03'),(38,'Dakota','Wuckert','uwillms@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','B15RPHk7Yb','2025-03-07 01:30:03','2025-03-07 01:30:03'),(39,'Doris','Pfeffer','travis.zemlak@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','cvL3JNIAy3','2025-03-07 01:30:03','2025-03-07 01:30:03'),(40,'Bridgette','Ruecker','domenica.jenkins@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','2HKdLK5O2n','2025-03-07 01:30:03','2025-03-07 01:30:03'),(41,'Myrl','Wiza','clemke@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','jSIiQEBgWZ','2025-03-07 01:30:03','2025-03-07 01:30:03'),(42,'Polly','Beer','erna98@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','9zMZif8u7V','2025-03-07 01:30:03','2025-03-07 01:30:03'),(43,'Landen','Mayer','pagac.bernadine@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','BR4aLNbTLC','2025-03-07 01:30:03','2025-03-07 01:30:03'),(44,'Kenneth','Hansen','kuvalis.kaycee@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','W3EcdQd1Pj','2025-03-07 01:30:03','2025-03-07 01:30:03'),(45,'Effie','Steuber','kutch.abe@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','Mr6FHWelre','2025-03-07 01:30:03','2025-03-07 01:30:03'),(46,'Reta','Roberts','nella17@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','OqoWpH7C42','2025-03-07 01:30:03','2025-03-07 01:30:03'),(47,'Kathleen','Schimmel','clesch@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','pdTjCwy5R6','2025-03-07 01:30:03','2025-03-07 01:30:03'),(48,'Candelario','Luettgen','breana94@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','mFUXFkSkGl','2025-03-07 01:30:03','2025-03-07 01:30:03'),(49,'Flossie','Kris','gerardo44@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','HPLzEOspym','2025-03-07 01:30:03','2025-03-07 01:30:03'),(50,'Jose','Lowe','mking@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','OzaPPjYIpV','2025-03-07 01:30:03','2025-03-07 01:30:03'),(51,'Aliza','Schinner','sierra.johnston@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','H0678XKXeb','2025-03-07 01:30:03','2025-03-07 01:30:03'),(52,'Lafayette','Fisher','hkuhic@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','GFY1zdZMNj','2025-03-07 01:30:03','2025-03-07 01:30:03'),(53,'Bette','Gorczany','strosin.crystal@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','twzhbLL0Zj','2025-03-07 01:30:03','2025-03-07 01:30:03'),(54,'Alfonso','Pollich','rebeca57@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','4B3U2vOs9s','2025-03-07 01:30:03','2025-03-07 01:30:03'),(55,'Madelyn','Deckow','bonnie09@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','f2p3RoahL3','2025-03-07 01:30:03','2025-03-07 01:30:03'),(56,'Alize','Gislason','aron.corwin@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','v2stJhv6ru','2025-03-07 01:30:03','2025-03-07 01:30:03'),(57,'Ruth','Kub','gbuckridge@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','vbZ99iQeqV','2025-03-07 01:30:03','2025-03-07 01:30:03'),(58,'Isabella','Cremin','riley83@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','vmgMw1FAvn','2025-03-07 01:30:03','2025-03-07 01:30:03'),(59,'Angelina','Gusikowski','thompson.cornell@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','d4g32ITcvj','2025-03-07 01:30:03','2025-03-07 01:30:03'),(60,'Ebony','Barrows','leannon.alexandrea@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','pDIzleG2eH','2025-03-07 01:30:03','2025-03-07 01:30:03'),(61,'Boris','Howell','ziemann.ferne@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','eLAjBr5rVe','2025-03-07 01:30:03','2025-03-07 01:30:03'),(62,'Moises','Rolfson','elarkin@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','qfKENlizLt','2025-03-07 01:30:03','2025-03-07 01:30:03'),(63,'Danika','Greenfelder','koss.polly@example.com','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','gtecerJhnE','2025-03-07 01:30:03','2025-03-07 01:30:03'),(64,'Dortha','Cole','nbradtke@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','8s11mVVuSL','2025-03-07 01:30:03','2025-03-07 01:30:03'),(65,'Wilhelmine','Emard','braun.julie@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','rlm6dQbffl','2025-03-07 01:30:03','2025-03-07 01:30:03'),(66,'Alysson','Raynor','schultz.marco@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','cswLI0n6C5','2025-03-07 01:30:03','2025-03-07 01:30:03'),(67,'Shakira','Zboncak','kamryn.bashirian@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','cf5aVTLnXW','2025-03-07 01:30:03','2025-03-07 01:30:03'),(68,'Neha','Lebsack','hauck.maida@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','gbmeaT2BKe','2025-03-07 01:30:03','2025-03-07 01:30:03'),(69,'Tobin','Bernhard','akeem22@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','4hvthiwbIy','2025-03-07 01:30:03','2025-03-07 01:30:03'),(70,'Carmine','D\'Amore','dooley.paula@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','mebX4etdyb','2025-03-07 01:30:03','2025-03-07 01:30:03'),(71,'Nova','Collins','pfay@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','KsHSceLGyQ','2025-03-07 01:30:03','2025-03-07 01:30:03'),(72,'Bridgette','O\'Kon','devin.monahan@example.org','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','mQe7RWVXGD','2025-03-07 01:30:03','2025-03-07 01:30:03'),(73,'Nathen','Hahn','wbergstrom@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','Dzx1omjk2T','2025-03-07 01:30:03','2025-03-07 01:30:03'),(74,'Cade','Hudson','tillman.geraldine@example.net','2025-03-07 01:30:03','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','fHwiHTuBgO','2025-03-07 01:30:03','2025-03-07 01:30:03'),(75,'Stephany','Hill','swift.walton@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','34z76ru3WZ','2025-03-07 01:30:04','2025-03-07 01:30:04'),(76,'Amalia','Hackett','cassin.breana@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','JWI0HmFOgl','2025-03-07 01:30:04','2025-03-07 01:30:04'),(77,'Gerson','Mraz','brekke.adriana@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','LkF8cuzgUa','2025-03-07 01:30:04','2025-03-07 01:30:04'),(78,'Kayli','Terry','imckenzie@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','kiNtvqCYSG','2025-03-07 01:30:04','2025-03-07 01:30:04'),(79,'Shad','Rowe','tre.larson@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','VJf9OZhyxi','2025-03-07 01:30:04','2025-03-07 01:30:04'),(80,'Jaime','Schiller','llowe@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ig6GoYcg4t','2025-03-07 01:30:04','2025-03-07 01:30:04'),(81,'Harley','Wiza','rowan31@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','xCqOPMBvFV','2025-03-07 01:30:04','2025-03-07 01:30:04'),(82,'Annie','Pollich','vada95@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','2lOS4NDzSb','2025-03-07 01:30:04','2025-03-07 01:30:04'),(83,'Oleta','Eichmann','ariel44@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','Twtk05jOc4','2025-03-07 01:30:04','2025-03-07 01:30:04'),(84,'Vickie','Koepp','collier.mariana@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','gdJPpGoQNV','2025-03-07 01:30:04','2025-03-07 01:30:04'),(85,'Antonette','Harris','bridget.bergnaum@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','XMChdnLZdQ','2025-03-07 01:30:04','2025-03-07 01:30:04'),(86,'Edward','Kiehn','will.columbus@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','gcck3ryR2C','2025-03-07 01:30:04','2025-03-07 01:30:04'),(87,'Aaron','Kerluke','gorczany.faye@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','7D7MWFGWp8','2025-03-07 01:30:04','2025-03-07 01:30:04'),(88,'Johnnie','Halvorson','koelpin.aiden@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','NEPC5kCBHS','2025-03-07 01:30:04','2025-03-07 01:30:04'),(89,'Richie','Mills','hermann.jaskolski@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','8bZOedLXIQ','2025-03-07 01:30:04','2025-03-07 01:30:04'),(90,'Broderick','Senger','gledner@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','kDTuX1iQBY','2025-03-07 01:30:04','2025-03-07 01:30:04'),(91,'Alfredo','Schmidt','ecorwin@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','ISn9kB7Agx','2025-03-07 01:30:04','2025-03-07 01:30:04'),(92,'Samara','Sawayn','vrath@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','PFHiDeVd3y','2025-03-07 01:30:04','2025-03-07 01:30:04'),(93,'Margret','Kulas','jacobs.liza@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','EUBSZSEsc4','2025-03-07 01:30:04','2025-03-07 01:30:04'),(94,'Dorothea','Stoltenberg','goodwin.jameson@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','fnbp4ij8rC','2025-03-07 01:30:04','2025-03-07 01:30:04'),(95,'Eino','Krajcik','corrine.kuhn@example.com','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','oXPrWSE3tB','2025-03-07 01:30:04','2025-03-07 01:30:04'),(96,'Nathen','Donnelly','xschmidt@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','cwwuKJjsiv','2025-03-07 01:30:04','2025-03-07 01:30:04'),(97,'Luisa','Hermann','rosalinda.considine@example.net','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','kNtj7ZlidS','2025-03-07 01:30:04','2025-03-07 01:30:04'),(98,'Roy','Stoltenberg','pgutmann@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','TTGxP8snyq','2025-03-07 01:30:04','2025-03-07 01:30:04'),(99,'Corbin','Raynor','general56@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','P4rLMUofRd','2025-03-07 01:30:04','2025-03-07 01:30:04'),(100,'Keshawn','Mayert','balistreri.francesca@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','p3ih1G8Vg3','2025-03-07 01:30:04','2025-03-07 01:30:04'),(101,'Jeremie','Padberg','lueilwitz.abelardo@example.org','2025-03-07 01:30:04','$2y$12$MmvAOJGM7YF8z2380WdhyeUPpwmlN.4DIpLsACZ6rNhsJkNUYPEWi','YOtOfU6VZX','2025-03-07 01:30:04','2025-03-07 01:30:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07  6:28:04
