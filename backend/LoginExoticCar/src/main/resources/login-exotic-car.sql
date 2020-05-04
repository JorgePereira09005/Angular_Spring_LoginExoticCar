-- -----------------------------------------------------
-- Schema login-exotic-car
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `login-exotic-car`;

CREATE SCHEMA `login-exotic-car`;
USE `login-exotic-car` ;

-- -----------------------------------------------------
-- Table `login-exotic-car`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-exotic-car`.`brand` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- adding some brands
-- -----------------------------------------------------
INSERT INTO BRAND(BRAND_NAME) VALUES ('Lamborghini');
INSERT INTO BRAND(BRAND_NAME) VALUES ('Ferrari');
INSERT INTO BRAND(BRAND_NAME) VALUES ('Aston Martin');
INSERT INTO BRAND(BRAND_NAME) VALUES ('Pagani');

-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `login-exotic-car`.`car_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-exotic-car`.`car_model` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(512) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `brand_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand` (`brand_id`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- adding some car models

INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Gallardo', 'The Lamborghini Gallardo (/ɡaɪˈjɑːrdoʊ/; Spanish: [ɡaˈʎaɾðo]) is a sports car built by the Italian automotive manufacturer Lamborghini from 2003 to 2013. It is Lamborghini\'s best-selling model with 14,022 built throughout its production run.', 'assets/images/carModels/Lamborghini/gallardo.jpg' , NOW(), NOW(), 1);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Espada', 'The Lamborghini Espada is a 4-seat grand touring coupé built by Italian car manufacturer Lamborghini between 1968 and 1978.', 'assets/images/carModels/Lamborghini/espada.jpg', NOW(), NOW(), 1);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Veneno', 'The Lamborghini Veneno (Spanish pronunciation: [beˈneno]) is a limited production high performance sportscar manufactured by Italian automobile manufacturer Lamborghini. Based on the Lamborghini Aventador, the Veneno was developed to celebrate Lamborghini\'s 50th anniversary.', 'assets/images/carModels/Lamborghini/veneno.jpg', NOW(), NOW(), 1);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Countach', 'The Lamborghini Countach is a rear mid-engine, rear-wheel-drive sports car produced by the Italian automobile manufacturer Lamborghini from 1974 to 1990. It is one of the then-exotic designs conceptualized by Italian Design house Bertone, which pioneered and popularized the sharply angled "Italian Wedge" design language. ', 'assets/images/carModels/Lamborghini/countach.jpg', NOW(), NOW(), 1);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Miura', 'The Lamborghini Miura is a sports car produced by Italian automaker Lamborghini between 1966 and 1973. The car was the first supercar with a rear mid-engined two-seat layout, although the concept was first seen in a production road car with René Bonnet\'s Matra Djet, introduced in 1964.', 'assets/images/carModels/Lamborghini/miura.jpg', NOW(), NOW(), 1);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Dino 206 GT', 'The Dino 206 GT, 246 GT and 246 GTS are V6 mid-engined sports cars produced by Ferrari and sold under the Dino marque between 1967 and 1974.', 'assets/images/carModels/Ferrari/dino.jpg', NOW(), NOW(), 2);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('DB10', 'The Aston Martin DB10 is a bespoke sports car specially developed for the James Bond film Spectre by the British luxury car manufacturer Aston Martin. ', 'assets/images/carModels/Aston Martin/db10.jpg', NOW(), NOW(), 3);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Huayra', 'The Pagani Huayra (Italian pronunciation: [ˈwai̯ra]) is a mid-engine sports car produced by Italian sports car manufacturer Pagani, succeeding the company\'s previous offering, the Zonda.', 'assets/images/carModels/Pagani/huayra.jpg', NOW(), NOW(), 4);
INSERT INTO CAR_MODEL (NAME, DESCRIPTION, IMAGE_URL, DATE_CREATED, LAST_UPDATED, BRAND_ID) VALUES ('Zonda', 'The Pagani Zonda is a mid-engine sports car produced by the Italian sports car manufacturer Pagani. It debuted at the 1999 Geneva Motor Show.', 'assets/images/carModels/Pagani/zonda.jpg', NOW(), NOW(), 4);



-- -----------------------------------------------------
-- Table `login-exotic-car`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-exotic-car`.`user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(50) NOT NULL unique,
  `email` VARCHAR(50) NOT NULL unique,
  `password` char(68) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `token` VARCHAR(100),
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45),
  
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `TITLE_UNIQUE` (`name`)
  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  
  PRIMARY KEY (`user_id`,`role_id`),
  
  KEY `FK_USER_idx` (`user_id`),
  
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) 
  REFERENCES `roles` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_USER_m2m` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_MODERATOR');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');


INSERT INTO `user` (user_name, email , password, first_name, last_name, token)
VALUES 
('spaghetti', 'john@kek.com' , '$2a$10$mfRupuBbK3k5HFfFDGBU2Oe32ePP3VjiOWMwUR7yBqhjWpyDobq/6' , 'john', 'Catchum', 'yes'),
('meatballs', 'lilly@kek.com' ,'$2a$10$mfRupuBbK3k5HFfFDGBU2Oe32ePP3VjiOWMwUR7yBqhjWpyDobq/6', 'lilly', 'tripper', 'yes'),
('troglodyte', 'rita@bur.com' , '$2a$10$mfRupuBbK3k5HFfFDGBU2Oe32ePP3VjiOWMwUR7yBqhjWpyDobq/6', 'rita', 'bicycle', 'yes');

-- passwords are encrypted using BCrypt
--
-- generation tool is available at: https://www.bcryptcalculator.com/
-- 
-- In this example, the default password for every user is 123lol



-- -----------------------------------------------------
-- Table `login-exotic-car`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login-exotic-car`.`post` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `date_post` VARCHAR(128) NULL DEFAULT NULL,
  `content` VARCHAR(256) NULL DEFAULT NULL,
  `car_model_id` BIGINT(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_model` (`car_model_id`),
  CONSTRAINT `fk_car_model` FOREIGN KEY (car_model_id) REFERENCES `car_model` (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (user_id) REFERENCES `user` (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

INSERT INTO post ( DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "too yellow for my taste", 1, 1);
INSERT INTO post (DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES ( now(), "Nice shade. Bet it attracts mosquitoes!", 1, 2);
INSERT INTO post ( DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "nice wheels", 1, 3);
INSERT INTO post ( DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "ipsum dolores yada yada", 2, 1);
INSERT INTO post ( DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "snape kills dumbledore", 2, 3);
INSERT INTO post ( DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "laaaaaame", 3, 2);
INSERT INTO post (DATE_POST, CONTENT, CAR_MODEL_ID, user_id) VALUES (now(), "very lega, very cool, very cool", 4, 2);
