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
-- Table structure for table `adminbean`
--

DROP TABLE IF EXISTS `adminbean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminbean` (
  `username` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminbean`
--

LOCK TABLES `adminbean` WRITE;
/*!40000 ALTER TABLE `adminbean` DISABLE KEYS */;
INSERT INTO `adminbean` VALUES ('admin','admin');
/*!40000 ALTER TABLE `adminbean` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `cart` VALUES ('29002544',1,'rama','Straight Talk Samsung R375C Prepaid Cell Phone with $30 All You Need Plan, Refurbished','http://i.walmartimages.com/i/p/00/61/69/60/06/0061696006585_100X100.jpg',35.88),('29010047',1,'rama','Straight Talk ZTE Majesty 796C Prepaid Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/05/0061696005715_100X100.jpg',79.88),('36202746',1,'rama','Straight Talk Samsung Galaxy S4 LTE Prepaid Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/07/0061696007372_100X100.jpg',449),('42029252',1,'rama','Nikon COOLPIX L29 16MP Digital Camera with Memory Card and Camera Case Value Bundle','http://i.walmartimages.com/i/p/11/13/07/14/41/1113071441352_100X100.jpg',54.98);
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
INSERT INTO `custinfo` VALUES ('rama','Ramasubramanian','Chandrasekar','male','							  \r\n				ABCDEF			');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES ('38693704',1,'RCA 7\" Tablet 8GB Quad Core with Keyboard/Case','http://i.walmartimages.com/i/p/00/06/21/18/67/0006211867734_Color_Charcoal_SW_100X100.jpg',49.99,42,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (42,'2015-04-28','Completed',49.99,'pujari.s');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `trxnId` varchar(45) NOT NULL,
  `amount` double NOT NULL,
  `paymentDate` date NOT NULL,
  `orderId` int(11) NOT NULL,
  PRIMARY KEY (`trxnId`),
  KEY `payment2order_idx` (`orderId`),
  CONSTRAINT `payment2order` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('4UD85036E54698503',49.99,'2015-04-28',42);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
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
  `largeImage` varchar(256) DEFAULT NULL,
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
INSERT INTO `userbean` VALUES ('pujari.s','pujari.s@husky.neu.edu','root'),('rama','rama@gmail.com','123');
/*!40000 ALTER TABLE `userbean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `itemId` varchar(45) NOT NULL,
  `customerId` varchar(20) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `thumbnailImage` varchar(256) DEFAULT NULL,
  `salePrice` double NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `wishlist2userbean_idx` (`customerId`),
  CONSTRAINT `wishlist2userbean` FOREIGN KEY (`customerId`) REFERENCES `userbean` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES ('29010047','rama','Straight Talk ZTE Majesty 796C Prepaid Cell Phone','http://i.walmartimages.com/i/p/00/61/69/60/05/0061696005715_100X100.jpg',79.88);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-28 17:00:40
