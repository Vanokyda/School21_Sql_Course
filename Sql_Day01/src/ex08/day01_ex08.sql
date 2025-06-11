SELECT
	order_date,
	CONCAT (name, ' (age:', age, ')') AS person_information
FROM person_order po
NATURAL JOIN (
	SELECT
	id AS person_id,
	name,
	age
	FROM person) p
ORDER BY order_date, person_information;