
SELECT 
    COUNT(*) AS new_customers
FROM 
    {{ref('dim_customers')}}
WHERE 
    CREATED_DATA_TIMESTAMP BETWEEN '2024-01-01' AND '2024-12-31' 
