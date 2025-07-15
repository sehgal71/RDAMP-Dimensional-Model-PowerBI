CREATE TABLE fact_sales (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    product_id TEXT,
    date_key INT,
    order_mode TEXT,
    city TEXT,
    postal_code TEXT,
    total_sales NUMERIC,
    total_cost NUMERIC,
    profit NUMERIC,
    discount_amount NUMERIC,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (order_mode) REFERENCES dim_order_mode(order_mode),
    FOREIGN KEY (city, postal_code) REFERENCES dim_location(city, postal_code)
);

INSERT INTO fact_sales (
    order_id,
    customer_id,
    product_id,
    date_key,
    order_mode,
    city,
    postal_code,
    total_sales,
    total_cost,
    profit,
    discount_amount,
    quantity
)
SELECT
    s.order_id,
    TRIM(s.customer_id),
    TRIM(s.product_id),
    CAST(TO_CHAR(s.order_date, 'YYYYMMDD') AS INT),
    TRIM(s.order_mode),
    TRIM(s.city),
    TRIM(s.postal_code),
    s.total_sales,
    s.total_cost_price,
    s.net_profit,
    s.discount,
    s.quantity
FROM sales_data s
WHERE s.order_id IS NOT NULL;
