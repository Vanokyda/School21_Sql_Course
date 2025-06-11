-- Please write a SQL statement that returns a list of pizza names, pizza prices, pizzeria names,
-- and visit dates for Kate and for prices ranging from 800 to 1000 rubles.
-- Please sort by pizza, price, and pizzeria name. 
-- Короче, в какие дни Kate ходила в пиццерии и какие пиццы продали в эти дни (и в каких пиццериях, и по какой цене)

WITH 
cheap_pizzas AS (
SELECT 
	piz.id,
	pizza_name,
	price,
	name AS pizzeria_name
FROM menu m
JOIN pizzeria piz
ON m.pizzeria_id = piz.id
WHERE price BETWEEN 800 AND 1000),

kate_visits AS (
SELECT *
FROM person_visits pv
JOIN person p
ON pv.person_id = p.id
WHERE p.name = 'Kate')

SELECT 
	pizza_name,
	price,
	pizzeria_name,
	visit_date
FROM cheap_pizzas 
JOIN kate_visits
ON cheap_pizzas.id = kate_visits.pizzeria_id
ORDER BY pizza_name, price, pizzeria_name;