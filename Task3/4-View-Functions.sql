-- https://www.2ndquadrant.com/en/blog/xmltable-intro/
-- https://www.depesz.com/2017/03/09/waiting-for-postgresql-10-support-xmltable-query-expression/

SELECT xml_data
FROM car_showroom_single_column;

SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/brands/brand' PASSING xml_data
             COLUMNS
                 name TEXT NOT NULL
        );

SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/vehicle_types/vehicle_type' PASSING xml_data
             COLUMNS
                 name TEXT NOT NULL
        );

SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/engine_types/engine_type' PASSING xml_data
             COLUMNS
                 name TEXT NOT NULL
        );

-- Display Cars
SELECT xmltable.*
FROM car_showroom_single_column,
    XMLTABLE('/car_showroom/cars/car' PASSING xml_data
             COLUMNS
                 model TEXT PATH 'model'NOT NULL,
                 production_year TEXT NOT NULL,
                 price TEXT NOT NULL
        );
