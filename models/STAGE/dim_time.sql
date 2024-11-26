{{ config(
    
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='date',
    transient= false,
    merge_exclude_columns = ['created_data_timestamp']
) }}
with dim_time as
(
    select distinct *
    ,current_timestamp as created_data_timestamp
    ,current_timestamp as updated_data_timestamp
    from {{source('SalesDataMart','time')}}
)
select * from dim_time