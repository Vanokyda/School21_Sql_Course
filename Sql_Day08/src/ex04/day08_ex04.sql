-- Non-Repeatable Reads for Serialization

-- Здесь снова повторение предыдущего (03) задания, но с другим уровнем изоляции
-- В данном случае используется SERIALIZABLE уровень изоляции при котором комманды в транзакциях
-- выполняются как бы друг за другом, то есть так, если бы мы просто последовательно прописывали их сами.
-- Соответственно, в отличие от REPEATABLE READ, UPDATE второй сессии не ждёт завершения первой
-- (на скринах этого не видно - потому что это скрины - но это так)

-- SESSION #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';