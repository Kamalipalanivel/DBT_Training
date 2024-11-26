{{ config(
    schema=generate_schema_name('RAW',node)
) }}
with raw_products as 
(    
    {{src_product_json()}}
)
select * from raw_products