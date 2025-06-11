SELECT 
	action_date,
	name AS person_name
FROM (SELECT 
	order_date AS action_date,
	person_id
FROM person_order
INTERSECT
SELECT 
	visit_date, 
	person_id
FROM person_visits) AS og3
JOIN person p
ON og3.person_id = p.id
ORDER BY action_date, person_name DESC