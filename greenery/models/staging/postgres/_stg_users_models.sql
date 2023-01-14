
{{ config(
    materialized="view") }}
SELECT 
    ADDRESS_ID AS address_guid
    ,CREATED_AT
    ,EMAIL
    ,FIRST_NAME
    ,LAST_NAME
    ,PHONE_NUMBER
    ,UPDATED_AT
    ,USER_ID AS user_guid
FROM {{ source('postgres_sources', 'users') }}
