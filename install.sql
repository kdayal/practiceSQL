-- create the database
CREATE DATABASE toDoList;
-- use the database
USE toDoList;

-- create tables
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT uc_user UNIQUE (id, email)
) ENGINE=InnoDB;

CREATE TABLE `lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

CREATE TABLE `listItems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `list_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` ENUM('not-started', 'in-progress', 'done', 'wont-do', 'impediment'),
  `priority` ENUM('low', 'medium', 'high'),
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_list_id FOREIGN KEY (list_id) REFERENCES lists(id)
) ENGINE=InnoDB;

CREATE TABLE `listItemComments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `list_item_id` int NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_list_item_id FOREIGN KEY (list_item_id) REFERENCES listItems(id)
) ENGINE=InnoDB;