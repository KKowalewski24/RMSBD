CREATE OR REPLACE PROCEDURE xml_export_single_column(filepath TEXT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    EXECUTE format('COPY (SELECT xml_data FROM car_showroom_single_column) TO %L',
                   filepath);
END;
$$;

CALL xml_export_single_column('C:\Coding\RMSBD\Task3\car-showroom-out.xml');

---------------------------------------
