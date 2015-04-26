CREATE DATABASE  IF NOT EXISTS `stockart` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stockart`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: stockart
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `itemId` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `customerId` varchar(20) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `thumbnailImage` varchar(256) DEFAULT NULL,
  `salePrice` double DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `userbean` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('36202746',2,'ram23','Straight Talk Samsung Galaxy S4 LTE Prepaid Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/07/0061696007372_100X100.jpg',449);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custinfo`
--

DROP TABLE IF EXISTS `custinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custinfo` (
  `username` varchar(20) NOT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `info2user` FOREIGN KEY (`username`) REFERENCES `userbean` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custinfo`
--

LOCK TABLES `custinfo` WRITE;
/*!40000 ALTER TABLE `custinfo` DISABLE KEYS */;
INSERT INTO `custinfo` VALUES ('abc','Rama','Chandrasekar','male','							 							 Abcd						 \r\n													\r\n							\r\n				Nrthesastrm									\r\n							\r\n													\r\n							'),('pujari.s','Shailesh','Pujari','male','Northeastern Univ					  \r\n							'),('ram12','Ramasubramanian','Chandrasekar','male','No.3 Saraswati Nivas\r\nK.A.Subramaniam Road,Matunga');
/*!40000 ALTER TABLE `custinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myreview`
--

DROP TABLE IF EXISTS `myreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myreview` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL,
  `itemName` varchar(256) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `reviewer` varchar(256) DEFAULT NULL,
  `reviewText` varchar(2000) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `submissionTime` date DEFAULT NULL,
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myreview`
--

LOCK TABLES `myreview` WRITE;
/*!40000 ALTER TABLE `myreview` DISABLE KEYS */;
INSERT INTO `myreview` VALUES (3,21805444,'Apple iPod nano 16GB',3,'Shailesh','I loved the product very much!!!!!','Good product','2015-04-24'),(4,37621322,'T-Mobile Nokia Lumia 635 Prepaid Smartphone',5,'rama2312','Very Nice Phone!','Nice Product','2015-04-24'),(5,37621322,'T-Mobile Nokia Lumia 635 Prepaid Smartphone',1,'rama2312','Added a new Review','New review','2015-04-24'),(6,37621322,'T-Mobile Nokia Lumia 635 Prepaid Smartphone',1,'rama2312','Added a new Review','New review','2015-04-24'),(7,40864922,'RCA 7\" Tablet 8GB Quad Core, Black',5,'ram23','Awesome product!!!','New review','2015-04-24'),(8,37016124,'Toshiba Satellite C55-B5296 - Celeron N2830 / 2.16 GHz - Windows 8.1 - 4 GB RAM - 500 GB HDD - DVD SuperMulti - 15.6\" 13',4,'pujari.s','Liked it very much!!!','Good product','2015-04-26'),(9,40864922,'RCA 7\" Tablet 8GB Quad Core, Black',0,'abc','Awwesome','New review','2015-04-26'),(10,22471912,'Casio Men\'s Sport Gear Watch Quartz Mineral Crystal SGW-500H-2BV',4,'abc','Awesome','Awesome','2015-04-26');
/*!40000 ALTER TABLE `myreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `itemId` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `thumbnailImage` varchar(256) DEFAULT NULL,
  `salePrice` double DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`orderDetailId`),
  KEY `orderdetail2orders_idx` (`orderId`),
  CONSTRAINT `orderdetail2orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES ('35510828',2,'Samsung Red WB1100F Smart Camera with 16.2 Megapixels and 35x Optical Zoom','http://i.walmartimages.com/i/p/00/88/72/76/69/0088727669045_100X100.jpg',179,29,4),('35522327',1,'Fruit of the Loom Men\'s Short Sleeve Crew Tee, 3 Pack','http://i.walmartimages.com/i/p/11/13/04/97/79/1113049779921_100X100.jpg',12,30,5),('17206377',2,'Carriage by Timex Women\'s White Dial Water-Resistant Watch, Expansion Band','http://i.walmartimages.com/i/p/00/75/30/48/31/0075304831358_100X100.jpg',21.92,32,6),('40864922',4,'RCA 7','http://i.walmartimages.com/i/p/00/06/21/18/67/0006211867730_100X100.jpg',47.99,32,7),('35524403',10,'Sony Cyber-shot DSC-W830 20.1 MP Digital camera with 2.7-Inch LCD (Black)','http://i.walmartimages.com/i/p/00/02/72/42/87/0002724287697_Color_Black_SW_100X100.jpg',104,33,8),('23608619',2,'Hanes Men\'s 6 Pack White Crew T-Shirt','http://i.walmartimages.com/i/p/00/04/39/35/51/0004393551618_Color_White_SW_100X100.jpg',14.48,34,9),('35510828',1,'Samsung Red WB1100F Smart Camera with 16.2 Megapixels and 35x Optical Zoom','http://i.walmartimages.com/i/p/00/88/72/76/69/0088727669045_100X100.jpg',179,34,10),('36202747',1,'TracFone LG 306G Triple Minute Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/07/0061696007040_100X100.jpg',29.83,34,11),('17206377',5,'Carriage by Timex Women\'s White Dial Water-Resistant Watch, Expansion Band','http://i.walmartimages.com/i/p/00/75/30/48/31/0075304831358_100X100.jpg',21.92,35,12),('19414166',1,'Faded Glory - Women\'s Basic Bootcut Jeans, 2-Pack Value Bundle','http://i.walmartimages.com/i/p/11/13/00/33/05/1113003305021_100X100.jpg',26,35,13),('21805444',4,'Apple iPod nano 16GB','http://i.walmartimages.com/i/p/00/88/59/09/56/0088590956491_Color_Blue_SW_100X100.jpg',119.99,36,14),('29010047',3,'Straight Talk ZTE Majesty 796C Prepaid Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/05/0061696005715_100X100.jpg',79.88,37,15),('41122949',2,'HP Black 15.6','http://i.walmartimages.com/i/p/00/88/87/93/99/0088879399945_100X100.jpg',299,37,16);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `orderStatus` varchar(45) NOT NULL,
  `totalPrice` double NOT NULL,
  `customerId` varchar(45) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `userId` FOREIGN KEY (`customerId`) REFERENCES `userbean` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (29,'2015-04-25','new',358,'abc'),(30,'2015-04-25','new',12,'abc'),(31,'2015-04-25','new',0,'abc'),(32,'2015-04-25','new',236,'abc'),(33,'2015-04-25','new',1040,'abc'),(34,'2015-04-26','new',238,'pujari.s'),(35,'2015-04-26','new',136,'pujari.s'),(36,'2015-04-26','new',480,'abc'),(37,'2015-04-26','new',838,'abc');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `itemId` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `salePrice` double DEFAULT NULL,
  `brandName` varchar(256) DEFAULT NULL,
  `shortDescription` varchar(256) DEFAULT NULL,
  `color` varchar(256) DEFAULT NULL,
  `customerRating` double DEFAULT NULL,
  `thumbnailImage` varchar(256) DEFAULT NULL,
  `customerRatingImage` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbean`
--

DROP TABLE IF EXISTS `userbean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbean` (
  `username` varchar(20) NOT NULL,
  `emailId` varchar(70) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbean`
--

LOCK TABLES `userbean` WRITE;
/*!40000 ALTER TABLE `userbean` DISABLE KEYS */;
INSERT INTO `userbean` VALUES ('abc','abc@gmail.com','123'),('chandrasekar.r','chandrasekar.r@husky.neu.edu','abc123'),('pujari.s','pujari.s@husky.neu.edu','root'),('ram12','gauravcshekar@gmail.com','1234'),('ram23','noiselessspace@gmail.com','123456'),('shail','shail@kdfj.com','123456');
/*!40000 ALTER TABLE `userbean` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-26 15:59:26
