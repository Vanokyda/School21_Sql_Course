-- Before proceeding,
-- please write an SQL statement that returns pizzas
-- and the corresponding pizzeria names.
-- Let's prove that your indexes work for your SQL with EXPLAIN ALAYZE command.

set enable_seqscan =off;

EXPLAIN ANALYSE (
    SELECT 
    pizza_name,
    pizz.name as pizzeria_name
  FROM
    menu m
  JOIN pizzeria pizz
  ON m.pizzeria_id = pizz.id
);