{{
  config(
    materialized='view'
  )
}}
SELECT
    address_guid
    ,order_created_at_utc
    ,DELIVERED_AT
    ,ESTIMATED_DELIVERY_AT
    ,ORDER_COST
    ,order_guid
    ,ORDER_TOTAL
    ,promo_guid
    ,SHIPPING_COST
    ,SHIPPING_SERVICE
    ,STATUS
    ,tracking_guid  
    ,user_guid 
    ,p.discount
FROM {{ ref('_stg_orders_models') }} 
LEFT JOIN {{ ref('_stg_promos_models') }} p using(promo_guid)


