-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: medius
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_tags_blog_id_foreign` (`blog_id`),
  CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tags`
--

LOCK TABLES `blog_tags` WRITE;
/*!40000 ALTER TABLE `blog_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_post` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint unsigned NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_blog_category_id_foreign` (`blog_category_id`),
  CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2020_08_28_072131_create_blog_categories_table',3),(7,'2020_08_28_072234_create_blogs_table',3),(8,'2020_08_28_103502_create_variants_table',3),(10,'2020_08_28_104103_create_blog_tags_table',3),(14,'2020_08_28_063029_create_products_table',4),(15,'2020_08_28_103644_create_product_images_table',4),(16,'2020_08_31_065549_create_product_variants_table',4),(17,'2020_08_31_073704_create_product_variant_prices_table',4),(18,'2020_08_31_081510_create_product_variant_price_relation_table',4),(19,'2022_01_09_122911_create_variant_details_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,12,'image/s_Setting2.png',NULL,'2022-01-10 10:43:15','2022-01-10 10:43:15'),(2,12,'image/s_setting1.png',NULL,'2022-01-10 10:43:15','2022-01-10 10:43:15'),(3,12,'image/songkolpo.png',NULL,'2022-01-10 10:43:15','2022-01-10 10:43:15'),(4,13,'image/s_Setting2.png',NULL,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(5,13,'image/s_setting1.png',NULL,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(6,13,'image/songkolpo.png',NULL,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(7,14,'image/s_Setting2.png',NULL,'2022-01-10 11:20:33','2022-01-10 11:20:33'),(8,14,'image/s_setting1.png',NULL,'2022-01-10 11:20:33','2022-01-10 11:20:33'),(9,14,'image/songkolpo.png',NULL,'2022-01-10 11:20:33','2022-01-10 11:20:33'),(10,15,'image/s_Setting2.png',NULL,'2022-01-10 11:24:59','2022-01-10 11:24:59'),(11,15,'image/s_setting1.png',NULL,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(12,15,'image/songkolpo.png',NULL,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(13,16,'image/s_Setting2.png',NULL,'2022-01-10 11:28:21','2022-01-10 11:28:21'),(14,16,'image/s_setting1.png',NULL,'2022-01-10 11:28:21','2022-01-10 11:28:21'),(15,16,'image/songkolpo.png',NULL,'2022-01-10 11:28:21','2022-01-10 11:28:21'),(16,17,'image/s_Setting2.png',NULL,'2022-01-10 11:31:04','2022-01-10 11:31:04'),(17,17,'image/s_setting1.png',NULL,'2022-01-10 11:31:04','2022-01-10 11:31:04'),(18,17,'image/songkolpo.png',NULL,'2022-01-10 11:31:04','2022-01-10 11:31:04');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_prices`
--

DROP TABLE IF EXISTS `product_variant_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_variant_one` bigint unsigned DEFAULT NULL,
  `product_variant_two` bigint unsigned DEFAULT NULL,
  `product_variant_three` bigint unsigned DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variant_prices_product_id_foreign` (`product_id`),
  KEY `product_variant_prices_product_variant_one_foreign` (`product_variant_one`),
  KEY `product_variant_prices_product_variant_two_foreign` (`product_variant_two`),
  KEY `product_variant_prices_product_variant_three_foreign` (`product_variant_three`),
  CONSTRAINT `product_variant_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_prices_product_variant_one_foreign` FOREIGN KEY (`product_variant_one`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_prices_product_variant_three_foreign` FOREIGN KEY (`product_variant_three`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_prices_product_variant_two_foreign` FOREIGN KEY (`product_variant_two`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_prices`
--

LOCK TABLES `product_variant_prices` WRITE;
/*!40000 ALTER TABLE `product_variant_prices` DISABLE KEYS */;
INSERT INTO `product_variant_prices` VALUES (1,1,4,NULL,150,150,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(2,1,5,NULL,15,54,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(3,1,6,NULL,564564,546,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(4,2,4,NULL,54,45,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(5,2,5,NULL,45,45,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(6,2,6,NULL,454,45,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(7,3,4,NULL,45,54,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(8,3,5,NULL,54,54,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(9,3,6,NULL,54,545,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(10,4,1,NULL,150,150,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(11,4,2,NULL,15,15,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(12,4,3,NULL,15,15,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(13,8,1,NULL,15,15,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(14,8,2,NULL,15,15,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(15,8,3,NULL,51,515,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(16,1,4,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(17,1,4,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(18,1,8,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(19,1,8,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(20,1,6,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(21,1,6,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(22,2,4,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(23,2,4,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(24,2,8,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(25,2,8,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(26,2,6,17,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(27,2,6,18,0,0,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(28,1,4,17,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(29,1,4,18,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(30,1,8,17,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(31,1,8,18,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(32,1,6,17,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(33,1,6,18,0,0,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(34,2,4,17,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(35,2,4,18,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(36,2,8,17,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(37,2,8,18,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(38,2,6,17,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(39,2,6,18,0,0,4,'2020-08-31 10:21:45','2020-08-31 10:21:45'),(40,1,4,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(41,1,4,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(42,1,8,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(43,1,8,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(44,1,6,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(45,1,6,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(46,2,4,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(47,2,4,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(48,2,8,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(49,2,8,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(50,2,6,17,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(51,2,6,18,0,0,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(52,1,4,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(53,1,4,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(54,1,8,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(55,1,8,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(56,1,6,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(57,1,6,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(58,2,4,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(59,2,4,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(60,2,8,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(61,2,8,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(62,2,6,17,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(63,2,6,18,0,0,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(64,1,4,17,0,0,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(65,1,4,18,0,0,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(66,1,8,17,0,0,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(67,1,8,18,0,0,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(68,1,6,17,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(69,1,6,18,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(70,2,4,17,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(71,2,4,18,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(72,2,8,17,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(73,2,8,18,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(74,2,6,17,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(75,2,6,18,0,0,7,'2020-08-31 10:38:40','2020-08-31 10:38:40'),(76,20,4,1,0,0,11,'2022-01-10 10:26:54','2022-01-10 10:26:54'),(77,20,4,2,0,0,11,'2022-01-10 10:29:10','2022-01-10 10:29:10'),(78,20,4,3,0,0,11,'2022-01-10 10:34:12','2022-01-10 10:34:12'),(79,20,8,1,0,0,11,'2022-01-10 10:34:13','2022-01-10 10:34:13'),(80,20,8,2,0,0,11,'2022-01-10 10:34:13','2022-01-10 10:34:13'),(81,20,8,3,0,0,11,'2022-01-10 10:34:13','2022-01-10 10:34:13'),(84,1,4,NULL,100,100,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(85,2,8,NULL,1000,100,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(86,3,6,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(87,1,4,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(88,2,8,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(89,3,6,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(90,1,4,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(91,2,8,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(92,3,6,NULL,100,100,12,'2022-01-10 10:43:17','2022-01-10 10:43:17'),(93,1,4,NULL,0,0,13,'2022-01-10 10:49:46','2022-01-10 10:49:46'),(94,3,8,NULL,0,0,13,'2022-01-10 10:49:46','2022-01-10 10:49:46'),(95,1,4,NULL,0,0,13,'2022-01-10 10:49:46','2022-01-10 10:49:46'),(96,3,8,NULL,0,0,13,'2022-01-10 10:49:46','2022-01-10 10:49:46'),(97,1,4,NULL,0,0,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(98,3,8,NULL,0,0,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(99,2,4,NULL,0,0,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(100,3,8,NULL,0,0,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(101,1,4,NULL,0,0,15,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(102,2,4,NULL,0,0,15,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(103,1,4,NULL,0,0,16,'2022-01-10 11:28:22','2022-01-10 11:28:22'),(104,2,4,NULL,0,0,16,'2022-01-10 11:28:22','2022-01-10 11:28:22'),(105,1,4,NULL,0,0,17,'2022-01-10 11:31:05','2022-01-10 11:31:05'),(106,2,4,NULL,0,0,17,'2022-01-10 11:31:05','2022-01-10 11:31:05');
/*!40000 ALTER TABLE `product_variant_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_variant_id_foreign` (`variant_id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (1,'red',1,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(2,'green',1,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(3,'blue',1,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(4,'xl',2,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(5,'sm',2,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(6,'m',2,1,'2020-08-31 02:18:53','2020-08-31 02:18:53'),(7,'XL',2,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(8,'L',2,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(9,'red',1,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(10,'green',1,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(11,'blue',1,2,'2020-08-31 09:25:57','2020-08-31 09:25:57'),(12,'red',1,3,'2020-08-31 10:21:29','2020-08-31 10:21:29'),(13,'green',1,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(14,'xl',2,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(15,'l',2,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(16,'m',2,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(17,'v-nick',6,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(18,'o-nick',6,3,'2020-08-31 10:21:30','2020-08-31 10:21:30'),(19,'red',1,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(20,'green',1,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(21,'xl',2,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(22,'l',2,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(23,'m',2,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(24,'v-nick',6,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(25,'o-nick',6,4,'2020-08-31 10:21:44','2020-08-31 10:21:44'),(26,'red',1,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(27,'green',1,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(28,'xl',2,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(29,'l',2,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(30,'m',2,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(31,'v-nick',6,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(32,'o-nick',6,5,'2020-08-31 10:37:15','2020-08-31 10:37:15'),(33,'red',1,6,'2020-08-31 10:38:17','2020-08-31 10:38:17'),(34,'green',1,6,'2020-08-31 10:38:17','2020-08-31 10:38:17'),(35,'xl',2,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(36,'l',2,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(37,'m',2,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(38,'v-nick',6,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(39,'o-nick',6,6,'2020-08-31 10:38:18','2020-08-31 10:38:18'),(40,'red',1,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(41,'green',1,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(42,'xl',2,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(43,'l',2,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(44,'m',2,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(45,'v-nick',6,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(46,'o-nick',6,7,'2020-08-31 10:38:39','2020-08-31 10:38:39'),(47,'red',1,10,'2022-01-10 10:14:00','2022-01-10 10:14:00'),(48,'blue',1,10,'2022-01-10 10:14:00','2022-01-10 10:14:00'),(49,'green',1,10,'2022-01-10 10:14:01','2022-01-10 10:14:01'),(50,'XL',2,10,'2022-01-10 10:14:01','2022-01-10 10:14:01'),(51,'L',2,10,'2022-01-10 10:14:01','2022-01-10 10:14:01'),(52,'kl',6,10,'2022-01-10 10:14:01','2022-01-10 10:14:01'),(53,'red',1,11,'2022-01-10 10:17:52','2022-01-10 10:17:52'),(54,'green',1,11,'2022-01-10 10:17:52','2022-01-10 10:17:52'),(55,'blue',1,11,'2022-01-10 10:17:52','2022-01-10 10:17:52'),(56,'XL',2,11,'2022-01-10 10:17:52','2022-01-10 10:17:52'),(57,'L',2,11,'2022-01-10 10:17:53','2022-01-10 10:17:53'),(58,'v-neck',6,11,'2022-01-10 10:17:53','2022-01-10 10:17:53'),(59,'red',1,12,'2022-01-10 10:43:15','2022-01-10 10:43:15'),(60,'green',1,12,'2022-01-10 10:43:15','2022-01-10 10:43:15'),(61,'blue',1,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(62,'XL',2,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(63,'L',2,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(64,'M',2,12,'2022-01-10 10:43:16','2022-01-10 10:43:16'),(65,'red',1,13,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(66,'blue',1,13,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(67,'xl',2,13,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(68,'L',2,13,'2022-01-10 10:49:45','2022-01-10 10:49:45'),(69,'red',1,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(70,'blue',1,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(71,'xl',2,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(72,'L',2,14,'2022-01-10 11:20:34','2022-01-10 11:20:34'),(73,'red',1,15,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(74,'green',1,15,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(75,'xl',2,15,'2022-01-10 11:25:00','2022-01-10 11:25:00'),(76,'red',1,16,'2022-01-10 11:28:21','2022-01-10 11:28:21'),(77,'green',1,16,'2022-01-10 11:28:21','2022-01-10 11:28:21'),(78,'XL',2,16,'2022-01-10 11:28:22','2022-01-10 11:28:22'),(79,'red',1,17,'2022-01-10 11:31:04','2022-01-10 11:31:04'),(80,'green',1,17,'2022-01-10 11:31:04','2022-01-10 11:31:04'),(81,'xl',2,17,'2022-01-10 11:31:05','2022-01-10 11:31:05');
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product Name','asdflasdf','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 02:18:53','2020-08-31 02:18:53'),(2,'Product Two','adfsadfsasf','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 09:25:57','2020-08-31 09:25:57'),(3,'Product Three','afdafdfasdfasasdf','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 10:21:29','2020-08-31 10:21:29'),(4,'Product Four','afdafdfasdfasasdfadsf','adsfadft is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 10:21:44','2020-08-31 10:21:44'),(5,'T-Shirt','t-shirt','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 10:37:15','2020-08-31 10:37:15'),(6,'T-Shirt RED','t-shirt-red','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 10:38:17','2020-08-31 10:38:17'),(7,'Formal Shirt','formal-shirt','t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)','2020-08-31 10:38:39','2020-08-31 10:38:39'),(10,'aminul1','aminul1','12345678asdf asdf asdf','2022-01-10 10:14:00','2022-01-10 10:14:00'),(11,'amin2','sdferdfsdf','this di product','2022-01-10 10:17:51','2022-01-10 10:17:51'),(12,'aminul3','ami3undf','this is third try','2022-01-10 10:43:15','2022-01-10 10:43:15'),(13,'aminul4','ami4check','this is no4 check','2022-01-10 10:49:45','2022-01-10 10:49:45'),(14,'try5','dsdf5','this is try5','2022-01-10 11:20:33','2022-01-10 11:20:33'),(15,'try6','try6','asldjfasdfj','2022-01-10 11:24:59','2022-01-10 11:24:59'),(16,'try7','asdf','asd asdf asd fasdf','2022-01-10 11:28:21','2022-01-10 11:28:21'),(17,'try8','this is last try','asdfasdf asfd','2022-01-10 11:31:03','2022-01-10 11:31:03');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com',NULL,'$2y$10$soMyWwKG35anIpQ2VgSXdezVyw1E4pD8PoK0FvumOuF2aEgwxG6WK',NULL,'2020-08-28 00:03:42','2021-12-28 14:46:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_details`
--

DROP TABLE IF EXISTS `variant_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variant_details_variant_id_foreign` (`variant_id`),
  CONSTRAINT `variant_details_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_details`
--

LOCK TABLES `variant_details` WRITE;
/*!40000 ALTER TABLE `variant_details` DISABLE KEYS */;
INSERT INTO `variant_details` VALUES (1,'red',1,'2022-01-09 06:36:23','2022-01-09 06:36:23'),(2,'green',1,'2022-01-09 06:37:19','2022-01-09 06:37:19'),(3,'blue',1,'2022-01-09 06:38:14','2022-01-09 06:38:14'),(4,'xl',2,'2022-01-09 06:39:57','2022-01-09 06:39:57'),(5,'sm',2,'2022-01-09 06:40:37','2022-01-09 06:40:37'),(6,'m',2,'2022-01-09 06:41:04','2022-01-09 06:41:04'),(7,'XL',2,'2022-01-09 06:42:23','2022-01-09 06:42:23'),(8,'L',2,'2022-01-09 06:43:36','2022-01-09 06:43:36'),(17,'v-nick',6,'2022-01-09 06:45:23','2022-01-09 06:45:23'),(18,'o-nick',6,'2022-01-09 06:46:11','2022-01-09 06:46:11'),(19,'kl',6,'2022-01-10 10:14:01','2022-01-10 10:14:01'),(20,'v-neck',6,'2022-01-10 10:17:53','2022-01-10 10:17:53'),(21,'M',2,'2022-01-10 10:43:16','2022-01-10 10:43:16');
/*!40000 ALTER TABLE `variant_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variants_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,'Color','asdfadsf',NULL,'2020-08-31 08:53:32'),(2,'Size','adfsasdf',NULL,'2020-08-31 08:54:28'),(6,'Style','Description','2020-08-31 09:46:24','2020-08-31 09:46:24');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11  7:24:06
