# Ace Superstore Reporting System

---

## Overview

This project implements a **star schema** data model and creates SQL views to enable advanced, interactive dashboards in Power BI for Ace Superstore. The goal is to transform cleaned transactional data into an enterprise-grade reporting layer optimized for fast, flexible analysis.

### Dimensional Model Diagram

<img width="670" height="605" alt="schema_diagram" src="https://github.com/user-attachments/assets/8c5632ed-ce94-4980-817b-581567a884df" />


*The above diagram shows the fact table `fact_sales` at the center, linked to multiple dimension tables.*

---

## Dimensional Schema Details

### Fact Sales
  - Keys: `city`, `customer_id`, `date_key`, `order_id`, `order_mode`, `postal_code`, `product_id`
  - Measures: `total_sales `, `total_cost `, `profit `, `quantity `, `discount_amount`

### Dimension Tables

- **dim_customer** — customer details for segmentation and demographics  
- **dim_product** — product attributes such as name, category, and segment  
- **dim_location** — geographic information for regional and store-level analysis  
- **dim_date** — calendar details including order date, year, month, and quarter  
- **dim_order_mode** — order channels like online or in-store  

---

## SQL
Create SQL views for reporting insights:
   - `vw_product_seasonality`
   - `vw_discount_impact_analysis`
   - `vw_customer_order_patterns`
   - `vw_channel_margin_report`
   - `vw_region_category_rankings`

---

## Power BI Dashboard Features

| Dashboard Section                 | Visualization Type           | Description                              |
|---------------------------------|-----------------------------|------------------------------------------|
| Product Seasonality Trends       | Matrix Heatmap              | Product sales trends over time           |
| Discount vs. Profit Analysis     | Scatter Plot  | Impact of discounts on profit            |
| Average Order Value by Channel & Segment | Clustered Bar Chart          | Order values across channels and segments|
| Top 10 Customers by Profit       | Horizontal Bar Chart        | Highest profit-contributing customers    |
| Category Ranking by Region       | Stcaked Column Chart         | Product category rankings by region      |

---

## Reusable SQL Queries 


---

## Screenshots

### Dashboard
<img width="1151" height="647" alt="Dashboard" src="https://github.com/user-attachments/assets/eb0169b6-1d63-46be-b437-709ad14be0e2" />


### Product Seasonality Trend
<img width="260" height="323" alt="Product Seasonality Trends" src="https://github.com/user-attachments/assets/afa3de94-3e4b-4242-8312-81c1ab952ab4" />

### Discount vs Profit
<img width="576" height="322" alt="Discount vs Profit" src="https://github.com/user-attachments/assets/4ea7157c-44e1-4e97-a064-e644bae47894" />

### Average Order Value
<img width="574" height="320" alt="Average Order Value" src="https://github.com/user-attachments/assets/c1b936d1-2f89-47cf-93cc-77faef77b8a1" />

### Top 10 Customers
<img width="572" height="326" alt="Top 10 Customers" src="https://github.com/user-attachments/assets/e2f1e7ec-3fed-4f5e-83cc-e73ba7141a94" />

### Regional Category Ranking
<img width="1148" height="642" alt="Regional Category Ranking" src="https://github.com/user-attachments/assets/1c605faf-5f31-4d07-b0e2-f59f881f2fac" />
