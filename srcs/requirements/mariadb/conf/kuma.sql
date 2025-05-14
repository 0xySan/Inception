/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: kuma
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_key_user_id_foreign` (`user_id`),
  CONSTRAINT `api_key_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docker_host`
--

DROP TABLE IF EXISTS `docker_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `docker_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `docker_daemon` varchar(255) DEFAULT NULL,
  `docker_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docker_host`
--

LOCK TABLES `docker_host` WRITE;
/*!40000 ALTER TABLE `docker_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `docker_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat`
--

DROP TABLE IF EXISTS `heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `monitor_id` int(10) unsigned NOT NULL,
  `status` smallint(6) NOT NULL,
  `msg` text DEFAULT NULL,
  `time` datetime NOT NULL,
  `ping` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `down_count` int(11) NOT NULL DEFAULT 0,
  `end_time` datetime DEFAULT NULL,
  `retries` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `heartbeat_important_index` (`important`),
  KEY `monitor_time_index` (`monitor_id`,`time`),
  KEY `heartbeat_monitor_id_index` (`monitor_id`),
  KEY `monitor_important_time_index` (`monitor_id`,`important`,`time`),
  CONSTRAINT `heartbeat_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `style` varchar(30) NOT NULL DEFAULT 'warning',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations`
--

DROP TABLE IF EXISTS `knex_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations`
--

LOCK TABLES `knex_migrations` WRITE;
/*!40000 ALTER TABLE `knex_migrations` DISABLE KEYS */;
INSERT INTO `knex_migrations` VALUES
(1,'2023-08-16-0000-create-uptime.js',1,'2025-05-14 15:44:32'),
(2,'2023-08-18-0301-heartbeat.js',1,'2025-05-14 15:44:32'),
(3,'2023-09-29-0000-heartbeat-retires.js',1,'2025-05-14 15:44:32'),
(4,'2023-10-08-0000-mqtt-query.js',1,'2025-05-14 15:44:32'),
(5,'2023-10-11-1915-push-token-to-32.js',1,'2025-05-14 15:44:32'),
(6,'2023-10-16-0000-create-remote-browsers.js',1,'2025-05-14 15:44:32'),
(7,'2023-12-20-0000-alter-status-page.js',1,'2025-05-14 15:44:32'),
(8,'2023-12-21-0000-stat-ping-min-max.js',1,'2025-05-14 15:44:32'),
(9,'2023-12-22-0000-hourly-uptime.js',1,'2025-05-14 15:44:32'),
(10,'2024-01-22-0000-stats-extras.js',1,'2025-05-14 15:44:32'),
(11,'2024-04-26-0000-snmp-monitor.js',1,'2025-05-14 15:44:32'),
(12,'2024-08-24-000-add-cache-bust.js',1,'2025-05-14 15:44:32'),
(13,'2024-08-24-0000-conditions.js',1,'2025-05-14 15:44:32'),
(14,'2024-10-1315-rabbitmq-monitor.js',1,'2025-05-14 15:44:32'),
(15,'2024-10-31-0000-fix-snmp-monitor.js',1,'2025-05-14 15:44:32'),
(16,'2024-11-27-1927-fix-info-json-data-type.js',1,'2025-05-14 15:44:32'),
(17,'2025-03-25-0127-fix-5721.js',1,'2025-05-14 15:44:32'),
(18,'2025-05-09-0000-add-custom-url.js',1,'2025-05-14 15:44:32');
/*!40000 ALTER TABLE `knex_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations_lock`
--

DROP TABLE IF EXISTS `knex_migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations_lock` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations_lock`
--

