# 🧠 SQL Analytics Portfolio – Sales Data Analysis

This repository contains SQL scripts designed for analyzing structured sales data using **BigQuery Standard SQL**. The queries demonstrate practical, real-world scenarios that mirror what analysts or data engineers might perform at S&P 500-level companies.

The data used is assumed to come from two main tables:
- `sales_data`: contains transactional sales records
- `sales_reps`: contains information about sales representatives

## 📊 Query Overviews

1. total_sales_by_region_product
**Purpose**: Calculate total sales and average order value across regions and products, broken down by month and year.

**Key Techniques Used**:
- `GROUP BY` with `EXTRACT()` for time-based grouping
- Aggregates: `SUM()` and `AVG()`
- Clean chronological sorting

2. sales_by_rep
Purpose: Join sales data with representative metadata to report total sales per rep per region.
Key Techniques Used:
SQL JOIN between sales_data and sales_reps
GROUP BY + SUM() for regional performance summary

3. rank_top_products_by_region
Purpose: Rank top-performing products by region for each month using RANK() window function.
Key Techniques Used:
WITH clause (Common Table Expression)
RANK() as a window function with PARTITION BY
Monthly sales aggregation before ranking
