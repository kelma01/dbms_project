-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbms_project
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
  CONSTRAINT `credit_cards_wallet_id` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`wallet_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
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
  `seat_loc` char(2) NOT NULL,
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
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `movie_id` int NOT NULL,
  `theater_id` int NOT NULL,
  `show_hour` varchar(45) NOT NULL,
  `show_day` varchar(45) NOT NULL,
  PRIMARY KEY (`movie_id`,`theater_id`, `show_hour`, `show_day`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
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

-- Dump completed on 2024-07-26 23:06:18
INSERT INTO movie (movie_id, rate, duration, genre, name, imdb_rate, description, is_released,image_id) VALUES  
(1, 8.5, '2h 30m', 'Drama', 'Titanic', 8.7, 'A love story on the ill-fated Titanic', 1, 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'), 
(2, 7.8, '2h 10m', 'Action', 'Mr. & Mrs. Smith', 7.5, 'A married couple discovers they are both assassins', 1, 'https://m.media-amazon.com/images/M/MV5BMTUxMzcxNzQzOF5BMl5BanBnXkFtZTcwMzQxNjUyMw@@._V1_SX300.jpg'), 
(3, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', 1, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg'), 
(4, 8.0, '2h 20m', 'Action', 'Inception', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology', 1, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg'), 
(5, 7.5, '2h 15m', 'Comedy', 'The Hangover', 7.7, 'A bachelor party in Las Vegas turns', 1, 'https://m.media-amazon.com/images/M/MV5BNGQwZjg5YmYtY2VkNC00NzliLTljYTctNzI5NmU3MjE2ODQzXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(6, 8.5, '2h 30m', 'Drama', 'The Godfather', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son', 1, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(7, 7.8, '2h 10m', 'Action', 'The Dark Knight', 8.4, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham', 1, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'), 
(8, 9.0, '2h 45m', 'Drama', 'Schindler''s List', 9.3, 'In German-occupied Poland during World War II', 1, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'), 
(9, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Return of the King', 8.8, 'Gandalf and Aragorn lead the World', 1, 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'), 
(10, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Fellowship of the Ring', 7.7, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', 1, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'), 
(11, 8.5, '2h 30m', 'Drama', 'The Lord of the Rings: The Two Towers', 9.2, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', 1, 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(12, 7.8, '2h 10m', 'Action', 'The Matrix', 8.4, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', 1, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(13, 9.0, '2h 45m', 'Drama', 'Forrest Gump', 9.3, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', 1, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'), 
(14, 8.0, '2h 20m', 'Action', 'The Lord of the Rings: The Fellowship of the Ring', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring', 1, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'), 
(15, 7.5, '2h 15m', 'Comedy', 'The Lord of the Rings: The Two Towers', 7.7, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum', 1, 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(16, 8.5, '2h 30m', 'Drama', 'The Matrix', 9.2, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers', 1, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'), 
(17, 7.8, '2h 10m', 'Action', 'Forrest Gump', 8.4, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama', 1, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'), 
(18, 9.0, '2h 45m', 'Drama', 'The Shawshank Redemption', 9.3, 'Two imprisoned persons bond over a number of years', 1, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg');

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
('Robin', 'Wright', 18);

INSERT INTO cinema (cinema_id, name, city, address) VALUES 
(1, 'Arı Cinema', 'Ankara', 'Armada'),
(2, 'Cinemaximum', 'Ankara', 'Cepa'),
(3, 'Baykuş', 'İstanbul', 'Taksim');

INSERT INTO theater (theater_id, num_of_seats, seats, cinema_id) VALUES 
(1, 16, 'A1-D4', 1),
(2, 20, 'A1-D5', 1),
(3, 16, 'A1-D4', 2),
(4, 20, 'A1-D5', 2),
(5, 16, 'A1-D4', 3),
(6, 20, 'A1-D5', 3);

INSERT INTO seat (seat_id, is_empty, theater_id, cinema_id, seat_loc) VALUES 
(1, 1, 1, 1, 'A1'),
(2, 0, 1, 1, 'A2'),
(3, 1, 1, 1, 'A3'),
(4, 0, 1, 1, 'A4'),
(5, 1, 1, 1, 'B1'),
(6, 0, 1, 1, 'B2'),
(7, 1, 1, 1, 'B3'),
(8, 0, 1, 1, 'B4'),
(9, 1, 1, 1, 'C1'),
(10, 0, 1, 1, 'C2'),
(11, 1, 1, 1, 'C3'),
(12, 0, 1, 1, 'C4'),
(13, 1, 1, 1, 'D1'),
(14, 0, 1, 1, 'D2'),
(15, 1, 1, 1, 'D3'),
(16, 0, 1, 1, 'D4'),

(17, 1, 2, 1, 'A1'),
(18, 0, 2, 1, 'A2'),
(19, 1, 2, 1, 'A3'),
(20, 0, 2, 1, 'A4'),
(21, 1, 2, 1, 'A5'),
(22, 0, 2, 1, 'B1'),
(23, 1, 2, 1, 'B2'),
(24, 0, 2, 1, 'B3'),
(25, 1, 2, 1, 'B4'),
(26, 0, 2, 1, 'B5'),
(27, 1, 2, 1, 'C1'),
(28, 0, 2, 1, 'C2'),
(29, 1, 2, 1, 'C3'),
(30, 0, 2, 1, 'C4'),
(31, 1, 2, 1, 'C5'),
(32, 0, 2, 1, 'D1'),
(33, 1, 2, 1, 'D2'),
(34, 0, 2, 1, 'D3'),
(35, 1, 2, 1, 'D4'),
(36, 0, 2, 1, 'D5'),

(37, 1, 3, 2, 'A1'),
(38, 0, 3, 2, 'A2'),
(39, 1, 3, 2, 'A3'),
(40, 0, 3, 2, 'A4'),
(41, 1, 3, 2, 'B1'),
(42, 0, 3, 2, 'B2'),
(43, 1, 3, 2, 'B3'),
(44, 0, 3, 2, 'B4'),
(45, 1, 3, 2, 'C1'),
(46, 0, 3, 2, 'C2'),
(47, 1, 3, 2, 'C3'),
(48, 0, 3, 2, 'C4'),
(49, 1, 3, 2, 'D1'),
(50, 0, 3, 2, 'D2'),
(51, 1, 3, 2, 'D3'),
(52, 0, 3, 2, 'D4'),

(53, 1, 4, 2, 'A1'),
(54, 0, 4, 2, 'A2'),
(55, 1, 4, 2, 'A3'),
(56, 0, 4, 2, 'A4'),
(57, 1, 4, 2, 'A5'),
(58, 0, 4, 2, 'B1'),
(59, 1, 4, 2, 'B2'),
(60, 0, 4, 2, 'B3'),
(61, 1, 4, 2, 'B4'),
(62, 0, 4, 2, 'B5'),
(63, 1, 4, 2, 'C1'),
(64, 0, 4, 2, 'C2'),
(65, 1, 4, 2, 'C3'),
(66, 0, 4, 2, 'C4'),
(67, 1, 4, 2, 'C5'),
(68, 0, 4, 2, 'D1'),
(69, 1, 4, 2, 'D2'),
(70, 0, 4, 2, 'D3'),
(71, 1, 4, 2, 'D4'),
(72, 0, 4, 2, 'D5');

INSERT INTO shows (movie_id, theater_id, show_hour, show_day) VALUES 
(1, 1, '13:00', 'Monday'),
(1, 5, '13:00', 'Monday'),
(1, 6, '13:00', 'Monday'),
(1, 1, '16:00', 'Monday'),
(1, 2, '13:00', 'Friday'),
(2, 1, '10:00', 'Tuesday'),
(2, 2, '13:00', 'Wednesday'),
(2, 3, '10:00', 'Thursday'),
(2, 4, '13:00', 'Friday'),
(2, 5, '16:00', 'Saturday'),
(3, 1, '10:00', 'Monday'),
(3, 2, '13:00', 'Monday'),
(3, 3, '16:00', 'Monday'),
(3, 4, '10:00', 'Tuesday'),
(3, 5, '13:00', 'Tuesday'),
(4, 1, '10:00', 'Wednesday'),
(4, 2, '13:00', 'Wednesday'),
(4, 3, '16:00', 'Wednesday'),
(4, 4, '10:00', 'Thursday'),
(4, 5, '13:00', 'Thursday'),
(5, 1, '10:00', 'Friday'),
(5, 2, '13:00', 'Friday'),
(5, 3, '16:00', 'Friday'),
(5, 4, '10:00', 'Saturday'),
(5, 5, '13:00', 'Saturday'),
(6, 1, '10:00', 'Sunday'),
(6, 2, '13:00', 'Sunday'),
(6, 3, '16:00', 'Sunday'),
(6, 4, '10:00', 'Monday'),
(6, 5, '13:00', 'Monday'),
(7, 1, '10:00', 'Tuesday'),
(7, 2, '13:00', 'Tuesday'),
(7, 3, '16:00', 'Tuesday'),
(7, 4, '10:00', 'Wednesday'),
(7, 5, '13:00', 'Wednesday'),
(8, 1, '10:00', 'Thursday'),
(8, 2, '13:00', 'Thursday'),
(8, 3, '16:00', 'Thursday'),
(8, 4, '10:00', 'Friday'),
(8, 5, '13:00', 'Friday'),
(9, 1, '10:00', 'Saturday'),
(9, 2, '13:00', 'Saturday'),
(9, 3, '16:00', 'Saturday'),
(9, 4, '10:00', 'Sunday'),
(9, 5, '13:00', 'Sunday'),
(10, 1, '10:00', 'Monday'),
(10, 2, '13:00', 'Monday'),
(10, 3, '16:00', 'Monday'),
(10, 4, '10:00', 'Tuesday'),
(10, 5, '13:00', 'Tuesday'),
(11, 1, '10:00', 'Wednesday'),
(11, 2, '13:00', 'Wednesday'),
(11, 3, '16:00', 'Wednesday'),
(11, 4, '10:00', 'Thursday'),
(11, 5, '13:00', 'Thursday'),
(12, 1, '10:00', 'Friday'),
(12, 2, '13:00', 'Friday'),
(12, 3, '16:00', 'Friday'),
(12, 4, '10:00', 'Saturday'),
(12, 5, '13:00', 'Saturday'),
(13, 1, '10:00', 'Sunday'),
(13, 2, '13:00', 'Sunday'),
(13, 3, '16:00', 'Sunday'),
(13, 4, '10:00', 'Monday'),
(13, 5, '13:00', 'Monday'),
(14, 1, '10:00', 'Tuesday'),
(14, 2, '13:00', 'Tuesday'),
(14, 3, '16:00', 'Tuesday'),
(14, 4, '10:00', 'Wednesday'),
(14, 5, '13:00', 'Wednesday'),
(15, 1, '10:00', 'Thursday'),
(15, 2, '13:00', 'Thursday'),
(15, 3, '16:00', 'Thursday'),
(15, 4, '10:00', 'Friday'),
(15, 5, '13:00', 'Friday'),
(16, 1, '10:00', 'Saturday'),
(16, 2, '13:00', 'Saturday'),
(16, 3, '16:00', 'Saturday'),
(16, 4, '10:00', 'Sunday'),
(16, 5, '13:00', 'Sunday'),
(17, 1, '10:00', 'Monday'),
(17, 2, '13:00', 'Monday'),
(17, 3, '16:00', 'Monday'),
(17, 4, '10:00', 'Tuesday'),
(17, 5, '13:00', 'Tuesday'),
(18, 1, '10:00', 'Wednesday'),
(18, 2, '13:00', 'Wednesday'),
(18, 3, '16:00', 'Wednesday'),
(18, 4, '10:00', 'Thursday'),
(18, 5, '13:00', 'Thursday'),
(18, 6, '16:00', 'Thursday'),
(1, 3, '19:00', 'Tuesday'),
(1, 4, '19:00', 'Tuesday'),
(2, 5, '19:00', 'Wednesday'),
(2, 6, '19:00', 'Wednesday'),
(3, 1, '19:00', 'Thursday'),
(3, 2, '19:00', 'Thursday'),
(4, 3, '19:00', 'Friday'),
(4, 4, '19:00', 'Friday'),
(5, 5, '19:00', 'Saturday'),
(5, 6, '19:00', 'Saturday'),
(6, 1, '19:00', 'Sunday'),
(6, 2, '19:00', 'Sunday'),
(7, 3, '19:00', 'Monday'),
(7, 4, '19:00', 'Monday'),
(8, 5, '19:00', 'Tuesday'),
(8, 6, '19:00', 'Tuesday'),
(9, 1, '19:00', 'Wednesday'),
(9, 2, '19:00', 'Wednesday'),
(10, 3, '19:00', 'Thursday'),
(10, 4, '19:00', 'Thursday'),
(11, 5, '19:00', 'Friday'),
(11, 6, '19:00', 'Friday'),
(12, 1, '19:00', 'Saturday'),
(12, 2, '19:00', 'Saturday'),
(13, 3, '19:00', 'Sunday'),
(13, 4, '19:00', 'Sunday'),
(14, 5, '19:00', 'Monday'),
(14, 6, '19:00', 'Monday'),
(15, 1, '19:00', 'Tuesday'),
(15, 2, '19:00', 'Tuesday'),
(16, 3, '19:00', 'Wednesday'),
(16, 4, '19:00', 'Wednesday'),
(17, 5, '19:00', 'Thursday'),
(17, 6, '19:00', 'Thursday'),
(18, 1, '19:00', 'Friday'),
(18, 2, '19:00', 'Friday');
