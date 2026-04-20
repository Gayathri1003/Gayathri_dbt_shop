select
    order_item_id,
    order_id,
    product_id,
    quantity,
    price
from {{ source('src_shop','order_items') }}