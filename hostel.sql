-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hostel
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id`            INT(11)  NOT NULL AUTO_INCREMENT
  COMMENT 'id бронирования',
  `user_id`       INT(11)  NOT NULL
  COMMENT 'id пользователя, который совершал данное бронирование',
  `guestrooms_id` INT(11)  NOT NULL
  COMMENT 'id гостинечного номера, который был забронирован',
  `night_price`   DOUBLE            DEFAULT NULL
  COMMENT 'цена за ночь, такой же столбец есть в таблице guestrooms, но там указывается текущая цена, сдесь же цена, по которой пользователь снимал номер.',
  `start_day`     DATE              DEFAULT NULL
  COMMENT 'первый день брони',
  `last_day`      DATE              DEFAULT NULL
  COMMENT 'последний день брони',
  `payed`         TINYINT(4)        DEFAULT '0'
  COMMENT 'показывает статус оплаты: оплачено/не оплачено',
  `book_day`      DATETIME NOT NULL,
  `all_price`     DOUBLE            DEFAULT NULL
  COMMENT 'итоговая стоимость - необходима для егулирования скидок',
  PRIMARY KEY (`id`),
  KEY `fk_bookings_user1_idx` (`user_id`),
  KEY `fk_bookings_guestrooms1_idx` (`guestrooms_id`),
  CONSTRAINT `fk_bookings_guestrooms1` FOREIGN KEY (`guestrooms_id`) REFERENCES `guestrooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  COMMENT ='Бронирования номеров, оплаты номеров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings`
  DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1, 6, 3, 58, '2018-12-14', '2017-12-30', 1, '2017-05-22 17:11:27', 110),
  (2, 6, 7, 55, '2017-12-01', '2017-12-02', 1, '2017-05-22 17:12:43', 110),
  (3, 6, 8, 64, '2017-12-03', '2017-12-05', 0, '2017-06-22 17:13:26', 128),
  (4, 13, 3, 59, '2017-12-11', '2017-12-14', 1, '2017-05-22 17:15:13', 120);
/*!40000 ALTER TABLE `bookings`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id`            INT(11) NOT NULL AUTO_INCREMENT
  COMMENT 'id комментария',
  `guestrooms_id` INT(11) NOT NULL,
  `user_id`       INT(11) NOT NULL,
  `comment`       TEXT COMMENT 'текст комментария',
  `date`          DATE             DEFAULT NULL
  COMMENT 'Дата оставления коммента',
  `rate`          INT(1)           DEFAULT '5'
  COMMENT 'выставленный пользователем рейтинг от 1 до 5',
  PRIMARY KEY (`id`),
  KEY `fk_comments_guestrooms1_idx` (`guestrooms_id`),
  KEY `fk_comments_user1_idx` (`user_id`),
  CONSTRAINT `fk_comments_guestrooms1` FOREIGN KEY (`guestrooms_id`) REFERENCES `guestrooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COMMENT ='комментарии пользователей к гостиницам';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments`
  DISABLE KEYS */;
INSERT INTO `comments` VALUES (1, 3, 6,
                               'Etiam quis quam nec diam porttitor luctus id sit amet ex. Donec facilisis lacinia eleifend. Vivamus tristique nibh in dui auctor ultricies. Phasellus mollis est sed justo viverra, non fermentum erat facilisis. Phasellus tortor magna, finibus quis efficitur at, sodales non ipsum. Vivamus at lacinia ante, feugiat dapibus leo. Quisque nibh turpis, rhoncus sit amet egestas rutrum, congue at purus. Aliquam convallis lacinia nisl id rutrum.',
                               '2017-12-22', 5), (2, 7, 6,
                                                  'Maecenas sollicitudin, tellus quis feugiat pretium, dolor dolor malesuada eros, sed dignissim nisi diam ac diam. In tristique gravida elit ac maximus. In quis maximus mi, ac semper magna. Etiam hendrerit ligula et tincidunt viverra. Vivamus ultricies pharetra mauris. Quisque feugiat velit id elit dapibus, vel imperdiet erat condimentum. Curabitur feugiat eros sit amet tortor dictum, non placerat justo laoreet. Pellentesque a finibus ex.',
                                                  '2017-12-08', 3), (3, 6, 13,
                                                                     'Ut ullamcorper tellus a turpis auctor, et sollicitudin elit congue. Aliquam erat volutpat. Integer ac felis quis est auctor aliquam. Sed ut ullamcorper sapien. Morbi bibendum enim eu tellus hendrerit, at viverra velit fermentum. Nam molestie a erat quis ornare. Nullam et diam ac urna suscipit facilisis at vel lorem. Ut in maximus odio. In ac quam consectetur lorem molestie euismod. Aenean malesuada justo vitae nunc auctor aliquet. Donec quis orci sit amet justo semper ornare.',
                                                                     '2017-12-27', 4);
/*!40000 ALTER TABLE `comments`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestrooms`
--

DROP TABLE IF EXISTS `guestrooms`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestrooms` (
  `id`          INT(11) NOT NULL AUTO_INCREMENT
  COMMENT 'id гостинечного номера',
  `hostel_id`   INT(11) NOT NULL,
  `night_price` DOUBLE           DEFAULT NULL
  COMMENT 'текущая цена за 1 ночь',
  `tv`          TINYINT(4)       DEFAULT '1'
  COMMENT 'есть ли телевизор в номере',
  `wifi`        TINYINT(4)       DEFAULT '1'
  COMMENT 'есть ли wifi',
  `bath`        TINYINT(4)       DEFAULT '1'
  COMMENT 'у номера своя ванная комната',
  `capacity`    INT(11)          DEFAULT '1'
  COMMENT 'на сколько людей рассчитан номер',
  PRIMARY KEY (`id`),
  KEY `fk_guestrooms_hostel1_idx` (`hostel_id`),
  CONSTRAINT `fk_guestrooms_hostel1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8
  COMMENT ='Гостинечные номера';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestrooms`
--

LOCK TABLES `guestrooms` WRITE;
/*!40000 ALTER TABLE `guestrooms`
  DISABLE KEYS */;
INSERT INTO `guestrooms`
VALUES (1, 1, 40, 1, 0, 0, 4), (2, 2, 60, 1, 1, 0, 3), (3, 3, 100, 1, 1, 1, 2), (4, 5, 14, 0, 0, 0, 1),
  (5, 4, 15, 0, 1, 0, 3), (6, 1, 55, 1, 1, 1, 2), (7, 1, 45, 0, 1, 0, 2), (8, 2, 13, 0, 0, 0, 1),
  (9, 2, 87, 1, 1, 1, 2), (10, 2, 135, 1, 1, 1, 3), (11, 2, 550, 1, 1, 1, 4), (12, 3, 150, 1, 1, 1, 2),
  (13, 3, 25, 0, 1, 1, 2), (14, 3, 9, 0, 1, 0, 1), (15, 3, 67, 0, 1, 1, 3), (16, 4, 13, 1, 0, 0, 1),
  (17, 4, 27, 0, 1, 0, 1), (18, 4, 49, 1, 1, 1, 3), (19, 4, 71, 1, 1, 1, 2), (20, 4, 140, 1, 1, 1, 2),
  (21, 5, 35, 0, 0, 1, 1), (22, 5, 47, 0, 1, 1, 2), (23, 5, 89, 1, 1, 1, 2), (24, 5, 89, 0, 1, 1, 3),
  (25, 5, 91, 0, 1, 1, 4), (26, 5, 112, 0, 1, 1, 2);
