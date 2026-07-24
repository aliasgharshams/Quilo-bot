/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: quilo
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2000) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `limituse` varchar(200) DEFAULT NULL,
  `limitused` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DiscountSell`
--

DROP TABLE IF EXISTS `DiscountSell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DiscountSell` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `codeDiscount` varchar(1000) NOT NULL,
  `price` varchar(200) NOT NULL,
  `limitDiscount` varchar(500) NOT NULL,
  `agent` varchar(500) NOT NULL,
  `usefirst` varchar(100) NOT NULL,
  `useuser` varchar(100) NOT NULL,
  `code_product` varchar(100) NOT NULL,
  `code_panel` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `usedDiscount` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Giftcodeconsumed`
--

DROP TABLE IF EXISTS `Giftcodeconsumed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Giftcodeconsumed` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2000) DEFAULT NULL,
  `id_user` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaySetting`
--

DROP TABLE IF EXISTS `PaySetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaySetting` (
  `NamePay` varchar(500) NOT NULL,
  `ValuePay` text NOT NULL,
  PRIMARY KEY (`NamePay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Payment_report`
--

DROP TABLE IF EXISTS `Payment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment_report` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) DEFAULT NULL,
  `id_order` varchar(2000) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `at_updated` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `dec_not_confirmed` text DEFAULT NULL,
  `Payment_Method` varchar(400) DEFAULT NULL,
  `payment_Status` varchar(100) DEFAULT NULL,
  `bottype` varchar(300) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `id_invoice` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Requestagent`
--

