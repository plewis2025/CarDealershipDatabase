# CarDealershipDatabase
sql -git commit-workshop
 Car Dealership Database Project

A fully resettable SQL database with sample data + test scripts

 Overview

This project builds a complete Car Dealership Database using MySQL.
Your master SQL script:

 Drops the database (if it exists)
 Creates all tables
 Inserts sample data
 Can be safely run over and over

You also created a set of test scripts (one query per file) to verify that your database works correctly.

📁 Project Structure
CarDealershipDatabase/
│
├── car_dealership_master.sql         # Main database setup script
│
├── tests/
│   ├── 1_get_all_dealerships.sql
│   ├── 2_find_vehicles_for_dealership.sql
│   ├── 3_find_vehicle_by_VIN.sql
│   ├── 4_find_dealership_for_vehicle.sql
│   ├── 5_find_dealerships_with_specific_vehicle_type.sql
│   └── 6_get_sales_for_dealer_date_range.sql
│
└── README.md                         # Project documentation

 What This Database Includes
1️ Dealerships Table

Stores dealership information (name, address, phone).

2️ Vehicles Table

Includes detailed vehicle data:

VIN (primary key, not auto-incrementing)

make

model

year

price

SOLD flag

3️ Inventory Table

Tracks which vehicle belongs to which dealership.

4️ Sales Contracts

Stores records of purchased vehicles.

5️ Lease Contracts (Optional)

Stores vehicle lease information.

 Running the Database Script (MySQL Workbench)
1. Open MySQL Workbench
2. File → Open SQL Script…

Choose:

car_dealership_master.sql

3. Click the Yellow Lightning Bolt ⚡

Workbench will:

Drop the old database

Create a new, fresh one

Create all tables

Insert all sample data

4. Refresh the Schemas Panel

Your database will appear as:

car_dealership

 Running Test Scripts

Each test script is separate and easy to run.

To run a test:

In MySQL Workbench:

File → Open SQL Script…


Open any file in /tests

Run it using the ⚡ button

 Test Scripts Included
 1 — Get all dealerships
 2 — Find all vehicles at a specific dealership  3 — Find a vehicle by VIN
 4 — Find the dealership where a vehicle is located
 5 — Find dealerships that have a specific vehicle type
 6 — Get all sales for a dealer in a date range
 Interesting Extra Query (Required for project)

This query shows the most common UNSOLD vehicle models:

USE car_dealership;

SELECT make, model, COUNT(*) AS total_available
FROM vehicles
WHERE SOLD = FALSE
GROUP BY make, model
ORDER BY total_available DESC;
