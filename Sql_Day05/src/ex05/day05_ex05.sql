-- Please create a partially unique BTree index named idx_person_order_order_date 
-- on the person_order table for the person_id and menu_id attributes 
-- with partial uniqueness for the order_date column for the date '2022-01-01'.

CREATE INDEX if not EXISTS idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

set enable_seqscan =off;

EXPLAIN ANALYSE (
    SELECT
	    person_id,
      menu_id
    FROM person_order
    WHERE order_date = '2022-01-01'
);