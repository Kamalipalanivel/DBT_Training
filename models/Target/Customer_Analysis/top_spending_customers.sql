SELECT 
    CUSTOMER_ID,
    SUM(SALES_AMOUNT) AS total_spending,
    PRODUCT_ID,
    COUNT(PRODUCT_ID) AS purchase_frequency
FROM 
    {{ref('fct_sales')}}
GROUP BY 
    CUSTOMER_ID, PRODUCT_ID
ORDER BY 
    total_spending DESC, purchase_frequency DESC
FETCH FIRST 10 ROWS ONLY