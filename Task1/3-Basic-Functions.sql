SELECT *
FROM employees;

SELECT *
FROM suppliers;

SELECT *
FROM historicalproducts;

SELECT *
FROM products;

SELECT *
FROM groceries;
---------------------------------------
DELETE
FROM suppliers;

DELETE
FROM employees;

DELETE
FROM historicalproducts;

DELETE
FROM products;

DELETE
FROM groceries;
---------------------------------------
CREATE OR REPLACE PROCEDURE add_products(product_name TEXT, product_amount INTEGER,
                                         grocery_id INTEGER, supplier_id INTEGER)
    LANGUAGE SQL
AS
$$
INSERT INTO products (name, amount, groceryid, supplierid)
VALUES (product_name, product_amount, grocery_id, supplier_id);
$$;

CALL add_products('Banana', 20, 1, 1);

