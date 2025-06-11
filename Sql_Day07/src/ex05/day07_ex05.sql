-- Please write a simple SQL query that returns a list of unique person names who have placed orders at any pizzerias. 
-- The result should be sorted by person name. 
-- Denied: GROUP BY, any type (UNION,...) working with sets

SELECT DISTINCT 
	name
FROM person_order po
JOIN person p
ON po.person_id = p.id
ORDER BY name;