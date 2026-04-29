select
    c.customer_id,
    c.customer_name,
    c.country,
    cc.country_name
from {{ ref('stg_customers') }} c
left join {{ ref('country_codes') }} cc
    on c.country = cc.country