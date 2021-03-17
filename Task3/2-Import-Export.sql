--
-- The absolute path name of the input or output file. Windows users
-- might need to use an E'' string and double any backslashes
-- used in the path name.
--

CREATE OR REPLACE PROCEDURE xml_import()
    LANGUAGE plpgsql
AS
$$
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_content (
        content XML
    );

    COPY temp_content FROM 'C:\Coding\RMSBD\Task3\car-showroom-minified.xml';

    INSERT INTO car_showroom (xml_data)
    SELECT *
    FROM temp_content;

    DROP TABLE temp_content;
END;
$$;

CALL xml_import();

---------------------------------------

CREATE OR REPLACE PROCEDURE xml_export()
    LANGUAGE plpgsql
AS
$$
BEGIN
    COPY (SELECT xml_data FROM car_showroom) TO 'C:\Coding\RMSBD\Task3\car-showroom-out.xml';
END;
$$;

CALL xml_export();

---------------------------------------
-- DO NOT DELETE THIS
-- CREATE OR REPLACE FUNCTION xml_import_low_level(filename TEXT)
--     RETURNS XML
--     VOLATILE
--     LANGUAGE plpgsql AS
-- $f$
-- DECLARE
--     content BYTEA;
--     loid    OID;
--     lfd     INTEGER;
--     lsize   INTEGER;
-- BEGIN
--     loid := lo_import(filename);
--     lfd := lo_open(loid, 262144);
--     lsize := lo_lseek(lfd, 0, 2);
--     PERFORM lo_lseek(lfd, 0, 0);
--     content := loread(lfd, lsize);
--     PERFORM lo_close(lfd);
--     PERFORM lo_unlink(loid);
--
--     RETURN xmlparse(DOCUMENT convert_from(content, 'UTF8'));
-- END;
-- $f$;
--
-- INSERT INTO car_showroom (xml_data)
-- VALUES (xml_import_low_level('C:\Coding\RMSBD\Task3\car-showroom-minified.xml'));
