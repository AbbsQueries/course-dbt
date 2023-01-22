{{ config(
    materialized="view") }}

with user_order_facts as (
    SELECT  
        user_guid,
        email,
        address,zipcode,country,state
        ,count (distinct order_guid) AS total_order_count
        ,min(order_created_at_utc) AS first_order_made
        ,max(order_created_at_utc) AS last_order_made
        ,sum(order_total) AS total_order_spend
FROM {{ ref('_facts_orders') }} 
GROUP BY user_guid,email,address,zipcode,country,state)
SELECT* FROM user_order_facts