{% snapshot product_inventory_snapshot %}

  {{
    config(
      target_schema='snapshots',
      strategy='check',
      unique_key='order_guid',
      check_cols=['status'],
    )
  }}

  SELECT * FROM {{ ref('_int_product_inventory') }}

{% endsnapshot %}