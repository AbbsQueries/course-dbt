{{
  config(
    materialized='view'
  )
}}
SELECT
  product_guid,
  COUNT (DISTINCT session_guid) AS session_count,
  COUNT (DISTINCT o.order_guid) AS order_count,
  ( COUNT (DISTINCT o.order_guid) / COUNT (DISTINCT session_guid) )AS product_conversion_rate
FROM {{ ref('_int_product_page_views') }} 
join {{ ref('_int_product_inventory') }} o using(product_guid)
GROUP BY product_guid

