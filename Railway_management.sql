-- Create the database if not exists
CREATE DATABASE IF NOT EXISTS RailwayManagement;

-- Switch to the created database
USE RailwayManagement;

-- Create tables

-- Table to store information about trains
CREATE TABLE tbl_trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100) NOT NULL,
    DepartureStation VARCHAR(255) NOT NULL,
    ArrivalStation VARCHAR(255) NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    TotalSeats INT NOT NULL
);

-- Insert values into tbl_trains
INSERT INTO tbl_trains (TrainName, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, TotalSeats)
VALUES
    ('ExpressOne', 'StationA', 'StationB', '08:00:00', '12:00:00', 150),
    ('LocalTwo', 'StationB', 'StationC', '10:00:00', '13:30:00', 100),
    ('SuperFastThree', 'StationC', 'StationD', '12:30:00', '16:30:00', 200),
    ('SwiftFour', 'StationD', 'StationE', '14:00:00', '18:00:00', 120),
    ('RapidFive', 'StationE', 'StationF', '16:30:00', '20:30:00', 180),
    ('MetroSix', 'StationF', 'StationG', '18:00:00', '22:00:00', 160),
    ('ExpressSeven', 'StationG', 'StationH', '20:30:00', '01:00:00', 220),
    ('LocalEight', 'StationH', 'StationI', '22:00:00', '03:00:00', 90),
    ('SuperFastNine', 'StationI', 'StationJ', '00:30:00', '05:30:00', 200),
    ('SwiftTen', 'StationJ', 'StationK', '02:00:00', '07:00:00', 120);

SELECT * FROM tbl_trains;

-- Table to store information about passengers
CREATE TABLE tbl_passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

-- Insert values into tbl_passengers
INSERT INTO tbl_passengers (PassengerName, Age, Gender, Email, Phone)
VALUES
    ('John Doe', 25, 'Male', 'john.doe@example.com', '555-1234'),
    ('Jane Smith', 30, 'Female', 'jane.smith@example.com', '555-5678'),
    ('Bob Johnson', 22, 'Male', 'bob.johnson@example.com', '555-9012'),
    ('Alice White', 28, 'Female', 'alice.white@example.com', '555-3456'),
    ('David Brown', 35, 'Male', 'david.brown@example.com', '555-7890'),
    ('Emily Davis', 27, 'Female', 'emily.davis@example.com', '555-2345'),
    ('Michael Wilson', 40, 'Male', 'michael.wilson@example.com', '555-6789'),
    ('Sophia Lee', 26, 'Female', 'sophia.lee@example.com', '555-4321'),
    ('Daniel Taylor', 32, 'Male', 'daniel.taylor@example.com', '555-8765'),
    ('Olivia Miller', 29, 'Female', 'olivia.miller@example.com', '555-2109');

SELECT * FROM tbl_passengers;

-- Table to store information about bookings
CREATE TABLE tbl_bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    PassengerID INT,
    BookingDate DATE NOT NULL,
    SeatNumber INT NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES tbl_trains(TrainID),
    FOREIGN KEY (PassengerID) REFERENCES tbl_passengers(PassengerID)
);

-- Insert values into tbl_bookings
INSERT INTO tbl_bookings (TrainID, PassengerID, BookingDate, SeatNumber)
VALUES
    (1, 1, '2024-01-21', 15),
    (2, 2, '2024-01-22', 8),
    (3, 3, '2024-01-23', 12),
    (4, 4, '2024-01-24', 5),
    (5, 5, '2024-01-25', 20),
    (6, 6, '2024-01-26', 10),
    (1, 7, '2024-01-27', 18),
    (2, 8, '2024-01-28', 7),
    (3, 9, '2024-01-29', 14),
    (4, 10, '2024-01-30', 3);

SELECT * FROM tbl_bookings;

-- Table to store information about train schedules
CREATE TABLE tbl_train_schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    StationName VARCHAR(255) NOT NULL,
    ArrivalTime TIME NOT NULL,
    DepartureTime TIME NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES tbl_trains(TrainID)
);

-- Insert values into tbl_train_schedules
INSERT INTO tbl_train_schedules (TrainID, StationName, ArrivalTime, DepartureTime)
VALUES
    (1, 'Station A', '08:00:00', '08:15:00'),
    (1, 'Station B', '09:00:00', '09:10:00'),
    (1, 'Station C', '10:30:00', '10:45:00'),
    (2, 'Station X', '11:15:00', '11:30:00'),
    (2, 'Station Y', '12:30:00', '12:45:00'),
    (2, 'Station Z', '14:00:00', '14:15:00'),
    (3, 'Station P', '15:45:00', '16:00:00'),
    (3, 'Station Q', '17:00:00', '17:15:00'),
    (3, 'Station R', '18:30:00', '18:45:00'),
    (4, 'Station M', '20:15:00', '20:30:00');
    
    SELECT * FROM tbl_train_schedules;
    
