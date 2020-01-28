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

--
-- Table structure for table `emp_project_relation`
--

DROP TABLE IF EXISTS `emp_project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `emp_project_relation` (
  `proj_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  PRIMARY KEY (`proj_id`,`e_id`),
  KEY `FK_EMP_ID_P_idx` (`e_id`),
  CONSTRAINT `FK_EMP_ID_P` FOREIGN KEY (`e_id`) REFERENCES `employees` (`emp_id`),
  CONSTRAINT `FK_PROJ_ID_E` FOREIGN KEY (`proj_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_project_relation`
--

LOCK TABLES `emp_project_relation` WRITE;
/*!40000 ALTER TABLE `emp_project_relation` DISABLE KEYS */;
INSERT INTO `emp_project_relation` (`proj_id`, `e_id`) VALUES (11,126),(22,126),(11,127),(22,127),(33,128),(11,129),(22,129),(33,130),(11,139),(46,141),(48,141),(46,143);
/*!40000 ALTER TABLE `emp_project_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `mgr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `mgr_id_idx` (`mgr_id`),
  CONSTRAINT `mgr_id` FOREIGN KEY (`mgr_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`emp_id`, `first_name`, `last_name`, `created_on`, `user_name`, `mgr_id`) VALUES (125,'admin',NULL,NULL,NULL,NULL),(126,'akash','soni',NULL,NULL,129),(127,'pankaj','sakhare',NULL,NULL,129),(128,'vishal','wasekar',NULL,NULL,130),(129,'krishna','tiwari',NULL,NULL,125),(130,'buland','khan',NULL,NULL,125),(131,'mahesh','katkar',NULL,'mahesh',129),(134,'karan','kaka',NULL,'karan',129),(137,'vinay','kumar',NULL,'vinay',130),(138,'Bhanu','Chandar',NULL,'astro',130),(139,'rohit','sharma',NULL,'rohit',129),(141,'rounak','gupta',NULL,'rounak',125),(142,'tony','stark',NULL,'ironman',125),(143,'black ','widow',NULL,'bkackwidow',125);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `reset_token` varchar(45) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `employee_id_idx` (`emp_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`email`, `password`, `role`, `last_login`, `reset_token`, `emp_id`) VALUES ('asoni7667@gmail.com','akash11','DEVTEST',NULL,'',126),('bhanuchandar7528@gmail.com','bhanu','DEVTEST',NULL,NULL,138),('black@gmail.com','black11','DEVTEST',NULL,NULL,143),('buland@gmail.com','buland11','MANAGER',NULL,NULL,130),('karan@gmail.com','karan11','DEVTEST',NULL,NULL,134),('krishna@gmail.com','krihsna11','MANAGER',NULL,NULL,129),('ladybugaug19@gmail.com','Ladybug@2020','ADMIN',NULL,NULL,125),('mahesh@gmail.com','mahesh11','DEVTEST',NULL,NULL,131),('pankajsakhare91@gmail.com','pankaj19','DEVTEST',NULL,NULL,127),('rohit@gmail.com','rohit11','DEVTEST',NULL,NULL,139),('rounak@gmail.com','rounak11','MANAGER',NULL,NULL,141),('tony@gmail.com','tony11','MANAGER',NULL,NULL,142),('vinay@gmail.com','vinay','DEVTEST',NULL,NULL,137),('vwasekar22@gmail.com','vishal11','DEVTEST',NULL,'',128);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) NOT NULL,
  `project_desc` varchar(250) DEFAULT NULL,
  `project_mgr` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`project_id`, `project_name`, `project_desc`, `project_mgr`) VALUES (11,'project11','pro11',129),(22,'project22','pro22',129),(33,'project33','pro33',130),(45,'project44','project desc 44',130),(46,'cdac portal','cdac exam and attendance portal for students.',129),(48,'E-Commerce Website','Online shopping WebSite',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29  2:19:07
