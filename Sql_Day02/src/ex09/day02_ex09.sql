WITH
women AS 
	(SELECT * FROM person 
	WHERE gender = 'female'),

pep_cheese_orders AS
	(SELECT * 
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	WHERE pizza_name IN ('pepperoni pizza', 'cheese pizza')),
	
count_of_unique_orders AS
	(SELECT 
		name, 
		COUNT (DISTINCT pizza_name)
	FROM women w
	JOIN pep_cheese_orders pco
	ON w.id = pco.person_id
	GROUP BY name)

SELECT 
	name
FROM 
	count_of_unique_orders
WHERE count > 1
ORDER BY name;