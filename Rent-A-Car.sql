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
('Ford', 'Focus', 'DA-5846-L', 'Red', 'Hatchback', 'Car', 54280.3, '2020-12-13 00:00'),
('Ford', 'Focus', 'DA-3254-L', 'Black', 'Hatchback', 'Car', 33265.8, '2020-12-13 00:00'),
('Ford', 'Focus', 'DA-1350-L', 'White', 'Hatchback', 'Car', 96312.1, '2020-12-13 00:00'),
('Ford', 'Focus', 'DA-7843-L', 'Orange', 'Hatchback', 'Car', 104020.4, '2020-12-13 00:00'),
('Ford', 'Focus', 'DA-2215-L', 'Teal', 'Hatchback', 'Car', 74365.0, '2020-12-13 00:00'),
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
(1,'2019-12-13'),
(2,'2019-12-13'),
(3,'2019-12-13'),
(4,'2019-12-13'),
(5,'2019-12-13'),
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
('Magnus', 'Guevara', '12457965324', '1995-09-15 00:00', '754631258', '4848579562145685', '1', '2019-09-03 00:00', '2019-09-20 00:00', 1),
('Magnus', 'Guevara', '12457965324', '1995-09-15 00:00', '754631258', '4848579562145685', '1', '2020-09-03 00:00', '2020-09-20 00:00', 1),
('Jevan', 'Ventura', '34758612446', '1968-05-18 00:00', '625483125', '3325647895964251', '2', '2020-10-15 00:00', '2020-11-15 00:00', 2),
('Freya', 'Whitaker', '31244668259', '1954-12-23 00:00', '625978460', '3325679845124678', '3', '2020-11-23 00:00', '2020-11-30 00:00', 3),
('Chloe', 'Naylor', '75454861336', '1984-03-03 00:00', '322487963', '3356248790064512', '4', '2020-12-14 00:00', '2020-12-16 00:00', 4),
('Braden', 'Sykes', '45763251489', '1999-04-01 00:00', '300145732', '4848756213798543', '5', '2020-01-30 00:00', '2020-02-05 00:00', 5),
('Talha', 'Lovell', '324265656213', '1998-11-11 00:00', '325097654', '2222316487596945', '6', '2020-02-12 00:00', '2020-02-20 00:00', 1),
('Chaim', 'Partrige', '99865478135', '1979-08-09 00:00', '325047896', '3325648011654879', '7', '2020-03-03 00:00', '2020-03-10 00:00', 2),
('Gracey', 'Dean', '41452647986', '1965-09-14 00:00', '321654987', '3321547965846324', '8', '2020-09-26 00:00', '2020-09-30 00:00', 3),
('Caitlyn', 'Denton', '55478633219', '2000-08-16 00:00', '200134500', '4433265487952164', '9', '2020-05-28 00:00', '2020-06-05 00:00', 4),
('Areeb', 'Wharton', '24541798663', '1993-08-07 00:00', '332546789', '2215487965856354', '10', '2020-06-18 00:00', '2020-06-20 00:00', 5),
('Charis', 'Washington', '32145763587', '1984-07-27 00:00', '321564789', '1231548795632548', '11', '2020-07-13 00:00', '2020-07-15 00:00', 1),
('John', 'Clease', '24556213487', '1965-08-06 00:00', '234451278', '1123457856245213', '12', '2020-08-06 00:00', '2020-08-26', 2),
('LeVar', 'Burton', '46758963254', '1974-06-28 00:00', '325568432', '3321547856623452', '13', '2020-09-16 00:00', '2020-09-30 00:00', 3),
('Lilli', 'Ritter', '40035679542', '1968-10-31 00:00', '155473569', '3325648751200965', '14', '2020-09-22 00:00', '2020-09-28 00:00', 4),
('Sarina', 'Phillips', '78903467200', '1990-10-22 00:00', '654879324', '1124587986213301', '15', '2020-10-03 00:00', '2020-10-20 00:00', 5),
('Hilda', 'Carney', '33648571039', '1991-03-03 00:00', '214457896', '4848579562315780', '16', '2020-11-05 00:00', '2020-11-20 00:00', 1),
('Akbar', 'Ray', '99867534215', '1984-02-15 00:00', '325409786', '2231547965659842', '17', '2020-11-08 00:00', '2020-11-12 00:00', 2),
('Sulaiman', 'Mohammad', '21453667985', '1952-04-07 00:00', '321554978', '221478955214763', '18', '2020-06-27 00:00', '2020-07-10 00:00', 3),
('Manisha', 'Thomson', '30024579851', '1974-05-16 00:00', '748954621', '3321457856950120', '19', '2020-07-01 00:00', '2020-07-08 00:00', 4),
('Glenn', 'Curtis', '36659780412', '1999-09-26 00:00', '320245670', '3325648795124573', '20', '2020-07-02 00:00', '2020-07-08 00:00', 5)


