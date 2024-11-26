with raw_stores as
(
    select * from {{source('SalesDataMart','stores')}}
)
select * from raw_stores