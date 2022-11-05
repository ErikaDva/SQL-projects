/* What are column names? */
SELECT *
FROM nomnom;

/* What are distinct neigborhoods?  */
SELECT DISTINCT neighborhood
FROM nomnom;

/* What are distinct cusines?  */
SELECT DISTINCT cuisine
FROM nomnom;

/* Suppose we would like some Chinese takeout. What are our options? */
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

/* Return all the restaurants with reviews of 4 and above */
SELECT name
FROM nomnom
WHERE review >= 4;

/* Return all the restaurants that are Italian and $$$ */
SELECT name
FROM nomnom
WHERE cuisine = 'Italian' 
AND price = '$$$';

/* Return a table of restaurants that contain meatball in the name */
SELECT name
FROM nomnom
WHERE name LIKE '%meatball%';

/* Find all the close by spots in Midtown, Downtown or Chinatown. (OR can be used more than once) */
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown' 
OR neighborhood = 'Downtown'
OR neighborhood = 'Chinatown';

/* Find all the health grade pending restaurants (empty values) */
SELECT *
FROM nomnom
WHERE health IS NULL;

/* Create a Top 10 Restaurants Ranking based on reviews */
SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

/* Use a CASE statement to change the rating system */
SELECT *,
CASE
  WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'Poor'
END AS 'Rating'
FROM nomnom