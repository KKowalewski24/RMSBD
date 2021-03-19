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
