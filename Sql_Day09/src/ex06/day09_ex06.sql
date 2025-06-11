-- Please create a pl/pgsql function fnc_person_visits_and_eats_on_date 
-- based on an SQL statement that will find the names of pizzerias 
-- that a person (IN pperson parameter with default value 'Dmitriy') visited and where he could buy pizza 
-- for less than the given amount in rubles (IN pprice parameter with default value 500) 
-- on the given date (IN pdate parameter with default value January 8, 2022).

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson text = 'Dmitriy', pprice int = 500, pdate date = '2022-01-08')
RETURNS TABLE (
	pizzeria_name VARCHAR
) AS
$$
	BEGIN
	RETURN QUERY
		WITH 
		custom_pizzeria AS 
			(SELECT piz.id, piz.name
			FROM (SELECT *
				 FROM person
				 WHERE name = pperson) as p
			JOIN person_visits pv
			ON p.id = pv.person_id
			JOIN pizzeria piz 
			ON pv.pizzeria_id = piz.id
			WHERE visit_date = pdate),

		cheap_pizza AS
			(SELECT * 
			FROM menu m
			WHERE price < pprice)

		SELECT 
			name AS pizzeria_name
		FROM cheap_pizza m
		JOIN custom_pizzeria pizz
		ON m.pizzeria_id = pizz.id;
	END;
$$
LANGUAGE PLPGSQL;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');