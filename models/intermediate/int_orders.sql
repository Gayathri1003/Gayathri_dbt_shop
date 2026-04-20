select
    o.order_id,
    o.customer_id,
    c.customer_name,
    p.payment_method,
    p.amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id