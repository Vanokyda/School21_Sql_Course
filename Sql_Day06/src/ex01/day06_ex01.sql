-- Actually, we have created a structure to store our discounts 
-- and we are ready to go further and fill our person_discounts table with new records.


INSERT INTO person_discounts (person_id, pizzeria_id, id, discount)
	SELECT
		person_id,
		pizzeria_id,
		ROW_NUMBER () OVER (ORDER BY person_id) AS id,
		(CASE
			WHEN COUNT (*) = 1 THEN 10.5
			WHEN COUNT (*) = 2 THEN 22
			ELSE 30
		END) AS discount
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	GROUP BY person_id, pizzeria_id
	ORDER BY 1;