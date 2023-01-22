{{ config(
    materialized="view") }}
SELECT  
     address_guid
    ,user_created_at_utc
    ,EMAIL
    ,FIRST_NAME
    ,LAST_NAME
    ,PHONE_NUMBER
    ,UPDATED_AT
    ,user_guid
    ,address
    ,zipcode
    ,state
    ,country
FROM {{ ref('_int_users') }} 