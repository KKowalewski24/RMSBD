CREATE OR REPLACE PROCEDURE add_product(product_name TEXT, product_amount INTEGER,
                                        grocery_id INTEGER, supplier_id INTEGER)
    LANGUAGE SQL
AS
$$
INSERT INTO products (name, amount, groceryid, supplierid)
VALUES (product_name, product_amount, grocery_id, supplier_id);
$$;

CALL add_product('Banana', 20, 1, 1);


---------------------------------------

CREATE OR REPLACE PROCEDURE add_employee(first_name TEXT, last_name TEXT, salary NUMERIC)
    LANGUAGE SQL
AS
$$
INSERT INTO employees (firstname, lastname, salary)
VALUES (first_name, last_name, salary);
$$;

CALL add_employee('Adam', 'Nowak', 3000);

---------------------------------------

CREATE OR REPLACE PROCEDURE add_supplier(name TEXT, gross_vehicle_weight REAL,
                                         employee_id INTEGER)
    LANGUAGE SQL
AS
$$
INSERT INTO suppliers (name, grossvehicleweight, employeeid)
VALUES (name, gross_vehicle_weight, employee_id);
$$;

CALL add_supplier('Third supplier', 2500, 2);

---------------------------------------

CREATE OR REPLACE PROCEDURE add_grocery(grocery_address TEXT, supplier_id INTEGER)
    LANGUAGE SQL
AS
$$
INSERT INTO groceries (address, supplierid)
VALUES (grocery_address, supplier_id);
$$;

CALL add_grocery('Politechniki 25', 2)


