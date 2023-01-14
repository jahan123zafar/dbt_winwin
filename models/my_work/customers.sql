{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Customers
    LEFT JOIN(
        SELECT Customer_Name_Index as Customer_Index, Line_total, OrderDate
        FROM interview-task-winwinproptech.winwin_db.Sales_Orders
    )l 
    USING(Customer_Index)

)

select  Customer_Index, Customer_Names, ROUND(SUM(Line_total),2) as total_purchased, MAX(OrderDate) as latest_order_date
from source_data
GROUP BY Customer_Index, Customer_Names
ORDER BY total_purchased DESC







