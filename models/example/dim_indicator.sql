{{ config(materialized="table") }}

select *
from {{ source("staging", "dim_indicator_stg") }}
