SELECT 
    SUM(sales_amount) AS total_sales
FROM 
    {{ref('fct_sales')}}
WHERE 
    date BETWEEN '2024-01-01' AND '2024-12-31'


