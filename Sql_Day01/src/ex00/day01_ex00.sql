SELECT id as object_id,
	pizza_name as object_name
FROM menu
UNION
SELECT id,
	name
FROM person
ORDER BY object_id, object_name;