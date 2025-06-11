-- Let’s create a Database Sequence named seq_person_discounts (starting with a value of 1) 
-- and set a default value for the id attribute of the person_discounts table to automatically take a value from seq_person_discounts each time.
-- Please note that your next sequence number is 1, 
-- in this case please set an actual value for database sequence based on formula "number of rows in person_discounts table" + 1. 
-- Otherwise you will get errors about Primary Key violation constraint.

CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
AS BIGINT
START WITH 1
OWNED BY person_discounts.id;

-- Устанавливаем стартовое значение в последовательности на Max(id) + 1 
-- + 1 так как в скобках true => при вызове функции setval уже как бы вызовется max(id)
-- и при вызове в таблице уже будет Max(id) + 1
-- Короче, идентично "max(id) + 1, false", но я вот так захотел
SELECT 
	setval('seq_person_discounts', MAX(id), true) 
FROM person_discounts;

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');