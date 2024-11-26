{{ config(
    
    materialized='incremental',
    incremental_strategy='merge',
    transient= false,
    merge_exclude_columns = ['created_data_timestamp']
) }}
with fct_sales as (
select distinct *,
current_timestamp as created_data_timestamp,
current_timestamp as updated_data_timestamp
from {{ ref('raw_sales')}}
)
select * from fct_sales