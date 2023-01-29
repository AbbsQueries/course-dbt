{{ config(
    materialized="view") }}
SELECT 
    u.ADDRESS_guID AS address_guid
    ,u.CREATED_AT AS user_created_at_utc
    ,u.EMAIL
    ,u.FIRST_NAME
    ,u.LAST_NAME
    ,u.PHONE_NUMBER
    ,u.UPDATED_AT
    ,u.USER_guID AS user_guid
    ,a.address
    ,a.zipcode
    ,a.state
    ,a.country
FROM {{ ref('_stg_users_models') }} u
LEFT JOIN {{ ref('_stg_addresses_models') }} a using(address_guid) 
