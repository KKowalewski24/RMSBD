-- https://www.2ndquadrant.com/en/blog/xmltable-intro/
-- https://www.depesz.com/2017/03/09/waiting-for-postgresql-10-support-xmltable-query-expression/
-- https://odieweblog.wordpress.com/2016/05/20/how-to-using-outer-join-with-xmltable-or-xquery/

-- Display Brands
CREATE OR REPLACE FUNCTION get_all_brands()
    RETURNS TABLE (
        brand_id   TEXT,
        brand_name TEXT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT xmltable.*
        FROM car_showroom_single_column,
            XMLTABLE('/car_showroom/brands/brand' PASSING xml_data
                     COLUMNS
                         brand_id TEXT PATH '@brand_id',
                         brand_name TEXT PATH '.' NOT NULL
                );
END;
$$;

SELECT *
FROM get_all_brands();


-- Display Vehicle Types
CREATE OR REPLACE FUNCTION get_all_vehicle_types()
    RETURNS TABLE (
        vehicle_type_id   TEXT,
        vehicle_type_name TEXT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT xmltable.*
        FROM car_showroom_single_column,
            XMLTABLE('/car_showroom/vehicle_types/vehicle_type' PASSING xml_data
                     COLUMNS
                         vehicle_type_id TEXT PATH '@vehicle_type_id',
                         vehicle_type_name TEXT PATH '.' NOT NULL
                );
END;
$$;

SELECT *
FROM get_all_vehicle_types();


-- Display Engine Types
SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/engine_types/engine_type' PASSING xml_data
             COLUMNS
                 engine_id TEXT PATH '@engine_id',
                 engine_name TEXT PATH '.' NOT NULL
        );

-- Display All Data - only ID
SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/cars/car' PASSING xml_data
             COLUMNS
                 brand_id TEXT PATH '@brand_id',
                 vehicle_type_id TEXT PATH '@vehicle_type_id',
                 engine_id TEXT PATH '@engine_id',
                 model TEXT PATH 'model' NOT NULL,
                 production_year TEXT PATH 'production_year' NOT NULL,
                 price TEXT PATH 'price' NOT NULL
        );
