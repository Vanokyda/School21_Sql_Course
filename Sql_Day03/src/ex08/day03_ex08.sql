-- Please register a new pizza with the name "sicilian pizza" (whose id should be calculated by the formula "maximum id value + 1")
-- with the price of 900 rubles in the restaurant "Dominos" (please use internal query to get the identifier of the pizzeria)

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
	(SELECT MAX(id) + 1 FROM menu),
	(SELECT id FROM pizzeria WHERE name = 'Dominos'),
	'sicilian pizza',
	900);

-- Check
-- SELECT *
-- FROM menu
-- WHERE pizza_name = 'sicilian pizza';

-- Mistake corrector
-- DELETE FROM menu 
-- WHERE pizza_name = 'sicilian pizza';