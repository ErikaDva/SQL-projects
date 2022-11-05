/* Create a table */
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

/* Add first friend entry */
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

/* Add 2nd friend */
INSERT INTO friends (id, name, birthday)
VALUES (2, 'John Doe', '1995-05-07');

/* Add 3rd friend*/
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Peter Rasmussen', '1998-08-14');

/* Change the name based on a condition */
UPDATE friends
SET name = 'Storm'
WHERE id=1;

/* Add a new column */
ALTER TABLE friends
ADD COLUMN email TEXT;

/* Update email addresses */
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'jd@codecademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'pr@codecademy.com'
WHERE id = 3;

/* Remove Storm from friends table*/
DELETE FROM friends
WHERE id=1;

/* View the results */
SELECT *
FROM friends;