CREATE DATABASE  IF NOT EXISTS `ladybug_app_main` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ladybug_app_main`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ladybug_app_main
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bug_dtls`
--

DROP TABLE IF EXISTS `bug_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bug_dtls` (
  `bug_id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_name` varchar(45) NOT NULL,
  `bug_desc` varchar(250) NOT NULL,
  `bug_start` datetime DEFAULT NULL,
  `bug_end` datetime DEFAULT NULL,
  `bug_priority` varchar(45) DEFAULT NULL,
  `bug_by_emp_id` int(11) NOT NULL,
  `bug_assignee` int(11) DEFAULT NULL,
  `bug_project_id` int(11) DEFAULT NULL,
  `bug_status` varchar(45) DEFAULT NULL,
  `bug_mgr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bug_id`),
  KEY `FK_EMP_ID_idx` (`bug_by_emp_id`),
  KEY `FK_PROJ_ID_idx` (`bug_project_id`),
  CONSTRAINT `FK_EMP_ID` FOREIGN KEY (`bug_by_emp_id`) REFERENCES `employees` (`emp_id`),
  CONSTRAINT `FK_PROJ_ID` FOREIGN KEY (`bug_project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug_dtls`
--

LOCK TABLES `bug_dtls` WRITE;
/*!40000 ALTER TABLE `bug_dtls` DISABLE KEYS */;
INSERT INTO `bug_dtls` (`bug_id`, `bug_name`, `bug_desc`, `bug_start`, `bug_end`, `bug_priority`, `bug_by_emp_id`, `bug_assignee`, `bug_project_id`, `bug_status`, `bug_mgr_id`) VALUES (240,'BUG1','BUG-DESC-1',NULL,NULL,'HIGH',126,NULL,11,'NEW',129),(241,'BUG2','BUG-DESC-2',NULL,NULL,'LOW',127,126,11,'INPROGRESS',129),(242,'BUG3','BUG-DESC-3',NULL,NULL,'HIGHEST',126,NULL,22,'NEW',129),(243,'BUG4','BUG-DESC-4',NULL,NULL,'MEDIUM',127,NULL,22,'NEW',129),(244,'BUG5','BUG-DESC-5',NULL,NULL,'LOW',128,NULL,33,'NEW',130),(245,'Employee Registration Not Visible','Employee Registration functionality should be visible for Admin to add a new employee to this system',NULL,NULL,'HIGHEST',126,127,11,'INPROGRESS',129),(246,'BUG FOR TEST','TESTING BUG ',NULL,NULL,'HIGH',126,129,22,'INPROGRESS',129);
/*!40000 ALTER TABLE `bug_dtls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-27 10:53:59
