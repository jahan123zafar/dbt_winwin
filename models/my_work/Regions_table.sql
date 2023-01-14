{{ config(materialized='table') }}

with source_data as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Regions

)

select  *
from source_data







