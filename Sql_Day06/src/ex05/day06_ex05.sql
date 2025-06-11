-- To comply with Data Governance Policies, you need to add comments for the table and the table's columns. 
-- Let's apply this policy to the person_discounts table. 
-- Please add English or Russian comments explaining what is a business goal of a table and all its attributes.

COMMENT ON TABLE person_discounts IS 'Business goal is MAKING FAT DOLLERS😎';

COMMENT ON COLUMN person_discounts.id IS 'Primary key of the table';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key to "person" table. A not null column';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key to "pizzeria" table. A not null column';
COMMENT ON COLUMN person_discounts.discount IS 'Percentage discount for a person in a pizzeria. A not null column with a value in range between 0 and 100';