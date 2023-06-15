CREATE TABLE `SpotifyClone`.`favorite_songs` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `favorite_song_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_favorite_songs_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_favorite_songs_songs1_idx` (`favorite_song_id` ASC) VISIBLE,
  CONSTRAINT `fk_favorite_songs_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_songs_songs1`
    FOREIGN KEY (`favorite_song_id`)
    REFERENCES `SpotifyClone`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`favorite_songs` (`id`, `user_id`, `favorite_song_id`) 
VALUES
	('1', '1', '3'),
	('2', '1', '6'),
	('3', '1', '10'),
	('4', '2', '4'),
	('5', '3', '1'),
	('6', '3', '3'),
	('7', '4', '7'),
	('8', '4', '4'),
	('9', '5', '10'),
	('10', '5', '2'),
	('11', '8', '4'),
	('12', '9', '7'),
	('13', '10', '3');