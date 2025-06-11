-- Please create a unique BTree index named idx_menu_unique on the menu table 
-- for pizzeria_id and pizza_name columns.
-- Write and provide any SQL with proof (EXPLAIN ANALYZE).


CREATE UNIQUE INDEX if not EXISTS idx_menu_unique
ON menu (pizzeria_id, pizza_name);

set enable_seqscan =off;

EXPLAIN ANALYZE (
	SELECT 
		pizzeria_id,
		pizza_name
	FROM menu
	WHERE pizza_name = 'sicilian pizza'
);