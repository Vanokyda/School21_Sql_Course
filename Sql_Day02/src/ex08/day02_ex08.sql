WITH
sam_mosc_man AS 
	(SELECT * FROM person 
	WHERE address IN ('Samara', 'Moscow') AND gender = 'male'),

pep_mush_orders AS
	(SELECT * 
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza'))
	
SELECT name
FROM sam_mosc_man smm
JOIN pep_mush_orders pmo
ON smm.id = pmo.person_id
ORDER BY name DESC;