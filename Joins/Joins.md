# DBMS JOINS NOTES

## Introduction
 PostgreSQL JOIN statements offer a powerful way to combine data from multiple tables based on shared columns. This enables you to retrieve and analyze diverse information across your database schema. This document explores the fundamental JOIN types in PostgreSQL, along with some special cases.

Basic JOIN Types
# 1. Inner Join:

- Combines rows with matching values in both tables.
- Only returns rows where a join condition is met.
- Ideal for retrieving related data where a one-to-one or one-to-many relationship exists.
### Example
```sql
CREATE TABLE Customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES Customers(customer_id) NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO Customers (name, email) VALUES
  ('John Doe', 'john.doe@example.com'),
  ('Jane Smith', 'jane.smith@example.com'),
  ('Mike Jones', 'mike.jones@example.com');

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
  (1, '2024-01-10', 50.00),
  (1, '2024-02-05', 25.00),
  (2, '2024-01-20', 75.00),
  (3, '2024-02-08', 100.00);
```
#### Customer Table
![alt text](img/customer.png)


#### Orders Table

![alt text](img/order.png)
```sql
SELECT *
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
```

#### After inner Join
![alt text](img/innerjoin.png)



