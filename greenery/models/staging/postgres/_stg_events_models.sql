
{{ config(
    materialized="view") }}
SELECT 
    event_id AS events_guid,
    session_id AS session_guid,
    user_id AS user_guid,
    event_type,
    page_url,
    created_at,
    order_id AS order_guid,
    product_id AS product_guid 
FROM {{ source('postgres_sources', 'events') }}
