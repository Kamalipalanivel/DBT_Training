--{% set natural_key=dbt_utils.generate_surrogate_key('store_id') %}
{{ config(
    
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='store_id',
    transient= false,
    merge_exclude_columns = ['created_data_timestamp']
) }}
with dim_stores as (
select distinct *,
current_timestamp as created_data_timestamp,
current_timestamp as updated_data_timestamp
from {{ ref('raw_stores')}}
)
select * from dim_stores
