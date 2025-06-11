-- Write a SQL statement that returns the orders 
-- with actual price and price with discount applied for each person in the corresponding pizzeria restaurant, 
-- sorted by person name and pizza name.

SELECT
	p.name,
	m.pizza_name,
	m.price,
	((price / 100) * (100 - pd.discount))::real as discount_price,
	piz.name AS pizzeria_name
FROM 
	person_order po
JOIN person p
	ON po.person_id = p.id
JOIN menu m
	ON po.menu_id = m.id
JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
JOIN person_discounts pd
	ON po.person_id = pd.person_id 
	AND m.pizzeria_id = pd.pizzeria_id
ORDER BY name, pizza_name;