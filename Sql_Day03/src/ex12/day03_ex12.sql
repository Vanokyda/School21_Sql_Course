-- Please register new orders of all persons for "greek pizza" on February 25, 2022
-- Please use “insert-select” pattern (INSERT INTO ... SELECT ...)

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series (
		(SELECT MAX(id) FROM person_order) + 1, 
		(SELECT MAX(id) FROM person_order) + (SELECT MAX(id) FROM person) , 
		1), -- id
		(generate_series(
		(SELECT MIN(id) FROM person),
		(SELECT MAX(id) FROM person),
		1)), -- person_id
		(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
		'2022-02-25';

-- Check
-- SELECT *
-- FROM person_order
-- WHERE order_date = '2022-02-25';

-- Mistake corrector
-- DELETE FROM person_order
-- WHERE order_date = '2022-02-25';