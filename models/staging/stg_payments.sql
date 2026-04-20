select
    payment_id,
    order_id,
    payment_method,
    amount,
    payment_status
from {{ source('src_shop','payments') }}