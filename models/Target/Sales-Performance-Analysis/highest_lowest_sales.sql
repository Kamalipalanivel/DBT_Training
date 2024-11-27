WITH product_sales AS (
    SELECT 
        product_id, 
        SUM(sales_amount) AS total_sales
    FROM 
        {{ref('fct_sales')}}
    GROUP BY 
        product_id
)
SELECT 
    product_id,
    total_sales,
    'Highest' AS sales_type
FROM 
    product_sales
WHERE 
    total_sales = (SELECT MAX(total_sales) FROM product_sales)  -- Highest sales
UNION ALL
SELECT 
    product_id,
    total_sales,
    'Lowest' AS sales_type
FROM 
    product_sales
WHERE 
    total_sales = (SELECT MIN(total_sales) FROM product_sales)  -- Lowest sales
ORDER BY 
    sales_type DESC  -- Optional: sorts by Highest/Lowest
