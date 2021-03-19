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

SELECT b.brand_name, vt.vehicle_type_name, et.engine_type_name, cars.car_id, cars.model,
       cars.production_year, cars.price
FROM cars
         INNER JOIN brands b ON cars.brand_id = b.brand_id
         INNER JOIN vehicle_types vt ON cars.vehicle_type_id = vt.vehicle_type_id
         INNER JOIN engine_types et ON cars.engine_type_id = et.engine_type_id;

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