DROP TABLE IF EXISTS `Requestagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requestagent` (
  `id` varchar(500) NOT NULL,
  `username` varchar(500) NOT NULL,
  `time` varchar(500) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id_admin` varchar(500) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `rule` varchar(500) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telegram_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegram_id` (`telegram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliates` (
  `description` text DEFAULT NULL,
  `status_commission` varchar(200) DEFAULT NULL,
  `Discount` varchar(200) DEFAULT NULL,
  `price_Discount` varchar(200) DEFAULT NULL,
  `porsant_one_buy` varchar(100) DEFAULT NULL,
  `id_media` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bot_texts`
--

DROP TABLE IF EXISTS `bot_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_name` (`key_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `botsaz`
--

DROP TABLE IF EXISTS `botsaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `botsaz` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `bot_token` varchar(200) NOT NULL,
  `admin_ids` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `setting` text DEFAULT NULL,
  `hide_panel` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`hide_panel`)),
  `time` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancel_service`
--

DROP TABLE IF EXISTS `cancel_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancel_service` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(500) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_number`
--

DROP TABLE IF EXISTS `card_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_number` (
  `cardnumber` varchar(500) NOT NULL,
  `namecard` varchar(1000) NOT NULL,
  PRIMARY KEY (`cardnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `remark` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `remark` varchar(200) NOT NULL,
  `linkjoin` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departman`
--

DROP TABLE IF EXISTS `departman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `departman` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `idsupport` varchar(200) NOT NULL,
  `name_departman` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help`
--

DROP TABLE IF EXISTS `help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name_os` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Media_os` varchar(5000) NOT NULL,
  `type_Media_os` varchar(500) NOT NULL,
  `category` text NOT NULL,
  `Description_os` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id_invoice` varchar(200) NOT NULL,
  `id_user` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `Service_location` varchar(200) DEFAULT NULL,
  `time_sell` varchar(200) DEFAULT NULL,
  `name_product` varchar(200) DEFAULT NULL,
  `price_product` varchar(200) DEFAULT NULL,
  `Volume` varchar(200) DEFAULT NULL,
  `Service_time` varchar(200) DEFAULT NULL,
  `uuid` text DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `user_info` text DEFAULT NULL,
  `bottype` varchar(200) DEFAULT NULL,
  `refral` varchar(100) DEFAULT NULL,
  `time_cron` varchar(100) DEFAULT NULL,
  `notifctions` text NOT NULL,
  `Status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_api`
--

DROP TABLE IF EXISTS `logs_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_api` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`header`)),
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `ip` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `actions` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manualsell`
--

DROP TABLE IF EXISTS `manualsell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `manualsell` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `codepanel` varchar(100) NOT NULL,
  `codeproduct` varchar(100) NOT NULL,
  `namerecord` varchar(200) NOT NULL,
  `username` varchar(500) DEFAULT NULL,
  `contentrecord` text NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marzban_panel`
--

DROP TABLE IF EXISTS `marzban_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marzban_panel` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `code_panel` varchar(200) DEFAULT NULL,
  `name_panel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  `url_panel` varchar(2000) DEFAULT NULL,
  `username_panel` varchar(200) DEFAULT NULL,
  `password_panel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `sublink` varchar(500) DEFAULT NULL,
  `config` varchar(500) DEFAULT NULL,
  `MethodUsername` varchar(700) DEFAULT NULL,
  `TestAccount` varchar(100) DEFAULT NULL,
  `limit_panel` varchar(100) DEFAULT NULL,
  `namecustom` varchar(100) DEFAULT NULL,
  `Methodextend` varchar(100) DEFAULT NULL,
  `conecton` varchar(100) DEFAULT NULL,
  `linksubx` varchar(1000) DEFAULT NULL,
  `inboundid` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `inboundstatus` varchar(100) DEFAULT NULL,
  `inbound_deactive` varchar(100) DEFAULT NULL,
  `time_usertest` varchar(100) DEFAULT NULL,
  `val_usertest` varchar(100) DEFAULT NULL,
  `secret_code` varchar(200) DEFAULT NULL,
  `priceChangeloc` varchar(200) DEFAULT NULL,
  `priceextravolume` varchar(500) DEFAULT NULL,
  `pricecustomvolume` varchar(500) DEFAULT NULL,
  `pricecustomtime` varchar(500) DEFAULT NULL,
  `priceextratime` varchar(500) DEFAULT NULL,
  `mainvolume` varchar(500) DEFAULT NULL,
  `maxvolume` varchar(500) DEFAULT NULL,
  `maintime` varchar(500) DEFAULT NULL,
  `maxtime` varchar(500) DEFAULT NULL,
  `status_extend` varchar(100) DEFAULT NULL,
  `datelogin` text DEFAULT NULL,
  `proxies` text DEFAULT NULL,
  `inbounds` text DEFAULT NULL,
  `subvip` varchar(60) DEFAULT NULL,
  `changeloc` varchar(60) DEFAULT NULL,
  `on_hold_test` varchar(60) NOT NULL,
  `version_panel` varchar(60) NOT NULL,
  `customvolume` text DEFAULT NULL,
  `hide_user` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `gateway` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `code_product` varchar(200) DEFAULT NULL,
  `name_product` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price_product` varchar(2000) DEFAULT NULL,
  `Volume_constraint` varchar(2000) DEFAULT NULL,
  `Location` varchar(200) DEFAULT NULL,
  `Service_time` varchar(200) DEFAULT NULL,
  `agent` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `data_limit_reset` varchar(200) DEFAULT NULL,
  `one_buy_status` varchar(20) NOT NULL,
  `inbounds` text DEFAULT NULL,
  `proxies` text DEFAULT NULL,
  `category` varchar(400) DEFAULT NULL,
  `hide_panel` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `duration` int(11) DEFAULT 30,
  `volume` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reagent_report`
--

DROP TABLE IF EXISTS `reagent_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reagent_report` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `get_gift` tinyint(1) NOT NULL,
  `time` varchar(50) NOT NULL,
  `reagent` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_other`
--

DROP TABLE IF EXISTS `service_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_other` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(500) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `time` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `type` varchar(1000) NOT NULL,
  `status` varchar(200) NOT NULL,
  `output` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `Bot_Status` varchar(200) DEFAULT NULL,
  `roll_Status` varchar(200) DEFAULT NULL,
  `get_number` varchar(200) DEFAULT NULL,
  `iran_number` varchar(200) DEFAULT NULL,
  `NotUser` varchar(200) DEFAULT NULL,
  `Channel_Report` varchar(600) DEFAULT NULL,
  `limit_usertest_all` varchar(600) DEFAULT NULL,
  `affiliatesstatus` varchar(600) DEFAULT NULL,
  `affiliatespercentage` varchar(600) DEFAULT NULL,
  `removedayc` varchar(600) DEFAULT NULL,
  `showcard` varchar(200) DEFAULT NULL,
  `numbercount` varchar(600) DEFAULT NULL,
  `statusnewuser` varchar(600) DEFAULT NULL,
  `statusagentrequest` varchar(600) DEFAULT NULL,
  `statuscategory` varchar(200) DEFAULT NULL,
  `statusterffh` varchar(200) DEFAULT NULL,
  `volumewarn` varchar(200) DEFAULT NULL,
  `inlinebtnmain` varchar(200) DEFAULT NULL,
  `verifystart` varchar(200) DEFAULT NULL,
  `id_support` varchar(200) DEFAULT NULL,
  `statusnamecustom` varchar(100) DEFAULT NULL,
  `statuscategorygenral` varchar(100) DEFAULT NULL,
  `statussupportpv` varchar(100) DEFAULT NULL,
  `agentreqprice` varchar(100) DEFAULT NULL,
  `bulkbuy` varchar(100) DEFAULT NULL,
  `on_hold_day` varchar(100) DEFAULT NULL,
  `cronvolumere` varchar(100) DEFAULT NULL,
  `verifybucodeuser` varchar(100) DEFAULT NULL,
  `scorestatus` varchar(100) DEFAULT NULL,
  `Lottery_prize` text DEFAULT NULL,
  `wheelـluck` varchar(45) DEFAULT NULL,
  `wheelـluck_price` varchar(45) DEFAULT NULL,
  `btn_status_extned` varchar(45) DEFAULT NULL,
  `daywarn` varchar(45) DEFAULT NULL,
  `categoryhelp` varchar(45) DEFAULT NULL,
  `linkappstatus` varchar(45) DEFAULT NULL,
  `wheelagent` varchar(45) DEFAULT NULL,
  `Lotteryagent` varchar(45) DEFAULT NULL,
  `statusfirstwheel` varchar(45) DEFAULT NULL,
  `statuslimitchangeloc` varchar(45) DEFAULT NULL,
  `Debtsettlement` varchar(45) DEFAULT NULL,
  `Dice` varchar(45) DEFAULT NULL,
  `keyboardmain` text NOT NULL,
  `statusnoteforf` varchar(45) NOT NULL,
  `statuscopycart` varchar(45) NOT NULL,
  `timeauto_not_verify` varchar(20) NOT NULL,
  `status_keyboard_config` varchar(20) DEFAULT NULL,
  `cron_status` text NOT NULL,
  `text_edit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`text_edit`)),
  `limitnumber` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopSetting`
--

DROP TABLE IF EXISTS `shopSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopSetting` (
  `Namevalue` varchar(500) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`Namevalue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_message`
--

DROP TABLE IF EXISTS `support_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_message` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `Tracking` varchar(100) NOT NULL,
  `idsupport` varchar(100) NOT NULL,
  `iduser` varchar(100) NOT NULL,
  `name_departman` varchar(600) NOT NULL,
  `text` text NOT NULL,
  `result` text NOT NULL,
  `time` varchar(200) NOT NULL,
  `status` enum('Answered','Pending','Unseen','Customerresponse','close') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topicid`
--

DROP TABLE IF EXISTS `topicid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topicid` (
  `report` varchar(500) NOT NULL,
  `idreport` text NOT NULL,
  PRIMARY KEY (`report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(500) NOT NULL,
  `limit_usertest` int(100) NOT NULL,
  `roll_Status` tinyint(1) NOT NULL,
  `username` varchar(500) NOT NULL,
  `Processing_value` text NOT NULL,
  `Processing_value_one` text NOT NULL,
  `Processing_value_tow` text NOT NULL,
  `Processing_value_four` text NOT NULL,
  `step` varchar(500) NOT NULL,
  `description_blocking` text DEFAULT NULL,
  `number` varchar(300) NOT NULL,
  `Balance` int(255) NOT NULL,
  `User_Status` varchar(500) NOT NULL,
  `pagenumber` int(10) NOT NULL,
  `message_count` varchar(100) NOT NULL,
  `last_message_time` varchar(100) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `affiliatescount` varchar(100) NOT NULL,
  `affiliates` varchar(100) NOT NULL,
  `namecustom` varchar(300) NOT NULL,
  `number_username` varchar(300) NOT NULL,
  `register` varchar(100) NOT NULL,
  `verify` varchar(100) NOT NULL,
  `cardpayment` varchar(100) NOT NULL,
  `codeInvitation` varchar(100) DEFAULT NULL,
  `pricediscount` varchar(100) DEFAULT '0',
  `hide_mini_app_instruction` varchar(20) DEFAULT '0',
  `maxbuyagent` varchar(100) DEFAULT '0',
  `joinchannel` varchar(100) DEFAULT '0',
  `checkstatus` varchar(50) DEFAULT '0',
  `bottype` text DEFAULT NULL,
  `score` int(255) DEFAULT 0,
  `limitchangeloc` varchar(50) DEFAULT '0',
  `status_cron` varchar(20) DEFAULT '1',
  `expire` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `lang` varchar(5) DEFAULT 'fa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telegram_id` bigint(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `balance` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegram_id` (`telegram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpn_accounts`
--

DROP TABLE IF EXISTS `vpn_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `panel_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `config` text DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpn_panels`
--

DROP TABLE IF EXISTS `vpn_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_panels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wheel_list`
--

DROP TABLE IF EXISTS `wheel_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wheel_list` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `wheel_code` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-24  9:29:54
