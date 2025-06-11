-- Finally, we need to handle DELETE statements and make a copy of the OLD states for all attribute’s values.
-- Please create a trigger trg_person_delete_audit and corresponding trigger function fnc_trg_person_delete_audit.
-- Короче, опять тоже самое, но для DELETE

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS
$$
	BEGIN
	INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
	VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	RETURN OLD;
	END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_delete_audit
	BEFORE DELETE 
	ON person
	FOR EACH ROW
	EXECUTE FUNCTION fnc_trg_person_delete_audit();
	
DELETE FROM person WHERE id = 10;