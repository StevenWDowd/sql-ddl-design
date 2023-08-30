CREATE DATABASE bike_shop


CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    id_code VARCHAR(10) PRIMARY KEY,
    model TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
)

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER NOT NULL REFERENCES customers
)

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY
    current_price NUMERIC(10, 2) NOT NULL,
    order_id INTEGER NOT NULL REFERENCES orders,
    bike_id VARCHAR(10) NOT NULL REFERENCES bikes,
    note TEXT
)