-- Find the same pizza names that have the same price, but from different pizzerias.
-- Make sure that the result is ordered by pizza name. 

WITH 
piza_price_pizzeria AS 
	(SELECT 
	 	m.id,
		pizza_name,
		price,
		pizz.name
	FROM menu m
	JOIN pizzeria pizz
	ON m.pizzeria_id = pizz.id)
	
SELECT 
	ppp1.pizza_name,
	ppp1.name AS pizzeria_name_1,
	ppp2.name AS pizzeria_name_2,
	ppp1.price
FROM piza_price_pizzeria ppp1
JOIN piza_price_pizzeria ppp2
ON ppp1.price = ppp2.price
WHERE ppp1.name != ppp2.name 
	AND ppp1.pizza_name = ppp2.pizza_name
	AND ppp1.id > ppp2.id
ORDER BY pizza_name;