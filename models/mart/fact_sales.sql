select
    order_id,
    customer_id,
    sum(quantity * price) as order_value
from {{ ref('stg_order_items') }}
group by order_id, customer_id