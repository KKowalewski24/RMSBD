-- Display All Cars - fetch all data
CREATE OR REPLACE FUNCTION get_all_data_mapping()
    RETURNS TABLE (
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT,
        car_id            TEXT,
        model             TEXT,
        production_year   INT,
        price             FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT b.brand_name, vt.vehicle_type_name, et.engine_type_name, cars.car_id,
               cars.model, cars.production_year, cars.price
        FROM cars
                 INNER JOIN brands b ON cars.brand_id = b.brand_id
                 INNER JOIN vehicle_types vt ON cars.vehicle_type_id = vt.vehicle_type_id
                 INNER JOIN engine_types et ON cars.engine_type_id = et.engine_type_id;
END;
$$;

SELECT *
FROM get_all_data_mapping();


-- Update car production year
CREATE OR REPLACE PROCEDURE update_car_production_year(chosen_car_id TEXT, chosen_production_year INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM cars
    WHERE car_id = chosen_car_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_car_id does not exist!';
        RETURN;
    END IF;

    UPDATE cars
    SET production_year = chosen_production_year
    WHERE car_id = chosen_car_id;
END;
$$;

CALL update_car_production_year('car_1', 2015);


-- Update car price
CREATE OR REPLACE PROCEDURE update_car_price(chosen_car_id TEXT, chosen_price INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM cars
    WHERE car_id = chosen_car_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_car_id does not exist!';
        RETURN;
    END IF;

    UPDATE cars
    SET price = chosen_price
    WHERE car_id = chosen_car_id;
END;
$$;

CALL update_car_price('car_1', 160000);


-- Change engine type in car
CREATE OR REPLACE PROCEDURE update_car_engine_type(chosen_car_id TEXT, chosen_engine_type_id TEXT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM cars
    WHERE car_id = chosen_car_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_car_id does not exist!';
        RETURN;
    END IF;

    UPDATE cars
    SET engine_type_id = chosen_engine_type_id
    WHERE car_id = chosen_car_id;
END;
$$;

CALL update_car_engine_type('car_13', 'engine_2');


-- Delete car - this function imitates selling the car
CREATE OR REPLACE PROCEDURE delete_car(chosen_car_id TEXT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM cars
    WHERE car_id = chosen_car_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_car_id does not exist!';
        RETURN;
    END IF;

    DELETE
    FROM cars
    WHERE car_id = chosen_car_id;
END;
$$;

CALL delete_car('car_6');


-- Delete brand and cars that belong to this brand - this function
-- imitates finishing of cooperation with chosen brand and giving
-- back all cars - deleting them from DB
CREATE OR REPLACE PROCEDURE delete_brand(chosen_brand_id TEXT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    PERFORM *
    FROM brands
    WHERE brand_id = chosen_brand_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed chosen_brand_id does not exist!';
        RETURN;
    END IF;

    DELETE
    FROM cars
    WHERE brand_id = chosen_brand_id;

    DELETE
    FROM brands
    WHERE brand_id = chosen_brand_id;
END;
$$;

CALL delete_brand('brand_1');
