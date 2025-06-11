SELECT * 
FROM (SELECT 
	  	name AS object_name
	 FROM person
	 ORDER BY object_name) AS people
UNION ALL
SELECT *
FROM (SELECT 
	  	pizza_name AS object_name
	 FROM menu
	 ORDER BY object_name) AS pizzas;