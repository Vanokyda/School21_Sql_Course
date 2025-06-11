-- Find a union of pizzerias that have orders from either women or men.
-- In other words, you should find a set of names of pizzerias that have been ordered only by women
-- and make "UNION" operation with set of names of pizzerias that have been ordered only by men.
-- Please be careful with word "only" for both genders. 
-- For all SQL operators with sets don't store duplicates (UNION, EXCEPT, INTERSECT). Please sort a result by the name of the pizzeria.

WITH 
male_female_orders AS (
	SELECT 
		gender,
		piz.name AS pizzeria_name,
		p.name
	FROM person_order po
	JOIN person p
	ON po.person_id = p.id
	JOIN menu m
	ON po.menu_id = m.id
	JOIN pizzeria piz
	ON m.pizzeria_id = piz.id),
	
female_orders AS (
	SELECT 
		pizzeria_name
	FROM male_female_orders
	WHERE gender = 'female'),
	
male_orders AS (
	SELECT 
		pizzeria_name
	FROM male_female_orders
	WHERE gender = 'male')

(SELECT * 
FROM female_orders
EXCEPT
SELECT *
FROM male_orders)
UNION
(SELECT *
FROM male_orders
EXCEPT
SELECT * 
FROM female_orders)
ORDER BY pizzeria_name;