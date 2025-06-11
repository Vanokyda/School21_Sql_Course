-- Please write a SQL statement that returns 
-- the number of orders, the average price, the maximum price and the minimum price for pizzas sold by each pizzeria restaurant.
-- The result should be sorted by pizzeria name.
-- Round the average price to 2 floating numbers.

SELECT 
	piz.name,
	COUNT (po.id) AS count_of_orders,
	ROUND(AVG(m.price), 2)::real AS average_price,
	MAX(m.price) AS max_price,
	MIN(m.price) AS min_price
FROM person_order po
JOIN menu m
ON po.menu_id = m.id
JOIN pizzeria piz
ON m.pizzeria_id = piz.id
GROUP BY piz.name
ORDER BY piz.name;