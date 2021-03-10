CREATE DATABASE groceryshopsdb
    WITH OWNER postgres;

DROP DATABASE groceryshopsdb;

---------------------------------------
SELECT *
FROM employees;

SELECT *
FROM suppliers;

SELECT *
FROM soldproduct;

SELECT *
FROM boughtproduct;

SELECT *
FROM products;

SELECT *
FROM groceries;

SELECT *
FROM grocerieshistory;

SELECT *
FROM employees
         INNER JOIN groceries g ON employees.groceryid = g.id
ORDER BY g.id;

SELECT salary
FROM employees;

---------------------------------------

DELETE
FROM suppliers;

DELETE
FROM employees;

DELETE
FROM historicalproducts;

DELETE
FROM products;

DELETE
FROM groceries;

---------------------------------------
