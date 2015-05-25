DROP TABLE IF EXISTS `admin_users`;


CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `createby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_users_on_username` (`username`)
) AUTO_INCREMENT=2;
INSERT INTO `admin_users` VALUES (1,'admin','admin','kevin@nowhere.com','kskoglund','2013-08-21 15:59:57','2013-09-17 20:33:02','$2a$10$42IC6nGRvJURzILxOzjPaeuVFCJDjfq3jZC.OCsC4X1NI2OQL02Mq');
