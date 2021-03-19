-- Display chosen cars based on brand name
CREATE OR REPLACE FUNCTION get_cars_chosen_brand(chosen_brand_name TEXT)
    RETURNS TABLE (
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT,
        model             TEXT,
        production_year   INT,
        price             FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM * FROM get_all_brands() WHERE get_all_brands.brand_name = chosen_brand_name;
    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_brand_name does not exist!';
    ELSE
        RETURN QUERY SELECT *
                     FROM get_all_data() AS data
                     WHERE data.brand_name = chosen_brand_name;

    END IF;
END;
$$;

SELECT *
FROM get_cars_chosen_brand('Audi');


-- Display chosen cars based on vehicle type name
CREATE OR REPLACE FUNCTION get_cars_chosen_vehicle_type(chosen_vehicle_type_name TEXT)
    RETURNS TABLE (
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT,
        model             TEXT,
        production_year   INT,
        price             FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM get_all_vehicle_types()
    WHERE get_all_vehicle_types.vehicle_type_name = chosen_vehicle_type_name;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_vehicle_type_name does not exist!';
    ELSE
        RETURN QUERY SELECT *
                     FROM get_all_data() AS data
                     WHERE data.vehicle_type_name = chosen_vehicle_type_name;

    END IF;
END;
$$;

SELECT *
FROM get_cars_chosen_vehicle_type('SUV');


-- Display chosen cars based on engine_type name
CREATE OR REPLACE FUNCTION get_cars_chosen_engine_type(chosen_engine_type_name TEXT)
    RETURNS TABLE (
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT,
        model             TEXT,
        production_year   INT,
        price             FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM get_all_engine_types()
    WHERE get_all_engine_types.engine_type_name = chosen_engine_type_name;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_engine_type_name does not exist!';
    ELSE
        RETURN QUERY SELECT *
                     FROM get_all_data() AS data
                     WHERE data.engine_type_name = chosen_engine_type_name;

    END IF;
END;
$$;

SELECT *
FROM get_cars_chosen_engine_type('diesel');
