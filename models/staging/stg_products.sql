select
    prod_id as product_id,
    product_name,
    category,
    price
from {{ source('src_shop','products') }}