/*!40000 ALTER TABLE `guestrooms`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel` (
  `id`      INT(11)      NOT NULL AUTO_INCREMENT
  COMMENT 'id отеля',
  `stars`   INT(1)                DEFAULT '3',
  `imgPath` VARCHAR(150)          DEFAULT NULL,
  `name`    VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8
  COMMENT ='существующие отели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel`
--

LOCK TABLES `hostel` WRITE;
/*!40000 ALTER TABLE `hostel`
  DISABLE KEYS */;
INSERT INTO `hostel` VALUES (1, 4, '/img/hotel/1.jpg', 'Motel hotel'), (2, 3, '/img/hotel/2.jpg', 'Monaco hotel'),
  (3, 5, '/img/hotel/3.jpg', 'Arizona hotel'), (4, 5, '/img/hotel/4.jpg', 'Marco hotel'),
  (5, 4, '/img/hotel/5.jpg', 'Irvi hotel');
/*!40000 ALTER TABLE `hostel`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id`       INT(11) NOT NULL AUTO_INCREMENT
  COMMENT 'id языка',
  `language` VARCHAR(5)       DEFAULT NULL
  COMMENT 'язык',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  COMMENT ='Таблица языков';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language`
  DISABLE KEYS */;
INSERT INTO `language` VALUES (1, 'en'), (2, 'ru');
/*!40000 ALTER TABLE `language`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id`            INT(11) NOT NULL AUTO_INCREMENT,
  `guestrooms_id` INT(11) NOT NULL
  COMMENT 'id гостинечного номера, картинка которого загружена',
  `file`          VARCHAR(100)     DEFAULT NULL
  COMMENT 'путь к нужной картинке',
  PRIMARY KEY (`id`),
  KEY `fk_picture_guestrooms1_idx` (`guestrooms_id`),
  CONSTRAINT `fk_picture_guestrooms1` FOREIGN KEY (`guestrooms_id`) REFERENCES `guestrooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 56
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture`
  DISABLE KEYS */;
INSERT INTO `picture`
VALUES (1, 1, '/img/guestroom/1.jpg'), (2, 2, '/img/guestroom/2.jpg'), (3, 3, '/img/guestroom/3.jpg'),
  (4, 4, '/img/guestroom/4.jpg'), (5, 5, '/img/guestroom/5.jpeg'), (6, 6, '/img/guestroom/6.jpeg'),
  (7, 7, '/img/guestroom/7.jpeg'), (8, 8, '/img/guestroom/8.jpg'), (9, 9, '/img/guestroom/9.jpg'),
  (10, 10, '/img/guestroom/10.jpg'), (11, 11, '/img/guestroom/11.jpg'), (12, 12, '/img/guestroom/12.png'),
  (13, 13, '/img/guestroom/13.jpg'), (14, 14, '/img/guestroom/14.jpg'), (15, 15, '/img/guestroom/15.jpg'),
  (16, 16, '/img/guestroom/16.jpeg'), (17, 17, '/img/guestroom/17.jpg'), (18, 18, '/img/guestroom/18.jpg'),
  (19, 19, '/img/guestroom/19.jpg'), (20, 20, '/img/guestroom/20.jpg'), (21, 21, '/img/guestroom/21.JPG'),
  (22, 22, '/img/guestroom/22.jpg'), (23, 23, '/img/guestroom/23.jpg'), (24, 24, '/img/guestroom/24.jpg'),
  (25, 25, '/img/guestroom/25.jpg'), (26, 26, '/img/guestroom/26.jpg'), (27, 1, '/img/guestroom/bathroom/1.jpg'),
  (28, 2, '/img/guestroom/bathroom/2.jpg'), (29, 3, '/img/guestroom/bathroom/3.jpg'),
  (30, 4, '/img/guestroom/bathroom/4.jpg'), (31, 5, '/img/guestroom/bathroom/5.jpg'),
  (32, 6, '/img/guestroom/bathroom/6.jpg'), (33, 7, '/img/guestroom/bathroom/7.jpg'),
  (34, 8, '/img/guestroom/bathroom/8.jpg'), (35, 9, '/img/guestroom/bathroom/9.jpg'),
  (36, 10, '/img/guestroom/bathroom/10.jpg'), (37, 11, '/img/guestroom/bathroom/11.jpg'),
  (38, 12, '/img/guestroom/bathroom/12.jpg'), (39, 13, '/img/guestroom/bathroom/13.jpg'),
  (40, 14, '/img/guestroom/bathroom/14.jpg'), (41, 15, '/img/guestroom/bathroom/15.jpg'),
  (42, 16, '/img/guestroom/bathroom/16.jpg'), (43, 17, '/img/guestroom/bathroom/17.jpg'),
  (44, 18, '/img/guestroom/bathroom/18.jpg'), (45, 19, '/img/guestroom/bathroom/19.jpg'),
  (46, 20, '/img/guestroom/bathroom/20.jpg'), (47, 21, '/img/guestroom/bathroom/21.jpg'),
  (48, 22, '/img/guestroom/bathroom/22.jpg'), (49, 23, '/img/guestroom/bathroom/23.jpg'),
  (50, 24, '/img/guestroom/bathroom/24.jpg'), (51, 25, '/img/guestroom/bathroom/25.jpg'),
  (52, 26, '/img/guestroom/bathroom/26.jpg');
/*!40000 ALTER TABLE `picture`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tguestrooms`
--

DROP TABLE IF EXISTS `tguestrooms`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tguestrooms` (
  `language_id`   INT(11) NOT NULL
  COMMENT 'id языка',
  `guestrooms_id` INT(11) NOT NULL
  COMMENT 'id гостинечного номера',
  `description`   TEXT COMMENT 'описание гостиничного номер',
  PRIMARY KEY (`language_id`, `guestrooms_id`),
  KEY `fk_tguestrooms_language1_idx` (`language_id`),
  KEY `fk_tguestrooms_guestrooms1_idx` (`guestrooms_id`),
  CONSTRAINT `fk_tguestrooms_guestrooms1` FOREIGN KEY (`guestrooms_id`) REFERENCES `guestrooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tguestrooms_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='описание гостинечного номера на различных языках';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tguestrooms`
--

LOCK TABLES `tguestrooms` WRITE;
/*!40000 ALTER TABLE `tguestrooms`
  DISABLE KEYS */;
