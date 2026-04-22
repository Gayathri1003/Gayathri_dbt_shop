{% snapshot customer_snapshot %}

{{
config(
target_schema='snapshots',
unique_key='customer_id',
strategy='timestamp',
updated_at='signup_date'
)
}}

select *
from {{ ref('stg_customers') }}

{% endsnapshot %}