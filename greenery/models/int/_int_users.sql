{{ config(
    materialized="view") }}
SELECT 
    u.ADDRESS_ID AS address_guid
    ,u.CREATED_AT AS user_created_at_utc
    ,u.EMAIL
    ,u.FIRST_NAME
    ,u.LAST_NAME
    ,u.PHONE_NUMBER
    ,u.UPDATED_AT
    ,u.USER_ID AS user_guid
    ,a.address
    ,a.zipcode
    ,a.state
    ,a.country
FROM {{ source('postgres_sources', 'users') }} u
LEFT JOIN {{ source('postgres_sources', 'addresses') }} a using(address_id) 
