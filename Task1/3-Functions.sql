-- Zliczanie liczby produktów o danej nazwie
CREATE OR REPLACE FUNCTION count_chosen_product(product_name TEXT)
    RETURNS INTEGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    product_count INTEGER;
BEGIN
    PERFORM * FROM products WHERE name = product_name;
    IF NOT found THEN
        RAISE NOTICE 'Passed product_name does not exist!';
        RETURN 0;
    END IF;

    SELECT count(*) INTO product_count FROM products WHERE name = product_name;
    RETURN product_count;
END;
$$;

SELECT count_chosen_product('Lettuce');

-- Zliczanie kwoty sprzedanych produktów dla danego warzywniaka
CREATE OR REPLACE FUNCTION count_price_sold_product_for_chosen_grocery(grocery_id INTEGER)
    RETURNS REAL
    LANGUAGE plpgsql
AS
$$
DECLARE
    summed_prices REAL;
BEGIN
    PERFORM * FROM groceries WHERE id = grocery_id;
    IF NOT found THEN
        RAISE NOTICE 'Passed grocery_id does not exist!';
        RETURN 0;
    END IF;

    SELECT sum(s.price)
    INTO summed_prices
    FROM groceries
             LEFT JOIN soldproduct s ON groceries.id = s.groceryid
    WHERE groceries.id = grocery_id;

    RETURN summed_prices;
END;
$$;

SELECT count_price_sold_product_for_chosen_grocery(1);

-- Dawanie podwyżki wszystkim pracownikom poniżęj podanej kwoty
CREATE OR REPLACE FUNCTION make_salary_raise(new_salary REAL)
    RETURNS INTEGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    number_of_employees_with_salary_raise INTEGER = 0;
    salary_cursor CURSOR FOR SELECT id, firstname, lastname, salary
                             FROM employees;
BEGIN
    FOR x IN salary_cursor
        LOOP
            IF new_salary > x.salary THEN
                number_of_employees_with_salary_raise =
                        number_of_employees_with_salary_raise + 1;
                UPDATE employees
                SET salary = new_salary
                WHERE id = x.id;
            END IF;
        END LOOP;

    RETURN number_of_employees_with_salary_raise;
END;
$$;

SELECT make_salary_raise(5000);

---------------------------------------

-- CREATE OR REPLACE FUNCTION function_name(PARAM_LIST)
--     RETURNS RETURN_TYPE
--     LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
-- -- variable declaration
-- BEGIN
-- --  logic
-- END;
-- $$
