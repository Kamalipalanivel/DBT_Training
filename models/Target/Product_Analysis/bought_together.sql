SELECT 
    p1.PRODUCT_ID AS PRODUCT_1,
    p1.PRODUCT_NAME AS PRODUCT_1_NAME,
    p2.PRODUCT_ID AS PRODUCT_2,
    p2.PRODUCT_NAME AS PRODUCT_2_NAME,
    p1.CATEGORY
FROM 
    {{ref('dim_products')}} p1
JOIN 
    {{ref('dim_products')}} p2
    ON p1.CATEGORY = p2.CATEGORY
WHERE 
    p1.PRODUCT_ID != p2.PRODUCT_ID
ORDER BY 
    p1.CATEGORY
