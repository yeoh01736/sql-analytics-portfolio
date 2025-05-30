#total sales per region & product

select region, product,
  extract (year from date) as year,
  extract (month from date) as month,
  sum (quantity * price_usd) as total_sales,
  avg (quantity * price_usd) as avg_order_value
from `sales-sql-lab.raw_data.sales_data`
group by region, product, year, month
order by region, product, year, month;

#SQL Join - sales by rep name

select r.rep_name, d.region,
 sum(d.quantity * d.price_usd) as total_sales
from `sales-sql-lab.raw_data.sales_data` as d 
join `sales-sql-lab.raw_data.sales_reps` as r
on d.rep_id = r.rep_id
group by r.rep_name, d.region
order by d.region, total_sales desc;

#rank top-performing reps or products (rank(), dense_rank())
#compare current vs previous month sales (lag(), lead())
#running totals or moving averages (sum() over(...))
with sales_aggregated as (
  select region, product,
    extract (month from date) as month,
    sum (quantity*price_usd) as total_sales
  from sales-sql-lab.raw_data.sales_data
  group by region, product, extract(month from date)
),

sales_ranked as (
  select *,
    rank() over (
      partition by region, month 
      order by total_sales desc
    ) as rank
  from sales_aggregated
)
select * from sales_ranked;