-- Insert all data into single column
CREATE OR REPLACE FUNCTION get_xml_file_content(filepath TEXT)
    RETURNS XML
    LANGUAGE plpgsql
AS
$$
DECLARE
    content XML;
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_xml_content (
        xml_content XML
    );

    EXECUTE format('COPY temp_xml_content FROM %L ', filepath);
    content = (
                  SELECT xml_content
                  FROM temp_xml_content
              );
    DROP TABLE temp_xml_content;
    RETURN content;
END;
$$;

INSERT INTO car_showroom_single_column (xml_data)
VALUES (get_xml_file_content('C:\Coding\RMSBD\Task3\car-showroom-minified.xml'));


-- Fill tables with specific data
CREATE OR REPLACE PROCEDURE fill_tables_with_xml_content(filepath TEXT)
    LANGUAGE plpgsql
AS
$$
DECLARE
    content XML;
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_content (
        xml_content XML
    );

    INSERT INTO temp_content(xml_content) VALUES (get_xml_file_content(filepath));

    INSERT INTO brands (brand_id, brand_name)
    SELECT xmltable.*
    FROM temp_content,
        XMLTABLE('/car_showroom/brands/brand' PASSING xml_content
                 COLUMNS
                     brand_id TEXT PATH '@brand_id' NOT NULL ,
                     brand_name TEXT PATH '.' NOT NULL
            );

    DROP TABLE temp_content;
END;
$$;

CALL fill_tables_with_xml_content('C:\Coding\RMSBD\Task3\car-showroom-minified.xml');

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
