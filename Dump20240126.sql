CREATE DATABASE  IF NOT EXISTS `gaming_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gaming_schema`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gaming_schema
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `t_membership_master`
--

DROP TABLE IF EXISTS `t_membership_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_membership_master` (
  `membership_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `duration` int NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `subscription_id_fk_idx` (`subscription_id`),
  CONSTRAINT `subscription_id_fk` FOREIGN KEY (`subscription_id`) REFERENCES `t_subscription_master` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_membership_master`
--

LOCK TABLES `t_membership_master` WRITE;
/*!40000 ALTER TABLE `t_membership_master` DISABLE KEYS */;
INSERT INTO `t_membership_master` VALUES (3,'Foo Bar','foo@example.com','0793283645','2024-01-04',9,1);
/*!40000 ALTER TABLE `t_membership_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_subscription_master`
--

DROP TABLE IF EXISTS `t_subscription_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_subscription_master` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `subscription_name` varchar(45) NOT NULL,
  `subscription_cost` double NOT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_subscription_master`
--

LOCK TABLES `t_subscription_master` WRITE;
/*!40000 ALTER TABLE `t_subscription_master` DISABLE KEYS */;
INSERT INTO `t_subscription_master` VALUES (1,'Standard',1100),(2,'Gold',1500),(3,'Diamond',2000);
/*!40000 ALTER TABLE `t_subscription_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-26 14:03:49
