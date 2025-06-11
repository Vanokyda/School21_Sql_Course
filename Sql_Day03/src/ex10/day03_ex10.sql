-- Please register new orders from Denis and Irina on February 24, 2022 for the new menu with "sicilian pizza"

CREATE SEQUENCE tmp_sequence
INCREMENT 1;

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id)+(nextval('tmp_sequence')) FROM person_order),
		(SELECT id FROM person WHERE name = 'Denis'),  
	   	(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
	   	'2022-02-24'), 
	   ((SELECT MAX(id)+(nextval('tmp_sequence')) FROM person_order),
		(SELECT id FROM person WHERE name = 'Irina'),  
	   	(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
	   	'2022-02-24');

DROP SEQUENCE tmp_sequence;

-- Check
-- SELECT *
-- FROM person_order
-- WHERE order_date = '2022-02-24' 
-- 	AND menu_id = (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza');

-- Mistake corrector
-- DELETE FROM person_order 
-- WHERE order_date = '2022-02-24' 
-- 	AND menu_id = (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza');