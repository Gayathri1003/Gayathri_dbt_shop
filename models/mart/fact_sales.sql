select
    o.order_id,
    o.customer_id,
    o.customer_name,
    o.order_date,
    o.payment_method,

    sum({{ calculate_revenue('oi.quantity','oi.price') }}) as order_value,
    sum(oi.quantity) as total_items,
    o.total_payment_amount,

    case
        when sum({{ calculate_revenue('oi.quantity','oi.price') }}) > 1000 then 'High Value'
        when sum({{ calculate_revenue('oi.quantity','oi.price') }}) > 500 then 'Medium Value'
        else 'Low Value'
    end as order_segment

from {{ ref('int_orders_enriched') }} o
join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

group by
    o.order_id,
    o.customer_id,
    o.customer_name,
    o.order_date,
    o.payment_method,
    o.total_payment_amount