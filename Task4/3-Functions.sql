-- https://gis.stackexchange.com/questions/57018/get-lon-lat-values-from-a-geography-data-type-in-postgis

-- Display All showrooms
CREATE OR REPLACE FUNCTION get_all_showrooms()
    RETURNS TABLE (
        id              INT,
        name            TEXT,
        city            TEXT,
        street          TEXT,
        building_number TEXT,
        longitude       FLOAT,
        latitude        FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT sr.id, sr.name, sr.city, sr.street, sr.building_number,
               ST_X(sr.location:: GEOMETRY) AS longitude,
               ST_Y(sr.location:: GEOMETRY) AS latitude
        FROM showrooms sr;
END;
$$;

SELECT *
FROM get_all_showrooms();


-- Display chosen showroom
CREATE OR REPLACE FUNCTION get_chosen_showrooms(chosen_id INT)
    RETURNS TABLE (
        id              INT,
        name            TEXT,
        city            TEXT,
        street          TEXT,
        building_number TEXT,
        longitude       FLOAT,
        latitude        FLOAT
    )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT sr.id, sr.name, sr.city, sr.street, sr.building_number,
               ST_X(sr.location:: GEOMETRY) AS longitude,
               ST_Y(sr.location:: GEOMETRY) AS latitude
        FROM showrooms sr
        WHERE sr.id = chosen_id;
END;
$$;

SELECT *
FROM get_chosen_showrooms(7);
