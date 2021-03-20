-- https://gis.stackexchange.com/questions/362495/how-to-add-google-maps-coordinates-into-arcmap
-- https://www.gps-coordinates.net/
-- In Point() the Decimal degrees are used - standard in GIS systems
-- In case of taking coordinates from Google Maps remember to change order
-- GIS requires (X, Y) but Google Maps give (Y, X) where X - Longitude, Y - Latitude

INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Sopot', 'Sopot', 'Al. Niepodległości', '956',
        'POINT(18.55344067643752 54.460568235759865)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Poznań', 'Poznań', 'ul. Warszawska', '67',
        'POINT(16.971675759922814 52.41045456398449)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Warszawa', 'Warszawa', 'ul. Połczyńska', '107',
        'POINT(20.88984969050223 52.21668117572118)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Warszawa Okęcie', 'Warszawa', 'ul. Sekundowa', '1A',
        'POINT(20.958436075140366 52.18489924788504)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Wrocław', 'Wrocław', 'al. Karkonoska', '54',
        'POINT(16.999799459170497 51.062585313030496)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Katowice', 'Katowice', 'ul. Kochłowicka', '103',
        'POINT(18.96985538941529 50.255615579400796)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Łódź', 'Łódź', 'al. Władysława Bartoszewskiego', 15,
        'POINT(19.4603866595323 51.714012326004)');
INSERT INTO showrooms (name, city, street, building_number, location)
VALUES ('Porsche Centrum Kraków', 'Kraków', 'ul. Jasnogórska', '109',
        'POINT(19.886791827955236 50.10365852563854)');
