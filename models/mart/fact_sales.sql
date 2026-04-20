select
    o.order_id,
    o.customer_id,
    oi.order_value
from {{ ref('stg_orders') }} o
join (

    select
        order_id,
        sum(quantity * price) as order_value
    from {{ ref('stg_order_items') }}
    group by order_id

) oi
on o.order_id = oi.order_id