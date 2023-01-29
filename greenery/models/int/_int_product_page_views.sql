{{
  config(
    materialized='view'
  )
}}
  select 
    product_guid
    ,page_url
   ,event_timestamp_utc
   ,event_type
   ,session_guid
   ,user_guid
from  {{ ref ('_stg_events_models') }} 
WHERE event_type='page_view'