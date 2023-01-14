{{ config(materialized='table') }}

with sales_order as (

    SELECT OrderNumber, Customer_Name_Index, orderdate, Order_Quantity,Line_Total, Total_Unit_Cost*Order_Quantity as total_cost  FROM interview-task-winwinproptech.winwin_db.Sales_Orders

)

SELECT CONCAT(ROUND((Daily_Profit/total_cost)*100,2), "%") as Percentage_profit, ROUND(Daily_Profit,2) as Daily_Profit,
ROUND(total_cost,2) as total_cost, cnt_distinct_customers,  orderdate
FROM(
select SUM(Order_Quantity) as Order_Quantity, SUM(Line_Total-total_cost) as Daily_Profit, SUM(Line_Total) as Line_Total,
SUM(total_cost) as total_cost, count(distinct Customer_Name_Index) as cnt_distinct_customers, Orderdate 
from sales_order
GROUP BY orderdate
)p
ORDER BY orderdate