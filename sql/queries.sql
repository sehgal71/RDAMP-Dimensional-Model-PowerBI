--- Top 10 Customers by Total Profit
SELECT 
    dc.customer_id,
    dc.segment,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_customer dc ON fs.customer_key = dc.customer_key
GROUP BY dc.customer_id, dc.segment
ORDER BY total_profit DESC
LIMIT 10;

--- Monthly Sales Trend by Product Category
SELECT
    dd.year,
    dd.month,
    dp.category,
    SUM(fs.total_sales) AS total_sales
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
JOIN dim_product dp ON fs.product_key = dp.product_key
GROUP BY dd.year, dd.month, dp.category
ORDER BY dd.year, dd.month, dp.category;

--- Average Order Value and Profit by Order Mode
SELECT
    dom.order_mode,
    AVG(fs.total_sales) AS avg_order_value,
    AVG(fs.profit) AS avg_profit
FROM fact_sales fs
JOIN dim_order_mode dom ON fs.order_mode_key = dom.order_mode_key
GROUP BY dom.order_mode;

--- Regional Category Profit Margins
SELECT
    dl.region,
    dp.category,
    ROUND(SUM(fs.profit) / NULLIF(SUM(fs.total_sales), 0), 4) AS profit_margin
FROM fact_sales fs
JOIN dim_location dl ON fs.location_key = dl.location_key
JOIN dim_product dp ON fs.product_key = dp.product_key
GROUP BY dl.region, dp.category
ORDER BY dl.region, profit_margin DESC;

--- Customer Segment Purchase Frequency & Average Quantity
SELECT
    dc.segment,
    COUNT(DISTINCT fs.order_id) AS purchase_frequency,
    AVG(fs.quantity) AS avg_quantity_per_order
FROM fact_sales fs
JOIN dim_customer dc ON fs.customer_key = dc.customer_key
GROUP BY dc.segment;
