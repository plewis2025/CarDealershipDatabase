USE car_dealership;

SELECT make, model, COUNT(*) AS total_available
FROM vehicles
WHERE SOLD = FALSE
GROUP BY make, model
ORDER BY total_available DESC;

