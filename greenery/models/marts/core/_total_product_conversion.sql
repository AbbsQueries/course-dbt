{{ config(
    materialized="view") }}
SELECT  
SUM(session_count) AS total_session_count,
SUM(order_count) AS total_order_count,
SUM(order_count) / SUM(session_count) AS total_product_conversion
FROM {{ ref('_int_product_conversion') }} 