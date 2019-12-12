-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: high_school
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `idcourses` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `hours_by_week` int(11) DEFAULT NULL,
  `teacher_assigned` int(11) NOT NULL,
  `schedule_time_idschedule_time` int(11) NOT NULL,
  PRIMARY KEY (`idcourses`,`teacher_assigned`,`schedule_time_idschedule_time`),
  KEY `fk_courses_teachers1_idx` (`teacher_assigned`),
  KEY `fk_courses_schedule_time1_idx` (`schedule_time_idschedule_time`),
  CONSTRAINT `fk_courses_schedule_time1` FOREIGN KEY (`schedule_time_idschedule_time`) REFERENCES `schedule_time` (`idschedule_time`),
  CONSTRAINT `fk_courses_teachers1` FOREIGN KEY (`teacher_assigned`) REFERENCES `teachers` (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'JavaProgramming',2,2,4),(2,'PythonProgramming',2,1,5),(3,'C#Programming',2,3,6),(4,'MSPaint',2,2,6);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notes` (
  `idnotes` int(11) NOT NULL AUTO_INCREMENT,
  `partial_note_1` int(11) NOT NULL,
  `partial_note_2` int(11) NOT NULL,
  `partial_note_3` int(11) NOT NULL,
  `final_note` int(11) NOT NULL,
  `courses_idcourses` int(11) NOT NULL,
  `students_idstudent` int(11) NOT NULL,
  PRIMARY KEY (`idnotes`,`courses_idcourses`,`students_idstudent`),
  KEY `fk_notes_courses1_idx` (`courses_idcourses`),
  KEY `fk_notes_idstudent_idx` (`students_idstudent`),
  CONSTRAINT `fk_notes_courses1` FOREIGN KEY (`courses_idcourses`) REFERENCES `courses` (`idcourses`),
  CONSTRAINT `fk_notes_idstudent` FOREIGN KEY (`students_idstudent`) REFERENCES `students` (`idstudent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,5,6,7,6,1,1),(2,6,6,7,6,1,2),(3,8,8,7,8,1,3);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time`
--

DROP TABLE IF EXISTS `schedule_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schedule_time` (
  `idschedule_time` int(11) NOT NULL AUTO_INCREMENT,
  `start_hour` time NOT NULL,
  `end_hour` time NOT NULL,
  `week_day` int(11) NOT NULL,
  PRIMARY KEY (`idschedule_time`,`week_day`),
  KEY `fk_schedule_time_week_days1_idx` (`week_day`),
  CONSTRAINT `fk_schedule_time_week_days1` FOREIGN KEY (`week_day`) REFERENCES `week_days` (`idweek_days`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time`
--

LOCK TABLES `schedule_time` WRITE;
/*!40000 ALTER TABLE `schedule_time` DISABLE KEYS */;
INSERT INTO `schedule_time` VALUES (4,'08:00:00','10:00:00',1),(5,'10:00:00','12:00:00',1),(6,'14:00:00','16:00:00',1);
/*!40000 ALTER TABLE `schedule_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `idstudent` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `registration_number` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alumno1','Apellido1',1,'1996-04-11'),(2,'Alumno2','Apellido2',2,'1997-05-12'),(3,'Alumno3','Apellido3',3,'1998-06-01');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachers` (
  `idteacher` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Ricardo','Kaka','1982-04-22'),(2,'Lionel','Messi','1987-06-24'),(3,'Cristiano','Ronaldo','1985-02-05');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_days`
--

DROP TABLE IF EXISTS `week_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `week_days` (
  `idweek_days` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(45) NOT NULL,
  PRIMARY KEY (`idweek_days`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_days`
--

LOCK TABLES `week_days` WRITE;
/*!40000 ALTER TABLE `week_days` DISABLE KEYS */;
INSERT INTO `week_days` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday');
/*!40000 ALTER TABLE `week_days` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 14:55:10
