-- Customer Dimension
CREATE TABLE dim_customer (
    customer_id TEXT PRIMARY KEY,
    segment TEXT,
    city TEXT,
    postal_code TEXT,
    region TEXT,
    country TEXT
);

-- Product Dimension
CREATE TABLE dim_product (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    sub_category TEXT,
    segment TEXT
);

-- Date Dimension
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    order_date DATE,
    year INT,
    quarter INT,
    month INT,
    day INT
);

-- Order Mode Dimension
CREATE TABLE dim_order_mode (
    order_mode TEXT PRIMARY KEY
);

-- Location Dimension
CREATE TABLE dim_location (
    city TEXT,
    postal_code TEXT,
    region TEXT,
    country TEXT,
    PRIMARY KEY (city, postal_code)
);
