-- Please create a Materialized View mv_dmitriy_visits_and_eats (with data included)
-- based on the SQL statement that finds the name of the pizzeria
-- where Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 

WITH 
dim_pizzeria_08 AS 
	(SELECT piz.id, piz.name
	FROM (SELECT *
		 FROM person
		 WHERE name = 'Dmitriy') as p
	JOIN person_visits pv
	ON p.id = pv.person_id
	JOIN pizzeria piz 
	ON pv.pizzeria_id = piz.id
	WHERE visit_date = '2022-01-08'),
	
cheap_pizza AS
	(SELECT * 
	FROM menu m
	WHERE price < 800)
	

SELECT 
	name AS pizzeria_name
FROM cheap_pizza m
JOIN dim_pizzeria_08 pizz
ON m.pizzeria_id = pizz.id;