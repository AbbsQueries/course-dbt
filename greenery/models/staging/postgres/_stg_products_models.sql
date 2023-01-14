
{{ config(
    materialized="view") }}
SELECT 
    PRODUCT_ID AS product_guid
    ,INVENTORY
    ,NAME
    ,PRICE
FROM {{ source('postgres_sources', 'products') }}
