with raw_customers as
(
    select * from {{source('SalesDataMart','customers')}}
)
select * from raw_customers