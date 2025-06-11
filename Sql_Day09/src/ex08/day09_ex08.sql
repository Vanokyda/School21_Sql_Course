-- Write an SQL or pl/pgsql function fnc_fibonacci (it's up to you) 
-- that has an input parameter pstop of type integer (default is 10) 
-- and the function output is a table of all Fibonacci numbers less than pstop.

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int = 10)
RETURNS TABLE (
	fibonacci NUMERIC
) AS
$$
BEGIN
	IF pstop > 0 THEN
		RETURN QUERY
		WITH RECURSIVE f(cur_num, next_num) AS (
		  SELECT
			0::NUMERIC AS cur_num,
			1::NUMERIC AS next_num
		  UNION ALL
		  SELECT
			next_num as cur_num,
			cur_num + next_num as next_num
		  FROM f
		  WHERE next_num < pstop
		)
		SELECT cur_num
		FROM f;	
	ELSE 
		RETURN QUERY SELECT NULL::NUMERIC;
	END IF;
END;
$$
LANGUAGE PLPGSQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();