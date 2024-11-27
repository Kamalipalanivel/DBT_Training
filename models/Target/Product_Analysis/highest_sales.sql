SELECT 
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    SUM(s.QUANTITY_SOLD) AS TOTAL_SALES,
   
FROM 
    {{ref('dim_products')}} p
JOIN 
    {{ref('fct_sales')}} s
    ON p.PRODUCT_ID = s.PRODUCT_ID
GROUP BY 
    p.PRODUCT_ID, p.PRODUCT_NAME

