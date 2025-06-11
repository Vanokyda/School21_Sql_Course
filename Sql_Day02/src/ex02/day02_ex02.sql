SELECT 
	COALESCE (p.name, '-') AS person_name,
	visit_date,
	COALESCE (piz.name, '-') AS pizzeria_name
FROM (SELECT * FROM person_visits
	  WHERE visit_date = '2022-01-01' OR visit_date = '2022-01-02' OR visit_date = '2022-01-03') AS pv
FULL JOIN person p ON pv.person_id = p.id
FULL JOIN pizzeria piz ON pv.pizzeria_id = piz.id
ORDER BY 1, 2, 3;