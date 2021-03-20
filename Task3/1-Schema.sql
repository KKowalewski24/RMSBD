CREATE TABLE IF NOT EXISTS car_showroom_single_column (
    id       INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    xml_data XML NOT NULL
);

ALTER TABLE car_showroom_single_column
    OWNER TO postgres;

-- TABLES - WITH SPECIFIC COLUMNS
CREATE SCHEMA IF NOT EXISTS xml_mapping;

CREATE TABLE IF NOT EXISTS xml_mapping.brands (
    brand_id   TEXT PRIMARY KEY,
    brand_name TEXT NOT NULL
);

ALTER TABLE xml_mapping.brands
    OWNER TO postgres;


CREATE TABLE IF NOT EXISTS xml_mapping.vehicle_types (
    vehicle_type_id   TEXT PRIMARY KEY,
    vehicle_type_name TEXT NOT NULL
);

ALTER TABLE xml_mapping.vehicle_types
    OWNER TO postgres;


CREATE TABLE IF NOT EXISTS xml_mapping.engine_types (
    engine_type_id   TEXT PRIMARY KEY,
    engine_type_name TEXT NOT NULL
);

ALTER TABLE xml_mapping.engine_types
    OWNER TO postgres;


CREATE TABLE IF NOT EXISTS xml_mapping.cars (
    car_id          TEXT PRIMARY KEY,
    brand_id        TEXT  NOT NULL,
    vehicle_type_id TEXT  NOT NULL,
    engine_type_id  TEXT  NOT NULL,
    model           TEXT  NOT NULL,
    production_year INT   NOT NULL,
    price           FLOAT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES xml_mapping.brands (brand_id),
    FOREIGN KEY (vehicle_type_id) REFERENCES xml_mapping.vehicle_types (vehicle_type_id),
    FOREIGN KEY (engine_type_id) REFERENCES xml_mapping.engine_types (engine_type_id)

);

ALTER TABLE xml_mapping.cars
    OWNER TO postgres;
