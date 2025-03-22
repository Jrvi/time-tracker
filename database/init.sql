DROP DATABASE IF EXISTS time_tracker_db;
CREATE DATABASE time_tracker_db;
USE time_tracker_db;

-- Käyttäjä-taulu
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

-- Loki-taulu
CREATE TABLE log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    time DATETIME,
    description VARCHAR(255),
    CONSTRAINT fk_log_user
        FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Tehtävä-taulu
CREATE TABLE task (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    user_id INT NOT NULL,
    CONSTRAINT fk_task_user
        FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Ajanmerkintä-taulu
CREATE TABLE timemark (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NULL,
    user_id INT NOT NULL,
    task_id INT NULL,
    CONSTRAINT fk_timemark_user
        FOREIGN KEY (user_id) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_timemark_task
        FOREIGN KEY (task_id) REFERENCES task(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE = InnoDB;

