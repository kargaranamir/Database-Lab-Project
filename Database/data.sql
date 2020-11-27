-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `dbo.Stadium`
--

DROP TABLE IF EXISTS `dbo.Stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Stadium` (
  `Stadium_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `Stadium_name` varchar(6) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Stadium`
--

LOCK TABLES `dbo.Stadium` WRITE;
/*!40000 ALTER TABLE `dbo.Stadium` DISABLE KEYS */;
INSERT INTO `dbo.Stadium` VALUES (1,1,'Azadi',100000),(2,2,'Emam',100000),(3,3,'takhti',90000);
/*!40000 ALTER TABLE `dbo.Stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.city`
--

DROP TABLE IF EXISTS `dbo.city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.city` (
  `country_id` varchar(1) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.city`
--

LOCK TABLES `dbo.city` WRITE;
/*!40000 ALTER TABLE `dbo.city` DISABLE KEYS */;
INSERT INTO `dbo.city` VALUES ('1',1,'tehran'),('2',2,'tehran'),('',3,'Mashhad'),('',4,'tehran'),('1',5,'kerman');
/*!40000 ALTER TABLE `dbo.city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.coach`
--

DROP TABLE IF EXISTS `dbo.coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.coach` (
  `coach_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `coach_name` varchar(5) DEFAULT NULL,
  `coach_lastname` varchar(9) DEFAULT NULL,
  `coach_level` varchar(1) DEFAULT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `date_start_Coaching` varchar(10) DEFAULT NULL,
  `email` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.coach`
--

LOCK TABLES `dbo.coach` WRITE;
/*!40000 ALTER TABLE `dbo.coach` DISABLE KEYS */;
INSERT INTO `dbo.coach` VALUES (1,1,'ali','parvin','1',1340,'1369-07-21',''),(2,1,'ali','ghalenoie','1',1350,'1379-07-21',''),(3,3,'jaber','naderi','2',1340,'1360-07-21',''),(4,1,'','','1',1350,'1350-01-01',''),(5,1,'','','',1350,'1350-01-01',''),(6,1,'','','4',1350,'1350-01-01',''),(10,1,'reza','ahmadi','3',1350,'1350-01-01','wwww'),(11,1,'reza','ahmadi','1',1350,'1350-01-01',''),(13,1,'reza','ahmadi','3',1350,'1350-01-01','wwww'),(14,1,'Ali','ameli','3',1350,'1370-09-06','www.aliameli');
/*!40000 ALTER TABLE `dbo.coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.country`
--

DROP TABLE IF EXISTS `dbo.country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.country` (
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.country`
--

LOCK TABLES `dbo.country` WRITE;
/*!40000 ALTER TABLE `dbo.country` DISABLE KEYS */;
INSERT INTO `dbo.country` VALUES (1,'iran'),(2,'spania'),(3,'Canada'),(5,'torkie'),(6,'Canada'),(7,'Jermany'),(8,'Ghatar'),(9,'berezil'),(10,'France'),(11,'china');
/*!40000 ALTER TABLE `dbo.country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.detail_goal`
--

DROP TABLE IF EXISTS `dbo.detail_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.detail_goal` (
  `match_id` int(11) DEFAULT NULL,
  `goal_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `goal_time` varchar(8) DEFAULT NULL,
  `goal_type` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.detail_goal`
--

LOCK TABLES `dbo.detail_goal` WRITE;
/*!40000 ALTER TABLE `dbo.detail_goal` DISABLE KEYS */;
INSERT INTO `dbo.detail_goal` VALUES (1,1,1,'23:30:29',''),(1,2,1,'23:30:40','P'),(1,3,1,'23:35:40','N'),(3,4,2,'23:35:40','P'),(2,5,3,'23:35:40','P');
/*!40000 ALTER TABLE `dbo.detail_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.detail_match`
--

DROP TABLE IF EXISTS `dbo.detail_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.detail_match` (
  `team_id_won` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `team_id_lost` int(11) DEFAULT NULL,
  `point_judgment` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.detail_match`
--

LOCK TABLES `dbo.detail_match` WRITE;
/*!40000 ALTER TABLE `dbo.detail_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo.detail_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.detail_warning`
--

DROP TABLE IF EXISTS `dbo.detail_warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.detail_warning` (
  `match_id` int(11) DEFAULT NULL,
  `warning_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `warning_type` varchar(4) DEFAULT NULL,
  `warning_time` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.detail_warning`
--

LOCK TABLES `dbo.detail_warning` WRITE;
/*!40000 ALTER TABLE `dbo.detail_warning` DISABLE KEYS */;
INSERT INTO `dbo.detail_warning` VALUES (1,1,1,'hand','23:30:29'),(1,2,2,'hand','23:30:29'),(3,3,2,'hand','23:30:29'),(3,4,2,'hand','23:30:29');
/*!40000 ALTER TABLE `dbo.detail_warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.match`
--

DROP TABLE IF EXISTS `dbo.match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.match` (
  `match_id` int(11) DEFAULT NULL,
  `stage` varchar(1) DEFAULT NULL,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL,
  `match_date` varchar(10) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `id_referee` int(11) DEFAULT NULL,
  `id_assist_referee1` int(11) DEFAULT NULL,
  `id_assist_referee2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.match`
--

LOCK TABLES `dbo.match` WRITE;
/*!40000 ALTER TABLE `dbo.match` DISABLE KEYS */;
INSERT INTO `dbo.match` VALUES (1,'F',1,2,1,'1394-07-21',2,3,2,1),(2,'F',2,1,1,'1394-07-21',2,3,2,1),(3,'Q',1,2,1,'1394-07-21',2,3,2,1),(4,'R',1,2,1,'1394-07-21',2,3,2,1),(5,'G',1,2,1,'1394-07-21',3,3,2,1);
/*!40000 ALTER TABLE `dbo.match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.personnel`
--

DROP TABLE IF EXISTS `dbo.personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.personnel` (
  `personnel_id` int(11) DEFAULT NULL,
  `personnel_name` varchar(5) DEFAULT NULL,
  `personnel_lastname` varchar(8) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `email` varchar(12) DEFAULT NULL,
  `titel` varchar(6) DEFAULT NULL,
  `date_start_working` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.personnel`
--

LOCK TABLES `dbo.personnel` WRITE;
/*!40000 ALTER TABLE `dbo.personnel` DISABLE KEYS */;
INSERT INTO `dbo.personnel` VALUES (1,'Ali','taj',1,1350,'www.aliameli','Clerk','1370-09-06'),(2,'saied','jamshidi',2,1350,'www.saied','clerck','1370-09-06');
/*!40000 ALTER TABLE `dbo.personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.player`
--

DROP TABLE IF EXISTS `dbo.player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.player` (
  `player_id` int(11) DEFAULT NULL,
  `player_name` varchar(7) DEFAULT NULL,
  `player_lastname` varchar(8) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `email` varchar(23) DEFAULT NULL,
  `date_start_football` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.player`
--

LOCK TABLES `dbo.player` WRITE;
/*!40000 ALTER TABLE `dbo.player` DISABLE KEYS */;
INSERT INTO `dbo.player` VALUES (1,'Ali','Daie',1,1350,'www.ali','1370-09-06'),(2,'Ali','Karimi',1,1351,'www.alikarimi.com','1380-05-06'),(3,'Moharam','Navidkia',2,1351,'www.moharamnavidkia.com','1379-07-21');
/*!40000 ALTER TABLE `dbo.player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.referee`
--

DROP TABLE IF EXISTS `dbo.referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.referee` (
  `referee_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `referee_name` varchar(8) DEFAULT NULL,
  `referee_lastname` varchar(6) DEFAULT NULL,
  `referee_level` int(11) DEFAULT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `date_start_referee` varchar(10) DEFAULT NULL,
  `reffree_or_asstreferee` int(11) DEFAULT NULL,
  `email` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.referee`
--

LOCK TABLES `dbo.referee` WRITE;
/*!40000 ALTER TABLE `dbo.referee` DISABLE KEYS */;
INSERT INTO `dbo.referee` VALUES (1,1,'mohammad','khani',2,1350,'1370-09-06',2,'www.ali'),(2,1,'Ali','emani',2,1350,'1370-09-06',2,'www.ali'),(3,2,'rasool','rezaie',2,1350,'1370-09-06',1,'www.aliameli');
/*!40000 ALTER TABLE `dbo.referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.season`
--

DROP TABLE IF EXISTS `dbo.season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.season` (
  `date_start` varchar(10) DEFAULT NULL,
  `date_end` varchar(10) DEFAULT NULL,
  `category` varchar(1) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.season`
--

LOCK TABLES `dbo.season` WRITE;
/*!40000 ALTER TABLE `dbo.season` DISABLE KEYS */;
INSERT INTO `dbo.season` VALUES ('1394-06-05','1394-06-05','P',1),('1394-06-05','1394-06-05','P',2),('1394-06-05','1394-06-05','1',3),('1394-06-05','1394-06-05','2',4),('1394-06-05','1394-06-05','3',5),('1395-06-05','1395-06-05','P',6);
/*!40000 ALTER TABLE `dbo.season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.sysdiagrams`
--

DROP TABLE IF EXISTS `dbo.sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.sysdiagrams` (
  `name` varchar(9) DEFAULT NULL,
  `principal_id` int(11) DEFAULT NULL,
  `diagram_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.sysdiagrams`
--

LOCK TABLES `dbo.sysdiagrams` WRITE;
/*!40000 ALTER TABLE `dbo.sysdiagrams` DISABLE KEYS */;
INSERT INTO `dbo.sysdiagrams` VALUES ('Diagram_4',1,4,1,'');
/*!40000 ALTER TABLE `dbo.sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.team`
--

DROP TABLE IF EXISTS `dbo.team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.team` (
  `team_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `team_name` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.team`
--

LOCK TABLES `dbo.team` WRITE;
/*!40000 ALTER TABLE `dbo.team` DISABLE KEYS */;
INSERT INTO `dbo.team` VALUES (1,1,'perspolis'),(2,1,'esteghlal'),(3,2,'zob ahan'),(4,1,'rah ahan'),(5,1,'sepahan'),(6,2,'padide');
/*!40000 ALTER TABLE `dbo.team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.team_coach`
--

DROP TABLE IF EXISTS `dbo.team_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.team_coach` (
  `id_team` int(11) DEFAULT NULL,
  `id_coach` int(11) DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `amount_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.team_coach`
--

LOCK TABLES `dbo.team_coach` WRITE;
/*!40000 ALTER TABLE `dbo.team_coach` DISABLE KEYS */;
INSERT INTO `dbo.team_coach` VALUES (1,1,1,121),(1,1,2,121),(2,2,1,121),(2,2,2,121),(3,3,1,121),(3,3,2,121);
/*!40000 ALTER TABLE `dbo.team_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.team_player`
--

DROP TABLE IF EXISTS `dbo.team_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.team_player` (
  `id_team` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `amount_` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.team_player`
--

LOCK TABLES `dbo.team_player` WRITE;
/*!40000 ALTER TABLE `dbo.team_player` DISABLE KEYS */;
INSERT INTO `dbo.team_player` VALUES (1,1,1,1351),(1,1,3,1351),(3,3,3,1351);
/*!40000 ALTER TABLE `dbo.team_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-08 22:53:54
