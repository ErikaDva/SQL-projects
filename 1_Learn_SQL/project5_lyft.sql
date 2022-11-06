/* 1. Examine three tables */
SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM  cars;

/* 2. What is the primary key? */

-- All primary keys are 'id' column of the table

/* 3. Do a cross join between riders and cars */
SELECT *
FROM riders
CROSS JOIN cars;

-- OR
SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars;

/* 4. Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN */
SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;

/* 5. Create a link between the trips and the cars used during those trips */
SELECT *
FROM trips
INNER JOIN cars
  ON trips.car_id = cars.id;;

/* 6. Stack the riders table on top of the new table named riders2 */
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

/* 7. What is the average cost for a trip? */
SELECT ROUND(AVG(cost), 2)
FROM trips;

/* 8. Find all the riders who have used Lyft less than 500 times */
SELECT *
FROM riders
WHERE total_trips < 500;

-- OR
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

/* 9. Calculate the number of cars that are active */
SELECT COUNT(*)
FROM cars
WHERE status = 'active';

/* 10. Write a query that finds the two cars that have the highest trips_completed */
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;