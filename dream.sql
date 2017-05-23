-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: dream
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `user_id` int(11) NOT NULL,
  `dream_list_id` int(11) NOT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dream_list_id`),
  KEY `comment_dream_list_id_fk` (`dream_list_id`),
  CONSTRAINT `comment_dream_list_id_fk` FOREIGN KEY (`dream_list_id`) REFERENCES `dream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream`
--

DROP TABLE IF EXISTS `dream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `is_finished` varchar(2) DEFAULT '0',
  `period` varchar(8) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `upvote_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `is_public` int(11) DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_list_user_id_fk` (`user_id`),
  CONSTRAINT `dream_list_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream`
--

LOCK TABLES `dream` WRITE;
/*!40000 ALTER TABLE `dream` DISABLE KEYS */;
INSERT INTO `dream` VALUES (20,'1312','3213123','2017-05-12 20:26:51','0','1',1,0,0,1,'2017-05-12 20:26:51'),(21,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:54','0','7',1,21,50,1,'2017-05-12 20:28:54'),(22,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:55','0','7',1,21,50,1,'2017-05-12 20:28:55'),(23,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:56','0','7',1,20,50,1,'2017-05-12 20:28:56'),(24,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:57','0','7',1,20,50,1,'2017-05-12 20:28:57'),(25,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:57','0','7',1,20,50,1,'2017-05-12 20:28:57'),(26,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:57','0','7',1,20,50,1,'2017-05-12 20:28:57'),(27,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:57','0','7',1,20,50,1,'2017-05-12 20:28:57'),(28,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:58','0','7',1,20,50,1,'2017-05-12 20:28:58'),(29,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:58','0','7',1,20,50,1,'2017-05-12 20:28:58'),(30,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:59','0','7',1,20,50,1,'2017-05-12 20:28:59'),(31,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:28:59','0','7',1,20,50,1,'2017-05-12 20:28:59'),(32,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:00','0','7',1,20,50,1,'2017-05-12 20:29:00'),(33,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:00','0','7',1,20,50,1,'2017-05-12 20:29:00'),(34,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:01','0','7',1,20,50,1,'2017-05-12 20:29:01'),(35,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:02','0','7',1,20,50,1,'2017-05-12 20:29:02'),(36,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:02','0','7',1,20,50,1,'2017-05-12 20:29:02'),(37,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:03','0','7',1,20,50,1,'2017-05-12 20:29:03'),(38,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:03','0','7',1,20,50,1,'2017-05-12 20:29:03'),(39,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:03','0','7',1,20,50,1,'2017-05-12 20:29:03'),(40,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:04','0','7',1,20,50,1,'2017-05-12 20:29:04'),(41,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:04','0','7',1,20,50,1,'2017-05-12 20:29:04'),(42,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:05','0','7',1,20,50,1,'2017-05-12 20:29:05'),(43,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:06','0','7',1,20,50,1,'2017-05-12 20:29:06'),(44,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:06','0','7',1,20,50,1,'2017-05-12 20:29:06'),(45,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:06','0','7',1,20,50,1,'2017-05-12 20:29:06'),(46,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:07','0','7',1,20,50,1,'2017-05-12 20:29:07'),(47,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:07','0','7',1,20,50,1,'2017-05-12 20:29:07'),(48,'出国走起','我要出国咯，哈哈哈，好好玩呀','2017-05-12 20:29:08','0','7',1,20,50,1,'2017-05-12 20:29:08'),(49,'xcfads','fdasf','2017-05-12 20:34:22','0','1',1,0,0,1,'2017-05-12 20:34:22'),(50,'123','123','2017-05-12 20:35:00','0','1',1,0,0,1,'2017-05-12 20:35:00'),(51,'123','123','2017-05-12 20:35:19','0','1',1,0,0,1,'2017-05-12 20:35:19'),(52,'123','123','2017-05-12 20:36:55','0','1',1,0,0,1,'2017-05-12 20:36:55'),(53,'123123','123123','2017-05-12 20:37:05','0','1',1,1,0,1,'2017-05-12 20:37:05'),(54,'123','12313','2017-05-12 21:48:56','0','1',1,0,0,1,'2017-05-12 21:48:56'),(55,'哈哈哈哈','终于完成了第一部分。。。。我日','2017-05-13 01:14:11','0','1',1,0,0,1,'2017-05-13 01:14:11'),(56,'是否大','发撒的送达发送到','2017-05-13 01:15:29','0','1',1,0,0,1,'2017-05-13 01:15:29'),(57,'发生大','防守打法','2017-05-13 01:15:51','0','1',1,1,0,1,'2017-05-13 01:15:51'),(58,'131','fadsfs','2017-05-13 01:16:45','0','1',1,0,0,1,'2017-05-13 01:16:45'),(59,'fasdf','fdsaf','2017-05-13 01:17:59','0','1',1,1,0,1,'2017-05-13 01:17:59'),(60,'非公开心愿','这里是非公开心愿描述','2017-05-14 14:03:52','0','1',1,0,0,1,'2017-05-14 14:03:52'),(61,'1323','1233','2017-05-14 14:24:04','0','1',1,0,0,1,'2017-05-14 14:24:04'),(62,'123','1312','2017-05-14 14:24:42','0','1',1,0,0,1,'2017-05-14 14:24:42'),(64,'12321','123','2017-05-22 17:00:31','0','1',1,1,0,1,'2017-05-22 17:00:31'),(66,'xxx','aaaaaa','2017-05-23 19:13:55','0','30',1,0,0,1,'2017-05-23 19:13:55'),(67,'xxxafdf123123','aaaaaabbbb','2017-05-23 19:29:17','0','30',1,0,0,1,'2017-05-23 19:29:17');
/*!40000 ALTER TABLE `dream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upvote`
--

DROP TABLE IF EXISTS `upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upvote` (
  `user_id` int(11) NOT NULL,
  `dream_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dream_id`),
  KEY `upvote_dream_list_id_fk` (`dream_id`),
  CONSTRAINT `upvote_dream_list_id_fk` FOREIGN KEY (`dream_id`) REFERENCES `dream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upvote_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upvote`
--

LOCK TABLES `upvote` WRITE;
/*!40000 ALTER TABLE `upvote` DISABLE KEYS */;
INSERT INTO `upvote` VALUES (1,21,'2017-05-13 01:05:10'),(1,22,'2017-05-13 01:05:38'),(1,53,'2017-05-13 01:05:04'),(1,57,'2017-05-13 01:05:58'),(1,59,'2017-05-13 01:05:52'),(1,64,'2017-05-23 00:05:50');
/*!40000 ALTER TABLE `upvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'yangqihua','123',NULL),(2,'123','123',NULL),(3,'yang','123',NULL),(4,'y','123',NULL),(5,'1323','123',NULL),(6,'312','132',NULL),(7,'1233','123',NULL),(8,'904693433@qq.com','123',NULL),(9,'yangqihua@dowish.net','123',NULL),(10,'1','123',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warn`
--

DROP TABLE IF EXISTS `warn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warn` (
  `dream_id` int(11) NOT NULL,
  `warn_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dream_id`,`warn_date`),
  KEY `warn_user_id_fk` (`user_id`),
  CONSTRAINT `warn_dream_id_fk` FOREIGN KEY (`dream_id`) REFERENCES `dream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warn_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warn`
--

LOCK TABLES `warn` WRITE;
/*!40000 ALTER TABLE `warn` DISABLE KEYS */;
INSERT INTO `warn` VALUES (20,'2017-05-12 00:00:00',1),(20,'2017-05-13 00:00:00',1),(20,'2017-05-14 00:00:00',1),(20,'2017-05-15 00:00:00',1),(20,'2017-05-16 00:00:00',1),(20,'2017-05-17 00:00:00',1),(20,'2017-05-18 00:00:00',1),(20,'2017-05-19 00:00:00',1),(20,'2017-05-20 00:00:00',1),(20,'2017-05-21 00:00:00',1),(20,'2017-05-22 00:00:00',1),(21,'2017-05-12 00:00:00',1),(22,'2017-05-12 00:00:00',1),(23,'2017-05-12 00:00:00',1),(24,'2017-05-12 00:00:00',1),(25,'2017-05-12 00:00:00',1),(26,'2017-05-12 00:00:00',1),(27,'2017-05-12 00:00:00',1),(28,'2017-05-12 00:00:00',1),(29,'2017-05-12 00:00:00',1),(30,'2017-05-12 00:00:00',1),(31,'2017-05-12 00:00:00',1),(32,'2017-05-12 00:00:00',1),(33,'2017-05-12 00:00:00',1),(34,'2017-05-12 00:00:00',1),(35,'2017-05-12 00:00:00',1),(36,'2017-05-12 00:00:00',1),(37,'2017-05-12 00:00:00',1),(38,'2017-05-12 00:00:00',1),(39,'2017-05-12 00:00:00',1),(40,'2017-05-12 00:00:00',1),(41,'2017-05-12 00:00:00',1),(42,'2017-05-12 00:00:00',1),(43,'2017-05-12 00:00:00',1),(44,'2017-05-12 00:00:00',1),(45,'2017-05-12 00:00:00',1),(46,'2017-05-12 00:00:00',1),(47,'2017-05-12 00:00:00',1),(48,'2017-05-12 00:00:00',1),(49,'2017-05-12 00:00:00',1),(49,'2017-05-13 00:00:00',1),(49,'2017-05-14 00:00:00',1),(49,'2017-05-15 00:00:00',1),(49,'2017-05-16 00:00:00',1),(49,'2017-05-17 00:00:00',1),(49,'2017-05-18 00:00:00',1),(49,'2017-05-19 00:00:00',1),(49,'2017-05-20 00:00:00',1),(49,'2017-05-21 00:00:00',1),(49,'2017-05-22 00:00:00',1),(50,'2017-05-12 00:00:00',1),(50,'2017-05-13 00:00:00',1),(50,'2017-05-14 00:00:00',1),(50,'2017-05-15 00:00:00',1),(50,'2017-05-16 00:00:00',1),(50,'2017-05-17 00:00:00',1),(50,'2017-05-18 00:00:00',1),(50,'2017-05-19 00:00:00',1),(50,'2017-05-20 00:00:00',1),(50,'2017-05-21 00:00:00',1),(50,'2017-05-22 00:00:00',1),(51,'2017-05-12 00:00:00',1),(51,'2017-05-13 00:00:00',1),(51,'2017-05-14 00:00:00',1),(51,'2017-05-15 00:00:00',1),(51,'2017-05-16 00:00:00',1),(51,'2017-05-17 00:00:00',1),(51,'2017-05-18 00:00:00',1),(51,'2017-05-19 00:00:00',1),(51,'2017-05-20 00:00:00',1),(51,'2017-05-21 00:00:00',1),(51,'2017-05-22 00:00:00',1),(52,'2017-05-12 00:00:00',1),(52,'2017-05-13 00:00:00',1),(52,'2017-05-14 00:00:00',1),(52,'2017-05-15 00:00:00',1),(52,'2017-05-16 00:00:00',1),(52,'2017-05-17 00:00:00',1),(52,'2017-05-18 00:00:00',1),(52,'2017-05-19 00:00:00',1),(52,'2017-05-20 00:00:00',1),(52,'2017-05-21 00:00:00',1),(52,'2017-05-22 00:00:00',1),(53,'2017-05-12 00:00:00',1),(53,'2017-05-13 00:00:00',1),(53,'2017-05-14 00:00:00',1),(53,'2017-05-15 00:00:00',1),(53,'2017-05-16 00:00:00',1),(53,'2017-05-17 00:00:00',1),(53,'2017-05-18 00:00:00',1),(53,'2017-05-19 00:00:00',1),(53,'2017-05-20 00:00:00',1),(53,'2017-05-21 00:00:00',1),(53,'2017-05-22 00:00:00',1),(54,'2017-05-12 00:00:00',1),(54,'2017-05-13 00:00:00',1),(54,'2017-05-14 00:00:00',1),(54,'2017-05-15 00:00:00',1),(54,'2017-05-16 00:00:00',1),(54,'2017-05-17 00:00:00',1),(54,'2017-05-18 00:00:00',1),(54,'2017-05-19 00:00:00',1),(54,'2017-05-20 00:00:00',1),(54,'2017-05-21 00:00:00',1),(55,'2017-05-13 00:00:00',1),(55,'2017-05-14 00:00:00',1),(55,'2017-05-15 00:00:00',1),(55,'2017-05-16 00:00:00',1),(55,'2017-05-17 00:00:00',1),(55,'2017-05-18 00:00:00',1),(55,'2017-05-19 00:00:00',1),(55,'2017-05-20 00:00:00',1),(55,'2017-05-21 00:00:00',1),(55,'2017-05-22 00:00:00',1),(56,'2017-05-13 00:00:00',1),(56,'2017-05-14 00:00:00',1),(56,'2017-05-15 00:00:00',1),(56,'2017-05-16 00:00:00',1),(56,'2017-05-17 00:00:00',1),(56,'2017-05-18 00:00:00',1),(56,'2017-05-19 00:00:00',1),(56,'2017-05-20 00:00:00',1),(56,'2017-05-21 00:00:00',1),(56,'2017-05-22 00:00:00',1),(57,'2017-05-13 00:00:00',1),(57,'2017-05-14 00:00:00',1),(57,'2017-05-15 00:00:00',1),(57,'2017-05-16 00:00:00',1),(57,'2017-05-17 00:00:00',1),(57,'2017-05-18 00:00:00',1),(57,'2017-05-19 00:00:00',1),(57,'2017-05-20 00:00:00',1),(57,'2017-05-21 00:00:00',1),(57,'2017-05-22 00:00:00',1),(58,'2017-05-13 00:00:00',1),(58,'2017-05-14 00:00:00',1),(58,'2017-05-15 00:00:00',1),(58,'2017-05-16 00:00:00',1),(58,'2017-05-17 00:00:00',1),(58,'2017-05-18 00:00:00',1),(58,'2017-05-19 00:00:00',1),(58,'2017-05-20 00:00:00',1),(58,'2017-05-21 00:00:00',1),(58,'2017-05-22 00:00:00',1),(59,'2017-05-13 00:00:00',1),(59,'2017-05-14 00:00:00',1),(59,'2017-05-15 00:00:00',1),(59,'2017-05-16 00:00:00',1),(59,'2017-05-17 00:00:00',1),(59,'2017-05-18 00:00:00',1),(59,'2017-05-19 00:00:00',1),(59,'2017-05-20 00:00:00',1),(59,'2017-05-21 00:00:00',1),(59,'2017-05-22 00:00:00',1),(60,'2017-05-14 00:00:00',1),(60,'2017-05-15 00:00:00',1),(60,'2017-05-16 00:00:00',1),(60,'2017-05-17 00:00:00',1),(60,'2017-05-18 00:00:00',1),(60,'2017-05-19 00:00:00',1),(60,'2017-05-20 00:00:00',1),(60,'2017-05-21 00:00:00',1),(60,'2017-05-22 00:00:00',1),(61,'2017-05-14 00:00:00',1),(61,'2017-05-15 00:00:00',1),(61,'2017-05-16 00:00:00',1),(61,'2017-05-17 00:00:00',1),(61,'2017-05-18 00:00:00',1),(61,'2017-05-19 00:00:00',1),(61,'2017-05-20 00:00:00',1),(61,'2017-05-21 00:00:00',1),(61,'2017-05-22 00:00:00',1),(62,'2017-05-14 00:00:00',1),(62,'2017-05-15 00:00:00',1),(62,'2017-05-16 00:00:00',1),(62,'2017-05-17 00:00:00',1),(62,'2017-05-18 00:00:00',1),(62,'2017-05-19 00:00:00',1),(62,'2017-05-20 00:00:00',1),(62,'2017-05-21 00:00:00',1),(62,'2017-05-22 00:00:00',1),(64,'2017-05-22 00:00:00',1);
/*!40000 ALTER TABLE `warn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23 21:01:54
