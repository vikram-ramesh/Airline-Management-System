INSERT INTO aircrafts values(1,500,800,'Boeing',2005);
INSERT INTO aircrafts values(2,501,800,'Airbus',2001);
INSERT INTO aircrafts values(3,502,950,'Barr',2010);
INSERT INTO aircrafts values(4,503,950,'Boeing',2010);
INSERT INTO aircrafts values(5,504,800,'Dassault Falcon',2009);
select * from aircrafts;

INSERT INTO bookingstatus values(100,'Reserved');
INSERT INTO bookingstatus values(101,'Cancelled');
INSERT INTO bookingstatus values(102,'No Show');
select * from bookingstatus;

insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('0340928', 'Yulma', 'Davidovitch', '1982-07-06', 'ydavidovitch0@mediafire.com', '713-392-0063', 'Pilot', '27 Cody Crossing', 'Houston', 'Texas','20099');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('6583374', 'Had', 'Ranyelld', '1977-04-13', 'hranyelld1@mozilla.com', '310-142-5277', 'Co-Pilot', '4759 Declaration Place', 'San Francisco', 'California','20062');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('8634270', 'Jackquelin', 'Lainge', '1984-05-08', 'jlainge2@skype.com', '718-548-6195', 'Air Hostess', '43359 Huxley Trail', 'Rochister', 'New York','71914');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('3385797', 'Shea', 'Mearing', '1981-11-05', 'smearing3@admin.ch', '907-128-1200', 'Air Hostess', '14463 Atwood Crossing', 'Anchorage', 'Alaska','45223');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('0391893', 'Larine', 'Matteo', '1987-10-11', 'lmatteo4@1688.com', '501-757-0507', 'Air Hostess', '8 Arizona Terrace', 'Little Rock', 'Arkansas','07522');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('9556290', 'Aurel', 'Mainland', '1988-01-04', 'amainland5@tripod.com', '915-113-4684', 'Air Hostess', '3 Cordelia Park', 'El Paso', 'Texas','29240');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('8299666', 'Gus', 'Cokely', '1974-04-27', 'gcokely6@nytimes.com', '651-434-4796', 'Air Host', '91 Pond Way', 'Saint Paul', 'Minnesota','32813');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('4368318', 'Sofia', 'Paddeley', '1980-05-23', 'spaddeley7@mlb.com', '386-605-7695', 'Air Hostess', '697 Hollow Ridge Avenue', 'Daytona Beach', 'Florida','29579');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('0767645', 'Nikolos', 'McNevin', '1976-03-24', 'nmcnevin8@nbcnews.com', '619-827-3137', 'Pilot', '541 Old Gate Place', 'San Diego', 'California','33124');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('2663586', 'Packston', 'Cosgrive', '1978-04-15', 'pcosgrive9@multiply.com', '716-172-5317', 'Co-Pilot', '5683 Northview Court', 'Buffalo', 'New York','25705');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('4368562', 'Sofia', 'Pandey', '1990-08-23', 'spandey7@mlb.com', '386-605-8655', 'Air Hostess', '697 Hollow Ridge Avenue', 'Daytona Beach', 'Boston','76096');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('0767879', 'Nick', 'Haley', '1976-03-24', 'nhaley8@nbcnews.com', '619-827-1572', 'Pilot', '587 Old Gate Place', 'San Diego', 'California','76096');
insert into employees (Employee_Id, First_Name, Last_Name, Date_Of_Birth, Email, Tel_No, Role , Street_Name, City, State, Zipcode) values ('2663759', 'Jackson', 'Corey', '1978-04-18', 'jcorey@multiply.com', '716-172-5688', 'Co-Pilot', '583 Northview Court', 'Buffalo', 'New York','76096');
select * from employees;


insert into flight values(500,'2017-12-14','16:29:00','17:29:00','Boston','New York City',1,NULL,'On time');   
insert into flight values(501,'2017-12-16','8:19:00','9:29:00','New York City','Boston',1,NULL,'On time');
insert into flight values(502,'2017-12-18','8:05:00','20:29:00','Boston','Los Angles',3,601,'On time');
insert into flight values(503,'2017-12-14','12:54:00','10:29:00','Boston','Seattle',4,600,'On time');
insert into flight values(504,'2017-12-14','7:59:00','20:29:00','Seattle','Miami',5,603,'On time');
insert into flight values(505,'2017-12-15','12:54:00','16:29:00','Boston','Miami',2,604,'On time');
select * from flight;

