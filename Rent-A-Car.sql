CREATE DATABASE RentACar

USE RentACar

CREATE TABLE Vehicles(
Id int PRIMARY KEY IDENTITY(1,1),
Make nvarchar(50) NOT NULL,
Model nvarchar(50) NOT NULL,
LicencePlate nvarchar(20) NOT NULL,
Colour nvarchar(30) NOT NULL,
VehicleClass nvarchar(30) NOT NULL,
VehicleType nvarchar(30) NOT NULL,
OdometerCount decimal(7,1) NOT NULL CHECK(OdometerCount>0),
RegisteredUntil datetime2
)

INSERT INTO Vehicles VALUES
('Ford', 'Focus', 'DA-5846-L', 'Red', 'Hatchback', 'Car', 54280.3, '2021-01-13 00:00'),
('Ford', 'Focus', 'DA-3254-L', 'Black', 'Hatchback', 'Car', 33265.8, '2021-01-13 00:00'),
('Ford', 'Focus', 'DA-1350-L', 'White', 'Hatchback', 'Car', 96312.1, '2021-01-13 00:00'),
('Ford', 'Focus', 'DA-7843-L', 'Orange', 'Hatchback', 'Car', 104020.4, '2021-01-13 00:00'),
('Ford', 'Focus', 'DA-2215-L', 'Teal', 'Hatchback', 'Car', 74365.0, '2021-01-13 00:00'),
('Mercedes', 'C 200D', 'DA-213-PD', 'Cream', 'Sedan', 'Car', 50220.4, '2021-09-16 00:00'),
('Mercedes', 'C 200D', 'DA-460-PD', 'White', 'Sedan', 'Car', 76548.3, '2021-09-16 00:00'),
('Mercedes', 'C 200D', 'DA-238-PD', 'Black', 'Sedan', 'Car', 123486.4, '2021-09-16 00:00'),
('Mercedes', 'C 200D', 'DA-997-PD', 'Orange', 'Sedan', 'Car', 67812.1, '2021-09-16 00:00'),
('Mercedes', 'C 200D', 'DA-456-PD', 'Red', 'Sedan', 'Car', 69420.0, '2021-09-16 00:00'),
('VolksWagen', 'Golf', 'DA-1124-CS', 'White', 'Hatchback', 'Car', 113247.6, '2021-01-01 00:00'),
('VolksWagen', 'Golf', 'DA-3326-CS', 'Black', 'Hatchback', 'Car', 154231.4, '2021-01-01 00:00'),
('VolksWagen', 'Golf', 'DA-2254-CS', 'Grey', 'Hatchback', 'Car', 88888.8, '2021-01-01 00:00'),
('VolksWagen', 'Golf', 'DA-9875-CS', 'Blue', 'Hatchback', 'Car', 99146.7, '2021-01-01 00:00'),
('VolksWagen', 'Golf', 'DA-987-CS', 'Dark blue', 'Hatchback', 'Car', 120000.0, '2021-01-01 00:00'),
('Piaggio', 'TMAX', 'DA-231-MN', 'Black', 'Scooter', 'Motorcycle', 34812.2, '2021-04-28 00:00'),
('Piaggio', 'TMAX', 'DA-476-MN', 'White', 'Scooter', 'Motorcycle', 26145.1, '2021-04-28 00:00'),
('Piaggio', 'TMAX', 'DA-528-MN', 'Grey', 'Scooter', 'Motorcycle', 21436.4, '2021-04-28 00:00'),
('Piaggio', 'TMAX', 'DA-336-MN', 'Blue', 'Scooter', 'Motorcycle', 46217.2, '2021-04-28 00:00'),
('Piaggio', 'TMAX', 'DA-699-MN', 'Orange', 'Scooter', 'Motorcycle', 34578.0, '2021-04-28 00:00')


CREATE TABLE Registrations(
Id int PRIMARY KEY IDENTITY(1,1),
VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
DateRegistered datetime2 NOT NULL
)

INSERT INTO Registrations VALUES
(1,'2020-01-13'),
(2,'2020-01-13'),
(3,'2020-01-13'),
(4,'2020-01-13'),
(5,'2020-01-13'),
(6,'2020-09-16'),
(7,'2020-09-16'),
(8,'2020-09-16'),
(9,'2020-09-16'),
(10,'2020-09-16'),
(11,'2020-01-01'),
(12,'2020-01-01'),
(13,'2020-01-01'),
(14,'2020-01-01'),
(15,'2020-01-01'),
(16,'2020-04-28'),
(17,'2020-04-28'),
(18,'2020-04-28'),
(19,'2020-04-28'),
(20,'2020-04-28')


CREATE TABLE Prices(
Id int PRiMARY KEY IDENTITY(1,1),
VehicleType nvarchar(30) NOT NULL,
TimeOfYear nvarchar(20) NOT NULL,
PriceHalfDay decimal(4,2) NOT NULL CHECK(PriceHalfDay>0)
)

INSERT INTO Prices VALUES
('Hatchback', 'Summer', 36.00),
('Hatchback', 'Winter', 25.49),
('Sedan', 'Summer', 60.00),
('Sedan', 'Winter', 35.49),
('Scooter', 'Summer', 21.50),
('Scooter', 'Winter', 13.00)


CREATE TABLE Employees(
Id int PRIMARY KEY IDENTITY(1,1),
FirstName nvarchar(30) NOT NULL,
LastName nvarchar(30) NOT NULL,
Oib nvarchar(20) NOT NULL UNIQUE
)

INSERT INTO Employees VALUES
('Ante', 'Antić', '87421635487'),
('Mate', 'Matić', '13475682462'),
('Ivo', 'Ivić', '75463569851'),
('Ilija', 'Lozić', '34579613755'),
('Filip', 'Filipović', '79858656260')


CREATE TABLE Sales(
Id int PRiMARY KEY IDENTITY(1,1),
FirstName nvarchar(30) NOT NULL,
LastName nvarchar(30) NOT NULL,
Oib nvarchar(20) NOT NULL,
DateOfBirth datetime2 NOT NULL,
LicenceNumber nvarchar(20) NOT NULL,
CardNumber nvarchar(16) NOT NULL,
VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
RentedOn datetime2 NOT NULL,
RentedUntil datetime2 NOT NULL,
EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL
)

INSERT INTO Sales VALUES
('Magnus', 'Guevara', '12457965324'),
('Jevan', 'Ventura', '34758612446'),
('Freya', 'Whitaker', '31244668259'),
('Chloe', 'Naylor', '75454861336'),
('Braden', 'Sykes', '45763251489'),
('Talha', 'Lovell', '324265656213'),
('Chaim', 'Partrige', '99865478135'),
('Gracey', 'Dean', '41452647986'),
('Caitlyn', 'Denton', '55478633219'),
('Areeb', 'Wharton', '24541798663'),
('Charis', 'Washington', '32145763587'),
('Reggie', 'Sullivan', '79858656263'),
('LeVar', 'Burton', '46758963254'),
('Lilli', 'Ritter', '40035679542'),
('Sarina', 'Phillips', '78903467200'),
('Hilda', 'Carney', '33648571039'),
('Akbar', 'Ray', '99867534215'),
('Sulaiman', 'Mohammad', '21453667985'),
('Manisha', 'Thomson', '30024579851'),
('Glenn', 'Curtis', '36659780412')








