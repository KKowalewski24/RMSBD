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

SELECT count_chosen_product('Lettuce1');

---------------------------------------

---------------------------------------

-- CREATE OR REPLACE FUNCTION function_name(PARAM_LIST)
--     RETURNS RETURN_TYPE
--     LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
-- variable declaration
-- BEGIN
--     logic
-- END;
-- $$
