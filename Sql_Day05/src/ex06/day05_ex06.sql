--Improve performance of the query below.

CREATE INDEX IF NOT EXISTS idx_1
ON pizzeria(rating);

SET enable_seqscan=off;

EXPLAIN ANALYZE (
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2
);
	
--Check
--SET enable_seqscan=on;
--DROP INDEX idx_1
--И потом EXPLAIN ANALYZE... запустить