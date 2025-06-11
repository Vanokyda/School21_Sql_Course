SELECT 
	name,
	rating
FROM 
	pizzeria piz
LEFT JOIN 
	person_visits pv
ON pv.pizzeria_id = piz.id
WHERE visit_date IS NULL;