-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms_project
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor_actress`
--

DROP TABLE IF EXISTS `actor_actress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor_actress` (
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `movie_id` int NOT NULL,
  KEY `act_movie_id` (`movie_id`),
  CONSTRAINT `act_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_actress`
--

LOCK TABLES `actor_actress` WRITE;
/*!40000 ALTER TABLE `actor_actress` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor_actress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `cinema_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(405) NOT NULL,
  PRIMARY KEY (`cinema_id`),
  UNIQUE KEY `city_UNIQUE` (`city`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (99,'Optimum Avşarlar','Adana','Optimum AVM');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `card_number` char(16) NOT NULL,
  `cvv` int NOT NULL,
  `expiration_year` int NOT NULL,
  `expiration_month` char(3) NOT NULL,
  `wallet_id` varchar(36) NOT NULL,
  KEY `credit_cards_wallet_id` (`wallet_id`),
  CONSTRAINT `credit_cards_wallet_id` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`wallet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES ('1234567812345678',123,2030,'Jan','18'),('1234567812345678',123,2030,'Jan','18'),('1234123412341234',123,2030,'JAN','19');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter` (
  `f_city` varchar(45) DEFAULT NULL,
  `f_cinema` varchar(45) DEFAULT NULL,
  `f_day` varchar(45) DEFAULT NULL,
  `f_rating` varchar(45) DEFAULT NULL,
  `f_is_released` tinyint DEFAULT NULL,
  `f_genre` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  KEY `filter_user_id` (`user_id`),
  KEY `filter_cinema_id` (`cinema_id`),
  CONSTRAINT `filter_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `filter_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `imdb_rate` decimal(10,2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `show_times` varchar(45) DEFAULT NULL,
  `days` varchar(45) DEFAULT NULL,
  `is_released` tinyint DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `r_comment` varchar(45) DEFAULT NULL,
  `r_star` int DEFAULT NULL,
  `r_date` date DEFAULT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `rates_movie_id` (`movie_id`),
  KEY `rates_user_id` (`user_id`),
  CONSTRAINT `rates_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `rates_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `is_empty` tinyint NOT NULL,
  `cinema_id` int NOT NULL,
  `seat_row` char(1) NOT NULL,
  `seat_col` int NOT NULL,
  `theater_id` int NOT NULL,
  `ticket_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`,`cinema_id`,`theater_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`),
  KEY `seat_cinema_id` (`cinema_id`),
  KEY `seat_theater_id` (`theater_id`),
  KEY `seat_ticket_id` (`ticket_id`),
  CONSTRAINT `seat_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `seat_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`),
  CONSTRAINT `seat_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,0,99,'A',2,1,NULL);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theater_id` int NOT NULL AUTO_INCREMENT,
  `num_of_seats` int NOT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`theater_id`,`cinema_id`),
  UNIQUE KEY `theater_id_UNIQUE` (`theater_id`),
  KEY `theater_cinema_id` (`cinema_id`),
  CONSTRAINT `theater_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,32,99),(2,64,99);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `day` varchar(45) NOT NULL,
  `showtime` varchar(45) NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `theater_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`),
  KEY `ticket_user_id` (`user_id`),
  KEY `ticket_cinema_id` (`cinema_id`),
  KEY `ticket_seat_id` (`seat_id`),
  KEY `ticket_theater_id` (`theater_id`),
  CONSTRAINT `ticket_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `ticket_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `ticket_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `ticket_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`),
  CONSTRAINT `ticket_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `movies_watched` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `tickets` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'kerem','elma','5bce75718cb1b41ede99f842c559467c8e987ec2883515b5905f9587b4328b62',NULL,NULL,NULL,'kelma@etu.edu.tr'),(17,'mehmet','eski','cdba7b5cda81b8a2b6d15265d75d5c4a424ea805dc85590b4f980f8826109b2c',NULL,NULL,NULL,'meski@etu.edu.tr'),(19,'neva','varol','81a8a7e6d87956b746a74a7e98795a2549d8d2d82a62a0cf31e914eddab6a591',NULL,NULL,NULL,'nevavarol@etu.edu.tr'),(21,'name','surname','821fa13813f5d51675295a86867110c493f1f4a4e0ff77364d0cc59c729632c8',NULL,NULL,NULL,'balanceuser@etu.edu.tr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `ticket` varchar(45) DEFAULT NULL,
  `balance` varchar(45) NOT NULL,
  `coupon` varchar(45) DEFAULT NULL,
  `wallet_id` varchar(36) NOT NULL,
  `credit_cards` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`wallet_id`),
  KEY `wallet_user_id` (`user_id`),
  CONSTRAINT `wallet_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES ('','0','','17','',17),('','0','','18','',18),('','0','','19','',19),('','0','','20','',20),(NULL,'0',NULL,'21','',21);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21 18:28:26
