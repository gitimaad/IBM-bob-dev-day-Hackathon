CREATE DATABASE IF NOT EXISTS blr_infrastructure;
USE blr_infrastructure;

-- Table for real ward demographics
CREATE TABLE ward_demographics (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(100),
    population_2011 INT
);

-- Table for water delivery logs (MLD = Million Liters per Day)
CREATE TABLE bwssb_delivery_records (
    record_id INT PRIMARY KEY,
    ward_id INT,
    recorded_date VARCHAR(20), 
    allocated_mld DECIMAL(10,2),
    delivered_mld DECIMAL(10,2)
);

-- Inserting actual stats from our research
INSERT INTO ward_demographics (ward_id, ward_name, population_2011) VALUES
(150, 'Bellandur', 80153),
(174, 'Mahadevapura', 179838),
(175, 'Bommanahalli', 190861);

-- Inserting historical records with intentional "human errors"
INSERT INTO bwssb_delivery_records (record_id, ward_id, recorded_date, allocated_mld, delivered_mld) VALUES
(1, 150, '2026-05-01', 15.50, 12.20),
(2, 174, '01/05/2026', 22.00, NULL),     -- ERROR: Bad date format + Missing Data
(3, 175, '2026-05-01', 25.00, 18.50),
(4, 150, '2026-05-02', 15.50, 11.80),
(5, 174, '05-02-2026', 22.00, NULL),     -- ERROR: Inconsistent date format
(6, 175, '2026-05-02', 25.00, 19.00);
