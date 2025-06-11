-- Please write an SQL or pl/pgsql function func_minimum (it is up to you) 
-- that has an input parameter that is an array of numbers 
-- and the function should return a minimum value.

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS NUMERIC AS
$$
DECLARE
	minimum_value NUMERIC;
BEGIN
	SELECT MIN(value) INTO minimum_value
	FROM unnest(arr) AS value;
	RETURN minimum_value;
END;
$$
LANGUAGE PLPGSQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);