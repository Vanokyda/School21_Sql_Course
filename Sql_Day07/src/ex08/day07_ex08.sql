-- We know personal addresses from our data. 
-- Let's assume that this person only visits pizzerias in his city. 
-- Write a SQL statement that returns the address, the name of the pizzeria, and the amount of the person's orders. 
-- The result should be sorted by address and then by restaurant name.

SELECT 
	address,
	piz.name,
	COUNT (po.id) AS count_of_orders
FROM person_order po
JOIN person p 
	ON po.person_id = p.id
JOIN menu m 
	ON po.menu_id = m.id
JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
GROUP BY piz.name, address
ORDER BY address, name;