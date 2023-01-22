{{ config(
    materialized="view") }}
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
    ,p.status as promo_status
    ,u.user_created_at_utc
    ,u.EMAIL
    ,u.FIRST_NAME
    ,u.LAST_NAME
    ,u.PHONE_NUMBER
    ,u.UPDATED_AT
    ,u.address
    ,u.zipcode
    ,u.state
    ,u.country
FROM {{ ref('_stg_orders_models') }} 
LEFT JOIN {{ ref('_stg_promos_models') }} p using(promo_guid)
LEFT JOIN {{ref('_int_users') }} u using(user_guid)
