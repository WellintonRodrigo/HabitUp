
CREATE SCHEMA IF NOT EXISTS `HabitUp` DEFAULT CHARACTER SET utf8 ;
USE `HabitUp` ;

-- -----------------------------------------------------
-- Table `bosses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bosses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `max_hp` INT NOT NULL,
  `current_hp` INT NOT NULL,
  `type_weakness` ENUM('físico', 'mental', 'produtividade') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL DEFAULT 1,
  `total_xp` INT NOT NULL DEFAULT 0,
  `current_streak` INT NOT NULL DEFAULT 0,
  `active_boss_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_users_bosses_idx` (`active_boss_id` ASC),
  CONSTRAINT `fk_users_bosses`
    FOREIGN KEY (`active_boss_id`)
    REFERENCES `bosses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mood_entries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mood_entries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `mood_score` TINYINT NOT NULL,
  `note` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_mood_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_mood_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `habits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `habits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `type` ENUM('físico', 'mental', 'produtividade') NOT NULL,
  `difficulty` ENUM('facil', 'medio', 'dificil') NOT NULL,
  `frequency_type` ENUM('diario', 'semanal', 'mensal') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_habits_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_habits_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `habit_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `habit_logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habits_id` INT NOT NULL,
  `mood_entries_id` INT NULL,
  `log_date` DATE NOT NULL,
  `xp_earned` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_habit_logs_habits_idx` (`habits_id` ASC),
  INDEX `fk_habit_logs_mood_idx` (`mood_entries_id` ASC),
  UNIQUE INDEX `xp_uniq` (`habits_id` ASC, `log_date` ASC),
  CONSTRAINT `fk_habit_logs_habits`
    FOREIGN KEY (`habits_id`)
    REFERENCES `habits` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_habit_logs_mood`
    FOREIGN KEY (`mood_entries_id`)
    REFERENCES `mood_entries` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB;