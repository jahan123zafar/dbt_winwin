{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Products
    LEFT JOIN(
        SELECT Product_Description_Index as Index, Order_Quantity, Line_total, OrderDate
        FROM interview-task-winwinproptech.winwin_db.Sales_Orders
    )l 
    USING(Index)

)

select  Index, Product_Name, ROUND(SUM(Line_total),2) as total_sold, SUM(Order_Quantity) as Quantity_sold
from source_data
GROUP BY Index, Product_Name







