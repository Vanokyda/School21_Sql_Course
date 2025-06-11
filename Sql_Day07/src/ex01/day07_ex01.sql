-- Let's make a simple aggregation, 
-- please write a SQL statement that returns person identifiers and corresponding number of visits in any pizzerias 
-- and sorts by number of visits in descending mode and sorts by person_id in ascending mode.

SELECT
	p.name,
	COUNT (person_id) AS count_of_visits
FROM person_visits pv
JOIN person p
ON pv.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name
LIMIT 4;