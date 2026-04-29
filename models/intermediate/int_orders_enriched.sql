{{
    config(
        materialized='view'
    )
}}

select
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.order_date,
    p.payment_method,
    sum(p.amount) as total_payment_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id
group by
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.order_date,
    p.payment_method