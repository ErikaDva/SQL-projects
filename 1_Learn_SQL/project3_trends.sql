/* 1. View the table */
SELECT * 
FROM startups;

/* 2. Calculate the total number of companies in the table */
SELECT COUNT(*)
FROM startups;

/* 3. Calculate the total value of all companies in the table */
SELECT SUM(valuation)
FROM startups;

/* 4. What is the highest amount raised by a startup? */
SELECT MAX(raised)
FROM startups;

/* 5. Return the maximum amount of money raised during 'Seed' stage */
SELECT MAX(raised)
FROM startups
WHERE stage='Seed';

/* 6. In what year was the oldest company on the list founded? */
SELECT MIN(founded)
FROM startups;

/* 7. Return the average valuation */
SELECT AVG(valuation)
FROM startups;

/* 8. Return the average valuation in each category  */
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

/* 9. Return the average valuation in each category. 
Round the averages to two decimal places. 
*/

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

/* 10. Return the average valuation in each category. 
Round the averages to two decimal places. 
Order the list from highest averages to lowest.
 */

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category
ORDER BY 2 DESC;

/* 11. Return the name of each category with total number of companies that belonf to it */

SELECT category, COUNT(name)
FROM startups
GROUP BY category;

/* 12. Filter the result to only include categories that have more than free companies in them */

SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

/* 13. What is the average size of a startup in each location? */

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

/* 14. What is the average size of a startup in each location, with average sizes above 500? */

SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;