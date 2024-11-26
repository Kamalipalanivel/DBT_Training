{% macro src_product_json() %}
SELECT
    f.value:product_id::int AS product_id,
    f.value:product_name::varchar AS product_name,
    f.value:category::varchar AS category,
    f.value:manufacturer::varchar AS manufacturer,
    f.value:description::text AS description,
    CASE WHEN f.value:price::string = '' THEN NULL ELSE f.value:price::number(10,2) END AS price
FROM {{source('SalesDataMart','product_json')}},TABLE(FLATTEN(input => json_file)) f
{% endmacro %}