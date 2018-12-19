-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: examonline
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
-- Table structure for table `cauhoi`
--

DROP TABLE IF EXISTS `cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cauhoi` (
  `MaCH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NoiDung` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PhuongAnA` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PhuongAnB` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PhuongAnC` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PhuongAnD` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DapAn` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaMH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaND` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaCH`),
  KEY `MaMH` (`MaMH`),
  KEY `MaND` (`MaND`),
  CONSTRAINT `cauhoi_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`mamh`),
  CONSTRAINT `cauhoi_ibfk_2` FOREIGN KEY (`MaND`) REFERENCES `noidungthi` (`mand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi`
--

LOCK TABLES `cauhoi` WRITE;
/*!40000 ALTER TABLE `cauhoi` DISABLE KEYS */;
INSERT INTO `cauhoi` VALUES ('CH002','Wondershare Filmora','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH003','aabbbb','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH004','aaaabb','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH005','bbaaaa','aaaa','bbbb','cccc','dddd','A','LTW','Servlet'),('CH006','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH007','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH008','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH009','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH010','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH011','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH012','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','JSP'),('CH013','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','Servlet'),('CH014','aaaaaa','aaaa','bbbb','cccc','dddd','A','LTW','Servlet'),('CH020','aaaaaa','aaaa','bbbb','cccc','dddd','D','LTW','JSP');
/*!40000 ALTER TABLE `cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdethi`
--

DROP TABLE IF EXISTS `ctdethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ctdethi` (
  `MaDe` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaCH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaDe`,`MaCH`),
  KEY `MaCH` (`MaCH`),
  CONSTRAINT `ctdethi_ibfk_1` FOREIGN KEY (`MaDe`) REFERENCES `dethi` (`made`),
  CONSTRAINT `ctdethi_ibfk_2` FOREIGN KEY (`MaCH`) REFERENCES `cauhoi` (`mach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdethi`
--

LOCK TABLES `ctdethi` WRITE;
/*!40000 ALTER TABLE `ctdethi` DISABLE KEYS */;
INSERT INTO `ctdethi` VALUES ('DE001','CH002'),('DE001','CH003'),('DE002','CH003'),('DE001','CH004'),('DE002','CH004'),('DE001','CH006'),('DE001','CH007'),('DE001','CH008'),('DE002','CH008'),('DE001','CH009'),('DE001','CH010'),('DE002','CH010'),('DE001','CH011'),('DE002','CH011'),('DE001','CH012'),('DE001','CH013');
/*!40000 ALTER TABLE `ctdethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctthi`
--

DROP TABLE IF EXISTS `ctthi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ctthi` (
  `MaDe` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `UserName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Diem` double(2,1) DEFAULT NULL,
  PRIMARY KEY (`MaDe`,`UserName`),
  KEY `UserName` (`UserName`),
  CONSTRAINT `ctthi_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `thi` (`username`),
  CONSTRAINT `ctthi_ibfk_2` FOREIGN KEY (`MaDe`) REFERENCES `thi` (`made`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctthi`
--

LOCK TABLES `ctthi` WRITE;
/*!40000 ALTER TABLE `ctthi` DISABLE KEYS */;
INSERT INTO `ctthi` VALUES ('DE001','sv1',6.3);
/*!40000 ALTER TABLE `ctthi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dethi`
--

DROP TABLE IF EXISTS `dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dethi` (
  `MaDe` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TenDe` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThoiGian` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaDe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi`
--

LOCK TABLES `dethi` WRITE;
/*!40000 ALTER TABLE `dethi` DISABLE KEYS */;
INSERT INTO `dethi` VALUES ('DE001','Giữa kỳ lập trình web','10'),('DE002','demo','1');
/*!40000 ALTER TABLE `dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kythi`
--

DROP TABLE IF EXISTS `kythi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kythi` (
  `MaDe` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaLop` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PhongThi` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaDe`,`MaLop`),
  KEY `MaLop` (`MaLop`),
  CONSTRAINT `kythi_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `users` (`malop`),
  CONSTRAINT `kythi_ibfk_2` FOREIGN KEY (`MaDe`) REFERENCES `dethi` (`made`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kythi`
--

LOCK TABLES `kythi` WRITE;
/*!40000 ALTER TABLE `kythi` DISABLE KEYS */;
INSERT INTO `kythi` VALUES ('DE001','141101','A5-302'),('DE002','141101','a1-132');
/*!40000 ALTER TABLE `kythi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monhoc` (
  `MaMH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TenMH` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES ('LTW','Lập trình web');
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noidungthi`
--

DROP TABLE IF EXISTS `noidungthi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noidungthi` (
  `MaND` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TenND` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaMH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaND`),
  KEY `MaMH` (`MaMH`),
  CONSTRAINT `noidungthi_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`mamh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noidungthi`
--

LOCK TABLES `noidungthi` WRITE;
/*!40000 ALTER TABLE `noidungthi` DISABLE KEYS */;
INSERT INTO `noidungthi` VALUES ('JSP','Lập trình JSP','LTW'),('Servlet','Servlet','LTW');
/*!40000 ALTER TABLE `noidungthi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `RoleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Admin','Admin'),('QLD','Quản lý đề thi'),('QLKT','Quản lý kỳ thi'),('QLNHCH','Quản trị ngân hàng câu hỏi'),('SV','Sinh viên');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thi`
--

DROP TABLE IF EXISTS `thi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thi` (
  `UserName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaDe` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MaCH` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DAUser` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Diem` int(2) DEFAULT NULL,
  PRIMARY KEY (`UserName`,`MaDe`,`MaCH`),
  KEY `MaDe` (`MaDe`),
  KEY `MaCH` (`MaCH`),
  KEY `UserName` (`UserName`),
  CONSTRAINT `thi_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `users` (`username`),
  CONSTRAINT `thi_ibfk_2` FOREIGN KEY (`MaDe`) REFERENCES `dethi` (`made`),
  CONSTRAINT `thi_ibfk_3` FOREIGN KEY (`MaCH`) REFERENCES `cauhoi` (`mach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thi`
--

LOCK TABLES `thi` WRITE;
/*!40000 ALTER TABLE `thi` DISABLE KEYS */;
INSERT INTO `thi` VALUES ('sv1','DE001','CH002','A',1),('sv1','DE001','CH003','B',0),('sv1','DE001','CH004','A',1),('sv1','DE001','CH006','B',0),('sv1','DE001','CH007','A',1),('sv1','DE001','CH008','A',1),('sv1','DE001','CH009','A',1),('sv1','DE001','CH010','A',1),('sv1','DE001','CH011','A',1),('sv1','DE001','CH012','B',0);
/*!40000 ALTER TABLE `thi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `UserName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `NumberPhone` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLop` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoleID` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserName`),
  KEY `RoleID` (`RoleID`),
  KEY `MaLop` (`MaLop`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Admin','123456','Phong','male','1996-08-15','01675946414','Thu Duc','admin@gmail.com','','Admin'),('qlch','123456','Uy','male','2016-12-23','0784734343',NULL,'phongtttt@gmail.com','','QLNHCH'),('qld','123456','Quang',NULL,NULL,'0167584332',NULL,'qld@gmail.com','','QLD'),('qlkt','123456','Thanh',NULL,NULL,'0156775454',NULL,'abc@gmail.com','','QLKT'),('sv1','123456','Phong','male','2016-12-22','01675946536','Thu Duc','phongt@gmail.com','141101','SV'),('sv2','123456','Trang','','2016-12-28','3232344545',NULL,'phongtsd@gmail.com','141101','SV');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-18 22:38:35
