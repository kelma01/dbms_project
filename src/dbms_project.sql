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
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES  
(1, 8.5, '2h 30m', 'Drama', 'Titanic', 8.7, 'A love story on the ill-fated Titanic', '7:00 PM', 'Friday', 1), 
(2, 7.8, '2h 10m', 'Action', 'Mr. & Mrs. Smith', 7.5, 'A married couple discovers they are both assassins', '8:00 PM', 'Saturday', 1), 
(3, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '9:00 PM', 'Sunday', 1), 
(4, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '10:00 PM', 'Monday', 1), 
(5, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '11:00 PM', 'Tuesday', 1), 
(6, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '12:00 PM', 'Wednesday', 1), 
(7, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '1:00 PM', 'Thursday', 1), 
(8, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '2:00 PM', 'Friday', 1), 
(9, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '3:00 PM', 'Saturday', 1), 
(10, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '4:00 PM', 'Sunday', 1), 
(11, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '5:00 PM', 'Monday', 1), 
(12, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '6:00 PM', 'Tuesday', 1), 
(13, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '7:00 PM', 'Wednesday', 1), 
(14, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '8:00 PM', 'Thursday', 1), 
(15, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '9:00 PM', 'Friday', 1), 
(16, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '10:00 PM', 'Saturday', 1), 
(17, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '11:00 PM', 'Sunday', 1), 
(18, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '12:00 PM', 'Monday', 1), 
(19, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '1:00 PM', 'Tuesday', 1), 
(20, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '2:00 PM', 'Wednesday', 1), 
(21, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '3:00 PM', 'Thursday', 1), 
(22, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '4:00 PM', 'Friday', 1), 
(23, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '5:00 PM', 'Saturday', 1), 
(24, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '3:00 PM', 'Saturday', 1), 
(25, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '4:00 PM', 'Sunday', 1), 
(26, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '5:00 PM', 'Monday', 1), 
(27, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '6:00 PM', 'Tuesday', 1), 
(28, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '7:00 PM', 'Wednesday', 1), 
(29, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '8:00 PM', 'Thursday', 1), 
(30, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '9:00 PM', 'Friday', 1), 
(31, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '10:00 PM', 'Saturday', 1), 
(32, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '11:00 PM', 'Sunday', 1), 
(33, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '12:00 PM', 'Monday', 1), 
(34, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '1:00 PM', 'Tuesday', 1), 
(35, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '2:00 PM', 'Wednesday', 1), 
(36, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '3:00 PM', 'Thursday', 1), 
(37, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '4:00 PM', 'Friday', 1), 
(38, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '5:00 PM', 'Saturday', 1),
(39, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '9:00 PM', 'Monday', 1),
(40, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '10:00 PM', 'Tuesday', 1),
(41, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '11:00 PM', 'Wednesday', 1),
(42, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '12:00 PM', 'Thursday', 1),
(43, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '1:00 PM', 'Friday', 1),
(44, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '2:00 PM', 'Saturday', 1);
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





