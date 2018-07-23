-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `LEADER`
--

DROP TABLE IF EXISTS `LEADER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEADER` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `pid` int(2) DEFAULT NULL,
  `bid` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEADER`
--

LOCK TABLES `LEADER` WRITE;
/*!40000 ALTER TABLE `LEADER` DISABLE KEYS */;
INSERT INTO `LEADER` VALUES (1,1,1),(2,7,2),(3,11,3),(4,16,4),(5,17,5),(6,23,6),(7,20,7),(8,26,8),(9,31,9),(10,34,10);
/*!40000 ALTER TABLE `LEADER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART`
--

DROP TABLE IF EXISTS `PART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART` (
  `pid` int(2) NOT NULL,
  `bid` int(2) NOT NULL,
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `pid` (`pid`),
  KEY `bid` (`bid`),
  CONSTRAINT `PART_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `player` (`ID`),
  CONSTRAINT `PART_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `band` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART`
--

LOCK TABLES `PART` WRITE;
/*!40000 ALTER TABLE `PART` DISABLE KEYS */;
INSERT INTO `PART` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(7,2,5),(8,2,6),(9,2,7),(10,2,8),(11,3,9),(12,3,10),(13,3,11),(14,3,12),(15,4,13),(16,4,14),(17,5,15),(18,5,16),(19,5,17),(20,7,18),(21,7,19),(22,7,20),(23,6,21),(24,6,22),(25,6,23),(26,8,24),(27,8,25),(28,8,26),(29,8,27),(30,8,28),(31,9,29),(32,9,30),(33,9,31),(34,10,32),(35,10,33),(36,10,34),(37,10,35);
/*!40000 ALTER TABLE `PART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORM`
--

DROP TABLE IF EXISTS `PERFORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFORM` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `pid` int(2) NOT NULL,
  `eid` int(2) NOT NULL,
  `sid` int(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `pid` (`pid`),
  KEY `eid` (`eid`),
  KEY `sid` (`sid`),
  CONSTRAINT `PERFORM_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `player` (`ID`),
  CONSTRAINT `PERFORM_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `event` (`ID`),
  CONSTRAINT `PERFORM_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `song` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORM`
--

LOCK TABLES `PERFORM` WRITE;
/*!40000 ALTER TABLE `PERFORM` DISABLE KEYS */;
INSERT INTO `PERFORM` VALUES (1,1,1,6),(2,2,1,6),(3,3,1,6),(4,4,1,6),(5,1,1,7),(6,2,1,7),(7,3,1,7),(8,4,1,7),(9,6,1,4),(10,5,2,1),(11,5,2,2),(12,6,2,4),(13,6,2,5),(14,23,2,19),(15,24,2,19),(16,25,2,19),(17,23,2,20),(18,24,2,20),(19,25,2,20),(20,1,3,6),(21,2,3,6),(22,3,3,6),(23,4,3,6),(24,31,3,21),(25,32,3,21),(26,33,3,21),(27,7,4,9),(28,8,4,9),(29,9,4,9),(30,10,4,9),(31,7,4,10),(32,8,4,10),(33,9,4,10),(34,10,4,10),(35,23,4,20),(36,24,4,20),(37,25,4,20),(38,6,5,4),(39,6,5,5),(40,5,5,1),(41,5,5,2),(42,5,5,3),(43,6,6,4),(44,6,6,5),(45,1,6,6),(46,2,6,6),(47,3,6,6),(48,4,6,6),(49,5,6,7),(50,1,6,7),(51,2,6,7),(52,3,6,7),(53,4,6,7),(54,31,7,22),(55,32,7,22),(56,33,7,22),(57,7,7,11),(58,8,7,11),(59,9,7,11),(60,10,7,11),(61,15,8,14),(62,16,8,14),(63,16,8,15),(64,15,8,15),(65,20,8,15),(66,20,8,17),(67,21,8,17),(68,22,8,17),(69,20,8,18),(70,21,8,18),(71,22,8,18),(72,17,8,16),(73,18,8,16),(74,19,8,16),(75,11,9,12),(76,12,9,12),(77,13,9,12),(78,14,9,12),(79,11,9,13),(80,12,9,13),(81,13,9,13),(82,14,9,13),(83,34,9,23),(84,35,9,23),(85,36,9,23),(86,37,9,23),(87,34,9,24),(88,35,9,24),(89,34,9,25),(91,36,9,25),(92,37,9,25),(94,17,9,16),(95,18,9,16),(96,19,9,16),(97,26,10,7),(98,27,10,7),(99,28,10,7),(100,29,10,7),(101,30,10,7),(102,26,10,8),(103,27,10,8),(104,1,10,8),(105,2,10,8),(106,3,10,8),(107,5,10,1),(108,5,10,2),(109,5,10,12),(110,5,10,15);
/*!40000 ALTER TABLE `PERFORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK`
--

DROP TABLE IF EXISTS `WORK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `pid` int(2) NOT NULL,
  `cid` int(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `pid` (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `WORK_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `player` (`ID`),
  CONSTRAINT `WORK_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `company` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK`
--

LOCK TABLES `WORK` WRITE;
/*!40000 ALTER TABLE `WORK` DISABLE KEYS */;
INSERT INTO `WORK` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,7,9),(7,8,9),(8,9,9),(9,10,9),(10,11,4),(11,12,4),(12,13,5),(13,14,5),(14,15,10),(15,16,10),(16,17,3),(17,18,3),(18,19,3),(20,20,7),(21,21,7),(22,22,7),(23,23,8),(24,24,8),(25,25,8),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,8),(32,32,8),(33,33,8),(34,34,4),(35,35,4),(36,36,4),(37,37,4);
/*!40000 ALTER TABLE `WORK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `band` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `genre` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'草東沒有派對','另類搖滾'),(2,'Deca joins','另類搖滾'),(3,'coldplay','另類搖滾'),(4,'房東的貓','民謠'),(5,'Tizzy Bac','獨立搖滾'),(6,'槍擊潑辣','另類搖滾'),(7,'8mm Sky','後搖滾'),(8,'萬青','獨立搖滾'),(9,'怕胖團','龐克搖滾'),(10,'Radiohead','另類搖滾');
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `location` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'石皮有限公司','台北市'),(2,'添翼音樂','台北市'),(3,'彎的音樂','台北市'),(4,'Parlophone','德國'),(5,'XL','英國'),(6,'萬能娛樂集團','中國北京'),(7,'禾廣唱片','台北市'),(8,'典選音樂','台北市'),(9,'街聲','台北市'),(10,'默契音樂','台北市');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `place` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'如常','LIVE WAREHOUSE','2018'),(2,'貢寮海洋音樂祭','貢寮海水浴場','2018'),(3,'大港開唱','高雄駁二','2018'),(4,'大團誕生','台中','2017'),(5,'屋頂音樂節','台東鐵花村','2013'),(6,'Anpu Skin','高雄駁二','2016'),(7,'Rock concert','南投埔里','2018'),(8,'黑熊部落','南投埔里顏氏牧場','2018'),(9,'FUJI ROCK FESTIVAL','日本新潟線苗場','2018'),(10,'夏戀嘉年華','花蓮','2018');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `role` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'巫堵','M','vocal&guitarist',24),(2,'築築','F','guitarist',23),(3,'世暄','M','bassist',23),(4,'凡凡','F','drummer',24),(5,'盧廣仲','M','vocal&guitarist',32),(6,'張懸','F','vocal&guitarist',38),(7,'鄭敬儒','M','vocal',28),(8,'謝俊彥','M','bassist',26),(9,'楊尚樺','M','guitarist',26),(10,'阿谷','M','drummer',27),(11,'Chris Martin','M','vocal',41),(12,'Jonny Buckland','M','guitarist',41),(13,'Guy Berryman','M','bassist',42),(14,'Will Champion','M','drummer',41),(15,'吳佩嶺','F','guitarist',25),(16,'王心怡','F','vocal',25),(17,'陳惠婷','F','vocal',40),(18,'許哲毓','M','bassist',40),(19,'林前源','M','drummer',42),(20,'阿隆','M','guitarist',32),(21,'Zen','M','drummer',31),(22,'彼得','M','bassist',31),(23,'黃子豪','M','vocal&bassist',35),(24,'阿杰','M','guitarist',36),(25,'李旻諺','M','drummer',25),(26,'董亞千','M','vocal&guitarist',39),(27,'楊友耕','M','drummer',38),(28,'姬賡','M','bassist',38),(29,'李增輝','M','saxophonist',40),(30,'史立','M','trumpeter',41),(31,'閃亮','M','vocal&guitarist',28),(32,'大寶','M','bassist',28),(33,'老外','M','drummer',26),(34,'Thom Yorke','M','vocal&guitarist',49),(35,'Jonny Greenwood','M','guitarist',46),(36,'Colin Greenwood','M','bassist',47),(37,'Philip Selway','M','drummer',48);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `year` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'100種生活',2008),(2,'淵明',2006),(3,'陪我去青康藏高原',2011),(4,'關於我愛你',2009),(5,'豔火',2012),(6,'爛泥',2016),(7,'山海',2016),(8,'大風吹',2016),(9,'浴室',2017),(10,'一去不回來',2017),(11,'春天游泳',2017),(12,'Yellow',2000),(13,'Fix You',2004),(14,'秋釀',2017),(15,'美好事物',2017),(16,'Youll See',2006),(17,'finders keepers',2006),(18,'Sacrifice in Despair',2011),(19,'惑众',2014),(20,'黑色蓮花',2016),(21,'流浪王子',2013),(22,'魚',2016),(23,'Creep',1993),(24,'Karma Police',1997),(25,'No Surprises',1997);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17 20:51:51
