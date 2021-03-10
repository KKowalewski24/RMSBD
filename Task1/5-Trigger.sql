-- Gdy zwalniany jest jakiś pracownik, reszta praconików
-- dostaje 10% podwyżki aby chcieli nadal pracować
CREATE OR REPLACE FUNCTION add_salary_raise()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE employees SET salary = salary * 1.1;
    RETURN new;
END;
$$;

CREATE TRIGGER add_salary_raise_trigger
    AFTER DELETE
    ON employees
    FOR EACH ROW
EXECUTE FUNCTION add_salary_raise();

DELETE
FROM employees
WHERE id = 6;

DROP TRIGGER add_salary_raise_trigger ON employees;

-- Gdy aktualizowany jest grocery to jego kopia jest umieszczana w tabeli groceries_history
CREATE OR REPLACE FUNCTION move_grocery_to_history_on_update()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO grocerieshistory(address)
    SELECT address
    FROM groceries
    WHERE id = new.id;
    RETURN new;
END;
$$;

CREATE TRIGGER move_grocery_to_history_on_update_trigger
    BEFORE UPDATE
    ON groceries
    FOR EACH ROW
EXECUTE FUNCTION move_grocery_to_history_on_update();

UPDATE groceries
SET address = 'new address'
WHERE id = 4;

DROP TRIGGER move_grocery_to_history_on_update_trigger ON groceries;
