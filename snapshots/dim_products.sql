{% snapshot dim_products %}
{{ config(
    target_schema='STAGE',
    unique_key='product_id',
    strategy='check',
    check_cols=['product_name','category','manufacturer','description','price']
)
 }}
 with dim_products as (
SELECT distinct *,
    current_timestamp as created_data_timestamp
FROM
    {{ ref('raw_products') }}
 )
 select * from dim_products
{% endsnapshot %}