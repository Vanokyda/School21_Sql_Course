-- Drop functions from previous exercise
-- Write a generic SQL function (note, not pl/pgsql-function) called fnc_persons. 
-- This function should have an IN parameter pgender with the default value = 'female'.

DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender text = 'female')
RETURNS TABLE (
	id BIGINT,
	name VARCHAR,
	age INTEGER,
	gender VARCHAR,
	address VARCHAR
) AS
$$
	SELECT *
	FROM person
	WHERE gender = pgender;
$$
LANGUAGE SQL;


SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
