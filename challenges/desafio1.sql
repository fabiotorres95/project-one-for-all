DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`plan`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`plan` (
  `id` INT NOT NULL,
  `plan_type` VARCHAR(45) NULL,
  `plan_price` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`user`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`user` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `age` INT NULL,
  `registration_date` DATE NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_plan_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_plan`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`artists` (
  `id` INT NOT NULL,
  `artists` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`albums` (
  `id` INT NOT NULL,
  `album` VARCHAR(45) NULL,
  `release_year` VARCHAR(45) NULL,
  `artists_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albums_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `SpotifyClone`.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`songs` (
  `id` INT NOT NULL,
  `song` VARCHAR(45) NULL,
  `duration_seconds` VARCHAR(45) NULL,
  `albums_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_songs_albums1_idx` (`albums_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_albums1`
    FOREIGN KEY (`albums_id`)
    REFERENCES `SpotifyClone`.`albums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`history`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`history` (
  `id` INT NOT NULL,
  `reproduction_date` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_history_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_history_songs1_idx` (`songs_id` ASC) VISIBLE,
  CONSTRAINT `fk_history_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `SpotifyClone`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`followed_artists`
-- -----------------------------------------------------
CREATE TABLE `SpotifyClone`.`followed_artists` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `artists_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_followed_artists_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_followed_artists_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_followed_artists_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_followed_artists_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `SpotifyClone`.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- data --

INSERT INTO `SpotifyClone`.`plan` (`id`, `plan_type`, `plan_price`)
VALUES 
  ('1', 'gratuito', '0'),
  ('2', 'familiar', '7.99'),
  ('3', 'universitário', '5.99'),
  ('4', 'pessoal', '6.99');

INSERT INTO `SpotifyClone`.`user` (`id`, `name`, `age`, `registration_date`, `plan_id`)
VALUES 
  ('1', 'Barbara Liskov', '82', '2019-10-20', '1'),
  ('2', 'Robert Cecil Martin', '58', '2017-01-06', '1'),
  ('3', 'Ada Lovelace', '37', '2017-12-30', '2'),
	('4', 'Martin Fowler', '46', '2017-01-17', '2'),
	('5', 'Sandi Metz', '58', '2018-04-29', '2'),
	('6', 'Paulo Freire', '19', '2018-02-14', '3'),
	('7', 'Bell Hooks', '26', '2018-01-05', '3'),
	('8', 'Christopher Alexander', '85', '2019-06-05', '4'),
	('9', 'Judith Butler', '45', '2020-05-13', '4'),
	('10', 'Jorge Amado', '58', '2017-02-17', '4');

INSERT INTO `SpotifyClone`.`artists` (`id`, `artists`)
VALUES
  ('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');

INSERT INTO `SpotifyClone`.`albums` (`id`, `album`, `release_year`, `artists_id`)
VALUES
  ('1', 'Renaissance', '2022', '1'),
	('2', 'Jazz', '1978', '2'),
	('3', 'Hot Space', '1982', '2'),
	('4', 'Falso Brilhante', '1998', '3'),
	('5', 'Vento de Maio', '2001', '3'),
	('6', 'QVVJFA?', '2003', '4'),
	('7', 'Somewhere Far Beyond', '2007', '5'),
	('8', 'I Put A Spell On You', '2012', '6');

INSERT INTO `SpotifyClone`.`songs` (`id`, `song`, `duration_seconds`, `albums_id`)
VALUES
  ('1', 'BREAK MY SOUL', '279', '1'),
	('2', "VIRGO'S GROOVE", '369', '1'),
	('3', 'ALIEN SUPERSTAR', '116', '1'),
	('4', "Don't Stop Me Now", '203', '2'),
	('5', 'Under Pressure', '152', '3'),
	('6', 'Como Nossos Pais', '105', '4'),
	('7', 'O Medo de Amar é o Medo de Ser Livre', '207', '5'),
	('8', 'Samba em Paris', '267', '6'),
	('9', "The Bard's Song", '244', '7'),
	('10', 'Feeling Good', '100', '8');

INSERT INTO `SpotifyClone`.`history` (`id`, `reproduction_date`, `user_id`, `songs_id`)
VALUES
  ('1', '2022-02-28 10:45:55', '1', '8'),
	('2', '2020-05-02 05:30:35', '1', '2'),
	('3', '2020-03-06 11:22:33', '1', '10'),
	('4', '2022-08-05 08:05:17', '2', '10'),
	('5', '2020-01-02 07:40:33', '2', '7'),
	('6', '2020-11-13 16:55:13', '3', '10'),
	('7', '2020-12-05 18:38:30', '3', '2'),
	('8', '2021-08-15 17:10:10', '4', '8'),
	('9', '2022-01-09 01:44:33', '5', '8'),
	('10', '2020-08-06 15:23:43', '5', '5'),
	('11', '2017-01-24 00:31:17', '6', '7'),
	('12', '2017-10-12 12:35:20', '6', '1'),
	('13', '2011-12-15 22:30:49', '7', '4'),
	('14', '2012-03-17 14:56:41', '8', '4'),
	('15', '2022-02-24 21:14:22', '9', '9'),
	('16', '2015-12-13 08:30:22', '10', '3');

INSERT INTO `SpotifyClone`.`followed_artists` (`id`, `user_id`, `artists_id`)
VALUES
  ('1', '1', '1'),
	('2', '1', '2'),
	('3', '1', '3'),
	('4', '2', '1'),
	('5', '2', '3'),
	('6', '3', '2'),
	('7', '4', '4'),
	('8', '5', '5'),
	('9', '5', '6'),
	('10', '6', '6'),
	('11', '6', '1'),
	('12', '7', '6'),
	('13', '9', '3'),
	('14', '10', '2');
