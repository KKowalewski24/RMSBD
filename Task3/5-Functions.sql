-- Display All Cars - fetch all data
CREATE OR REPLACE FUNCTION get_all_data()
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
    RETURN QUERY SELECT car.model, car.production_year, car.price, brand.brand_name,
                        vehicle_type.vehicle_type_name, engine_type.engine_name
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

--
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
    RETURN QUERY SELECT *
                 FROM get_all_data() AS data
                 WHERE data.brand_name = chosen_brand_name;
END;
$$;

SELECT *
FROM get_cars_chosen_brand('Audi');
