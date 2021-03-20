-- Add new showroom
CREATE OR REPLACE PROCEDURE add_showroom(chosen_name TEXT, chosen_city TEXT,
                                         chosen_street TEXT, chosen_building_number TEXT,
                                         chosen_longitude DOUBLE PRECISION,
                                         chosen_latitude DOUBLE PRECISION)
    LANGUAGE plpgsql
AS
$$
DECLARE
    point GEOGRAPHY(Point);
BEGIN
    point = st_makepoint(chosen_longitude, chosen_latitude);
    INSERT INTO showrooms (name, city, street, building_number, location)
    VALUES (chosen_name, chosen_city, chosen_street, chosen_building_number, point);
END;
$$;

CALL add_showroom('Porsche Centrum Parzęczew', 'Parzęczew',
                  'Łęczycka', '12',
                  19.207456240112236, 51.950346456472566);
