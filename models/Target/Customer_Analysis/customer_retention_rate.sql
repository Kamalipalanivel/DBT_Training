-- Customer Retention Rate
WITH first_quarter_customers AS (
    SELECT DISTINCT CUSTOMER_ID
    FROM {{ref('fct_sales')}}
    WHERE DATE BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-03-31', 'YYYY-MM-DD')
),
second_quarter_customers AS (
    SELECT DISTINCT CUSTOMER_ID
    FROM {{ref('fct_sales')}}
    WHERE DATE BETWEEN TO_DATE('2024-04-01', 'YYYY-MM-DD') AND TO_DATE('2024-06-30', 'YYYY-MM-DD')
)
SELECT 
    COUNT(DISTINCT fqc.CUSTOMER_ID) AS retained_customers,
    COUNT(DISTINCT fq.CUSTOMER_ID) AS total_first_quarter_customers,
    (COUNT(DISTINCT fqc.CUSTOMER_ID) * 100.0) / COUNT(DISTINCT fq.CUSTOMER_ID) AS retention_rate_percentage
FROM 
    first_quarter_customers fq
LEFT JOIN 
    second_quarter_customers fqc ON fq.CUSTOMER_ID = fqc.CUSTOMER_ID
