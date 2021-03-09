CREATE DATABASE groceryshopsdb
    WITH OWNER postgres;

CREATE TABLE IF NOT EXISTS employees (
    id        INTEGER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT pk_employees
            PRIMARY KEY,
    firstname TEXT,
    lastname  TEXT,
    salary    NUMERIC NOT NULL
);

ALTER TABLE employees
    OWNER TO postgres;

CREATE TABLE IF NOT EXISTS suppliers (
    id                 INTEGER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT pk_suppliers
            PRIMARY KEY,
    name               TEXT,
    grossvehicleweight REAL NOT NULL,
    employeeid         INTEGER
        CONSTRAINT fk_suppliers_employees_employeeid
            REFERENCES employees
            ON DELETE RESTRICT
);

ALTER TABLE suppliers
    OWNER TO postgres;

CREATE INDEX IF NOT EXISTS ix_suppliers_employeeid
    ON suppliers (employeeid);

CREATE TABLE IF NOT EXISTS groceries (
    id         INTEGER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT pk_groceries
            PRIMARY KEY,
    address    TEXT,
    supplierid INTEGER
        CONSTRAINT fk_groceries_suppliers_supplierid
            REFERENCES suppliers
            ON DELETE RESTRICT
);

ALTER TABLE groceries
    OWNER TO postgres;

CREATE INDEX IF NOT EXISTS ix_groceries_supplierid
    ON groceries (supplierid);

CREATE TABLE IF NOT EXISTS historicalproducts (
    id              INTEGER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT pk_historicalproducts
            PRIMARY KEY,
    name            TEXT,
    amount          REAL      NOT NULL,
    price           NUMERIC   NOT NULL,
    transactiondate TIMESTAMP NOT NULL,
    groceryid       INTEGER
        CONSTRAINT fk_historicalproducts_groceries_groceryid
            REFERENCES groceries
            ON DELETE RESTRICT,
    supplierid      INTEGER
        CONSTRAINT fk_historicalproducts_suppliers_supplierid
            REFERENCES suppliers
            ON DELETE RESTRICT
);

ALTER TABLE historicalproducts
    OWNER TO postgres;

CREATE INDEX IF NOT EXISTS ix_historicalproducts_groceryid
    ON historicalproducts (groceryid);

CREATE INDEX IF NOT EXISTS ix_historicalproducts_supplierid
    ON historicalproducts (supplierid);

CREATE TABLE IF NOT EXISTS products (
    id         INTEGER GENERATED BY DEFAULT AS IDENTITY
        CONSTRAINT pk_products
            PRIMARY KEY,
    name       TEXT,
    amount     REAL NOT NULL,
    groceryid  INTEGER
        CONSTRAINT fk_products_groceries_groceryid
            REFERENCES groceries
            ON DELETE RESTRICT,
    supplierid INTEGER
        CONSTRAINT fk_products_suppliers_supplierid
            REFERENCES suppliers
            ON DELETE RESTRICT
);

ALTER TABLE products
    OWNER TO postgres;

CREATE INDEX IF NOT EXISTS ix_products_groceryid
    ON products (groceryid);

CREATE INDEX IF NOT EXISTS ix_products_supplierid
    ON products (supplierid);
