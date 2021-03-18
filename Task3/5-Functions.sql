-- Display All Cars - fetch all data
CREATE OR REPLACE FUNCTION get_all_data()
    RETURNS TABLE (
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT,
        model             TEXT,
        production_year   TEXT,
        price             TEXT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY SELECT brand.brand_name, vehicle_type.vehicle_type_name,
                        engine_type.engine_name, car.model, car.production_year, car.price
                 FROM car_showroom_single_column,
                      XMLTABLE('/car_showroom/brands/brand' PASSING xml_data
                               COLUMNS
                                   brand_id TEXT PATH '@brand_id' NOT NULL ,
                                   brand_name TEXT PATH '.' NOT NULL
                          ) brand,
                      XMLTABLE('/car_showroom/vehicle_types/vehicle_type' PASSING xml_data
                               COLUMNS
                                   vehicle_type_id TEXT PATH '@vehicle_type_id' NOT NULL,
                                   vehicle_type_name TEXT PATH '.' NOT NULL
                          ) vehicle_type,
                      XMLTABLE('/car_showroom/engine_types/engine_type' PASSING xml_data
                               COLUMNS
                                   engine_id TEXT PATH '@engine_id' NOT NULL,
                                   engine_name TEXT PATH '.' NOT NULL
                          ) engine_type,
                      XMLTABLE('/car_showroom/cars/car' PASSING xml_data
                               COLUMNS
                                   brand_id TEXT PATH '@brand_id' NOT NULL,
                                   vehicle_type_id TEXT PATH '@vehicle_type_id' NOT NULL,
                                   engine_id TEXT PATH '@engine_id' NOT NULL,
                                   model TEXT PATH 'model' NOT NULL,
                                   production_year TEXT PATH 'production_year' NOT NULL,
                                   price TEXT PATH 'price' NOT NULL
                          ) car
                 WHERE car.brand_id = brand.brand_id
                   AND car.vehicle_type_id = vehicle_type.vehicle_type_id
                   AND car.engine_id = engine_type.engine_id;
END;
$$;

SELECT *
FROM get_all_data();

-- Display chosen cars based on brand name
CREATE OR REPLACE FUNCTION get_cars_chosen_brand(chosen_brand_name TEXT)
    RETURNS TABLE (
        model             TEXT,
        production_year   TEXT,
        price             TEXT,
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT
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
        model             TEXT,
        production_year   TEXT,
        price             TEXT,
        brand_name        TEXT,
        vehicle_type_name TEXT,
        engine_type_name  TEXT
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
FROM get_cars_chosen_vehicle_type('Kombi');
