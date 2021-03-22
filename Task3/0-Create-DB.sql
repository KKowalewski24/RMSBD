CREATE DATABASE car_showroom_db
    WITH OWNER postgres;

DROP DATABASE car_showroom_db;

---------------------------------------

SELECT *
FROM car_showroom_single_column;

SELECT *
FROM brands;

SELECT *
FROM vehicle_types;

SELECT *
FROM engine_types;

SELECT *
FROM cars;

---------------------------------------

DELETE
FROM car_showroom_single_column;

DELETE
FROM brands;

DELETE
FROM vehicle_types;

DELETE
FROM engine_types;

DELETE
FROM cars;
