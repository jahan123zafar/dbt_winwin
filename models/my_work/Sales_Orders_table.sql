{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Sales_Orders

)

select  *
from source_data







