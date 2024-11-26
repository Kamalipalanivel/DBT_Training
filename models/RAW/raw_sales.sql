with raw_sales as
(
    select * from {{source('SalesDataMart','sales')}}
)
select * from raw_sales