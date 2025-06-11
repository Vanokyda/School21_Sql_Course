-- Define a trigger trg_person_update_audit and corresponding trigger function fnc_trg_person_update_audit 
-- to handle all UPDATE traffic on the person table. 
-- We should save the OLD states of all attribute values.
-- Короче, тоже самое, что в предыдущем, но для UPDATE. Ну, и без создания таблицы

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS
$$
	BEGIN
	INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
	VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	RETURN OLD;
	END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_update_audit
	AFTER UPDATE 
	ON person
	FOR EACH ROW
	EXECUTE FUNCTION fnc_trg_person_update_audit();
	
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;