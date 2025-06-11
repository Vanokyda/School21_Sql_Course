-- Please create a multi-column unique index (named idx_person_discounts_unique)
-- that prevents duplicates of the person and pizzeria identifier pairs.
-- After creating a new index, please provide any simple SQL statement 
-- that shows proof of the index usage (using EXPLAIN ANALYZE).

CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan =OFF;
EXPLAIN ANALYZE (
	SELECT
		*
	FROM
		person_discounts
	WHERE person_id = 1
);