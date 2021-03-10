-- trigget 1 na sprawdzenie - złozony checker - jak dodajemy produkt do soildPorcudct - nie moze my
-- tego zrobic jezzeli cena za kg jesrt mniej nie ostatenio kupionego produktu tej samej nazwy - w boguht product

-- trigger 2 - gdy dodajemy produkt do warzywnia lub dostawcy i już jest to sumujemy - robimy update
-- a jak nie ma to dodajemy

-- trigger 3 jezeli dodamy do bought to musi sie dodać do product

-- trigger 4 jezeli dodamy do sold to musi sie usunac z product

-- scheduler co 3 miesiace podwyzka - data zatrdunienia u pracownika

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
WHERE id = 4;
