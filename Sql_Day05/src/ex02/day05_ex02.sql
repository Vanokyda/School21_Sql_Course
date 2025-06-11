-- Please create a functional B-Tree index named idx_person_name 
-- on the column name of the person table. 
-- The index should contain person names in upper case.
-- Write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_person_name works.

CREATE INDEX IF NOT EXISTS idx_person_name
ON person (UPPER(NAME));

set enable_seqscan =off;

EXPLAIN analyse (
    SELECT name
    from person
    WHERE UPPER(name) = 'Denis'
);