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
  `seat_row` char(1) NOT NULL,
  `seat_col` int NOT NULL,
  PRIMARY KEY (`theater_id`,`cinema_id`,`seat_id`),
  UNIQUE KEY `seat_id_UNIQUE` (`seat_id`),
  KEY `cinema_id_idx` (`cinema_id`),
  KEY `seat_cinema_id_idx` (`cinema_id`),
  CONSTRAINT `seat_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `seat_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`)
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
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theater_id` int NOT NULL,
  `num_of_seats` int NOT NULL,
  `seats` varchar(45) DEFAULT NULL,
  `cinema_id` int NOT NULL,
  PRIMARY KEY (`theater_id`,`cinema_id`),
  UNIQUE KEY `cinema_id_UNIQUE` (`cinema_id`),
  UNIQUE KEY `theater_id_UNIQUE` (`theater_id`),
  CONSTRAINT `theater_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
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
  `birth_date` date DEFAULT NULL,
  `tickets` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `wallet_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
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

-- Dump completed on 2024-07-26 16:23:43
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released,image_id) VALUES  
(1, 8.5, '2h 30m', 'Drama', 'Titanic', 8.7, 'A love story on the ill-fated Titanic', '7:00 PM', 'Friday', 1, 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'), 
(2, 7.8, '2h 10m', 'Action', 'Mr. & Mrs. Smith', 7.5, 'A married couple discovers they are both assassins', '8:00 PM', 'Saturday', 1, 'https://m.media-amazon.com/images/M/MV5BMTUxMzcxNzQzOF5BMl5BanBnXkFtZTcwMzQxNjUyMw@@._V1_SX300.jpg'), 
(3, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '9:00 PM', 'Sunday', 1, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg'), 
(4, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '10:00 PM', 'Monday', 1, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg'), 
(5, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', '11:00 PM', 'Tuesday', 1, 'https://m.media-amazon.com/images/M/MV5BNGQwZjg5YmYtY2VkNC00NzliLTljYTctNzI5NmU3MjE2ODQzXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(6, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', '12:00 PM', 'Wednesday', 1, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(7, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', '1:00 PM', 'Thursday', 1, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'), 
(8, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', '2:00 PM', 'Friday', 1, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'), 
(9, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', '3:00 PM', 'Saturday', 1, 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(10, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '4:00 PM', 'Sunday', 1, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'), 
(11, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '5:00 PM', 'Monday', 1, 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(12, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '6:00 PM', 'Tuesday', 1, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(13, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '7:00 PM', 'Wednesday', 1, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'), 
(14, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', '8:00 PM', 'Thursday', 1, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'), 
(15, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', '9:00 PM', 'Friday', 1, 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(16, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', '10:00 PM', 'Saturday', 1, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(17, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', '11:00 PM', 'Sunday', 1, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'), 
(18, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', '12:00 PM', 'Monday', 1, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg'), 
(19, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', '1:00 PM', 'Tuesday', 1, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg');
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
('Elijah', 'Wood', 45),
('Viggo', 'Mortensen', 45),
('Elijah', 'Wood', 46),
('Viggo', 'Mortensen', 46),
('Keanu', 'Reeves', 47),
('Laurence', 'Fishburne', 47),
('Tom', 'Hanks', 48),
('Robin', 'Wright', 48),
('Elijah', 'Wood', 49),
('Viggo', 'Mortensen', 49),
('Elijah', 'Wood', 50),
('Viggo', 'Mortensen', 50),
('Elijah', 'Wood', 51),
('Viggo', 'Mortensen', 51),
('Keanu', 'Reeves', 52),
('Laurence', 'Fishburne', 52),
('Tom', 'Hanks', 53),
('Robin', 'Wright', 53),
('Elijah', 'Wood', 54),
('Viggo', 'Mortensen', 54),
('Elijah', 'Wood', 55),
('Viggo', 'Mortensen', 55),
('Elijah', 'Wood', 56),
('Viggo', 'Mortensen', 56),
('Keanu', 'Reeves', 57),
('Laurence', 'Fishburne', 57),
('Tom', 'Hanks', 58),
('Robin', 'Wright', 58),
('Elijah', 'Wood', 59),
('Viggo', 'Mortensen', 59),
('Elijah', 'Wood', 60),
('Viggo', 'Mortensen', 60),
('Elijah', 'Wood', 61),
('Viggo', 'Mortensen', 61),
('Keanu', 'Reeves', 62),
('Laurence', 'Fishburne', 62),
('Tom', 'Hanks', 63),
('Robin', 'Wright', 63),
('Elijah', 'Wood', 64),
('Viggo', 'Mortensen', 64),
('Elijah', 'Wood', 65),
('Viggo', 'Mortensen', 65),
('Elijah', 'Wood', 66),
('Viggo', 'Mortensen', 66),
('Keanu', 'Reeves', 67),
('Laurence', 'Fishburne', 67),
('Tom', 'Hanks', 68),
('Robin', 'Wright', 68),
('Elijah', 'Wood', 69),
('Viggo', 'Mortensen', 69),
('Elijah', 'Wood', 70),
('Viggo', 'Mortensen', 70),
('Elijah', 'Wood', 71),
('Viggo', 'Mortensen', 71),
('Keanu', 'Reeves', 72),
('Laurence', 'Fishburne', 72),
('Tom', 'Hanks', 73),
('Robin', 'Wright', 73),
('Elijah', 'Wood', 74),
('Viggo', 'Mortensen', 74),
('Elijah', 'Wood', 75),
('Viggo', 'Mortensen', 75),
('Elijah', 'Wood', 76),
('Viggo', 'Mortensen', 76),
('Keanu', 'Reeves', 77),
('Laurence', 'Fishburne', 77),
('Tom', 'Hanks', 78),
('Robin', 'Wright', 78),
('Elijah', 'Wood', 79),
('Viggo', 'Mortensen', 79),
('Elijah', 'Wood', 80),
('Viggo', 'Mortensen', 80),
('Elijah', 'Wood', 81),
('Viggo', 'Mortensen', 81),
('Keanu', 'Reeves', 82),
('Laurence', 'Fishburne', 82),
('Tom', 'Hanks', 83),
('Robin', 'Wright', 83),
('Elijah', 'Wood', 84),
('Viggo', 'Mortensen', 84),
('Elijah', 'Wood', 85),
('Viggo', 'Mortensen', 85),
('Elijah', 'Wood', 86),
('Viggo', 'Mortensen', 86),
('Keanu', 'Reeves', 87),
('Laurence', 'Fishburne', 87),
('Tom', 'Hanks', 88);
INSERT INTO cinema (cinema_id, name, location, city, address, theaters) VALUES 
(1, 'Cinema 1', 'Downtown', 'City A', '123 Main St', 'Theater 1, Theater 2'),
(2, 'Cinema 2', 'Uptown', 'City B', '456 Elm St', 'Theater 3, Theater 4'),
(3, 'Cinema 3', 'Midtown', 'City C', '789 Oak St', 'Theater 5, Theater 6'),
(4, 'Cinema 4', 'Suburb', 'City D', '101 Pine St', 'Theater 7, Theater 8'),
(5, 'Cinema 5', 'Downtown', 'City E', '112 Maple St', 'Theater 9, Theater 10'),
(6, 'Cinema 6', 'Uptown', 'City F', '131 Cedar St', 'Theater 11, Theater 12'),
(7, 'Cinema 7', 'Midtown', 'City G', '141 Walnut St', 'Theater 13, Theater 14'),
(8, 'Cinema 8', 'Suburb', 'City H', '151 Birch St', 'Theater 15, Theater 16'),
(9, 'Cinema 9', 'Downtown', 'City I', '161 Ash St', 'Theater 17, Theater 18'),
(10, 'Cinema 10', 'Uptown', 'City J', '171 Elm St', 'Theater 19, Theater 20'),
(11, 'Cinema 11', 'Midtown', 'City K', '181 Oak St', 'Theater 21, Theater 22'),
(12, 'Cinema 12', 'Suburb', 'City L', '191 Pine St', 'Theater 23, Theater 24'),
(13, 'Cinema 13', 'Downtown', 'City M', '201 Maple St', 'Theater 25, Theater 26'),
(14, 'Cinema 14', 'Uptown', 'City N', '211 Cedar St', 'Theater 27, Theater 28'),
(15, 'Cinema 15', 'Midtown', 'City O', '221 Walnut St', 'Theater 29, Theater 30'),
(16, 'Cinema 16', 'Suburb', 'City P', '231 Birch St', 'Theater 31, Theater 32'),
(17, 'Cinema 17', 'Downtown', 'City Q', '241 Ash St', 'Theater 33, Theater 34'),
(18, 'Cinema 18', 'Uptown', 'City R', '251 Elm St', 'Theater 35, Theater 36'),
(19, 'Cinema 19', 'Midtown', 'City S', '261 Oak St', 'Theater 37, Theater 38'),
(20, 'Cinema 20', 'Suburb', 'City T', '271 Pine St', 'Theater 39, Theater 40'),
(21, 'Cinema 21', 'Downtown', 'City U', '281 Maple St', 'Theater 41, Theater 42'),
(22, 'Cinema 22', 'Uptown', 'City V', '291 Cedar St', 'Theater 43, Theater 44'),
(23, 'Cinema 23', 'Midtown', 'City W', '301 Walnut St', 'Theater 45, Theater 46'),
(24, 'Cinema 24', 'Suburb', 'City Z', '311 Birch St', 'Theater 47, Theater 48'),
(25, 'Cinema 25', 'Downtown', 'City AA', '321 Ash St', 'Theater 49, Theater 50'),
(26, 'Cinema 26', 'Uptown', 'City BB', '331 Elm St', 'Theater 51, Theater 52'),
(27, 'Cinema 27', 'Midtown', 'City CC', '341 Oak St', 'Theater 53, Theater 54'),
(28, 'Cinema 28', 'Suburb', 'City DD', '351 Pine St', 'Theater 55, Theater 56'),
(29, 'Cinema 29', 'Downtown', 'City EE', '361 Maple St', 'Theater 57, Theater 58'),
(30, 'Cinema 30', 'Uptown', 'City FF', '371 Cedar St', 'Theater 59, Theater 60'),
(31, 'Cinema 31', 'Midtown', 'City GG', '381 Walnut St', 'Theater 61, Theater 62'),
(32, 'Cinema 32', 'Suburb', 'City HH', '391 Birch St', 'Theater 63, Theater 64'),
(33, 'Cinema 33', 'Downtown', 'City II', '401 Ash St', 'Theater 65, Theater 66'),
(34, 'Cinema 34', 'Uptown', 'City JJ', '411 Elm St', 'Theater 67, Theater 68'),
(35, 'Cinema 35', 'Midtown', 'City KK', '421 Oak St', 'Theater 69, Theater 70'),
(36, 'Cinema 36', 'Suburb', 'City LL', '431 Pine St', 'Theater 71, Theater 72'),
(37, 'Cinema 37', 'Downtown', 'City MM', '441 Maple St', 'Theater 73, Theater 74'),
(38, 'Cinema 38', 'Uptown', 'City NN', '451 Cedar St', 'Theater 75, Theater 76'),
(39, 'Cinema 39', 'Midtown', 'City OO', '461 Walnut St', 'Theater 77, Theater 78');
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
(8, 450, 'H1-H450', 8),
(9, 500, 'I1-I500', 1),
(10, 550, 'J1-J550', 2),
(11, 600, 'K1-K600', 3),
(12, 650, 'L1-L650', 4),
(13, 700, 'M1-M700', 5),
(14, 750, 'N1-N750', 6),
(15, 800, 'O1-O800', 7),
(16, 850, 'P1-P850', 8),
(17, 900, 'Q1-Q900', 1),
(18, 950, 'R1-R950', 2),
(19, 1000, 'S1-S1000', 3),
(20, 1050, 'T1-T1050', 4),
(21, 1100, 'U1-U1100', 5),
(22, 1150, 'V1-V1150', 6),
(23, 1200, 'W1-W1200', 7),
(24, 1250, 'X1-X1250', 8),
(25, 1300, 'Y1-Y1300', 1),
(26, 1350, 'Z1-Z1350', 2),
(27, 1400, 'AA1-AA1400', 3),
(28, 1450, 'BB1-BB1450', 4),
(29, 1500, 'CC1-CC1500', 5),
(30, 1550, 'DD1-DD1550', 6),
(31, 1600, 'EE1-EE1600', 7),
(32, 1650, 'FF1-FF1650', 8),
(33, 1700, 'GG1-GG1700', 1),
(34, 1750, 'HH1-HH1750', 2),
(35, 1800, 'II1-II1800', 3),
(36, 1850, 'JJ1-JJ1850', 4),
(37, 1900, 'KK1-KK1900', 5),
(38, 1950, 'LL1-LL1950', 6),
(39, 2000, 'MM1-MM2000', 7),
(40, 2050, 'NN1-NN2050', 8),
(41, 2100, 'OO1-OO2100', 1),
(42, 2150, 'PP1-PP2150', 2),
(43, 2200, 'QQ1-QQ2200', 3),
(44, 2250, 'RR1-RR2250', 4),
(45, 2300, 'SS1-SS230', 5),
(46, 2350, 'TT1-TT2350', 6),
(47, 2400, 'UU1-UU2400', 7),
(48, 2450, 'VV1-VV2450', 8),
(49, 2500, 'WW1-WW2500', 1),
(50, 2550, 'XX1-XX2550', 2),
(51, 2600, 'YY1-YY2600', 3),
(52, 2650, 'ZZ1-ZZ2650', 4),
(53, 2700, 'AAA1-AAA2700', 5),
(54, 2750, 'BBB1-BBB2750', 6),
(55, 2800, 'CCC1-CCC2800', 7),
(56, 2850, 'DDD1-DDD2850', 8),
(57, 2900, 'EEE1-EEE2900', 1),
(58, 2950, 'FFF1-FFF2950', 2),
(59, 3000, 'GGG1-GGG3000', 3),
(60, 3050, 'HHH1-HHH3050', 4),
(61, 3100, 'III1-III3100', 5),
(62, 3150, 'JJJ1-JJJ3150', 6),
(63, 3200, 'KKK1-KKK3200', 7),
(64, 3250, 'LLL1-LLL3250', 8),
(65, 3300, 'MMM1-MMM3300', 1),
(66, 3350, 'NNN1-NNN3350', 2),
(67, 3400, 'OOO1-OOO3400', 3),
(68, 3450, 'PPP1-PPP3450', 4),
(69, 3500, 'QQQ1-QQQ3500', 5),
(70, 3550, 'RRR1-RRR3550', 6),
(71, 3600, 'SSS1-SSS3600', 7),
(72, 3650, 'TTT1-TTT365', 8),
(73, 3700, 'UUU1-UUU3700', 1),
(74, 3750, 'VVV1-VVV3750', 2),
(75, 3800, 'WWW1-WWW3800', 3),
(76, 3850, 'XXX1-XXX3850', 4),
(77, 3900, 'YYY1-YYY3900', 5),
(78, 3950, 'ZZZ1-ZZZ3950', 6),
(79, 4000, 'AAAA1-AAAA4000', 7),
(80, 4050, 'BBBB1-BBBB4050', 8),
(81, 4100, 'CCCC1-CCCC4100', 1),
(82, 4150, 'DDDD1-DDDD4150', 2),
(83, 4200, 'EEEE1-EEEE4200', 3),
(84, 4250, 'FFFF1-FFFF4250', 4),
(85, 4300, 'GGGG1-GGGG4300', 5),
(86, 4350, 'HHHH1-HHHH4350', 6),
(87, 4400, 'IIII1-IIII4400', 7),
(88, 4450, 'JJJJ1-JJJJ4450', 8),
(89, 4500, 'KKKK1-KKKK4500', 9),
(90, 4550, 'LLLL1-LLLL4550', 10),
(91, 4600, 'MMMM1-MMMM4600', 11),
(92, 4650, 'NNNN1-NNNN4650', 12),
(93, 4700, 'OOOO1-OOOO4700', 13),
(94, 4750, 'PPPP1-PPPP4750', 14),
(95, 4800, 'QQQQ1-QQQQ4800', 15),
(96, 4850, 'RRRR1-RRRR4850', 16),
(97, 4900, 'SSSS1-SSSS4900', 17),
(98, 4950, 'TTTT1-TTTT4950', 18),
(99, 5000, 'UUUU1-UUUU5000', 19),
(100, 5050, 'VVVV1-VVVV5050', 20),
(101, 5100, 'WWWW1-WWWW5100', 21),
(102, 5150, 'XXXX1-XXXX5150', 22),
(103, 5200, 'YYYY1-YYYY5200', 23),
(104, 5250, 'ZZZZ1-ZZZZ5250', 24),
(105, 5300, 'AAAAA1-AAAAA5300', 25),
(106, 5350, 'BBBBB1-BBBBB5350', 26),
(107, 5400, 'CCCCC1-CCCCC5400', 27),
(108, 5450, 'DDDDD1-DDDDD5450', 28),
(109, 5500, 'EEEEE1-EEEEE5500', 29),
(110, 5550, 'FFFFF1-FFFFF5550', 30),
(111, 5600, 'GGGGG1-GGGGG5600', 31),
(112, 5650, 'HHHHH1-HHHHH5650', 32),
(113, 5700, 'IIIII1-IIIII5700', 33),
(114, 5750, 'JJJJJ1-JJJJJ5750', 34),
(115, 5800, 'KKKKK1-KKKKK5800', 35),
(116, 5850, 'LLLLL1-LLLLL5850', 36),
(117, 5900, 'MMMMM1-MMMMM5900', 37),
(118, 5950, 'NNNNN1-NNNNN5950', 38),
(119, 6000, 'OOOOO1-OOOOO6000', 39),
(120, 6050, 'PPPPP1-PPPPP6050', 40),
(121, 6100, 'QQQQQ1-QQQQQ6100', 41),
(122, 6150, 'RRRRR1-RRRRR6150', 42),
(123, 6200, 'SSSSS1-SSSSS6200', 43),
(124, 6250, 'TTTTT1-TTTTT6250', 44),
(125, 6300, 'UUUUU1-UUUUU6300', 45),
(126, 6350, 'VVVVV1-VVVVV6350', 46),
(127, 6400, 'WWWWW1-WWWWW6400', 47),
(128, 6450, 'XXXXX1-XXXXX6450', 48),
(129, 6500, 'YYYYY1-YYYYY6500', 49),
(130, 6550, 'ZZZZZ1-ZZZZZ6550', 50),
(131, 6600, 'AAAAAA1-AAAAAA6600', 51),
(132, 6650, 'BBBBBB1-BBBBBB6650', 52),
(133, 6700, 'CCCCCC1-CCCCCC6700', 53),
(134, 6750, 'DDDDDD1-DDDDDD6750', 54),
(135, 6800, 'EEEEEE1-EEEEEE6800', 55),
(136, 6850, 'FFFFFF1-FFFFFF6850', 56),
(137, 6900, 'GGGGGG1-GGGGGG6900', 57),
(138, 6950, 'HHHHHH1-HHHHHH6950', 58),
(139, 7000, 'IIIIII1-IIIIII7000', 59),
(140, 7050, 'JJJJJJ1-JJJJJJ7050', 60),
(141, 7100, 'KKKKKK1-KKKKKK7100', 61),
(142, 7150, 'LLLLLL1-LLLLLL7150', 62),
(143, 7200, 'MMMMMM1-MMMMMM7200', 63),
(144, 7250, 'NNNNNN1-NNNNNN7250', 64),
(145, 7300, 'OOOOOO1-OOOOOO7300', 65),
(146, 7350, 'PPPPPP1-PPPPPP7350', 66),
(147, 7400, 'QQQQQQ1-QQQQQQ7400', 67),
(148, 7450, 'RRRRRR1-RRRRRR7450', 68),
(149, 7500, 'SSSSSS1-SSSSSS7500', 69),
(150, 7550, 'TTTTTT1-TTTTTT7550', 70),
(151, 7600, 'UUUUUU1-UUUUUU7600', 71),
(152, 7650, 'VVVVVV1-VVVVVV7650', 72),
(153, 7700, 'WWWWWW1-WWWWWW7700', 73),
(154, 7750, 'XXXXXX1-XXXXXX7750', 74),
(155, 7800, 'YYYYYY1-YYYYYY7800', 75),
(156, 7850, 'ZZZZZZ1-ZZZZZZ7850', 76),
(157, 7900, 'AAAAAAA1-AAAAAAA7900', 77),
(158, 7950, 'BBBBBBB1-BBBBBBB7950', 78),
(159, 8000, 'CCCCCCC1-CCCCCCC8000', 79),
(160, 8050, 'DDDDDDD1-DDDDDDD8050', 80),
(161, 8100, 'EEEEEEE1-EEEEEEE8100', 81),
(162, 8150, 'FFFFFFF1-FFFFFFF8150', 82),
(163, 8200, 'GGGGGGG1-GGGGGGG8200', 83),
(164, 8250, 'HHHHHHH1-HHHHHHH8250', 84),
(165, 8300, 'IIIIIII1-IIIIIII8300', 85),
(166, 8350, 'JJJJJJJ1-JJJJJJJ8350', 86),
(167, 8400, 'KKKKKKK1-KKKKKKK8400', 87),
(168, 8450, 'LLLLLLL1-LLLLLLL8450', 88),
(169, 8500, 'MMMMMMM1-MMMMMMM8500', 89),
(170, 8550, 'NNNNNNN1-NNNNNNN8550', 90),
(171, 8600, 'OOOOOOO1-OOOOOOO8600', 91),
(172, 8650, 'PPPPPPP1-PPPPPPP8650', 92),
(173, 8700, 'QQQQQQQ1-QQQQQQQ8700', 93),
(174, 8750, 'RRRRRRR1-RRRRRRR8750', 94),
(175, 8800, 'SSSSSSS1-SSSSSSS8800', 95),
(176, 8850, 'TTTTTTT1-TTTTTTT8850', 96),
(177, 8900, 'UUUUUUU1-UUUUUUU8900', 97),
(178, 8950, 'VVVVVVV1-VVVVVVV8950', 98),
(179, 9000, 'WWWWWWW1-WWWWWWW9000', 99),
(180, 9050, 'XXXXXXXX1-XXXXXXXX9050', 100),
(181, 9100, 'YYYYYYY1-YYYYYYY9100', 101),
(182, 9150, 'ZZZZZZZ1-ZZZZZZZ9150', 102),
(183, 9200, 'AAAAAAA1-AAAAAAA9200', 103),
(184, 9250, 'BBBBBBB1-BBBBBBB9250', 104),
(185, 9300, 'CCCCCC1-CCCCCC9300', 105),
(186, 9350, 'DDDDDD1-DDDDDD9350', 106),
(187, 9400, 'EEEEEE1-EEEEEE9400', 107),
(188, 9450, 'FFFFFF1-FFFFFF9450', 108),
(189, 9500, 'GGGGGG1-GGGGGG9500', 109),
(190, 9550, 'HHHHHH1-HHHHHH9550',110);

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
(16, 0, 8, 8),
(17, 1, 9, 1),
(18, 0, 9, 1),
(19, 1, 10, 2),
(20, 0, 10, 2),
(21, 1, 11, 3),
(22, 0, 11, 3),
(23, 1, 12, 4),
(24, 0, 12, 4),
(25, 1, 13, 5),
(26, 0, 13, 5),
(27, 1, 14, 6),
(28, 0, 14, 6),
(29, 1, 15, 7),
(30, 0, 15, 7),
(31, 1, 16, 8),
(32, 0, 16, 8),
(33, 1, 17, 9),
(34, 0, 17, 9),
(35, 1, 18, 10),
(36, 0, 18, 10),
(37, 1, 19, 11),
(38, 0, 19, 11),
(39, 1, 20, 12),
(40, 0, 20, 12),
(41, 1, 21, 13),
(42, 0, 21, 13),
(43, 1, 22, 14),
(44, 0, 22, 14),
(45, 1, 23, 15),
(46, 0, 23, 15),
(47, 1, 24, 16),
(48, 0, 24, 16),
(49, 1, 25, 17),
(50, 0, 25, 17),
(51, 1, 26, 18),
(52, 0, 26, 18),
(53, 1, 27, 19),
(54, 0, 27, 19),
(55, 1, 28, 20),
(56, 0, 28, 20),
(57, 1, 29, 21),
(58, 0, 30, 21),
(59, 1, 31, 22),
(60, 0, 31, 22),
(61, 1, 32, 23),
(62, 0, 32, 23),
(63, 1, 33, 24),
(64, 0, 33, 24),
(65, 1, 34, 25),
(66, 0, 34, 25),
(67, 1, 35, 26),
(68, 0, 35, 26),
(69, 1, 36, 27),
(70, 0, 36, 27),
(71, 1, 37, 28),
(72, 0, 37, 28),
(73, 1, 38, 29),
(74, 0, 38, 29),
(75, 1, 39, 30),
(76, 0, 39, 30),
(77, 1, 40, 31),
(78, 0, 40, 31),
(79, 1, 41, 32),
(80, 0, 41, 32),
(81, 1, 42, 33),
(82, 0, 42, 33),
(83, 1, 43, 34),
(84, 0, 43, 34),
(85, 1, 44, 35),
(86, 0, 44, 35),
(87, 1, 45, 36),
(88, 0, 45, 36),
(89, 1, 46, 37),
(90, 0, 46, 37),
(91, 1, 47, 38),
(92, 0, 47, 38),
(93, 1, 48, 39),
(94, 0, 48, 39);
INSERT INTO ticket (ticket_id, day, showtime, cinema_id, theater_id, seat_id, movie_id, user_id) VALUES 
(1, 'Friday', '7:00 PM', 1, 1, 1, 1, 1),
(2, 'Saturday', '8:00 PM', 2, 2, 3, 2, 2);
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                20,
                7.9,
                '100 min',
                'Animation, Action, Adventure',
                'The Lego Movie',
                '7.7',
                'An ordinary LEGO construction worker, thought to be the prophesied as "special", is recruited to join a quest to stop an evil tyrant from gluing the LEGO universe into eternal stasis.',
                '12:37',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg4MDk1ODExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                21,
                7.3,
                '87 min',
                'Animation, Adventure, Comedy',
                'The Simpsons Movie',
                '7.3',
                'After Homer pollutes the town''s water supply, Springfield is encased in a gigantic dome by the EPA and the Simpsons are declared fugitives.',
                '20:24',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2I0MmE5N2ItMWJkOS00NTU4LTg4ZDctMGJiNDdkM2E4MDU3XkEyXkFqcGdeQXVyMTU2OTg4NjIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                22,
                7.2,
                '122 min',
                'Action, Crime, Drama',
                'El Camino: A Breaking Bad Movie',
                '7.3',
                'Fugitive Jesse Pinkman runs from his captors, the law, and his past.',
                '14:40',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjk4MzVlM2UtZGM0ZC00M2M1LThkMWEtZjUyN2U2ZTc0NmM5XkEyXkFqcGdeQXVyOTAzMTc2MjA@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                23,
                6.4,
                '88 min',
                'Comedy',
                'Scary Movie',
                '6.3',
                'A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer.',
                '09:57',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGEzZjdjMGQtZmYzZC00N2I4LThiY2QtNWY5ZmQ3M2ExZmM4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                24,
                6.9,
                '92 min',
                'Animation, Adventure, Comedy',
                'The Super Mario Bros. Movie',
                '7.0',
                'A plumber named Mario travels through an underground labyrinth with his brother Luigi, trying to save a captured princess.',
                '21:11',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTJhNzlmNzctNTU5Yy00N2YwLThhMjQtZDM0YjEzN2Y0ZjNhXkEyXkFqcGdeQXVyMTEwMTQ4MzU5._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                25,
                5.9,
                '91 min',
                'Animation, Adventure, Comedy',
                'Bee Movie',
                '6.1',
                'Barry B. Benson, a bee just graduated from college, is disillusioned at his lone career choice: making honey. On a special trip outside the hive, Barry''s life is saved by Vanessa, a florist in New York City. As their relationship ...',
                '15:49',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjE1MDYxOTA4MF5BMl5BanBnXkFtZTcwMDE0MDUzMw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                26,
                5.1,
                '83 min',
                'Comedy, Horror',
                'Scary Movie 2',
                '5.3',
                'Four teens are tricked by a professor into visiting a haunted house for a school project.',
                '10:46',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzQxYjU1OTUtYjRiOC00NDg2LWI4MWUtZGU5YzdkYTcwNTBlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                27,
                7.1,
                '104 min',
                'Animation, Action, Adventure',
                'The Lego Batman Movie',
                '7.3',
                'A cooler-than-ever Bruce Wayne must deal with the usual suspects as they plan to rule Gotham City, while discovering that he has accidentally adopted a teenage orphan who wishes to become his sidekick.',
                '11:20',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                28,
                5.4,
                '84 min',
                'Comedy',
                'Scary Movie 3',
                '5.5',
                'Cindy must investigate mysterious crop circles and video tapes, and help the President in preventing an alien invasion.',
                '04:10',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDE2NTIyMjg2OF5BMl5BanBnXkFtZTYwNDEyMTg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                29,
                5.2,
                '83 min',
                'Comedy',
                'Scary Movie 4',
                '5.1',
                'Cindy finds out the house she lives in is haunted by a little boy and goes on a quest to find out who killed him and why. Also, Alien "Tr-iPods" are invading the world and she has to uncover the secret in order to stop them.',
                '05:55',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZmFkMzc2NTctN2U1Ni00MzE5LWJmMzMtYWQ4NjQyY2MzYmM1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                30,
                5.9,
                '89 min',
                'Comedy',
                'Not Another Teen Movie',
                '5.8',
                'A sendup of all the teen movies that have accumulated in the past two decades.',
                '07:37',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNGM1NDA5MDktMWFjZi00MmNkLWJmYTEtMTgwMWFmZTJjMzA4XkEyXkFqcGdeQXVyMTUyOTc1NDYz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                31,
                4.4,
                '94 min',
                'Comedy',
                'Movie 43',
                '4.4',
                'A series of interconnected short films follows a washed-up producer as he pitches insane story lines featuring some of the biggest stars in Hollywood.',
                '08:37',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg4NzQ3NDM1Nl5BMl5BanBnXkFtZTcwNjEzMjM3OA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                32,
                2.5,
                '86 min',
                'Adventure, Comedy, Fantasy',
                'Epic Movie',
                '2.4',
                'A spoof on previous years'' epic movies (The Da Vinci Code (2006), The Chronicles of Narnia: The Lion, the Witch and the Wardrobe (2005) + 20 more), TV series, music videos and celebs. 4 orphans are on an epic adventure.',
                '08:01',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTA3NDM5ODU3NzleQTJeQWpwZ15BbWU3MDgyMjgyNDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                33,
                6.1,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie',
                '6.3',
                'When an island populated by happy, flightless birds is visited by mysterious green pigs, it''s up to three unlikely outcasts to figure out what the pigs are up to.',
                '20:59',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                34,
                8.1,
                '130 min',
                'Animation, Drama',
                'A Silent Voice: The Movie',
                '8.1',
                'A young man is ostracized by his classmates after he bullies a deaf girl to the point where she moves away. Years later, he sets off on a path for redemption.',
                '10:53',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGRkOGMxYTUtZTBhYS00NzI3LWEzMDQtOWRhMmNjNjJjMzM4XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                35,
                7.1,
                '87 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob SquarePants Movie',
                '7.2',
                'SpongeBob takes leave from Bikini Bottom in order to track down, with Patrick, King Neptune''s stolen crown.',
                '08:50',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjM5YjI0NmQtOTk4OS00NTNiLThkNzQtNTZlNGE4Y2VmNmU3XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                36,
                6.7,
                '85 min',
                'Documentary, Action, Comedy',
                'Jackass: The Movie',
                '6.6',
                'Johnny Knoxville and his band of maniacs perform a variety of stunts and gross-out gags on the big screen for the first time.',
                '07:56',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTgwMmU0YzktOGNhNi00MDcyLTg1OGEtZGQwM2RlMTAyYzhlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                37,
                1.8,
                '87 min',
                'Comedy, Sci-Fi',
                'Disaster Movie',
                '1.9',
                'Over the course of one evening, an unsuspecting group of twenty-somethings find themselves bombarded by a series of natural disasters and catastrophic events.',
                '18:42',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTIzMDQyNDgwNl5BMl5BanBnXkFtZTcwMDA0MTc3MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                38,
                5.2,
                '80 min',
                'Adventure, Comedy, Family',
                'Garfield: The Movie',
                '5.0',
                'Jon Arbuckle buys a second pet, a dog named Odie. However, Odie is then abducted and it is up to Jon''s cat, Garfield, to find and rescue the canine.',
                '11:42',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTIzMTc1OTUxOV5BMl5BanBnXkFtZTYwNTMxODc3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                39,
                3.6,
                '86 min',
                'Comedy',
                'Scary Movie V',
                '3.5',
                'A couple begin to experience some unusual activity after bringing their lost nieces and nephew home. With the help of home-surveillance cameras, they learn they''re being stalked by a nefarious demon.',
                '03:19',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc5OTIxMjQ4NF5BMl5BanBnXkFtZTcwOTAyNDcyOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                40,
                6.4,
                '107 min',
                'Animation, Action, Adventure',
                'The Lego Movie 2: The Second Part',
                '6.5',
                'It''s been five years since everything was awesome and the citizens are facing the huge new threat of Lego Duplo, invaders from outer space, wrecking everything faster than they can rebuild.',
                '15:38',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkyOTkwNDc1N15BMl5BanBnXkFtZTgwNzkyMzk3NjM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                41,
                4.6,
                '75 min',
                'Action, Comedy, Sci-Fi',
                'Superhero Movie',
                '4.7',
                'Orphaned high school student Rick Riker is bitten by a radioactive dragonfly, develops super powers (except for the ability to fly), and becomes a hero.',
                '20:49',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc0Njc1MTU5Nl5BMl5BanBnXkFtZTcwMjA4NDE2MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                42,
                8.1,
                '117 min',
                'Animation, Action, Adventure',
                'Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train',
                '8.2',
                'After his family was brutally murdered and his sister turned into a demon, Tanjiro Kamado''s journey as a demon slayer began. Tanjiro and his comrades embark on a new mission aboard the Mugen Train, on track to despair.',
                '01:24',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODI2NjdlYWItMTE1ZC00YzI2LTlhZGQtNzE3NzA4MWM0ODYzXkEyXkFqcGdeQXVyNjU1OTg4OTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                43,
                3.3,
                '86 min',
                'Animation, Adventure, Comedy',
                'The Emoji Movie',
                '3.4',
                'Gene, a multi-expressional emoji, sets out on a journey to become a normal emoji.',
                '08:02',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkzMzM3OTM2Ml5BMl5BanBnXkFtZTgwMDM0NDU3MjI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                44,
                6.9,
                '78 min',
                'Animation, Adventure, Comedy',
                'A Goofy Movie',
                '6.9',
                'When Max makes a preposterous promise to a girl he has a crush on, his chances to fulfilling it seem hopeless when he is dragged onto a cross-country trip with his embarrassing father, Goofy.',
                '11:39',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDczYjU4MDMtY2RjMy00Y2UyLWE2MmMtZjliYWUwNzQ3YjExXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                45,
                2.6,
                '83 min',
                'Comedy, Romance',
                'Date Movie',
                '2.8',
                'Spoof of romantic comedies which focuses on a man, his crush, his parents, and her father.',
                '00:40',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjA0NGUyMDQtY2RlNy00Y2YzLWIyODItNWE1ZTM1NTM3MWM1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                46,
                5.9,
                '92 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge Out of Water',
                '6.0',
                'When a diabolical pirate above the sea steals the secret Krabby Patty formula, SpongeBob and his friends team up in order to get it back.',
                '23:56',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGEzNGRjYzYtNmRjNy00ZTI0LTgwOTYtOTViMGM0MWUwMzQ5XkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                47,
                7.9,
                '115 min',
                'Animation, Action, Crime',
                'Cowboy Bebop: The Movie',
                '7.8',
                'A terrorist explosion releases a deadly virus on the masses, and it''s up to the bounty-hunting Bebop crew to catch the cold-blooded culprit.',
                '13:30',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTE5YTAyZDctNjFhYi00YmJhLTg4ZGUtNDk1OTE0ZTY4NTYwL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                48,
                7.1,
                '88 min',
                'Animation, Adventure, Comedy',
                'The Peanuts Movie',
                '7.0',
                'Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their archnemesis, while his best pal Charlie Brown begins his own epic quest back home to win the love of his life.',
                '00:23',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTE5NzMxNzkwNl5BMl5BanBnXkFtZTgwOTQ0Nzk5NzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                49,
                6.5,
                '96 min',
                'Animation, Action, Adventure',
                'Pokémon: The First Movie - Mewtwo Strikes Back',
                '6.3',
                'Scientists genetically create a new Pokémon, Mewtwo, but the results are horrific and disastrous.',
                '03:33',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGM3MjQ3NTQtNzRiZi00MDUzLWFjYjEtZWJjMjUwYzExYjRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                50,
                4.7,
                '102 min',
                'Comedy, Drama, Family',
                'Hannah Montana: The Movie',
                '4.7',
                'As Hannah Montana''s popularity begins to take over her life, Miley Stewart, on the urging from her father takes a trip to her hometown of Crowley Corners, Tennessee to get some perspective on what matters in life the most.',
                '19:05',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkxNjUxODY3NF5BMl5BanBnXkFtZTcwMjQyMzMzMg@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                51,
                7.3,
                '85 min',
                'Animation, Adventure, Comedy',
                'Shaun the Sheep Movie',
                '7.3',
                'When Shaun decides to take the day off and have some fun, he gets a little more action than he bargained for. A mix up with the Farmer, a caravan and a very steep hill lead them all to the Big City and it''s up to Shaun and the flo...',
                '18:02',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOTc1ODY5MTQ1Nl5BMl5BanBnXkFtZTgwMDM5ODI1NjE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                52,
                5.3,
                '94 min',
                'Adventure, Comedy, Family',
                'The Lizzie McGuire Movie',
                '5.5',
                'Lizzie McGuire has graduated from middle school and takes a trip to Rome, Italy with her class. And what was supposed to be only a normal trip, becomes a teenager''s dream come true.',
                '16:43',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjg4Y2IxZmEtNmIwNy00ODBlLWFkOWEtNGE1MjdmZmMxMzJjXkEyXkFqcGdeQXVyNzI2ODAwMzM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                53,
                7.2,
                '84 min',
                'Animation, Action, Adventure',
                'The Transformers: The Movie',
                '7.2',
                'The Autobots must stop a colossal planet consuming robot who goes after the Autobot Matrix of Leadership. At the same time, they must defend themselves against an all-out attack from the Decepticons.',
                '23:45',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGM1MGY4OTYtOGZkOC00NjYyLTk3OTMtODUyZDdhYWQ3NGFjXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                54,
                6.6,
                '101 min',
                'Horror, Sci-Fi',
                'Twilight Zone: The Movie',
                '6.4',
                'Four horror and science fiction segments, directed by four famous directors, each of them being a new version of a classic story from Rod Serling''s landmark television series.',
                '02:37',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjQ2NzgzYjEtMzAxNy00MzhkLWE5ZTUtZDA1ODY3MTBjOTRiXkEyXkFqcGdeQXVyNTAyNDQ2NjI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                55,
                7.8,
                '95 min',
                'Adventure, Comedy, Family',
                'The Muppet Movie',
                '7.6',
                'Kermit and his newfound friends trek across America to find success in Hollywood, but a frog legs merchant is after Kermit.',
                '17:20',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDhhMzMyNGQtYzVhYS00Mjg0LTgyZDEtZDJlZGFkZjViMDYxXkEyXkFqcGc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                56,
                5.9,
                '82 min',
                'Comedy',
                'Between Two Ferns: The Movie',
                '6.1',
                'Zach Galifianakis and his oddball crew take a road trip to complete a series of high-profile celebrity interviews.',
                '13:03',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzgyNzUyZjAtNDRiZS00MjQwLTgzMzQtZThhY2Y3YjFmYTc1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                57,
                6.3,
                '97 min',
                'Animation, Action, Adventure',
                'The Angry Birds Movie 2',
                '6.4',
                'The flightless birds and scheming green pigs take their feud to the next level.',
                '08:55',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzdkNGJhNzQtMjY1OC00MDI3LTk0ZDUtNzU0MGZiY2YwZGUxXkEyXkFqcGdeQXVyNzMxNjQxMTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                58,
                6.3,
                '105 min',
                'Action, Adventure, Comedy',
                'Batman: The Movie',
                '6.5',
                'The Dynamic Duo faces four supervillains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people.',
                '01:03',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZTAxNWNmMTEtNGNmNi00MWU4LWI0NmItMjM3Y2Q3YTUyZTg2XkEyXkFqcGdeQXVyNjc5NjEzNA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                59,
                6.4,
                '89 min',
                'Animation, Action, Adventure',
                'Captain Underpants: The First Epic Movie',
                '6.2',
                'Two overly imaginative pranksters named George and Harold hypnotize their grumpy principal into thinking he''s a ridiculously enthusiastic, incredibly dimwitted superhero named Captain Underpants.',
                '22:36',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMmQwMzdiOGMtNGZiYS00YjgyLWJlMjItYzQ3Nzc2OGIwYjQwXkEyXkFqcGdeQXVyMzQ1MTM3NjY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                60,
                6.2,
                '101 min',
                'Animation, Action, Adventure',
                'The Lego Ninjago Movie',
                '6.0',
                'Shunned by everyone for being the son of an evil warlord, a teenager seeks to defeat him with the help of his fellow ninjas.',
                '11:44',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDI3MDljMTQtYzBiYS00NDk2LTlhYzUtYmM0NWIyMmZkMDZkXkEyXkFqcGdeQXVyNjk5NDA3OTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                61,
                6.7,
                '74 min',
                'Animation, Adventure, Comedy',
                'DuckTales the Movie: Treasure of the Lost Lamp',
                '6.8',
                'Scrooge McDuck takes Huey, Dewey, and Louie to Egypt to find a pyramid and magic lamp.',
                '12:02',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGY1NjdiMmItMmE5MS00NjllLWJmM2ItMmU1ZTRjMWYyZjc4XkEyXkFqcGdeQXVyMjA0MDQ0Mjc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                62,
                8.5,
                '68 min',
                'Documentary',
                'Man with a Movie Camera',
                '8.3',
                'A man travels around a city with a camera slung over his shoulder, documenting urban life with dazzling invention.',
                '04:25',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYTc3NGVlN2QtYWJlZi00YjhjLThiZjctZDA1MmE1NGI4ZmE4XkEyXkFqcGdeQXVyODQyNDU4OTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                63,
                7.5,
                '110 min',
                'Drama, Western',
                'Deadwood: The Movie',
                '7.3',
                'As the residents of Deadwood gather to commemorate Dakota''s statehood in 1889, saloon owner Al Swearengen and Marshal Seth Bullock clash with Senator George Hearst.',
                '12:13',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2Y1OGQ4ZjEtZWUzMi00MzZmLTk3MmEtMThiNjIwNzg4MjRkXkEyXkFqcGdeQXVyMTE5NDkxMA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                64,
                6.2,
                '90 min',
                'Comedy',
                'The Brady Bunch Movie',
                '6.2',
                'The original 1970s TV family is now placed in the 1990s, where they''re even more square and out of place than ever.',
                '02:05',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNmVmYzkzY2YtZWNkNC00YzVhLTk4MzYtZWMxZWQ0YzBhZmYzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                65,
                6.0,
                '99 min',
                'Animation, Action, Adventure',
                'Pokémon the Movie 2000',
                '6.1',
                'Ash Ketchum must gather the three spheres of fire, ice and lightning in order to restore balance to the Orange Islands.',
                '05:55',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzE1NjBiODAtNDVhNS00ZTI1LTg4ZjUtZTk3OWVhODljMjNjXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                66,
                5.7,
                '91 min',
                'Animation, Adventure, Comedy',
                'The SpongeBob Movie: Sponge on the Run',
                '5.9',
                'After SpongeBob''s beloved pet snail Gary is snail-napped, he and Patrick embark on an epic adventure to the Lost City of Atlantic City to bring Gary home.',
                '22:55',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDMzYzM3MGMtZWFlZC00ODI5LTg5YjgtODI2NzI3ZTZmMGQ4XkEyXkFqcGdeQXVyMTA1NjE5MTAz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                67,
                7.1,
                '102 min',
                'Animation, Adventure, Comedy',
                'The Bob''s Burgers Movie',
                '7.0',
                'When a sinkhole in front of Bob''s Burgers threatens the Belchers'' plans for a successful summer, Bob and Linda try to keep their business going, while the kids attempt to save the restaurant by solving a mystery.',
                '16:31',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzFhNDNkY2UtYjc3ZS00NzVkLTlhNzEtYmZiZGMzYmRjMjVhXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                68,
                7.6,
                '103 min',
                'Documentary, Drama',
                'Indie Game: The Movie',
                '7.6',
                'A documentary that follows the journeys of indie game developers as they create games and release those works, and themselves, to the world.',
                '03:04',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjA5NTUzMjQ1MV5BMl5BanBnXkFtZTcwMzc1MzQ4Nw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                69,
                6.0,
                '94 min',
                'Action, Adventure, Comedy',
                'Wizards of Waverly Place: The Movie',
                '6.2',
                'A young wizard conjures a spell that puts her family in jeopardy.',
                '09:03',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDM0MTRjZjUtZjM2Ni00MzgzLTgxYmYtMGZiNDJmMzdhYTlhXkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                70,
                5.7,
                '79 min',
                'Animation, Adventure, Comedy',
                'The Rugrats Movie',
                '5.9',
                'The babies gets lost in the forest after Tommy Pickles gets a new baby brother.',
                '17:52',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjNiMWE1M2ItMTdlNi00NmZiLWEwYzctODJiMjU1MmY0MTlmL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                71,
                6.3,
                '77 min',
                'Animation, Adventure, Comedy',
                'The Tigger Movie',
                '6.3',
                'Tigger goes looking through the hundred-acre-wood to find his family.',
                '23:42',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTE5NDIyODU4M15BMl5BanBnXkFtZTYwODA5MzY2._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                72,
                6.4,
                '83 min',
                'Comedy',
                'The Kentucky Fried Movie',
                '6.4',
                'The daily programming of a fictional local TV channel presented as a series of highly irreverent skits.',
                '02:24',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGRjZTJiMjYtNjkyZS00NTgwLWI3ODAtMDRlODdkMjQ2YjY3XkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                73,
                6.3,
                '93 min',
                'Comedy, Fantasy, Horror',
                'Tales from the Darkside: The Movie',
                '6.2',
                'To stall a witch plotting to eat him, a boy reads her horror tales dealing with a collegian''s resurrection of a mummy, a murderous cat, and an artist''s pact with a gargoyle.',
                '05:02',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODI4ZTI1ZjMtYmE5MC00NTM5LTgwMDgtNWI1ZTI1MDYyOGYyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                74,
                7.8,
                '107 min',
                'Documentary, Comedy',
                'American Movie',
                '7.8',
                'Documentary about an aspiring filmmaker''s attempts to finance his dream project by finally completing the low-budget horror film he abandoned years before.',
                '01:59',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjMxMDFhYzQtZDZmZS00ZDBjLWIzY2QtNDBiMDQ5YjBlNTk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                75,
                7.3,
                '73 min',
                'Comedy, Drama, Fantasy',
                'Mystery Science Theater 3000: The Movie',
                '7.2',
                'Mike Nelson and his robot companions watch and give their comments about This Island Earth (1955).',
                '07:08',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzNmN2UzNTAtNmZkMS00MmI3LThhNzEtNjI1YjJlN2JiZjU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                76,
                6.5,
                '87 min',
                'Comedy',
                'Silent Movie',
                '6.7',
                'A film director and his strange friends struggle to produce the first major silent feature film in forty years.',
                '23:54',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZWFkMmJhODItMDA2MC00NDFmLTllNzItYzE1YWMzYjVmYjFiXkEyXkFqcGdeQXVyNjQzNDI3NzY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                77,
                7.5,
                '112 min',
                'Animation, Action, Adventure',
                'The Last: Naruto the Movie',
                '7.6',
                'Hinata Hyuga''s younger sister has been kidnapped, so Naruto must do what he can to save her.',
                '02:40',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjk1NzA4Njg4Ml5BMl5BanBnXkFtZTgwMDgxODQ5MzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                78,
                6.3,
                '86 min',
                'Comedy',
                'The Onion Movie',
                '6.2',
                'Satirical interpretations of world events and curious human behavior.',
                '00:08',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDdkMDUxMmUtNWQ1Yi00OWY3LWI2ZDktOTBmNzVkMTAwODM5XkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                79,
                6.7,
                '86 min',
                'Animation, Adventure, Comedy',
                'A Shaun the Sheep Movie: Farmageddon',
                '6.8',
                'When an alien with amazing powers crash-lands near Mossy Bottom Farm, Shaun the Sheep goes on a mission to shepherd the intergalactic visitor home before a sinister organization can capture her.',
                '02:50',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2MyNjhmYzMtNDYxYi00MjBkLWI0NDYtNDFhOWY3MTY2YmIyXkEyXkFqcGdeQXVyNjU1NDM1MjQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                80,
                8.1,
                '95 min',
                'Documentary, Biography',
                'Still: A Michael J. Fox Movie',
                '8.1',
                'Follows the life of beloved actor and advocate Michael J. Fox, exploring his personal and professional triumphs and travails, and what happens when an incurable optimist confronts an incurable disease.',
                '22:01',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNGFmYmUyMDUtNjk1MS00ZDMzLWEyMmUtM2I4YzhhZjRiYjk2XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                81,
                6.0,
                '93 min',
                'Animation, Action, Adventure',
                'Pokémon 3 the Movie: Spell of the Unown',
                '5.8',
                'In the town of Greenfield, a young, lonely girl''s dreams and wishes are brought into reality by a collective of reality-warping Pokémon.',
                '13:55',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTk0NzM3MDY1OV5BMl5BanBnXkFtZTYwNTkwODc5._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                82,
                6.7,
                '90 min',
                'Documentary, Comedy',
                'The Greatest Movie Ever Sold',
                '6.6',
                'A documentary about branding, advertising and product placement that is financed and made possible by brands, advertising and product placement.',
                '18:21',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTM5NzQxOTQwNV5BMl5BanBnXkFtZTcwNDAwODM2NA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                83,
                5.9,
                '99 min',
                'Comedy, Crime',
                'Cheech and Chong''s Next Movie',
                '6.0',
                'Cheech and Chong live in a decrepit old house and drive their neighbour crazy with their loud music, weed smoking and general anarchy and slacker view on life. Then Chong meets Cheech''s Texan cousin Red and things kick up a notch.',
                '20:09',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDc5ZWE2ZTMtMzFhNy00NDEyLWEyYjEtNmEyZDUzYmY3OWIyXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                84,
                5.5,
                '141 min',
                'Action, Drama, Fantasy',
                'Teen Wolf: The Movie',
                '5.5',
                'A terrifying evil has emerged. The wolves howl once again, but only a Werewolf like Scott McCall, can gather both new allies and reunite trusted friends to fight back against what could be the most powerful and deadliest enemy.',
                '20:12',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYWYyZWU5NzctYjY4Zi00MzYyLTgxZTMtZjBmYWE2NGMwYTllXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                85,
                6.5,
                '86 min',
                'Animation, Action, Adventure',
                'Aqua Teen Hunger Force Colon Movie Film for Theaters',
                '6.7',
                'An action epic that explores the origins of Master Shake, Frylock, and Meatwad, better known as the Aqua Teen Hunger Force, who somehow become pitted in a battle over an immortal piece of exercise equipment.',
                '17:25',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc0OTQwNzYyNF5BMl5BanBnXkFtZTcwMDc5NTM0MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                86,
                5.7,
                '110 min',
                'Comedy, Family, Fantasy',
                'Teen Beach Movie',
                '5.9',
                'Two surfing lovers, whose doomed relationship is nearing to a close, find themselves swept into a dimension-traversing wave that sends them into a beach movie musical in the 60''s.',
                '21:04',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDFjYjdlODItN2MzMC00YzgxLWJiMDktOTI3MGQyOGY2YmQxXkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                87,
                7.2,
                '78 min',
                'Animation, Action, Adventure',
                'Phineas and Ferb the Movie: Across the 2nd Dimension',
                '7.4',
                'Phineas and Ferb discover that Perry is a secret agent, and they all get stuck in an alternate dimension where Doofenschmirtz is the ruler of the tri-state area.',
                '01:46',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2M4YTE0YWYtNDIxZC00MmQyLThhYjgtYTNjMTJhZjU2NzM0XkEyXkFqcGdeQXVyMTIwMjY0NjQz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                88,
                7.3,
                '95 min',
                'Comedy, Crime',
                'Trailer Park Boys: The Movie',
                '7.1',
                'Ricky, Julian, and Bubbles come up with a scheme to steal large amounts of untraceable coins.',
                '22:39',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTY5Mzg4MDM1M15BMl5BanBnXkFtZTcwNTk4MzkzMQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                89,
                6.4,
                '99 min',
                'Documentary',
                'My Scientology Movie',
                '6.6',
                'Louis Theroux documents his investigation into what goes on behind the scenes of the infamous Church of Scientology.',
                '23:30',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTQ5NTI2NDc3NF5BMl5BanBnXkFtZTgwNDA3ODk2MTI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                90,
                5.5,
                '91 min',
                'Comedy, Crime',
                'Absolutely Fabulous: The Movie',
                '5.4',
                'After attracting both media and police attention for accidentally knocking Kate Moss into the River Thames, Edina and Patsy hide out in the south of France.',
                '04:01',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjI4NDI5MDg2OV5BMl5BanBnXkFtZTgwNzA5ODQ3ODE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                91,
                7.3,
                '88 min',
                'Comedy, Crime, Mystery',
                'Psych: The Movie',
                '7.3',
                'The old gang comes together during the holidays after a mystery assailant targets one of their own.',
                '07:52',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjE2Mzk5NGItMTEzMi00MmYxLWFlNjEtNGFmZGViNzQ2ZWFkXkEyXkFqcGdeQXVyMjM5NzU3OTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                92,
                7.9,
                '95 min',
                'Animation, Action, Adventure',
                'Boruto: Naruto the Movie',
                '7.8',
                'It''s been some years since the end of the Shinobi War. Naruto Uzumaki is the 7th Hokage of Konohagakure, in this new era. His son, Boruto Uzumaki, will soon enter the Chûnin exams, alongside Sarada Uchiha and the mysterious Mitsuki.',
                '20:28',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDIwYjg5YzItZTJmMC00YjJhLWFiNjYtMDU5MmQxOTQxODM2XkEyXkFqcGdeQXVyMjc2Nzg5OTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                93,
                7.4,
                '105 min',
                'Animation, Action, Adventure',
                'Fullmetal Alchemist the Movie: Conqueror of Shamballa',
                '7.3',
                'Edward Elric, an alchemist from an alternate world, races to prevent the Thule Society from harnessing alchemy to wage war on his home.',
                '14:54',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOWZmYWRmYTUtMDFhMS00OTJiLTkwYTgtY2VkNjgxMmI3YzJkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                94,
                5.6,
                '84 min',
                'Animation, Adventure, Comedy',
                'Tom and Jerry: The Movie',
                '5.4',
                'Cat and mouse duo Tom and Jerry reluctantly work together to save a young girl from her evil aunt.',
                '16:38',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzkwYjU2NDctODBhYS00ZjUwLThlODktOGQ5MzExOTM5ZTVhXkEyXkFqcGdeQXVyMTA1NjE5MTAz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                95,
                6.7,
                '72 min',
                'Animation, Action, Adventure, Sci-Fi',
                'Ultimate Avengers: The Movie',
                '6.7',
                'To confront an alien menace, General Fury assembles a team of superheroes lead by a recently resuscitated Captain America.',
                '07:01',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTYyMjk0NTMwMl5BMl5BanBnXkFtZTgwNzY0NjAwNzE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                96,
                3.7,
                '86 min',
                'Comedy',
                'Extreme Movie',
                '3.7',
                'A sketch-comedy movie about the joys and embarrassments of teen sex. But mostly the embarrassments.',
                '21:18',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDAzNzQ4MDEtOGViNi00YjliLTlkMmItNjc0YWRhZGJhMDJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                97,
                6.6,
                '73 min',
                'Animation, Action, Adventure',
                'The Powerpuff Girls Movie',
                '6.5',
                'After destroying the city of Townsville in a game of tag, a trio of super-powered little girls must redeem themselves by stopping a vengeful monkey''s plot for world domination.',
                '08:17',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNDE2ZWIyZmItYjNlZC00NmQ4LWIyMjQtMDJiM2JmYWMyOWQzXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                98,
                5.3,
                '93 min',
                'Comedy',
                'Tim and Eric''s Billion Dollar Movie',
                '5.3',
                'Two guys get a billion dollars to make a movie, only to watch their dream run off course. In order to make the money back, they then attempt to revitalize a failing shopping mall.',
                '20:57',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTU0NTQ5NDYwMV5BMl5BanBnXkFtZTcwNjUzNzUxNw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                99,
                6.5,
                '79 min',
                'Animation, Comedy, Family, Sport',
                'An Extremely Goofy Movie',
                '6.4',
                'Max goes to college, but to his embarassment his father loses his job and goes to his son''s campus.',
                '07:31',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTJkNmQ1ODItNTJhOS00NWRhLTg0NjAtYjZlNWYxZWJmNTY4XkEyXkFqcGdeQXVyOTg4MDk3MTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                100,
                6.3,
                '89 min',
                'Adventure, Drama, Sci-Fi',
                'Doctor Who: The Movie',
                '6.3',
                'The newly-regenerated Doctor takes on the Master on the turn of the millennium, 31 December 1999.',
                '05:00',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDFiMGU1MmQtMTg0Ny00ZmQ4LTkyMWMtYjVlZGRmMWY5ZDliXkEyXkFqcGdeQXVyMTA0MTI2ODE4._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                101,
                8.1,
                '140 min',
                'Animation, Drama, Fantasy',
                'Violet Evergarden: The Movie',
                '8.3',
                'After the aftermath of a war, a young girl who was used as a ''tool'' for war learned to live. With the scars of burns, she goes back to her past to feel the true feelings of the Major''s, "I love you."',
                '14:49',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYTJmNzc5YTEtNTBmNy00YmUxLWFlNzktYjZjMTg3OGY3ZDhkXkEyXkFqcGdeQXVyMzUzMzgxNA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                102,
                4.3,
                '96 min',
                'Action, Drama, Fantasy',
                'Left Behind: The Movie',
                '4.3',
                'The Biblical prophecy of Armegeddon begins when the Rapture instantly takes all believers in Christ from the Earth. A reporter left behind learns that the Anti-Christ will soon take power.',
                '19:36',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGU3MmMxOWYtZmNhNi00ZjczLWJkYmEtMjJjZjBiZDRiYmZmXkEyXkFqcGdeQXVyMTY5Nzc4MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                103,
                2.6,
                '77 min',
                'Comedy',
                'It''s Pat: The Movie',
                '2.8',
                'The comedic misadventures of a person of indeterminate gender.',
                '16:25',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2VhMjI0NDQtZWRjMS00ZWY4LTk2MmItZTY4MzE4M2ZmOTQ3L2ltYWdlXkEyXkFqcGdeQXVyNjE5MjUyOTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                104,
                9.7,
                '25 min',
                'Action, Comedy',
                'Threat Level Midnight: The Movie',
                '9.6',
                'After secret agent Michael Scarn (Steve Carell) is forced into retirement after the death of his wife Catherine Zeta-Scarn, the President of the United States of America (Craig Robinson) requests that he prevents Goldenface (John ...',
                '10:52',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjMzNzE4ZGItMDI5Zi00ZjE3LThkODctYTlhZWY1ZTdmMGNjXkEyXkFqcGdeQXVyOTExNzM4NDM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                105,
                9.5,
                '164 min',
                'Comedy',
                'Uno: The Movie',
                '9.5',
                'What had started as a simple game of UNO! turned into a psychological horror. Coworkers are driven to the edge of madness as they commit to a game of Uno.',
                '19:27',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BN2YyNmMzZmQtYjg1MS00OTEwLTkwZDEtOWNlMTEzOWIzMWM3L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzQwNDg4MQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                106,
                3.8,
                '99 min',
                'Action, Adventure, Family',
                'Turbo: A Power Rangers Movie',
                '3.6',
                'A space alien is threatening to bring destruction on Earth, and the Power Rangers are enhanced with turbo powers in order to prevent her plan.',
                '05:20',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzAxMDA0MGUtMWJjYy00YWNlLTk1NmEtNTM5Y2FjYjMzNjM5XkEyXkFqcGdeQXVyNDAxNjkxNjQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                107,
                7.4,
                '102 min',
                'Animation, Action, Adventure',
                'Street Fighter II: The Animated Movie',
                '7.2',
                'A crime boss searching for the world''s best fighters pursues a talented Japanese drifter and his American ex-classmate, while an Interpol agent and a US Army captain seek to bring him down.',
                '05:45',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzY4OWMzZDUtNDE4Ny00MzJhLWFhN2YtNTA1Mjc1MWE4MTE4XkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                108,
                7.9,
                '64 min',
                'Animation, Action, Adventure',
                'The Batman Superman Movie: World''s Finest',
                '7.7',
                'Joker goes to Metropolis with an offer and plan to kill Superman for Lex Luthor while Batman pursues the clown to Superman''s turf.',
                '09:55',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZTQ3YWJhODMtYTdmNC00MmZiLThhOWYtM2UxZDBjNjRlY2EwXkEyXkFqcGdeQXVyMjI4OTg3MTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                109,
                6.0,
                '101 min',
                'Animation, Adventure, Comedy',
                'The Garfield Movie',
                '5.8',
                'After Garfield''s unexpected reunion with his long-lost father, ragged alley cat Vic, he and his canine friend Odie are forced from their perfectly pampered lives to join Vic on a risky heist.',
                '09:23',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDdlNTIwNjYtNzVhNS00MGVmLTk1ZGYtZmZiMjhiMmQ1ZjkwXkEyXkFqcGdeQXVyMTY3ODkyNDkz._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                110,
                8.0,
                '90 min',
                'Animation, Mystery, Sci-Fi',
                'Steins;Gate: The Movie - Load Region of Déjà Vu',
                '7.8',
                'After the events of the anime, Rintarou begins to feel the repercussions of extensive time travel, and eventually completely fades from reality. Kurisu, being the only companion to remember him, now must find a way to bring him back.',
                '20:59',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGJlNDM3ZjktOTNiNy00YmNmLWJlOGYtNDM4MTI2ZjRjOTNmXkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                111,
                6.6,
                '100 min',
                'Crime, Drama, Thriller',
                'Ray Donovan: The Movie',
                '6.8',
                'A showdown decades in the making brings the Donovan family legacy full circle as they find themselves drawn back to Boston. Struggling to overcome their violent upbringing, their fierce love for each other keeps them in the fight.',
                '07:07',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMThkMTBiMDItZGVhOC00MWJkLThlZjgtNmJiMTA0NjFjMDgyXkEyXkFqcGdeQXVyOTA3MTMyOTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                112,
                4.8,
                '92 min',
                'Comedy, Romance',
                'Another Gay Movie',
                '5.0',
                'Four gay high school friends make a pact to lose their virginity before they go to college.',
                '12:29',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTYzMTIzNDI3MV5BMl5BanBnXkFtZTgwNDQwMjMxMTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                113,
                7.3,
                '90 min',
                'Animation, Action, Fantasy',
                'Constantine: City of Demons - The Movie',
                '7.3',
                'A decade after a tragic mistake, Chas Chandler and occult investigator John Constantine set out to cure Chas''s daughter, Trish, from a demonically induced coma.',
                '18:38',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjM3M2EzYzAtYzcxYi00MWU2LWFhNmItNGJiZjMyZTUyNTQyXkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                114,
                7.5,
                '82 min',
                'Animation, Action, Adventure',
                'Steven Universe: The Movie',
                '7.7',
                'Steven thinks his time defending the Earth is over, but when a new threat comes to Beach City, Steven faces his biggest challenge yet.',
                '16:13',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYmVjY2U1N2UtMmZhOC00ODc5LWE1MjktODZjMmQyZmUyZWYwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                115,
                4.8,
                '90 min',
                'Animation, Action, Adventure',
                'Yu-Gi-Oh!: The Movie - Pyramid of Light',
                '5.0',
                'Underneath the sands of Egypt, Anubis, an ancient evil spirit, has awakened. It''s up to Yugi, who defeated Anubis centuries ago, to use his skill and determination to rid the world of evil once again.',
                '06:36',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTQ4NzM0NTAyMF5BMl5BanBnXkFtZTYwOTc2MTg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                116,
                7.1,
                '119 min',
                'Animation, Action, Adventure',
                'Sword Art Online the Movie: Ordinal Scale',
                '7.3',
                'Kirito uncovers a conspiracy within Ordinal Scale, a popular AR game developed for a new system called The Augma.',
                '09:07',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGE4M2M2OTYtZDgwMy00NGYwLWE0YTYtYzkyMDFjYWFhN2QzXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                117,
                2.2,
                '81 min',
                'Adventure, Comedy, Family',
                'Fred: The Movie',
                '2.1',
                'Lovestruck, awkward teen Fred Figglehorn makes desperate attempts to make Judy fall in love with him - while also dodging the mischievous Kevin.',
                '07:45',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BOGFhMDc5NjYtODI4Ny00M2FmLTk3YmUtMTQwZDFlYmRiNDI1XkEyXkFqcGdeQXVyODIxNjk4NzQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                118,
                6.2,
                '75 min',
                'Animation, Adventure, Comedy',
                'Piglet''s Big Movie',
                '6.1',
                'When Piglet comes up missing his Hundred Acre Wood friends use Piglet''s own Book of Memories to find him, discovering along the way just how big a role he''s played in their lives.',
                '15:05',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc5MzE2ODAyOF5BMl5BanBnXkFtZTYwNTcwNDg3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                119,
                6.9,
                '97 min',
                'Comedy, Crime, Mystery',
                'Mr. Monk''s Last Case: A Monk Movie',
                '6.7',
                'Monk, a brilliant detective with obsessive-compulsive disorder, returns to solve one last case involving his stepdaughter Molly, a journalist preparing for her wedding.',
                '23:14',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzBlNjU2ZmYtM2ZjZi00ZmMzLWI4NzUtNjE1ZTVkODExNjI3XkEyXkFqcGdeQXVyMTU5OTc2NTk@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                120,
                6.4,
                '60 min',
                'Animation, Adventure, Comedy, Family, Sci-Fi',
                'Stitch! The Movie',
                '6.2',
                'Stitch, an alien living on Earth disguised as a dog with his human family, continues his adventures when he discovers that the alien family he never knew he had is now in Hawaii, being hunted down by galactic forces.',
                '07:19',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjE4NzAwMjIyMl5BMl5BanBnXkFtZTcwNjYwMjAwMQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                121,
                6.9,
                '51 min',
                'Animation, Action, Adventure',
                'One Piece: The Movie',
                '6.9',
                'There once was a pirate known as the Great Gold Pirate Woonan, who obtained almost 1/3 of the world''s gold. Over the course of a few years, the pirate''s existence faded, and a legend grew that he disappeared with his gold to a rem...',
                '15:56',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNGU4YzAxOTQtOTk5Yi00MGI3LThiMDMtMzZhMmEwNDBlN2E3XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                122,
                2.8,
                '100 min',
                'Adventure, Comedy, Family',
                'The Garbage Pail Kids Movie',
                '2.7',
                'Dodger must confront the struggles of life as he is visited by the Garbage Pail Kids and intimidated by some older bullies.',
                '19:23',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2JlNThhYTYtZDM0My00OTQwLWEzMjctOTA3NWU2ZmE5ZTJmXkEyXkFqcGdeQXVyNjMwMjk0MTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                123,
                7.0,
                '93 min',
                'Documentary, Comedy',
                'Best Worst Movie',
                '7.2',
                'A look at the making of the film Troll 2 (1990) and its journey from being crowned the "worst film of all time" to a cherished cult classic.',
                '06:24',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTQ1NjE1MjYzNF5BMl5BanBnXkFtZTcwMDU0MDczMw@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                124,
                6.2,
                '68 min',
                'Animation, Adventure, Comedy',
                'Pooh''s Heffalump Movie',
                '6.4',
                'When Roo sets off on his own into the Hundred Acre Wood, he discovers a friendly and playful Heffalump named Lumpy.',
                '10:23',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTUyOTk5MDM4N15BMl5BanBnXkFtZTcwMTM0NDcyMQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                125,
                6.0,
                '86 min',
                'Animation, Action, Adventure',
                'PAW Patrol: The Movie',
                '6.1',
                'Ryder and the PAW Patrol pups are called to Adventure City in order to stop the recently-elected Mayor Humdinger from wreaking havoc.',
                '18:52',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDM0ZDM5M2YtNGViMC00NTgyLWJlYTMtYWM4YTQxYmExOTc2XkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                126,
                7.5,
                '109 min',
                'Animation, Action, Adventure',
                'Road to Ninja - Naruto the Movie',
                '7.6',
                'Naruto and Sakura are captured in a parallel world by Madara, who''s intentions are to steal the Nine Tails from Naruto.',
                '08:32',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTQ5MTcyNDYwMV5BMl5BanBnXkFtZTgwNzMzNzc0MjE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                127,
                7.4,
                '123 min',
                'Comedy',
                'Stromberg - The Movie',
                '7.3',
                'The movie spin-off of the TV series centered around the incompetent boss of a German insurance office.',
                '13:10',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYWUwZTE0NmMtMWJmOC00MWI5LTg5NWQtZjQ4ODRhZjA0Y2Q0XkEyXkFqcGdeQXVyMzYwMTkzNTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                128,
                6.7,
                '82 min',
                'Animation, Action, Adventure',
                'Naruto the Movie: Ninja Clash in the Land of Snow',
                '6.6',
                'Naruto and his team are hired to protect a young actress from three rogue warriors in the Land of the Snow.',
                '05:26',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYWFkMTJjODEtMjY2NC00OGRiLThkYjMtMzBjMzVhY2FlZTEyXkEyXkFqcGdeQXVyNjYwMjkwMjg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                129,
                5.9,
                '99 min',
                'Animation, Adventure, Comedy',
                'My Little Pony: The Movie',
                '6.1',
                'After a dark force conquers Canterlot, the Mane 6 embark on an unforgettable journey beyond Equestria where they meet new friends and exciting challenges on a quest to use the magic of friendship to save their homeland.',
                '05:23',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMmMxNWNhNjItZjhmMC00ZmViLThlYjItZDk5YTQ1MWZkOGM1XkEyXkFqcGdeQXVyNzY2ODYzOTU@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                130,
                6.1,
                '82 min',
                'Animation, Action, Adventure',
                'Digimon: The Movie',
                '6.0',
                'Throughout three different stories, Kari Kamiya and her friends take on explosive adventures involving digital creatures.',
                '00:52',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjE2NTAyMjUxMl5BMl5BanBnXkFtZTYwOTAwODQ3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                131,
                5.7,
                '76 min',
                'Animation, Adventure, Comedy',
                'Hey Arnold! The Movie',
                '5.9',
                'Arnold and company must recover a stolen document needed in order to prevent the neighborhood from being bulldozed.',
                '22:48',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYjhlMTU0YWQtMjlkMi00MzI0LWJkYmMtNzVlMjMyYjY4ODJhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                132,
                5.3,
                '115 min',
                'Adventure, Comedy, Sci-Fi',
                'Angry Video Game Nerd: The Movie',
                '5.4',
                'The AVGN must overcome his phobia of the worst video game in the world to save his fans.',
                '09:06',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjA2NzYzMTg4NF5BMl5BanBnXkFtZTgwNDcyMzIwMjE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                133,
                5.7,
                '90 min',
                'Comedy',
                'The Bad Education Movie',
                '5.8',
                'Mr Wickers and his class go on one final school trip after they finish their GCSEs.',
                '12:18',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzMxNTY1ODc1Nl5BMl5BanBnXkFtZTgwMzQyMzIzNjE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                134,
                6.2,
                '98 min',
                'Animation, Action, Adventure',
                'Pokémon the Movie: I Choose You!',
                '6.3',
                'Ash Ketchum from Pallet Town is 10 years old today. This means he is now old enough to become a Pokémon Trainer. Ash dreams big about the adventures he will experience after receiving his first Pokémon from Professor Oak.',
                '19:59',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BM2U3NmI4YzItYmRiNi00M2UxLWExNTYtNDZkZmJlNzlmM2M3XkEyXkFqcGdeQXVyNDkzMjE0NDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                135,
                6.4,
                '93 min',
                'Comedy, Family',
                'The Even Stevens Movie',
                '6.2',
                'Dream vacation Dream on! Ren, Louis, and the entire Stevens family battle ferocious squirrels, angry natives and one another on the adventure of a lifetime.',
                '01:44',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZGJmYmZkODItNWQxOC00NTNmLTlmNDItMWZhMmQ4ZmNhNzBjXkEyXkFqcGdeQXVyOTM1Njc1ODM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                136,
                4.1,
                '84 min',
                'Horror, Mystery',
                'Little Horror Movie',
                '4.1',
                'Three You tubers struggling to get more views on their adventure channel, travel to the mythical city of Casablanca, unaware that it hides a terrifying secret.',
                '10:35',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjFjMjViMDgtMTBmMC00MWU0LWIwZTYtODEwZjZmZjVmNTFkXkEyXkFqcGdeQXVyMzE3MDkzMjM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                137,
                6.0,
                '92 min',
                'Comedy',
                'Impractical Jokers: The Movie',
                '5.8',
                'The story of a humiliating high school mishap from 1992 that sends the Impractical Jokers on the road competing in hidden-camera challenges for the chance to turn back the clock and redeem three of the four Jokers.',
                '11:35',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNWYwNjVhZDUtZjk2Yi00Mjc5LTkwYWMtMzU2ZDY1N2VjZGU1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                138,
                6.1,
                '82 min',
                'Animation, Action, Adventure',
                'Rise of the Teenage Mutant Ninja Turtles: The Movie',
                '6.2',
                'When a mysterious stranger arrives from the future with a dire warning, Leo is forced to rise and lead his brothers, Raph, Donnie, and Mikey in a fight to save the world from a terrifying alien species.',
                '14:22',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZmIxYmFlNjQtYmU0NC00MWMzLTkyYTktYTBjZmE5NDRlODEyXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                139,
                3.1,
                '84 min',
                'Adventure, Comedy, Fantasy',
                'Smosh: The Movie',
                '3.3',
                'An embarrassing video of Anthony surfaces online right before his fifth high school reunion. The Smosh dudes then take a portal into YouTube and race to change the video and re-write history before it blows Anthony''s chances of re...',
                '04:04',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg2OTcyNzEwN15BMl5BanBnXkFtZTgwOTU0Mzc5NTE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                140,
                1.5,
                '90 min',
                'Comedy',
                'OHA Diyorum: The Movie',
                '1.6',
                'Firat''s car gets stolen. Firat and his friends try to get Firat''s car back.',
                '07:09',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYzY2NjZhNjUtMjRmMy00MTZmLTlmY2QtNGNkNTQ5ODQ5NjQ0XkEyXkFqcGdeQXVyODY1MDkwOQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                141,
                6.8,
                '85 min',
                'Comedy',
                'Hello Ladies: The Movie',
                '6.7',
                'Stuart has recently split up with his girlfriend. When his girlfriend comes to visit LA, Stuart pretends to have a relationship with his tenant to make his ex feel jealous.',
                '16:49',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDBkZmI3MjctMDRlNC00M2U1LWJkN2UtYTc1MDNiMGUwZDFmXkEyXkFqcGdeQXVyMTA3NTEwMzgy._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                142,
                7.2,
                '109 min',
                'Comedy, Drama, Horror',
                'Reefer Madness: The Movie Musical',
                '7.0',
                'An outrageous tongue-in-cheek musical comedy adaptation of the classic anti-marijuana propaganda film Reefer Madness (1936).',
                '10:55',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzVmYzlmZjEtNDFkZS00MWFlLThiMDktYzdiNTVkNjQxZDM4XkEyXkFqcGdeQXVyMTEwODg2MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                143,
                6.1,
                '105 min',
                'Animation, Action, Adventure',
                'Miraculous: Ladybug & Cat Noir, the Movie',
                '6.1',
                'Ordinary teenager Marinette''s life in Paris goes superhuman when she becomes Ladybug. Bestowed with magical powers of creation, Ladybug must unite with her opposite, Cat Noir, to save Paris as a new villain unleashes chaos unto th...',
                '13:39',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZDBmNmZmNDMtYTI3NC00OWExLWE2NDYtMDA5ZDRhNDhjMjdkXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                144,
                5.8,
                '98 min',
                'Comedy, Drama, Mystery',
                'Sweet Movie',
                '6.0',
                'After winning the "most virgin" contest, Miss Canada is married to a rich milk tycoon. But she quickly flees the marriage to experience the world around her, full of sweetness and anarchy.',
                '07:42',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTEwMTIxNDM4OTVeQTJeQWpwZ15BbWU3MDQyMjE2NDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                145,
                7.7,
                '41 min',
                'Animation, Action, Sci-Fi',
                'Batman Beyond: The Movie',
                '7.7',
                'Decades after the retirement of Bruce Wayne as Batman, a boy dons the identity to avenge his own father''s murder.',
                '23:51',
                'Tuesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BZjdjN2VjMDQtZjc2Ni00ZTIxLWIzYjktOTE0MTY3ZTFiNGZiXkEyXkFqcGdeQXVyMjI4OTg3MTc@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                146,
                6.8,
                '92 min',
                'Documentary, Action, Comedy',
                'Nitro Circus: The Movie',
                '6.6',
                'Travis Pastrana and his tight-knit, highly-skilled, adrenaline-addicted friends bring their impossible, ridiculous, insane and hysterical adventures to the big screen for the first time.',
                '22:15',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTM5NDM5ODEyN15BMl5BanBnXkFtZTcwOTk2NzcwOA@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                147,
                5.8,
                '76 min',
                'Animation, Action, Fantasy',
                'Ultramarines: A Warhammer 40,000 Movie',
                '5.6',
                'A squad of Ultramarines answer a distress call from an Imperial Shrine World. A full Company of Imperial Fists was stationed there, but there is no answer from them. The squad investigates to find out what has happened there.',
                '01:23',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjZiNmExNDMtYTBlZi00NTk4LTlkNjAtYWJlMTYxNDFhMzg0XkEyXkFqcGdeQXVyODg1MTc3MTM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                148,
                7.3,
                '70 min',
                'Animation, Action, Adventure',
                'Regular Show: The Movie',
                '7.4',
                'To save the universe, and their friendship, Mordecai and Rigby must defeat an evil volleyball coach.',
                '13:52',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNmY3NzNkMTEtYTgwOS00M2ZjLWJlZjMtNmJhZGNiMjU3Y2YyXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                149,
                5.6,
                '84 min',
                'Documentary, Comedy, Music',
                'Glee: The 3D Concert Movie',
                '5.5',
                'A concert mockumentary shot during the Glee Live In Concert 2011 tour, featuring song performances, backstage scenes and fans'' stories on how the show influenced their lives.',
                '15:49',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTg0MjI0NjM2OF5BMl5BanBnXkFtZTcwMzYxNzcyNg@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                150,
                7.1,
                '108 min',
                'Animation, Action, Fantasy',
                'Naruto Shippuden the Movie: Blood Prison',
                '7.1',
                'Naruto Uzumaki is framed and sent to an inescapable prison where he must escape by any means necessary.',
                '09:52',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDgyZmRkYjUtMWExNS00NDQyLTliZTMtOTkwY2M3ZWU0ZjNmXkEyXkFqcGdeQXVyMjc2Nzg5OTQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                151,
                5.8,
                '77 min',
                'Animation, Adventure, Comedy',
                'The Care Bears Movie',
                '5.6',
                'The Care Bears team up with a troubled brother and sister who just moved to a new town to help a neglected young magician''s apprentice whose evil spell book causes sinister things to happen.',
                '14:27',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMmUwNTgzMzAtMmQ5Yi00ZmE2LTkxNjMtNGFjZTA4NjI2MmQyXkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                152,
                5.7,
                '82 min',
                'Animation, Comedy, Family',
                'Jetsons: The Movie',
                '5.5',
                'George Jetson is forced to uproot his family when Mr. Spacely promotes him to take charge of a new factory on a distant planet.',
                '11:41',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGQ3MGRhZTAtZDEwYy00NjBhLTkzNDktYzY4M2JjZDQxMmRhXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                153,
                7.2,
                '100 min',
                'Animation, Action, Crime',
                'Patlabor: The Movie',
                '7.0',
                'The screwball cops of Special Vehicles Section 2 Division 2 must investigate and stop a spree of rampaging construction robots.',
                '05:46',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTc4ZTY0NjUtNzRkZS00ZDMzLWFjMGUtMDUzNTg0ZWVjNDQyXkEyXkFqcGdeQXVyNjU5MjcxOTg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                154,
                6.0,
                '101 min',
                'Documentary, History',
                'Video Games: The Movie',
                '6.1',
                'Learn how video games are made, marketed, and consumed by looking back at gaming history and culture through the eyes of game developers, publishers, and consumers.',
                '00:55',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMjI2NzQ0MTI1Ml5BMl5BanBnXkFtZTgwNzMyMDE2MDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                155,
                7.1,
                '86 min',
                'Animation, Adventure, Comedy',
                'Phineas and Ferb the Movie: Candace Against the Universe',
                '7.0',
                'The famed stepbrother inventors know what they''re gonna do today. They''re gonna rescue their sister from an alien abduction.',
                '13:01',
                'Wednesday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGE2Mjc3YjAtZTcwNy00YjgyLWEyNDYtZjBiOGI1N2JkNzkzXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                156,
                6.9,
                '98 min',
                'Animation, Action, Fantasy',
                'Naruto Shippuden: The Movie - Bonds',
                '6.8',
                'A mysterious group of ninja called the Sora-nin from the Sky Country makes a surprise attack on Konoha. This is because Konoha nearly destroyed the Sky Country during the last Shinobi World War, yet they survived and now they''re a...',
                '06:14',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNTE2ODAyNTkxNl5BMl5BanBnXkFtZTgwNTAzMjA2MDE@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                157,
                5.4,
                '80 min',
                'Comedy, Mystery',
                'Handsome: A Netflix Mystery Movie',
                '5.2',
                'Gene Handsome is an LA homicide detective who tries to make sense of his life as he solves crime. Handsome''s knack for solving mysteries is matched only by his inability to make sense of his own problems.',
                '14:38',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMzIyMzA5MDU3M15BMl5BanBnXkFtZTgwNjk1MjA4MTI@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                158,
                6.4,
                '97 min',
                'Animation, Action, Adventure',
                'Naruto the Movie 2: Legend of the Stone of Gelel',
                '6.4',
                'Naruto, Shikamaru and Sakura are on a mission to deliver a lost pet to a village when a mysterious knight appear to confront them.',
                '09:37',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMDE3NjY3Y2MtODE4YS00YzFiLThhMTMtY2Q1NTZkODE4M2NlXkEyXkFqcGdeQXVyNjYwMjkwMjg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                159,
                7.3,
                '93 min',
                'Animation, Action, Adventure, Family, Fantasy, Sci-Fi',
                'G.I. Joe: The Movie',
                '7.1',
                'The heroic G.I. Joe action force must oppose the ruthless Cobra organization that has secretly allied with a subterranean reptilian people who were their founders.',
                '05:24',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTQ0MzIxMTU5N15BMl5BanBnXkFtZTcwMzIzMDUxMQ@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                160,
                6.1,
                '88 min',
                'Animation, Action, Adventure',
                'PAW Patrol: The Mighty Movie',
                '5.9',
                'A magical meteor falls in Adventure City and gives the PAW Patrol superpowers, transforming them into the Mighty Pups. But they face their most powerful challenge when Humdinger teams up with a mad scientist to steal their powers.',
                '23:48',
                'Sunday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGI4NTNlODItMGJlZi00OTIwLTlkM2ItMWFkZjJhZDIzMDc3XkEyXkFqcGdeQXVyMTEyNzQ1MTk0._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                161,
                5.9,
                '50 min',
                'Comedy',
                'Donald Trump''s The Art of the Deal: The Movie',
                '5.9',
                'Funny or Die presents a satirical rendition of Donald Trump''s 1987 best selling business book, The Art of the Deal.',
                '02:39',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODcyNTk1ZGYtYzcwYy00Y2FiLTk4MjQtNmRlZmMyYWY1NzBkXkEyXkFqcGdeQXVyMjU3NDQ3MDg@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                162,
                7.0,
                '94 min',
                'Drama',
                'The Last Movie Star',
                '7.0',
                'An aging former movie star is forced to face the reality that his glory days are behind him. On its surface, the film is a tale about faded fame. At its core, it''s a universal story about growing old.',
                '03:38',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNzc4ODYwMjEwNV5BMl5BanBnXkFtZTgwNTg1Mjg1NDM@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                163,
                5.7,
                '77 min',
                'Drama, Horror, Thriller',
                'Home Movie',
                '5.5',
                'In the remote woods of Upstate New York, David and Clare Poe are attempting to live an idyllic life. However, their twin children''s bizarre behavior might just tear the family apart.',
                '17:59',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMTkwNzQ4MDM3Nl5BMl5BanBnXkFtZTcwNjAxNTQwMg@@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                164,
                6.5,
                '94 min',
                'Animation, Action, Adventure',
                'Naruto Shippûden: The Movie',
                '6.7',
                'A powerful spirit that once threatened to destroy the world is back! Naruto''s mission is to protect a priestess named Shion, who is the only one with the power to seal away the monster.',
                '21:17',
                'Friday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNWM0NTU4ZjQtNzRmYi00MzM0LTgxZDMtNjFlYWUxMTRhNDUxXkEyXkFqcGdeQXVyMjc4OTQ1OTA@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                165,
                6.6,
                '71 min',
                'Animation, Action, Adventure, Family, Sci-Fi',
                'Lego Batman: The Movie - DC Super Heroes Unite',
                '6.5',
                'When the Joker and Lex Luthor form an alliance, Batman must team up with the Justice League in order to stop them.',
                '21:04',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjRjOGU2NzUtMjAwOC00MDI3LThmNmUtNTVkZTQ0MDEyYTc1XkEyXkFqcGdeQXVyMTA5NzUzODM4._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                166,
                5.4,
                '98 min',
                'Adventure, Comedy, Musical',
                'The Pirate Movie',
                '5.4',
                'A 1980s take-off of The Pirates of Penzance which centers on a noble pirate who leaves his profession and falls in love with a fiery young maiden.',
                '20:46',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BODhjZTUyNDgtMTRlNy00NzczLTk4ZTItZjcyNmRhNjk5OTQ1XkEyXkFqcGdeQXVyMTEwODg2MDY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                167,
                6.4,
                '95 min',
                'Animation, Action, Adventure',
                'Naruto the Movie 3: Guardians of the Crescent Moon Kingdom',
                '6.3',
                'Naruto, Kakashi, Sakura, and Rock Lee are assigned to protect Michiru, the prince of the Land of the Moon, while he travel the world. The prince purchased a tiger Sham and the whole circus, which became the team''s protection.',
                '21:07',
                'Monday',
                1,
                'https://m.media-amazon.com/images/M/MV5BNjk2ZWIzOTYtMGUxMC00MzdhLWI3ZGMtZGJhNzZmMDYxYjJlXkEyXkFqcGdeQXVyMjQ3NTQ4MjQ@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                168,
                4.9,
                '89 min',
                'Comedy, Horror, Thriller',
                'The Banana Splits Movie',
                '5.1',
                'Young Harley is having a dream birthday; he and his family are going to watch the taping of his favourite show. But the dream becomes a nightmare when the animatronic stars turn homicidal.',
                '08:35',
                'Thursday',
                1,
                'https://m.media-amazon.com/images/M/MV5BYWVjMGI4ZTAtOTJjYS00NjZkLWEzZGUtNDMxZTEyMjE5ODdjXkEyXkFqcGdeQXVyMTczNjQwOTY@._V1_SX300.jpg'
            );
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, show_times, days, is_released, image_id) VALUES (
                169,
                4.7,
                '99 min',
                'Animation, Adventure, Comedy',
                'Playmobil: The Movie',
                '4.9',
                'When her younger brother Charlie unexpectedly disappears into the magical, animated universe of PLAYMOBIL®, unprepared Marla must go on a quest of a lifetime to bring him home, setting off on a fantastic journey across stunning ne...',
                '06:48',
                'Saturday',
                1,
                'https://m.media-amazon.com/images/M/MV5BMGNlMjY2Y2MtNWVjZS00NDY5LTkwNzYtOTAxODg3Y2ZiY2Q3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'
            );
