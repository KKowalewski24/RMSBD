SELECT xml_data
FROM car_showroom_single_row;

SELECT xpath('car_showroom/brands/brand/text()', xml_data)
FROM car_showroom_single_row;

SELECT xpath('car_showroom/vehicle_types/vehicle_type/text()', xml_data)
FROM car_showroom_single_row;

SELECT xpath('car_showroom/engine_types/engine_type/text()', xml_data)
FROM car_showroom_single_row;

SELECT xpath('car_showroom/cars/car/model/text()', xml_data)
FROM car_showroom_single_row;
