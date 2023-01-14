
{{ config(
    materialized="view") }}
SELECT 
    quantity,
   product_id AS product_guid,
    order_id AS order_guid   
FROM {{ source('postgres_sources', 'order_items') }}
