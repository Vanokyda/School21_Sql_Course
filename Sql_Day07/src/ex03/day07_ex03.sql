-- Write an SQL statement to see how restaurants are grouped by visits and by orders,
-- and joined together by restaurant name.
-- You can use the internal SQL from Exercise 02 without any restrictions on the number of rows.
-- In addition, add the following rules:
	-- Compute a sum of orders and visits for the corresponding pizzeria.
	-- Sort the results by the total_count column in descending order
	-- and by the name column in ascending order.

WITH
top_orders AS (
	SELECT
		piz.name,
		COUNT (po.id)
	FROM person_order po
	JOIN menu m
	ON po.menu_id = m.id
	JOIN pizzeria piz
	ON m.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY COUNT DESC
),

top_visits AS (
	SELECT
		piz.name,
		COUNT (pv.id)
	FROM person_visits pv
	JOIN pizzeria piz
	ON pv.pizzeria_id = piz.id
	GROUP BY piz.name
	ORDER BY COUNT DESC
),

top_top AS (
	SELECT *
	FROM top_orders
	UNION ALL
	SELECT *
	FROM top_visits
)

SELECT
	name,
	sum(COUNT) AS total_count
FROM top_top
GROUP BY name
ORDER BY total_count DESC, name;