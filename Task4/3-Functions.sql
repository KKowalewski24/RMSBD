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
CREATE OR REPLACE FUNCTION get_chosen_showroom(chosen_id INT)
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
FROM get_chosen_showroom(7);


-- Calculates distance between two chosen showrooms
CREATE OR REPLACE FUNCTION calculate_showrooms_distance(first_id INT, second_id INT)
    RETURNS DOUBLE PRECISION
    LANGUAGE plpgsql
AS
$$
DECLARE
    distance DOUBLE PRECISION;
BEGIN
    PERFORM * FROM showrooms WHERE id = first_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed first_id does not exist!';
        RETURN 0;
    END IF;

    PERFORM * FROM showrooms WHERE id = second_id;

    IF NOT found THEN
        RAISE NOTICE 'Passed second_id does not exist!';
        RETURN 0;
    END IF;

    distance = st_distance(
            (
                SELECT location
                FROM showrooms
                WHERE id = first_id
            ),
            (
                SELECT location
                FROM showrooms
                WHERE id = second_id
            )
        );

    IF distance = 0 THEN
        RAISE NOTICE 'distance = 0, cannot divide by ZERO!';
        RETURN 0;
    END IF;

    -- Convert to KM
    RETURN round(distance / 1000);
END;
$$;

SELECT calculate_showrooms_distance(1, 7) AS distance;
