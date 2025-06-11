-- Phantom Reads Anomaly

-- SESSION #1
BEGIN;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- SESSION #2
BEGIN;
INSERT INTO pizzeria VALUES (10, 'Kazan Pizza', 5);
COMMIT;
SELECT SUM(rating) FROM pizzeria;