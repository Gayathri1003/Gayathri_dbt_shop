select 
    cust_id,
    customer_name 
from {{ ref('ephemeral_file') }} c
join {{ ref('stg_orders') }} o
    on o.customer_id = c.cust_id
