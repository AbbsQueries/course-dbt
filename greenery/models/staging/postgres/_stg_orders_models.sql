
{{ config(
    materialized="view") }}
SELECT 
     ADDRESS_ID AS address_guid
    ,CREATED_AT
    ,DELIVERED_AT
    ,ESTIMATED_DELIVERY_AT
    ,ORDER_COST
    ,ORDER_ID AS order_guid
    ,ORDER_TOTAL
    ,PROMO_ID
    ,SHIPPING_COST
    ,SHIPPING_SERVICE
    ,STATUS
    ,TRACKING_ID AS tracking_guid  
    , USER_ID AS user_guid 
FROM {{ source('postgres_sources', 'orders') }}