-- Table to store information about stations
CREATE TABLE tbl_stations (StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(255) NOT NULL);

-- Insert values into tbl_stations
INSERT INTO tbl_stations (StationName)
VALUES
    ('Station A'),
    ('Station B'),
    ('Station C'),
    ('Station X'),
    ('Station Y'),
    ('Station Z'),
    ('Station P'),
    ('Station Q'),
    ('Station R'),
    ('Station M');

SELECT * FROM tbl_stations;

show tables;

-- Retrieve all trains with their departure and arrival stations:
SELECT TrainName, DepartureStation, ArrivalStation
FROM tbl_trains;

-- Retrieve bookings with details about the train, passenger, and seat number:
SELECT b.BookingID, t.TrainName, p.PassengerName, b.BookingDate, b.SeatNumber
FROM tbl_bookings b
INNER JOIN tbl_trains t ON b.TrainID = t.TrainID
INNER JOIN tbl_passengers p ON b.PassengerID = p.PassengerID;

-- Retrieve the schedule of a specific train:
SELECT ts.ScheduleID, t.TrainName, ts.StationName, ts.ArrivalTime, ts.DepartureTime
FROM tbl_train_schedules ts
INNER JOIN tbl_trains t ON ts.TrainID = t.TrainID
WHERE t.TrainName = 'ExpressOne';

-- Retrieve trains departing from a specific station:
SELECT t.TrainName, t.DepartureStation, t.ArrivalStation, t.DepartureTime
FROM tbl_trains t
WHERE t.DepartureStation = 'StationB';

-- Retrieve available seats for a specific train:
SELECT t.TrainName, t.TotalSeats - COUNT(b.BookingID) AS AvailableSeats
FROM tbl_trains t
LEFT JOIN tbl_bookings b ON t.TrainID = b.TrainID
WHERE t.TrainName = 'ExpressOne'
GROUP BY t.TrainName, t.TotalSeats;

-- Retrieve passengers who booked a seat on a specific train:
SELECT p.PassengerName, b.SeatNumber
FROM tbl_passengers p
INNER JOIN tbl_bookings b ON p.PassengerID = b.PassengerID
WHERE b.TrainID = 1;

-- Retrieve stations with names starting with 'Station':
SELECT *
FROM tbl_stations
WHERE StationName LIKE 'Station%';

-- Retrieve train schedules with departure times between 12:00 PM and 6:00 PM:
SELECT ts.TrainID, ts.StationName, ts.ArrivalTime, ts.DepartureTime
FROM tbl_train_schedules ts
WHERE ts.DepartureTime BETWEEN '12:00:00' AND '18:00:00';

-- Retrieve passengers with a specific email domain:
SELECT *
FROM tbl_passengers
WHERE Email LIKE '%@example.com';

-- Retrieve all stations except a specific one:
SELECT *
FROM tbl_stations
WHERE StationName <> 'Station M';

-- Retrieve the busiest station (most arrivals and departures combined):
SELECT StationName, COUNT(*) AS TotalTraffic
FROM (
    SELECT DepartureStation AS StationName FROM tbl_trains
    UNION ALL
    SELECT ArrivalStation AS StationName FROM tbl_trains
) AS StationTraffic
GROUP BY StationName
ORDER BY TotalTraffic DESC
LIMIT 1;

-- Retrieve the passenger with the highest number of bookings:
SELECT p.PassengerID, p.PassengerName, COUNT(b.BookingID) AS TotalBookings
FROM tbl_passengers p
LEFT JOIN tbl_bookings b ON p.PassengerID = b.PassengerID
GROUP BY p.PassengerID, p.PassengerName
ORDER BY TotalBookings DESC
LIMIT 1;

-- Retrieve passengers who have booked a seat on every train:
SELECT p.PassengerID, p.PassengerName
FROM tbl_passengers p
WHERE NOT EXISTS (
    SELECT t.TrainID
    FROM tbl_trains t
    WHERE NOT EXISTS (
        SELECT 1
        FROM tbl_bookings b
        WHERE b.PassengerID = p.PassengerID AND b.TrainID = t.TrainID
    )
);

-- Retrieve the average number of seats booked per train:
SELECT AVG(BookedSeats) AS AvgBookedSeats
FROM (
    SELECT t.TrainID, COUNT(b.SeatNumber) AS BookedSeats
    FROM tbl_trains t
    LEFT JOIN tbl_bookings b ON t.TrainID = b.TrainID
    GROUP BY t.TrainID
) AS TrainBookingStats;

-- Retrieve the percentage of total seats booked for each train:
SELECT t.TrainID, t.TrainName, 
       COUNT(b.BookingID) * 100.0 / t.TotalSeats AS PercentageBooked
FROM tbl_trains t
LEFT JOIN tbl_bookings b ON t.TrainID = b.TrainID
GROUP BY t.TrainID, t.TrainName, t.TotalSeats;




