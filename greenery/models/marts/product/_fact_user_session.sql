{% set event_types = dbt_utils.get_column_values(table=ref('_stg_events_models'), column='event_type') %}

/* We use dbt utils.get column value to transpose rows from event type into columns */
/**/
with events as (
    select *
    from {{ ref('_stg_events_models')}}
)
/* grabbing all event model contacts*/
, order_products as (
    select *
    from {{ ref('_int_product_inventory')}}
)
/* grabbing all the product invetory columns such as price and quanity*/
, session_dates as (
    select *
    from {{ ref('_int_session_events') }}
)
/* calculates the end and begin of sessions */
, user_product_sessions as (
    select 
        e.session_guid
        , e.user_guid
        /* lets grab every session and its respective user*/
        , coalesce(e.product_guid, op.product_guid) as product_guid
        /* the product id will be from an order made list the product purchase or an event table where the product was viewed */
        {% for event_type in event_types %}
        /* for every event type, we are going to run a for-loop to make columns for each 
        event type and their respective sums during each session*/
        , {{ sum_of('e.event_type', event_type) }} as {{ event_type }}
        {% endfor %}
    from events e
    left join order_products op
/* join the events and product table by order_guid when an order was acutually completed */
        on op.order_guid = e.order_guid
    group by 1, 2, 3
)

select
    s.session_guid
    , s.user_guid
    , s.product_guid
    , d.session_started_ts_utc
    , d.session_ended_ts_utc
    , s.page_view
    , s.add_to_cart
    , s.checkout
    , s.package_shipped
from user_product_sessions s
left join session_dates d on
    d.session_guid = s.session_guid

/* for each user session, we need the product_guid that was viewed 
and the event_type counts per product_guid during any particular user session */
/* Solution Guided from oleg-agapov */