-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: academic
-- ------------------------------------------------------
-- Server version	10.3.20-MariaDB-0ubuntu0.19.04.1

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
-- Table structure for table `advises`
--

DROP TABLE IF EXISTS `advises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advises` (
  `instructor_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  PRIMARY KEY (`instructor_id`,`student_id`),
  KEY `FKadvises345096` (`student_id`),
  CONSTRAINT `FKadvises194026` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `FKadvises345096` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advises`
--

LOCK TABLES `advises` WRITE;
/*!40000 ALTER TABLE `advises` DISABLE KEYS */;
INSERT INTO `advises` VALUES ('1','111701010'),('2','111701012'),('3','1117013');
/*!40000 ALTER TABLE `advises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `announcement_id` int(10) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'fee portal','fee portal opened','20/12/2020');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `date` varchar(40) NOT NULL,
  `event` varchar(30) DEFAULT NULL,
  `holiday` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES ('2/3/2019',NULL,'false'),('3/3/2020','good friday','true');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_room`
--

DROP TABLE IF EXISTS `class_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_room` (
  `building` varchar(30) NOT NULL,
  `room_no` int(11) NOT NULL,
  `capacity` int(4) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_room`
--

LOCK TABLES `class_room` WRITE;
/*!40000 ALTER TABLE `class_room` DISABLE KEYS */;
INSERT INTO `class_room` VALUES ('manogatha	',304,50),('manogatha',204,30),('manogatha',205,80),('manogatha',301,30),('manogatha',302,35),('manogatha',303,30),('manogatha',305,35),('samgatha',101,30),('samgatha',102,20),('samgatha',201,35),('samgatha',202,40);
/*!40000 ALTER TABLE `class_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` varchar(25) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `course_title` varchar(50) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `course_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FKcourses436855` (`dept_name`),
  CONSTRAINT `FKcourses436855` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('1024','mechanical','power systems',4,'core'),('1123','HUMANITY','media',2,'GCE'),('1133','HUMANITY','linguistics',3,'GCE'),('1212','computer science','dbms',3,'core'),('1213','electrical','signals',3,'PME'),('1233','computer science','combinatorics',3,'PME'),('1302','physics','physics',3,'core'),('1305','HUMANITY','philosophy',3,'GCE'),('1312','civil','GEOTECH',4,'PME'),('1401','maths','probability stochastics',3,'core'),('1406','chemistry','chemistry',3,'core'),('1566','computer science','ML',3,'PME'),('1602','civil','structural analysis',3,'core'),('1660','civil','engineering maechanics',3,'core'),('1702','maths','algebra',3,'core'),('1855','mechanical','motors',3,'core');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(20) DEFAULT NULL,
  `budget` int(10) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('chemistry','manogatha',295555),('civil','samgatha',343545),('computer science','manogatha',1000000),('electrical','samgatha',566777),('HUMANITY','manogatha',255555),('maths','manogatha',284677),('mechanical','samgatha',422434),('physics','manogatha',315000);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eligible_courses`
--

DROP TABLE IF EXISTS `eligible_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligible_courses` (
  `instructor_id` varchar(20) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `semester` int(1) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  KEY `FKeligible_c324497` (`instructor_id`),
  KEY `FKeligible_c319331` (`dept_name`),
  CONSTRAINT `FKeligible_c319331` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`),
  CONSTRAINT `FKeligible_c324497` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eligible_courses`
--

LOCK TABLES `eligible_courses` WRITE;
/*!40000 ALTER TABLE `eligible_courses` DISABLE KEYS */;
INSERT INTO `eligible_courses` VALUES ('2','electrical',5,2019),('3','electrical',2,2020);
/*!40000 ALTER TABLE `eligible_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructor_id` varchar(20) NOT NULL,
  `instructor_name` varchar(30) DEFAULT NULL,
  `dept_name` varchar(20) NOT NULL,
  `salary` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`),
  KEY `FKinstructor688593` (`dept_name`),
  CONSTRAINT `FKinstructor688593` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('1','mrinal','computer science',100000,'sfddfgf','8080808080','mrinal@gmail.com'),('10','vinod','electrical',80000,'kuyygcb','9658714135','vinod@gmail.com'),('11','mathews','civil',110000,'libc.kjb','98423685','mathews@gmail.com'),('12','senthil','civil',80000,'liuukj','9652147852','senthil@gmail.com'),('13','anil','civil',90000,';nwfe;o','6584325','anil@gmail.com'),('14','madhukarthik','civil',85000,'ljbbf','785641235','madhu@gmail.com'),('15','bavathrathan','civil',95000,'eyfulu','96587452','bavath@gmail.com'),('16','mehta','mechanical',110000,';OIEIF','856246985','mehta@gmail.com'),('17','seshagiri','mechanical',95000,'klsbkjb','7562368456','krishna@gmail.com'),('18','chakravarthi','mechanical',75000,'liusubv','9586235897','chakri@gmail.com'),('19','sujatha','HUMANITY',60000,'jljliufbi','9845236845','sujatha@gmail.com'),('2','deepak','computer science',100000,'ffrdgfg','9191919191','deepak@gmail.com'),('20','anoop','HUMANITY',80000,'libfibiu','96658466265','anoop@gmail.com'),('21','amrita','HUMANITY',60000,'ljrflkk','8546236587','amrita@gmail.com'),('22','balakumar','maths',70000,'liaiuuhi','996584524','bala@gmail.com'),('23','lakshmi shankar','maths',80000,'jehwhfbu','9651422368','lakshmi@gmail.com'),('24','uma','physics',80000,'ailbfo','944521554','uma@gmIL.com'),('25','debarti','chemistry',75000,'iaugfpi','9652326','debarti@gmail.com'),('3','sandeep','computer science',100000,'efrege','9999999','sandeep@gmai.com'),('4','sahely','computer science',100000,'yegfyuu','96521684568','sahely@gmail.com'),('5','piyush','computer science',90000,'sjkddycgo','9845236845','piyush@gmail.com'),('6','sukumol','electrical',95000,'jhblisyc','9876523675','sukumol@gmail.com'),('7','swaroop','electrical',90000,'uhscbuy','9563147862','swaroop@gmail.com'),('8','manas kumar','electrical',85000,'jskcljcb','9844623547','manas@gmail.com'),('9','anirudh','electrical',80000,'ifbilsi','9563256315','anirudh@gmail.com');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prereq` (
  `course_id` varchar(25) NOT NULL,
  `prereq_id` varchar(20) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  CONSTRAINT `FKprereq452312` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('1213','1214'),('1312','1213'),('1566','1401'),('1566','1702'),('1602','1660');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `instructor_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `project_id` varchar(10) DEFAULT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`,`student_id`),
  KEY `FKproject668795` (`student_id`),
  CONSTRAINT `FKproject668795` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FKproject819865` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('2','111701010','1','toy','make a toy','finished'),('2','1117013','2','dbms','create database','pending'),('3','1117013','3','compilers','create a compiler','finsished');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `public_instructor`
--

DROP TABLE IF EXISTS `public_instructor`;
/*!50001 DROP VIEW IF EXISTS `public_instructor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `public_instructor` (
  `instructor_name` tinyint NOT NULL,
  `dept_name` tinyint NOT NULL,
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `course_id` varchar(25) NOT NULL,
  `sec_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` year(4) NOT NULL,
  `building` varchar(30) NOT NULL,
  `room_no` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `FKsection394883` (`building`,`room_no`),
  CONSTRAINT `FKsection394883` FOREIGN KEY (`building`, `room_no`) REFERENCES `class_room` (`building`, `room_no`),
  CONSTRAINT `FKsection891191` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('1123','15',6,2018,'manogatha',301),('1212','12',7,2019,'manogatha',301),('1024','13',8,2016,'manogatha',302),('1312','10',6,2019,'manogatha',303),('1602','19',5,2018,'samgatha',101),('1213','11',5,2017,'samgatha',201),('1024','16',6,2019,'samgatha',202);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `name` varchar(20) DEFAULT NULL,
  `staff_id` varchar(20) NOT NULL,
  `position` varchar(30) DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('biju','1','labadmin',122000),('unni','2','transport management',123122);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `student_name` varchar(30) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `total_creds` int(4) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `semester` int(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `year_of_joining` int(11) DEFAULT NULL,
  `degree` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FKstudent310828` (`dept_name`),
  CONSTRAINT `FKstudent310828` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('111701010','sravankumar','computer science',168,'sravan','kumar','9182297666','sravandasari111@gmail.com',5,'srikakulm,andhra','','',2017,'btech'),('111701012','sajith','computer science',168,'sajith','erasani','9676402685','sajith_erasani',6,'eluru','','',2017,'btech'),('1117013','santosh','electrical',187,'sanotsh','dsssd','969594939','sanod@fdsf.com',5,'hyderabad',NULL,'',2015,'btech'),('121701027','anil kumar','electrical',172,'anil','kumar','99647852135','anil@hmail.com',6,'guntur',NULL,NULL,2017,'btech'),('151801022','nitheesh chandra','civil',76,'nitheeesh','chandra','96545233','chandra@gmail.com',4,'nellore',NULL,NULL,2019,'mtech');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `student_information`
--

DROP TABLE IF EXISTS `student_information`;
/*!50001 DROP VIEW IF EXISTS `student_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_information` (
  `student_name` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `course_title` tinyint NOT NULL,
  `test1` tinyint NOT NULL,
  `test2` tinyint NOT NULL,
  `endsem` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takes` (
  `student_id` varchar(20) NOT NULL,
  `course_id` varchar(25) NOT NULL,
  `sec_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` year(4) NOT NULL,
  `attendance` int(3) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `FKtakes241332` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `FKtakes104146` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FKtakes241332` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('111701010','1123','15',6,2018,45),('111701010','1212','12',7,2019,76),('111701012','1024','13',8,2016,56),('111701012','1123','15',6,2018,89),('1117013','1312','10',6,2019,23);
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `instructor_id` varchar(20) NOT NULL,
  `course_id` varchar(25) NOT NULL,
  `sec_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`instructor_id`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `FKteaches461570` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `FKteaches447686` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `FKteaches461570` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('1','1024','16',6,2019),('2','1123','15',6,2018),('6','1213','11',5,2017);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `student_id` varchar(20) NOT NULL,
  `course_id` varchar(25) NOT NULL,
  `sec_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` year(4) NOT NULL,
  `test1` int(11) DEFAULT NULL,
  `test2` int(11) DEFAULT NULL,
  `class_tests` int(11) DEFAULT NULL,
  `endsem` int(11) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `FKtest673487` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `FKtest536301` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `FKtest673487` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('111701010','1024','13',8,2016,13,23,5,43,'A'),('1117013','1123','15',6,2018,31,23,65,12,'A'),('1117013','1312','10',6,2019,12,23,5,41,'B');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(20) NOT NULL,
  `day` varchar(20) NOT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `course_id` varchar(25) NOT NULL,
  `sec_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `FKtime_slot753742` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `FKtime_slot753742` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('1','monday','10.20','10.50','1123','15',6,2018),('1','thursday','10.00','11.00','1212','12',7,2019),('2','tuesday','13.10','2.00','1123','15',6,2018),('3','wednesday','3.00','4.00','1123','15',6,2018);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('111701010','sravan','sravan','student'),('111701012','sajith','sajith123','student'),('12345','admin','admin123','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `public_instructor`
--

/*!50001 DROP TABLE IF EXISTS `public_instructor`*/;
/*!50001 DROP VIEW IF EXISTS `public_instructor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `public_instructor` AS select `instructor`.`instructor_name` AS `instructor_name`,`instructor`.`dept_name` AS `dept_name`,`instructor`.`email` AS `email` from `instructor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_information`
--

/*!50001 DROP TABLE IF EXISTS `student_information`*/;
/*!50001 DROP VIEW IF EXISTS `student_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_information` AS select `student`.`student_name` AS `student_name`,`test`.`course_id` AS `course_id`,`courses`.`course_title` AS `course_title`,`test`.`test1` AS `test1`,`test`.`test2` AS `test2`,`test`.`endsem` AS `endsem` from (`student` join (`test` join `courses` on(`test`.`course_id` = `courses`.`course_id`)) on(`student`.`student_id` = `test`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 22:30:57
