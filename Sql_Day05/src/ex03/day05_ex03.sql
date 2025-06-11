-- Please create a better multi-column B-Tree index named idx_person_order_multi 
-- for the SQL statement below. (оно в скобках EXPLAIN ANALYZE)
-- The EXPLAIN ANALYZE command should return "Index Only scan..."

CREATE INDEX if not EXISTS idx_person_order_multi
ON person_order (person_id, menu_id, order_date);

set enable_seqscan =off;

EXPLAIN ANALYSE (
    SELECT 
        person_id,
        menu_id,
        order_date
    FROM person_order
    WHERE person_id = 8 AND menu_id = 19
);
