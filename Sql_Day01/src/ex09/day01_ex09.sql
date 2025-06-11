-- IN
SELECT name
FROM pizzeria
WHERE id NOT IN 
	(SELECT pizzeria_id 
	 FROM  person_visits);
	 
-- EXISTS
SELECT name
FROM pizzeria piz
WHERE NOT EXISTS (
	SELECT 1
	FROM person_visits pv
	WHERE pv.pizzeria_id = piz.id);