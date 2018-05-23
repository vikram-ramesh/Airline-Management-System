CREATE DATABASE  IF NOT EXISTS `airlinemanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `airlinemanagement`;
-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: airlinemanagement
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircrafts` (
  `Aircraft_Id` int(11) NOT NULL,
  `Aircraft_Number` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `ManufacturedBy` varchar(50) NOT NULL,
  `Year_of_Manufacture` year(4) NOT NULL,
  PRIMARY KEY (`Aircraft_Id`),
  UNIQUE KEY `Aircraft_Id_UNIQUE` (`Aircraft_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES (1,500,800,'Boeing',2005),(2,501,800,'Airbus',2001),(3,502,950,'Barr',2010),(4,503,950,'Boeing',2010),(5,504,800,'Dassault Falcon',2009);
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airfare`
--

DROP TABLE IF EXISTS `airfare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airfare` (
  `AirfareID` int(11) NOT NULL AUTO_INCREMENT,
  `FC_Fare` int(11) DEFAULT NULL,
  `BC_Fare` int(11) DEFAULT NULL,
  `EC_Fare` varchar(45) DEFAULT NULL,
  `FSC` char(1) DEFAULT NULL,
  `Flight_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AirfareID`),
  KEY `fk_Flight_ID_idx` (`Flight_ID`),
  CONSTRAINT `fk_Flight_ID` FOREIGN KEY (`Flight_ID`) REFERENCES `flight` (`Flight_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airfare`
--

LOCK TABLES `airfare` WRITE;
/*!40000 ALTER TABLE `airfare` DISABLE KEYS */;
INSERT INTO `airfare` VALUES (1,650,550,'450','Y',500),(2,650,550,'450','Y',501),(3,500,400,'300','Y',502),(4,800,700,'600','Y',503),(5,900,700,'600','Y',504),(6,1800,700,'600','Y',505);
/*!40000 ALTER TABLE `airfare` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ticket_history
before update on airfare
for each row 
begin
/*set @fID = (select airfare.Flight_ID from airfare where old.flight_ID);
set @fcfare = (select airfare.FC_Fare from airfare where airfare.Flight_ID = @fID);
set @bcfare = (select airfare.BC_Fare from airfare where airfare.Flight_ID = @fID);
set @ecfare = (select airfare.EC_Fare from airfare where airfare.Flight_ID = @fID);*/
insert into Ticket_Price_History values(curdate(),old.flight_ID,old.FC_Fare,old.BC_Fare,old.EC_Fare);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baggage` (
  `BaggageID` int(11) NOT NULL,
  `Baggage_Weight` int(11) DEFAULT NULL,
  `Boarding_Passengers_Boarding_Passenger_ID` int(11) NOT NULL,
  PRIMARY KEY (`BaggageID`,`Boarding_Passengers_Boarding_Passenger_ID`),
  UNIQUE KEY `BaggageID_UNIQUE` (`BaggageID`),
  KEY `fk_Baggage_Boarding_Passengers1_idx` (`Boarding_Passengers_Boarding_Passenger_ID`),
  CONSTRAINT `fk_Baggage_Boarding_Passengers1` FOREIGN KEY (`Boarding_Passengers_Boarding_Passenger_ID`) REFERENCES `boarding_passengers` (`Boarding_Passenger_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boarding_passengers`
--

DROP TABLE IF EXISTS `boarding_passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boarding_passengers` (
  `Boarding_Passenger_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PassengerID` int(11) NOT NULL,
  `FlightID` int(11) DEFAULT NULL,
  `Meal_Option` enum('Veg','Non Veg') DEFAULT NULL,
  PRIMARY KEY (`Boarding_Passenger_ID`),
  KEY `FlightID_idx` (`FlightID`),
  KEY `Passenger_PassengerID` (`PassengerID`,`Boarding_Passenger_ID`),
  CONSTRAINT `FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`Flight_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boarding_passengers`
--

LOCK TABLES `boarding_passengers` WRITE;
/*!40000 ALTER TABLE `boarding_passengers` DISABLE KEYS */;
/*!40000 ALTER TABLE `boarding_passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `Booking_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Booking_Date` date DEFAULT NULL,
  `Flight_ID` int(11) DEFAULT NULL,
  `BookingStatusID` int(11) DEFAULT NULL,
  `TravelClassID` int(11) DEFAULT NULL,
  `PassengerID` int(11) DEFAULT NULL,
  `Booking_Fare` double DEFAULT NULL,
  `Refund` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Booking_ID`),
  UNIQUE KEY `Transaction_ID_UNIQUE` (`Booking_ID`),
  KEY `BookingStatusID_idx` (`BookingStatusID`),
  KEY `TravelClassID_idx` (`TravelClassID`),
  KEY `Flight_ID_idx` (`Flight_ID`),
  KEY `fk_PassengerID_idx` (`PassengerID`),
  CONSTRAINT `BookingStatusID` FOREIGN KEY (`BookingStatusID`) REFERENCES `bookingstatus` (`BookingStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Flight_ID` FOREIGN KEY (`Flight_ID`) REFERENCES `flight` (`Flight_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TravelClassID` FOREIGN KEY (`TravelClassID`) REFERENCES `travelclass` (`TravelClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`Passenger_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8515 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (8514,'2017-12-10',505,101,1,1013,1800,180);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingstatus`
--

DROP TABLE IF EXISTS `bookingstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingstatus` (
  `BookingStatusID` int(11) NOT NULL,
  `BookingStatusCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookingStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingstatus`
--

LOCK TABLES `bookingstatus` WRITE;
/*!40000 ALTER TABLE `bookingstatus` DISABLE KEYS */;
INSERT INTO `bookingstatus` VALUES (100,'Reserved'),(101,'Cancelled'),(102,'No Show');
/*!40000 ALTER TABLE `bookingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delay_fights`
--

DROP TABLE IF EXISTS `delay_fights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delay_fights` (
  `flight_Id` int(11) DEFAULT NULL,
  `original_time` time DEFAULT NULL,
  `new_time` time DEFAULT NULL,
  `updated_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay_fights`
--

LOCK TABLES `delay_fights` WRITE;
/*!40000 ALTER TABLE `delay_fights` DISABLE KEYS */;
/*!40000 ALTER TABLE `delay_fights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `Discount_ID` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Discount_Amount` int(11) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Discount_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `Employee_ID` int(11) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Tel_No` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Street_Name` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zipcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID_UNIQUE` (`Employee_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Tel_No_UNIQUE` (`Tel_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (340928,'Yulma','Davidovitch','1982-07-06','ydavidovitch0@mediafire.com','713-392-0063','Pilot','27 Cody Crossing','Houston','Texas','20099'),(391893,'Larine','Matteo','1987-10-11','lmatteo4@1688.com','501-757-0507','Air Hostess','8 Arizona Terrace','Little Rock','Arkansas','07522'),(767645,'Nikolos','McNevin','1976-03-24','nmcnevin8@nbcnews.com','619-827-3137','Pilot','541 Old Gate Place','San Diego','California','33124'),(767879,'Nick','Haley','1976-03-24','nhaley8@nbcnews.com','619-827-1572','Pilot','587 Old Gate Place','San Diego','California','76096'),(2663586,'Packston','Cosgrive','1978-04-15','pcosgrive9@multiply.com','716-172-5317','Co-Pilot','5683 Northview Court','Buffalo','New York','25705'),(2663759,'Jackson','Corey','1978-04-18','jcorey@multiply.com','716-172-5688','Co-Pilot','583 Northview Court','Buffalo','New York','76096'),(3385797,'Shea','Mearing','1981-11-05','smearing3@admin.ch','907-128-1200','Air Hostess','14463 Atwood Crossing','Anchorage','Alaska','45223'),(4368318,'Sofia','Paddeley','1980-05-23','spaddeley7@mlb.com','386-605-7695','Air Hostess','697 Hollow Ridge Avenue','Daytona Beach','Florida','29579'),(4368562,'Sofia','Pandey','1990-08-23','spandey7@mlb.com','386-605-8655','Air Hostess','697 Hollow Ridge Avenue','Daytona Beach','Boston','76096'),(6583374,'Had','Ranyelld','1977-04-13','hranyelld1@mozilla.com','310-142-5277','Co-Pilot','4759 Declaration Place','San Francisco','California','20062'),(8299666,'Gus','Cokely','1974-04-27','gcokely6@nytimes.com','651-434-4796','Air Host','91 Pond Way','Saint Paul','Minnesota','32813'),(8634270,'Jackquelin','Lainge','1984-05-08','jlainge2@skype.com','718-548-6195','Air Hostess','43359 Huxley Trail','Rochister','New York','71914'),(9556290,'Aurel','Mainland','1988-01-04','amainland5@tripod.com','915-113-4684','Air Hostess','3 Cordelia Park','El Paso','Texas','29240');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `Flight_ID` int(11) NOT NULL,
  `Departure_Date` date DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL,
  `Arrival_Time` time DEFAULT NULL,
  `Departure` varchar(45) DEFAULT NULL,
  `Arrival` varchar(45) DEFAULT NULL,
  `Aircraft_Id` int(11) NOT NULL,
  `RouteID` int(11) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Flight_ID`,`Aircraft_Id`),
  UNIQUE KEY `Flight_ID_UNIQUE` (`Flight_ID`),
  KEY `fk_Flight_Schedule_Aircrafts_idx` (`Aircraft_Id`),
  KEY `fk_Route_ID_idx` (`RouteID`),
  CONSTRAINT `fk_Flight_Schedule_Aircrafts` FOREIGN KEY (`Aircraft_Id`) REFERENCES `aircrafts` (`Aircraft_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Route_ID` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`Route_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (500,'2017-12-14','16:29:00',NULL,'Boston','New York City',1,NULL,'On time'),(501,'2017-12-16','08:19:00',NULL,'New York City','Boston',1,NULL,'On time'),(502,'2017-12-18','08:05:00',NULL,'Boston','Los Angles',3,601,'On time'),(503,'2017-12-14','12:54:00',NULL,'Boston','Seattle',4,600,'On time'),(504,'2017-12-14','07:59:00',NULL,'Seattle','Miami',5,603,'On time'),(505,'2017-12-15','12:54:00',NULL,'Boston','Miami',2,604,'Delayed'),(506,'2018-03-15','12:54:00','16:29:00','Boston','Miami',2,601,'On time');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew`
--

DROP TABLE IF EXISTS `flight_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_crew` (
  `FlightID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`FlightID`,`EmployeeID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `Employee_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`Employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Flight_Flight_ID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`Flight_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew`
--

LOCK TABLES `flight_crew` WRITE;
/*!40000 ALTER TABLE `flight_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_schedule_has_routes`
--

DROP TABLE IF EXISTS `flight_schedule_has_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_schedule_has_routes` (
  `Flight_Schedule_Flight_ID` int(11) NOT NULL,
  `Flight_Schedule_Aircraft_Id` int(11) NOT NULL,
  `Routes_Route_ID` int(11) NOT NULL,
  PRIMARY KEY (`Flight_Schedule_Flight_ID`,`Flight_Schedule_Aircraft_Id`,`Routes_Route_ID`),
  KEY `fk_Flight_Schedule_has_Routes_Routes1_idx` (`Routes_Route_ID`),
  KEY `fk_Flight_Schedule_has_Routes_Flight_Schedule1_idx` (`Flight_Schedule_Flight_ID`,`Flight_Schedule_Aircraft_Id`),
  CONSTRAINT `fk_Flight_Schedule_has_Routes_Flight_Schedule1` FOREIGN KEY (`Flight_Schedule_Flight_ID`, `Flight_Schedule_Aircraft_Id`) REFERENCES `flight` (`Flight_ID`, `Aircraft_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Schedule_has_Routes_Routes1` FOREIGN KEY (`Routes_Route_ID`) REFERENCES `routes` (`Route_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_schedule_has_routes`
--

LOCK TABLES `flight_schedule_has_routes` WRITE;
/*!40000 ALTER TABLE `flight_schedule_has_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_schedule_has_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengers` (
  `Passenger_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) DEFAULT NULL,
  `Tel_No` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`),
  UNIQUE KEY `Customer_ID_UNIQUE` (`Passenger_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1001,'Riannon','Muggeridge','2016-12-10','0231 Westport Road','Georgia','Macon','31210','478-313-7886','rmuggeridge0@washingtonpost.com'),(1002,'Michal','Kliesl','1974-04-29','8875 Corben Court','Florida','Fort Lauderdale','33336','754-751-7213','mkliesl1@pen.io'),(1003,'Kandace','Kopisch','1987-04-17','5 Muir Hill','Florida','Tampa','33647','813-146-0507','kkopische@pbs.org'),(1004,'Edgar','Cagan','1973-07-25','823 Dovetail Court','Pennsylvania','Pittsburgh','15255','412-988-7958','ecagan2@bloglines.com'),(1005,'Nissa','Schindler','1988-08-10','768 Reindahl Parkway','Florida','Spring Hill','34611','352-214-4085','nschindler3@cornell.edu'),(1006,'Linda','Normanville','2017-03-10','59566 Killdeer Circle','Kentucky','Louisville','40280','502-513-3520','lnormanville4@discuz.net'),(1007,'Ardine','Keunemann','1982-05-06','850 Nobel Plaza','Iowa','Des Moines','50315','515-697-3327','akeunemann5@twitpic.com'),(1008,'Derward','Rospars','1993-09-19','86626 Atwood Crossing','West Virginia','Charleston','25326','304-494-7051','drospars6@ted.com'),(1009,'Nappie','O\'Murtagh','1998-01-14','69 Almo Park','Pennsylvania','Philadelphia','19184','215-847-2218','nomurtagh7@newsvine.com'),(1010,'Sibley','Surr','2003-02-14','726 Lindbergh Parkway','Connecticut','New Haven','06538','203-407-6453','ssurr8@cafepress.com'),(1011,'Rupert','Stoad','1999-02-03','06 Kensington Junction','Alabama','Birmingham','35295','205-935-1444','rstoad9@walmart.com'),(1012,'Welsh','Loeber','2001-05-10','76883 Holmberg Way','Colorado','Denver','80223','720-598-9174','wloebera@trellian.com'),(1013,'Talbot','Korneichik','2013-07-21','098 Kim Center','Virginia','Richmond','23203','804-226-2846','tkorneichikb@cnbc.com'),(1014,'Star','Gladtbach','1993-09-14','8 Coleman Circle','Illinois','Chicago','60652','312-534-5480','sgladtbachc@blogspot.com'),(1015,'Sunny','Barttrum','1989-11-26','29286 Service Terrace','Texas','Galveston','77554','409-583-2080','sbarttrumd@wix.com'),(1016,'Kandy','Kopi','1987-04-17','5 Muir Hill','Florida','Tampa','33647','813-146-0507','kkopische@pbs.org'),(1017,'Kandy','Kopi','1987-04-17','5 Muir Hill','Florida','Tampa','33647','813-146-0507','kkopische@pbs.org');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` int(11) DEFAULT NULL,
  `PaymentMethodID` int(11) DEFAULT NULL,
  `PaymentStatusID` int(11) DEFAULT NULL,
  `Bookings_Booking_ID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `PaymentStatusID_idx` (`PaymentStatusID`),
  KEY `PaymentMethodID_idx` (`PaymentMethodID`),
  CONSTRAINT `PaymentMethodID` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PaymentStatusID` FOREIGN KEY (`PaymentStatusID`) REFERENCES `paymentstatus` (`PaymentStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int(11) NOT NULL,
  `PaymentMethodCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Cash'),(2,'Credit Card'),(3,'Debit Card'),(4,'PayPal');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentstatus`
--

DROP TABLE IF EXISTS `paymentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentstatus` (
  `PaymentStatusID` int(11) NOT NULL,
  `PaymentStatusCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentstatus`
--

LOCK TABLES `paymentstatus` WRITE;
/*!40000 ALTER TABLE `paymentstatus` DISABLE KEYS */;
INSERT INTO `paymentstatus` VALUES (1,'In transaction'),(2,'Advance payment'),(3,'EMI'),(4,'Paid');
/*!40000 ALTER TABLE `paymentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `Route_ID` int(11) NOT NULL,
  `Departure` varchar(45) DEFAULT NULL,
  `Arrival` varchar(45) DEFAULT NULL,
  `Layover` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Route_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (600,'Boston','Seattle','Denver'),(601,'Boston','Los Angles','Dallas'),(602,'Los Angles','Boston','Denver'),(603,'Seattle','Miami','Dallas'),(604,'Boston','Miami','Philadelphia');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_price_history`
--

DROP TABLE IF EXISTS `ticket_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_price_history` (
  `Date_Of_Change` date DEFAULT NULL,
  `flight_ID` int(11) DEFAULT NULL,
  `fcFare` int(11) DEFAULT NULL,
  `bcFare` int(11) DEFAULT NULL,
  `ecFare` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_price_history`
--

LOCK TABLES `ticket_price_history` WRITE;
/*!40000 ALTER TABLE `ticket_price_history` DISABLE KEYS */;
INSERT INTO `ticket_price_history` VALUES ('2017-12-10',506,800,700,600),('2017-12-10',506,1000,700,600);
/*!40000 ALTER TABLE `ticket_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelclass`
--

DROP TABLE IF EXISTS `travelclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelclass` (
  `TravelClassID` int(11) NOT NULL,
  `TravelCLassCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TravelClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelclass`
--

LOCK TABLES `travelclass` WRITE;
/*!40000 ALTER TABLE `travelclass` DISABLE KEYS */;
INSERT INTO `travelclass` VALUES (1,'FC'),(2,'BC'),(3,'EC');
/*!40000 ALTER TABLE `travelclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_firstclass_passengers`
--

DROP TABLE IF EXISTS `v_firstclass_passengers`;
/*!50001 DROP VIEW IF EXISTS `v_firstclass_passengers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_firstclass_passengers` AS SELECT 
 1 AS `passenger_ID`,
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Flight_ID`,
 1 AS `Booking_ID`,
 1 AS `BookingStatusCode`,
 1 AS `TravelCLassCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'airlinemanagement'
--

--
-- Dumping routines for database 'airlinemanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_passengers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_passengers`(
IN First_Name varchar(50),
IN Last_Name varchar(50),
IN Date_Of_Birth date,
IN Address varchar(50),
IN City varchar(50),
IN State varchar(50),
IN Zipcode varchar(50),
IN Tel_No varchar(50),
IN Email varchar(50))
BEGIN
    insert into passengers (
    First_Name, 
    Last_Name,  
    Date_Of_Birth,
    Address, City,
    State, Zipcode,
    Tel_No, Email)
    values (First_Name ,Last_Name,Date_Of_Birth,Address,City,State,Zipcode,Tel_No,Email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_alternate_flights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_alternate_flights`(
IN Flight_code int)
begin
	set @departure = (select  flight.Departure from flight where Flight_ID = Flight_code);
    set @arrival = 	 (select  flight.Arrival from flight where Flight_ID = Flight_code);
    
    select * from flight where flight.Departure = @departure and flight.Arrival = @arrival and
    flight.status <> 'Delayed';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_booking_seat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_booking_seat`(
IN passenger_ID int,
IN Flight_code int,
IN TravelClassID int,
IN booking_status_ID int)
begin

    if(TravelClassID = 1)  then
		set @Total_fare = (Select airfare.FC_Fare from airfare inner join flight
        on airfare.Flight_ID = flight.Flight_ID where flight.Flight_ID = Flight_code);
        set @total_days = (select DATEDIFF(flight.Departure_Date,curdate()) 
							from flight where  Flight_ID = Flight_code);
				if(@total_days > 90)then
					set @Total_fare = @Total_fare * 0.6;
                elseif(@total_days > 60)then
					set @Total_fare = @Total_fare * 0.8;
				else
					set @Total_fare = @Total_fare;
                end if;
        insert into bookings(Booking_Date,Flight_ID,BookingStatusID,TravelClassID,PassengerID,Booking_Fare) values(curdate(),Flight_code,booking_status_ID,1,passenger_ID,@Total_fare);
    
    elseif(TravelClassID = 2)  then
		Set @Total_fare = (Select airfare.FC_Fare from airfare inner join flight
        on airfare.Flight_ID = flight.Flight_ID where flight.Flight_ID = Flight_code);
        set @total_days = (select DATEDIFF(flight.Departure_Date,curdate()) 
							from flight where  flight.Flight_ID = Flight_code);
				if(@total_days > 90)then
					set @Total_fare = @Total_fare * 0.6;
                elseif(@total_days > 60)then
					set @Total_fare = @Total_fare * 0.8;
				else
					set @Total_fare = @Total_fare;
                end if;
        insert into bookings (Booking_Date,Flight_ID,BookingStatusID,TravelClassID,PassengerID,Booking_Fare) values(curdate(),Flight_code,booking_status_ID,2,passenger_ID,@Total_fare);
	else 
		Set @Total_fare = (Select airfare.FC_Fare from airfare inner join flight
        on airfare.Flight_ID = flight.Flight_ID where flight.Flight_ID = Flight_ID);
        set @total_days = (select DATEDIFF(flight.Departure_Date,curdate()) 
							from flight where  flight.Flight_ID = Flight_code);
				if(@total_days > 90)then
					set @Total_fare = @Total_fare * 0.6;
                elseif(@total_days > 60)then
					set @Total_fare = @Total_fare * 0.8;
				else
					set @Total_fare = @Total_fare;
                end if;
        insert into bookings (Booking_Date,Flight_ID,BookingStatusID,TravelClassID,PassengerID,Booking_Fare) values(curdate(),Flight_code,booking_status_ID,3,passenger_ID,@Total_fare);
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cancel_Ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cancel_Ticket`(
IN Booking_Code int)
begin
	set @flight_Code = (select bookings.Flight_ID from bookings 
							where bookings.Booking_ID = Booking_Code);
	set @No_Of_Days = (select DATEDIFF(flight.Departure_Date,curdate()) 
							from flight where  flight.Flight_ID = @flight_Code);
	if(@total_days > 90)then
		set @Total_Refund = (Select bookings.Booking_Fare from bookings 
									where bookings.Booking_ID = Booking_Code);    
	elseif(@total_days <90 and @total_days >60)then
		set @Total_Refund = 0.6*(Select bookings.Booking_Fare from bookings 
									where bookings.Booking_ID = Booking_Code);
    elseif(@total_days <60 and @total_days >30)then
		set @Total_Refund = 0.4*(Select bookings.Booking_Fare from bookings 
									where bookings.Booking_ID = Booking_Code);
	else
		set @Total_Refund = 0.1*(Select bookings.Booking_Fare from bookings 
									where bookings.Booking_ID = Booking_Code);
	end if;
    Update bookings set BookingStatusID = 101, refund = @Total_Refund where bookings.Booking_ID = Booking_Code;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delayed_flights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delayed_flights`(IN delaytime int, IN flightNO int,IN actualAt time)
BEGIN
    update flight set Departure_Time = addtime(actualAt,delaytime), Status = 'Delayed'
    where Flight_ID = flightNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_firstclass_passengers`
--

/*!50001 DROP VIEW IF EXISTS `v_firstclass_passengers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_firstclass_passengers` AS select `passengers`.`Passenger_ID` AS `passenger_ID`,`passengers`.`First_Name` AS `First_Name`,`passengers`.`Last_Name` AS `Last_Name`,`bookings`.`Flight_ID` AS `Flight_ID`,`bookings`.`Booking_ID` AS `Booking_ID`,`bookingstatus`.`BookingStatusCode` AS `BookingStatusCode`,`travelclass`.`TravelCLassCode` AS `TravelCLassCode` from ((((`passengers` join `bookings` on((`passengers`.`Passenger_ID` = `bookings`.`PassengerID`))) join `bookingstatus` on((`bookingstatus`.`BookingStatusID` = `bookings`.`BookingStatusID`))) join `travelclass` on((`travelclass`.`TravelClassID` = `bookings`.`TravelClassID`))) join `flight` on((`bookings`.`Flight_ID` = `flight`.`Flight_ID`))) where ((`bookings`.`TravelClassID` = 1) and (`flight`.`Status` = 'Delayed')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 15:15:59
