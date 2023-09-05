-- Creation of the database
CREATE DATABASE MovieBookingSystem;
USE MovieBookingSystem;

-- Creation of the MovieTheater table
CREATE TABLE MovieTheater (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Creation of the Auditorium table
CREATE TABLE Auditorium (
    id INT PRIMARY KEY AUTO_INCREMENT,
    number INT NOT NULL,
    capacity INT NOT NULL,
    availableSeats INT NOT NULL,
    movieTheaterId INT,
    FOREIGN KEY (movieTheaterId) REFERENCES MovieTheater(id)
);

-- Creation of the Movie table
CREATE TABLE Movie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    genre VARCHAR(50)
);

-- Creation of the Screening table
CREATE TABLE Screening (
    id INT PRIMARY KEY AUTO_INCREMENT,
    time DATETIME NOT NULL,
    movieId INT,
    auditoriumId INT,
    FOREIGN KEY (movieId) REFERENCES Movie(id),
    FOREIGN KEY (auditoriumId) REFERENCES Auditorium(id)
);

-- Creation of the Rate table
CREATE TABLE Rate (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL
);

-- Creation of the Client table
CREATE TABLE Client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Creation of the PaymentMethod table
CREATE TABLE PaymentMethod (
    id INT PRIMARY KEY AUTO_INCREMENT,
    method VARCHAR(50) NOT NULL
);

-- Creation of the Booking table
CREATE TABLE Booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    screeningId INT,
    rateId INT,
    clientId INT,
    paymentMethodId INT,
    FOREIGN KEY (screeningId) REFERENCES Screening(id),
    FOREIGN KEY (rateId) REFERENCES Rate(id),
    FOREIGN KEY (clientId) REFERENCES Client(id),
    FOREIGN KEY (paymentMethodId) REFERENCES PaymentMethod(id)
);

-- Creation of the LocalAdmin table
CREATE TABLE LocalAdmin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    movieTheaterId INT,
    password VARBINARY(256) NOT NULL,
    FOREIGN KEY (movieTheaterId) REFERENCES MovieTheater(id)
);

-- Creation of the SuperAdmin table
CREATE TABLE SuperAdmin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    password VARBINARY(256) NOT NULL
);
