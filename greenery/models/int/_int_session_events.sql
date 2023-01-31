

with events as (
    select *
    from {{ ref('_stg_events_models')}}
)
, session_dates as (
    select 
         session_guid
        , min(event_timestamp_utc) AS session_started_ts_utc
        , max(event_timestamp_utc) AS session_ended_ts_utc
    from events
    group by 1
)

select
    session_guid
    , session_started_ts_utc
    , session_ended_ts_utc
from session_dates