{{ config(
    materialized="table") }}

  SELECT
    prod_pv.product_guid
    ,prod_inv.order_created_at_utc 
    ,prod_inv.NAME
    ,prod_inv.total_price_per_product
    ,prod_inv.order_guid
    ,prod_inv.quantity
   ,prod_pv.event_timestamp_utc
   ,prod_pv.event_type
   ,prod_pv.user_guid
   ,prod_pv.page_url
FROM  {{ ref('_int_product_inventory') }} prod_inv
JOIN {{ ref('_int_product_page_views')}} prod_pv 

