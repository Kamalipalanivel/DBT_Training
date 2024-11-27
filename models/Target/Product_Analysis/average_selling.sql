SELECT 
    CATEGORY,
    AVG(PRICE) AS AVERAGE_PRICE
FROM 
    {{ref('dim_products')}}
GROUP BY 
    CATEGORY
