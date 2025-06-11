-- Write an SQL statement that returns a list of pizzerias that Andrey visited but did not order from.
-- Please order by the name of the pizzeria.

WITH 
andrey AS 
	(SELECT 
	 	id,
	 	name
	FROM person p
	WHERE name = 'Andrey'),
	
andrey_visits AS 
	(SELECT 
	 	piz.name AS pizzeria_name
	FROM person_visits pv
	JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	JOIN andrey a
	ON pv.person_id = a.id),
	
andrey_orders AS 
	(SELECT 
	 	piz.name AS pizzeria_name
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	JOIN andrey a
	ON po.person_id = a.id)

SELECT *
FROM andrey_visits
EXCEPT
SELECT *
FROM andrey_orders
ORDER BY pizzeria_name;