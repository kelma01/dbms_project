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





INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                45,
                7.5,
                '100 min',
                'Animation, Action, Adventure',
                'The Lego Movie',
                '7.7',
                'An ordinary LEGO construction worker, thought to be the prophesied as "special", is recruited to join a quest to stop an evil tyrant from gluing the LEGO universe into eternal stasis.',
                '17:56',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                46,
                7.5,
                '87 min',
                'Animation, Adventure, Comedy',
                'The Simpsons Movie',
                '7.3',
                'After Homer pollutes the town''s water supply, Springfield is encased in a gigantic dome by the EPA and the Simpsons are declared fugitives.',
                '15:31',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                47,
                7.1,
                '122 min',
                'Action, Crime, Drama',
                'El Camino: A Breaking Bad Movie',
                '7.3',
                'Fugitive Jesse Pinkman runs from his captors, the law, and his past.',
                '21:55',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                48,
                6.1,
                '88 min',
                'Comedy',
                'Scary Movie',
                '6.3',
                'A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer.',
                '11:13',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                49,
                6.8,
                '92 min',
                'Animation, Adventure, Comedy',
                'The Super Mario Bros. Movie',
                '7.0',
                'A plumber named Mario travels through an underground labyrinth with his brother Luigi, trying to save a captured princess.',
                '20:43',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                50,
                5.9,
                '91 min',
                'Animation, Adventure, Comedy',
                'Bee Movie',
                '6.1',
                'Barry B. Benson, a bee just graduated from college, is disillusioned at his lone career choice: making honey. On a special trip outside the hive, Barry''s life is saved by Vanessa, a florist in New York City. As their relationship ...',
                '14:42',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                51,
                5.4,
                '83 min',
                'Comedy, Horror',
                'Scary Movie 2',
                '5.3',
                'Four teens are tricked by a professor into visiting a haunted house for a school project.',
                '18:58',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                52,
                7.3,
                '104 min',
                'Animation, Action, Adventure',
                'The Lego Batman Movie',
                '7.3',
                'A cooler-than-ever Bruce Wayne must deal with the usual suspects as they plan to rule Gotham City, while discovering that he has accidentally adopted a teenage orphan who wishes to become his sidekick.',
                '19:25',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                53,
                5.6,
                '84 min',
                'Comedy',
                'Scary Movie 3',
                '5.5',
                'Cindy must investigate mysterious crop circles and video tapes, and help the President in preventing an alien invasion.',
                '02:04',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                54,
                5.3,
                '83 min',
                'Comedy',
                'Scary Movie 4',
                '5.1',
                'Cindy finds out the house she lives in is haunted by a little boy and goes on a quest to find out who killed him and why. Also, Alien "Tr-iPods" are invading the world and she has to uncover the secret in order to stop them.',
                '00:18',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                55,
                5.9,
                '89 min',
                'Comedy',
                'Not Another Teen Movie',
                '5.8',
                'A sendup of all the teen movies that have accumulated in the past two decades.',
                '20:18',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                56,
                4.5,
                '94 min',
                'Comedy',
                'Movie 43',
                '4.4',
                'A series of interconnected short films follows a washed-up producer as he pitches insane story lines featuring some of the biggest stars in Hollywood.',
                '06:14',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                57,
                2.6,
                '86 min',
                'Adventure, Comedy, Fantasy',
                'Epic Movie',
                '2.4',
                'A spoof on previous years'' epic movies (The Da Vinci Code (2006), The Chronicles of Narnia: The Lion, the Witch and the Wardrobe (2005) + 20 more), TV series, music videos and celebs. 4 orphans are on an epic adventure.',
                '16:56',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                58,
                6.1,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie',
                '6.3',
                'When an island populated by happy, flightless birds is visited by mysterious green pigs, it''s up to three unlikely outcasts to figure out what the pigs are up to.',
                '01:00',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                59,
                8.2,
                '130 min',
                'Animation, Drama',
                'A Silent Voice: The Movie',
                '8.1',
                'A young man is ostracized by his classmates after he bullies a deaf girl to the point where she moves away. Years later, he sets off on a path for redemption.',
                '05:25',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                60,
                7.2,
                '87 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob SquarePants Movie',
                '7.2',
                'SpongeBob takes leave from Bikini Bottom in order to track down, with Patrick, King Neptune''s stolen crown.',
                '08:39',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                61,
                6.8,
                '85 min',
                'Documentary, Action, Comedy',
                'Jackass: The Movie',
                '6.6',
                'Johnny Knoxville and his band of maniacs perform a variety of stunts and gross-out gags on the big screen for the first time.',
                '22:06',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                62,
                1.8,
                '87 min',
                'Comedy, Sci-Fi',
                'Disaster Movie',
                '1.9',
                'Over the course of one evening, an unsuspecting group of twenty-somethings find themselves bombarded by a series of natural disasters and catastrophic events.',
                '02:19',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                63,
                5.0,
                '80 min',
                'Adventure, Comedy, Family',
                'Garfield: The Movie',
                '5.0',
                'Jon Arbuckle buys a second pet, a dog named Odie. However, Odie is then abducted and it is up to Jon''s cat, Garfield, to find and rescue the canine.',
                '11:12',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                64,
                3.7,
                '86 min',
                'Comedy',
                'Scary Movie V',
                '3.5',
                'A couple begin to experience some unusual activity after bringing their lost nieces and nephew home. With the help of home-surveillance cameras, they learn they''re being stalked by a nefarious demon.',
                '01:01',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                65,
                6.3,
                '107 min',
                'Animation, Action, Adventure',
                'The Lego Movie 2: The Second Part',
                '6.5',
                'It''s been five years since everything was awesome and the citizens are facing the huge new threat of Lego Duplo, invaders from outer space, wrecking everything faster than they can rebuild.',
                '21:20',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                66,
                4.8,
                '75 min',
                'Action, Comedy, Sci-Fi',
                'Superhero Movie',
                '4.7',
                'Orphaned high school student Rick Riker is bitten by a radioactive dragonfly, develops super powers (except for the ability to fly), and becomes a hero.',
                '21:21',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                67,
                8.1,
                '117 min',
                'Animation, Action, Adventure',
                'Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train',
                '8.2',
                'After his family was brutally murdered and his sister turned into a demon, Tanjiro Kamado''s journey as a demon slayer began. Tanjiro and his comrades embark on a new mission aboard the Mugen Train, on track to despair.',
                '14:20',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                68,
                3.6,
                '86 min',
                'Animation, Adventure, Comedy',
                'The Emoji Movie',
                '3.4',
                'Gene, a multi-expressional emoji, sets out on a journey to become a normal emoji.',
                '19:49',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                69,
                6.9,
                '78 min',
                'Animation, Adventure, Comedy',
                'A Goofy Movie',
                '6.9',
                'When Max makes a preposterous promise to a girl he has a crush on, his chances to fulfilling it seem hopeless when he is dragged onto a cross-country trip with his embarrassing father, Goofy.',
                '03:18',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                70,
                3.0,
                '83 min',
                'Comedy, Romance',
                'Date Movie',
                '2.8',
                'Spoof of romantic comedies which focuses on a man, his crush, his parents, and her father.',
                '00:22',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                71,
                5.8,
                '92 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge Out of Water',
                '6.0',
                'When a diabolical pirate above the sea steals the secret Krabby Patty formula, SpongeBob and his friends team up in order to get it back.',
                '02:31',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                72,
                7.9,
                '115 min',
                'Animation, Action, Crime',
                'Cowboy Bebop: The Movie',
                '7.8',
                'A terrorist explosion releases a deadly virus on the masses, and it''s up to the bounty-hunting Bebop crew to catch the cold-blooded culprit.',
                '17:32',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                73,
                7.2,
                '88 min',
                'Animation, Adventure, Comedy',
                'The Peanuts Movie',
                '7.0',
                'Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their archnemesis, while his best pal Charlie Brown begins his own epic quest back home to win the love of his life.',
                '16:35',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                74,
                6.4,
                '96 min',
                'Animation, Action, Adventure',
                'Pokémon: The First Movie - Mewtwo Strikes Back',
                '6.3',
                'Scientists genetically create a new Pokémon, Mewtwo, but the results are horrific and disastrous.',
                '08:44',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                75,
                4.5,
                '102 min',
                'Comedy, Drama, Family',
                'Hannah Montana: The Movie',
                '4.7',
                'As Hannah Montana''s popularity begins to take over her life, Miley Stewart, on the urging from her father takes a trip to her hometown of Crowley Corners, Tennessee to get some perspective on what matters in life the most.',
                '00:13',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                76,
                7.2,
                '85 min',
                'Animation, Adventure, Comedy',
                'Shaun the Sheep Movie',
                '7.3',
                'When Shaun decides to take the day off and have some fun, he gets a little more action than he bargained for. A mix up with the Farmer, a caravan and a very steep hill lead them all to the Big City and it''s up to Shaun and the flo...',
                '18:20',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                77,
                5.4,
                '94 min',
                'Adventure, Comedy, Family',
                'The Lizzie McGuire Movie',
                '5.5',
                'Lizzie McGuire has graduated from middle school and takes a trip to Rome, Italy with her class. And what was supposed to be only a normal trip, becomes a teenager''s dream come true.',
                '08:38',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                78,
                7.4,
                '84 min',
                'Animation, Action, Adventure',
                'The Transformers: The Movie',
                '7.2',
                'The Autobots must stop a colossal planet consuming robot who goes after the Autobot Matrix of Leadership. At the same time, they must defend themselves against an all-out attack from the Decepticons.',
                '07:57',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                79,
                6.5,
                '101 min',
                'Horror, Sci-Fi',
                'Twilight Zone: The Movie',
                '6.4',
                'Four horror and science fiction segments, directed by four famous directors, each of them being a new version of a classic story from Rod Serling''s landmark television series.',
                '09:32',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                80,
                7.5,
                '95 min',
                'Adventure, Comedy, Family',
                'The Muppet Movie',
                '7.6',
                'Kermit and his newfound friends trek across America to find success in Hollywood, but a frog legs merchant is after Kermit.',
                '11:32',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                81,
                6.3,
                '82 min',
                'Comedy',
                'Between Two Ferns: The Movie',
                '6.1',
                'Zach Galifianakis and his oddball crew take a road trip to complete a series of high-profile celebrity interviews.',
                '02:32',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                82,
                6.5,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie 2',
                '6.4',
                'The flightless birds and scheming green pigs take their feud to the next level.',
                '22:17',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                83,
                6.4,
                '105 min',
                'Action, Adventure, Comedy',
                'Batman: The Movie',
                '6.5',
                'The Dynamic Duo faces four supervillains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people.',
                '14:58',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                84,
                6.3,
                '89 min',
                'Animation, Action, Adventure',
                'Captain Underpants: The First Epic Movie',
                '6.2',
                'Two overly imaginative pranksters named George and Harold hypnotize their grumpy principal into thinking he''s a ridiculously enthusiastic, incredibly dimwitted superhero named Captain Underpants.',
                '16:00',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                85,
                5.8,
                '101 min',
                'Animation, Action, Adventure',
                'The Lego Ninjago Movie',
                '6.0',
                'Shunned by everyone for being the son of an evil warlord, a teenager seeks to defeat him with the help of his fellow ninjas.',
                '01:19',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                86,
                6.6,
                '74 min',
                'Animation, Adventure, Comedy',
                'DuckTales the Movie: Treasure of the Lost Lamp',
                '6.8',
                'Scrooge McDuck takes Huey, Dewey, and Louie to Egypt to find a pyramid and magic lamp.',
                '02:40',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                87,
                8.5,
                '68 min',
                'Documentary',
                'Man with a Movie Camera',
                '8.3',
                'A man travels around a city with a camera slung over his shoulder, documenting urban life with dazzling invention.',
                '18:47',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                88,
                7.5,
                '110 min',
                'Drama, Western',
                'Deadwood: The Movie',
                '7.3',
                'As the residents of Deadwood gather to commemorate Dakota''s statehood in 1889, saloon owner Al Swearengen and Marshal Seth Bullock clash with Senator George Hearst.',
                '10:15',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                89,
                6.1,
                '90 min',
                'Comedy',
                'The Brady Bunch Movie',
                '6.2',
                'The original 1970s TV family is now placed in the 1990s, where they''re even more square and out of place than ever.',
                '22:47',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                90,
                5.9,
                '99 min',
                'Animation, Action, Adventure',
                'Pokémon the Movie 2000',
                '6.1',
                'Ash Ketchum must gather the three spheres of fire, ice and lightning in order to restore balance to the Orange Islands.',
                '21:17',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                91,
                5.8,
                '91 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge on the Run',
                '5.9',
                'After SpongeBob''s beloved pet snail Gary is snail-napped, he and Patrick embark on an epic adventure to the Lost City of Atlantic City to bring Gary home.',
                '02:11',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                92,
                7.2,
                '102 min',
                'Animation, Adventure, Comedy',
                'The Bob''s Burgers Movie',
                '7.0',
                'When a sinkhole in front of Bob''s Burgers threatens the Belchers'' plans for a successful summer, Bob and Linda try to keep their business going, while the kids attempt to save the restaurant by solving a mystery.',
                '15:24',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                93,
                7.6,
                '103 min',
                'Documentary, Drama',
                'Indie Game: The Movie',
                '7.6',
                'A documentary that follows the journeys of indie game developers as they create games and release those works, and themselves, to the world.',
                '19:00',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                94,
                6.4,
                '94 min',
                'Action, Adventure, Comedy',
                'Wizards of Waverly Place: The Movie',
                '6.2',
                'A young wizard conjures a spell that puts her family in jeopardy.',
                '12:56',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                95,
                6.0,
                '79 min',
                'Animation, Adventure, Comedy',
                'The Rugrats Movie',
                '5.9',
                'The babies gets lost in the forest after Tommy Pickles gets a new baby brother.',
                '10:43',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                96,
                6.4,
                '77 min',
                'Animation, Adventure, Comedy',
                'The Tigger Movie',
                '6.3',
                'Tigger goes looking through the hundred-acre-wood to find his family.',
                '17:46',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                97,
                6.5,
                '83 min',
                'Comedy',
                'The Kentucky Fried Movie',
                '6.4',
                'The daily programming of a fictional local TV channel presented as a series of highly irreverent skits.',
                '15:14',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                98,
                6.1,
                '93 min',
                'Comedy, Fantasy, Horror',
                'Tales from the Darkside: The Movie',
                '6.2',
                'To stall a witch plotting to eat him, a boy reads her horror tales dealing with a collegian''s resurrection of a mummy, a murderous cat, and an artist''s pact with a gargoyle.',
                '13:05',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                99,
                7.7,
                '107 min',
                'Documentary, Comedy',
                'American Movie',
                '7.8',
                'Documentary about an aspiring filmmaker''s attempts to finance his dream project by finally completing the low-budget horror film he abandoned years before.',
                '20:11',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                100,
                7.3,
                '73 min',
                'Comedy, Drama, Fantasy',
                'Mystery Science Theater 3000: The Movie',
                '7.2',
                'Mike Nelson and his robot companions watch and give their comments about This Island Earth (1955).',
                '23:28',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                101,
                6.9,
                '87 min',
                'Comedy',
                'Silent Movie',
                '6.7',
                'A film director and his strange friends struggle to produce the first major silent feature film in forty years.',
                '17:31',
                'Thursday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                102,
                7.6,
                '112 min',
                'Animation, Action, Adventure',
                'The Last: Naruto the Movie',
                '7.6',
                'Hinata Hyuga''s younger sister has been kidnapped, so Naruto must do what he can to save her.',
                '05:31',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                103,
                6.0,
                '86 min',
                'Comedy',
                'The Onion Movie',
                '6.2',
                'Satirical interpretations of world events and curious human behavior.',
                '03:08',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                104,
                6.7,
                '86 min',
                'Animation, Adventure, Comedy',
                'A Shaun the Sheep Movie: Farmageddon',
                '6.8',
                'When an alien with amazing powers crash-lands near Mossy Bottom Farm, Shaun the Sheep goes on a mission to shepherd the intergalactic visitor home before a sinister organization can capture her.',
                '21:24',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                105,
                8.3,
                '95 min',
                'Documentary, Biography',
                'Still: A Michael J. Fox Movie',
                '8.1',
                'Follows the life of beloved actor and advocate Michael J. Fox, exploring his personal and professional triumphs and travails, and what happens when an incurable optimist confronts an incurable disease.',
                '23:07',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                106,
                5.9,
                '93 min',
                'Animation, Action, Adventure',
                'Pokémon 3 the Movie: Spell of the Unown',
                '5.8',
                'In the town of Greenfield, a young, lonely girl''s dreams and wishes are brought into reality by a collective of reality-warping Pokémon.',
                '16:39',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                107,
                6.4,
                '90 min',
                'Documentary, Comedy',
                'The Greatest Movie Ever Sold',
                '6.6',
                'A documentary about branding, advertising and product placement that is financed and made possible by brands, advertising and product placement.',
                '19:52',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                108,
                6.2,
                '99 min',
                'Comedy, Crime',
                'Cheech and Chong''s Next Movie',
                '6.0',
                'Cheech and Chong live in a decrepit old house and drive their neighbour crazy with their loud music, weed smoking and general anarchy and slacker view on life. Then Chong meets Cheech''s Texan cousin Red and things kick up a notch.',
                '03:33',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                109,
                5.4,
                '141 min',
                'Action, Drama, Fantasy',
                'Teen Wolf: The Movie',
                '5.5',
                'A terrifying evil has emerged. The wolves howl once again, but only a Werewolf like Scott McCall, can gather both new allies and reunite trusted friends to fight back against what could be the most powerful and deadliest enemy.',
                '03:42',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                110,
                6.6,
                '86 min',
                'Animation, Action, Adventure',
                'Aqua Teen Hunger Force Colon Movie Film for Theaters',
                '6.7',
                'An action epic that explores the origins of Master Shake, Frylock, and Meatwad, better known as the Aqua Teen Hunger Force, who somehow become pitted in a battle over an immortal piece of exercise equipment.',
                '21:00',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                111,
                6.0,
                '110 min',
                'Comedy, Family, Fantasy',
                'Teen Beach Movie',
                '5.9',
                'Two surfing lovers, whose doomed relationship is nearing to a close, find themselves swept into a dimension-traversing wave that sends them into a beach movie musical in the 60''s.',
                '21:16',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                112,
                7.3,
                '78 min',
                'Animation, Action, Adventure',
                'Phineas and Ferb the Movie: Across the 2nd Dimension',
                '7.4',
                'Phineas and Ferb discover that Perry is a secret agent, and they all get stuck in an alternate dimension where Doofenschmirtz is the ruler of the tri-state area.',
                '20:48',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                113,
                7.1,
                '95 min',
                'Comedy, Crime',
                'Trailer Park Boys: The Movie',
                '7.1',
                'Ricky, Julian, and Bubbles come up with a scheme to steal large amounts of untraceable coins.',
                '10:12',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                114,
                6.4,
                '99 min',
                'Documentary',
                'My Scientology Movie',
                '6.6',
                'Louis Theroux documents his investigation into what goes on behind the scenes of the infamous Church of Scientology.',
                '01:07',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                115,
                5.6,
                '91 min',
                'Comedy, Crime',
                'Absolutely Fabulous: The Movie',
                '5.4',
                'After attracting both media and police attention for accidentally knocking Kate Moss into the River Thames, Edina and Patsy hide out in the south of France.',
                '16:02',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                116,
                7.3,
                '88 min',
                'Comedy, Crime, Mystery',
                'Psych: The Movie',
                '7.3',
                'The old gang comes together during the holidays after a mystery assailant targets one of their own.',
                '14:21',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                117,
                7.9,
                '95 min',
                'Animation, Action, Adventure',
                'Boruto: Naruto the Movie',
                '7.8',
                'It''s been some years since the end of the Shinobi War. Naruto Uzumaki is the 7th Hokage of Konohagakure, in this new era. His son, Boruto Uzumaki, will soon enter the Chûnin exams, alongside Sarada Uchiha and the mysterious Mitsuki.',
                '19:51',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                118,
                7.2,
                '105 min',
                'Animation, Action, Adventure',
                'Fullmetal Alchemist the Movie: Conqueror of Shamballa',
                '7.3',
                'Edward Elric, an alchemist from an alternate world, races to prevent the Thule Society from harnessing alchemy to wage war on his home.',
                '22:53',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                119,
                5.6,
                '84 min',
                'Animation, Adventure, Comedy',
                'Tom and Jerry: The Movie',
                '5.4',
                'Cat and mouse duo Tom and Jerry reluctantly work together to save a young girl from her evil aunt.',
                '07:30',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                120,
                6.7,
                '72 min',
                'Animation, Action, Adventure, Sci-Fi',
                'Ultimate Avengers: The Movie',
                '6.7',
                'To confront an alien menace, General Fury assembles a team of superheroes lead by a recently resuscitated Captain America.',
                '14:56',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                121,
                3.5,
                '86 min',
                'Comedy',
                'Extreme Movie',
                '3.7',
                'A sketch-comedy movie about the joys and embarrassments of teen sex. But mostly the embarrassments.',
                '18:15',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                122,
                6.3,
                '73 min',
                'Animation, Action, Adventure',
                'The Powerpuff Girls Movie',
                '6.5',
                'After destroying the city of Townsville in a game of tag, a trio of super-powered little girls must redeem themselves by stopping a vengeful monkey''s plot for world domination.',
                '20:51',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                123,
                5.5,
                '93 min',
                'Comedy',
                'Tim and Eric''s Billion Dollar Movie',
                '5.3',
                'Two guys get a billion dollars to make a movie, only to watch their dream run off course. In order to make the money back, they then attempt to revitalize a failing shopping mall.',
                '06:53',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                124,
                6.2,
                '79 min',
                'Animation, Comedy, Family, Sport',
                'An Extremely Goofy Movie',
                '6.4',
                'Max goes to college, but to his embarassment his father loses his job and goes to his son''s campus.',
                '15:33',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                125,
                6.1,
                '89 min',
                'Adventure, Drama, Sci-Fi',
                'Doctor Who: The Movie',
                '6.3',
                'The newly-regenerated Doctor takes on the Master on the turn of the millennium, 31 December 1999.',
                '12:52',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                126,
                8.3,
                '140 min',
                'Animation, Drama, Fantasy',
                'Violet Evergarden: The Movie',
                '8.3',
                'After the aftermath of a war, a young girl who was used as a ''tool'' for war learned to live. With the scars of burns, she goes back to her past to feel the true feelings of the Major''s, "I love you."',
                '01:48',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                127,
                4.1,
                '96 min',
                'Action, Drama, Fantasy',
                'Left Behind: The Movie',
                '4.3',
                'The Biblical prophecy of Armegeddon begins when the Rapture instantly takes all believers in Christ from the Earth. A reporter left behind learns that the Anti-Christ will soon take power.',
                '08:34',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                128,
                3.0,
                '77 min',
                'Comedy',
                'It''s Pat: The Movie',
                '2.8',
                'The comedic misadventures of a person of indeterminate gender.',
                '08:09',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                129,
                9.8,
                '25 min',
                'Action, Comedy',
                'Threat Level Midnight: The Movie',
                '9.6',
                'After secret agent Michael Scarn (Steve Carell) is forced into retirement after the death of his wife Catherine Zeta-Scarn, the President of the United States of America (Craig Robinson) requests that he prevents Goldenface (John ...',
                '14:27',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                130,
                9.5,
                '164 min',
                'Comedy',
                'Uno: The Movie',
                '9.5',
                'What had started as a simple game of UNO! turned into a psychological horror. Coworkers are driven to the edge of madness as they commit to a game of Uno.',
                '05:46',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                131,
                3.4,
                '99 min',
                'Action, Adventure, Family',
                'Turbo: A Power Rangers Movie',
                '3.6',
                'A space alien is threatening to bring destruction on Earth, and the Power Rangers are enhanced with turbo powers in order to prevent her plan.',
                '22:37',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                132,
                7.1,
                '102 min',
                'Animation, Action, Adventure',
                'Street Fighter II: The Animated Movie',
                '7.2',
                'A crime boss searching for the world''s best fighters pursues a talented Japanese drifter and his American ex-classmate, while an Interpol agent and a US Army captain seek to bring him down.',
                '11:43',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                133,
                7.7,
                '64 min',
                'Animation, Action, Adventure',
                'The Batman Superman Movie: World''s Finest',
                '7.7',
                'Joker goes to Metropolis with an offer and plan to kill Superman for Lex Luthor while Batman pursues the clown to Superman''s turf.',
                '20:15',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                134,
                5.6,
                '101 min',
                'Animation, Adventure, Comedy',
                'The Garfield Movie',
                '5.8',
                'After Garfield''s unexpected reunion with his long-lost father, ragged alley cat Vic, he and his canine friend Odie are forced from their perfectly pampered lives to join Vic on a risky heist.',
                '08:15',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                135,
                8.0,
                '90 min',
                'Animation, Mystery, Sci-Fi',
                'Steins;Gate: The Movie - Load Region of Déjà Vu',
                '7.8',
                'After the events of the anime, Rintarou begins to feel the repercussions of extensive time travel, and eventually completely fades from reality. Kurisu, being the only companion to remember him, now must find a way to bring him back.',
                '04:58',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                136,
                6.9,
                '100 min',
                'Crime, Drama, Thriller',
                'Ray Donovan: The Movie',
                '6.8',
                'A showdown decades in the making brings the Donovan family legacy full circle as they find themselves drawn back to Boston. Struggling to overcome their violent upbringing, their fierce love for each other keeps them in the fight.',
                '04:13',
                'Monday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                137,
                5.0,
                '92 min',
                'Comedy, Romance',
                'Another Gay Movie',
                '5.0',
                'Four gay high school friends make a pact to lose their virginity before they go to college.',
                '21:43',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                138,
                7.5,
                '90 min',
                'Animation, Action, Fantasy',
                'Constantine: City of Demons - The Movie',
                '7.3',
                'A decade after a tragic mistake, Chas Chandler and occult investigator John Constantine set out to cure Chas''s daughter, Trish, from a demonically induced coma.',
                '16:58',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                139,
                7.7,
                '82 min',
                'Animation, Action, Adventure',
                'Steven Universe: The Movie',
                '7.7',
                'Steven thinks his time defending the Earth is over, but when a new threat comes to Beach City, Steven faces his biggest challenge yet.',
                '02:39',
                'Wednesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                140,
                4.9,
                '90 min',
                'Animation, Action, Adventure',
                'Yu-Gi-Oh!: The Movie - Pyramid of Light',
                '5.0',
                'Underneath the sands of Egypt, Anubis, an ancient evil spirit, has awakened. It''s up to Yugi, who defeated Anubis centuries ago, to use his skill and determination to rid the world of evil once again.',
                '17:42',
                'Tuesday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                141,
                7.5,
                '119 min',
                'Animation, Action, Adventure',
                'Sword Art Online the Movie: Ordinal Scale',
                '7.3',
                'Kirito uncovers a conspiracy within Ordinal Scale, a popular AR game developed for a new system called The Augma.',
                '09:08',
                'Saturday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                142,
                1.9,
                '81 min',
                'Adventure, Comedy, Family',
                'Fred: The Movie',
                '2.1',
                'Lovestruck, awkward teen Fred Figglehorn makes desperate attempts to make Judy fall in love with him - while also dodging the mischievous Kevin.',
                '03:15',
                'Sunday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                143,
                6.2,
                '75 min',
                'Animation, Adventure, Comedy',
                'Piglet''s Big Movie',
                '6.1',
                'When Piglet comes up missing his Hundred Acre Wood friends use Piglet''s own Book of Memories to find him, discovering along the way just how big a role he''s played in their lives.',
                '01:47',
                'Friday',
                1
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released) VALUES (
                144,
                6.7,
                '97 min',
                'Comedy, Crime, Mystery',
                'Mr. Monk''s Last Case: A Monk Movie',
                '6.7',
                'Monk, a brilliant detective with obsessive-compulsive disorder, returns to solve one last case involving his stepdaughter Molly, a journalist preparing for her wedding.',
                '08:26',
                'Wednesday',
                1
            );