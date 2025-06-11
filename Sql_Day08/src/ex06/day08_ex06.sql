-- Phantom Reads for Repeatable Read

-- Снова тоже самое, что и в прошлом, но так как в этом задании уровень изоляции - REPEATABLE READ,
-- то есть мы видим только то, что было закоммичено в первой транзакции до коммита второй, - сумма остаётся неизменной

-- SESSION #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- SESSION #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
SELECT SUM(rating) FROM pizzeria;