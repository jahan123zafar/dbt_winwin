{{ config(materialized='table') }}

with Regions as (

    SELECT * FROM interview-task-winwinproptech.winwin_db.Regions

)

select *
from Regions