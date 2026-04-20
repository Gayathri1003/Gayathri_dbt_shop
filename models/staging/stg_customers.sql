select
    cust_id as customer_id,
    customer_name,
    email,
    country,
    signup_date
from {{ source('src_shop','customers') }}