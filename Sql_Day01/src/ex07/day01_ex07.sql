SELECT 
	order_date,
	CONCAT (name, ' (age:', age, ')') AS person_information
FROM person_order po
JOIN person p
ON po.person_id = p.id
ORDER BY order_date, person_information;