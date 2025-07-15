-- View 1: Product Seasonality
CREATE OR REPLACE VIEW vw_product_seasonality AS
SELECT
    dd.year,
    dd.month,
    dp.product_name,
    SUM(fs.quantity) AS total_units_sold,
    SUM(fs.total_sales) AS total_sales
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dd.year, dd.month, dp.product_name
ORDER BY dd.year, dd.month, dp.product_name;

-- View 2: Discount Impact Analysis
CREATE OR REPLACE VIEW vw_discount_impact_analysis AS
SELECT
    ROUND(fs.discount_amount, 2) AS discount_amt,
    COUNT(*) AS orders_count,
    AVG(fs.discount_amount) AS avg_discount,
    SUM(fs.total_sales) AS total_sales,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
GROUP BY ROUND(fs.discount_amount, 2)
ORDER BY discount_amt;

-- View 3: Customer Order Patterns
CREATE OR REPLACE VIEW vw_customer_order_patterns AS
SELECT
    dc.segment,
    dc.customer_id,
    COUNT(fs.order_id) AS order_count,
    ROUND(AVG(fs.total_sales), 2) AS avg_order_value,
    SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_customer dc ON fs.customer_id = dc.customer_id
GROUP BY dc.segment, dc.customer_id
ORDER BY dc.segment, total_profit DESC;

-- View 4: Channel Margin Report
CREATE OR REPLACE VIEW vw_channel_margin_report AS
SELECT
    dom.order_mode,
    SUM(fs.total_sales) AS total_sales,
    SUM(fs.profit) AS total_profit,
    ROUND(SUM(fs.profit) / NULLIF(SUM(fs.total_sales), 0) * 100, 2) AS profit_margin_pct,
    COUNT(DISTINCT fs.order_id) AS order_count
FROM fact_sales fs
JOIN dim_order_mode dom ON fs.order_mode = dom.order_mode
GROUP BY dom.order_mode
ORDER BY dom.order_mode;

-- View 5: Region Category Rankings
CREATE OR REPLACE VIEW vw_region_category_rankings AS
SELECT
    dl.region,
    dp.category,
    SUM(fs.profit) AS total_profit,
    RANK() OVER (
        PARTITION BY dl.region
        ORDER BY SUM(fs.profit) DESC
    ) AS category_rank
FROM fact_sales fs
JOIN dim_location dl ON fs.city = dl.city AND fs.postal_code = dl.postal_code
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dl.region, dp.category
ORDER BY dl.region, category_rank;
