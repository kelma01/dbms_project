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
INSERT INTO `actor_actress` VALUES ('Leonardo','DiCaprio',1),('Kate','Winslet',1),('Brad','Pitt',2),('Angelina','Jolie',2),('Tim','Robbins',3),('Morgan','Freeman',3),('Leonardo','DiCaprio',4),('Joseph','Gordon-Levitt',4),('Zach','Galifianakis',5),('Bradley','Cooper',5),('Marlon','Brando',6),('Al','Pacino',6),('Christian','Bale',7),('Heath','Ledger',7),('Liam','Neeson',8),('Ben','Kingsley',8),('Elijah','Wood',9),('Viggo','Mortensen',9),('Elijah','Wood',10),('Viggo','Mortensen',10),('Elijah','Wood',11),('Viggo','Mortensen',11),('Keanu','Reeves',12),('Laurence','Fishburne',12),('Tom','Hanks',13),('Robin','Wright',13),('Elijah','Wood',14),('Viggo','Mortensen',14),('Elijah','Wood',15),('Viggo','Mortensen',15),('Elijah','Wood',16),('Viggo','Mortensen',16),('Keanu','Reeves',17),('Laurence','Fishburne',17),('Tom','Hanks',18),('Robin','Wright',18);
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
INSERT INTO `cinema` VALUES (1,'Arı Cinema','Ankara','Armada'),(2,'Cinemaximum','Ankara','Cepa'),(3,'Baykuş','İstanbul','Taksim');
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
INSERT INTO `movie` VALUES (1,8.50,'2h 30m','Drama','Titanic',8.70,'A love story on the ill-fated Titanic',1,'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'),(2,7.80,'2h 10m','Action','Mr. & Mrs. Smith',7.50,'A married couple discovers they are both assassins',1,'https://m.media-amazon.com/images/M/MV5BMTUxMzcxNzQzOF5BMl5BanBnXkFtZTcwMzQxNjUyMw@@._V1_SX300.jpg'),(3,9.00,'3h 22m','Drama','The Godfather Part II',9.30,'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on the family crime syndicate.',1,'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg'),(4,8.00,'2h 20m','Action','Inception',8.80,'A thief who steals corporate secrets through the use of dream-sharing technology',1,'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg'),(5,7.50,'2h 15m','Comedy','The Hangover',7.70,'A bachelor party in Las Vegas turns',1,'https://m.media-amazon.com/images/M/MV5BNGQwZjg5YmYtY2VkNC00NzliLTljYTctNzI5NmU3MjE2ODQzXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),(6,8.50,'2h 30m','Drama','The Godfather',9.20,'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son',1,'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),(7,7.80,'2h 10m','Action','The Dark Knight',8.40,'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham',1,'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg'),(8,9.00,'2h 45m','Drama','Schindlers List',9.30,'In German-occupied Poland during World War II',1,'https://cdn11.bigcommerce.com/s-yshlhd/images/stencil/1280x1280/products/24061/171413/full.schindlerslist-19775__92618.1632418818.jpg?c=2'),(9,8.00,'2h 20m','Action','The Lord of the Rings: The Return of the King',8.80,'Gandalf and Aragorn lead the World',1,'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg'),(10,8.90,'2h 34m','Crime','Pulp Fiction',8.90,'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',1,'https://static.posters.cz/image/1300/1288.jpg'),(11,8.80,'2h 19m','Drama','Fight Club',8.80,' An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into something much, much more.',1,'https://img.fruugo.com/product/0/08/14290080_max.jpg'),(12,8.60,'1h 58m','Thriller','The Silence of the Lambs',8.60,'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.',1,'https://img.fruugo.com/product/8/88/14433888_max.jpg'),(13,8.60,'2h 7m','Crime','Se7en',8.60,'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.',1,'https://www.arthipo.com/image/cache/catalog/poster/movie/759-1554/pfilm1161-seven-film-movie-posters-cinema-kanvas-tablo-canvas-1000x1000.webp'),(14,8.00,'2h 20m','Action','The Lord of the Rings: The Fellowship of the Ring',8.80,'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring',1,'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg'),(15,7.50,'2h 15m','Comedy','The Lord of the Rings: The Two Towers',7.70,'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum',1,'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),(16,8.50,'2h 30m','Drama','The Matrix',9.20,'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers',1,'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),(17,7.80,'2h 10m','Action','Forrest Gump',8.40,'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama',1,'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),(18,9.00,'2h 45m','Drama','The Shawshank Redemption',9.30,'Two imprisoned persons bond over a number of years',1,'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_SX300.jpg');
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
INSERT INTO `seat` VALUES (1,0,1,1,'A1'),(2,1,1,1,'A2'),(3,1,1,1,'A3'),(4,1,1,1,'A4'),(5,1,1,1,'B1'),(6,1,1,1,'B2'),(7,1,1,1,'B3'),(8,0,1,1,'B4'),(9,1,1,1,'C1'),(10,1,1,1,'C2'),(11,1,1,1,'C3'),(12,1,1,1,'C4'),(13,1,1,1,'D1'),(14,1,1,1,'D2'),(15,1,1,1,'D3'),(16,1,1,1,'D4'),(17,1,2,1,'A1'),(18,1,2,1,'A2'),(19,1,2,1,'A3'),(20,1,2,1,'A4'),(21,1,2,1,'A5'),(22,1,2,1,'B1'),(23,1,2,1,'B2'),(24,1,2,1,'B3'),(25,1,2,1,'B4'),(26,1,2,1,'B5'),(27,1,2,1,'C1'),(28,1,2,1,'C2'),(29,1,2,1,'C3'),(30,1,2,1,'C4'),(31,1,2,1,'C5'),(32,1,2,1,'D1'),(33,1,2,1,'D2'),(34,1,2,1,'D3'),(35,1,2,1,'D4'),(36,1,2,1,'D5'),(37,1,3,2,'A1'),(38,1,3,2,'A2'),(39,1,3,2,'A3'),(40,1,3,2,'A4'),(41,1,3,2,'B1'),(42,1,3,2,'B2'),(43,1,3,2,'B3'),(44,1,3,2,'B4'),(45,1,3,2,'C1'),(46,1,3,2,'C2'),(47,1,3,2,'C3'),(48,1,3,2,'C4'),(49,1,3,2,'D1'),(50,1,3,2,'D2'),(51,1,3,2,'D3'),(52,1,3,2,'D4'),(53,1,4,2,'A1'),(54,1,4,2,'A2'),(55,1,4,2,'A3'),(56,1,4,2,'A4'),(57,1,4,2,'A5'),(58,1,4,2,'B1'),(59,1,4,2,'B2'),(60,1,4,2,'B3'),(61,1,4,2,'B4'),(62,1,4,2,'B5'),(63,1,4,2,'C1'),(64,1,4,2,'C2'),(65,1,4,2,'C3'),(66,1,4,2,'C4'),(67,1,4,2,'C5'),(68,1,4,2,'D1'),(69,1,4,2,'D2'),(70,1,4,2,'D3'),(71,1,4,2,'D4'),(72,1,4,2,'D5');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `movie_id` int NOT NULL,
  `theater_id` int NOT NULL,
  `show_hour` varchar(45) NOT NULL,
  `show_day` varchar(45) NOT NULL,
  PRIMARY KEY (`movie_id`,`theater_id`,`show_hour`,`show_day`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,1,'13:00','Monday'),(1,1,'16:00','Monday'),(2,1,'10:00','Tuesday'),(3,1,'10:00','Monday'),(3,1,'19:00','Thursday'),(4,1,'10:00','Wednesday'),(5,1,'10:00','Friday'),(6,1,'10:00','Sunday'),(6,1,'19:00','Sunday'),(7,1,'10:00','Tuesday'),(8,1,'10:00','Thursday'),(9,1,'10:00','Saturday'),(9,1,'19:00','Wednesday'),(10,1,'10:00','Monday'),(11,1,'10:00','Wednesday'),(12,1,'10:00','Friday'),(12,1,'19:00','Saturday'),(13,1,'10:00','Sunday'),(14,1,'10:00','Tuesday'),(15,1,'10:00','Thursday'),(15,1,'19:00','Tuesday'),(16,1,'10:00','Saturday'),(17,1,'10:00','Monday'),(18,1,'10:00','Wednesday'),(18,1,'19:00','Friday'),(1,2,'13:00','Friday'),(2,2,'13:00','Wednesday'),(3,2,'13:00','Monday'),(3,2,'19:00','Thursday'),(4,2,'13:00','Wednesday'),(5,2,'13:00','Friday'),(6,2,'13:00','Sunday'),(6,2,'19:00','Sunday'),(7,2,'13:00','Tuesday'),(8,2,'13:00','Thursday'),(9,2,'13:00','Saturday'),(9,2,'19:00','Wednesday'),(10,2,'13:00','Monday'),(11,2,'13:00','Wednesday'),(12,2,'13:00','Friday'),(12,2,'19:00','Saturday'),(13,2,'13:00','Sunday'),(14,2,'13:00','Tuesday'),(15,2,'13:00','Thursday'),(15,2,'19:00','Tuesday'),(16,2,'13:00','Saturday'),(17,2,'13:00','Monday'),(18,2,'13:00','Wednesday'),(18,2,'19:00','Friday'),(1,3,'19:00','Tuesday'),(2,3,'10:00','Thursday'),(3,3,'16:00','Monday'),(4,3,'16:00','Wednesday'),(4,3,'19:00','Friday'),(5,3,'16:00','Friday'),(6,3,'16:00','Sunday'),(7,3,'16:00','Tuesday'),(7,3,'19:00','Monday'),(8,3,'16:00','Thursday'),(9,3,'16:00','Saturday'),(10,3,'16:00','Monday'),(10,3,'19:00','Thursday'),(11,3,'16:00','Wednesday'),(12,3,'16:00','Friday'),(13,3,'16:00','Sunday'),(13,3,'19:00','Sunday'),(14,3,'16:00','Tuesday'),(15,3,'16:00','Thursday'),(16,3,'16:00','Saturday'),(16,3,'19:00','Wednesday'),(17,3,'16:00','Monday'),(18,3,'16:00','Wednesday'),(1,4,'19:00','Tuesday'),(2,4,'13:00','Friday'),(3,4,'10:00','Tuesday'),(4,4,'10:00','Thursday'),(4,4,'19:00','Friday'),(5,4,'10:00','Saturday'),(6,4,'10:00','Monday'),(7,4,'10:00','Wednesday'),(7,4,'19:00','Monday'),(8,4,'10:00','Friday'),(9,4,'10:00','Sunday'),(10,4,'10:00','Tuesday'),(10,4,'19:00','Thursday'),(11,4,'10:00','Thursday'),(12,4,'10:00','Saturday'),(13,4,'10:00','Monday'),(13,4,'19:00','Sunday'),(14,4,'10:00','Wednesday'),(15,4,'10:00','Friday'),(16,4,'10:00','Sunday'),(16,4,'19:00','Wednesday'),(17,4,'10:00','Tuesday'),(18,4,'10:00','Thursday'),(1,5,'13:00','Monday'),(2,5,'16:00','Saturday'),(2,5,'19:00','Wednesday'),(3,5,'13:00','Tuesday'),(4,5,'13:00','Thursday'),(5,5,'13:00','Saturday'),(5,5,'19:00','Saturday'),(6,5,'13:00','Monday'),(7,5,'13:00','Wednesday'),(8,5,'13:00','Friday'),(8,5,'19:00','Tuesday'),(9,5,'13:00','Sunday'),(10,5,'13:00','Tuesday'),(11,5,'13:00','Thursday'),(11,5,'19:00','Friday'),(12,5,'13:00','Saturday'),(13,5,'13:00','Monday'),(14,5,'13:00','Wednesday'),(14,5,'19:00','Monday'),(15,5,'13:00','Friday'),(16,5,'13:00','Sunday'),(17,5,'13:00','Tuesday'),(17,5,'19:00','Thursday'),(18,5,'13:00','Thursday'),(1,6,'13:00','Monday'),(2,6,'19:00','Wednesday'),(5,6,'19:00','Saturday'),(8,6,'19:00','Tuesday'),(11,6,'19:00','Friday'),(14,6,'19:00','Monday'),(17,6,'19:00','Thursday'),(18,6,'16:00','Thursday');
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
  `theater_no` int NOT NULL,
  PRIMARY KEY (`theater_id`,`cinema_id`),
  UNIQUE KEY `theater_id_UNIQUE` (`theater_id`),
  KEY `theater_cinema_id` (`cinema_id`),
  CONSTRAINT `theater_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,16,'A1-D4',1,1),(2,20,'A1-D5',1,2),(3,16,'A1-D4',2,1),(4,20,'A1-D5',2,2),(5,16,'A1-D4',3,1),(6,20,'A1-D5',3,2);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(45) NOT NULL,
  `showtime` varchar(45) NOT NULL,
  `cinema_id` int NOT NULL,
  `theater_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_cinema_id_idx` (`cinema_id`),
  KEY `ticket_user_id` (`user_id`),
  KEY `ticket_movie_id` (`movie_id`),
  KEY `ticket_theater_id` (`theater_id`),
  KEY `ticket_seat_id` (`seat_id`),
  CONSTRAINT `ticket_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `ticket_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `ticket_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `ticket_theater_id` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`),
  CONSTRAINT `ticket_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'Monday','13:00',1,1,1,1,21),(2,'Monday','13:00',1,1,1,1,22),(3,'Wednesday','10:00',1,1,8,18,21),(4,'Monday','13:00',1,1,3,1,21),(5,'10:00','Friday',1,1,16,5,21);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'kerem','elma','5bce75718cb1b41ede99f842c559467c8e987ec2883515b5905f9587b4328b62',NULL,'1111-11-11',NULL,'kelma@etu.edu.tr'),(22,'aa','aa','961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506',NULL,'1111-11-11',NULL,'aakelma@etu.edu.tr'),(23,'Mehmet','Eski','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL,'2024-07-20',NULL,'mehmeteski_40@hotmail.com');
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
INSERT INTO `wallet` VALUES (NULL,'0',NULL,'21',NULL,21),(NULL,'0',NULL,'22',NULL,22),(NULL,'0',NULL,'23',NULL,23);
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

-- Dump completed on 2024-07-28 22:48:07
