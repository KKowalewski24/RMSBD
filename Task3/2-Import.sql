CREATE OR REPLACE FUNCTION get_xml_file_content()
    RETURNS XML
    LANGUAGE plpgsql
AS
$$
DECLARE
    content XML;
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_content (
        xml_content XML
    );

    -- There is no other option - path must be absolute and it cannot passed as parameter
    COPY temp_content FROM 'C:\Coding\RMSBD\Task3\car-showroom-minified.xml';
    content = (
                  SELECT xml_content
                  FROM temp_content
              );
    DROP TABLE temp_content;
    RETURN content;
END;
$$;

-- Insert all data into single column
INSERT INTO car_showroom_single_column (xml_data)
VALUES (get_xml_file_content())

---------------------------------------

-- TODO DO NOT DELETE THIS
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
-- INSERT INTO car_showroom_single_column (xml_data)
-- VALUES (xml_import_low_level('C:\Coding\RMSBD\Task3\car-showroom-minified.xml'));