insert into routes values(600,'Boston','Seattle','Denver');
insert into routes values(601,'Boston','Los Angles','Dallas');
insert into routes values(602,'Los Angles','Boston','Denver');
insert into routes values(603,'Seattle','Miami','Dallas');
insert into routes values(604,'Boston','Miami','Philadelphia');
select * from routes;

insert into airlinemanagement.flight_crew values(500,340928);
insert into airlinemanagement.flight_crew values(500,6583374);
insert into airlinemanagement.flight_crew values(500,8634270);
insert into airlinemanagement.flight_crew values(500,3385797);
insert into airlinemanagement.flight_crew values(500,8299666);

insert into airlinemanagement.flight_crew values(501,340928);
insert into airlinemanagement.flight_crew values(501,6583374);
insert into airlinemanagement.flight_crew values(501,8634270);
insert into airlinemanagement.flight_crew values(501,3385797);
insert into airlinemanagement.flight_crew values(501,8299666);

insert into airlinemanagement.flight_crew values(502,0767645);
insert into airlinemanagement.flight_crew values(502,2663586);
insert into airlinemanagement.flight_crew values(502,4368562);
insert into airlinemanagement.flight_crew values(502,4368318);
insert into airlinemanagement.flight_crew values(502,8299666);
select * from airlinemanagement.flight_crew;

ALTER TABLE passengers AUTO_INCREMENT=1001;
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Riannon', 'Muggeridge', '2016-12-10', '0231 Westport Road', 'Macon', 'Georgia', '31210', '478-313-7886', 'rmuggeridge0@washingtonpost.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Michal', 'Kliesl', '1974-04-29', '8875 Corben Court', 'Fort Lauderdale', 'Florida', '33336', '754-751-7213', 'mkliesl1@pen.io');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Edgar', 'Cagan', '1973-07-25', '823 Dovetail Court', 'Pittsburgh', 'Pennsylvania', '15255', '412-988-7958', 'ecagan2@bloglines.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Nissa', 'Schindler', '1988-08-10', '768 Reindahl Parkway', 'Spring Hill', 'Florida', '34611', '352-214-4085', 'nschindler3@cornell.edu');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Linda', 'Normanville', '2017-03-10', '59566 Killdeer Circle', 'Louisville', 'Kentucky', '40280', '502-513-3520', 'lnormanville4@discuz.net');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Ardine', 'Keunemann', '1982-05-06', '850 Nobel Plaza', 'Des Moines', 'Iowa', '50315', '515-697-3327', 'akeunemann5@twitpic.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Derward', 'Rospars', '1993-09-19/', '86626 Atwood Crossing', 'Charleston', 'West Virginia', '25326', '304-494-7051', 'drospars6@ted.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Nappie', 'O''Murtagh', '1998-01-14', '69 Almo Park', 'Philadelphia', 'Pennsylvania', '19184', '215-847-2218', 'nomurtagh7@newsvine.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Sibley', 'Surr', '2003-02-14', '726 Lindbergh Parkway', 'New Haven', 'Connecticut', '06538', '203-407-6453', 'ssurr8@cafepress.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Rupert', 'Stoad', '1999-02-03', '06 Kensington Junction', 'Birmingham', 'Alabama', '35295', '205-935-1444', 'rstoad9@walmart.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Welsh', 'Loeber', '2001-05-10', '76883 Holmberg Way', 'Denver', 'Colorado', '80223', '720-598-9174', 'wloebera@trellian.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Talbot', 'Korneichik', '2013-07-21', '098 Kim Center', 'Richmond', 'Virginia', '23203', '804-226-2846', 'tkorneichikb@cnbc.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Star', 'Gladtbach', '1993-09-14', '8 Coleman Circle', 'Chicago', 'Illinois', '60652', '312-534-5480', 'sgladtbachc@blogspot.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Sunny', 'Barttrum', '1989-11-26', '29286 Service Terrace', 'Galveston', 'Texas', '77554', '409-583-2080', 'sbarttrumd@wix.com');
insert into passengers (First_Name, Last_Name, Date_Of_Birth, Address, City, State, Zipcode, Tel_No, Email) values ('Kandace', 'Kopisch', '1987-04-17', '5 Muir Hill', 'Tampa', 'Florida', '33647', '813-146-0507', 'kkopische@pbs.org');
select * from passengers;

