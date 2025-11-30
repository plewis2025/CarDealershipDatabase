/* ============================================================
   CAR DEALERSHIP DATABASE — MASTER SETUP SCRIPT
   This script DROPS + CREATES the entire database from scratch.
   It creates tables AND inserts sample data.
   ============================================================ */

/* -----------------------------
   DROP + CREATE DATABASE
   ----------------------------- */
DROP DATABASE IF EXISTS car_dealership;
CREATE DATABASE car_dealership;
USE car_dealership;

/* -----------------------------
   TABLE 1 — dealerships
   ----------------------------- */
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50),
    address       VARCHAR(50),
    phone         VARCHAR(12)
);

/* -----------------------------
   TABLE 2 — vehicles
   NOTE:
   - VIN is PRIMARY KEY
   - VIN is NOT auto-increment
   - includes a SOLD column
   ----------------------------- */
CREATE TABLE vehicles (
    VIN                VARCHAR(17) PRIMARY KEY,
    make               VARCHAR(20),
    model              VARCHAR(20),
    color              VARCHAR(15),
    year               INT,
    price              DECIMAL(10,2),
    SOLD               BOOLEAN DEFAULT FALSE
);

/* -----------------------------
   TABLE 3 — inventory
   Shows which dealership has which vehicle
   ----------------------------- */
CREATE TABLE inventory (
    dealership_id INT,
    VIN           VARCHAR(17),

    PRIMARY KEY (dealership_id, VIN),

    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

/* -----------------------------
   TABLE 4 — sales_contracts
   - auto-increment ID
   - foreign key VIN
   ----------------------------- */
CREATE TABLE sales_contracts (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    VIN             VARCHAR(17),
    sale_price      DECIMAL(10,2),
    sale_date       DATE,
    customer_name   VARCHAR(50),

    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

/* -----------------------------
   TABLE 5 — lease_contracts (optional)
   ----------------------------- */
CREATE TABLE lease_contracts (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    VIN             VARCHAR(17),
    monthly_payment DECIMAL(10,2),
    lease_start     DATE,
    lease_end       DATE,
    customer_name   VARCHAR(50),

    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

/* ============================================================
   INSERT SAMPLE DATA
   ============================================================ */

/* dealerships */
INSERT INTO dealerships (name, address, phone) VALUES
('Super Cars', '123 Auto Way', '555-111-1111'),
('Budget Motors', '99 Saver St', '555-222-2222'),
('Luxury Rides', '1 Diamond Rd', '555-333-3333');

/* vehicles */
INSERT INTO vehicles (VIN, make, model, color, year, price, SOLD) VALUES
('ABC123VIN12345678', 'Ford', 'Mustang', 'Red', 2020, 35000, FALSE),
('XYZ987VIN87654321', 'Toyota', 'Camry', 'Blue', 2019, 21000, FALSE),
('LMN555VIN00011223', 'Honda', 'Civic', 'White', 2018, 18000, TRUE),
('AAA111VIN00000001', 'Chevy', 'Corvette', 'Black', 2021, 60000, FALSE);

/* inventory */
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 'ABC123VIN12345678'),
(1, 'AAA111VIN00000001'),
(2, 'XYZ987VIN87654321'),
(3, 'LMN555VIN00011223');

/* sales contracts */
INSERT INTO sales_contracts (VIN, sale_price, sale_date, customer_name) VALUES
('LMN555VIN00011223', 17500, '2023-02-01', 'Alice Smith');

/* lease contracts (optional) */
INSERT INTO lease_contracts (VIN, monthly_payment, lease_start, lease_end, customer_name) VALUES
('ABC123VIN12345678', 299.99, '2024-01-01', '2025-01-01', 'Bob Johnson');
