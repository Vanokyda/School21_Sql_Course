-- Please change the price of "greek pizza" to -10% of the current value

UPDATE menu
SET price = TRUNC((SELECT price FROM menu WHERE pizza_name = 'greek pizza') * 0.9)
WHERE pizza_name = 'greek pizza';

-- Check
-- SELECT *
-- FROM menu
-- WHERE pizza_name = 'greek pizza';

-- Mistake corrector
-- UPDATE menu
-- SET price = 800
-- WHERE pizza_name = 'greek pizza';