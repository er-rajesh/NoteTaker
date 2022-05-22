/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.29 : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mydb`;

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `id` int NOT NULL,
  `addedDate` datetime(6) DEFAULT NULL,
  `content` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `notes` */

insert  into `notes`(`id`,`addedDate`,`content`,`title`) values 
(3410,'2022-05-19 03:45:08.661000','Abstract method:\r\n\r\nThe method which has only the declaration and not the implementation is called the abstract method and it has the keyword called �abstract�. Declarations ends with a semicolon.','What is meant by Abstract class?'),
(9164,'2022-05-19 02:02:01.485000','Constructor can be explained in detail with enlisted points:\r\nWhen a new object is created in a program a constructor gets invoked corresponding to the class.\r\nThe constructor is a method which has the same name as the class name.\r\n','What do you mean by Constructor?'),
(9575,'2022-05-19 02:03:08.376000','All Java codes are defined in a Class. It has variables and methods.\r\nVariables are attributes which define the state of a class.\r\n','What is a Class?'),
(12313,'2022-05-19 01:41:30.021000','Java is a high-level programming language and is platform-independent.\r\nJava is a collection of objects. It was developed by Sun Microsystems. There are a lot of applications, websites, and games that are developed using Java.','What is JAVA?'),
(19351,'2022-05-19 02:03:48.321000','Inheritance means one class can extend to another class. So that the codes can be reused from one class to another class. The existing class is known as the Super class whereas the derived class is known as a sub class.','What is Inheritance?'),
(28850,'2022-05-19 02:03:20.824000','An instance of a class is called an object. The object has state and behavior.','What is an Object?'),
(40975,'2022-05-19 02:45:03.058000','Multiple inheritances cannot be achieved in java. To overcome this problem the Interface concept is introduced.\r\n\r\nAn interface is a template which has only method declarations and not the method implementation.','What is meant by Interface?'),
(57121,'2022-05-19 02:02:40.056000','Local variables are defined in the method and scope of the variables that exist inside the method itself.\r\n\r\nInstance variable is defined inside the class and outside the method and the scope of the variables exists throughout the class.','What is meant by the Local variable and the Instance variable?'),
(65386,'2022-05-19 01:58:38.491000','Object-oriented\r\nInheritance\r\nEncapsulation\r\nPolymorphism\r\nAbstraction','What are the features of JAVA?'),
(65876,'2022-05-19 02:03:59.873000','Purpose of Encapsulation:\r\n\r\nProtects the code from others.\r\nCode maintainability.','What is Encapsulation?'),
(67975,'2022-05-19 05:01:20.426000','Ordered: It means the values that are stored in a collection is based on the values that are added to the collection. So we can iterate the values from the collection in a specific order.\r\n\r\nSorted: Sorting mechanisms can be applied internally or externally so that the group of objects sorted in a particular collection is based on the properties of the objects.','What is meant by Ordered and Sorted in collections?'),
(73335,'2022-05-19 02:01:24.850000','Eclipse and NetBeans are the IDE�s of JAVA.','Name the Java IDE�s?'),
(89159,'2022-05-19 02:03:35.711000','OOPs concepts include:\r\n\r\nInheritance\r\nEncapsulation\r\nPolymorphism\r\nAbstraction\r\nInterface','What are the OOPs concepts?'),
(96690,'2022-05-19 04:38:26.985000','Answer Java uses Just In Time compiler to enable high performance. It is used to convert the instructions into bytecodes.','How does Java enable high performance?');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
