create database blood_bank_database;
use blood_bank_database;

-- Patient Table:
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(300) NOT NULL,
    Blood_Group VARCHAR(6) NOT NULL,
    Disease CHAR(2) CHECK (Disease IN ('A', 'B', 'AB', 'O')),
    Patient_Contact BIGINT,
    Patient_Address VARCHAR(200)
);

-- Donor Table:
CREATE TABLE Donor (
    Donor_ID INT PRIMARY KEY,
    Donor_Name VARCHAR(300) NOT NULL,
    Medical_Report VARCHAR(100) NOT NULL CHECK (Medical_Report IN ('Satisfactory', 'Not Satisfactory')),
    Donor_Contact BIGINT,
    Donor_Address VARCHAR(200),
    Donate_Date DATE NOT NULL
);

-- Blood_Bank Table:
CREATE TABLE Blood_Bank (
    Blood_Bank_ID INT PRIMARY KEY,
    Blood_Bank_Name VARCHAR(300) NOT NULL,
    Blood_Bank_Contact BIGINT,
    Blood_Bank_Address VARCHAR(200),
    Patient_ID INT,
    Donor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);

-- Blood Inventory Table:
CREATE TABLE Blood_Inventory (
    Blood_ID INT PRIMARY KEY,
    Blood_Type VARCHAR(6) NOT NULL,
    Quantity INT,
    Expiration_Date DATE,
    Storage_Location VARCHAR(100)
);

-- Blood Donation History Table:
CREATE TABLE Blood_Donation_History (
    Donation_ID INT PRIMARY KEY,
    Donor_ID INT,
    Donation_Date DATE,
    Donation_Details VARCHAR(300),
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);

