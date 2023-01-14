
{{ config(
    materialized="view") }}
SELECT 
    address_id AS address_guid 
FROM {{ source('postgres_sources', 'addresses') }}
