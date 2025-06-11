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