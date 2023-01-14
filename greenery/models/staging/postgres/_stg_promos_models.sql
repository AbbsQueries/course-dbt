
{{ config(
    materialized="view") }}
SELECT 
    promo_ID AS promo_guid, 
    discount,
    status
FROM {{ source('postgres_sources', 'promos') }}
