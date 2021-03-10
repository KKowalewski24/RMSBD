CREATE OR REPLACE PROCEDURE add_product(product_name TEXT, product_amount REAL,
                                        grocery_id INTEGER, supplier_id INTEGER)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM groceries WHERE id = grocery_id;
    PERFORM * FROM suppliers WHERE id = supplier_id;

    INSERT INTO products (name, amount, groceryid, supplierid)
    VALUES (product_name, product_amount, grocery_id, supplier_id);
EXCEPTION
    WHEN FOREIGN_KEY_VIOLATION THEN
        RAISE EXCEPTION 'Passed grocery_id or supplier_id does not exist!';
END;
$$;

CALL add_product('Banana', 20, -5, 1);

---------------------------------------

CREATE OR REPLACE PROCEDURE add_supplier(name TEXT, gross_vehicle_weight REAL,
                                         employee_id INTEGER)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM employees WHERE id = employee_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed employee_id does not exist!';
        RETURN;
    END IF;

    INSERT INTO suppliers (name, grossvehicleweight, employeeid)
    VALUES (name, gross_vehicle_weight, employee_id);
END;
$$;

CALL add_supplier('Third supplier', 2500, 2);

---------------------------------------

CREATE OR REPLACE PROCEDURE add_grocery(grocery_address TEXT, supplier_id INTEGER)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM suppliers WHERE id = supplier_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed supplier_id does not exist!';
        RETURN;
    END IF;

    INSERT INTO groceries (address, supplierid)
    VALUES (grocery_address, supplier_id);
END;
$$;

CALL add_grocery('Politechniki 25', 2);

---------------------------------------

CREATE OR REPLACE PROCEDURE hire_employee_in_grocery(first_name TEXT, last_name TEXT,
                                                     salary NUMERIC, grocery_id INTEGER)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM groceries WHERE id = grocery_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed grocery_id does not exist!';
        RETURN;
    END IF;

    INSERT INTO employees (firstname, lastname, salary, employmentdate, groceryid)
    VALUES (first_name, last_name, salary, now(), grocery_id);
END;
$$;

CALL hire_employee_in_grocery('Adam', 'Nowak', 3000, 1);

---------------------------------------

-- create or replace procedure procedure_name(parameter_list)
-- language plpgsql
-- as $$
-- declare
-- -- variable declaration
-- begin
-- -- stored procedure body
-- end; $$
