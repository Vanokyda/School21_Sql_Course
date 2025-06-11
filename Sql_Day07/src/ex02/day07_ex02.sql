-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in a list 
-- (please add an action_type column with values 'order' or 'visit', 
--  it depends on the data from the corresponding table). 
-- The result should be sorted in ascending order by the action_type column 
-- and in descending order by the count column.

WITH 
top_3_orders AS (
	SELECT 
		piz.name,
		COUNT (po.id),
		'order' AS action_type
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY COUNT DESC
	LIMIT 3
),

top_3_visits AS (
	SELECT 
		piz.name,
		COUNT (pv.id),
		'visit' AS action_type
	FROM person_visits pv
	JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY COUNT DESC
	LIMIT 3
)

SELECT *
FROM top_3_orders
UNION
SELECT *
FROM top_3_visits
ORDER BY action_type, COUNT DESC;