insert into paymentstatus values(1,'In transaction');
insert into paymentstatus values(2,'Advance payment');
insert into paymentstatus values(3,'EMI');
insert into paymentstatus values(4,'Paid');
select * from paymentstatus;

insert into paymentmethod values(1,'Cash');
insert into paymentmethod values(2,'Credit Card');
insert into paymentmethod values(3,'Debit Card');
insert into paymentmethod values(4,'PayPal');
select * from paymentmethod;

insert into travelclass values(1,'FC');
insert into travelclass value(2,'BC');
insert into travelclass values(3,'EC');
select * from travelclass;

ALTER TABLE airfare AUTO_INCREMENT=1;
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(650,550,450,'Y',500);
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(650,550,450,'Y',501);
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(500,400,300,'Y',502);
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(800,700,600,'Y',503);
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(900,700,600,'Y',504);
insert into airfare (FC_Fare,BC_Fare,EC_Fare,FSC,Flight_ID) values(1800,700,600,'Y',505);
select * from airfare;

ALTER TABLE bookings AUTO_INCREMENT=1;

ALTER TABLE boarding_passengers AUTO_INCREMENT=1;
insert into boarding_passengers (PassengerID,FlightID,Meal_Option) values (1004,505,'Veg');
insert into boarding_passengers (PassengerID,FlightID,Meal_Option) values (1005,505,'Non Veg');
insert into boarding_passengers (PassengerID,FlightID,Meal_Option) values (1006,505,'Veg');
insert into boarding_passengers (PassengerID,FlightID,Meal_Option) values (1007,505,'Veg');
insert into boarding_passengers (PassengerID,FlightID,Meal_Option) values (1008,505,'Veg');
select * from boarding_passengers;

ALTER TABLE baggage AUTO_INCREMENT=1;
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(15,1);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(10,1);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(25,2);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(15,2);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(5,3);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(15,4);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(15,4);
insert into baggage (Baggage_Weight,Boarding_Passengers_Boarding_Passenger_ID) values(30,5);
select * from baggage;

CREATE TABLE IF NOT EXISTS aircraft_seats (
	 aircraft_id	 	 	 INTEGER	 	 NOT NULL,
	 seat_num	 	 	 	 VARCHAR(3)	 NOT NULL,
	 travelclassID	 	 	 	 INTEGER	 	 NOT NULL,
	 PRIMARY KEY (aircraft_id, seat_num),
	 FOREIGN KEY (aircraft_id)	 REFERENCES aircrafts(aircraft_id),
	 FOREIGN KEY (travelclassID) REFERENCES travelclass(TravelClassID)
);

insert into aircraft_seats values(1,'1A',1),(1,'1B',1),(1,'2A',1),(1,'2B',1),(1,'3A',2),(1,'3B',2),(1,'4A',2),(1,'4B',2),(1,'5A',3),(1,'5B',3),
                                 (1,'6A',1),(1,'6B',3),(1,'7A',1),(1,'7B',3),(2,'1A',1),(2,'1B',1),(2,'2A',1),(2,'2B',1),(2,'3A',2),(2,'3B',2),
                                 (2,'4A',2),(2,'4B',2),(2,'5A',3),(2,'5B',3),(2,'6A',1),(2,'6B',3),(2,'7A',1),(2,'7B',3),(3,'1A',1),(3,'1B',1),
								 (3,'2A',1),(3,'2B',1),(3,'3A',2),(3,'3B',2),(3,'4A',2),(3,'4B',2),(3,'5A',3),(3,'5B',3),(3,'6A',1),(3,'6B',3),
                                 (3,'7A',1),(3,'7B',3);
                                 
                                 
insert into payment values(1,curdate(),800,2,1,8514);

select * from payment;
select * from bookings;
                                 
	