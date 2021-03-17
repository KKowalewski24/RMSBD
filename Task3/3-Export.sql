CREATE OR REPLACE PROCEDURE xml_export(filepath TEXT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    EXECUTE format('COPY (SELECT xml_data FROM car_showroom_single_column) TO %L',
                   filepath);
END;
$$;

CALL xml_export('C:\Coding\RMSBD\Task3\car-showroom-out.xml');

---------------------------------------
