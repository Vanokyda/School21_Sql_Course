SELECT 
	fin.name AS person_name,
	pizza_name,
	pizz.name AS pizzeria_name
FROM 
	(SELECT 
	 	name,
	 	pizzeria_id,
	 	pizza_name
 	FROM (SELECT 
		  	name,
		  	menu_id
			FROM person_order po
			JOIN person p
			ON po.person_id = p.id) st
	JOIN menu m
	ON st.menu_id = m.id) AS fin
JOIN pizzeria pizz
ON fin.pizzeria_id = pizz.id 
ORDER BY person_name, pizza_name, pizzeria_name;