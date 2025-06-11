-- Please use the SQL statement from Exercise #01 and display the names of pizzas from the pizzeria that no one has ordered,
-- including the corresponding prices.
-- The result should be sorted by pizza name and price. 

WITH 
forgotten_menu_id AS (
	SELECT id AS menu_id
	FROM menu
	EXCEPT
	SELECT menu_id
	FROM person_order
	ORDER BY menu_id)
	
SELECT 
	pizza_name,
	price,
	piz.name AS pizzeria_name
FROM forgotten_menu_id fmid
JOIN menu m
ON fmid.menu_id = m.id
JOIN pizzeria piz
ON m.pizzeria_id = piz.id
ORDER BY pizza_name, price;