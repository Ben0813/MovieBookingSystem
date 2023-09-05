-- Insert data into MovieTheater table
INSERT INTO MovieTheater (name, address) VALUES
('CineComplex', '1000 Bruxelles'),
('Movieland', '5030 Gembloux'),
('CineTech', '5000 Namur') ;

-- Insert data into Auditorium table
INSERT INTO Auditorium (number, capacity, availableSeats, movieTheaterId) VALUES
(1, 100, 100, 1),
(2, 80, 80, 1),
(3, 100, 100, 2);

-- Insert data into Movie table
INSERT INTO Movie (title, duration, genre) VALUES
('The Dark Knight', 152, 'Action/Thriller'),
('Forrest Gump', 142, 'Drame/Comédie'),
('La Haine', 98, 'Drame');

-- Insert data into Screening table
INSERT INTO Screening (time, movieId, auditoriumId) VALUES
('2023-09-02 19:00:00', 1, 1),
('2023-09-02 21:00:00', 2, 2),
('2023-09-04 23:00:00', 3, 3);


-- Insert data into Rate table
INSERT INTO Rate (type, price) VALUES
('Full', 9.20),
('Student', 7.60),
('Child', 5.90);

-- Insert data into Client table
INSERT INTO Client (name, email) VALUES
('Jacques Cousteau', 'deepsea@exemple.fr'),
('François Pignon', 'quiproquo@exemple.fr'),
('Sherlock Holmes', '221B@bakerstreet.uk');

-- Insert data into Booking table
INSERT INTO Booking (screeningId, rateId, clientId, paymentMethod) VALUES
(5, 1, 2, 'Credit Card'),
(4, 2, 1, 'Cash'),
(6, 1, 3, 'Cash');

-- Insert data into PaymentMethod table
INSERT INTO PaymentMethod (method) VALUES
('Credit Card'),
('Cash'),
('PayPal');

-- Insert data into LocalAdmin table
INSERT INTO LocalAdmin (name, movieTheaterId) VALUES
('Jean-Luc Dupont', 3),
('François Leroux', 2),
('Jeroen Van der Veld', 1);

-- Add columns to LocalAdmin table
ALTER TABLE LocalAdmin
ADD COLUMN firstName VARCHAR(255),
ADD COLUMN lastName VARCHAR(255);

-- Update data in LocalAdmin table
UPDATE LocalAdmin SET firstName = 'Jean-Luc', lastName = 'Dupont' WHERE id = 1;
UPDATE LocalAdmin SET firstName = 'François', lastName = 'Leroux' WHERE id = 2;
UPDATE LocalAdmin SET firstName = 'Jeroen', lastName = 'Van der Wiel' WHERE id = 3;

-- Remove column from LocalAdmin table
ALTER TABLE LocalAdmin
DROP COLUMN name;

-- Empty LocalAdmin table
TRUNCATE TABLE LocalAdmin;

INSERT INTO LocalAdmin (firstName, lastName, movieTheaterId) VALUES
('Jeroen', 'Van der Veld', 1),
('François', 'Leroux', 2),
('Jean-Luc', 'Dupont', 3);

-- Add columns to SuperAdmin table
ALTER TABLE SuperAdmin
ADD COLUMN firstName VARCHAR(255),
ADD COLUMN lastName VARCHAR(255);

-- Remove column from SuperAdmin table
ALTER TABLE SuperAdmin
DROP COLUMN name;

-- Insert data into SuperAdmin table
INSERT INTO SuperAdmin (firstName, lastName) VALUES
('Lex', 'Luthor');

-- Add password column to LocalAdmin table
ALTER TABLE LocalAdmin
ADD COLUMN password VARBINARY(256) NOT NULL;

-- Add password column to SuperAdmin table
ALTER TABLE SuperAdmin
ADD COLUMN password VARBINARY(256) NOT NULL;

-- Update password data in LocalAdmin table
UPDATE LocalAdmin SET password = AES_ENCRYPT('password', 'secret_key') WHERE id = 1;

-- Update password data in SuperAdmin table
UPDATE SuperAdmin SET password = AES_ENCRYPT('password', 'secret_key') WHERE id = 1;

-- Descripton of the booking table
DESC Booking;

-- Remove column from Booking table
ALTER TABLE Booking DROP COLUMN paymentMethod;

-- Add column payementMethodId to Boonking table
ALTER TABLE Booking ADD COLUMN paymentMethodId INT;
ALTER TABLE Booking ADD FOREIGN KEY (paymentMethodId) REFERENCES PaymentMethod(id);

-- Insert fictive bookings
INSERT INTO Booking (screeningId, rateId, clientId, paymentMethodId) VALUES (1, 2, 1, 3), (2, 2, 2, 1), (3, 1, 3, 3);




-- This command will create a backup of the MovieBookingSystem database and save it to the Desktop as a SQL file.
mysqldump -u root -p MovieBookingSystem > ~/Desktop/backup.sql

-- This command will restore the MovieBookingSystem database from the backup file located on the Desktop.
mysql -u root -p MovieBookingSystem < ~/Desktop/backup.sql

