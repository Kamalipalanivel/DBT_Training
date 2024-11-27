
with raw_products as 
(    
    select * from {{source('SalesDataMart','products')}}
)
select * from raw_products