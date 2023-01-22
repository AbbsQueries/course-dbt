{{ config(
    materialized="view") }}
SELECT  
    product_guid
   ,INVENTORY as current_product_inventory
   ,NAME as product_name
   ,PRICE as product_price
   ,quantity as product_quantity
   ,order_guid  
FROM {{ ref('_int_product_inventory') }} 