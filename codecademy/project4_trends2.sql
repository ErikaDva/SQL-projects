/* 1. Find top 5 stories */
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

/* 2. Find the total score of all the stories */
SELECT SUM(score)
FROM hacker_news;

/* 3. Find the users with combined score >= 200 */
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING score >= 200
ORDER BY 2 DESC;

/* 4. Add these scores and dividde by the total sum */
SELECT (517 + 309 + 304 + 282) / 6366.0;
-- 4 users = 22% of all posts

/* 5. How many times has each offending user posted this link? */
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

/* 6. Which of these sites feed Hacker News the most:
GitHub, Medium, or New York Times? */

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source'
  FROM hacker_news;

/* 7. Build on a previous query and count by 'Source' */
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY Source;

/* 8. What is the best time of the day to post? Take a look a the timestamp column.*/
SELECT timestamp
FROM hacker_news
LIMIT 10;

/* 9. Try SQLite strftime() function */
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

/* 10. Write a query to retun the hours of timestamp, the average score and count for each hour */

SELECT strftime('%H', timestamp), AVG(score), COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;

/* 11. Edit the query to polish the table */

SELECT strftime('%H', timestamp) AS 'hour', 
  ROUND(AVG(score), 1) AS 'avg_score', 
  COUNT(*) AS 'count'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;