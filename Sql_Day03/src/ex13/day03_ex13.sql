-- Write 2 SQL (DML) statements that delete all new orders from Exercise #12 based on the order date.

DELETE FROM person_order
WHERE order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';

-- Check1
-- SELECT *
-- FROM person_order
-- WHERE order_date = '2022-02-25';

-- Check2
-- SELECT *
-- FROM menu 
-- WHERE pizza_name = 'greek pizza';