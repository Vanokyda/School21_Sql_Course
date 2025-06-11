SELECT 
	pizza_name,
	name AS pizzeria_name,
	price
FROM (SELECT * FROM menu m
	  WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')) AS m
JOIN pizzeria piz
ON m.pizzeria_id = piz.id
ORDER BY pizza_name, pizzeria_name;