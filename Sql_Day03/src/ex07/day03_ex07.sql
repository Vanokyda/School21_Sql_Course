-- Please register a new pizza with the name "greek pizza" (use id = 19)
-- with the price of 800 rubles in the restaurant "Dominos" (pizzeria_id = 2)

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);

-- check
-- SELECT *
-- FROM menu
-- WHERE id = 19;