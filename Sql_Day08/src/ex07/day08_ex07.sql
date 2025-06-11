-- Deadlock

-- Здесь нам нужно организовать deadlock - ситуацию, при которой 
-- Первая транзакция ждёт коммита второй транзакции, но во второй транзакции
-- запускается запрос для которого нужен коммит первой транзакции =>
-- В случае READ COMMITTED изоляции происходит сброс и ROLLBACK (даже при попытке коммита)
-- второй транзакции и предпочтение отдаётся запросам первой транзакции

-- SESSION #1
BEGIN;
UPDATE pizzeria SET rating = 3 WHERE id = 10;
UPDATE pizzeria SET rating = 3 WHERE id = 11;
COMMIT;
SELECT * FROM pizzeria WHERE id = 10 OR id = 11;

-- SESSION #2
BEGIN;
UPDATE pizzeria SET rating = 2 WHERE id = 11;
UPDATE pizzeria SET rating = 2 WHERE id = 10;
COMMIT;
SELECT * FROM pizzeria WHERE id = 10 OR id = 11;
