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
  `cinema_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(405) NOT NULL,
  `theaters` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
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
  CONSTRAINT `credit_cards_wallet_id` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`wallet_id`)
  ON DELETE CASCADE
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
  `cinema_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `filter_cinema_id` (`cinema_id`),
  KEY `filter_user_id` (`user_id`),
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
  `name` varchar(100) DEFAULT NULL,
  `imdb_rate` decimal(10,2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `show_times` varchar(45) DEFAULT NULL,
  `days` varchar(45) DEFAULT NULL,
  `is_released` tinyint DEFAULT NULL,
  `image_id` varchar(400) DEFAULT NULL,
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
  `seat_id` int NOT NULL,
  `is_empty` tinyint NOT NULL,
  `theater_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`theater_id`,`cinema_id`,`seat_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`),
  KEY `cinema_id_idx` (`cinema_id`),
  KEY `seat_cinema_id_idx` (`cinema_id`),
  CONSTRAINT `seat_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `seat_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theatre` (`theatre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre` (
  `theatre_id` int NOT NULL,
  `num_of_seats` int NOT NULL,
  `seats` varchar(45) DEFAULT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`theatre_id`,`cinema_id`),
  UNIQUE KEY `cinema_id_UNIQUE` (`cinema_id`),
  UNIQUE KEY `theatre_id_UNIQUE` (`theatre_id`),
  CONSTRAINT `theatre_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
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
  `cinema_id` int NOT NULL,
  `theater_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `theater_id_UNIQUE` (`theater_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`),
  KEY `ticket_cinema_id_idx` (`cinema_id`),
  KEY `ticket_user_id` (`user_id`),
  CONSTRAINT `ticket_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `ticket_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `ticket_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `ticket_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theatre` (`theatre_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'melih','akça','14rwedsfzdfgew5y4wresgfwrge',NULL,NULL,NULL,'hakca@etu.edu.tr'),(8,'kerem','elma','5bce75718cb1b41ede99f842c559467c8e987ec2883515b5905f9587b4328b62',NULL,NULL,NULL,'kelma@etu.edu.tr'),(17,'mehmet','eski','cdba7b5cda81b8a2b6d15265d75d5c4a424ea805dc85590b4f980f8826109b2c',NULL,NULL,NULL,'meski@etu.edu.tr'),(19,'neva','varol','81a8a7e6d87956b746a74a7e98795a2549d8d2d82a62a0cf31e914eddab6a591',NULL,NULL,NULL,'nevavarol@etu.edu.tr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `tickets` varchar(45) DEFAULT NULL,
  `balance` varchar(45) NOT NULL,
  `coupons` varchar(45) DEFAULT NULL,
  `wallet_id` varchar(36) NOT NULL,
  `credit_cards` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`wallet_id`),
  KEY `wallet_user_id` (`user_id`),
  CONSTRAINT `wallet_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES ('','0','','17','',17),('','0','','18','',18),('','0','','19','',19),('','0','','20','',20);
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

-- Dump completed on 2024-07-21  1:52:49
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released,image_id) VALUES  
(1, 8.5, '2h 30m', 'Drama', 'Titanic', 8.7, 'A love story on the ill-fated Titanic', '7:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0120338/mediaviewer/rm4017282560/'), 
(2, 7.8, '2h 10m', 'Action', 'Mr. & Mrs. Smith', 7.5, 'A married couple discovers they are both assassins', '8:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0356910/mediaviewer/rm4017282560/'), 
(3, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '9:00 PM', 'Sunday', 1, 'https://www.imdb.com/title/tt0111161/mediaviewer/rm4017282560/'), 
(4, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '10:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt1375666/mediaviewer/rm4017282560/'), 
(5, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '11:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt1119646/mediaviewer/rm4017282560/'), 
(6, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '12:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt0068646/mediaviewer/rm4017282560/'), 
(7, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '1:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0468569/mediaviewer/rm4017282560/'), 
(8, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '2:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0108052/mediaviewer/rm4017282560/'), 
(9, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '3:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0167260/mediaviewer/rm4017282560/'), 
(10, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '4:00 PM', 'Sunday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/'), 
(11, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '5:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt0167261/mediaviewer/rm4017282560/'), 
(12, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '6:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm4017282560/'), 
(13, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '7:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm4017282560/'), 
(14, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '8:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/'), 
(15, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '9:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0167261/mediaviewer/rm4017282560/'), 
(16, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '10:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm4017282560/'), 
(17, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '11:00 PM', 'Sunday', 1, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm4017282560/'), 
(18, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '12:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt0111161/mediaviewer/rm4017282560/'), 
(19, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '1:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt1375666/mediaviewer/rm4017282560/'), 
(20, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '2:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt1119646/mediaviewer/rm4017282560/'), 
(21, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '3:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0068646/mediaviewer/rm4017282560/'), 
(22, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '4:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0468569/mediaviewer/rm4017282560/'), 
(23, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '5:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0108052/mediaviewer/rm4017282560/'), 
(24, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '3:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0167260/mediaviewer/rm4017282560/'), 
(25, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '4:00 PM', 'Sunday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/'), 
(26, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '5:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt0167261/mediaviewer/rm4017282560/'), 
(27, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '6:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm4017282560/'), 
(28, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '7:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm4017282560/'), 
(29, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '8:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/'), 
(30, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '9:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0167261/mediaviewer/rm4017282560/'), 
(31, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '10:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm4017282560/'), 
(32, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '11:00 PM', 'Sunday', 1, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm4017282560/'), 
(33, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '12:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt0111161/mediaviewer/rm4017282560/'), 
(34, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '1:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt1375666/mediaviewer/rm4017282560/'), 
(35, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '2:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt1119646/mediaviewer/rm4017282560/'), 
(36, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '3:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0068646/mediaviewer/rm4017282560/'), 
(37, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '4:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0468569/mediaviewer/rm4017282560/'), 
(38, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '5:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0108052/mediaviewer/rm4017282560/'),
(39, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '9:00 PM', 'Monday', 1, 'https://www.imdb.com/title/tt0167260/mediaviewer/rm4017282560/'),
(40, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '10:00 PM', 'Tuesday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/'),
(41, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '11:00 PM', 'Wednesday', 1, 'https://www.imdb.com/title/tt0167261/mediaviewer/rm4017282560/'),
(42, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '12:00 PM', 'Thursday', 1, 'https://www.imdb.com/title/tt0133093/mediaviewer/rm4017282560/'),
(43, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '1:00 PM', 'Friday', 1, 'https://www.imdb.com/title/tt0109830/mediaviewer/rm4017282560/'),
(44, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '2:00 PM', 'Saturday', 1, 'https://www.imdb.com/title/tt0120737/mediaviewer/rm4017282560/');
INSERT INTO actor_actress (name, surname, movie_id) VALUES 
('Leonardo', 'DiCaprio', 1),
('Kate', 'Winslet', 1),
('Brad', 'Pitt', 2),
('Angelina', 'Jolie', 2),
('Tim', 'Robbins', 3),
('Morgan', 'Freeman', 3),
('Leonardo', 'DiCaprio', 4),
('Joseph', 'Gordon-Levitt', 4),
('Zach', 'Galifianakis', 5),
('Bradley', 'Cooper', 5),
('Marlon', 'Brando', 6),
('Al', 'Pacino', 6),
('Christian', 'Bale', 7),
('Heath', 'Ledger', 7),
('Liam', 'Neeson', 8),
('Ben', 'Kingsley', 8),
('Elijah', 'Wood', 9),
('Viggo', 'Mortensen', 9),
('Elijah', 'Wood', 10),
('Viggo', 'Mortensen', 10),
('Elijah', 'Wood', 11),
('Viggo', 'Mortensen', 11),
('Keanu', 'Reeves', 12),
('Laurence', 'Fishburne', 12),
('Tom', 'Hanks', 13),
('Robin', 'Wright', 13),
('Elijah', 'Wood', 14),
('Viggo', 'Mortensen', 14),
('Elijah', 'Wood', 15),
('Viggo', 'Mortensen', 15),
('Elijah', 'Wood', 16),
('Viggo', 'Mortensen', 16),
('Keanu', 'Reeves', 17),
('Laurence', 'Fishburne', 17),
('Tom', 'Hanks', 18),
('Robin', 'Wright', 18),
('Elijah', 'Wood', 19),
('Viggo', 'Mortensen', 19),
('Elijah', 'Wood', 20),
('Viggo', 'Mortensen', 20),
('Elijah', 'Wood', 21),
('Viggo', 'Mortensen', 21),
('Keanu', 'Reeves', 22),
('Laurence', 'Fishburne', 22),
('Tom', 'Hanks', 23),
('Robin', 'Wright', 23),
('Elijah', 'Wood', 24),
('Viggo', 'Mortensen', 24),
('Elijah', 'Wood', 25),
('Viggo', 'Mortensen', 25),
('Elijah', 'Wood', 26),
('Viggo', 'Mortensen', 26),
('Keanu', 'Reeves', 27),
('Laurence', 'Fishburne', 27),
('Tom', 'Hanks', 28),
('Robin', 'Wright', 28),
('Elijah', 'Wood', 29),
('Viggo', 'Mortensen', 29),
('Elijah', 'Wood', 30),
('Viggo', 'Mortensen', 30),
('Elijah', 'Wood', 31),
('Viggo', 'Mortensen', 31),
('Keanu', 'Reeves', 32),
('Laurence', 'Fishburne', 32),
('Tom', 'Hanks', 33),
('Robin', 'Wright', 33),
('Elijah', 'Wood', 34),
('Viggo', 'Mortensen', 34),
('Elijah', 'Wood', 35),
('Viggo', 'Mortensen', 35),
('Elijah', 'Wood', 36),
('Viggo', 'Mortensen', 36),
('Keanu', 'Reeves', 37),
('Laurence', 'Fishburne', 37),
('Tom', 'Hanks', 38),
('Robin', 'Wright', 38),
('Elijah', 'Wood', 39),
('Viggo', 'Mortensen', 39),
('Elijah', 'Wood', 40),
('Viggo', 'Mortensen', 40),
('Elijah', 'Wood', 41),
('Viggo', 'Mortensen', 41),
('Keanu', 'Reeves', 42),
('Laurence', 'Fishburne', 42),
('Tom', 'Hanks', 43),
('Robin', 'Wright', 43),
('Elijah', 'Wood', 44),
('Viggo', 'Mortensen', 44);
INSERT INTO cinema (cinema_id, name, location, city, address, theaters) VALUES 
(1, 'Cinema 1', 'Downtown', 'City A', '123 Main St', 'Theater 1, Theater 2'),
(2, 'Cinema 2', 'Uptown', 'City B', '456 Elm St', 'Theater 3, Theater 4'),
(3, 'Cinema 3', 'Midtown', 'City C', '789 Oak St', 'Theater 5, Theater 6'),
(4, 'Cinema 4', 'Suburb', 'City D', '101 Pine St', 'Theater 7, Theater 8'),
(5, 'Cinema 5', 'Downtown', 'City E', '112 Maple St', 'Theater 9, Theater 10'),
(6, 'Cinema 6', 'Uptown', 'City F', '131 Cedar St', 'Theater 11, Theater 12'),
(7, 'Cinema 7', 'Midtown', 'City G', '141 Walnut St', 'Theater 13, Theater 14'),
(8, 'Cinema 8', 'Suburb', 'City H', '151 Birch St', 'Theater 15, Theater 16');
INSERT INTO user (user_id, name, surname, password, movies_watched, birth_date, tickets, email) VALUES 
(1, 'John', 'Doe', 'password_hash_1', 'Titanic', '1990-01-01', '1', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'password_hash_2', 'Mr. & Mrs. Smith', '1985-05-15', '2', 'jane.smith@example.com');

INSERT INTO wallet (wallet_id, tickets, balance, coupons, credit_cards, user_id) VALUES 
('1', '1', '100', 'Coupon 1', '', 1),
('3', '1', '300', 'Coupon 1', '', 5),
('2', '2', '200', 'Coupon 2', '', 2);

INSERT INTO credit_card (card_number, cvv, expiration_year, expiration_month, wallet_id) VALUES 
('1111222233334444', 123, 2025, 'Jan', '1'),
('5555666677778888', 456, 2026, 'Feb', '2');
INSERT INTO filter (f_city, f_cinema, f_day, f_rating, f_is_released, f_genre, cinema_id, user_id) VALUES 
('City A', 'Cinema 1', 'Friday', 'PG-13', 1, 'Drama', 1, 1),
('City B', 'Cinema 2', 'Saturday', 'R', 1, 'Action', 2, 2);
INSERT INTO rates (r_comment, r_star, r_date, movie_id, user_id) VALUES 
('Great movie!', 5, '2023-07-01', 1, 1),
('Not bad', 3, '2023-07-02', 2, 2),
('Awesome!', 5, '2023-07-03', 3, 1),
('Good', 4, '2023-07-04', 4, 2);
INSERT INTO theatre (theatre_id, num_of_seats, seats, cinema_id) VALUES 
(1, 100, 'A1-A100', 1),
(2, 150, 'B1-B150', 2),
(3, 200, 'C1-C200', 3),
(4, 250, 'D1-D250', 4),
(5, 300, 'E1-E300', 5),
(6, 350, 'F1-F350', 6),
(7, 400, 'G1-G400', 7),
(8, 450, 'H1-H450', 8);

INSERT INTO seat (seat_id, is_empty, theater_id, cinema_id) VALUES 
(1, 1, 1, 1),
(2, 0, 1, 1),
(3, 1, 2, 2),
(4, 0, 2, 2),
(5, 1, 3, 3),
(6, 0, 3, 3),
(7, 1, 4, 4),
(8, 0, 4, 4),
(9, 1, 5, 5),
(10, 0, 5, 5),
(11, 1, 6, 6),
(12, 0, 6, 6),
(13, 1, 7, 7),
(14, 0, 7, 7),
(15, 1, 8, 8),
(16, 0, 8, 8);
INSERT INTO ticket (ticket_id, day, showtime, cinema_id, theater_id, seat_id, movie_id, user_id) VALUES 
(1, 'Friday', '7:00 PM', 1, 1, 1, 1, 1),
(2, 'Saturday', '8:00 PM', 2, 2, 3, 2, 2);

INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                45,
                7.8,
                '100 min',
                'Animation, Action, Adventure',
                'The Lego Movie',
                '7.7',
                'An ordinary LEGO construction worker, thought to be the prophesied as "special", is recruited to join a quest to stop an evil tyrant from gluing the LEGO universe into eternal stasis.',
                '09:06',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg4MDk1ODExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                46,
                7.2,
                '87 min',
                'Animation, Adventure, Comedy',
                'The Simpsons Movie',
                '7.3',
                'After Homer pollutes the town''s water supply, Springfield is encased in a gigantic dome by the EPA and the Simpsons are declared fugitives.',
                '00:38',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2I0MmE5N2ItMWJkOS00NTU4LTg4ZDctMGJiNDdkM2E4MDU3XkEyXkFqcGdeQXVyMTU2OTg4NjIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                47,
                7.3,
                '122 min',
                'Action, Crime, Drama',
                'El Camino: A Breaking Bad Movie',
                '7.3',
                'Fugitive Jesse Pinkman runs from his captors, the law, and his past.',
                '13:56',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjk4MzVlM2UtZGM0ZC00M2M1LThkMWEtZjUyN2U2ZTc0NmM5XkEyXkFqcGdeQXVyOTAzMTc2MjA@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                48,
                6.1,
                '88 min',
                'Comedy',
                'Scary Movie',
                '6.3',
                'A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer.',
                '21:02',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGEzZjdjMGQtZmYzZC00N2I4LThiY2QtNWY5ZmQ3M2ExZmM4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                49,
                7.2,
                '92 min',
                'Animation, Adventure, Comedy',
                'The Super Mario Bros. Movie',
                '7.0',
                'A plumber named Mario travels through an underground labyrinth with his brother Luigi, trying to save a captured princess.',
                '00:29',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTJhNzlmNzctNTU5Yy00N2YwLThhMjQtZDM0YjEzN2Y0ZjNhXkEyXkFqcGdeQXVyMTEwMTQ4MzU5._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                50,
                6.0,
                '91 min',
                'Animation, Adventure, Comedy',
                'Bee Movie',
                '6.1',
                'Barry B. Benson, a bee just graduated from college, is disillusioned at his lone career choice: making honey. On a special trip outside the hive, Barry''s life is saved by Vanessa, a florist in New York City. As their relationship ...',
                '15:02',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjE1MDYxOTA4MF5BMl5BanBnXkFtZTcwMDE0MDUzMw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                51,
                5.4,
                '83 min',
                'Comedy, Horror',
                'Scary Movie 2',
                '5.3',
                'Four teens are tricked by a professor into visiting a haunted house for a school project.',
                '01:45',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzQxYjU1OTUtYjRiOC00NDg2LWI4MWUtZGU5YzdkYTcwNTBlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                52,
                7.1,
                '104 min',
                'Animation, Action, Adventure',
                'The Lego Batman Movie',
                '7.3',
                'A cooler-than-ever Bruce Wayne must deal with the usual suspects as they plan to rule Gotham City, while discovering that he has accidentally adopted a teenage orphan who wishes to become his sidekick.',
                '19:55',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                53,
                5.4,
                '84 min',
                'Comedy',
                'Scary Movie 3',
                '5.5',
                'Cindy must investigate mysterious crop circles and video tapes, and help the President in preventing an alien invasion.',
                '05:04',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDE2NTIyMjg2OF5BMl5BanBnXkFtZTYwNDEyMTg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                54,
                5.2,
                '83 min',
                'Comedy',
                'Scary Movie 4',
                '5.1',
                'Cindy finds out the house she lives in is haunted by a little boy and goes on a quest to find out who killed him and why. Also, Alien "Tr-iPods" are invading the world and she has to uncover the secret in order to stop them.',
                '22:40',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZmFkMzc2NTctN2U1Ni00MzE5LWJmMzMtYWQ4NjQyY2MzYmM1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                55,
                5.7,
                '89 min',
                'Comedy',
                'Not Another Teen Movie',
                '5.8',
                'A sendup of all the teen movies that have accumulated in the past two decades.',
                '17:17',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNGM1NDA5MDktMWFjZi00MmNkLWJmYTEtMTgwMWFmZTJjMzA4XkEyXkFqcGdeQXVyMTUyOTc1NDYz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                56,
                4.2,
                '94 min',
                'Comedy',
                'Movie 43',
                '4.4',
                'A series of interconnected short films follows a washed-up producer as he pitches insane story lines featuring some of the biggest stars in Hollywood.',
                '01:56',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg4NzQ3NDM1Nl5BMl5BanBnXkFtZTcwNjEzMjM3OA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                57,
                2.4,
                '86 min',
                'Adventure, Comedy, Fantasy',
                'Epic Movie',
                '2.4',
                'A spoof on previous years'' epic movies (The Da Vinci Code (2006), The Chronicles of Narnia: The Lion, the Witch and the Wardrobe (2005) + 20 more), TV series, music videos and celebs. 4 orphans are on an epic adventure.',
                '22:30',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTA3NDM5ODU3NzleQTJeQWpwZ15BbWU3MDgyMjgyNDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                58,
                6.2,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie',
                '6.3',
                'When an island populated by happy, flightless birds is visited by mysterious green pigs, it''s up to three unlikely outcasts to figure out what the pigs are up to.',
                '15:52',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                59,
                7.9,
                '130 min',
                'Animation, Drama',
                'A Silent Voice: The Movie',
                '8.1',
                'A young man is ostracized by his classmates after he bullies a deaf girl to the point where she moves away. Years later, he sets off on a path for redemption.',
                '23:09',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGRkOGMxYTUtZTBhYS00NzI3LWEzMDQtOWRhMmNjNjJjMzM4XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                60,
                7.1,
                '87 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob SquarePants Movie',
                '7.2',
                'SpongeBob takes leave from Bikini Bottom in order to track down, with Patrick, King Neptune''s stolen crown.',
                '01:41',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjM5YjI0NmQtOTk4OS00NTNiLThkNzQtNTZlNGE4Y2VmNmU3XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                61,
                6.7,
                '85 min',
                'Documentary, Action, Comedy',
                'Jackass: The Movie',
                '6.6',
                'Johnny Knoxville and his band of maniacs perform a variety of stunts and gross-out gags on the big screen for the first time.',
                '05:12',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTgwMmU0YzktOGNhNi00MDcyLTg1OGEtZGQwM2RlMTAyYzhlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                62,
                2.0,
                '87 min',
                'Comedy, Sci-Fi',
                'Disaster Movie',
                '1.9',
                'Over the course of one evening, an unsuspecting group of twenty-somethings find themselves bombarded by a series of natural disasters and catastrophic events.',
                '17:07',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTIzMDQyNDgwNl5BMl5BanBnXkFtZTcwMDA0MTc3MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                63,
                5.2,
                '80 min',
                'Adventure, Comedy, Family',
                'Garfield: The Movie',
                '5.0',
                'Jon Arbuckle buys a second pet, a dog named Odie. However, Odie is then abducted and it is up to Jon''s cat, Garfield, to find and rescue the canine.',
                '12:06',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTIzMTc1OTUxOV5BMl5BanBnXkFtZTYwNTMxODc3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                64,
                3.5,
                '86 min',
                'Comedy',
                'Scary Movie V',
                '3.5',
                'A couple begin to experience some unusual activity after bringing their lost nieces and nephew home. With the help of home-surveillance cameras, they learn they''re being stalked by a nefarious demon.',
                '16:59',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc5OTIxMjQ4NF5BMl5BanBnXkFtZTcwOTAyNDcyOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                65,
                6.4,
                '107 min',
                'Animation, Action, Adventure',
                'The Lego Movie 2: The Second Part',
                '6.5',
                'It''s been five years since everything was awesome and the citizens are facing the huge new threat of Lego Duplo, invaders from outer space, wrecking everything faster than they can rebuild.',
                '18:58',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkyOTkwNDc1N15BMl5BanBnXkFtZTgwNzkyMzk3NjM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                66,
                4.5,
                '75 min',
                'Action, Comedy, Sci-Fi',
                'Superhero Movie',
                '4.7',
                'Orphaned high school student Rick Riker is bitten by a radioactive dragonfly, develops super powers (except for the ability to fly), and becomes a hero.',
                '01:44',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc0Njc1MTU5Nl5BMl5BanBnXkFtZTcwMjA4NDE2MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                67,
                8.4,
                '117 min',
                'Animation, Action, Adventure',
                'Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train',
                '8.2',
                'After his family was brutally murdered and his sister turned into a demon, Tanjiro Kamado''s journey as a demon slayer began. Tanjiro and his comrades embark on a new mission aboard the Mugen Train, on track to despair.',
                '07:04',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODI2NjdlYWItMTE1ZC00YzI2LTlhZGQtNzE3NzA4MWM0ODYzXkEyXkFqcGdeQXVyNjU1OTg4OTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                68,
                3.4,
                '86 min',
                'Animation, Adventure, Comedy',
                'The Emoji Movie',
                '3.4',
                'Gene, a multi-expressional emoji, sets out on a journey to become a normal emoji.',
                '10:57',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkzMzM3OTM2Ml5BMl5BanBnXkFtZTgwMDM0NDU3MjI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                69,
                6.9,
                '78 min',
                'Animation, Adventure, Comedy',
                'A Goofy Movie',
                '6.9',
                'When Max makes a preposterous promise to a girl he has a crush on, his chances to fulfilling it seem hopeless when he is dragged onto a cross-country trip with his embarrassing father, Goofy.',
                '15:04',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDczYjU4MDMtY2RjMy00Y2UyLWE2MmMtZjliYWUwNzQ3YjExXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                70,
                2.9,
                '83 min',
                'Comedy, Romance',
                'Date Movie',
                '2.8',
                'Spoof of romantic comedies which focuses on a man, his crush, his parents, and her father.',
                '03:45',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjA0NGUyMDQtY2RlNy00Y2YzLWIyODItNWE1ZTM1NTM3MWM1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                71,
                6.1,
                '92 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge Out of Water',
                '6.0',
                'When a diabolical pirate above the sea steals the secret Krabby Patty formula, SpongeBob and his friends team up in order to get it back.',
                '21:09',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGEzNGRjYzYtNmRjNy00ZTI0LTgwOTYtOTViMGM0MWUwMzQ5XkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                72,
                7.7,
                '115 min',
                'Animation, Action, Crime',
                'Cowboy Bebop: The Movie',
                '7.8',
                'A terrorist explosion releases a deadly virus on the masses, and it''s up to the bounty-hunting Bebop crew to catch the cold-blooded culprit.',
                '21:47',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTE5YTAyZDctNjFhYi00YmJhLTg4ZGUtNDk1OTE0ZTY4NTYwL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                73,
                7.1,
                '88 min',
                'Animation, Adventure, Comedy',
                'The Peanuts Movie',
                '7.0',
                'Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their archnemesis, while his best pal Charlie Brown begins his own epic quest back home to win the love of his life.',
                '01:23',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTE5NzMxNzkwNl5BMl5BanBnXkFtZTgwOTQ0Nzk5NzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                74,
                6.5,
                '96 min',
                'Animation, Action, Adventure',
                'Pokémon: The First Movie - Mewtwo Strikes Back',
                '6.3',
                'Scientists genetically create a new Pokémon, Mewtwo, but the results are horrific and disastrous.',
                '03:31',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGM3MjQ3NTQtNzRiZi00MDUzLWFjYjEtZWJjMjUwYzExYjRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                75,
                4.5,
                '102 min',
                'Comedy, Drama, Family',
                'Hannah Montana: The Movie',
                '4.7',
                'As Hannah Montana''s popularity begins to take over her life, Miley Stewart, on the urging from her father takes a trip to her hometown of Crowley Corners, Tennessee to get some perspective on what matters in life the most.',
                '06:43',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkxNjUxODY3NF5BMl5BanBnXkFtZTcwMjQyMzMzMg@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                76,
                7.4,
                '85 min',
                'Animation, Adventure, Comedy',
                'Shaun the Sheep Movie',
                '7.3',
                'When Shaun decides to take the day off and have some fun, he gets a little more action than he bargained for. A mix up with the Farmer, a caravan and a very steep hill lead them all to the Big City and it''s up to Shaun and the flo...',
                '07:08',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTc1ODY5MTQ1Nl5BMl5BanBnXkFtZTgwMDM5ODI1NjE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                77,
                5.3,
                '94 min',
                'Adventure, Comedy, Family',
                'The Lizzie McGuire Movie',
                '5.5',
                'Lizzie McGuire has graduated from middle school and takes a trip to Rome, Italy with her class. And what was supposed to be only a normal trip, becomes a teenager''s dream come true.',
                '22:57',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjg4Y2IxZmEtNmIwNy00ODBlLWFkOWEtNGE1MjdmZmMxMzJjXkEyXkFqcGdeQXVyNzI2ODAwMzM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                78,
                7.3,
                '84 min',
                'Animation, Action, Adventure',
                'The Transformers: The Movie',
                '7.2',
                'The Autobots must stop a colossal planet consuming robot who goes after the Autobot Matrix of Leadership. At the same time, they must defend themselves against an all-out attack from the Decepticons.',
                '00:32',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGM1MGY4OTYtOGZkOC00NjYyLTk3OTMtODUyZDdhYWQ3NGFjXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                79,
                6.3,
                '101 min',
                'Horror, Sci-Fi',
                'Twilight Zone: The Movie',
                '6.4',
                'Four horror and science fiction segments, directed by four famous directors, each of them being a new version of a classic story from Rod Serling''s landmark television series.',
                '21:56',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjQ2NzgzYjEtMzAxNy00MzhkLWE5ZTUtZDA1ODY3MTBjOTRiXkEyXkFqcGdeQXVyNTAyNDQ2NjI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                80,
                7.6,
                '95 min',
                'Adventure, Comedy, Family',
                'The Muppet Movie',
                '7.6',
                'Kermit and his newfound friends trek across America to find success in Hollywood, but a frog legs merchant is after Kermit.',
                '18:22',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDhhMzMyNGQtYzVhYS00Mjg0LTgyZDEtZDJlZGFkZjViMDYxXkEyXkFqcGc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                81,
                6.2,
                '82 min',
                'Comedy',
                'Between Two Ferns: The Movie',
                '6.1',
                'Zach Galifianakis and his oddball crew take a road trip to complete a series of high-profile celebrity interviews.',
                '12:43',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzgyNzUyZjAtNDRiZS00MjQwLTgzMzQtZThhY2Y3YjFmYTc1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                82,
                6.6,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie 2',
                '6.4',
                'The flightless birds and scheming green pigs take their feud to the next level.',
                '10:52',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzdkNGJhNzQtMjY1OC00MDI3LTk0ZDUtNzU0MGZiY2YwZGUxXkEyXkFqcGdeQXVyNzMxNjQxMTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                83,
                6.6,
                '105 min',
                'Action, Adventure, Comedy',
                'Batman: The Movie',
                '6.5',
                'The Dynamic Duo faces four supervillains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people.',
                '13:54',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZTAxNWNmMTEtNGNmNi00MWU4LWI0NmItMjM3Y2Q3YTUyZTg2XkEyXkFqcGdeQXVyNjc5NjEzNA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                84,
                6.4,
                '89 min',
                'Animation, Action, Adventure',
                'Captain Underpants: The First Epic Movie',
                '6.2',
                'Two overly imaginative pranksters named George and Harold hypnotize their grumpy principal into thinking he''s a ridiculously enthusiastic, incredibly dimwitted superhero named Captain Underpants.',
                '23:03',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMmQwMzdiOGMtNGZiYS00YjgyLWJlMjItYzQ3Nzc2OGIwYjQwXkEyXkFqcGdeQXVyMzQ1MTM3NjY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                85,
                6.2,
                '101 min',
                'Animation, Action, Adventure',
                'The Lego Ninjago Movie',
                '6.0',
                'Shunned by everyone for being the son of an evil warlord, a teenager seeks to defeat him with the help of his fellow ninjas.',
                '06:14',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDI3MDljMTQtYzBiYS00NDk2LTlhYzUtYmM0NWIyMmZkMDZkXkEyXkFqcGdeQXVyNjk5NDA3OTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                86,
                6.7,
                '74 min',
                'Animation, Adventure, Comedy',
                'DuckTales the Movie: Treasure of the Lost Lamp',
                '6.8',
                'Scrooge McDuck takes Huey, Dewey, and Louie to Egypt to find a pyramid and magic lamp.',
                '13:35',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGY1NjdiMmItMmE5MS00NjllLWJmM2ItMmU1ZTRjMWYyZjc4XkEyXkFqcGdeQXVyMjA0MDQ0Mjc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                87,
                8.3,
                '68 min',
                'Documentary',
                'Man with a Movie Camera',
                '8.3',
                'A man travels around a city with a camera slung over his shoulder, documenting urban life with dazzling invention.',
                '16:40',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYTc3NGVlN2QtYWJlZi00YjhjLThiZjctZDA1MmE1NGI4ZmE4XkEyXkFqcGdeQXVyODQyNDU4OTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                88,
                7.4,
                '110 min',
                'Drama, Western',
                'Deadwood: The Movie',
                '7.3',
                'As the residents of Deadwood gather to commemorate Dakota''s statehood in 1889, saloon owner Al Swearengen and Marshal Seth Bullock clash with Senator George Hearst.',
                '17:34',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2Y1OGQ4ZjEtZWUzMi00MzZmLTk3MmEtMThiNjIwNzg4MjRkXkEyXkFqcGdeQXVyMTE5NDkxMA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                89,
                6.3,
                '90 min',
                'Comedy',
                'The Brady Bunch Movie',
                '6.2',
                'The original 1970s TV family is now placed in the 1990s, where they''re even more square and out of place than ever.',
                '04:55',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNmVmYzkzY2YtZWNkNC00YzVhLTk4MzYtZWMxZWQ0YzBhZmYzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                90,
                6.0,
                '99 min',
                'Animation, Action, Adventure',
                'Pokémon the Movie 2000',
                '6.1',
                'Ash Ketchum must gather the three spheres of fire, ice and lightning in order to restore balance to the Orange Islands.',
                '18:01',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzE1NjBiODAtNDVhNS00ZTI1LTg4ZjUtZTk3OWVhODljMjNjXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                91,
                5.9,
                '91 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge on the Run',
                '5.9',
                'After SpongeBob''s beloved pet snail Gary is snail-napped, he and Patrick embark on an epic adventure to the Lost City of Atlantic City to bring Gary home.',
                '20:02',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDMzYzM3MGMtZWFlZC00ODI5LTg5YjgtODI2NzI3ZTZmMGQ4XkEyXkFqcGdeQXVyMTA1NjE5MTAz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                92,
                6.8,
                '102 min',
                'Animation, Adventure, Comedy',
                'The Bob''s Burgers Movie',
                '7.0',
                'When a sinkhole in front of Bob''s Burgers threatens the Belchers'' plans for a successful summer, Bob and Linda try to keep their business going, while the kids attempt to save the restaurant by solving a mystery.',
                '03:03',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzFhNDNkY2UtYjc3ZS00NzVkLTlhNzEtYmZiZGMzYmRjMjVhXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                93,
                7.6,
                '103 min',
                'Documentary, Drama',
                'Indie Game: The Movie',
                '7.6',
                'A documentary that follows the journeys of indie game developers as they create games and release those works, and themselves, to the world.',
                '03:35',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjA5NTUzMjQ1MV5BMl5BanBnXkFtZTcwMzc1MzQ4Nw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                94,
                6.2,
                '94 min',
                'Action, Adventure, Comedy',
                'Wizards of Waverly Place: The Movie',
                '6.2',
                'A young wizard conjures a spell that puts her family in jeopardy.',
                '05:52',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDM0MTRjZjUtZjM2Ni00MzgzLTgxYmYtMGZiNDJmMzdhYTlhXkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                95,
                6.0,
                '79 min',
                'Animation, Adventure, Comedy',
                'The Rugrats Movie',
                '5.9',
                'The babies gets lost in the forest after Tommy Pickles gets a new baby brother.',
                '10:34',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjNiMWE1M2ItMTdlNi00NmZiLWEwYzctODJiMjU1MmY0MTlmL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                96,
                6.1,
                '77 min',
                'Animation, Adventure, Comedy',
                'The Tigger Movie',
                '6.3',
                'Tigger goes looking through the hundred-acre-wood to find his family.',
                '01:13',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTE5NDIyODU4M15BMl5BanBnXkFtZTYwODA5MzY2._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                97,
                6.6,
                '83 min',
                'Comedy',
                'The Kentucky Fried Movie',
                '6.4',
                'The daily programming of a fictional local TV channel presented as a series of highly irreverent skits.',
                '23:10',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGRjZTJiMjYtNjkyZS00NTgwLWI3ODAtMDRlODdkMjQ2YjY3XkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                98,
                6.2,
                '93 min',
                'Comedy, Fantasy, Horror',
                'Tales from the Darkside: The Movie',
                '6.2',
                'To stall a witch plotting to eat him, a boy reads her horror tales dealing with a collegian''s resurrection of a mummy, a murderous cat, and an artist''s pact with a gargoyle.',
                '07:04',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODI4ZTI1ZjMtYmE5MC00NTM5LTgwMDgtNWI1ZTI1MDYyOGYyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                99,
                7.8,
                '107 min',
                'Documentary, Comedy',
                'American Movie',
                '7.8',
                'Documentary about an aspiring filmmaker''s attempts to finance his dream project by finally completing the low-budget horror film he abandoned years before.',
                '02:51',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjMxMDFhYzQtZDZmZS00ZDBjLWIzY2QtNDBiMDQ5YjBlNTk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                100,
                7.2,
                '73 min',
                'Comedy, Drama, Fantasy',
                'Mystery Science Theater 3000: The Movie',
                '7.2',
                'Mike Nelson and his robot companions watch and give their comments about This Island Earth (1955).',
                '10:46',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzNmN2UzNTAtNmZkMS00MmI3LThhNzEtNjI1YjJlN2JiZjU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                101,
                6.7,
                '87 min',
                'Comedy',
                'Silent Movie',
                '6.7',
                'A film director and his strange friends struggle to produce the first major silent feature film in forty years.',
                '00:04',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZWFkMmJhODItMDA2MC00NDFmLTllNzItYzE1YWMzYjVmYjFiXkEyXkFqcGdeQXVyNjQzNDI3NzY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                102,
                7.6,
                '112 min',
                'Animation, Action, Adventure',
                'The Last: Naruto the Movie',
                '7.6',
                'Hinata Hyuga''s younger sister has been kidnapped, so Naruto must do what he can to save her.',
                '06:33',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjk1NzA4Njg4Ml5BMl5BanBnXkFtZTgwMDgxODQ5MzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                103,
                6.0,
                '86 min',
                'Comedy',
                'The Onion Movie',
                '6.2',
                'Satirical interpretations of world events and curious human behavior.',
                '06:13',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDdkMDUxMmUtNWQ1Yi00OWY3LWI2ZDktOTBmNzVkMTAwODM5XkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                104,
                6.7,
                '86 min',
                'Animation, Adventure, Comedy',
                'A Shaun the Sheep Movie: Farmageddon',
                '6.8',
                'When an alien with amazing powers crash-lands near Mossy Bottom Farm, Shaun the Sheep goes on a mission to shepherd the intergalactic visitor home before a sinister organization can capture her.',
                '05:13',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2MyNjhmYzMtNDYxYi00MjBkLWI0NDYtNDFhOWY3MTY2YmIyXkEyXkFqcGdeQXVyNjU1NDM1MjQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                105,
                8.0,
                '95 min',
                'Documentary, Biography',
                'Still: A Michael J. Fox Movie',
                '8.1',
                'Follows the life of beloved actor and advocate Michael J. Fox, exploring his personal and professional triumphs and travails, and what happens when an incurable optimist confronts an incurable disease.',
                '11:13',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNGFmYmUyMDUtNjk1MS00ZDMzLWEyMmUtM2I4YzhhZjRiYjk2XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                106,
                5.9,
                '93 min',
                'Animation, Action, Adventure',
                'Pokémon 3 the Movie: Spell of the Unown',
                '5.8',
                'In the town of Greenfield, a young, lonely girl''s dreams and wishes are brought into reality by a collective of reality-warping Pokémon.',
                '17:53',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTk0NzM3MDY1OV5BMl5BanBnXkFtZTYwNTkwODc5._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                107,
                6.8,
                '90 min',
                'Documentary, Comedy',
                'The Greatest Movie Ever Sold',
                '6.6',
                'A documentary about branding, advertising and product placement that is financed and made possible by brands, advertising and product placement.',
                '02:13',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTM5NzQxOTQwNV5BMl5BanBnXkFtZTcwNDAwODM2NA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                108,
                5.8,
                '99 min',
                'Comedy, Crime',
                'Cheech and Chong''s Next Movie',
                '6.0',
                'Cheech and Chong live in a decrepit old house and drive their neighbour crazy with their loud music, weed smoking and general anarchy and slacker view on life. Then Chong meets Cheech''s Texan cousin Red and things kick up a notch.',
                '12:06',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDc5ZWE2ZTMtMzFhNy00NDEyLWEyYjEtNmEyZDUzYmY3OWIyXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                109,
                5.7,
                '141 min',
                'Action, Drama, Fantasy',
                'Teen Wolf: The Movie',
                '5.5',
                'A terrifying evil has emerged. The wolves howl once again, but only a Werewolf like Scott McCall, can gather both new allies and reunite trusted friends to fight back against what could be the most powerful and deadliest enemy.',
                '18:31',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYWYyZWU5NzctYjY4Zi00MzYyLTgxZTMtZjBmYWE2NGMwYTllXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                110,
                6.8,
                '86 min',
                'Animation, Action, Adventure',
                'Aqua Teen Hunger Force Colon Movie Film for Theaters',
                '6.7',
                'An action epic that explores the origins of Master Shake, Frylock, and Meatwad, better known as the Aqua Teen Hunger Force, who somehow become pitted in a battle over an immortal piece of exercise equipment.',
                '07:34',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc0OTQwNzYyNF5BMl5BanBnXkFtZTcwMDc5NTM0MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                111,
                5.9,
                '110 min',
                'Comedy, Family, Fantasy',
                'Teen Beach Movie',
                '5.9',
                'Two surfing lovers, whose doomed relationship is nearing to a close, find themselves swept into a dimension-traversing wave that sends them into a beach movie musical in the 60''s.',
                '00:17',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDFjYjdlODItN2MzMC00YzgxLWJiMDktOTI3MGQyOGY2YmQxXkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                112,
                7.6,
                '78 min',
                'Animation, Action, Adventure',
                'Phineas and Ferb the Movie: Across the 2nd Dimension',
                '7.4',
                'Phineas and Ferb discover that Perry is a secret agent, and they all get stuck in an alternate dimension where Doofenschmirtz is the ruler of the tri-state area.',
                '12:42',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2M4YTE0YWYtNDIxZC00MmQyLThhYjgtYTNjMTJhZjU2NzM0XkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                113,
                6.9,
                '95 min',
                'Comedy, Crime',
                'Trailer Park Boys: The Movie',
                '7.1',
                'Ricky, Julian, and Bubbles come up with a scheme to steal large amounts of untraceable coins.',
                '05:06',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTY5Mzg4MDM1M15BMl5BanBnXkFtZTcwNTk4MzkzMQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                114,
                6.5,
                '99 min',
                'Documentary',
                'My Scientology Movie',
                '6.6',
                'Louis Theroux documents his investigation into what goes on behind the scenes of the infamous Church of Scientology.',
                '16:14',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTQ5NTI2NDc3NF5BMl5BanBnXkFtZTgwNDA3ODk2MTI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                115,
                5.6,
                '91 min',
                'Comedy, Crime',
                'Absolutely Fabulous: The Movie',
                '5.4',
                'After attracting both media and police attention for accidentally knocking Kate Moss into the River Thames, Edina and Patsy hide out in the south of France.',
                '13:53',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjI4NDI5MDg2OV5BMl5BanBnXkFtZTgwNzA5ODQ3ODE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                116,
                7.5,
                '88 min',
                'Comedy, Crime, Mystery',
                'Psych: The Movie',
                '7.3',
                'The old gang comes together during the holidays after a mystery assailant targets one of their own.',
                '08:10',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjE2Mzk5NGItMTEzMi00MmYxLWFlNjEtNGFmZGViNzQ2ZWFkXkEyXkFqcGdeQXVyMjM5NzU3OTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                117,
                7.9,
                '95 min',
                'Animation, Action, Adventure',
                'Boruto: Naruto the Movie',
                '7.8',
                'It''s been some years since the end of the Shinobi War. Naruto Uzumaki is the 7th Hokage of Konohagakure, in this new era. His son, Boruto Uzumaki, will soon enter the Chûnin exams, alongside Sarada Uchiha and the mysterious Mitsuki.',
                '17:06',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDIwYjg5YzItZTJmMC00YjJhLWFiNjYtMDU5MmQxOTQxODM2XkEyXkFqcGdeQXVyMjc2Nzg5OTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                118,
                7.5,
                '105 min',
                'Animation, Action, Adventure',
                'Fullmetal Alchemist the Movie: Conqueror of Shamballa',
                '7.3',
                'Edward Elric, an alchemist from an alternate world, races to prevent the Thule Society from harnessing alchemy to wage war on his home.',
                '05:20',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOWZmYWRmYTUtMDFhMS00OTJiLTkwYTgtY2VkNjgxMmI3YzJkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                119,
                5.5,
                '84 min',
                'Animation, Adventure, Comedy',
                'Tom and Jerry: The Movie',
                '5.4',
                'Cat and mouse duo Tom and Jerry reluctantly work together to save a young girl from her evil aunt.',
                '07:25',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzkwYjU2NDctODBhYS00ZjUwLThlODktOGQ5MzExOTM5ZTVhXkEyXkFqcGdeQXVyMTA1NjE5MTAz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                120,
                6.6,
                '72 min',
                'Animation, Action, Adventure, Sci-Fi',
                'Ultimate Avengers: The Movie',
                '6.7',
                'To confront an alien menace, General Fury assembles a team of superheroes lead by a recently resuscitated Captain America.',
                '07:01',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTYyMjk0NTMwMl5BMl5BanBnXkFtZTgwNzY0NjAwNzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                121,
                3.5,
                '86 min',
                'Comedy',
                'Extreme Movie',
                '3.7',
                'A sketch-comedy movie about the joys and embarrassments of teen sex. But mostly the embarrassments.',
                '09:40',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDAzNzQ4MDEtOGViNi00YjliLTlkMmItNjc0YWRhZGJhMDJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                122,
                6.4,
                '73 min',
                'Animation, Action, Adventure',
                'The Powerpuff Girls Movie',
                '6.5',
                'After destroying the city of Townsville in a game of tag, a trio of super-powered little girls must redeem themselves by stopping a vengeful monkey''s plot for world domination.',
                '08:09',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDE2ZWIyZmItYjNlZC00NmQ4LWIyMjQtMDJiM2JmYWMyOWQzXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                123,
                5.4,
                '93 min',
                'Comedy',
                'Tim and Eric''s Billion Dollar Movie',
                '5.3',
                'Two guys get a billion dollars to make a movie, only to watch their dream run off course. In order to make the money back, they then attempt to revitalize a failing shopping mall.',
                '10:05',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTU0NTQ5NDYwMV5BMl5BanBnXkFtZTcwNjUzNzUxNw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                124,
                6.2,
                '79 min',
                'Animation, Comedy, Family, Sport',
                'An Extremely Goofy Movie',
                '6.4',
                'Max goes to college, but to his embarassment his father loses his job and goes to his son''s campus.',
                '15:30',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTJkNmQ1ODItNTJhOS00NWRhLTg0NjAtYjZlNWYxZWJmNTY4XkEyXkFqcGdeQXVyOTg4MDk3MTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                125,
                6.3,
                '89 min',
                'Adventure, Drama, Sci-Fi',
                'Doctor Who: The Movie',
                '6.3',
                'The newly-regenerated Doctor takes on the Master on the turn of the millennium, 31 December 1999.',
                '17:11',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDFiMGU1MmQtMTg0Ny00ZmQ4LTkyMWMtYjVlZGRmMWY5ZDliXkEyXkFqcGdeQXVyMTA0MTI2ODE4._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                126,
                8.4,
                '140 min',
                'Animation, Drama, Fantasy',
                'Violet Evergarden: The Movie',
                '8.3',
                'After the aftermath of a war, a young girl who was used as a ''tool'' for war learned to live. With the scars of burns, she goes back to her past to feel the true feelings of the Major''s, "I love you."',
                '03:38',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYTJmNzc5YTEtNTBmNy00YmUxLWFlNzktYjZjMTg3OGY3ZDhkXkEyXkFqcGdeQXVyMzUzMzgxNA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                127,
                4.2,
                '96 min',
                'Action, Drama, Fantasy',
                'Left Behind: The Movie',
                '4.3',
                'The Biblical prophecy of Armegeddon begins when the Rapture instantly takes all believers in Christ from the Earth. A reporter left behind learns that the Anti-Christ will soon take power.',
                '20:48',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGU3MmMxOWYtZmNhNi00ZjczLWJkYmEtMjJjZjBiZDRiYmZmXkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                128,
                2.7,
                '77 min',
                'Comedy',
                'It''s Pat: The Movie',
                '2.8',
                'The comedic misadventures of a person of indeterminate gender.',
                '12:41',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2VhMjI0NDQtZWRjMS00ZWY4LTk2MmItZTY4MzE4M2ZmOTQ3L2ltYWdlXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                129,
                9.8,
                '25 min',
                'Action, Comedy',
                'Threat Level Midnight: The Movie',
                '9.6',
                'After secret agent Michael Scarn (Steve Carell) is forced into retirement after the death of his wife Catherine Zeta-Scarn, the President of the United States of America (Craig Robinson) requests that he prevents Goldenface (John ...',
                '22:20',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjMzNzE4ZGItMDI5Zi00ZjE3LThkODctYTlhZWY1ZTdmMGNjXkEyXkFqcGdeQXVyOTExNzM4NDM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                130,
                9.5,
                '164 min',
                'Comedy',
                'Uno: The Movie',
                '9.5',
                'What had started as a simple game of UNO! turned into a psychological horror. Coworkers are driven to the edge of madness as they commit to a game of Uno.',
                '21:09',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2YyNmMzZmQtYjg1MS00OTEwLTkwZDEtOWNlMTEzOWIzMWM3L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzQwNDg4MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                131,
                3.5,
                '99 min',
                'Action, Adventure, Family',
                'Turbo: A Power Rangers Movie',
                '3.6',
                'A space alien is threatening to bring destruction on Earth, and the Power Rangers are enhanced with turbo powers in order to prevent her plan.',
                '09:48',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzAxMDA0MGUtMWJjYy00YWNlLTk1NmEtNTM5Y2FjYjMzNjM5XkEyXkFqcGdeQXVyNDAxNjkxNjQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                132,
                7.0,
                '102 min',
                'Animation, Action, Adventure',
                'Street Fighter II: The Animated Movie',
                '7.2',
                'A crime boss searching for the world''s best fighters pursues a talented Japanese drifter and his American ex-classmate, while an Interpol agent and a US Army captain seek to bring him down.',
                '23:38',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzY4OWMzZDUtNDE4Ny00MzJhLWFhN2YtNTA1Mjc1MWE4MTE4XkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                133,
                7.6,
                '64 min',
                'Animation, Action, Adventure',
                'The Batman Superman Movie: World''s Finest',
                '7.7',
                'Joker goes to Metropolis with an offer and plan to kill Superman for Lex Luthor while Batman pursues the clown to Superman''s turf.',
                '06:14',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZTQ3YWJhODMtYTdmNC00MmZiLThhOWYtM2UxZDBjNjRlY2EwXkEyXkFqcGdeQXVyMjI4OTg3MTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                134,
                6.0,
                '101 min',
                'Animation, Adventure, Comedy',
                'The Garfield Movie',
                '5.8',
                'After Garfield''s unexpected reunion with his long-lost father, ragged alley cat Vic, he and his canine friend Odie are forced from their perfectly pampered lives to join Vic on a risky heist.',
                '02:17',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDdlNTIwNjYtNzVhNS00MGVmLTk1ZGYtZmZiMjhiMmQ1ZjkwXkEyXkFqcGdeQXVyMTY3ODkyNDkz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                135,
                7.9,
                '90 min',
                'Animation, Mystery, Sci-Fi',
                'Steins;Gate: The Movie - Load Region of Déjà Vu',
                '7.8',
                'After the events of the anime, Rintarou begins to feel the repercussions of extensive time travel, and eventually completely fades from reality. Kurisu, being the only companion to remember him, now must find a way to bring him back.',
                '22:51',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGJlNDM3ZjktOTNiNy00YmNmLWJlOGYtNDM4MTI2ZjRjOTNmXkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                136,
                7.0,
                '100 min',
                'Crime, Drama, Thriller',
                'Ray Donovan: The Movie',
                '6.8',
                'A showdown decades in the making brings the Donovan family legacy full circle as they find themselves drawn back to Boston. Struggling to overcome their violent upbringing, their fierce love for each other keeps them in the fight.',
                '11:37',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMThkMTBiMDItZGVhOC00MWJkLThlZjgtNmJiMTA0NjFjMDgyXkEyXkFqcGdeQXVyOTA3MTMyOTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                137,
                4.9,
                '92 min',
                'Comedy, Romance',
                'Another Gay Movie',
                '5.0',
                'Four gay high school friends make a pact to lose their virginity before they go to college.',
                '16:55',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTYzMTIzNDI3MV5BMl5BanBnXkFtZTgwNDQwMjMxMTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                138,
                7.2,
                '90 min',
                'Animation, Action, Fantasy',
                'Constantine: City of Demons - The Movie',
                '7.3',
                'A decade after a tragic mistake, Chas Chandler and occult investigator John Constantine set out to cure Chas''s daughter, Trish, from a demonically induced coma.',
                '04:05',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjM3M2EzYzAtYzcxYi00MWU2LWFhNmItNGJiZjMyZTUyNTQyXkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                139,
                7.9,
                '82 min',
                'Animation, Action, Adventure',
                'Steven Universe: The Movie',
                '7.7',
                'Steven thinks his time defending the Earth is over, but when a new threat comes to Beach City, Steven faces his biggest challenge yet.',
                '11:31',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYmVjY2U1N2UtMmZhOC00ODc5LWE1MjktODZjMmQyZmUyZWYwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                140,
                5.0,
                '90 min',
                'Animation, Action, Adventure',
                'Yu-Gi-Oh!: The Movie - Pyramid of Light',
                '5.0',
                'Underneath the sands of Egypt, Anubis, an ancient evil spirit, has awakened. It''s up to Yugi, who defeated Anubis centuries ago, to use his skill and determination to rid the world of evil once again.',
                '22:54',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTQ4NzM0NTAyMF5BMl5BanBnXkFtZTYwOTc2MTg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                141,
                7.2,
                '119 min',
                'Animation, Action, Adventure',
                'Sword Art Online the Movie: Ordinal Scale',
                '7.3',
                'Kirito uncovers a conspiracy within Ordinal Scale, a popular AR game developed for a new system called The Augma.',
                '02:33',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGE4M2M2OTYtZDgwMy00NGYwLWE0YTYtYzkyMDFjYWFhN2QzXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                142,
                2.3,
                '81 min',
                'Adventure, Comedy, Family',
                'Fred: The Movie',
                '2.1',
                'Lovestruck, awkward teen Fred Figglehorn makes desperate attempts to make Judy fall in love with him - while also dodging the mischievous Kevin.',
                '05:52',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGFhMDc5NjYtODI4Ny00M2FmLTk3YmUtMTQwZDFlYmRiNDI1XkEyXkFqcGdeQXVyODIxNjk4NzQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                143,
                5.9,
                '75 min',
                'Animation, Adventure, Comedy',
                'Piglet''s Big Movie',
                '6.1',
                'When Piglet comes up missing his Hundred Acre Wood friends use Piglet''s own Book of Memories to find him, discovering along the way just how big a role he''s played in their lives.',
                '14:34',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc5MzE2ODAyOF5BMl5BanBnXkFtZTYwNTcwNDg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                144,
                6.8,
                '97 min',
                'Comedy, Crime, Mystery',
                'Mr. Monk''s Last Case: A Monk Movie',
                '6.7',
                'Monk, a brilliant detective with obsessive-compulsive disorder, returns to solve one last case involving his stepdaughter Molly, a journalist preparing for her wedding.',
                '11:22',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzBlNjU2ZmYtM2ZjZi00ZmMzLWI4NzUtNjE1ZTVkODExNjI3XkEyXkFqcGdeQXVyMTU5OTc2NTk@._V1_SX300.jpg'
            );
