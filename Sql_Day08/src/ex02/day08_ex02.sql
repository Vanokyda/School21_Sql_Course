-- Lost Update for Repeatable Read

-- Тоже самое, что и в предыдущем задании, но уровень изоляции REPEATABLE READ => 
-- Актуальной во время транзакции является только та информация,
-- которая была закоммичена на момент начала транзакции, 
-- соответственно попытка внести изменения в таблицу во время второй сессии до коммита первой сессии
-- приводит к ошибке

-- SESSION #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';