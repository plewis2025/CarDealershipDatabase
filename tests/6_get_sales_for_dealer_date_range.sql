USE car_dealership;

SELECT d.name AS dealership,
       s.*
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
JOIN dealerships d ON d.dealership_id = i.dealership_id
WHERE d.dealership_id = 1
  AND s.sale_date BETWEEN '2023-01-01' AND '2023-12-31';