-- Blood Request Table:
CREATE TABLE Blood_Request (
    Request_ID INT PRIMARY KEY,
    Patient_ID INT,
    Blood_Type VARCHAR(6) NOT NULL,
    Quantity INT,
    Request_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

-- Blood Transfusion Log Table:
CREATE TABLE Blood_Transfusion_Log (
    Transfusion_ID INT PRIMARY KEY,
    Patient_ID INT,
    Donor_ID INT,
    Blood_Type VARCHAR(6) NOT NULL,
    Transfusion_Date DATE,
    Transfusion_Details VARCHAR(300),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);

INSERT INTO Patient (Patient_ID, Patient_Name, Blood_Group, Disease, Patient_Contact, Patient_Address)
VALUES
    (1, 'John Doe', 'A+', 'A', 1234567890, '123 Main St, City'),
    (2, 'Jane Smith', 'B-', 'O', 9876543210, '456 Elm St, Town'),
    (3, 'Bob Johnson', 'O+', 'B', 5555555555, '789 Oak St, Village'),
    (4, 'Emily Brown', 'A-', 'O', NULL, '101 Pine St, Forest'),
    (5, 'Michael Wilson', 'AB+', 'A', 4444444444, '202 Cedar St, Hills'),
    (6, 'Sophia Davis', 'B+', 'B', 6666666666, '303 Oak St, Valley'),
    (7, 'William Lee', 'O-', 'A', 7777777777, '404 Elm St, River'),
    (8, 'Olivia Clark', 'A+', 'B', 8888888888, '505 Maple St, Meadow'),
    (9, 'James Taylor', 'B-', 'O', 9999999999, '606 Pine St, Canyon'),
    (10, 'Ava Adams', 'O+', 'B', 1111111111, '707 Oak St, Desert'),
    (11, 'Lucas Miller', 'B+', 'B', NULL, '808 Pine St, Hills'),
    (12, 'Ella White', 'A-', 'A', 1212121212, '12 Main St, City'),
    (13, 'Sophie Wilson', 'B-', 'O', 1313131313, '13 Elm St, Town'),
    (14, 'Mason Davis', 'O+', 'B', 1414141414, '14 Oak St, Village'),
    (15, 'Liam Brown', 'A+', 'O', NULL, '15 Pine St, Forest'),
    (16, 'Olivia Johnson', 'AB+', 'A', 1616161616, '16 Cedar St, Hills'),
    (17, 'Ethan Lee', 'B+', 'B', 1717171717, '17 Oak St, Valley'),
    (18, 'Aiden Clark', 'O-', 'A', 1818181818, '18 Elm St, River'),
    (19, 'Chloe Taylor', 'A+', 'B', 1919191919, '19 Maple St, Meadow'),
    (20, 'Harper Adams', 'B-', 'O', NULL, '20 Pine St, Canyon'),
    (21, 'Mia Smith', 'O+', 'A', 2121212121, '21 Oak St, Desert'),
    (22, 'Isabella Miller', 'B+', 'B', 2222222222, '22 Pine St, Hills'),
    (23, 'Amelia Wilson', 'O-', 'B', NULL, '23 Elm St, Village'),
    (24, 'Liam Davis', 'A+', 'A', 2424242424, '24 Main St, City'),
    (25, 'Noah Smith', 'B-', 'O', 2525252525, '25 Elm St, Town'),
    (26, 'Ava Johnson', 'O+', 'B', 2626262626, '26 Oak St, Village'),
    (27, 'Sophia Lee', 'A-', 'O', NULL, '27 Pine St, Forest'),
    (28, 'Emma Brown', 'AB+', 'A', 2828282828, '28 Cedar St, Hills'),
    (29, 'Charlotte Clark', 'B+', 'B', 2929292929, '29 Oak St, Valley'),
    (30, 'Liam Davis', 'O-', 'A', 3030303030, '30 Elm St, River'),
    (31, 'Mason Adams', 'A+', 'B', 3131313131, '31 Maple St, Meadow'),
    (32, 'Noah Smith', 'B-', 'O', NULL, '32 Pine St, Canyon'),
    (33, 'Oliver Taylor', 'O+', 'A', 3333333333, '33 Oak St, Desert'),
    (34, 'Elijah Miller', 'B+', 'B', 3434343434, '34 Pine St, Hills'),
    (35, 'Ava Wilson', 'O-', 'B', NULL, '35 Elm St, Village'),
    (36, 'Sophia Davis', 'A+', 'A', 3636363636, '36 Main St, City'),
    (37, 'Olivia Lee', 'B-', 'O', 3737373737, '37 Elm St, Town'),
    (38, 'Mia Clark', 'O+', 'B', 3838383838, '38 Oak St, Village'),
    (39, 'Amelia Brown', 'A-', 'O', NULL, '39 Pine St, Forest'),
    (40, 'Aiden Adams', 'AB+', 'A', 4040404040, '40 Cedar St, Hills'),
    (41, 'Noah Smith', 'B+', 'B', 4141414141, '41 Oak St, Valley'),
    (42, 'Ava Taylor', 'O-', 'A', 4242424242, '42 Elm St, River'),
    (43, 'Oliver Wilson', 'A+', 'B', 4343434343, '43 Maple St, Meadow'),
    (44, 'Sophie Johnson', 'B-', 'O', NULL, '44 Pine St, Canyon'),
    (45, 'Ella Smith', 'O+', 'A', 4545454545, '45 Oak St, Desert'),
    (46, 'Mason Lee', 'B+', 'B', 4646464646, '46 Pine St, Hills'),
    (47, 'Aiden Adams', 'O-', 'B', NULL, '47 Elm St, Village'),
    (48, 'Liam Davis', 'A+', 'A', 4848484848, '48 Main St, City'),
    (49, 'Olivia Brown', 'B-', 'O', 4949494949, '49 Elm St, Town'),
    (50, 'Noah Clark', 'O+', 'B', 5050505050, '50 Oak St, Village'),
    (51, 'Emma Taylor', 'A-', 'O', NULL, '51 Pine St, Forest'),
    (52, 'Ava Johnson', 'AB+', 'A', 5252525252, '52 Cedar St, Hills'),
    (53, 'Sophia Lee', 'B+', 'B', 5353535353, '53 Oak St, Valley'),
    (54, 'Amelia Adams', 'O-', 'A', 5454545454, '54 Elm St, River'),
    (55, 'Liam Wilson', 'A+', 'B', 5555555555, '55 Maple St, Meadow'),
    (56, 'Olivia Davis', 'B-', 'O', NULL, '56 Pine St, Canyon');


INSERT INTO Donor (Donor_ID, Donor_Name, Medical_Report, Donor_Contact, Donor_Address, Donate_Date)
VALUES
    (1, 'Alice Brown', 'Satisfactory', 2345678901, '789 Pine St, City', '2023-10-04'),
    (2, 'Charlie Wilson', 'Not Satisfactory', 3456789012, '567 Cedar St, Town', '2023-10-05'),
    (3, 'Eva Davis', 'Satisfactory', 4567890123, '890 Maple St, Village', '2023-10-06'),
    (4, 'David Smith', 'Satisfactory', NULL, '123 Elm St, Forest', '2023-10-07'),
    (5, 'Grace Johnson', 'Satisfactory', 1111222233, '456 Oak St, Hills', '2023-10-08'),
    (6, 'Lucas Miller', 'Not Satisfactory', 4444333322, '789 Pine St, Valley', '2023-10-09'),
    (7, 'Lily Turner', 'Satisfactory', 5555666677, '404 Cedar St, River', '2023-10-10'),
    (8, 'Ethan Hall', 'Satisfactory', 8888888888, '505 Elm St, Meadow', '2023-10-11'),
    (9, 'Chloe Harris', 'Not Satisfactory', 7777666677, '606 Oak St, Canyon', '2023-10-12'),
    (10, 'Mason White', 'Satisfactory', 6666555444, '707 Maple St, Desert', '2023-10-13'),
    (11, 'Emma Turner', 'Not Satisfactory', NULL, '808 Pine St, Hills', '2023-10-14'),
    (12, 'Sophia Davis', 'Satisfactory', 9999999999, '303 Elm St, Valley', '2023-10-15'),
    (13, 'James Taylor', 'Not Satisfactory', 8888777777, '404 Cedar St, River', '2023-10-16'),
    (14, 'Ava Adams', 'Satisfactory', 7777666666, '505 Elm St, Meadow', '2023-10-17'),
    (15, 'Lucas Miller', 'Satisfactory', 6666555555, '606 Oak St, Canyon', '2023-10-18'),
    (16, 'Olivia Clark', 'Not Satisfactory', 5555666677, '707 Maple St, Desert', '2023-10-19'),
    (17, 'William Lee', 'Satisfactory', 4444333322, '808 Pine St, Hills', '2023-10-20'),
    (18, 'Ella White', 'Satisfactory', 2345678901, '101 Elm St, City', '2023-10-21'),
    (19, 'Sophie Wilson', 'Satisfactory', 3456789012, '202 Cedar St, Town', '2023-10-22'),
    (20, 'Mason Davis', 'Not Satisfactory', 4567890123, '303 Maple St, Village', '2023-10-23'),
    (21, 'Liam Brown', 'Satisfactory', NULL, '404 Oak St, Forest', '2023-10-24'),
    (22, 'Olivia Johnson', 'Satisfactory', 1111222233, '505 Pine St, Hills', '2023-10-25'),
    (23, 'Ethan Lee', 'Not Satisfactory', 4444333322, '606 Elm St, Valley', '2023-10-26'),
    (24, 'Aiden Clark', 'Satisfactory', 5555666677, '707 Cedar St, River', '2023-10-27'),
    (25, 'Chloe Taylor', 'Satisfactory', 8888888888, '808 Elm St, Meadow', '2023-10-28'),
    (26, 'Liam Davis', 'Not Satisfactory', 7777666677, '909 Maple St, Canyon', '2023-10-29'),
    (27, 'Mason Adams', 'Satisfactory', 6666555555, '101 Pine St, Desert', '2023-10-30'),
    (28, 'Emma Smith', 'Satisfactory', 4444333322, '202 Cedar St, Hills', '2023-10-31'),
    (29, 'Noah Harris', 'Not Satisfactory', 5555666677, '303 Oak St, Valley', '2023-11-01'),
    (30, 'Oliver Turner', 'Satisfactory', 7777666677, '404 Elm St, River', '2023-11-02'),
    (31, 'Sophie Davis', 'Satisfactory', 2345678901, '505 Cedar St, Meadow', '2023-11-03'),
    (32, 'Aiden Adams', 'Not Satisfactory', NULL, '606 Pine St, Canyon', '2023-11-04'),
    (33, 'Liam Davis', 'Satisfactory', 6666555444, '707 Elm St, Desert', '2023-11-05'),
    (34, 'Olivia Brown', 'Satisfactory', 5555666677, '808 Oak St, Hills', '2023-11-06'),
    (35, 'Noah Clark', 'Not Satisfactory', 4444333322, '909 Maple St, Valley', '2023-11-07'),
    (36, 'Emma Taylor', 'Satisfactory', 2345678901, '101 Elm St, City', '2023-11-08'),
    (37, 'Ava Johnson', 'Satisfactory', 3456789012, '202 Cedar St, Town', '2023-11-09'),
    (38, 'Sophia Lee', 'Not Satisfactory', 4567890123, '303 Maple St, Village', '2023-11-10'),
    (39, 'Amelia Adams', 'Satisfactory', 5555666677, '404 Oak St, Forest', '2023-11-11'),
    (40, 'Liam Wilson', 'Satisfactory', NULL, '505 Pine St, Hills', '2023-11-12'),
    (41, 'Olivia Davis', 'Not Satisfactory', 1111222233, '606 Elm St, Valley', '2023-11-13'),
    (42, 'Ella Wilson', 'Satisfactory', 4444333322, '707 Cedar St, River', '2023-11-14'),
    (43, 'Chloe Turner', 'Satisfactory', 8888888888, '808 Elm St, Meadow', '2023-11-15'),
    (44, 'Ethan Smith', 'Not Satisfactory', 7777666677, '909 Maple St, Canyon', '2023-11-16'),
    (45, 'Lucas Miller', 'Satisfactory', 6666555555, '101 Pine St, Desert', '2023-11-17'),
    (46, 'Ava Harris', 'Satisfactory', 4444333322, '202 Cedar St, Hills', '2023-11-18'),
    (47, 'Mia Clark', 'Not Satisfactory', 5555666677, '303 Oak St, Valley', '2023-11-19'),
    (48, 'Noah Adams', 'Satisfactory', NULL, '404 Oak St, Forest', '2023-11-20'),
    (49, 'Oliver White', 'Satisfactory', 2345678901, '505 Pine St, Hills', '2023-11-21'),
    (50, 'Ella Turner', 'Not Satisfactory', 3456789012, '606 Elm St, Valley', '2023-11-22');


INSERT INTO Blood_Bank (Blood_Bank_ID, Blood_Bank_Name, Blood_Bank_Contact, Blood_Bank_Address, Patient_ID, Donor_ID)
VALUES
    (1, 'City Blood Bank', 1234567890, '123 Oak St, City', 1, 1),
    (2, 'Town Blood Bank', 9876543210, '456 Pine St, Town', 2, 2),
    (3, 'Village Blood Bank', 8765432109, '789 Elm St, Village', 3, 3),
    (4, 'County Blood Bank', 5555555555, '456 Maple St, Forest', 4, 4),
    (5, 'Regional Blood Bank', 6666666666, '789 Pine St, Hills', 5, 5),
    (6, 'Valley Blood Bank', 4444444444, '303 Cedar St, Valley', 6, 6),
    (7, 'River Blood Bank', 1111111111, '404 Oak St, River', 7, 7),
    (8, 'Meadow Blood Bank', 7777777777, '505 Elm St, Meadow', 8, 8),
    (9, 'Canyon Blood Bank', 8889990000, '606 Pine St, Canyon', 9, 9),
    (10, 'Desert Blood Bank', 9990001111, '707 Maple St, Desert', 10, 10),
    (11, 'Hills Blood Bank', NULL, '808 Oak St, Hills', 11, 11),
    (12, 'Mountain Blood Bank', 1231231234, '12 Elm St, Mountain', 12, 12),
    (13, 'Sunset Blood Bank', 2342342345, '13 Oak St, Sunset', 13, 13),
    (14, 'Meadowview Blood Bank', NULL, '14 Pine St, Meadowview', 14, 14),
    (15, 'Riverside Blood Bank', 3453453456, '15 Maple St, Riverside', 15, 15),
    (16, 'Valleyview Blood Bank', 4564564567, '16 Cedar St, Valleyview', 16, 16),
    (17, 'Hillside Blood Bank', 5675675678, '17 Elm St, Hillside', 17, 17),
    (18, 'Forest Blood Bank', 6786786789, '18 Oak St, Forest', 18, 18),
    (19, 'Lakeview Blood Bank', 7897897890, '19 Pine St, Lakeview', 19, 19),
    (20, 'Canyonview Blood Bank', 8908908901, '20 Maple St, Canyonview', 20, 20),
    (21, 'Desertview Blood Bank', NULL, '21 Cedar St, Desertview', 21, 21),
    (22, 'Towncenter Blood Bank', 1231231234, '22 Elm St, Towncenter', 22, 22),
    (23, 'Citycenter Blood Bank', 2342342345, '23 Oak St, Citycenter', 23, 23),
    (24, 'Forestview Blood Bank', 3453453456, '24 Pine St, Forestview', 24, 24),
    (25, 'Riverfront Blood Bank', 4564564567, '25 Maple St, Riverfront', 25, 25),
    (26, 'Valleyfront Blood Bank', 5675675678, '26 Cedar St, Valleyfront', 26, 26),
    (27, 'Hillcrest Blood Bank', 6786786789, '27 Elm St, Hillcrest', 27, 27),
    (28, 'Meadowside Blood Bank', 7897897890, '28 Oak St, Meadowside', 28, 28),
    (29, 'Canyonside Blood Bank', 8908908901, '29 Pine St, Canyonside', 29, 29),
    (30, 'Desertside Blood Bank', NULL, '30 Maple St, Desertside', 30, 30),
    (31, 'Townsquare Blood Bank', 1231231234, '31 Elm St, Townsquare', 31, 31),
    (32, 'Citysquare Blood Bank', 2342342345, '32 Oak St, Citysquare', 32, 32),
    (33, 'Forestsquare Blood Bank', 3453453456, '33 Pine St, Forestsquare', 33, 33),
    (34, 'Riversidesquare Blood Bank', 4564564567, '34 Maple St, Riversidesquare', 34, 34),
    (35, 'Valleysquare Blood Bank', 5675675678, '35 Cedar St, Valleysquare', 35, 35),
    (36, 'Hillsquare Blood Bank', 6786786789, '36 Elm St, Hillsquare', 36, 36),
    (37, 'Meadowsquare Blood Bank', 7897897890, '37 Oak St, Meadowsquare', 37, 37),
    (38, 'Canyonsquare Blood Bank', 8908908901, '38 Pine St, Canyonsquare', 38, 38),
    (39, 'Desertsquare Blood Bank', NULL, '39 Maple St, Desertsquare', 39, 39),
    (40, 'Townplaza Blood Bank', 1231231234, '40 Elm St, Townplaza', 40, 40),
    (41, 'Cityplaza Blood Bank', 2342342345, '41 Oak St, Cityplaza', 41, 41),
    (42, 'Forestplaza Blood Bank', 3453453456, '42 Pine St, Forestplaza', 42, 42),
    (43, 'Riverplaza Blood Bank', 4564564567, '43 Maple St, Riverplaza', 43, 43),
    (44, 'Valleyplaza Blood Bank', 5675675678, '44 Cedar St, Valleyplaza', 44, 44),
    (45, 'Hillplaza Blood Bank', 6786786789, '45 Elm St, Hillplaza', 45, 45),
    (46, 'Meadowplaza Blood Bank', 7897897890, '46 Oak St, Meadowplaza', 46, 46),
    (47, 'Canyonplaza Blood Bank', 8908908901, '47 Pine St, Canyonplaza', 47, 47),
    (48, 'Desertplaza Blood Bank', NULL, '48 Maple St, Desertplaza', 48, 48),
    (49, 'Towncenter Blood Bank', 1231231234, '49 Elm St, Towncenter', 49, 49),
    (50, 'Citycenter Blood Bank', 2342342345, '50 Oak St, Citycenter', 50, 50);


INSERT INTO Blood_Inventory (Blood_ID, Blood_Type, Quantity, Expiration_Date, Storage_Location)
VALUES
    (1, 'A+', 100, '2023-12-31', 'Refrigerator 1'),
    (2, 'B-', 50, '2023-11-30', 'Refrigerator 2'),
    (3, 'O+', 75, '2023-10-31', 'Refrigerator 3'),
    (4, 'AB+', 25, '2023-09-30', 'Refrigerator 4'),
    (5, 'A-', 30, '2023-08-31', 'Refrigerator 5'),
    (6, 'B+', 40, '2023-07-31', 'Refrigerator 6'),
    (7, 'O-', 60, '2023-06-30', 'Refrigerator 7'),
    (8, 'A+', 70, '2023-05-31', 'Refrigerator 8'),
    (9, 'B-', 20, '2023-04-30', 'Refrigerator 9'),
    (10, 'AB+', 45, '2023-03-31', 'Refrigerator 10'),
    (11, 'A+', 35, '2023-02-28', NULL),
    (12, 'B-', 60, '2024-01-31', 'Refrigerator 12'),
    (13, 'O+', 80, '2024-02-29', 'Refrigerator 13'),
    (14, 'AB+', 30, '2024-03-31', 'Refrigerator 14'),
    (15, 'A-', 40, '2024-04-30', 'Refrigerator 15'),
    (16, 'B+', 55, '2024-05-31', 'Refrigerator 16'),
    (17, 'O-', 65, '2024-06-30', 'Refrigerator 17'),
    (18, 'A+', 90, '2024-07-31', 'Refrigerator 18'),
    (19, 'B-', 25, '2024-08-31', 'Refrigerator 19'),
    (20, 'O+', 55, '2024-09-30', 'Refrigerator 20'),
    (21, 'AB+', 75, '2024-10-31', NULL),
    (22, 'A+', 50, '2024-11-30', 'Refrigerator 22'),
    (23, 'B-', 65, '2024-12-31', 'Refrigerator 23'),
    (24, 'O+', 70, '2025-01-31', 'Refrigerator 24'),
    (25, 'A-', 45, '2025-02-28', 'Refrigerator 25'),
    (26, 'B+', 35, '2025-03-31', 'Refrigerator 26'),
    (27, 'O-', 25, '2025-04-30', 'Refrigerator 27'),
    (28, 'A+', 85, '2025-05-31', 'Refrigerator 28'),
    (29, 'B-', 40, '2025-06-30', 'Refrigerator 29'),
    (30, 'AB+', 60, '2025-07-31', 'Refrigerator 30'),
    (31, 'A+', 70, '2025-08-31', NULL),
    (32, 'B-', 50, '2025-09-30', 'Refrigerator 32'),
    (33, 'O+', 75, '2025-10-31', 'Refrigerator 33'),
    (34, 'AB+', 25, '2025-11-30', 'Refrigerator 34'),
    (35, 'A-', 30, '2025-12-31', 'Refrigerator 35'),
    (36, 'B+', 40, '2026-01-31', 'Refrigerator 36'),
    (37, 'O-', 60, '2026-02-28', 'Refrigerator 37'),
    (38, 'A+', 70, '2026-03-31', 'Refrigerator 38'),
    (39, 'B-', 20, '2026-04-30', 'Refrigerator 39'),
    (40, 'AB+', 45, '2026-05-31', 'Refrigerator 40'),
    (41, 'A+', 35, '2026-06-30', 'Refrigerator 41'),
    (42, 'B-', 60, '2026-07-31', NULL),
    (43, 'O+', 80, '2026-08-31', 'Refrigerator 43'),
    (44, 'AB+', 30, '2026-09-30', 'Refrigerator 44'),
    (45, 'A-', 40, '2026-10-31', 'Refrigerator 45'),
    (46, 'B+', 55, '2026-11-30', 'Refrigerator 46'),
    (47, 'O-', 65, '2026-12-31', 'Refrigerator 47'),
    (48, 'A+', 90, '2027-01-31', 'Refrigerator 48'),
    (49, 'B-', 25, '2027-02-28', 'Refrigerator 49'),
    (50, 'O+', 55, '2027-03-31', 'Refrigerator 50'),
    (51, 'A+', 100, '2023-11-30', 'Refrigerator 51'),
    (52, 'B-', 50, '2023-10-31', 'Refrigerator 52'),
    (53, 'O+', 75, '2023-09-30', 'Refrigerator 53'),
    (54, 'AB+', 25, '2023-08-31', 'Refrigerator 54'),
    (55, 'A-', 30, '2023-07-31', 'Refrigerator 55'),
    (56, 'B+', 40, '2023-06-30', 'Refrigerator 56'),
    (57, 'O-', 60, '2023-05-31', 'Refrigerator 57'),
    (58, 'A+', 70, '2023-04-30', 'Refrigerator 58'),
    (59, 'B-', 20, '2023-03-31', 'Refrigerator 59'),
    (60, 'AB+', 45, '2023-02-28', 'Refrigerator 60'),
    (61, 'A+', 85, '2024-01-31', NULL),
    (62, 'B-', 60, '2024-02-29', 'Refrigerator 62'),
    (63, 'O+', 80, '2024-03-31', 'Refrigerator 63'),
    (64, 'AB+', 30, '2024-04-30', 'Refrigerator 64'),
    (65, 'A-', 40, '2024-05-31', 'Refrigerator 65'),
    (66, 'B+', 55, '2024-06-30', 'Refrigerator 66'),
    (67, 'O-', 65, '2024-07-31', 'Refrigerator 67'),
    (68, 'A+', 90, '2024-08-31', 'Refrigerator 68'),
    (69, 'B-', 25, '2024-09-30', 'Refrigerator 69'),
    (70, 'O+', 55, '2024-10-31', 'Refrigerator 70'),
    (71, 'AB+', 75, '2024-11-30', 'Refrigerator 71'),
    (72, 'A+', 50, '2024-12-31', NULL),
    (73, 'B-', 65, '2025-01-31', 'Refrigerator 73'),
    (74, 'O+', 70, '2025-02-28', 'Refrigerator 74'),
    (75, 'A-', 45, '2025-03-31', 'Refrigerator 75'),
    (76, 'B+', 35, '2025-04-30', 'Refrigerator 76'),
    (77, 'O-', 25, '2025-05-31', 'Refrigerator 77'),
    (78, 'A+', 85, '2025-06-30', 'Refrigerator 78'),
    (79, 'B-', 40, '2025-07-31', 'Refrigerator 79'),
    (80, 'AB+', 60, '2025-08-31', 'Refrigerator 80'),
    (81, 'A+', 70, '2025-09-30', NULL),
    (82, 'B-', 50, '2025-10-31', 'Refrigerator 82'),
    (83, 'O+', 75, '2025-11-30', 'Refrigerator 83'),
    (84, 'AB+', 25, '2025-12-31', 'Refrigerator 84'),
    (85, 'A-', 30, '2026-01-31', 'Refrigerator 85'),
    (86, 'B+', 40, '2026-02-28', 'Refrigerator 86'),
    (87, 'O-', 60, '2026-03-31', 'Refrigerator 87'),
    (88, 'A+', 70, '2026-04-30', 'Refrigerator 88'),
    (89, 'B-', 20, '2026-05-31', 'Refrigerator 89'),
    (90, 'AB+', 45, '2026-06-30', 'Refrigerator 90'),
    (91, 'A+', 35, '2026-07-31', NULL),
    (92, 'B-', 60, '2026-08-31', 'Refrigerator 92'),
    (93, 'O+', 80, '2026-09-30', 'Refrigerator 93'),
    (94, 'AB+', 30, '2026-10-31', 'Refrigerator 94'),
    (95, 'A-', 40, '2026-11-30', 'Refrigerator 95'),
    (96, 'B+', 55, '2026-12-31', 'Refrigerator 96'),
    (97, 'O-', 65, '2027-01-31', 'Refrigerator 97'),
    (98, 'A+', 90, '2027-02-28', 'Refrigerator 98'),
    (99, 'B-', 25, '2027-03-31', 'Refrigerator 99'),
    (100, 'O+', 55, '2027-04-30', 'Refrigerator 100');


INSERT INTO Blood_Donation_History (Donation_ID, Donor_ID, Donation_Date, Donation_Details)
VALUES
    (1, 1, '2023-10-01', 'Regular for Donor 1 at City Hospital'),
    (2, 2, '2023-09-28', 'First-time for Donor 2 at Town Hospital'),
    (3, 3, '2023-10-03', 'Regular for Donor 3 at Village Hospital'),
    (4, 4, '2023-10-02', 'Regular for Donor 4 at County Hospital'),
    (5, 5, '2023-10-03', 'First-time for Donor 5 at Regional Hospital'),
    (6, 6, '2023-10-04', 'Regular for Donor 6 at Valley Hospital'),
    (7, 7, '2023-10-05', 'Regular for Donor 7 at River Hospital'),
    (8, 8, '2023-10-06', 'Regular for Donor 8 at Meadow Hospital'),
    (9, 9, '2023-10-07', 'First-time for Donor 9 at Canyon Hospital'),
    (10, 10, '2023-10-08', 'Regular for Donor 10 at Desert Hospital'),
    (11, 11, '2023-10-09', 'Regular for Donor 11 at Hills Hospital'),
    (12, 12, '2023-10-10', 'First-time for Donor 12 at Mountain Hospital'),
    (13, 13, '2023-10-11', 'Regular for Donor 13 at Sunset Hospital'),
    (14, 14, '2023-10-12', 'Regular for Donor 14 at Meadowview Hospital'),
    (15, 15, '2023-10-13', 'First-time for Donor 15 at Riverside Hospital'),
    (16, 16, '2023-10-14', 'Regular for Donor 16 at Valleyview Hospital'),
    (17, 17, '2023-10-15', 'Regular for Donor 17 at Hillside Hospital'),
    (18, 18, '2023-10-16', 'Regular for Donor 18 at Forest Hospital'),
    (19, 19, '2023-10-17', 'First-time for Donor 19 at Lakeview Hospital'),
    (20, 20, '2023-10-18', 'Regular for Donor 20 at Canyonview Hospital'),
    (21, 21, '2023-10-19', 'First-time for Donor 21 at Desertview Hospital'),
    (22, 22, '2023-10-20', 'First-time for Donor 22 at Towncenter Hospital'),
    (23, 23, '2023-10-21', 'First-time for Donor 23 at Citycenter Hospital'),
    (24, 24, '2023-10-22', 'Regular for Donor 24 at Forestview Hospital'),
    (25, 25, '2023-10-23', 'Regular for Donor 25 at Riverfront Hospital'),
    (26, 26, '2023-10-24', 'Regular for Donor 26 at Valleyfront Hospital'),
    (27, 27, '2023-10-25', 'First-time for Donor 27 at Hillcrest Hospital'),
    (28, 28, '2023-10-26', 'Regular for Donor 28 at Meadowside Hospital'),
    (29, 29, '2023-10-27', 'First-time for Donor 29 at Canyonside Hospital'),
    (30, 30, '2023-10-28', 'Regular for Donor 30 at Desertside Hospital'),
    (31, 31, '2023-10-29', 'Regular for Donor 31 at Townsquare Hospital'),
    (32, 32, '2023-10-30', 'Regular for Donor 32 at Citysquare Hospital'),
    (33, 33, '2023-10-31', 'Regular for Donor 33 at Forestsquare Hospital'),
    (34, 34, '2023-11-01', 'First-time for Donor 34 at Riversidesquare Hospital'),
    (35, 35, '2023-11-02', 'Regular for Donor 35 at Valleysquare Hospital'),
    (36, 36, '2023-11-03', 'Regular for Donor 36 at Hillsquare Hospital'),
    (37, 37, '2023-11-04', 'First-time for Donor 37 at Meadowsquare Hospital'),
    (38, 38, '2023-11-05', 'Regular for Donor 38 at Canyonsquare Hospital'),
    (39, 39, '2023-11-06', 'First-time for Donor 39 at Desertsquare Hospital'),
    (40, 40, '2023-11-07', 'Regular for Donor 40 at Townplaza Hospital'),
    (41, 41, '2023-11-08', 'First-time for Donor 41 at Cityplaza Hospital'),
    (42, 42, '2023-11-09', 'Regular for Donor 42 at Forestplaza Hospital'),
    (43, 43, '2023-11-10', 'First-time for Donor 43 at Riversideplaza Hospital'),
    (44, 44, '2023-11-11', 'Regular for Donor 44 at Valleyplaza Hospital'),
    (45, 45, '2023-11-12', 'First-time for Donor 45 at Hillsideplaza Hospital'),
    (46, 46, '2023-11-13', 'Regular for Donor 46 at Meadowviewplaza Hospital'),
    (47, 47, '2023-11-14', 'Regular for Donor 47 at Canyonviewplaza Hospital'),
    (48, 48, '2023-11-15', 'First-time for Donor 48 at Desertviewplaza Hospital'),
    (49, 49, '2023-11-16', 'First-time for Donor 49 at Towncenterplaza Hospital'),
    (50, 50, '2023-11-17', 'First-time for Donor 50 at Citycenterplaza Hospital');


INSERT INTO Blood_Request (Request_ID, Patient_ID, Blood_Type, Quantity, Request_Date, Status)
VALUES
    (1, 1, 'A+', 2, '2023-10-02', 'Pending'),
    (2, 2, 'B-', 3, '2023-10-03', 'Fulfilled'),
    (3, 3, 'O+', 1, '2023-10-04', NULL),
    (4, 4, 'AB+', 2, '2023-10-02', 'Pending'),
    (5, 5, 'A-', 1, '2023-10-03', 'Fulfilled'),
    (6, 6, 'B+', 3, '2023-10-04', NULL),
    (7, 7, 'O-', 2, '2023-10-05', 'Fulfilled'),
    (8, 8, 'A+', 1, '2023-10-06', 'Pending'),
    (9, 9, 'B-', 3, '2023-10-07', NULL),
    (10, 10, 'AB+', 2, '2023-10-08', 'Pending'),
    (11, 11, 'A+', 1, '2023-10-09', 'Fulfilled'),
    (12, 12, 'AB-', 2, '2023-10-02', 'Pending'),
    (13, 13, 'O-', 3, '2023-10-03', 'Fulfilled'),
    (14, 14, 'B+', 1, '2023-10-04', NULL),
    (15, 15, 'A-', 2, '2023-10-02', 'Pending'),
    (16, 16, 'O+', 1, '2023-10-03', 'Fulfilled'),
    (17, 17, 'AB+', 3, '2023-10-04', NULL),
    (18, 18, 'A-', 2, '2023-10-05', 'Fulfilled'),
    (19, 19, 'B+', 1, '2023-10-06', 'Pending'),
    (20, 20, 'O-', 3, '2023-10-07', NULL),
    (21, 21, 'A+', 2, '2023-10-08', 'Pending'),
    (22, 22, 'B-', 1, '2023-10-09', 'Fulfilled'),
    (23, 23, 'AB+', 3, '2023-10-05', 'Pending'),
    (24, 24, 'A+', 2, '2023-10-06', NULL),
    (25, 25, 'B-', 1, '2023-10-07', 'Pending'),
    (26, 26, 'O+', 3, '2023-10-08', 'Fulfilled'),
    (27, 27, 'A-', 2, '2023-10-09', 'Pending'),
    (28, 28, 'B+', 1, '2023-10-10', NULL),
    (29, 29, 'O-', 3, '2023-10-11', 'Fulfilled'),
    (30, 30, 'AB-', 2, '2023-10-12', 'Pending'),
    (31, 31, 'A+', 1, '2023-10-13', NULL),
    (32, 32, 'B-', 3, '2023-10-14', 'Pending'),
    (33, 33, 'O+', 2, '2023-10-15', 'Fulfilled'),
    (34, 34, 'A-', 1, '2023-10-16', NULL),
    (35, 35, 'B+', 3, '2023-10-17', 'Pending'),
    (36, 36, 'O-', 2, '2023-10-18', 'Fulfilled'),
    (37, 37, 'AB+', 1, '2023-10-19', NULL),
    (38, 38, 'A+', 3, '2023-10-20', 'Pending'),
    (39, 39, 'B-', 2, '2023-10-21', 'Fulfilled'),
    (40, 40, 'O+', 1, '2023-10-22', NULL),
    (41, 41, 'A-', 3, '2023-10-23', 'Pending'),
    (42, 42, 'B+', 2, '2023-10-24', 'Fulfilled'),
    (43, 43, 'O-', 1, '2023-10-25', NULL),
    (44, 44, 'A+', 3, '2023-10-26', 'Pending'),
    (45, 45, 'B-', 2, '2023-10-27', 'Fulfilled'),
    (46, 46, 'AB+', 1, '2023-10-28', NULL),
    (47, 47, 'A-', 3, '2023-10-29', 'Pending'),
    (48, 48, 'O+', 2, '2023-10-30', 'Fulfilled'),
    (49, 49, 'B+', 1, '2023-10-31', NULL),
    (50, 50, 'AB-', 3, '2023-11-01', 'Pending'),
    (51, 51, 'A+', 2, '2023-11-02', 'Fulfilled'),
    (52, 52, 'B-', 3, '2023-11-03', 'Pending'),
    (53, 53, 'O+', 1, '2023-11-04', NULL),
    (54, 54, 'AB+', 2, '2023-11-05', 'Pending'),
    (55, 55, 'A-', 1, '2023-11-06', 'Fulfilled'),
    (56, 56, 'O-', 3, '2023-11-07', NULL);


INSERT INTO Blood_Transfusion_Log (Transfusion_ID, Patient_ID, Donor_ID, Blood_Type, Transfusion_Date, Transfusion_Details)
VALUES
    (1, 1, 1, 'A+', '2023-10-02', 'Transfusion details for Patient 1 from Donor 1'),
    (2, 2, 2, 'B-', '2023-10-03', 'Transfusion details for Patient 2 from Donor 2'),
    (3, 3, 3, 'O+', '2023-10-04', 'Transfusion details for Patient 3 from Donor 3'),
    (4, 4, 4, 'AB+', '2023-10-02', 'Transfusion details for Patient 4 from Donor 4'),
    (5, 5, 5, 'A-', '2023-10-03', 'Transfusion details for Patient 5 from Donor 5'),
    (6, 6, 6, 'B+', '2023-10-04', 'Transfusion details for Patient 6 from Donor 6'),
    (7, 7, 7, 'O-', '2023-10-05', 'Transfusion details for Patient 7 from Donor 7'),
    (8, 8, 8, 'A+', '2023-10-06', 'Transfusion details for Patient 8 from Donor 8'),
    (9, 9, 9, 'B-', '2023-10-07', 'Transfusion details for Patient 9 from Donor 9'),
    (10, 10, 10, 'AB+', '2023-10-08', 'Transfusion details for Patient 10 from Donor 10'),
    (11, 11, 11, 'A+', '2023-10-09', 'Transfusion details for Patient 11 from Donor 11'),
    (12, 12, 12, 'AB-', '2023-10-10', 'Transfusion details for Patient 12 from Donor 12'),
    (13, 13, 13, 'O-', '2023-10-11', 'Transfusion details for Patient 13 from Donor 13'),
    (14, 14, 14, 'B+', '2023-10-12', 'Transfusion details for Patient 14 from Donor 14'),
    (15, 15, 15, 'A-', '2023-10-13', 'Transfusion details for Patient 15 from Donor 15'),
    (16, 16, 16, 'O+', '2023-10-14', 'Transfusion details for Patient 16 from Donor 16'),
    (17, 17, 17, 'AB+', '2023-10-15', 'Transfusion details for Patient 17 from Donor 17'),
    (18, 18, 18, 'A-', '2023-10-16', 'Transfusion details for Patient 18 from Donor 18'),
    (19, 19, 19, 'B+', '2023-10-17', 'Transfusion details for Patient 19 from Donor 19'),
    (20, 20, 20, 'O-', '2023-10-18', 'Transfusion details for Patient 20 from Donor 20'),
    (21, 21, 21, 'A+', '2023-10-19', 'Transfusion details for Patient 21 from Donor 21'),
    (22, 22, 22, 'B-', '2023-10-20', 'Transfusion details for Patient 22 from Donor 22'),
    (23, 23, 23, 'AB+', '2023-10-21', 'Transfusion details for Patient 23 from Donor 23'),
    (24, 24, 24, 'A+', '2023-10-22', 'Transfusion details for Patient 24 from Donor 24'),
    (25, 25, 25, 'B-', '2023-10-23', 'Transfusion details for Patient 25 from Donor 25'),
    (26, 26, 26, 'O+', '2023-10-24', 'Transfusion details for Patient 26 from Donor 26'),
    (27, 27, 27, 'A-', '2023-10-25', 'Transfusion details for Patient 27 from Donor 27'),
    (28, 28, 28, 'B+', '2023-10-26', 'Transfusion details for Patient 28 from Donor 28'),
    (29, 29, 29, 'O-', '2023-10-27', 'Transfusion details for Patient 29 from Donor 29'),
    (30, 30, 30, 'AB-', '2023-10-28', 'Transfusion details for Patient 30 from Donor 30'),
    (31, 31, 31, 'A+', '2023-10-29', 'Transfusion details for Patient 31 from Donor 31'),
    (32, 32, 32, 'B-', '2023-10-30', 'Transfusion details for Patient 32 from Donor 32'),
    (33, 33, 33, 'O+', '2023-10-31', 'Transfusion details for Patient 33 from Donor 33'),
    (34, 34, 34, 'A-', '2023-11-01', 'Transfusion details for Patient 34 from Donor 34'),
    (35, 35, 35, 'B+', '2023-11-02', 'Transfusion details for Patient 35 from Donor 35'),
    (36, 36, 36, 'O-', '2023-11-03', 'Transfusion details for Patient 36 from Donor 36'),
    (37, 37, 37, 'AB+', '2023-11-04', 'Transfusion details for Patient 37 from Donor 37'),
    (38, 38, 38, 'A+', '2023-11-05', 'Transfusion details for Patient 38 from Donor 38'),
    (39, 39, 39, 'B-', '2023-11-06', 'Transfusion details for Patient 39 from Donor 39'),
    (40, 40, 40, 'O+', '2023-11-07', 'Transfusion details for Patient 40 from Donor 40'),
    (41, 41, 41, 'A-', '2023-11-08', 'Transfusion details for Patient 41 from Donor 41'),
    (42, 42, 42, 'B+', '2023-11-09', 'Transfusion details for Patient 42 from Donor 42'),
    (43, 43, 43, 'O-', '2023-11-10', 'Transfusion details for Patient 43 from Donor 43'),
    (44, 44, 44, 'AB+', '2023-11-11', 'Transfusion details for Patient 44 from Donor 44'),
    (45, 45, 45, 'A+', '2023-11-12', 'Transfusion details for Patient 45 from Donor 45'),
    (46, 46, 46, 'B-', '2023-11-13', 'Transfusion details for Patient 46 from Donor 46'),
    (47, 47, 47, 'O+', '2023-11-14', 'Transfusion details for Patient 47 from Donor 47'),
    (48, 48, 48, 'A-', '2023-11-15', 'Transfusion details for Patient 48 from Donor 48'),
    (49, 49, 49, 'B+', '2023-11-16', 'Transfusion details for Patient 49 from Donor 49'),
    (50, 50, 50, 'O-', '2023-11-17', 'Transfusion details for Patient 50 from Donor 50');


-- Retrieve the donors who donated blood between '2023-01-01' and '2023-12-31' and have a medical report status of 'Satisfactory'.
SELECT * FROM Donor
WHERE Donate_Date BETWEEN '2023-01-01' AND '2023-12-31'
AND Medical_Report = 'Satisfactory';

-- Find the patients with blood groups 'A+' or 'B-' and a contact number starting with '123' or '987'.
SELECT * FROM Patient
WHERE (Blood_Group = 'A+' OR Blood_Group = 'B-')
AND (Patient_Contact LIKE '123%' OR Patient_Contact LIKE '987%');

-- Show the blood types and quantities of blood units in the inventory that are either 'A+' or 'B-' and have an expiration date between '2023-07-31' and '2024-01-31'.
SELECT Blood_Type, Quantity FROM Blood_Inventory
WHERE (Blood_Type = 'A+' OR Blood_Type = 'B-')
AND Expiration_Date BETWEEN '2023-07-31' AND '2024-01-31';

-- Display a distinct list of blood types from the inventory in ascending order.
SELECT DISTINCT Blood_Type FROM Blood_Inventory
ORDER BY Blood_Type ASC;

-- Retrieve all patients who have a recorded contact (not null).
SELECT * FROM Patient
WHERE Patient_Contact IS NOT NULL;

-- List the first 10 blood donation records in descending order of donation date, skipping the first 5 records.
SELECT * FROM Blood_Donation_History
ORDER BY Donation_Date DESC
LIMIT 5, 10;

-- Retrieve a list of patients along with their corresponding donors using an inner join.
SELECT Patient.Patient_Name, Donor.Donor_Name FROM Patient
INNER JOIN Blood_Bank ON Patient.Patient_ID = Blood_Bank.Patient_ID
INNER JOIN Donor ON Blood_Bank.Donor_ID = Donor.Donor_ID;

-- Show the patients and their corresponding donors using a left join.
SELECT Patient.Patient_Name, Donor.Donor_Name FROM Patient
LEFT JOIN Blood_Bank ON Patient.Patient_ID = Blood_Bank.Patient_ID
LEFT JOIN Donor ON Blood_Bank.Donor_ID = Donor.Donor_ID;

-- Display the donors and their corresponding patients using a right join.
SELECT Donor.Donor_Name, Patient.Patient_Name FROM Donor
RIGHT JOIN Blood_Bank ON Donor.Donor_ID = Blood_Bank.Donor_ID
RIGHT JOIN Patient ON Blood_Bank.Patient_ID = Patient.Patient_ID;

-- Increase the quantity of 'A+' blood units in the inventory by 5.
SET SQL_SAFE_UPDATES = 0;

UPDATE Blood_Inventory
SET Quantity = Quantity + 5
WHERE Blood_Type = 'A+';

SET SQL_SAFE_UPDATES = 1;

-- Check if there are any patients who do not have corresponding blood donation history records using a subquery.
SELECT Patient.Patient_Name, Patient.Patient_ID FROM Patient
LEFT JOIN Blood_Donation_History ON Patient.Patient_ID = Blood_Donation_History.Donor_ID
WHERE Blood_Donation_History.Donation_ID IS NULL;

-- List patients who have received blood from donors with 'Satisfactory' medical reports.
SELECT Patient_Name FROM Patient
WHERE Patient_ID IN (
    SELECT Patient_ID FROM Blood_Transfusion_Log
    WHERE Donor_ID IN (
        SELECT Donor_ID FROM Donor
        WHERE Medical_Report = 'Satisfactory'
    )
);

-- Delete all blood donation history records for donors with 'Not Satisfactory' medical reports.
DELETE FROM Blood_Donation_History
WHERE Donor_ID IN (SELECT Donor_ID FROM Donor WHERE Medical_Report = 'Not Satisfactory');



