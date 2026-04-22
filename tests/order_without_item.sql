select o.order_id
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id
where oi.order_id is null