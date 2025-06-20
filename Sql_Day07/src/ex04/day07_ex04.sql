-- Please write a SQL statement that returns the person's name
-- and the corresponding number of visits to any pizzerias if the person has visited more than 3 times (> 3).

SELECT 
	name,
	COUNT (name) AS count_of_visits
FROM person_visits pv
JOIN person p
ON pv.person_id = p.id
GROUP BY name
HAVING COUNT (name) > 3;