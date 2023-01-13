{{ config(materialized='table') }}

with sales_order as (

    SELECT OrderNumber,  orderdate, Order_Quantity,Line_Total, Total_Unit_Cost*Order_Quantity as total_cost  FROM interview-task-winwinproptech.winwin_db.Sales_Orders

)

SELECT CONCAT((Daily_Profit/total_cost)*100, "%") as Percentage_profit, Daily_Profit, total_cost, orderdate
FROM(
select SUM(Order_Quantity) as Order_Quantity, SUM(Line_Total-total_cost) as Daily_Profit, SUM(Line_Total) as Line_Total,
SUM(total_cost) as total_cost, Orderdate 
from sales_order
GROUP BY orderdate
)p
ORDER BY orderdate