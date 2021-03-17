CREATE OR REPLACE PROCEDURE xml_export()
    LANGUAGE plpgsql
AS
$$
BEGIN
    COPY (SELECT xml_data FROM car_showroom_single_row) TO 'C:\Coding\RMSBD\Task3\car-showroom-out.xml';
END;
$$;

CALL xml_export();

---------------------------------------
