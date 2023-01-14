{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Regions
    LEFT JOIN(
        SELECT Delivery_Region_Index as Index, Order_Quantity, Line_total, Customer_Name_Index, OrderDate
        FROM interview-task-winwinproptech.winwin_db.Sales_Orders
    )l 
    USING(Index)

)

select  Index as region_Index, City, Territory, ROUND(SUM(Line_total),2) as total_sold, count(distinct Customer_Name_Index) as cnt_distinct_customers
from source_data
GROUP BY region_Index, City, Territory
ORDER BY total_sold DESC