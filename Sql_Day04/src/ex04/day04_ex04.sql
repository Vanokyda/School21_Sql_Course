-- Write an SQL statement that satisfies the formula (R - S)∪(S - R) .
-- Where R is the person_visits table with a filter through January 2, 2022,
-- S is also the person_visits table but with a different filter through January 6, 2022.
-- Please do your calculations with sets under the person_id column and this column will be alone in a result.
-- Please sort the result by the person_id column and present your final SQL in the v_symmetric_union database view.

CREATE VIEW v_symmetric_union AS 

WITH
R AS
	(SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-02'),
S AS
	(SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-06')
	
	
(SELECT *
FROM R
EXCEPT
SELECT * 
FROM S)
UNION
(SELECT *
FROM S
EXCEPT 
SELECT *
FROM R)
ORDER BY person_id;