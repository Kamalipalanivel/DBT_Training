WITH yoy_comparison AS (
  
    SELECT 
        EXTRACT(YEAR FROM date) AS year,
        SUM(sales_amount) AS total_sales
    FROM 
        {{ref('fct_sales')}}
    WHERE 
        date BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY 
        year
),
qoq_comparison AS (
    
    SELECT 
        EXTRACT(QUARTER FROM date) AS quarter,
        EXTRACT(YEAR FROM date) AS year,
        SUM(sales_amount) AS total_sales
    FROM 
        {{ref('fct_sales')}}
    WHERE 
        date BETWEEN '2023-10-01' AND '2024-03-31'
    GROUP BY 
        year, quarter
)

SELECT 
    'YoY' AS comparison_type, 
    year, 
    NULL AS quarter, 
    total_sales
FROM yoy_comparison

UNION ALL

SELECT 
    'QoQ' AS comparison_type, 
    year, 
    quarter, 
    total_sales
FROM qoq_comparison
ORDER BY comparison_type DESC, year DESC, quarter DESC