INSERT INTO `tguestrooms` VALUES (1, 1,
                                  'Donec id enim nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer convallis dapibus massa, ut semper tellus egestas sit amet. Nullam sagittis, elit in congue ornare, orci ante maximus mi, non gravida lacus nisi et odio. Vivamus nec magna mi. Nunc venenatis sagittis neque, sed aliquam libero rhoncus nec. Proin at nulla et justo facilisis rutrum quis eget felis. Morbi orci diam, efficitur in lorem non, dictum varius quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae sapien quis felis placerat commodo. Etiam sagittis metus nec viverra feugiat. Etiam facilisis aliquam mi, non viverra quam viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sem leo, elementum et magna id, efficitur egestas tellus. Nunc ultricies pretium nunc, vel rhoncus leo ornare et.'),
  (1, 2, 'Aenean venenatis lectus justo, nec congue libero accumsan eu. Nunc dignissim nulla sed odio consectetur, eu tincidunt nisi ullamcorper. Vivamus feugiat metus purus, nec rutrum orci vehicula ac. Nullam tempor tincidunt elit, sit amet dictum augue viverra at. Sed sapien lacus, pellentesque aliquet diam eu, fringilla rutrum metus. Phasellus mattis justo est, in faucibus magna vulputate vel. Donec diam sapien, vehicula eget molestie in, ultrices dignissim diam.'),
  (1, 3, 'Donec vestibulum, urna a pretium dapibus, est dui molestie dolor, non accumsan odio erat at neque. Quisque sit amet scelerisque nibh. Nullam vehicula nunc eu ornare fringilla. Nam nec lorem velit. Nulla facilisi. Nullam sollicitudin tincidunt metus sed condimentum. Vestibulum tincidunt porta convallis. Morbi hendrerit augue sed felis maximus, quis efficitur lectus hendrerit.'),
  (1, 4, 'Donec ante libero, molestie in lectus vel, interdum iaculis lorem. Aenean ullamcorper lectus ut magna volutpat vestibulum ut ac orci. Quisque tristique ut mauris non mollis. Vivamus elementum arcu ac tortor blandit fringilla. Vestibulum ultrices ac elit ut tempor. Proin eget consequat neque. Ut id est ante. Proin malesuada laoreet lectus, vel lobortis dui porta vitae. Praesent pellentesque tellus libero, semper efficitur arcu aliquam quis. Praesent et porttitor tellus, vel porttitor risus.'),
  (1, 5, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (1, 6, 'Donec id enim nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer convallis dapibus massa, ut semper tellus egestas sit amet. Nullam sagittis, elit in congue ornare, orci ante maximus mi, non gravida lacus nisi et odio. Vivamus nec magna mi. Nunc venenatis sagittis neque, sed aliquam libero rhoncus nec. Proin at nulla et justo facilisis rutrum quis eget felis. Morbi orci diam, efficitur in lorem non, dictum varius quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae sapien quis felis placerat commodo. Etiam sagittis metus nec viverra feugiat. Etiam facilisis aliquam mi, non viverra quam viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sem leo, elementum et magna id, efficitur egestas tellus. Nunc ultricies pretium nunc, vel rhoncus leo ornare et.'),
  (1, 7, 'Aenean venenatis lectus justo, nec congue libero accumsan eu. Nunc dignissim nulla sed odio consectetur, eu tincidunt nisi ullamcorper. Vivamus feugiat metus purus, nec rutrum orci vehicula ac. Nullam tempor tincidunt elit, sit amet dictum augue viverra at. Sed sapien lacus, pellentesque aliquet diam eu, fringilla rutrum metus. Phasellus mattis justo est, in faucibus magna vulputate vel. Donec diam sapien, vehicula eget molestie in, ultrices dignissim diam.'),
  (1, 8, 'Donec vestibulum, urna a pretium dapibus, est dui molestie dolor, non accumsan odio erat at neque. Quisque sit amet scelerisque nibh. Nullam vehicula nunc eu ornare fringilla. Nam nec lorem velit. Nulla facilisi. Nullam sollicitudin tincidunt metus sed condimentum. Vestibulum tincidunt porta convallis. Morbi hendrerit augue sed felis maximus, quis efficitur lectus hendrerit.'),
  (1, 9, 'Donec ante libero, molestie in lectus vel, interdum iaculis lorem. Aenean ullamcorper lectus ut magna volutpat vestibulum ut ac orci. Quisque tristique ut mauris non mollis. Vivamus elementum arcu ac tortor blandit fringilla. Vestibulum ultrices ac elit ut tempor. Proin eget consequat neque. Ut id est ante. Proin malesuada laoreet lectus, vel lobortis dui porta vitae. Praesent pellentesque tellus libero, semper efficitur arcu aliquam quis. Praesent et porttitor tellus, vel porttitor risus.'),
  (1, 10, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (1, 11, 'Donec id enim nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer convallis dapibus massa, ut semper tellus egestas sit amet. Nullam sagittis, elit in congue ornare, orci ante maximus mi, non gravida lacus nisi et odio. Vivamus nec magna mi. Nunc venenatis sagittis neque, sed aliquam libero rhoncus nec. Proin at nulla et justo facilisis rutrum quis eget felis. Morbi orci diam, efficitur in lorem non, dictum varius quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae sapien quis felis placerat commodo. Etiam sagittis metus nec viverra feugiat. Etiam facilisis aliquam mi, non viverra quam viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sem leo, elementum et magna id, efficitur egestas tellus. Nunc ultricies pretium nunc, vel rhoncus leo ornare et.'),
  (1, 12, 'Aenean venenatis lectus justo, nec congue libero accumsan eu. Nunc dignissim nulla sed odio consectetur, eu tincidunt nisi ullamcorper. Vivamus feugiat metus purus, nec rutrum orci vehicula ac. Nullam tempor tincidunt elit, sit amet dictum augue viverra at. Sed sapien lacus, pellentesque aliquet diam eu, fringilla rutrum metus. Phasellus mattis justo est, in faucibus magna vulputate vel. Donec diam sapien, vehicula eget molestie in, ultrices dignissim diam.'),
  (1, 13, 'Donec vestibulum, urna a pretium dapibus, est dui molestie dolor, non accumsan odio erat at neque. Quisque sit amet scelerisque nibh. Nullam vehicula nunc eu ornare fringilla. Nam nec lorem velit. Nulla facilisi. Nullam sollicitudin tincidunt metus sed condimentum. Vestibulum tincidunt porta convallis. Morbi hendrerit augue sed felis maximus, quis efficitur lectus hendrerit.'),
  (1, 14, 'Donec ante libero, molestie in lectus vel, interdum iaculis lorem. Aenean ullamcorper lectus ut magna volutpat vestibulum ut ac orci. Quisque tristique ut mauris non mollis. Vivamus elementum arcu ac tortor blandit fringilla. Vestibulum ultrices ac elit ut tempor. Proin eget consequat neque. Ut id est ante. Proin malesuada laoreet lectus, vel lobortis dui porta vitae. Praesent pellentesque tellus libero, semper efficitur arcu aliquam quis. Praesent et porttitor tellus, vel porttitor risus.'),
  (1, 15, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (1, 16, 'Donec id enim nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer convallis dapibus massa, ut semper tellus egestas sit amet. Nullam sagittis, elit in congue ornare, orci ante maximus mi, non gravida lacus nisi et odio. Vivamus nec magna mi. Nunc venenatis sagittis neque, sed aliquam libero rhoncus nec. Proin at nulla et justo facilisis rutrum quis eget felis. Morbi orci diam, efficitur in lorem non, dictum varius quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae sapien quis felis placerat commodo. Etiam sagittis metus nec viverra feugiat. Etiam facilisis aliquam mi, non viverra quam viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sem leo, elementum et magna id, efficitur egestas tellus. Nunc ultricies pretium nunc, vel rhoncus leo ornare et.'),
  (1, 17, 'Aenean venenatis lectus justo, nec congue libero accumsan eu. Nunc dignissim nulla sed odio consectetur, eu tincidunt nisi ullamcorper. Vivamus feugiat metus purus, nec rutrum orci vehicula ac. Nullam tempor tincidunt elit, sit amet dictum augue viverra at. Sed sapien lacus, pellentesque aliquet diam eu, fringilla rutrum metus. Phasellus mattis justo est, in faucibus magna vulputate vel. Donec diam sapien, vehicula eget molestie in, ultrices dignissim diam.'),
  (1, 18, 'Donec vestibulum, urna a pretium dapibus, est dui molestie dolor, non accumsan odio erat at neque. Quisque sit amet scelerisque nibh. Nullam vehicula nunc eu ornare fringilla. Nam nec lorem velit. Nulla facilisi. Nullam sollicitudin tincidunt metus sed condimentum. Vestibulum tincidunt porta convallis. Morbi hendrerit augue sed felis maximus, quis efficitur lectus hendrerit.'),
  (1, 19, 'Donec ante libero, molestie in lectus vel, interdum iaculis lorem. Aenean ullamcorper lectus ut magna volutpat vestibulum ut ac orci. Quisque tristique ut mauris non mollis. Vivamus elementum arcu ac tortor blandit fringilla. Vestibulum ultrices ac elit ut tempor. Proin eget consequat neque. Ut id est ante. Proin malesuada laoreet lectus, vel lobortis dui porta vitae. Praesent pellentesque tellus libero, semper efficitur arcu aliquam quis. Praesent et porttitor tellus, vel porttitor risus.'),
  (1, 20, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (1, 21, 'Donec id enim nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer convallis dapibus massa, ut semper tellus egestas sit amet. Nullam sagittis, elit in congue ornare, orci ante maximus mi, non gravida lacus nisi et odio. Vivamus nec magna mi. Nunc venenatis sagittis neque, sed aliquam libero rhoncus nec. Proin at nulla et justo facilisis rutrum quis eget felis. Morbi orci diam, efficitur in lorem non, dictum varius quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae sapien quis felis placerat commodo. Etiam sagittis metus nec viverra feugiat. Etiam facilisis aliquam mi, non viverra quam viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sem leo, elementum et magna id, efficitur egestas tellus. Nunc ultricies pretium nunc, vel rhoncus leo ornare et.'),
  (1, 22, 'Aenean venenatis lectus justo, nec congue libero accumsan eu. Nunc dignissim nulla sed odio consectetur, eu tincidunt nisi ullamcorper. Vivamus feugiat metus purus, nec rutrum orci vehicula ac. Nullam tempor tincidunt elit, sit amet dictum augue viverra at. Sed sapien lacus, pellentesque aliquet diam eu, fringilla rutrum metus. Phasellus mattis justo est, in faucibus magna vulputate vel. Donec diam sapien, vehicula eget molestie in, ultrices dignissim diam.'),
  (1, 23, 'Donec vestibulum, urna a pretium dapibus, est dui molestie dolor, non accumsan odio erat at neque. Quisque sit amet scelerisque nibh. Nullam vehicula nunc eu ornare fringilla. Nam nec lorem velit. Nulla facilisi. Nullam sollicitudin tincidunt metus sed condimentum. Vestibulum tincidunt porta convallis. Morbi hendrerit augue sed felis maximus, quis efficitur lectus hendrerit.'),
  (1, 24, 'Donec ante libero, molestie in lectus vel, interdum iaculis lorem. Aenean ullamcorper lectus ut magna volutpat vestibulum ut ac orci. Quisque tristique ut mauris non mollis. Vivamus elementum arcu ac tortor blandit fringilla. Vestibulum ultrices ac elit ut tempor. Proin eget consequat neque. Ut id est ante. Proin malesuada laoreet lectus, vel lobortis dui porta vitae. Praesent pellentesque tellus libero, semper efficitur arcu aliquam quis. Praesent et porttitor tellus, vel porttitor risus.'),
  (1, 25, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (1, 26, 'Donec a lacus euismod nunc pellentesque feugiat sit amet a elit. Pellentesque euismod ante in ornare accumsan. Nunc quis libero nec dui lacinia aliquet. In tristique cursus consequat. Morbi volutpat mi ut mollis lacinia. Sed auctor, elit vitae viverra consectetur, dolor tortor mattis nisl, vitae facilisis orci eros ac purus. Sed eget blandit leo, vitae finibus sem. Cras a sagittis neque, at dictum diam. In congue metus congue erat laoreet, tempor imperdiet ex aliquet. Mauris sed laoreet erat. Aliquam congue ligula lacus, eu iaculis arcu dictum quis. Morbi et lorem tincidunt, bibendum urna et, porta mauris.'),
  (2, 1, 'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.'),
  (2, 2, 'К тому же так случилось, что родня ребенка по матери тоже как бы забыла о нем в первое время. Деда его, то есть самого господина Миусова, отца Аделаиды Ивановны, тогда уже не было в живых; овдовевшая супруга его, бабушка Мити, переехавшая в Москву, слишком расхворалась, сестры же повышли замуж, так что почти целый год пришлось Мите пробыть у слуги Григория и проживать у него в дворовой избе. Впрочем, если бы папаша о нем и вспомнил (не мог же он в самом деле не знать о его существовании), то и сам сослал бы его опять в избу, так как ребенок всё же мешал бы ему в его дебоширстве. Но случилось так, что из Парижа вернулся двоюродный брат покойной Аделаиды Ивановны, Петр Александрович Миусов, многие годы сряду выживший потом за границей, тогда же еще очень молодой человек, но человек особенный между Миусовыми, просвещенный, столичный, заграничный и притом всю жизнь свою европеец, а под конец жизни либерал сороковых и пятидесятых годов. '),
  (2, 3, 'В продолжение своей карьеры он перебывал в связях со многими либеральнейшими людьми своей эпохи, и в России и за границей, знавал лично и Прудона и Бакунина и особенно любил вспоминать и рассказывать, уже под концом своих странствий, о трех днях февральской парижской революции сорок восьмого года, намекая, что чуть ли и сам он не был в ней участником на баррикадах. Это было одно из самых отраднейших воспоминаний его молодости. Имел он состояние независимое, по прежней пропорции около тысячи душ. Превосходное имение его находилось сейчас же на выезде из нашего городка и граничило с землей нашего знаменитого монастыря, с которым Петр Александрович, еще в самых молодых летах, как только получил наследство, мигом начал нескончаемый процесс за право каких-то ловель в реке или порубок в лесу, доподлинно не знаю, но начать процесс с «клерикалами» почел даже своею гражданскою и просвещенною обязанностью. '),
  (2, 4, 'Услышав всё про Аделаиду Ивановну, которую, разумеется, помнил и когда-то даже заметил, и узнав, что остался Митя, он, несмотря на всё молодое негодование свое и презрение к Федору Павловичу, в это дело ввязался. Тут-то он с Федором Павловичем в первый раз и познакомился. Он прямо ему объявил, что желал бы взять воспитание ребенка на себя. Он долго потом рассказывал, в виде характерной черты, что когда он заговорил с Федором Павловичем о Мите, то тот некоторое время имел вид совершенно не понимающего, о каком таком ребенке идет дело, и даже как бы удивился, что у него есть где-то в доме маленький сын. Если в рассказе Петра Александровича могло быть преувеличение, то всё же должно было быть и нечто похожее на правду.'),
  (2, 5, 'Но действительно Федор Павлович всю жизнь свою любил представляться, вдруг проиграть пред вами какую-нибудь неожиданную роль, и, главное, безо всякой иногда надобности, даже в прямой ущерб себе, как в настоящем, например, случае. Черта эта, впрочем, свойственна чрезвычайно многим людям, и даже весьма умным, не то что Федору Павловичу. Петр Александрович повел дело горячо и даже назначен был (купно с Федором Павловичем) в опекуны ребенку, потому что всё же после матери оставалось именьице — дом и поместье. Митя действительно переехал к этому двоюродному дяде, но собственного семейства у того не было, а так как сам он, едва лишь уладив и обеспечив свои денежные получения с своих имений, немедленно поспешил опять надолго в Париж, то ребенка и поручил одной из своих двоюродных теток, одной московской барыне. '),
  (2, 6, 'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.'),
  (2, 7, 'К тому же так случилось, что родня ребенка по матери тоже как бы забыла о нем в первое время. Деда его, то есть самого господина Миусова, отца Аделаиды Ивановны, тогда уже не было в живых; овдовевшая супруга его, бабушка Мити, переехавшая в Москву, слишком расхворалась, сестры же повышли замуж, так что почти целый год пришлось Мите пробыть у слуги Григория и проживать у него в дворовой избе. Впрочем, если бы папаша о нем и вспомнил (не мог же он в самом деле не знать о его существовании), то и сам сослал бы его опять в избу, так как ребенок всё же мешал бы ему в его дебоширстве. Но случилось так, что из Парижа вернулся двоюродный брат покойной Аделаиды Ивановны, Петр Александрович Миусов, многие годы сряду выживший потом за границей, тогда же еще очень молодой человек, но человек особенный между Миусовыми, просвещенный, столичный, заграничный и притом всю жизнь свою европеец, а под конец жизни либерал сороковых и пятидесятых годов. '),
  (2, 8, 'В продолжение своей карьеры он перебывал в связях со многими либеральнейшими людьми своей эпохи, и в России и за границей, знавал лично и Прудона и Бакунина и особенно любил вспоминать и рассказывать, уже под концом своих странствий, о трех днях февральской парижской революции сорок восьмого года, намекая, что чуть ли и сам он не был в ней участником на баррикадах. Это было одно из самых отраднейших воспоминаний его молодости. Имел он состояние независимое, по прежней пропорции около тысячи душ. Превосходное имение его находилось сейчас же на выезде из нашего городка и граничило с землей нашего знаменитого монастыря, с которым Петр Александрович, еще в самых молодых летах, как только получил наследство, мигом начал нескончаемый процесс за право каких-то ловель в реке или порубок в лесу, доподлинно не знаю, но начать процесс с «клерикалами» почел даже своею гражданскою и просвещенною обязанностью. '),
  (2, 9, 'Услышав всё про Аделаиду Ивановну, которую, разумеется, помнил и когда-то даже заметил, и узнав, что остался Митя, он, несмотря на всё молодое негодование свое и презрение к Федору Павловичу, в это дело ввязался. Тут-то он с Федором Павловичем в первый раз и познакомился. Он прямо ему объявил, что желал бы взять воспитание ребенка на себя. Он долго потом рассказывал, в виде характерной черты, что когда он заговорил с Федором Павловичем о Мите, то тот некоторое время имел вид совершенно не понимающего, о каком таком ребенке идет дело, и даже как бы удивился, что у него есть где-то в доме маленький сын. Если в рассказе Петра Александровича могло быть преувеличение, то всё же должно было быть и нечто похожее на правду.'),
  (2, 10, 'Но действительно Федор Павлович всю жизнь свою любил представляться, вдруг проиграть пред вами какую-нибудь неожиданную роль, и, главное, безо всякой иногда надобности, даже в прямой ущерб себе, как в настоящем, например, случае. Черта эта, впрочем, свойственна чрезвычайно многим людям, и даже весьма умным, не то что Федору Павловичу. Петр Александрович повел дело горячо и даже назначен был (купно с Федором Павловичем) в опекуны ребенку, потому что всё же после матери оставалось именьице — дом и поместье. Митя действительно переехал к этому двоюродному дяде, но собственного семейства у того не было, а так как сам он, едва лишь уладив и обеспечив свои денежные получения с своих имений, немедленно поспешил опять надолго в Париж, то ребенка и поручил одной из своих двоюродных теток, одной московской барыне. '),
  (2, 11, 'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.'),
  (2, 12, 'К тому же так случилось, что родня ребенка по матери тоже как бы забыла о нем в первое время. Деда его, то есть самого господина Миусова, отца Аделаиды Ивановны, тогда уже не было в живых; овдовевшая супруга его, бабушка Мити, переехавшая в Москву, слишком расхворалась, сестры же повышли замуж, так что почти целый год пришлось Мите пробыть у слуги Григория и проживать у него в дворовой избе. Впрочем, если бы папаша о нем и вспомнил (не мог же он в самом деле не знать о его существовании), то и сам сослал бы его опять в избу, так как ребенок всё же мешал бы ему в его дебоширстве. Но случилось так, что из Парижа вернулся двоюродный брат покойной Аделаиды Ивановны, Петр Александрович Миусов, многие годы сряду выживший потом за границей, тогда же еще очень молодой человек, но человек особенный между Миусовыми, просвещенный, столичный, заграничный и притом всю жизнь свою европеец, а под конец жизни либерал сороковых и пятидесятых годов. '),
  (2, 13, 'В продолжение своей карьеры он перебывал в связях со многими либеральнейшими людьми своей эпохи, и в России и за границей, знавал лично и Прудона и Бакунина и особенно любил вспоминать и рассказывать, уже под концом своих странствий, о трех днях февральской парижской революции сорок восьмого года, намекая, что чуть ли и сам он не был в ней участником на баррикадах. Это было одно из самых отраднейших воспоминаний его молодости. Имел он состояние независимое, по прежней пропорции около тысячи душ. Превосходное имение его находилось сейчас же на выезде из нашего городка и граничило с землей нашего знаменитого монастыря, с которым Петр Александрович, еще в самых молодых летах, как только получил наследство, мигом начал нескончаемый процесс за право каких-то ловель в реке или порубок в лесу, доподлинно не знаю, но начать процесс с «клерикалами» почел даже своею гражданскою и просвещенною обязанностью. '),
  (2, 14, 'Услышав всё про Аделаиду Ивановну, которую, разумеется, помнил и когда-то даже заметил, и узнав, что остался Митя, он, несмотря на всё молодое негодование свое и презрение к Федору Павловичу, в это дело ввязался. Тут-то он с Федором Павловичем в первый раз и познакомился. Он прямо ему объявил, что желал бы взять воспитание ребенка на себя. Он долго потом рассказывал, в виде характерной черты, что когда он заговорил с Федором Павловичем о Мите, то тот некоторое время имел вид совершенно не понимающего, о каком таком ребенке идет дело, и даже как бы удивился, что у него есть где-то в доме маленький сын. Если в рассказе Петра Александровича могло быть преувеличение, то всё же должно было быть и нечто похожее на правду.'),
  (2, 15, 'Но действительно Федор Павлович всю жизнь свою любил представляться, вдруг проиграть пред вами какую-нибудь неожиданную роль, и, главное, безо всякой иногда надобности, даже в прямой ущерб себе, как в настоящем, например, случае. Черта эта, впрочем, свойственна чрезвычайно многим людям, и даже весьма умным, не то что Федору Павловичу. Петр Александрович повел дело горячо и даже назначен был (купно с Федором Павловичем) в опекуны ребенку, потому что всё же после матери оставалось именьице — дом и поместье. Митя действительно переехал к этому двоюродному дяде, но собственного семейства у того не было, а так как сам он, едва лишь уладив и обеспечив свои денежные получения с своих имений, немедленно поспешил опять надолго в Париж, то ребенка и поручил одной из своих двоюродных теток, одной московской барыне. '),
  (2, 16, 'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.'),
  (2, 17, 'К тому же так случилось, что родня ребенка по матери тоже как бы забыла о нем в первое время. Деда его, то есть самого господина Миусова, отца Аделаиды Ивановны, тогда уже не было в живых; овдовевшая супруга его, бабушка Мити, переехавшая в Москву, слишком расхворалась, сестры же повышли замуж, так что почти целый год пришлось Мите пробыть у слуги Григория и проживать у него в дворовой избе. Впрочем, если бы папаша о нем и вспомнил (не мог же он в самом деле не знать о его существовании), то и сам сослал бы его опять в избу, так как ребенок всё же мешал бы ему в его дебоширстве. Но случилось так, что из Парижа вернулся двоюродный брат покойной Аделаиды Ивановны, Петр Александрович Миусов, многие годы сряду выживший потом за границей, тогда же еще очень молодой человек, но человек особенный между Миусовыми, просвещенный, столичный, заграничный и притом всю жизнь свою европеец, а под конец жизни либерал сороковых и пятидесятых годов. '),
  (2, 18, 'В продолжение своей карьеры он перебывал в связях со многими либеральнейшими людьми своей эпохи, и в России и за границей, знавал лично и Прудона и Бакунина и особенно любил вспоминать и рассказывать, уже под концом своих странствий, о трех днях февральской парижской революции сорок восьмого года, намекая, что чуть ли и сам он не был в ней участником на баррикадах. Это было одно из самых отраднейших воспоминаний его молодости. Имел он состояние независимое, по прежней пропорции около тысячи душ. Превосходное имение его находилось сейчас же на выезде из нашего городка и граничило с землей нашего знаменитого монастыря, с которым Петр Александрович, еще в самых молодых летах, как только получил наследство, мигом начал нескончаемый процесс за право каких-то ловель в реке или порубок в лесу, доподлинно не знаю, но начать процесс с «клерикалами» почел даже своею гражданскою и просвещенною обязанностью. '),
  (2, 19, 'Услышав всё про Аделаиду Ивановну, которую, разумеется, помнил и когда-то даже заметил, и узнав, что остался Митя, он, несмотря на всё молодое негодование свое и презрение к Федору Павловичу, в это дело ввязался. Тут-то он с Федором Павловичем в первый раз и познакомился. Он прямо ему объявил, что желал бы взять воспитание ребенка на себя. Он долго потом рассказывал, в виде характерной черты, что когда он заговорил с Федором Павловичем о Мите, то тот некоторое время имел вид совершенно не понимающего, о каком таком ребенке идет дело, и даже как бы удивился, что у него есть где-то в доме маленький сын. Если в рассказе Петра Александровича могло быть преувеличение, то всё же должно было быть и нечто похожее на правду.'),
  (2, 20, 'Но действительно Федор Павлович всю жизнь свою любил представляться, вдруг проиграть пред вами какую-нибудь неожиданную роль, и, главное, безо всякой иногда надобности, даже в прямой ущерб себе, как в настоящем, например, случае. Черта эта, впрочем, свойственна чрезвычайно многим людям, и даже весьма умным, не то что Федору Павловичу. Петр Александрович повел дело горячо и даже назначен был (купно с Федором Павловичем) в опекуны ребенку, потому что всё же после матери оставалось именьице — дом и поместье. Митя действительно переехал к этому двоюродному дяде, но собственного семейства у того не было, а так как сам он, едва лишь уладив и обеспечив свои денежные получения с своих имений, немедленно поспешил опять надолго в Париж, то ребенка и поручил одной из своих двоюродных теток, одной московской барыне. '),
  (2, 21, 'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.'),
  (2, 22, 'К тому же так случилось, что родня ребенка по матери тоже как бы забыла о нем в первое время. Деда его, то есть самого господина Миусова, отца Аделаиды Ивановны, тогда уже не было в живых; овдовевшая супруга его, бабушка Мити, переехавшая в Москву, слишком расхворалась, сестры же повышли замуж, так что почти целый год пришлось Мите пробыть у слуги Григория и проживать у него в дворовой избе. Впрочем, если бы папаша о нем и вспомнил (не мог же он в самом деле не знать о его существовании), то и сам сослал бы его опять в избу, так как ребенок всё же мешал бы ему в его дебоширстве. Но случилось так, что из Парижа вернулся двоюродный брат покойной Аделаиды Ивановны, Петр Александрович Миусов, многие годы сряду выживший потом за границей, тогда же еще очень молодой человек, но человек особенный между Миусовыми, просвещенный, столичный, заграничный и притом всю жизнь свою европеец, а под конец жизни либерал сороковых и пятидесятых годов. '),
  (2, 23, 'В продолжение своей карьеры он перебывал в связях со многими либеральнейшими людьми своей эпохи, и в России и за границей, знавал лично и Прудона и Бакунина и особенно любил вспоминать и рассказывать, уже под концом своих странствий, о трех днях февральской парижской революции сорок восьмого года, намекая, что чуть ли и сам он не был в ней участником на баррикадах. Это было одно из самых отраднейших воспоминаний его молодости. Имел он состояние независимое, по прежней пропорции около тысячи душ. Превосходное имение его находилось сейчас же на выезде из нашего городка и граничило с землей нашего знаменитого монастыря, с которым Петр Александрович, еще в самых молодых летах, как только получил наследство, мигом начал нескончаемый процесс за право каких-то ловель в реке или порубок в лесу, доподлинно не знаю, но начать процесс с «клерикалами» почел даже своею гражданскою и просвещенною обязанностью. '),
  (2, 24, 'Услышав всё про Аделаиду Ивановну, которую, разумеется, помнил и когда-то даже заметил, и узнав, что остался Митя, он, несмотря на всё молодое негодование свое и презрение к Федору Павловичу, в это дело ввязался. Тут-то он с Федором Павловичем в первый раз и познакомился. Он прямо ему объявил, что желал бы взять воспитание ребенка на себя. Он долго потом рассказывал, в виде характерной черты, что когда он заговорил с Федором Павловичем о Мите, то тот некоторое время имел вид совершенно не понимающего, о каком таком ребенке идет дело, и даже как бы удивился, что у него есть где-то в доме маленький сын. Если в рассказе Петра Александровича могло быть преувеличение, то всё же должно было быть и нечто похожее на правду.'),
  (2, 25, 'Но действительно Федор Павлович всю жизнь свою любил представляться, вдруг проиграть пред вами какую-нибудь неожиданную роль, и, главное, безо всякой иногда надобности, даже в прямой ущерб себе, как в настоящем, например, случае. Черта эта, впрочем, свойственна чрезвычайно многим людям, и даже весьма умным, не то что Федору Павловичу. Петр Александрович повел дело горячо и даже назначен был (купно с Федором Павловичем) в опекуны ребенку, потому что всё же после матери оставалось именьице — дом и поместье. Митя действительно переехал к этому двоюродному дяде, но собственного семейства у того не было, а так как сам он, едва лишь уладив и обеспечив свои денежные получения с своих имений, немедленно поспешил опять надолго в Париж, то ребенка и поручил одной из своих двоюродных теток, одной московской барыне. '),
  (2, 26,
   'Конечно, можно представить себе, каким воспитателем и отцом мог быть такой человек. С ним как с отцом именно случилось то, что должно было случиться, то есть он вовсе и совершенно бросил своего ребенка, прижитого с Аделаидой Ивановной, не по злобе к нему или не из каких-нибудь оскорбленно-супружеских чувств, а просто потому, что забыл о нем совершенно. Пока он докучал всем своими слезами и жалобами, а дом свой обратил в развратный вертеп, трехлетнего мальчика Митю взял на свое попечение верный слуга этого дома Григорий, и не позаботься он тогда о нем, то, может быть, на ребенке некому было бы переменить рубашонку.');
/*!40000 ALTER TABLE `tguestrooms`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thostel`
--

DROP TABLE IF EXISTS `thostel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thostel` (
  `language_id` INT(11) NOT NULL
  COMMENT 'id языка',
  `hostel_id`   INT(11) NOT NULL
  COMMENT 'id отеля',
  `country`     VARCHAR(45)  DEFAULT NULL
  COMMENT 'страна нахождения ',
  `city`        VARCHAR(45)  DEFAULT NULL,
  `description` TEXT COMMENT 'описание отеля',
  `address`     VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`language_id`, `hostel_id`),
  KEY `fk_hostel_language1_idx` (`language_id`),
  KEY `fk_thostel_hostel1_idx` (`hostel_id`),
  CONSTRAINT `fk_hostel_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_thostel_hostel1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='описания отелей на разных языках';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thostel`
--

LOCK TABLES `thostel` WRITE;
/*!40000 ALTER TABLE `thostel`
  DISABLE KEYS */;
INSERT INTO `thostel` VALUES (1, 1, 'Great Britain', 'London',
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac semper mauris. Phasellus vel tincidunt diam. Phasellus vulputate libero gravida, congue eros ut, rhoncus dolor. Donec neque velit, dapibus sed egestas et, semper ut arcu. Aliquam pharetra semper ligula vitae placerat. Sed ut est non nisl pulvinar feugiat. Nullam ut semper lectus.',
                              '49 Lillie Rd\r\nFulham, London\r\nSW6 1UA'), (1, 2, 'Russia', 'Moscow',
                                                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac semper mauris. Phasellus vel tincidunt diam. Phasellus vulputate libero gravida, congue eros ut, rhoncus dolor. Donec neque velit, dapibus sed egestas et, semper ut arcu. Aliquam pharetra semper ligula vitae placerat. Sed ut est non nisl pulvinar feugiat. Nullam ut semper lectus.',
                                                                             'Krasnopresneskaya 12'),
  (1, 3, 'Great Britain', 'Liverpool',
   'Cras pharetra diam condimentum maximus dapibus. Donec sit amet ornare tortor. Donec consectetur ornare dolor, vitae consectetur massa. Vivamus et purus in ligula porttitor lobortis. Nam nisl velit, lobortis in convallis ut, viverra sit amet ligula. In hac habitasse platea dictumst. Etiam molestie dolor consectetur imperdiet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate odio volutpat, venenatis risus eu, placerat purus. In hac habitasse platea dictumst. Vestibulum sollicitudin metus vitae massa rhoncus, at lobortis odio tristique. Praesent vel tellus ac magna accumsan porttitor eget eu dolor. Maecenas facilisis metus eu felis finibus gravida. Ut venenatis nibh porttitor lobortis pharetra.\r\n\r\nNunc tincidunt nulla in lobortis viverra. Quisque tellus dolor, pharetra non tincidunt a, mattis vel neque. Praesent pulvinar massa vel quam tincidunt iaculis. Nunc pellentesque, velit a laoreet congue, sem purus tincidunt mauris, ut mollis justo ligula non dui. Integer euismod interdum elit, vel porta felis facilisis et. Donec sed tempus justo, non fringilla felis. Vivamus aliquet eleifend porta. Morbi euismod felis et nisi lobortis, at ornare felis ornare. Nam sed tellus nisl. Sed convallis sollicitudin pharetra. Vestibulum in augue lacinia, euismod lacus id, lacinia purus. Suspendisse nec tellus nisl.',
   '22 Water St\r\nLiverpool\r\nL3 1BN'), (1, 4, 'China', 'Peking',
                                           'Nunc tincidunt nulla in lobortis viverra. Quisque tellus dolor, pharetra non tincidunt a, mattis vel neque. Praesent pulvinar massa vel quam tincidunt iaculis. Nunc pellentesque, velit a laoreet congue, sem purus tincidunt mauris, ut mollis justo ligula non dui. Integer euismod interdum elit, vel porta felis facilisis et. Donec sed tempus justo, non fringilla felis. Vivamus aliquet eleifend porta. Morbi euismod felis et nisi lobortis, at ornare felis ornare. Nam sed tellus nisl. Sed convallis sollicitudin pharetra. Vestibulum in augue lacinia, euismod lacus id, lacinia purus. Suspendisse nec tellus nisl.',
                                           '125 Zhangyicun Rd, Fengtai Qu, Beijing Shi'), (1, 5, 'China', 'Shanghai',
                                                                                           'Nunc tincidunt nulla in lobortis viverra. Quisque tellus dolor, pharetra non tincidunt a, mattis vel neque. Praesent pulvinar massa vel quam tincidunt iaculis. Nunc pellentesque, velit a laoreet congue, sem purus tincidunt mauris, ut mollis justo ligula non dui. Integer euismod interdum elit, vel porta felis facilisis et. Donec sed tempus justo, non fringilla felis. Vivamus aliquet eleifend porta. Morbi euismod felis et nisi lobortis, at ornare felis ornare. Nam sed tellus nisl. Sed convallis sollicitudin pharetra. Vestibulum in augue lacinia, euismod lacus id, lacinia purus. Suspendisse nec tellus nisl.',
                                                                                           '89 Pudong Xinqu, Shanghai Shi'),
  (2, 1, 'Великобритания', 'Лондон',
   'Алексей Федорович Карамазов был третьим сыном помещика нашего уезда Федора Павловича Карамазова, столь известного в свое время (да и теперь еще у нас припоминаемого) по трагической и темной кончине своей, приключившейся ровно тринадцать лет назад и о которой сообщу в своем месте. Теперь же скажу об этом «помещике» (как его у нас называли, хотя он всю жизнь совсем почти не жил в своем поместье) лишь то, что это был странный тип, довольно часто, однако, встречающийся, именно тип человека не только дрянного и развратного, но вместе с тем и бестолкового, — но из таких, однако, бестолковых, которые умеют отлично обделывать свои имущественные делишки, и только, кажется, одни эти. Федор Павлович, например, начал почти что ни с чем, помещик он был самый маленький, бегал обедать по чужим столам, норовил в приживальщики, а между тем в момент кончины его у него оказалось до ста тысяч рублей чистыми деньгами. И в то же время он все-таки всю жизнь свою продолжал быть одним из бестолковейших сумасбродов по всему нашему уезду. Повторю еще: тут не глупость; большинство этих сумасбродов довольно умно и хитро, — а именно бестолковость, да еще какая-то особенная, национальная.',
   '49 ул. Лилии\r\nФулхам, Лондон\r\nSW6 1UA'), (2, 2, 'Россия', 'Москва',
                                                  'Он был женат два раза, и у него было три сына: старший, Дмитрий Федорович, от первой супруги, а остальные два, Иван и Алексей, от второй. Первая супруга Федора Павловича была из довольно богатого и знатного рода дворян Миусовых, тоже помещиков нашего уезда. Как именно случилось, что девушка с приданым, да еще красивая и, сверх того, из бойких умниц, столь нередких у нас в теперешнее поколение, но появлявшихся уже и в прошлом, могла выйти замуж за такого ничтожного «мозгляка», как все его тогда называли, объяснять слишком не стану. Ведь знал же я одну девицу, еще в запрошлом «романтическом» поколении, которая после нескольких лет загадочной любви к одному господину, за которого, впрочем, всегда могла выйти замуж самым спокойным образом, кончила, однако же, тем, что сама навыдумала себе непреодолимые препятствия и в бурную ночь бросилась с высокого берега, похожего на утес, в довольно глубокую и быструю реку и погибла в ней решительно от собственных капризов, единственно из-за того, чтобы походить на шекспировскую Офелию, и даже так, что будь этот утес, столь давно ею намеченный и излюбленный, не столь живописен, а будь на его месте лишь прозаический плоский берег, то самоубийства, может быть, не произошло бы вовсе. Факт этот истинный, и надо думать, что в нашей русской жизни, в два или три последние поколения, таких или однородных с ним фактов происходило немало.',
                                                  'Краснопресненская наб., 12\r\nМосква'),
  (2, 3, 'Великобритания', 'Ливерпуль',
   'Подобно тому и поступок Аделаиды Ивановны Миусовой был без сомнения отголоском чужих веяний и тоже пленной мысли раздражением. Ей, может быть, захотелось заявить женскую самостоятельность, пойти против общественных условий, против деспотизма своего родства и семейства, а услужливая фантазия убедила ее, положим, на один только миг, что Федор Павлович, несмотря на свой чин приживальщика, все-таки один из смелейших и насмешливейших людей той, переходной ко всему лучшему, эпохи, тогда как он был только злой шут, и больше ничего. Пикантное состояло еще и в том, что дело обошлось увозом, а это очень прельстило Аделаиду Ивановну. Федор же Павлович на все подобные пассажи был даже и по социальному своему положению весьма тогда подготовлен, ибо страстно желал устроить свою карьеру хотя чем бы то ни было; примазаться же к хорошей родне и взять приданое было очень заманчиво. Что же до обоюдной любви, то ее вовсе, кажется, не было — ни со стороны невесты, ни с его стороны, несмотря даже на красивость Аделаиды Ивановны. Так что случай этот был, может быть, единственным в своем роде в жизни Федора Павловича, сладострастнейшего человека во всю свою жизнь, в один миг готового прильнуть к какой угодно юбке, только бы та его поманила. А между тем одна только эта женщина не произвела в нем со страстной стороны никакого особенного впечатления.',
   '22 ул. Вотэ, Ливерпуль'), (2, 4, 'Китай', 'Пекин',
                               'Аделаида Ивановна, тотчас же после увоза, мигом разглядела, что мужа своего она только презирает и больше ничего. Таким образом, следствия брака обозначились с чрезвычайною быстротой. Несмотря на то что семейство даже довольно скоро примирилось с событием и выделило беглянке приданое, между супругами началась самая беспорядочная жизнь и вечные сцены. Рассказывали, что молодая супруга выказала при том несравненно более благородства и возвышенности, нежели Федор Павлович, который, как известно теперь, подтибрил у нее тогда же, разом, все ее денежки, до двадцати пяти тысяч, только что она их получила, так что тысячки эти с тех пор решительно как бы канули для нее в воду. Деревеньку же и довольно хороший городской дом, которые тоже пошли ей в приданое, он долгое время и изо всех сил старался перевести на свое имя чрез совершение какого-нибудь подходящего акта и наверно бы добился того из одного, так сказать, презрения и отвращения к себе, которое он возбуждал в своей супруге ежеминутно своими бесстыдными вымогательствами и вымаливаниями, из одной ее душевной усталости, только чтоб отвязался. Но, к счастию, вступилось семейство Аделаиды Ивановны и ограничило хапугу. ',
                               '125 ул. Жангыицун, Фенгтаи'), (2, 5, 'Китай', 'Шанхай',
                                                               'Наконец ему удалось открыть следы своей беглянки. Бедняжка оказалась в Петербурге, куда перебралась с своим семинаристом и где беззаветно пустилась в самую полную эмансипацию. Федор Павлович немедленно захлопотал и стал собираться в Петербург, — для чего? — он, конечно, и сам не знал. Право, может быть, он бы тогда и поехал; но, предприняв такое решение, тотчас же почел себя в особенном праве, для бодрости, пред дорогой, пуститься вновь в самое безбрежное пьянство. И вот в это-то время семейством его супруги получилось известие о смерти ее в Петербурге. Она как-то вдруг умерла, где-то на чердаке, по одним сказаниям — от тифа, а по другим — будто бы с голоду. Федор Павлович узнал о смерти своей супруги пьяный; говорят, побежал по улице и начал кричать, в радости воздевая руки к небу: «Ныне отпущаеши», а по другим — плакал навзрыд как маленький ребенок, и до того, что, говорят, жалко даже было смотреть на него, несмотря на всё к нему отвращение. Очень может быть, что было и то, и другое, то есть что и радовался он своему освобождению, и плакал по освободительнице — всё вместе. В большинстве случаев люди, даже злодеи, гораздо наивнее и простодушнее, чем мы вообще о них заключаем. Да и мы сами тоже.',
                                                               '89 Пудонг Хиняу');
/*!40000 ALTER TABLE `thostel`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id`       INT(11)                NOT NULL AUTO_INCREMENT
  COMMENT 'id пользователя',
  `name`     VARCHAR(45)            NOT NULL
  COMMENT 'имя пользователя',
  `surname`  VARCHAR(45)            NOT NULL
  COMMENT 'фамилия пользователя',
  `login`    VARCHAR(45)            NOT NULL
  COMMENT 'логин пользователя',
  `password` CHAR(32)               NOT NULL
  COMMENT 'пароль пользоваетеля',
  `email`    VARCHAR(45)                     DEFAULT NULL
  COMMENT 'электронная почта пользователя',
  `role`     ENUM ('admin', 'user') NOT NULL DEFAULT 'user'
  COMMENT 'данное поле может быть либо admin либо user',
  `banned`   TINYINT(4)                      DEFAULT '0'
  COMMENT 'забанен ли пользователь',
  `number`   VARCHAR(20)                     DEFAULT NULL
  COMMENT 'номер телефона',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_uindex` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8
  COMMENT ='Данные о пользователях и администраторов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
  DISABLE KEYS */;
INSERT INTO `user` VALUES (6, 'Любовь', 'Иванова', 'ivan', '1234', 'ivan@gmail.com', 'user', 0, '+375333963693'),
  (10, 'Katrin', 'Filma', 'katrin', '1234', 'kate.filmanovich@gmail.com', 'user', 0, '+375333932074'),
  (11, 'admin', 'admin', 'admin', 'admin', 'lux@gmail.com', 'admin', 0, '+963852417441'),
  (12, 'ww', 'ww', 'ww', '12', 'we@gmail.com', 'user', 0, '+3693636362'),
  (13, 'alla', 'kruk', 'kruuk', 'jiji', 'truk@gmail.com', 'user', 0, '+375896325689'),
  (14, 'Petr', 'Murniv', 'Murik', '294487', 'truer@gmail.com', 'user', 0, '+9632'),
  (15, 'Борис', 'Фёлкин', 'felkin', '4785932', 'tur@gmail.com', 'admin', 1, '+375893692584'),
  (16, 'Nino', 'Katamadze', 'katamadze', '1234', 'trutr', 'user', 1, '+375896985241'),
  (17, 'kevin', 'lol', 'lol', '1234', 'ksjf@kjfls.com', 'user', 0, '+3758965375'),
  (18, 'elvin', 'burunduk', 'elvin', 'tutu', 'elvin@gmail.com', 'user', 0, '+3756325852'),
  (19, 'Rosa', 'Stown', 'rosa', '2345', 'rosa@gmail.com', 'user', 0, '+375294102220'),
  (20, 'Alex', 'White', 'white123', '1234', 'white@gmail.com', 'user', 0, '+375336985202'),
  (21, 'Имя', 'Фамилия', 'login', 'password', 'imya@gmail.com', 'user', 0, '+37533333204141');
/*!40000 ALTER TABLE `user`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2018-01-31  0:45:03