LOCK TABLES `knex_migrations_lock` WRITE;
/*!40000 ALTER TABLE `knex_migrations_lock` DISABLE KEYS */;
INSERT INTO `knex_migrations_lock` VALUES
(1,0);
/*!40000 ALTER TABLE `knex_migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `strategy` varchar(50) NOT NULL DEFAULT 'single',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `weekdays` varchar(250) DEFAULT '[]',
  `days_of_month` text DEFAULT '[]',
  `interval_day` int(11) DEFAULT NULL,
  `cron` text DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_active_index` (`active`),
  KEY `manual_active` (`strategy`,`active`),
  KEY `maintenance_user_id` (`user_id`),
  CONSTRAINT `maintenance_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_status_page`
--

DROP TABLE IF EXISTS `maintenance_status_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_status_page_status_page_id_foreign` (`status_page_id`),
  KEY `maintenance_status_page_maintenance_id_foreign` (`maintenance_id`),
  CONSTRAINT `maintenance_status_page_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maintenance_status_page_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_status_page`
--

LOCK TABLES `maintenance_status_page` WRITE;
/*!40000 ALTER TABLE `maintenance_status_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_status_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 20,
  `url` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `weight` int(11) DEFAULT 2000,
  `hostname` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `keyword` varchar(255) DEFAULT NULL,
  `maxretries` int(11) NOT NULL DEFAULT 0,
  `ignore_tls` tinyint(1) NOT NULL DEFAULT 0,
  `upside_down` tinyint(1) NOT NULL DEFAULT 0,
  `maxredirects` int(11) NOT NULL DEFAULT 10,
  `accepted_statuscodes_json` text NOT NULL DEFAULT '["200-299"]',
  `dns_resolve_type` varchar(5) DEFAULT NULL,
  `dns_resolve_server` varchar(255) DEFAULT NULL,
  `dns_last_result` varchar(255) DEFAULT NULL,
  `retry_interval` int(11) NOT NULL DEFAULT 0,
  `push_token` varchar(32) DEFAULT NULL,
  `method` text NOT NULL DEFAULT 'GET',
  `body` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `basic_auth_user` text DEFAULT NULL,
  `basic_auth_pass` text DEFAULT NULL,
  `docker_host` int(10) unsigned DEFAULT NULL,
  `docker_container` varchar(255) DEFAULT NULL,
  `proxy_id` int(10) unsigned DEFAULT NULL,
  `expiry_notification` tinyint(1) DEFAULT 1,
  `mqtt_topic` text DEFAULT NULL,
  `mqtt_success_message` varchar(255) DEFAULT NULL,
  `mqtt_username` varchar(255) DEFAULT NULL,
  `mqtt_password` varchar(255) DEFAULT NULL,
  `database_connection_string` varchar(2000) DEFAULT NULL,
  `database_query` text DEFAULT NULL,
  `auth_method` varchar(250) DEFAULT NULL,
  `auth_domain` text DEFAULT NULL,
  `auth_workstation` text DEFAULT NULL,
  `grpc_url` varchar(255) DEFAULT NULL,
  `grpc_protobuf` text DEFAULT NULL,
  `grpc_body` text DEFAULT NULL,
  `grpc_metadata` text DEFAULT NULL,
  `grpc_method` text DEFAULT NULL,
  `grpc_service_name` text DEFAULT NULL,
  `grpc_enable_tls` tinyint(1) NOT NULL DEFAULT 0,
  `radius_username` varchar(255) DEFAULT NULL,
  `radius_password` varchar(255) DEFAULT NULL,
  `radius_calling_station_id` varchar(50) DEFAULT NULL,
  `radius_called_station_id` varchar(50) DEFAULT NULL,
  `radius_secret` varchar(255) DEFAULT NULL,
  `resend_interval` int(11) NOT NULL DEFAULT 0,
  `packet_size` int(11) NOT NULL DEFAULT 56,
  `game` varchar(255) DEFAULT NULL,
  `http_body_encoding` varchar(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tls_ca` text DEFAULT NULL,
  `tls_cert` text DEFAULT NULL,
  `tls_key` text DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `invert_keyword` tinyint(1) NOT NULL DEFAULT 0,
  `json_path` text DEFAULT NULL,
  `expected_value` varchar(255) DEFAULT NULL,
  `kafka_producer_topic` varchar(255) DEFAULT NULL,
  `kafka_producer_brokers` text DEFAULT NULL,
  `kafka_producer_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_allow_auto_topic_creation` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_sasl_options` text DEFAULT NULL,
  `kafka_producer_message` text DEFAULT NULL,
  `oauth_client_id` text DEFAULT NULL,
  `oauth_client_secret` text DEFAULT NULL,
  `oauth_token_url` text DEFAULT NULL,
  `oauth_scopes` text DEFAULT NULL,
  `oauth_auth_method` text DEFAULT NULL,
  `timeout` double NOT NULL DEFAULT 0,
  `gamedig_given_port_only` tinyint(1) NOT NULL DEFAULT 1,
  `mqtt_check_type` varchar(255) NOT NULL DEFAULT 'keyword',
  `remote_browser` int(10) unsigned DEFAULT NULL,
  `snmp_oid` varchar(255) DEFAULT NULL,
  `snmp_version` enum('1','2c','3') DEFAULT '2c',
  `json_path_operator` varchar(255) DEFAULT NULL,
  `cache_bust` tinyint(1) NOT NULL DEFAULT 0,
  `conditions` text NOT NULL DEFAULT '[]',
  `rabbitmq_nodes` text DEFAULT NULL,
  `rabbitmq_username` varchar(255) DEFAULT NULL,
  `rabbitmq_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_user_id_foreign` (`user_id`),
  KEY `monitor_docker_host_foreign` (`docker_host`),
  KEY `monitor_proxy_id_foreign` (`proxy_id`),
  KEY `monitor_parent_foreign` (`parent`),
  KEY `monitor_remote_browser_index` (`remote_browser`),
  CONSTRAINT `monitor_docker_host_foreign` FOREIGN KEY (`docker_host`) REFERENCES `docker_host` (`id`),
  CONSTRAINT `monitor_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `monitor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `monitor_proxy_id_foreign` FOREIGN KEY (`proxy_id`) REFERENCES `proxy` (`id`),
  CONSTRAINT `monitor_remote_browser_foreign` FOREIGN KEY (`remote_browser`) REFERENCES `remote_browser` (`id`),
  CONSTRAINT `monitor_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor`
--

LOCK TABLES `monitor` WRITE;
/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
INSERT INTO `monitor` VALUES
(1,'wordpress',1,1,20,'https://nginx','http',2000,NULL,NULL,'2025-05-14 15:45:26',NULL,0,1,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,'json',NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','',''),
(2,'mariadb',1,1,20,'https://','mysql',2000,NULL,NULL,'2025-05-14 15:46:20',NULL,0,0,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','','mysql://etaquet:1234@mariadb:3306/42db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','',''),
(3,'adminer',1,1,20,'http://adminer:8080','http',2000,NULL,NULL,'2025-05-14 15:47:33',NULL,0,0,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,'json',NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','',''),
(4,'sftp',1,1,20,'https://','port',2000,'sftp',22,'2025-05-14 15:48:04',NULL,0,0,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','','');
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_group`
--

DROP TABLE IF EXISTS `monitor_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `send_url` tinyint(1) NOT NULL DEFAULT 0,
  `custom_url` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_group_group_id_foreign` (`group_id`),
  KEY `fk` (`monitor_id`,`group_id`),
  CONSTRAINT `monitor_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_group_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_group`
--

LOCK TABLES `monitor_group` WRITE;
/*!40000 ALTER TABLE `monitor_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_maintenance`
--

DROP TABLE IF EXISTS `monitor_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_id_index2` (`maintenance_id`),
  KEY `monitor_id_index` (`monitor_id`),
  CONSTRAINT `monitor_maintenance_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_maintenance_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_maintenance`
--

LOCK TABLES `monitor_maintenance` WRITE;
/*!40000 ALTER TABLE `monitor_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_notification`
--

DROP TABLE IF EXISTS `monitor_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_notification_notification_id_foreign` (`notification_id`),
  KEY `monitor_notification_index` (`monitor_id`,`notification_id`),
  CONSTRAINT `monitor_notification_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_notification`
--

LOCK TABLES `monitor_notification` WRITE;
/*!40000 ALTER TABLE `monitor_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_tag`
--

DROP TABLE IF EXISTS `monitor_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tag_monitor_id_foreign` (`monitor_id`),
  KEY `monitor_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `monitor_tag_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_tag`
--

LOCK TABLES `monitor_tag` WRITE;
/*!40000 ALTER TABLE `monitor_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_tls_info`
--

DROP TABLE IF EXISTS `monitor_tls_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_tls_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `info_json` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tls_info_monitor_id_foreign` (`monitor_id`),
  CONSTRAINT `monitor_tls_info_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_tls_info`
--

LOCK TABLES `monitor_tls_info` WRITE;
/*!40000 ALTER TABLE `monitor_tls_info` DISABLE KEYS */;
INSERT INTO `monitor_tls_info` VALUES
(1,1,'{\"valid\":false,\"certInfo\":{\"subject\":{\"C\":\"FR\",\"ST\":\"Normandie\",\"L\":\"Le Havre\",\"O\":\"42\",\"CN\":\"etaquet\"},\"issuer\":{\"C\":\"FR\",\"ST\":\"Normandie\",\"L\":\"Le Havre\",\"O\":\"42\",\"CN\":\"etaquet\"},\"ca\":true,\"modulus\":\"AED0B08A1516A0C1527E62EF5554F2EB52590BB6A3D7983EFAA44B0DAAA165E9E584711C5A41D391B1EF01F672667C874AE3E7A40FBBFB0E38DA24101015E29464896A4F0160C6629F0A5E22D70BF21C190BD445A7CACBA9DB6BE02A3116470F2E501629CB08F47840099C187F7FA58BACDC9DE5F61A062F25C931FB4D7CB479994F23566670ACF3F6A8E60E65AD8A264ADCF2732EBE79520D29FC98EA4DC69527DB4F423C73ACEEEF75F6ACABE26B5509F7E69C9EE229413950D92A88C7370F532284B1A492524731ADCF548DA39707E58C45C08BB68D3BC8C695AF80C3CE5D6F892712F7163F3896DC767F4CF52E9CDA41F2881B4B912B2112EE096F30BDA04E6A8F5FEA163F735FEC2742E29CE9531C8EFE4638010CD88350225D8DF3A3FAAC12FDB9759232A02ED05CBA0A5D2C0C7C1D9982D23F5B4B69E1989160D79038EDCD7F3F8B1A0951D2CE387D341E6258DFC44CACA0E87473310C2C7123D711F2EF20C9D278801E4BDC487A70949C36C3DA559E44179FDC9A11934EDED75863C98B620F8B79B9F959FF320935FE72A1BA46C616FAF95FC7375220969E8DBE8CC98B3C95F8FEC272C5A599F4108D392ED8E6C203B88279A8839ED23797AB2FA485A3DADC84E8BB64C09B1D60C3EF1B247D350800910DF87E7FF1E351B54C5E03967B84CAF4324E4151F6B5CBA902BC79243A66305ACD31681581E3775252A9C0AD\",\"bits\":4096,\"exponent\":\"0x10001\",\"pubkey\":{\"type\":\"Buffer\",\"data\":[48,130,2,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,2,15,0,48,130,2,10,2,130,2,1,0,174,208,176,138,21,22,160,193,82,126,98,239,85,84,242,235,82,89,11,182,163,215,152,62,250,164,75,13,170,161,101,233,229,132,113,28,90,65,211,145,177,239,1,246,114,102,124,135,74,227,231,164,15,187,251,14,56,218,36,16,16,21,226,148,100,137,106,79,1,96,198,98,159,10,94,34,215,11,242,28,25,11,212,69,167,202,203,169,219,107,224,42,49,22,71,15,46,80,22,41,203,8,244,120,64,9,156,24,127,127,165,139,172,220,157,229,246,26,6,47,37,201,49,251,77,124,180,121,153,79,35,86,102,112,172,243,246,168,230,14,101,173,138,38,74,220,242,115,46,190,121,82,13,41,252,152,234,77,198,149,39,219,79,66,60,115,172,238,239,117,246,172,171,226,107,85,9,247,230,156,158,226,41,65,57,80,217,42,136,199,55,15,83,34,132,177,164,146,82,71,49,173,207,84,141,163,151,7,229,140,69,192,139,182,141,59,200,198,149,175,128,195,206,93,111,137,39,18,247,22,63,56,150,220,118,127,76,245,46,156,218,65,242,136,27,75,145,43,33,18,238,9,111,48,189,160,78,106,143,95,234,22,63,115,95,236,39,66,226,156,233,83,28,142,254,70,56,1,12,216,131,80,34,93,141,243,163,250,172,18,253,185,117,146,50,160,46,208,92,186,10,93,44,12,124,29,153,130,210,63,91,75,105,225,152,145,96,215,144,56,237,205,127,63,139,26,9,81,210,206,56,125,52,30,98,88,223,196,76,172,160,232,116,115,49,12,44,113,35,215,17,242,239,32,201,210,120,128,30,75,220,72,122,112,148,156,54,195,218,85,158,68,23,159,220,154,17,147,78,222,215,88,99,201,139,98,15,139,121,185,249,89,255,50,9,53,254,114,161,186,70,198,22,250,249,95,199,55,82,32,150,158,141,190,140,201,139,60,149,248,254,194,114,197,165,153,244,16,141,57,46,216,230,194,3,184,130,121,168,131,158,210,55,151,171,47,164,133,163,218,220,132,232,187,100,192,155,29,96,195,239,27,36,125,53,8,0,145,13,248,126,127,241,227,81,181,76,94,3,150,123,132,202,244,50,78,65,81,246,181,203,169,2,188,121,36,58,102,48,90,205,49,104,21,129,227,119,82,82,169,192,173,2,3,1,0,1]},\"valid_from\":\"May 14 15:43:25 2025 GMT\",\"valid_to\":\"May 14 15:43:25 2026 GMT\",\"fingerprint\":\"3F:EE:9B:36:22:77:52:81:3C:7E:64:37:9D:C4:7F:57:B1:22:51:EF\",\"fingerprint256\":\"66:76:73:6D:00:52:AD:48:F5:FD:38:08:39:48:1C:8D:9F:62:6C:11:79:58:1A:3D:95:2A:90:E8:0A:95:C4:5F\",\"fingerprint512\":\"60:73:6C:3E:BC:5C:96:F8:BE:08:CB:C6:69:CC:CB:82:7B:B0:24:DC:CB:9B:16:81:2F:EA:51:BE:0C:44:8D:F5:F9:6E:58:45:2D:EE:6D:F1:36:E5:BC:59:73:77:17:A3:A2:C6:0A:50:29:B7:9C:9C:43:76:07:56:F8:93:59:2A\",\"serialNumber\":\"7A9B609672529467CCB1FFCDAF6461A089DBF765\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,5,135,48,130,3,111,160,3,2,1,2,2,20,122,155,96,150,114,82,148,103,204,177,255,205,175,100,97,160,137,219,247,101,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,83,49,11,48,9,6,3,85,4,6,19,2,70,82,49,18,48,16,6,3,85,4,8,12,9,78,111,114,109,97,110,100,105,101,49,17,48,15,6,3,85,4,7,12,8,76,101,32,72,97,118,114,101,49,11,48,9,6,3,85,4,10,12,2,52,50,49,16,48,14,6,3,85,4,3,12,7,101,116,97,113,117,101,116,48,30,23,13,50,53,48,53,49,52,49,53,52,51,50,53,90,23,13,50,54,48,53,49,52,49,53,52,51,50,53,90,48,83,49,11,48,9,6,3,85,4,6,19,2,70,82,49,18,48,16,6,3,85,4,8,12,9,78,111,114,109,97,110,100,105,101,49,17,48,15,6,3,85,4,7,12,8,76,101,32,72,97,118,114,101,49,11,48,9,6,3,85,4,10,12,2,52,50,49,16,48,14,6,3,85,4,3,12,7,101,116,97,113,117,101,116,48,130,2,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,2,15,0,48,130,2,10,2,130,2,1,0,174,208,176,138,21,22,160,193,82,126,98,239,85,84,242,235,82,89,11,182,163,215,152,62,250,164,75,13,170,161,101,233,229,132,113,28,90,65,211,145,177,239,1,246,114,102,124,135,74,227,231,164,15,187,251,14,56,218,36,16,16,21,226,148,100,137,106,79,1,96,198,98,159,10,94,34,215,11,242,28,25,11,212,69,167,202,203,169,219,107,224,42,49,22,71,15,46,80,22,41,203,8,244,120,64,9,156,24,127,127,165,139,172,220,157,229,246,26,6,47,37,201,49,251,77,124,180,121,153,79,35,86,102,112,172,243,246,168,230,14,101,173,138,38,74,220,242,115,46,190,121,82,13,41,252,152,234,77,198,149,39,219,79,66,60,115,172,238,239,117,246,172,171,226,107,85,9,247,230,156,158,226,41,65,57,80,217,42,136,199,55,15,83,34,132,177,164,146,82,71,49,173,207,84,141,163,151,7,229,140,69,192,139,182,141,59,200,198,149,175,128,195,206,93,111,137,39,18,247,22,63,56,150,220,118,127,76,245,46,156,218,65,242,136,27,75,145,43,33,18,238,9,111,48,189,160,78,106,143,95,234,22,63,115,95,236,39,66,226,156,233,83,28,142,254,70,56,1,12,216,131,80,34,93,141,243,163,250,172,18,253,185,117,146,50,160,46,208,92,186,10,93,44,12,124,29,153,130,210,63,91,75,105,225,152,145,96,215,144,56,237,205,127,63,139,26,9,81,210,206,56,125,52,30,98,88,223,196,76,172,160,232,116,115,49,12,44,113,35,215,17,242,239,32,201,210,120,128,30,75,220,72,122,112,148,156,54,195,218,85,158,68,23,159,220,154,17,147,78,222,215,88,99,201,139,98,15,139,121,185,249,89,255,50,9,53,254,114,161,186,70,198,22,250,249,95,199,55,82,32,150,158,141,190,140,201,139,60,149,248,254,194,114,197,165,153,244,16,141,57,46,216,230,194,3,184,130,121,168,131,158,210,55,151,171,47,164,133,163,218,220,132,232,187,100,192,155,29,96,195,239,27,36,125,53,8,0,145,13,248,126,127,241,227,81,181,76,94,3,150,123,132,202,244,50,78,65,81,246,181,203,169,2,188,121,36,58,102,48,90,205,49,104,21,129,227,119,82,82,169,192,173,2,3,1,0,1,163,83,48,81,48,29,6,3,85,29,14,4,22,4,20,64,54,164,24,53,99,5,236,116,89,97,212,145,150,233,172,206,195,190,165,48,31,6,3,85,29,35,4,24,48,22,128,20,64,54,164,24,53,99,5,236,116,89,97,212,145,150,233,172,206,195,190,165,48,15,6,3,85,29,19,1,1,255,4,5,48,3,1,1,255,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,2,1,0,52,81,66,29,191,83,88,15,200,159,129,125,68,112,222,176,107,169,118,232,139,213,209,41,136,134,22,99,48,52,40,10,85,209,12,47,154,67,160,186,123,167,148,38,118,255,55,194,62,234,197,97,113,212,230,91,52,191,187,23,30,56,149,75,140,139,126,138,250,27,170,151,71,38,176,43,210,6,117,63,20,202,78,16,217,66,2,111,15,8,57,186,15,199,56,202,46,220,197,113,219,149,215,223,58,166,174,126,80,0,29,81,211,7,0,198,241,217,208,100,250,108,158,248,49,108,172,92,110,11,37,108,41,223,41,83,133,178,248,118,36,169,132,163,50,49,159,46,26,37,9,101,140,126,16,246,186,53,147,142,146,82,39,20,25,49,232,159,20,36,170,221,64,143,192,26,180,174,226,83,13,109,223,233,93,109,3,30,137,35,109,33,90,152,6,3,79,167,155,64,34,191,66,109,71,64,206,121,140,182,1,223,35,21,15,118,14,40,14,191,164,117,140,157,174,96,97,230,168,71,169,34,127,97,189,232,219,153,148,19,186,6,45,115,57,41,30,165,139,126,160,158,37,37,15,30,124,7,224,215,205,124,247,96,183,217,65,229,132,81,173,243,66,145,172,29,45,224,203,69,255,112,74,99,3,161,219,86,214,110,204,35,185,71,249,233,197,175,155,84,68,49,15,48,237,101,41,94,196,16,236,91,41,132,125,171,73,246,167,221,161,48,123,63,22,35,110,204,45,116,239,82,59,247,168,85,102,105,112,115,62,125,86,130,171,75,50,142,90,199,16,93,66,66,2,54,219,133,241,132,108,98,14,129,135,188,251,105,197,222,57,171,145,62,120,246,131,229,67,79,213,177,227,207,159,105,138,242,204,151,89,136,244,38,48,232,108,115,5,238,222,78,199,235,149,75,149,59,65,181,59,5,25,174,179,188,249,184,247,216,62,90,166,131,253,173,175,110,35,236,70,249,9,152,93,28,141,96,155,90,55,148,207,239,164,109,187,236,108,217,119,82,2,121,123,172,89,209,135,50,109,182,45,209,194,174,126,131,87,24,248,234,14,68,169,79,242,179,186,42,34,158,61,203,116,18,213,168,94,1,240,148,233,242,151,69,22,224,21,62,222,135,216,92,115,7,45,192,82,189,106,64]},\"issuerCertificate\":null,\"validTo\":\"2026-05-14T15:43:25.000Z\",\"daysRemaining\":365,\"certType\":\"self-signed\"}}');
/*!40000 ALTER TABLE `monitor_tls_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_sent_history`
--

DROP TABLE IF EXISTS `notification_sent_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_sent_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `monitor_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_sent_history_type_monitor_id_days_unique` (`type`,`monitor_id`,`days`),
  KEY `good_index` (`type`,`monitor_id`,`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_sent_history`
--

LOCK TABLES `notification_sent_history` WRITE;
/*!40000 ALTER TABLE `notification_sent_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_sent_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy`
--

DROP TABLE IF EXISTS `proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `auth` tinyint(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `proxy_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy`
--

LOCK TABLES `proxy` WRITE;
/*!40000 ALTER TABLE `proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remote_browser`
--

DROP TABLE IF EXISTS `remote_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `remote_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_browser`
--

LOCK TABLES `remote_browser` WRITE;
/*!40000 ALTER TABLE `remote_browser` DISABLE KEYS */;
/*!40000 ALTER TABLE `remote_browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES
(1,'migrateAggregateTableState','\"migrated\"',NULL),
(2,'jwtSecret','$2a$10$qxsQO88cDFJVJcwJ.Bl37.6RAG36wlcXPf16Abq9WxGkTn4PDBzZS',NULL),
(3,'initServerTimezone','true',NULL),
(4,'serverTimezone','\"Europe/Paris\"','general');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_daily`
--

DROP TABLE IF EXISTS `stat_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest day',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_daily_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_daily_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the daily aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_daily`
--

LOCK TABLES `stat_daily` WRITE;
/*!40000 ALTER TABLE `stat_daily` DISABLE KEYS */;
INSERT INTO `stat_daily` VALUES
(1,1,1747180800,279.64,14,0,159.00,464.00,NULL),
(2,2,1747180800,12.80,10,1,2.00,33.00,NULL),
(3,3,1747180800,34.78,9,0,19.00,59.00,NULL),
(4,4,1747180800,2.12,8,0,1.00,5.00,NULL);
/*!40000 ALTER TABLE `stat_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_hourly`
--

DROP TABLE IF EXISTS `stat_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_hourly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest hour',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_hourly_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_hourly_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the hourly aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hourly`
--

LOCK TABLES `stat_hourly` WRITE;
/*!40000 ALTER TABLE `stat_hourly` DISABLE KEYS */;
INSERT INTO `stat_hourly` VALUES
(1,1,1747234800,279.64,159.00,464.00,14,0,NULL),
(2,2,1747234800,12.80,2.00,33.00,10,1,NULL),
(3,3,1747234800,34.78,19.00,59.00,9,0,NULL),
(4,4,1747234800,2.12,1.00,5.00,8,0,NULL);
/*!40000 ALTER TABLE `stat_hourly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_minutely`
--

DROP TABLE IF EXISTS `stat_minutely`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_minutely` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest minute',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_minutely_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_minutely_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the minutely aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_minutely`
--

LOCK TABLES `stat_minutely` WRITE;
/*!40000 ALTER TABLE `stat_minutely` DISABLE KEYS */;
INSERT INTO `stat_minutely` VALUES
(1,1,1747237500,345.00,2,0,227.00,463.00,NULL),
(2,1,1747237560,187.33,3,0,159.00,210.00,NULL),
(3,2,1747237560,19.00,1,1,19.00,19.00,NULL),
(4,2,1747237620,18.50,2,0,13.00,24.00,NULL),
(5,3,1747237620,44.00,2,0,29.00,59.00,NULL),
(6,1,1747237620,368.50,2,0,273.00,464.00,NULL),
(7,4,1747237680,2.50,4,0,1.00,5.00,NULL),
(8,2,1747237680,8.67,3,0,8.00,10.00,NULL),
(9,3,1747237680,30.33,3,0,19.00,37.00,NULL),
(10,1,1747237680,243.33,3,0,218.00,263.00,NULL),
(11,4,1747237740,2.00,3,0,1.00,4.00,NULL),
(12,2,1747237740,14.67,3,0,4.00,33.00,NULL),
(13,3,1747237740,38.33,3,0,25.00,53.00,NULL),
(14,1,1747237740,338.67,3,0,212.00,446.00,NULL),
(15,4,1747237800,1.00,1,0,1.00,1.00,NULL),
(16,2,1747237800,2.00,1,0,2.00,2.00,NULL),
(17,3,1747237800,19.00,1,0,19.00,19.00,NULL),
(18,1,1747237800,180.00,1,0,180.00,180.00,NULL);
/*!40000 ALTER TABLE `stat_minutely` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_page`
--

DROP TABLE IF EXISTS `status_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) NOT NULL,
  `theme` varchar(30) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `search_engine_index` tinyint(1) NOT NULL DEFAULT 1,
  `show_tags` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `footer_text` text DEFAULT NULL,
  `custom_css` text DEFAULT NULL,
  `show_powered_by` tinyint(1) NOT NULL DEFAULT 1,
  `google_analytics_tag_id` varchar(255) DEFAULT NULL,
  `show_certificate_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `auto_refresh_interval` int(10) unsigned DEFAULT 300,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_page`
--

LOCK TABLES `status_page` WRITE;
/*!40000 ALTER TABLE `status_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_page_cname`
--

DROP TABLE IF EXISTS `status_page_cname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_page_cname` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_cname_domain_unique` (`domain`),
  KEY `status_page_cname_status_page_id_foreign` (`status_page_id`),
  CONSTRAINT `status_page_cname_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_page_cname`
--

LOCK TABLES `status_page_cname` WRITE;
/*!40000 ALTER TABLE `status_page_cname` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_page_cname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(150) DEFAULT NULL,
  `twofa_secret` varchar(64) DEFAULT NULL,
  `twofa_status` tinyint(1) NOT NULL DEFAULT 0,
  `twofa_last_token` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'etaquet','$2a$10$ycfSDnnYFnM57qHUftQtpeGE8l47cW/EVcQV6bG4IybqqReleQ.GK',1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 15:50:19
