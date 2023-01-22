
{{ config(
    materialized="view") }}
SELECT 
    address_id AS address_guid ,
    address, 
    zipcode, 
    state, 
    country
FROM {{ source('postgres_sources', 'addresses') }}
