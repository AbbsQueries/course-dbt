{{ config(
    materialized="view") }}
SELECT 
     p.address_guid
    ,p.order_created_at_utc
    ,p.DELIVERED_AT
    ,p.ESTIMATED_DELIVERY_AT
    ,p.ORDER_COST
    ,p.order_guid
    ,p.ORDER_TOTAL
    ,p.promo_guid
    ,p.SHIPPING_COST
    ,p.SHIPPING_SERVICE
    ,p.STATUS
    ,p.tracking_guid  
    ,p.user_guid 
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
FROM {{ ref('_int_ordered_promos') }} p
LEFT JOIN {{ref('_int_users') }} u using(user_guid)
