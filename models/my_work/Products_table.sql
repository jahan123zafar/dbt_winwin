{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Products

)

select  *
from source_data







