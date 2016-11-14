/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.6.20 : Database - ci_scrappygram
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ci_scrappygram` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ci_scrappygram`;

/*Table structure for table `admin_groups` */

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin_groups` */

insert  into `admin_groups`(`id`,`name`,`description`) values (1,'webmaster','Webmaster'),(2,'admin','Administrator'),(3,'manager','Manager'),(4,'staff','Staff');

/*Table structure for table `admin_login_attempts` */

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_login_attempts` */

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users` */

insert  into `admin_users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`) values (1,'127.0.0.1','webmaster','$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES',NULL,NULL,NULL,NULL,NULL,NULL,1451900190,1477455566,1,'Webmaster',''),(2,'127.0.0.1','admin','$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW',NULL,NULL,NULL,NULL,NULL,'DOaiUtSw1srj3LirP9YL1.',1451900228,1477159040,1,'Admin',''),(3,'127.0.0.1','manager','$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa',NULL,NULL,NULL,NULL,NULL,NULL,1451900430,NULL,1,'Manager',''),(4,'127.0.0.1','staff','$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6',NULL,NULL,NULL,NULL,NULL,NULL,1451900439,NULL,1,'Staff','');

/*Table structure for table `admin_users_groups` */

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users_groups` */

insert  into `admin_users_groups`(`id`,`user_id`,`group_id`) values (1,1,1),(2,2,2),(3,3,3),(4,4,4);

/*Table structure for table `api_access` */

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `api_access` */

/*Table structure for table `api_keys` */

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `api_keys` */

insert  into `api_keys`(`id`,`user_id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values (1,1,'ixZePbqTLpCfiVvkTwLPEHb8kmekJeGJiQRAIAoQ',1,0,0,NULL,1);

/*Table structure for table `api_limits` */

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `api_limits` */

/*Table structure for table `api_logs` */

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `api_logs` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL COMMENT 'Unique Key',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(11) DEFAULT NULL COMMENT 'Use this in vendor decision logic',
  `orders` varchar(255) DEFAULT NULL COMMENT 'Order Number for every customer.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `customers` */

insert  into `customers`(`id`,`phone`,`first_name`,`last_name`,`email`,`password`,`address`,`city`,`state`,`country`,`zipcode`,`orders`) values (10,'1232132123123','John2','Smith','johnsmith@scrappygram.com','admin123','12 sat 1232','kai','CA','US','02412',NULL);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`) values (1,'members','General User');

/*Table structure for table `login_attempts` */

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_attempts` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Default Key',
  `order_id` varchar(255) NOT NULL COMMENT 'CA012_0000123 (First: vendor_id, Second: the count )',
  `filenames` varchar(255) DEFAULT NULL COMMENT '??? not sure for now if it will be files or file.',
  `amount` int(11) DEFAULT '1' COMMENT 'The count of the scrappygram',
  `brain_confirm_id` varchar(255) DEFAULT NULL COMMENT 'Braintree confirmation number',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`order_id`,`filenames`,`amount`,`brain_confirm_id`) values (1,'234ass','aaa',1,'123213');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`) values (1,'127.0.0.1','member','$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G',NULL,'member@member.com',NULL,NULL,NULL,NULL,1451903855,1451905011,0,'Member','One',NULL,NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users_groups` */

insert  into `users_groups`(`id`,`user_id`,`group_id`) values (1,1,1);

/*Table structure for table `vendors` */

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(255) NOT NULL COMMENT 'State abbr. + number?',
  `vendor_email` varchar(255) DEFAULT NULL COMMENT 'Where orders will go',
  `vendor_zipcode` varchar(255) DEFAULT NULL,
  `vendor_saturday` tinyint(1) DEFAULT '1' COMMENT 'weekdays ( 1: work, 0: rest)',
  `vendor_sunday` tinyint(1) DEFAULT '0' COMMENT 'weekdays ( 1: work, 0: rest)',
  `vendor_cls_time` time DEFAULT NULL COMMENT 'Weekday closing time will factor into vendor choice',
  `vendor_timezone` varchar(5) DEFAULT NULL,
  `vendor_rating` int(10) DEFAULT NULL COMMENT 'Quality? Speed?',
  `vendor_order_count` int(10) DEFAULT '0' COMMENT 'Reset Daily',
  `vendor_order_limit` int(255) DEFAULT NULL COMMENT 'Order count limit for every vendor.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `vendors` */

insert  into `vendors`(`id`,`vendor_id`,`vendor_email`,`vendor_zipcode`,`vendor_saturday`,`vendor_sunday`,`vendor_cls_time`,`vendor_timezone`,`vendor_rating`,`vendor_order_count`,`vendor_order_limit`) values (1,'','aaa@ab.com','123123',123,0,'00:00:00','',123,0,123213),(2,'','asaa@ab.com','12342',0,0,'00:00:00','',0,0,23123);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
