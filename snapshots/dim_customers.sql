{% snapshot dim_customers %}
{{ config(
    target_schema='STAGE',
    unique_key='customer_id',
    strategy='check',
    check_cols=['first_name','last_name','email','address','phone']
)
 }}
 with dim_customers as (
SELECT distinct *,
    current_timestamp as created_data_timestamp
FROM
    {{ ref('raw_customers') }}
 )
 select * from dim_customers
{% endsnapshot %}