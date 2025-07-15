--- Populating Dimension Tables

INSERT INTO dim_customer (customer_id, segment, city, postal_code, region, country)
SELECT DISTINCT ON (customer_id)
    TRIM(customer_id),
    TRIM(segment),
    TRIM(city),
    TRIM(postal_code),
    TRIM(region),
    TRIM(country)
FROM sales_data
WHERE customer_id IS NOT NULL;


INSERT INTO dim_product (product_id, product_name, category, sub_category, segment)
SELECT DISTINCT
    TRIM(product_id),
    TRIM(product_name),
    TRIM(category),
    TRIM(sub_category),
	TRIM(segment)
FROM sales_data
WHERE product_id IS NOT NULL;

INSERT INTO dim_date (date_key, order_date, year, quarter, month, day)
SELECT DISTINCT
    CAST(TO_CHAR(order_date, 'YYYYMMDD') AS INT),
    order_date::DATE,
    EXTRACT(YEAR FROM order_date)::INT,
    EXTRACT(QUARTER FROM order_date)::INT,
    EXTRACT(MONTH FROM order_date)::INT,
    EXTRACT(DAY FROM order_date)::INT
FROM sales_data
WHERE order_date IS NOT NULL;