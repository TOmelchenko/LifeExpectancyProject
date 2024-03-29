{{ config(materialized="table") }}

select *
from {{ source("staging", "dim_country_stg") }}

