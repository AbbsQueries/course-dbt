{{
  config(
    materialized='view'
  )
}}
  select 
    p.PRODUCT_ID AS product_guid
   ,p.INVENTORY
   ,p.NAME
    ,p.PRICE
    ,o.quantity
   ,orders.order_id AS order_guid
   ,orders.user_id AS user_guid
   ,orders.created_at AS order_created_at_utc
   ,p.price*o.quantity  AS total_price_per_product
from  {{ source ('postgres_sources', 'products') }} p
join {{ source ('postgres_sources', 'order_items') }} o using(product_id)
join {{ source ('postgres_sources', 'orders')}} orders using (order_id)
