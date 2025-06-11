-- Let's merge all our logic into one main trigger called trg_person_audit and a new corresponding trigger function fnc_trg_person_audit.
-- Теперь нужно объеденить все предыдущие функции в одну общую функцию аудита и триггеры в один общий триггер аудита.
-- Ну, и удалить старые.
-- Ну, и удалить все значения из таблицы аудитов и записать новые, чтобы проверить новую функцию и триггер.

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS
$$
	BEGIN
		IF NEW IS NOT NULL AND OLD IS NOT NULL THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
			VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
			
		ELSEIF NEW IS NULL THEN
			INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
			VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
			
		ELSE 
			INSERT INTO person_audit (row_id, name, age, gender, address)
			VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
		END IF;
		
		RETURN NULL;
	END;
$$
LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER trg_person_audit
	AFTER INSERT OR UPDATE OR DELETE 
	ON person
	FOR EACH ROW
	EXECUTE FUNCTION fnc_trg_person_audit();
	
	

DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_delete_audit();
	
DELETE FROM person_audit;

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;