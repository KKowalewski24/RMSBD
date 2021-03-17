CREATE OR REPLACE FUNCTION xml_import(filename TEXT)
    RETURNS XML
    VOLATILE
    LANGUAGE plpgsql AS
$f$
DECLARE
    content BYTEA;
    loid    OID;
    lfd     INTEGER;
    lsize   INTEGER;
BEGIN
    loid := lo_import(filename);
    lfd := lo_open(loid, 262144);
    lsize := lo_lseek(lfd, 0, 2);
    PERFORM lo_lseek(lfd, 0, 0);
    content := loread(lfd, lsize);
    PERFORM lo_close(lfd);
    PERFORM lo_unlink(loid);

    RETURN xmlparse(DOCUMENT convert_from(content, 'UTF8'));
END;
$f$;

INSERT INTO xml_file (xml_data)
VALUES (xml_import('C:\Coding\RMSBD\Task3\car-showroom.xml'));
