CREATE OR REPLACE PROCEDURE add_product(product_name TEXT, product_amount REAL,
                                        grocery_id INTEGER, supplier_id INTEGER)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM groceries WHERE id = grocery_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed grocery_id does not exist!';
        RETURN;
    END IF;

    PERFORM * FROM suppliers WHERE id = supplier_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed supplier_id does not exist!';
        RETURN;
    END IF;

    INSERT INTO products (name, amount, groceryid, supplierid)
    VALUES (product_name, product_amount, grocery_id, supplier_id);
END;
$$;

CALL add_product('Banana', 20, 1, 1);

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

CALL add_grocery('Politechniki 25', 2)

---------------------------------------

-- PROCEDURE TEMPLATE
-- create [or replace] procedure procedure_name(parameter_list)
-- language plpgsql
-- as $$
-- declare
-- -- variable declaration
-- begin
-- -- stored procedure body
-- end; $$
