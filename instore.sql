-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: instore
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `info` varchar(200) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `option-product_idx` (`id_product`),
  CONSTRAINT `FK1w45v5s5p3n5ir92u8dit3tc0` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'ASUS','золотистый','Производитель процессора:Intel, Оперативная память(RAM):2ГБ, Производитель видеокарты:Intel, Жесткий диск (HDD): 500 ГБ, Диагональ/разрешение:15.6\"/1366x768 пикс.',1),(2,'Lenovo','черный','Производитель процессора:AMD, Оперативная память (RAM):4ГБ, Производитель видеокарты: AMD, Жесткий диск (HDD): 500 ГБ, Диагональ/разрешение	17.3\"/1600x900 пикс.',2),(3,'ASUS','темно-синий','Производитель процессора: Intel, Оперативная память (RAM): 4ГБ, Производитель видеокарты: Intel, Жесткий диск (SSD): 128ГБ, Диагональ/разрешение: 12.5\"/1920x1080 пикс.',3),(4,'Apple','серебристый','Производитель процессора: Intel, Оперативная память (RAM): 8 ГБ, Производитель видеокарты: Intel, Жесткий диск (HDD): 1 ТБ, Операционная система: OS X Yosemite',4),(5,'HP','синий','Производитель процессора:AMD, Оперативная память (RAM): 8 ГБ, Производитель видеокарты: NVIDIA, Жесткий диск (HDD): 1 ТБ, Операционная система: Windows 10 Домашняя 64',5),(6,'HP','черный','Тип процессора: Core i5-4590, Оперативная память (RAM): 4 ГБ, Частота процессора: 3.3 ГГц, Жесткий диск (HDD): 1 ТБ, Операционная система: FreeDOS',6),(7,'Apple','белый','Встроенная память (ROM)	32 ГБ, Разрешение фотокамеры: 5 МПикс, Качество видеосъемки: 1920x1080 Пикс (FullHD), Разрешение фронтальной камеры: 1.2 МПикс, Диагональ/разрешение: 7.9\"/2048х1536 пикс',7),(8,'Huawei','белый','Производитель процессора: Qualcomm, Оперативная память (RAM): 1 ГБ, Встроенная память (ROM): 8 ГБ, Диагональ/разрешение: 8\"/1280x800, Разрешение фотокамеры: 5 МПикс, Качество видеосъемки: 1280x720(HD)',8),(9,'Samsung','черный','Производитель процессора: Spreadtrum, Оперативная память (RAM): 1.5 ГБ, Встроенная память (ROM)	8 ГБ, Диагональ/разрешение	9.6\"/1280x800, Разрешение фотокамеры: 5 МПикс',9),(10,'Canon','черный','Тип принтера: струйный цветной, Тип цветной печати: 4-х цветная, Макс. разреш. фотопечати: 4800 х 1200 т/д, Макс. размер бумаги: А4, Интерфейс связи с ПК: USB 2.0',10),(11,'Kyocera','черный','Тип принтера: лазерный, Макс. разреш. Ч/Б печати: 1200x1200 т/д, Лоток для подачи бумаги: до 500 листов, Интерфейс связи с ПК: USB 2.0',11),(12,'Canon','черный','Тип сканера: планшетный, Цветное сканирование: Да, Тип сканирования: однопроходной, Питание от USB порта: Да, Управление на корпусе: Да, Оптическое разреш. сканера: 2400x4800 т/д',12),(13,'M.M.O.','черный/синий','Серия: Tournament Edition, Проводная мышь: Да, Тип мыши: лазерная, Дизайн корпуса: для правой руки, Время отклика: 1 мсек, Материал корпуса: пластик, Интерфейс связи с ПК: USB 2.0',13),(14,'Lenovo','черный','Серия: Gaming, Проводная клавиатура: Да,Тип клавиш: механические, Программируемые клавиши: 6 шт, Время отклика: 1 мсек, Интерфейс связи с ПК: USB 2.0',14),(15,'Sven','дерево/черный','Тип колонок: 5.1, Мощность фронтальных АС: 2 x 20 Вт, Частотный диапазон фронтальных АС: 125 Гц - 22 кГц, Мощность центральной АС: 20 Вт, Мощность тыловых АС: 2 x 20 Вт',15),(20,'Apple','темно-серый','Операционная система: iOS 9, Поддержка 4G LTE: Да, Диагональ/разрешение: 4.7\"/1334x750 пикс., Разрешение фотокамеры: 8 МПикс',18);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) NOT NULL,
  `delivery_method` varchar(45) NOT NULL,
  `payment_status` varchar(45) NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_client` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product_idx` (`id_product`),
  KEY `orderlist_idx` (`id_user`),
  CONSTRAINT `FK6nm9lmmebvaglq8i87nw3xehj` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj790wqd8cmpk0dvlj8jq5hutj` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKp1jglhdt6fpf5plvbns0gp5ns` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (38,'По карте','Почта России','Оплачен','Доставлен',3,4,62,NULL),(39,'Наличный','Самовывоз','Ожидает оплаты','Ожидает оплаты',1,13,62,NULL),(40,'По карте','Почта России','Оплачен','Отгружен',2,2,62,NULL),(41,'Наличный','Самовывоз','Оплачен','Доставлен',3,18,62,NULL),(42,'По карте','Почта России','Оплачен','Отгружен',2,18,63,NULL),(43,'Наличный','Самовывоз','Ожидает оплаты','Ожидает оплаты',2,1,62,NULL),(44,'Наличный','Самовывоз','Оплачен','Ожидает отгрузки',1,14,62,NULL),(45,'Наличный','Курьером','Ожидает оплаты','Ожидает оплаты',20,13,62,NULL),(46,'По карте','Почта России','Оплачен','Доставлен',2,18,63,NULL),(47,'По карте','Курьером','Оплачен','Отгружен',2,4,66,NULL),(48,'По карте','Курьером','Оплачен','Ожидает отгрузки',2,4,67,NULL),(49,'По карте','Курьером','Оплачен','Ожидает отгрузки',2,7,67,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(45) NOT NULL,
  `weight` int(11) NOT NULL,
  `volume` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `image_path` varchar(45) NOT NULL,
  `id_options` bigint(20) DEFAULT NULL,
  `sell_counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'ASUS X540SA-XX012T',19990.00,'Ноутбуки',2000,'26*381*252',17,'notebook_ASUSX540SA-XX012T_1',NULL,1),(2,'Lenovo IdeaPad G70-35 (80Q50035RK)',31990.00,'Ноутбуки',2900,'28*418*283',13,'notebook_LenovoIdeaPadG70-35(80Q50035RK)_2',NULL,1),(3,'ASUS Transformer Book T300 CHI (FL099T)',42990.00,'Ноутбуки',1430,'17*317*191',20,'notebook_ASUSTransformerBookT300CHI(FL099T)_3',NULL,0),(4,'Apple MacMini i5 2.6',53990.00,'Компьютеры',1200,'40*200*200',3,'computer_AppleMacMinii5_4',NULL,3),(5,'HP Pavilion 550-318ur Y0Y59EA',42990.00,'Компьютеры',7150,'370*170*380',17,'computer_HPPavilion550-318urY0Y59EA_5',NULL,0),(6,'HP EliteDesk 800J7D12EA',45990.00,'Компьютеры',9300,'400*170*440',8,'comptuter_HPEliteDesk800J7D12EA_6',NULL,0),(7,'Apple iPad mini 2',22990.00,'Планшеты',331,'200*135*8',17,'ebook_AppleiPadmini2_7',NULL,1),(8,'Huawei MediaPad T1 8',9990.00,'Планшеты',360,'211*128*8',15,'ebook_HuaweiMediaPadT18_8',NULL,0),(9,'Samsung Galaxy Tab E 9.6 SM-T561',15990.00,'Планшеты',495,'242*150*9',9,'ebook_SamsungGalaxyTabE9.6SM-T561_9',NULL,0),(10,'Струйный принтер Canon PIXMA G1400',9490.00,'Периферийные устройства',4300,'140*450*330',21,'peripherial_CanonPIXMAG1400_10',NULL,0),(11,'Лазерный принтер Kyocera ECOSYS FS-2100D',16390.00,'Периферийные устройства',13500,'380*420*290',19,'peripherial_KyoceraECOSYS-FS-2100D_11',NULL,0),(12,'Сканер Canon LIDE120',4290.00,'Периферийные устройства',1600,'40*250*370',10,'peripherial_CanonLIDE120_12',NULL,0),(13,'Игровая мышь Mad Catz M.M.O. TE Matte Black',5990.00,'Аксессуары',130,'110*22*130',2,'accessories_MadCatzM.M.O.TEMatteBlack_13',NULL,2),(14,'Игровая клавиатура Lenovo Y Mechanical',4990.00,'Аксессуары',1380,'25*530*170',29,'accessries_LenovoYMechanical(GX30L79771)_14',NULL,1),(15,'Колонки компьютерные 5.1 Sven IHOO 5.1P Wood',13990.00,'Аксессуары',2000,'В среднем: 300*168*220',11,'accessories_SvenIHOOMT5.1PWood_15',NULL,0),(18,'Apple iPhone 6 16GB Space Gray (MG472RU/A)',39990.00,'Телефоны',129,'138*67*7',7,'phone_AppleiPhone616GBSpaceGray',NULL,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `datebirth` date NOT NULL,
  `authority` varchar(45) DEFAULT NULL,
  `pay_counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (58,'Александр','Лобов','egor1573@yandex.ru','$2a$12$NMbCJXi.puqeIf/jQAWkuONtQz2SV/BNtxBJfqHlG12awBvuJ.o/K','1995-04-26','ROLE_ADMIN',0),(62,'Александр','Лобов','san-ya26@inbox.ru','$2a$12$6p5FFxdoCL4iCVDrFhmf..S7UXRhF5E5pNh91PRFjsx.hSaYsNYwS','1995-04-26','ROLE_USER',7),(63,'Григорий','Лепс','leps@gmail.com','$2a$12$ySWyePGpXsbVJvZLyRHU4.Aa58xgxJFQmiAFOKbkaQ8Uye8XFFrQe','1970-12-31','ROLE_USER',2),(65,'Васько','Илья','ilyavasko_1997@gmail.com','$2a$12$EJH508hWARATdoRypBxzAOPB9IPtnRHNbR740YVa8KuZLkbZh8ChC','1997-07-31','ROLE_USER',0),(66,'Андрей','Огнев','ronny94@mail.ru','$2a$12$P0j6UXZh7LeZd4tlt5o9DeP8PaXLZJvEPBj40PSNWJK.UBgF8i6pG','1994-10-28','ROLE_USER',1),(67,'Антон','Кисленко','anton96@mail.ru','$2a$12$SXaasg/erJgoaW9QdoXR8uPncT7lR9Ktc9JtfIfoMC24Ofn1EbGyO','1996-08-06','ROLE_USER',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `home` varchar(45) DEFAULT NULL,
  `flat` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client_idx` (`id_user`),
  CONSTRAINT `FK8d11hu4iju0obkl5a59nwpur4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (56,'РФ','Санкт-Петербург','197342','Торжковская','15','271',62),(57,'Россия','Москва',NULL,'Какая-то улица','Какой-то дом','777',63),(59,NULL,'Санкт-Петербург','197342','Торжковская','15','271',65),(60,NULL,NULL,NULL,NULL,'32',NULL,66),(61,NULL,'Спб','662200',NULL,'16',NULL,67);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-28 23:56:26
