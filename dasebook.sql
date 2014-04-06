-- MySQL dump 10.13  Distrib 5.6.12, for Win64 (x86_64)
--
-- Host: localhost    Database: basebook
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `f12080912`
--

DROP TABLE IF EXISTS `f12080912`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f12080912` (
  `fNo` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`fNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f12080912`
--

LOCK TABLES `f12080912` WRITE;
/*!40000 ALTER TABLE `f12080912` DISABLE KEYS */;
INSERT INTO `f12080912` VALUES (1,27),(2,28);
/*!40000 ALTER TABLE `f12080912` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fahn`
--

DROP TABLE IF EXISTS `fahn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fahn` (
  `fNo` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`fNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fahn`
--

LOCK TABLES `fahn` WRITE;
/*!40000 ALTER TABLE `fahn` DISABLE KEYS */;
INSERT INTO `fahn` VALUES (1,26),(2,28);
/*!40000 ALTER TABLE `fahn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fwoo`
--

DROP TABLE IF EXISTS `fwoo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fwoo` (
  `fNo` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`fNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fwoo`
--

LOCK TABLES `fwoo` WRITE;
/*!40000 ALTER TABLE `fwoo` DISABLE KEYS */;
INSERT INTO `fwoo` VALUES (1,27),(2,26);
/*!40000 ALTER TABLE `fwoo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `memNo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `birthlocal` varchar(45) DEFAULT NULL,
  `currLocal` varchar(45) DEFAULT NULL,
  `jop` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`memNo`,`id`),
  UNIQUE KEY `no_UNIQUE` (`memNo`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (26,'12080912','남건백','male','12080912','nopicture.jpg','1989년 3월 16일','인천광역시','인천광역시','인하대학교'),(27,'ahn','안세훈','male','1234','nopicture.jpg','1989년 12월 3일','파주시','인천시','인하대학교'),(28,'woo','우현정','female','1234','nopicture.jpg','1993년 5월 16일','서울특별시','서울특별시','인하대학교');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `pNo` int(11) NOT NULL AUTO_INCREMENT,
  `writer` int(11) NOT NULL,
  `contents` varchar(300) NOT NULL,
  `likes` int(11) DEFAULT '0',
  `likepeople` varchar(100) DEFAULT ' ',
  PRIMARY KEY (`pNo`),
  UNIQUE KEY `pNum_UNIQUE` (`pNo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (26,26,'안녕하세요.\r\n2013년도 1학기 데이터 베이스 강의를 수강하고 있는\r\n컴퓨터정보공학과 12080912 남건백입니다.',1,'안세훈'),(27,26,'페이스북 만들기는 정말 어렵네요',1,'우현정'),(28,26,'과제는 역시 밤을 세면서 해야 제맛이죠 ',3,'남건백, 안세훈, 우현정'),(29,27,'안녕하세요 남건백의 친구 안세훈입니다.\r\n 테스트 하나 둘 셋 ',1,'남건백'),(30,28,'마찬가지로 테스트 캐릭터입니다.\r\n하나 둘 셋 \r\n좋아요 부탁드립니다.',1,'남건백');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_like` (
  `plNo` int(11) NOT NULL AUTO_INCREMENT,
  `memNo` int(11) DEFAULT NULL,
  `pNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`plNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_like`
--

LOCK TABLES `post_like` WRITE;
/*!40000 ALTER TABLE `post_like` DISABLE KEYS */;
INSERT INTO `post_like` VALUES (7,26,28),(8,27,28),(9,27,26),(10,28,27),(11,28,28),(12,26,30),(13,26,29);
/*!40000 ALTER TABLE `post_like` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-20 21:47:13
