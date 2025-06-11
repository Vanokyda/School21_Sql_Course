-- Please find pizzerias that have been visited more often by women or by men.
-- Save duplicates for any SQL operators with sets (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions).
-- Please sort a result by the name of the pizzeria. 

-- Var 1 (The better one)
WITH 
male_female_visits AS (
	SELECT 
		gender,
		piz.name AS pizzeria_name,
		p.name
	FROM person_visits pv
	JOIN person p
	ON pv.person_id = p.id
	JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id),
	
female_visits AS (
	SELECT 
		pizzeria_name,
		COUNT (name)
	FROM male_female_visits
	WHERE gender = 'female'
	GROUP BY pizzeria_name),
	
male_visits AS (
	SELECT 
		pizzeria_name,
		COUNT (name)
	FROM male_female_visits
	WHERE gender = 'male'
	GROUP BY pizzeria_name)


SELECT 
	fv.pizzeria_name AS pizzeria_name
FROM female_visits fv
JOIN male_visits mv
ON fv.pizzeria_name = mv.pizzeria_name
WHERE fv.count - mv.count != 0
ORDER BY pizzeria_name;


-- Var 2 (With operators with sets)

WITH 
male_female_visits AS (
	SELECT 
		gender,
		piz.name AS pizzeria_name,
		p.name
	FROM person_visits pv
	JOIN person p
	ON pv.person_id = p.id
	JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id),
	
female_visits AS (
	SELECT 
		pizzeria_name
	FROM male_female_visits
	WHERE gender = 'female'),
	
male_visits AS (
	SELECT 
		pizzeria_name
	FROM male_female_visits
	WHERE gender = 'male')


(SELECT *
FROM male_visits
EXCEPT ALL
SELECT *
FROM female_visits)
UNION ALL
(SELECT *
FROM female_visits
EXCEPT ALL
SELECT *
FROM male_visits)
ORDER BY pizzeria_name;