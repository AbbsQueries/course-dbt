{{
  config(
    materialized='view'
  )
}}
  select 
    p.PRODUCT_guid AS product_guid
    ,status
   ,p.INVENTORY
   ,p.NAME
  ,p.PRICE
  ,o.quantity
   ,orders.order_guid AS order_guid
   ,orders.user_guid AS user_guid
   ,orders.order_created_at_utc AS order_created_at_utc
   ,p.price*o.quantity  AS total_price_per_product
from  {{ ref('_stg_products_models') }} p
join {{ ref('_stg_order_items_models') }} o using(product_guid)
join {{ ref ('_stg_orders_models')}} orders using (order_guid)