--Dohvatiti sva vozila kojima je istekla registracija

SELECT Id, Make, Model, LicencePlate, RegisteredUntil FROM Vehicles WHERE RegisteredUntil<GETDATE()

--Dohvatiti sva vozila kojima registracija ističe unutar idućih mjesec dana

SELECT * FROM Vehicles v WHERE DATEDIFF(day, GETDATE(), v.RegisteredUntil)<30

--Dohvatiti koliko vozila postoji po vrsti

SELECT v.VehicleType AS VehicleType, COUNT(*) AS VehicleCount FROM Vehicles v
GROUP BY VehicleType

--Dohvatiti zadnjih 5 najmova koje je ostvario neki zaposlenik

SELECT TOP 5 * FROM Sales s
JOIN Employees e ON s.EmployeeId = e.Id
WHERE e.FirstName = 'Ante' AND e.LastName = 'Antić'
ORDER BY RentedOn DESC

--Izračunati ukupnu cijenu najma za određeni najam (hint: pripaziti na najmove koji imaju miješanu zimsku i ljetnu tarifu tijekom trajanja)



--Dohvatiti sve kupce najmova ikad, s tim da se ne ponavljaju u rezultatima

SELECT DISTINCT Oib, FirstName, LastName, DateOfBirth, LicenceNumber FROM Sales

--Dohvatiti za svakog zaposlenika timestamp zadnjeg najma kojeg je ostvario

SELECT TOP 1 RentedOn FROM Sales s
JOIN Employees e on e.Id = s.EmployeeId
WHERE e.FirstName = 'Ante' AND e.LastName = 'Antić'
ORDER BY s.RentedOn DESC

--Dohvatiti broj vozila svake marke koji rent-a-car ima

SELECT Count(*) AS VehicleCount, v.Make FROM Vehicles v
GROUP BY v.Make

--Arhivirati sve najmove koji su završili u novu tablicu. Osim već postojećih podataka u najmu, arhivirana tablica će sadržavati i podatak koliko je taj najam koštao.



--Pobrojati koliko je najmova bilo po mjesecu, u svakom mjesecu 2020. godine.



--Za sva vozila određene vrste, osim informaciju o vozilu, ispisati tekstualnu informaciju treba li registrirati vozilo unutar idućih mjesec dana (‘Treba registraciju’, ‘Ne treba registraciju’)



--Dohvatiti broj najmova po vrsti vozila čija duljina najma (razdoblje) prelazi prosječnu duljinu najma

SELECT v.VehicleType, COUNT(*) AS SalesCount FROM Sales s
JOIN Vehicles v ON s.VehicleId = v.Id
WHERE DATEDIFF(day, s.RentedOn, s.RentedUntil)>(SELECT AVG(CAST(DATEDIFF(day, s.RentedOn, RentedUntil) AS float)) FROM Sales s)
GROUP BY v.VehicleType