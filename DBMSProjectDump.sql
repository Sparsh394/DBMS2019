-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: DBMSProject
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `batch` (
  `ID` int(11) NOT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `TotalFees` decimal(6,2) DEFAULT NULL,
  `Currency_ID` int(11) DEFAULT NULL,
  `Type_ID` int(11) DEFAULT NULL,
  `MaxNumberOfStudents` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f31` (`Course_ID`),
  KEY `f32` (`Currency_ID`),
  KEY `f33` (`Type_ID`),
  KEY `f34` (`ModifiedBy`),
  CONSTRAINT `f31` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`),
  CONSTRAINT `f32` FOREIGN KEY (`Currency_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `f33` FOREIGN KEY (`Type_ID`) REFERENCES `type` (`ID`),
  CONSTRAINT `f34` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,1,'2019-01-02','Piano Beginner','Beginner Piano',5000.00,1,6,5,NULL,NULL,NULL),(2,2,'2019-01-02','Guitar Intermediate','Intermediate Guitar',6000.00,1,6,5,NULL,NULL,NULL),(3,3,'2019-01-02','Keyboard Beginner','Beginner Keyboard',6000.00,1,6,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchslot`
--

DROP TABLE IF EXISTS `batchslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `batchslot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `ApprovedByTeacher` tinyint(1) DEFAULT NULL,
  `Batch_ID` int(11) DEFAULT NULL,
  `Lesson_ID` int(11) DEFAULT NULL,
  `Room_ID` int(11) DEFAULT NULL,
  `Status_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `Homework` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f37` (`Teacher_ID`),
  KEY `f38` (`Batch_ID`),
  KEY `f39` (`Lesson_ID`),
  KEY `f40` (`Room_ID`),
  KEY `f41` (`Status_ID`),
  KEY `f42` (`ModifiedBy`),
  CONSTRAINT `f37` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`),
  CONSTRAINT `f38` FOREIGN KEY (`Batch_ID`) REFERENCES `batch` (`ID`),
  CONSTRAINT `f39` FOREIGN KEY (`Lesson_ID`) REFERENCES `lesson` (`ID`),
  CONSTRAINT `f40` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`ID`),
  CONSTRAINT `f41` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`ID`),
  CONSTRAINT `f42` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchslot`
--

LOCK TABLES `batchslot` WRITE;
/*!40000 ALTER TABLE `batchslot` DISABLE KEYS */;
INSERT INTO `batchslot` VALUES (2,2,'2019-04-22','10:00:00',1,2,NULL,4,NULL,NULL,'2019-04-22 16:20:03',NULL,NULL);
/*!40000 ALTER TABLE `batchslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchstudents`
--

DROP TABLE IF EXISTS `batchstudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `batchstudents` (
  `ID` int(11) NOT NULL,
  `Batch_ID` int(11) DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f35` (`ModifiedBy`),
  KEY `f36` (`Batch_ID`),
  KEY `f37` (`Student_ID`),
  CONSTRAINT `f35` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f36` FOREIGN KEY (`Batch_ID`) REFERENCES `batch` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchstudents`
--

LOCK TABLES `batchstudents` WRITE;
/*!40000 ALTER TABLE `batchstudents` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchstudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `CategoryName` varchar(30) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f21` (`ModifiedBy`),
  CONSTRAINT `f21` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Beginner',0,NULL,NULL),(2,'Intermediate',0,NULL,NULL),(3,'Advanced',0,NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL,
  `Music_ID` int(11) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `NumberOfLessons` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f28` (`ModifiedBy`),
  KEY `f29` (`Music_ID`),
  KEY `f30` (`Category_ID`),
  CONSTRAINT `f28` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f29` FOREIGN KEY (`Music_ID`) REFERENCES `music` (`ID`),
  CONSTRAINT `f30` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,1,'Piano Beginner',8,NULL,NULL,NULL),(2,2,2,'Guitar Intermediate',8,NULL,NULL,NULL),(3,3,1,'Keyboard Beginner',8,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currency` (
  `ID` int(11) NOT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f24` (`ModifiedBy`),
  CONSTRAINT `f24` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'INR',NULL,NULL,NULL);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `LessonNumber` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f43` (`Course_ID`),
  KEY `f44` (`ModifiedBy`),
  CONSTRAINT `f43` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`),
  CONSTRAINT `f44` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music` (
  `ID` int(11) NOT NULL,
  `MusicType` varchar(30) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f22` (`ModifiedBy`),
  CONSTRAINT `f22` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'Piano',NULL,NULL,NULL),(2,'Guitar',NULL,NULL,NULL),(3,'Keyboard',NULL,NULL,NULL),(4,'Vocal',NULL,NULL,NULL),(5,'Drums',NULL,NULL,NULL);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `ID` int(11) NOT NULL,
  `RoomNumber` varchar(10) DEFAULT NULL,
  `RoomName` varchar(10) DEFAULT NULL,
  `Size` int(11) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f23` (`ModifiedBy`),
  CONSTRAINT `f23` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'100','100',10,NULL,NULL,NULL,NULL),(2,'101','101',10,NULL,NULL,NULL,NULL),(3,'102','102',10,NULL,NULL,NULL,NULL),(4,'103A','Studio 1',5,'Drums Available',NULL,NULL,NULL),(5,'103B','Studio 2',5,'Drums Available',NULL,NULL,NULL),(6,'104','104',20,NULL,NULL,NULL,NULL),(7,'105','105',10,NULL,NULL,NULL,NULL),(8,'106','106',15,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salary` (
  `ID` int(11) NOT NULL,
  `Month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `Teacher_ID` int(11) DEFAULT NULL,
  `Amount` decimal(6,2) DEFAULT NULL,
  `Currency_ID` int(11) DEFAULT NULL,
  `ApprovedByTeacher` tinyint(1) DEFAULT NULL,
  `ApprovedByStaff` tinyint(1) DEFAULT NULL,
  `Status_ID` int(11) DEFAULT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f46` (`Teacher_ID`),
  KEY `f47` (`Currency_ID`),
  KEY `f48` (`Status_ID`),
  KEY `f49` (`ModifiedBy`),
  CONSTRAINT `f45` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f46` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`),
  CONSTRAINT `f47` FOREIGN KEY (`Currency_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `f48` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`ID`),
  CONSTRAINT `f49` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(3000) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `AdminFlag` tinyint(1) DEFAULT NULL,
  `Status_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f3` (`User_ID`),
  KEY `f4` (`Status_ID`),
  KEY `f5` (`ModifiedBy`),
  CONSTRAINT `f3` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `f4` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`ID`),
  CONSTRAINT `f5` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Pranav','Dahiya',9988776655,'pranav.dahiya@email.com','Some Address','1995-01-01','2018-01-01',1,1,0,NULL,NULL,1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `Type_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f25` (`Type_ID`),
  KEY `f26` (`ModifiedBy`),
  CONSTRAINT `f25` FOREIGN KEY (`Type_ID`) REFERENCES `type` (`ID`),
  CONSTRAINT `f26` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active',NULL,NULL,NULL,NULL),(2,'Inactive',NULL,NULL,NULL,NULL),(3,'Approved',NULL,NULL,NULL,NULL),(4,'NotApproved',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `EnrollmentNumber` int(11) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(3000) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `Status_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f6` (`ModifiedBy`),
  KEY `f7` (`Status_ID`),
  KEY `f8` (`User_ID`),
  CONSTRAINT `f6` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f7` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`ID`),
  CONSTRAINT `f8` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Mohit','Kumar',275,8877665544,'mohit.kumar@email.com','Some other Address','1999-01-01','2019-01-01',1,0,NULL,NULL,4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcategory`
--

DROP TABLE IF EXISTS `studentcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentcategory` (
  `ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Music_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f9` (`Student_ID`),
  KEY `f10` (`Category_ID`),
  KEY `f11` (`Music_ID`),
  KEY `f12` (`ModifiedBy`),
  CONSTRAINT `f10` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `f11` FOREIGN KEY (`Music_ID`) REFERENCES `music` (`ID`),
  CONSTRAINT `f12` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f9` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcategory`
--

LOCK TABLES `studentcategory` WRITE;
/*!40000 ALTER TABLE `studentcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `EnrollmentNumber` int(11) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(3000) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `Status_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f13` (`Status_ID`),
  KEY `f14` (`ModifiedBy`),
  KEY `f15` (`User_ID`),
  CONSTRAINT `f13` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`ID`),
  CONSTRAINT `f14` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`),
  CONSTRAINT `f15` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Sparsh','Agarwalla',187,7766554433,'sparsh.agarwalla@email.com','Some third Address','1999-01-01','2019-01-01',1,0,NULL,NULL,2),(2,'Neelesh','Roy',186,7755443311,'neelesh.roy@email.com','Some fourth Address','1997-01-01','2019-01-01',1,0,NULL,NULL,3);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachercategory`
--

DROP TABLE IF EXISTS `teachercategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachercategory` (
  `ID` int(11) NOT NULL,
  `Teacher_ID` int(11) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Music_ID` int(11) DEFAULT NULL,
  `FeesPerSession` decimal(6,2) DEFAULT NULL,
  `Currency_ID` int(11) DEFAULT NULL,
  `wefDate` date DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f16` (`Category_ID`),
  KEY `f17` (`Teacher_ID`),
  KEY `f18` (`Music_ID`),
  KEY `f19` (`Currency_ID`),
  KEY `f20` (`ModifiedBy`),
  CONSTRAINT `f16` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `f17` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`),
  CONSTRAINT `f18` FOREIGN KEY (`Music_ID`) REFERENCES `music` (`ID`),
  CONSTRAINT `f19` FOREIGN KEY (`Currency_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `f20` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachercategory`
--

LOCK TABLES `teachercategory` WRITE;
/*!40000 ALTER TABLE `teachercategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachercategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `ID` int(11) NOT NULL,
  `TypeName` varchar(30) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f27` (`ModifiedBy`),
  CONSTRAINT `f27` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Student-batch',NULL,NULL,NULL),(2,'Student-individual',NULL,NULL,NULL),(3,'Teacher',NULL,NULL,NULL),(4,'Staff',NULL,NULL,NULL),(5,'Individual',NULL,NULL,NULL),(6,'Batch',NULL,NULL,NULL),(7,'Currency',NULL,NULL,NULL),(8,'Active-Inactive',NULL,NULL,NULL);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Type_ID` int(11) DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  `ModifiedOn` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `f1` (`Type_ID`),
  KEY `f2` (`ModifiedBy`),
  CONSTRAINT `f1` FOREIGN KEY (`Type_ID`) REFERENCES `type` (`ID`),
  CONSTRAINT `f2` FOREIGN KEY (`ModifiedBy`) REFERENCES `staff` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pdahiya','1234',4,NULL,NULL,NULL),(2,'saggarwalla','1234',3,NULL,NULL,NULL),(3,'nroy','1234',3,NULL,NULL,NULL),(4,'mkumar','1234',1,NULL,NULL,NULL);
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

-- Dump completed on 2019-04-23 14:32:18
