-- Find all menu identifiers that are not ordered by anyone.
-- The result should be sorted by identifier.

SELECT id AS menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order
ORDER BY menu_id;