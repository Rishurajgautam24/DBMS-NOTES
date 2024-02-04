DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- Data Definition Language (DDL)
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE
-- RENAME


-- CREATE  
-- This statement is used to either create a schema, tables or an index.

-- CREATE SCHEMA
-- Syntax: CREATE SCHEMA schema_name;
-- Example:
CREATE SCHEMA teachers;

-- Example: DROP SCHEMA
DROP SCHEMA teachers;

-- The ‘CREATE TABLE’ Statement
-- Syntax:

/* 
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
); 
*/
-- EXAMPLE
CREATE TABLE TeachersInfo(
	TeacherID int,
	TeacherName varchar(255),
	Address varchar(255),
	City varchar(255),
	PostalCode int,
	Country varchar(255),
	Salary int
);

DROP TABLE TeachersInfo;


-- Create a database with default parameters
CREATE DATABASE sales;
DROP DATABASE sales;

-- Create table 
CREATE TABLE person (
	 person_id BIGINT NOT NULL,
	 last_name VARCHAR(255) NOT NULL,
	 first_name VARCHAR(255),
	 age INT NOT NULL
); 

DROP TABLE person;


-- Create Table using Keys
CREATE TABLE person (
	 person_id BIGINT NOT NULL,
	 last_name VARCHAR(255) NOT NULL,
	 first_name VARCHAR(255),
	 address VARCHAR(255),
	 city VARCHAR(255),
	 PRIMARY KEY (person_id)
);

-- Alternatively, you can place the PRIMARY KEY constraint directly in the column definition:
CREATE TABLE person (
 person_id BIGINT NOT NULL PRIMARY KEY,
 last_name VARCHAR(255) NOT NULL,
 first_name VARCHAR(255),
 address VARCHAR(255),
 city VARCHAR(255)
);


-- Create a table that references other table
CREATE TABLE agencies ( 
	 id SERIAL PRIMARY KEY,
	 NAME TEXT NOT NULL
)

CREATE TABLE users (
	 id SERIAL PRIMARY KEY,
	 agency_id INTEGER NOT NULL REFERENCES agencies(id) 
);


-- PostgreSQL ALTER TABLE

/*
To change the structure of an existing table, you use PostgreSQL ALTER TABLE statement.
The following illustrates the basic syntax of the ALTER TABLE statement:

ALTER TABLE table_name action;
*/


-- To add a new column to a table, you use ALTER TABLE ADD COLUMN statement:
-- ALTER TABLE table_name ADD COLUMN column_name datatype column_constraint;
DROP TABLE IF EXISTS links;

CREATE TABLE links (
   link_id serial PRIMARY KEY,
   title VARCHAR (512) NOT NULL,
   url VARCHAR (1024) NOT NULL
);


ALTER TABLE links ADD COLUMN active boolean;


-- To drop a column from a table, you use ALTER TABLE DROP COLUMN statement:
-- ALTER TABLE table_name DROP COLUMN column_name;

ALTER TABLE links DROP COLUMN active;

-- To rename a column, you use the ALTER TABLE RENAME COLUMN TO statement:
-- ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;

ALTER TABLE links RENAME COLUMN title TO link_title;

-- To change a default value of the column, you use ALTER TABLE ALTER COLUMN SET DEFAULT or  DROP DEFAULT:
-- ALTER TABLE table_name ALTER COLUMN column_name [SET DEFAULT value | DROP DEFAULT];
SELECT * FROM links;
ALTER TABLE links ADD COLUMN target VARCHAR(10);


ALTER TABLE links ALTER COLUMN target SET DEFAULT '_blank';

-- To rename a table you use ALTER TABLE RENAME TO statement:
-- ALTER TABLE table_name RENAME TO new_table_name;
ALTER TABLE links RENAME TO urls;



-- PostgreSQL TRUNCATE TABLE
/*
To remove all data from a table, you use the DELETE statement without a WHERE clause. 
However, when the table has numerous data, the DELETE statement is not efficient. 
In this case, you can use the TRUNCATE TABLE statement.

The TRUNCATE TABLE statement deletes all data from a table very fast. 
Here’s the basic syntax of the TRUNCATE TABLE statement:

TRUNCATE TABLE table_name;
*/

-- Remove all data from multiple tables
-- TRUNCATE TABLE table_name1, table_name2,...;

-- By default, the TRUNCATE TABLE statement does not remove any data from the table that has foreign key references.
-- TRUNCATE TABLE table_name CASCADE;

-- Examples 
-- create a new table called products:
CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0
);

SELECT * FROM products;

-- insert some rows into the products table:
INSERT INTO products (name, price) 
VALUES
    ('A', 19.99),
    ('B', 29.99),
    ('C', 39.99),
    ('D', 49.99)
RETURNING *;

-- Delete all data from the products table using the TRUNCATE TABLE statement:
TRUNCATE TABLE products;

--  TRUNCATE TABLE statement to delete all data from multiple tables
CREATE TABLE customers(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phone VARCHAR(25) NOT NULL
);

INSERT INTO customers (name, phone) VALUES
    ('John Doe', '123-456-7890'),
    ('Jane Smith', '987-654-3210'),
    ('Robert Johnson', '555-123-4567')

RETURNING *;

CREATE TABLE vendors(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phone VARCHAR(25) NOT NULL
);

INSERT INTO vendors (name, phone) VALUES
    ('ABC Electronics', '555-123-4567'),
    ('XYZ Supplies', '999-888-7777'),
    ('Tech Solutions Inc.', '111-222-3333')

RETURNING *;

TRUNCATE TABLE customers, vendors;

SELECT * FROM customers;
SELECT * FROM vendors;



-- TRUNCATE TABLE statement to delete data from a table referenced by a foreign key
CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY, 
  customer_name VARCHAR(255) NOT NULL, 
  ordered_date DATE NOT NULL, 
  status VARCHAR(20) NOT NULL
);

CREATE TABLE order_items (
  order_id INT NOT NULL, 
  item_id INT NOT NULL, 
  product_name VARCHAR(255) NOT NULL, 
  quantity INT NOT NULL, 
  FOREIGN KEY (order_id)
     REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE, 
  PRIMARY KEY (order_id, item_id)
);

INSERT INTO orders (customer_name, ordered_date, status) 
VALUES 
  ('John Doe', '2024-01-25', 'Processing'),
  ('Jane Smith', '2024-01-26', 'Shipped'),
  ('Bob Johnson', '2024-01-27', 'Delivered');
  
SELECT * FROM orders;

INSERT INTO order_items (order_id, item_id, product_name, quantity) 
VALUES 
  (1, 1, 'A', 2),
  (1, 2, 'B', 1),
  (2, 1, 'C', 3),
  (3, 1, 'D', 5),
  (3, 2, 'E', 2);
  
-- it will give me error because order_id 4 is not present in orders table  
INSERT INTO order_items (order_id, item_id, product_name, quantity) 
VALUES 
  (4, 1, 'A', 2);

  
SELECT * FROM order_items;
  
TRUNCATE TABLE orders;
TRUNCATE TABLE orders CASCADE;



-- ‘DROP SCHEMA’ Statement
-- The DROP SCHEMA statement is used to drop the complete schema.
-- DROP SCHEMA schema_name;

-- The ‘DROP TABLE’ Statement
-- DROP TABLE table_name;

DROP TABLE orders CASCADE;


