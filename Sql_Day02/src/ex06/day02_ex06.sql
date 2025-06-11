WITH anna_denis AS (
	SELECT *
	FROM person
	WHERE name IN ('Denis', 'Anna')
)

SELECT 
	pizza_name,
	piz.name AS pizzeria_name
FROM person_order po
JOIN anna_denis p
ON po.person_id = p.id
JOIN menu m
ON po.menu_id = m.id
JOIN pizzeria piz
ON m.pizzeria_id = piz.id
ORDER BY 1, 2;